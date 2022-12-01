<?php

namespace App\Models\Hooks\Api;

use App\Helpers\CustomHelper;
use App\Models\{UserApiToken,NotificationSetting};
use Carbon\Carbon;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Hash;
use Illuminate\Support\Str;

class UserHook
{
    private $_model,
            $except_update_params = [
                // 'username',
                'slug',
                'email',
                //'mobile_no',
                'password',
                'status',
                'is_email_verify',
                'is_mobile_verify',
                'mobile_otp',
                'email_otp',
                'remember_token',
            ];

    public function __construct($model)
    {
        $this->_model = $model;
    }

    public function getBlockUserIds($user_id)
    {
        $query = \DB::table('user_block')
            ->selectRaw("GROUP_CONCAT(IF( actor_id = {$user_id}, target_id, actor_id )) AS block_user_id")
            ->whereRaw("(actor_id = {$user_id} OR target_id = {$user_id})")
            ->first();
        return $query;
    }

    /*
   | ----------------------------------------------------------------------
   | Hook for manipulate query of index result
   | ----------------------------------------------------------------------
   | @query   = current sql query
   | @request = laravel http request class
   |
   */
    public function hook_query_index(&$query,$request, $slug='') {
        $getBlockUserIds = $this->getBlockUserIds($request['user']->id);

        $user_id = $request['user']->id;
        $query->select('users.*');
        $query->with('musicGenre');
        $query->with('artistType');
        $query->with('userNotificationSetting');
        //check same user
        if( $request['user']->slug == $slug ){
            $query->selectRaw('api_token,device_type,device_token,platform_type,platform_id')
                ->join('user_api_token AS uat','uat.user_id','=','users.id')
                ->where('uat.api_token',$request['api_token']);
        }
        if( empty($request['list_type'])){
            $query->selectRaw("
                IF( uf.id IS NULL,0,
                    IF( uf.actor_id = {$user_id} AND uf.status = '0',2,uf.status  )
                ) AS is_follow,
                     IFNULL(uf.id,0) AS user_follow_id");
            $query->leftJoin('followers AS uf',function($leftJoin) use ($request){
                $leftJoin->on('uf.target_id','=','users.id')
                    ->where('uf.actor_id','=',$request['user']->id);
            });
        }

        if( $slug == '' ){
            if(!empty($request['user_id'])){
                $query->where('users.id',$request['user_id']);
            }else{
                $query->where('users.id','!=',$request['user']->id);
            }
        }

        if(isset($request->user_type) && !empty($request->user_type)){
            $query->where('users.user_type','=',$request->user_type);
        }
        if(isset($request['keyword']) && !empty($request['keyword']) ){
            $keyword = $request['keyword'];
            $query->where( function($where) use ($keyword) {
                $where->orWhere('users.name','like',"%$keyword%");
                $where->orWhere('users.username','like',"%$keyword%");
                $where->orWhere('users.email','like',"%$keyword%");
            });
        }
        if($request['screen_name'] == "search" && empty($request['keyword'])){
            $query->where('users.id','=','0');
        }

        if( isset($getBlockUserIds->block_user_id)  && !empty($getBlockUserIds->block_user_id) ){
            $query->whereNotIn('users.id',explode(',',$getBlockUserIds->block_user_id));
        }

    }


    /*
    | ----------------------------------------------------------------------
    | Hook for manipulate data input before add data is execute
    | ----------------------------------------------------------------------
    | @arr
    |
    */
    public function hook_before_add($request,&$postdata)
    {
        //delete un-verified account
        if( env('VERIFICATION_TYPE') != 'none'){
            if( env('VERIFICATION_TYPE') == 'email'){
                $this->_model::where('email',$postdata['email'])->forceDelete();
            }
            if( env('VERIFICATION_TYPE') == 'mobile'){
                $this->_model::where('mobile_no',$postdata['mobile_no'])->forceDelete();
            }
        }

        //set data
        $postdata['user_group_id'] = 1;
        //$postdata['username']   = $this->_model::generateUniqueUserName($postdata['name']);
        $postdata['slug']       = $postdata['username'];
        $postdata['password']   = Hash::make($postdata['password']);
        $postdata['created_at'] = Carbon::now();
    }

    /*
    | ----------------------------------------------------------------------
    | Hook for execute command after add public static function called
    | ----------------------------------------------------------------------
    | @record
    |
    */
    public function hook_after_add($request,$record)
    {
        $api_token  = UserApiToken::generateApiToken($record->id,$request->ip(),$request->header('token'),$record->created_at);
        $request['api_token'] = $api_token;
        $request['user']      = $record;

        //update notification setting
        $params['notification_setting']['Reactions'] = 1;
        $params['notification_setting']['Comments'] = 1;
        $params['notification_setting']['Tags'] = 1;
        $params['notification_setting']['Follow_Requests'] = 1;
        if ($request['user']->user_type == "artist") {
            $params['notification_setting']['Received_Tokens'] = 1;
            $params['notification_setting']['Messages'] = 1;
        }
        $params['user_id'] = $request['user']->id;
        NotificationSetting::storeNewUserSetting($params);

        //insert api token
        \DB::table('user_api_token')
            ->insert([
                'user_id'       => $record->id,
                'api_token'     => $api_token,
                'refresh_token' => UserApiToken::generateRefreshToken($record->id),
                'udid'          => $request->header('token'),
                'device_type'   => $request['device_type'],
                'device_token'  => $request['device_token'],
                'platform_type' => !empty($request['platform_type']) ? $request['platform_type'] : 'custom',
                'platform_id'   => !empty($request['platform_id']) ? $request['platform_id'] : NULL,
                'ip_address'    => $request->ip(),
                'user_agent'    => $request->server('HTTP_USER_AGENT'),
                'created_at'    => Carbon::now()
            ]);
        //send verification email
        if( env('VERIFICATION_TYPE') == 'email' ){
            $mail_params['USERNAME'] = $record->name;
            $mail_params['LINK']     = route('verifyEmail',['name' => encrypt($record->email)]);
            $mail_params['YEAR']     = date('Y');
            $mail_params['APP_NAME'] = env('APP_NAME');
            CustomHelper::sendMail($record->email,'user_registration',$mail_params);
        }

    }

    /*
    | ----------------------------------------------------------------------
    | Hook for manipulate data input before update data is execute
    | ----------------------------------------------------------------------
    | @request  = http request object
    | @postdata = input post data
    | @id       = current id
    |
    */
    public function hook_before_edit($request, $slug, &$postData)
    {

        $postData['driver'] = env('FILESYSTEM_DRIVER');

        foreach( $postData as $key => $value ){
            if( in_array($key,$this->except_update_params) )
                unset($postData[$key]);
        }
        if( !empty($postData['image_url']) ){
            $postData['image_url'] = CustomHelper::uploadMedia('users',$postData['image_url']);
        } 
    }

    /*
    | ----------------------------------------------------------------------
    | Hook for execute command after edit public static function called
    | ----------------------------------------------------------------------
    | @request  = Http request object
    | @$slug    = $slug
    |
    */
    public function hook_after_edit($request, $slug) {
        //Your code here
    }

    /*
    | ----------------------------------------------------------------------
    | Hook for execute command before delete public static function called
    | ----------------------------------------------------------------------
    | @request  = Http request object
    | @$id      = record id = int / array
    |
    */
    public function hook_before_delete($request, $slug) {
        //Your code here

    }

    /*
    | ----------------------------------------------------------------------
    | Hook for execute command after delete public static function called
    | ----------------------------------------------------------------------
    | @$request       = Http request object
    | @records        = deleted records
    |
    */
    public function hook_after_delete($request,$records) {
        //Your code here

    }

    public function create_cache_signature($request)
    {
        $cache_params = $request->isMethod('post') ? [] : $request->except(['user','api_token']);
        return 'users_api_' . md5(implode('',$cache_params));
    }
}
