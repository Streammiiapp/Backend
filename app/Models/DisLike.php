<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;
use Illuminate\Support\Facades\URL;
use App\Models\{Post,User,Like,Follower};


class DisLike extends Model
{
    use SoftDeletes,CRUDGenerator;
    /**
     * The table associated with the model.
     *
     * @var string
     */
    protected $table = 'dislikes';

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

    public static function addOrDeleteDisLike($params)
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
                    ->increment('total_dislike',1);

                    if ($params['module'] == 'posts') {
                        $getPost = Post::find($params['module_id']);
        
                              //////like notification///
                        $targetUsers = User::getUserApiTokenByID($getPost->user_id);
                        $userBadge   = Notification::getBadge($getPost->user_id);
                        $getNotificationSetting = NotificationSetting::getSetting($getPost->user_id);
                        if ($getNotificationSetting['Reactions'] == '1') {
                            if (count($targetUsers) > 0) {
                                if ($params['user']->id != $targetUsers[0]->id) {
                                    $getRequestCount = Follower::getRequestCount($targetUsers[0]->id);
                                    $notification_data = [
                                        'actor'            => $params['user'],
                                        'actor_type'      => 'users',
                                        'target'           => $targetUsers,
                                        'target_type'      => 'users',
                                        'title'            => env('APP_NAME'),
                                        'message'          => "".$params['user']->name." disliked your ".$getPost->media_type."",
                                        'reference_id'     => $params['module_id'],
                                        'reference_module' => 'post_dislike',
                                        'redirect_link'    => NULL,
                                        'badge'            => $userBadge
                                    ];
                                    $custom_data = [
                                        'record_id'     => $params['module_id'],
                                        'redirect_link' => NULL,
                                        'identifier'    => 'post_dislike',
                                        'request_count' => $getRequestCount,

                                    ];
                                    Notification::sendPushNotification('post_dislike',$notification_data,$custom_data,$targetUsers[0]->device_type);
                                }
                            }
                        }
                        
                    }else{
                        $getComment = Comment::find($params['module_id']);
                        $targetUsers = User::getUserApiTokenByID($getComment->user_id);
                        $userBadge   = Notification::getBadge($getComment->user_id);
                        $getNotificationSetting = NotificationSetting::getSetting($getComment->user_id);
                        if ($getNotificationSetting['Reactions'] == '1') {
                            if (count($targetUsers) > 0) {
                                if ($params['user']->id != $targetUsers[0]->id) {
                                    $getRequestCount = Follower::getRequestCount($targetUsers[0]->id);
                                    $notification_data = [
                                        'actor'            => $params['user'],
                                        'actor_type'      => 'users',
                                        'target'           => $targetUsers,
                                        'target_type'      => 'users',
                                        'title'            => env('APP_NAME'),
                                        'message'          => "".$params['user']->name." liked your comment",
                                        'reference_id'     => $getComment->module_id,
                                        'reference_module' => 'comment_dislike',
                                        'redirect_link'    => NULL,
                                        'badge'            => $userBadge
                                    ];
                                    $custom_data = [
                                        'record_id'     => $getComment->module_id,
                                        'redirect_link' => NULL,
                                        'identifier'    => 'comment_dislike',
                                        'request_count' => $getRequestCount,
                                    ];
                                    Notification::sendPushNotification('comment_dislike',$notification_data,$custom_data,$targetUsers[0]->device_type);
                                }
                            }
                        }
                    }  
                    
            //delete like record
           
                $checkDisLikeRecord = Like::where('module',$params['module'])
                ->where('module_id',$params['module_id'])
                ->where('user_id',$params['user']->id)
                ->first();
                if (isset($checkDisLikeRecord)) {
                    Like::where('module',$params['module'])
                    ->where('module_id',$params['module_id'])
                    ->where('user_id',$params['user']->id)
                    ->forceDelete();
    
                    \DB::table($params['module'])
                        ->where('id',$params['module_id'])
                        ->decrement('total_like',1);
                
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
                ->decrement('total_dislike',1);

            $record = [];
        }
      
        if( $params['module'] == 'posts' ){
            $record = Post::getUserPostBYID($params['user']->id,$params['module_id']); 
            return $record;    
        }else{
            return Comment::getUserCommentLike($params['user']->id,$params['module_id']);
        }
    }

   
    // public static function getDisLikeUsers($param){
    //     $query = self::with('user')->where('module',$param['module'])->where('module_id',$param['module_id'])->get();
    //     return $query;
    // }

    public static function getDisLikeUsers($param){
        $base_url      = \URL::to('/');
        $default_image = \URL::to('images/default-user-placeholder.jpg');
        $query = self::select('dislikes.*')->join('users AS u', 'u.id', '=', 'dislikes.user_id')
        ->select('dislikes.id as dislike_id','u.id as user_id','u.name','u.username','u.slug','u.mobile_no')
        ->selectRaw("IF(u.image_url IS NOT NULL,CONCAT('$base_url',image_url),'$default_image') AS user_image_url,
              IF(u.image_url IS NOT NULL,CONCAT('$base_url',image_url),'$default_image') AS image_url")
        ->where('module',$param['module'])->where('module_id',$param['module_id'])->get();
        return $query;
    }
}
