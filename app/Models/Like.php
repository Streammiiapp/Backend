<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;
use Illuminate\Support\Facades\URL;
use App\Models\{Post,User,DisLike,Follower};


class Like extends Model
{
    use SoftDeletes,CRUDGenerator;
    /**
     * The table associated with the model.
     *
     * @var string
     */
    protected $table = 'user_like';

    /**
     * The primary key associated with the table.
     *
     * @var string
     */
    protected $primaryKey = 'id';

    /**
     * The attributes that are mass assignable.
     *
     * @var array
     */
    protected $fillable = [
        'is_liked','user_id','module','module_id','created_at','updated_at','deleted_at'
    ];
    /**
     * The attributes that should be hidden for arrays.
     *
     * @var array
     */
    protected $hidden = [];

    /**
     * It is used to enable or disable DB cache record
     * @var bool
     */
    protected $__is_cache_record = true;

    /**
     * @var
     */
    protected $__cache_signature;

    /**
     * @var string
     */
    protected $__cache_expire_time = 1; //days

    public function user()
    {
        $base_url      = \URL::to('/');
        $default_image = \URL::to('images/default-user-placeholder.jpg');
        return $this->belongsTo(User::class, 'user_id', 'id')->select('id','name','username','slug','image_url')
        ->selectRaw("id,name, IF( image_url IS NOT NULL, CONCAT('$base_url',image_url), '$default_image' ) AS image_url");
    }


    public static function addOrDeleteLike($params)
    {

        $checkRecord = self::where('module',$params['module'])
                            ->where('module_id',$params['module_id'])
                            ->where('user_id',$params['user']->id)
                            ->first();

        //add record
        if( !isset($checkRecord->id) )
        {
            $record = self::create([
                'like_reaction_id' => 0,
                'user_id'          => $params['user']->id,
                'module'           => $params['module'],
                'module_id'        => $params['module_id'],
            ]);
                \DB::table($record->module)
                    ->where('id',$record->module_id)
                    ->increment('total_like',1);

            if ($params['module'] == 'posts') {
                $getPost = Post::find($params['module_id']);
                $targetUsers = User::getUserApiTokenByID($getPost->user_id);
                $userBadge   = Notification::getBadge($getPost->user_id);
                $getNotificationSetting = NotificationSetting::getSetting($getPost->user_id);
                if ($getNotificationSetting['Reactions'] == '1') {
                    //////like notification///
                    if (count($targetUsers) > 0) {
                        if ($params['user']->id != $targetUsers[0]->id) {
                            $getNotificationSetting = NotificationSetting::getSetting($targetUsers[0]->id);
                            if ($getNotificationSetting['Reactions'] == 1) {
                                $getRequestCount = Follower::getRequestCount($targetUsers[0]->id);
                                $notification_data = [
                                    'actor'            => $params['user'],
                                    'actor_type'      => 'users',
                                    'target'           => $targetUsers,
                                    'target_type'      => 'users',
                                    'title'            => env('APP_NAME'),
                                    'message'          => "".$params['user']->name." liked your ".$getPost->media_type."",
                                    'reference_id'     => $params['module_id'],
                                    'reference_module' => 'post_like',
                                    'redirect_link'    => NULL,
                                    'badge'            => $userBadge
                                ];
                                $custom_data = [
                                    'record_id'     => $params['module_id'],
                                    'redirect_link' => NULL,
                                    'identifier'    => 'post_like',
                                    'request_count' => $getRequestCount,

                                ];
                                Notification::sendPushNotification('post_like',$notification_data,$custom_data,$targetUsers[0]->device_type);
                            }
                        }
                    }
                }


            }else{
                $checkCommentParentId = Comment::where('id',$params['module_id'])->where('parent_id',0)->first();
                if (empty($checkCommentParentId)) {
                    $getCommentParentId = Comment::where('id',$params['module_id'])->first();
                    $getComment = Comment::where('id',$getCommentParentId->parent_id)->first();
                }else{
                    $getComment = Comment::where('id',$params['module_id'])->where('parent_id',0)->first();
                }

                $getTargetUserid = Comment::where('id',$params['module_id'])->first();
                $targetUsers = User::getUserApiTokenByID($getTargetUserid->user_id);
                $userBadge   = Notification::getBadge($getComment->user_id);
                $getNotificationSetting = NotificationSetting::getSetting($getComment->user_id);
                if ($getNotificationSetting['Reactions'] == '1') {
                    if (count($targetUsers) > 0) {
                        if ($params['user']->id != $targetUsers[0]->id) {
                            $getNotificationSetting = NotificationSetting::getSetting($targetUsers[0]->id);
                            if ($getNotificationSetting['Reactions'] == 1) {
                                $getRequestCount = Follower::getRequestCount($targetUsers[0]->id);

                                $notification_data = [
                                    'actor'            => $params['user'],
                                    'actor_type'      => 'users',
                                    'target'           => $targetUsers,
                                    'target_type'      => 'users',
                                    'title'            => env('APP_NAME'),
                                    'message'          => "".$params['user']->name." liked your comment",
                                    'reference_id'     => $getComment->module_id,
                                    'reference_module' => 'comment_like',
                                    'redirect_link'    => NULL,
                                    'badge'            => $userBadge
                                ];
                                $custom_data = [
                                    'record_id'     => $getComment->module_id,
                                    'redirect_link' => NULL,
                                    'identifier'    => 'comment_like',
                                    'request_count' => $getRequestCount,

                                ];
                                Notification::sendPushNotification('comment_like',$notification_data,$custom_data,$targetUsers[0]->device_type);
                            }
                        }
                    }
                }
            }
            //delete Dislike record

                $checkDisLikeRecord = DisLike::where('module',$params['module'])
                ->where('module_id',$params['module_id'])
                ->where('user_id',$params['user']->id)
                ->first();
                if (isset($checkDisLikeRecord)) {
                    DisLike::where('module',$params['module'])
                    ->where('module_id',$params['module_id'])
                    ->where('user_id',$params['user']->id)
                    ->forceDelete();

                    \DB::table($params['module'])
                        ->where('id',$params['module_id'])
                        ->decrement('total_dislike',1);
                }
        }
        else
        {
            //delete record
            self::where('module',$params['module'])
                ->where('module_id',$params['module_id'])
                ->where('user_id',$params['user']->id)
                ->forceDelete();

            \DB::table($params['module'])
                ->where('id',$params['module_id'])
                ->decrement('total_like',1);

            $record = [];
        }

        if( $params['module'] == 'posts' ){
            $record = Post::getUserPostBYID($params['user']->id,$params['module_id']);
            return $record;
        }else{
            return Comment::getUserCommentLike($params['user']->id,$params['module_id']);
        }
    }

    // public static function getLikeUsers($param){
    //     $query = self::with('user')->where('module',$param['module'])->where('module_id',$param['module_id'])->get();
    //     return $query;
    // }

    public static function getLikeUsers($param){
        $base_url      = \URL::to('/');
        $default_image = \URL::to('images/default-user-placeholder.jpg');
        $query = self::select('user_like.*')->join('users AS u', 'u.id', '=', 'user_like.user_id')
        ->select('user_like.id as like_id','u.id as user_id','u.name','u.username','u.slug','u.mobile_no')
        ->selectRaw("IF(u.image_url IS NOT NULL,CONCAT('$base_url',image_url),'$default_image') AS user_image_url,
              IF(u.image_url IS NOT NULL,CONCAT('$base_url',image_url),'$default_image') AS image_url")
        ->where('module',$param['module'])->where('module_id',$param['module_id'])->get();
        return $query;
    }



}
