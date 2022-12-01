<?php

namespace App\Models\Hooks\Api;
use App\Models\{Notification,User,Post,Comment,NotificationSetting,Follower};
use Illuminate\Support\Facades\Storage;

use Carbon\Carbon;

class CommentHook
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
        // print_r('asdf'); die;
        $storageUrl = Storage::url('/');
        $base_url = substr($storageUrl,0,-1);
    
        $default_image = \URL::to('images/default-user-placeholder.jpg');

            $query->with(['child'=>function($query) use ($request,$base_url,$default_image)  {
                    $query->select('user_comments.*')
                    // ->selectRaw("IF(ul.id IS NOT NULL,1,0) AS is_user_like, IFNULL(ul.id,0) as user_like_id")
                    ->selectRaw("users.name AS username, users.name, users.username AS user_slug, users.driver AS user_driver, users.image_url AS user_image_url, 
                                IF(ul.id IS NOT NULL,1,0) AS is_user_like, IFNULL(ul.id,0) as user_like_id")
                    ->join('users','users.id','=','user_comments.user_id')
                    ->leftJoin('user_like AS ul',function($leftJoin) use ($request){
                        $leftJoin->on('ul.module_id','=','user_comments.id')
                            ->where('ul.module','=','user_comments')
                            ->where('ul.user_id','=',$request['user']->id);
                    })
                    ->selectRaw("IF(udl.id IS NOT NULL,1,0) AS is_user_dislike, 
                                udl.id AS user_dislike_id")
                                ->leftJoin('dislikes AS udl',function($leftJoin) use ($request){
                                    $leftJoin->on('udl.module_id','=','user_comments.id')
                                            ->where('udl.module','=','user_comments')
                                            ->where('udl.user_id','=',$request['user']->id);
                                });
                }])
            ->select('user_comments.*')
            ->selectRaw("u.name AS username, u.name, u.username AS user_slug,u.driver, u.image_url,
              IF(ul.id IS NOT NULL,1,0) AS is_user_like, IFNULL(ul.id,0) as user_like_id")
            ->join('users AS u','u.id','=','user_comments.user_id')
            ->leftJoin('user_like AS ul',function($leftJoin) use ($request) {
                $leftJoin->on('ul.module_id','=','user_comments.id')
                    ->where('ul.module','=','user_comments')
                    ->where('ul.user_id','=',$request['user']->id);
            })
            ->selectRaw("IF(udl.id IS NOT NULL,1,0) AS is_user_dislike, 
            udl.id AS user_dislike_id")
            ->leftJoin('dislikes AS udl',function($leftJoin) use ($request){
                $leftJoin->on('udl.module_id','=','user_comments.id')
                        ->where('udl.module','=','user_comments')
                        ->where('udl.user_id','=',$request['user']->id);
            })  
            ->where('user_comments.module',$request['module'])
            ->where('user_comments.module_id',$request['module_id'])
            ->where('u.status',1)
            ->orderBy('user_comments.id','asc'); 

        if( !$request->isMethod('post') ){
            $query->where('user_comments.parent_id',0);
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
        $postdata['user_id']     = $postdata['user']->id;
        $postdata['slug'] = uniqid().$postdata['user_id'].uniqid();
        $postdata['created_at']  = Carbon::now();

        if( $request->module == 'user_comments' ){
            $postdata['parent_id']   = $postdata['module_id'];
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
        $params = $request->all();
        if( $record->module == 'posts' ){
            \DB::table('posts')->where('id',$record->module_id)->increment('total_comment',1);
        }

        if( $record->module == 'user_comments' ){
            \DB::table('user_comments')->where('id',$record->module_id)->increment('reply_count',1);
        }

                  //////comment notification///
            
            if($record->module == 'user_comments' ){
                $getComment = Comment::find($record->module_id);
                $targetUsers = User::getUserApiTokenByID($getComment->user_id);
                $userBadge   = Notification::getBadge($getComment->user_id);
                    if (count($targetUsers) > 0) {
                        if ($params['user']->id != $getComment->user_id) {
                            $getNotificationSetting = NotificationSetting::getSetting($getComment->user_id); 
                            $getRequestCount = Follower::getRequestCount($targetUsers[0]->id);
                            if ($getNotificationSetting['Comments'] == 1) {
                                $notification_data = [
                                    'actor'            => $params['user'],
                                    'actor_type'      => 'users',
                                    'target'           => $targetUsers,
                                    'target_type'      => 'users',
                                    'title'            => env('APP_NAME'),
                                    'message'          => "".$request['user']->name." reply on your comment",
                                    'reference_id'     => $getComment->module_id,
                                    'reference_module' => 'user_comment',
                                    'redirect_link'    => NULL,
                                    'badge'            => $userBadge
                                ];
                                $custom_data = [
                                    'record_id'     => $getComment->module_id,
                                    'redirect_link' => NULL,
                                    'identifier'    => 'user_comment',
                                    'request_count' => $getRequestCount,
                                ];
                                Notification::sendPushNotification('user_comment',$notification_data,$custom_data,$targetUsers[0]->device_type);
                            }    
                        }
                    }
            }else{
                $getPost = Post::find($record->module_id);
                $targetUsers = User::getUserApiTokenByID($getPost->user_id);
                $userBadge   = Notification::getBadge($getPost->user_id);
                if (count($targetUsers) > 0) {
                    if ($params['user']->id != $targetUsers[0]->id) {
                        $getRequestCount = Follower::getRequestCount($targetUsers[0]->id);

                            $getNotificationSetting = NotificationSetting::getSetting($targetUsers[0]->id); 
                            if ($getNotificationSetting['Comments'] == 1) {
                                $notification_data = [
                                    'actor'            => $params['user'],
                                    'actor_type'      => 'users',
                                    'target'           => $targetUsers,
                                    'target_type'      => 'users',
                                    'title'            => env('APP_NAME'),
                                    'message'          => "".$request['user']->name." commented on your post",
                                    'reference_id'     => $record->module_id,
                                    'reference_module' => 'post_comment',
                                    'redirect_link'    => NULL,
                                    'badge'            => $userBadge
                                ];
                                $custom_data = [
                                    'record_id'     => $record->module_id,
                                    'redirect_link' => NULL,
                                    'identifier'    => 'post_comment',
                                    'request_count' => $getRequestCount,

                                ];
                                Notification::sendPushNotification('post_comment',$notification_data,$custom_data,$targetUsers[0]->device_type);
                            }    
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
        return 'CommentHook' . md5(implode('',$cache_params));
    }
}
