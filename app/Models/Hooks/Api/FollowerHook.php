<?php

namespace App\Models\Hooks\Api;

use App\Models\User;
use App\Models\{UserBlock,Notification,NotificationSetting,Follower};

class FollowerHook
{
    private $_model;

    public function __construct($model)
    {
        $this->_model = $model;
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
        $getBlockUserIds = UserBlock::getBlockUserIds($request['user']->id);
        $query->with('target');
        $query->with('actor'); 
        if(isset($request['list_type'] ) && !empty($request['list_type'] )){
            $query->select('u.*');
            if( $request['list_type'] == 'followers' ){
                $query->selectRaw("IF( uf.status IS NOT NULL,
                                      IF(uf.status = 1,1,2),
                                      0) AS is_follow, IFNULL(uf.id,0) AS followers_id");
                $query->join('users AS u','u.id','=','followers.actor_id');
                $query->leftJoin('followers AS uf',function($leftJoin) use ($request){
                        $leftJoin->on('uf.target_id','=','u.id')
                        ->where('uf.actor_id','=',$request['user']->id);
                });
                if (!empty($request['user_id'])) {
                    $query->where('followers.target_id',$request['user_id']);
                }else{
                    $query->where('followers.target_id',$request['user']->id);
                }
            }

            if( $request['list_type'] == 'following' ){
                // $query->selectRaw('followers.id AS followers, 1 AS is_follow');
                $query->selectRaw("IF( followers.id IS NULL,0,
                IF( followers.actor_id = {$request['user']->id} AND followers.status = '0',2,followers.status  )
            ) AS is_follow,
                 IFNULL(followers.id,0) AS user_follow_id");
                $query->join('users AS u','u.id','=','followers.target_id');
                if (!empty($request['user_id'])) {
                    $query->where('followers.actor_id',$request['user_id']);
                }else{
                    $query->where('followers.actor_id',$request['user']->id);
                }

            }

            if( $request['list_type'] == 'all'  ){
                $query->selectRaw("IF( uf.status IS NOT NULL,
                                      IF(uf.status = 1,1,0),
                                      0) AS is_follow, IFNULL(uf.id,0) AS user_follow_id");
                $query->join('users AS u',function($join) use ($request){
                    $join->on('u.id','=',\DB::raw("IF (followers.actor_id =".$request['user']->id.",followers.target_id,followers.actor_id)"))
                        ->where(function($where) use ($request) {
                            $where->orWhere('followers.actor_id', $request['user']->id)
                                ->orWhere('followers.target_id', $request['user']->id);
                        });
                });
                $query->leftJoin('followers AS uf',function($leftJoin) use ($request){
                    $leftJoin->on('uf.target_id','=','u.id')
                        ->where('uf.actor_id','=',$request['user']->id);
                });
                $query->groupBy("u.id");
            }
            $query->where('u.status',1);
            if( !empty($request['keyword']) ){
                $keyword = $request['keyword'];
                $query->where( function($where) use ($keyword) {
                    $where->orWhere('u.name','like',"%$keyword%");
                    $where->orWhere('u.email','like',"%$keyword%");
                });
            }

            if ($slug == "") {
                $query->where('followers.status',1);
            }
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
        $getUser = User::find($postdata['target_id']);
        $postdata['slug'] = $postdata['actor_id'].time();
        if ($getUser->is_public == 1) {
            $postdata['status'] = '1';
            User::where('id',$postdata['actor_id'])->increment('no_of_following',1);
            //update following count
            User::where('id',$postdata['target_id'])->increment('no_of_followers',1);
        }else{
            $postdata['status'] = '0';
        }

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
       $getUser = User::find($record['target_id']);
        if ($getUser->is_public == 1) {
            $targetUsers = User::getUserApiTokenByID($record['target_id']);
            $userBadge   = Notification::getBadge($record['target_id']);
            if (count($targetUsers) > 0) {
                $getNotificationSetting = NotificationSetting::getSetting($targetUsers[0]->id);
                if ($getNotificationSetting['Follow_Requests'] == 1) {
                    $getRequestCount = Follower::getRequestCount($targetUsers[0]->id);

                    $notification_data = [
                        'actor'            => $request['user'],
                        'actor_type'      => 'users',
                        'target'           => $targetUsers,
                        'target_type'      => 'users',
                        'title'            => env('APP_NAME'),
                        'message'          => "".$request['user']->name." started following you",
                        'reference_id'     => $record->id,
                        'reference_module' => 'followers',
                        'redirect_link'    => NULL,
                        'badge'            => $userBadge
                    ];
                    $custom_data = [
                        'record_id'     => $record->id,
                        'redirect_link' => NULL,
                        'identifier'    => 'followers',
                        'request_count' => $getRequestCount,

                    ];
                    Notification::sendPushNotification('followers',$notification_data,$custom_data,$targetUsers[0]->device_type);
                }
            }
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
        $cache_params = $request->except(['user','api_token']);
        return 'FollowerHook' . md5(implode('',$cache_params));
    }
}
