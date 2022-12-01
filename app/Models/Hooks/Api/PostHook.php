<?php

namespace App\Models\Hooks\Api;

use App\Helpers\CustomHelper;
use App\Libraries\Helper;
use App\Models\{PostTagUser,User,Follower,Post,Notification,NotificationSetting};
use Carbon\Carbon;
class PostHook
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

    public function getBlockUserIds($user_id)
    {
        $query = \DB::table('user_block')
            ->selectRaw("GROUP_CONCAT(IF( actor_id = {$user_id}, target_id, actor_id )) AS block_user_id")
            ->whereRaw("(actor_id = {$user_id} OR target_id = {$user_id})")
            ->first();
        return $query;
    }

    public function GetForyouPost()
    {
        $query = \DB::table('promotions')->select('post_id')->where('promotion_status','50_coins')->get();
        return $query;
    }

    public function GetMostLikePost()
    {
        $query = \DB::table('user_like')->selectRaw('user_like.id,user_like.module_id AS post_id, COUNT(user_like.module_id) AS total_count')
                    ->join('posts','posts.id','=','user_like.module_id')
                    ->where('posts.deleted_at',null)
                    ->where('user_like.module','posts')
                    ->groupBy('post_id')
                    ->orderby('total_count','desc')
                    ->get();
        return $query;
    }

    public function hook_query_index(&$query,$request, $slug='')
    {

        if (!empty($request['check_post_type']) && $request['check_post_type'] == 'like_user_post') {
                $getBlockUserIds = $this->getBlockUserIds($request['user']->id);
                $query->select('posts.*')->with(['users','post_tagusers','userCoinSupport']);
                $query->join('users AS post_user','post_user.id','=','posts.user_id');
                $query->selectRaw("IF(ul.id IS NOT NULL,1,0) AS is_user_like,
                            ul.id AS user_like_id, ul.user_id AS like_user_id")
                        ->join('users AS u','u.id','=','posts.user_id')
                        ->leftJoin('user_like AS ul',function($leftJoin) use ($request){
                        $leftJoin->on('ul.module_id','=','posts.id')
                            ->where('ul.module','=','posts')
                            ->where('ul.user_id','=',$request['user']->id);
                        })
                        ->selectRaw("IF(udl.id IS NOT NULL,1,0) AS is_user_dislike,
                            udl.id AS user_dislike_id")
                            ->leftJoin('dislikes AS udl',function($leftJoin) use ($request){
                                $leftJoin->on('udl.module_id','=','posts.id')
                                        ->where('udl.module','=','posts')
                                        ->where('udl.user_id','=',$request['user']->id);
                            });
                    if( isset($getBlockUserIds->block_user_id)  && !empty($getBlockUserIds->block_user_id) ){
                        $query->whereNotIn('posts.user_id',explode(',',$getBlockUserIds->block_user_id));
                    }

                    $query->join('user_like','user_like.module_id','posts.id')
                          ->where('user_like.user_id',$request['user_id']);

                    $query->whereNull('posts.deleted_at');
                    $query->whereNull('post_user.deleted_at');

        }else if(!empty($request['check_post_type']) && $request['check_post_type'] == 'foryou' || $request['check_post_type'] == 'most_like'){
            $getBlockUserIds = $this->getBlockUserIds($request['user']->id);
            $query->select('posts.*')->with(['users','post_tagusers','userCoinSupport']);
            $query->join('users AS post_user','post_user.id','=','posts.user_id');
            $query->selectRaw("IF(ul.id IS NOT NULL,1,0) AS is_user_like,
                        ul.id AS user_like_id, ul.user_id AS like_user_id")
                    ->join('users AS u','u.id','=','posts.user_id')
                    ->leftJoin('user_like AS ul',function($leftJoin) use ($request){
                    $leftJoin->on('ul.module_id','=','posts.id')
                        ->where('ul.module','=','posts')
                        ->where('ul.user_id','=',$request['user']->id);
                    })
                    ->selectRaw("IF(udl.id IS NOT NULL,1,0) AS is_user_dislike,
                        udl.id AS user_dislike_id")
                        ->leftJoin('dislikes AS udl',function($leftJoin) use ($request){
                            $leftJoin->on('udl.module_id','=','posts.id')
                                    ->where('udl.module','=','posts')
                                    ->where('udl.user_id','=',$request['user']->id);
                        });
                if( isset($getBlockUserIds->block_user_id)  && !empty($getBlockUserIds->block_user_id) ){
                    $query->whereNotIn('posts.user_id',explode(',',$getBlockUserIds->block_user_id));
                }

                if ($request['check_post_type'] == 'foryou') {
                    $GetPostIds = $this->GetForyouPost();
                }else{
                    $GetPostIds = $this->GetMostLikePost();
                }
                $GetPostId = [];
                for ($i=0; $i < count($GetPostIds); $i++) {
                    array_push($GetPostId,$GetPostIds[$i]->post_id);
                }

                $query->whereIn('posts.id',$GetPostId);
                $query->where('posts.post_type','!=','support');
                $query->whereNull('posts.deleted_at');
                $query->whereNull('post_user.deleted_at');

        }else if(!empty($request['check_post_type']) && $request['check_post_type'] == 'genre'){
            $getBlockUserIds = $this->getBlockUserIds($request['user']->id);
                $query->select('posts.*')->with(['post_tagusers','userCoinSupport']);
                $query->join('promotions AS pro','posts.id','=','pro.post_id');
                $query->join('users AS post_user','post_user.id','=','posts.user_id');
                $query->selectRaw("IF(ul.id IS NOT NULL,1,0) AS is_user_like,
                            ul.id AS user_like_id, ul.user_id AS like_user_id")
                        ->join('users AS u','u.id','=','posts.user_id')
                        ->leftJoin('user_like AS ul',function($leftJoin) use ($request){
                        $leftJoin->on('ul.module_id','=','posts.id')
                            ->where('ul.module','=','posts')
                            ->where('ul.user_id','=',$request['user']->id);
                        })
                        ->selectRaw("IF(udl.id IS NOT NULL,1,0) AS is_user_dislike,
                            udl.id AS user_dislike_id")
                            ->leftJoin('dislikes AS udl',function($leftJoin) use ($request){
                                $leftJoin->on('udl.module_id','=','posts.id')
                                        ->where('udl.module','=','posts')
                                        ->where('udl.user_id','=',$request['user']->id);
                            });

                $query->with('users');
                //get user own post
                if(!$request->isMethod('post') && !empty($request['user_id']) ){
                    $query->where('posts.user_id',$request['user_id']);
                } else {
                    //except block user post
                    if( isset($getBlockUserIds->block_user_id)  && !empty($getBlockUserIds->block_user_id) ){
                        $query->whereNotIn('posts.user_id',explode(',',$getBlockUserIds->block_user_id));
                    }
                    if( !empty($report_ids) ){
                        //$query->whereNotIn('posts.id',$report_ids);
                    }
                }

                // if ( empty( $request['user_id'] ) ) {
                //     $followers = Follower::getFollowers($request->user->id);
                //     $followers_array_ids = array();
                //     if($followers){
                //         foreach ($followers as $followersItem){
                //             $followers_array_ids[] = $followersItem->target_id;
                //         }
                //     }
                //     $followers_array_ids[]  = $request->user->id;
                //     if( $request['media_type'] == 'audio' || $request['media_type'] == 'video' ){
                //         $query->where(function($where) use ($followers_array_ids){
                //             $where->orWhereIn('posts.user_id', $followers_array_ids);
                //             $where->orWhere('u.is_public','1');
                //         });
                //     } else {
                //         $query->whereIn('posts.user_id', $followers_array_ids);
                //     }
                // }

                if(isset($request['keyword']) && !empty($request['keyword']) ){
                    $keyword = $request['keyword'];
                    $query->where( function($where) use ($keyword) {
                        $where->orWhere('posts.title','like',"%$keyword%");
                    });
                }

                if (!empty($request['music_genres_id'])) {
                    $query->whereIn('pro.music_genres_id',$request['music_genres_id']);
                }
                $query->where('pro.promotion_status','125_coins');
                $query->groupBy('posts.id');
                // $query->where('posts.created_at',Carbon::now());
                $query->whereNull('posts.deleted_at');
                $query->whereNull('post_user.deleted_at');



        }else{
            $checkFriend = Follower::friendExist($request['user_id'],$request['user']->id);
            if( !$checkFriend && !empty($request['user_id'])){
                if ($request['user']->id != $request['user_id']) {
                    $query->where('posts.id',0);
                }
                if ($request['user']->id == $request['user_id']) {
                    $query->where('posts.user_id',$request['user_id']);
                }
            } else {
                $getBlockUserIds = $this->getBlockUserIds($request['user']->id);
                $query->select('posts.*')->with(['post_tagusers','userCoinSupport']);
                $query->join('users AS post_user','post_user.id','=','posts.user_id');
                $query->selectRaw("IF(ul.id IS NOT NULL,1,0) AS is_user_like,
                            ul.id AS user_like_id, ul.user_id AS like_user_id")
                        ->join('users AS u','u.id','=','posts.user_id')
                        ->leftJoin('user_like AS ul',function($leftJoin) use ($request){
                        $leftJoin->on('ul.module_id','=','posts.id')
                            ->where('ul.module','=','posts')
                            ->where('ul.user_id','=',$request['user']->id);
                        })
                        ->selectRaw("IF(udl.id IS NOT NULL,1,0) AS is_user_dislike,
                            udl.id AS user_dislike_id")
                            ->leftJoin('dislikes AS udl',function($leftJoin) use ($request){
                                $leftJoin->on('udl.module_id','=','posts.id')
                                        ->where('udl.module','=','posts')
                                        ->where('udl.user_id','=',$request['user']->id);
                            });

                $query->with('users');
                //get user own post
                if(!$request->isMethod('post') && !empty($request['user_id']) ){
                    $query->where('posts.user_id',$request['user_id']);
                } else {
                    //except block user post
                    if( isset($getBlockUserIds->block_user_id)  && !empty($getBlockUserIds->block_user_id) ){
                        $query->whereNotIn('posts.user_id',explode(',',$getBlockUserIds->block_user_id));
                    }
                    if( !empty($report_ids) ){
                        //$query->whereNotIn('posts.id',$report_ids);
                    }
                }

                if ( empty( $request['user_id'] ) ) {
                    $followers = Follower::getFollowers($request->user->id);
                    $followers_array_ids = array();
                    if($followers){
                        foreach ($followers as $followersItem){
                            $followers_array_ids[] = $followersItem->target_id;
                        }
                    }
                    $followers_array_ids[]  = $request->user->id;
                    if( $request['media_type'] == 'audio' || $request['media_type'] == 'video' ){
                        $query->where(function($where) use ($followers_array_ids){
                            $where->orWhereIn('posts.user_id', $followers_array_ids);
                            $where->orWhere('u.is_public','1');
                        });
                    } else {
                        $query->whereIn('posts.user_id', $followers_array_ids);
                    }
                }

                if( $request['media_type'] == 'audio' || $request['media_type'] == 'video' )
                    $query->where('posts.media_type', $request['media_type']);

                if(isset($request['keyword']) && !empty($request['keyword']) ){
                    $keyword = $request['keyword'];
                    $query->where( function($where) use ($keyword) {
                        $where->orWhere('posts.title','like',"%$keyword%");
                        $where->orWhere('posts.address','like',"%$keyword%");
                        $where->orWhere('post_user.name','like',"%$keyword%");
                    });
                }
                if($request['screen_name'] == "search" && empty($request['keyword'])){
                    $query->where('posts.id','=','0');
                }

                 if (!empty($request['check_post_type']) && !empty($request['tag_user_id'])) {
                        $query->join('post_tag_users AS ptu','ptu.post_id','=','posts.id')
                        ->where('ptu.user_id',$request['tag_user_id']);
                    }

                if (!empty($request['post_id'])) {
                    $query->where('posts.id',$request['post_id']);
                }

                $query->whereNull('posts.deleted_at');
                $query->whereNull('post_user.deleted_at');
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
        $postdata['user_id'] = $request['user']->id;
        $postdata['slug'] = $postdata['user_id'].time();
        $postdata['driver'] = env('FILESYSTEM_DRIVER');

        if( !empty($request['media_file']) ){
            $video            = \CustomHelper::uploadMedia('media-files',$postdata['media_file']);

            if($request['media_type'] == "video") {
                $video_thumb_name = rand() . time() . '.jpg';
                $thumb_path       = public_path('storage/media-files/' . $video_thumb_name );
                $getMetaData      = \CustomHelper::getVideoMetaData( $postdata['media_file']->getPathName(), $thumb_path);
                $postdata['media_thumbnail_url'] = $getMetaData['video_thumb_path'];
            }
            $postdata['media_file'] = $video;
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
        if(isset($request->tag_user_id) && count($request->tag_user_id) > 0){
            for ($i=0; $i<count($request->tag_user_id); $i++){
                $PostTagUser = new PostTagUser();
                $PostTagUser->post_id = $record->id;
                $PostTagUser->user_id = $request->tag_user_id[$i];
                $PostTagUser->save();

                //////like notification///
                $targetUsers = User::getUserApiTokenByID($request->tag_user_id[$i]);
                $userBadge   = Notification::getBadge($request->tag_user_id[$i]);
                if (count($targetUsers) > 0) {
                    if ($request['user']->id != $targetUsers[0]->id) {
                        $getNotificationSetting = NotificationSetting::getSetting($targetUsers[0]->id);
                        if ($getNotificationSetting['Tags'] == 1) {
                            $getRequestCount = Follower::getRequestCount($targetUsers[0]->id);

                            $notification_data = [
                                'actor'            => $request['user'],
                                'actor_type'      => 'users',
                                'target'           => $targetUsers,
                                'target_type'      => 'users',
                                'title'            => env('APP_NAME'),
                                'message'          => "".$request['user']->name." tagged you on his post.",
                                'reference_id'     => $record->id,
                                'reference_module' => 'post_tag',
                                'redirect_link'    => NULL,
                                'badge'            => $userBadge
                            ];
                            $custom_data = [
                                'record_id'     => $record->id,
                                'redirect_link' => NULL,
                                'identifier'    => 'post_tag',
                                'request_count' => $getRequestCount,

                            ];
                            Notification::sendPushNotification('post_tag',$notification_data,$custom_data,$targetUsers[0]->device_type);
                        }
                    }
                }
            }
        }
        User::where('id',$request['user']->id)->increment('total_post',1);
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

        if( !empty($request['media_file']) ){
            $video            = \CustomHelper::uploadMedia('media-files',$postData['media_file']);

            if($request['media_type'] == "video") {
                $video_thumb_name = rand() . time() . '.jpg';
                $thumb_path       = public_path('storage/media-files/' . $video_thumb_name );
                $getMetaData      = \CustomHelper::getVideoMetaData( $postData['media_file']->getPathName(), $thumb_path);
                $postData['media_thumbnail_url'] = $getMetaData['video_thumb_path'];
            }
            $postData['media_file'] = $video;
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
        $getpost = Post::where('slug',$slug)->first();
        $PostTagUserCount = PostTagUser::where('post_id',$getpost->id)->count();
        if ($PostTagUserCount > 0) {
            PostTagUser::where('post_id',$getpost->id)->forceDelete();
        }

        if(isset($request->tag_user_id) && count($request->tag_user_id) > 0){
            for ($i=0; $i<count($request->tag_user_id); $i++){
                $PostTagUser = new PostTagUser();
                $PostTagUser->post_id = $getpost->id;
                $PostTagUser->user_id = $request->tag_user_id[$i];
                $PostTagUser->save();
            }
        }
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
        User::where('id',$request['user']->id)->decrement('total_post',1);
    }

    public function create_cache_signature($request)
    {
        $cache_params = $request->except(['user','api_token']);
        return 'PostHook' . md5(implode('',$cache_params));
    }
}
