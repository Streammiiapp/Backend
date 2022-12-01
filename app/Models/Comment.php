<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;
use Illuminate\Support\Facades\URL;

class Comment extends Model
{
    use SoftDeletes,CRUDGenerator;
    /**
     * The table associated with the model.
     *
     * @var string
     */
    protected $table = 'user_comments';

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
        'parent_id', 'user_id', 'module', 'module_id', 'comment', 'status','created_at',
        'updated_at', 'deleted_at', 'total_like'
        , 'reply_count'
        , 'slug'
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
    protected $__is_cache_record = false;

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
        return $this->belongsTo('App\Models\User','user_id','id')
            ->selectRaw("id,name, IF( image_url IS NOT NULL, CONCAT('$base_url',image_url), '$default_image' ) AS image_url");
    }

    public function child()
    {
        $base_url      = \URL::to('/');
        $default_image = \URL::to('images/default-user-placeholder.jpg');
        return $this->hasMany('App\Models\Comment','parent_id','id')
            ->select("user_comments.*","u.name AS username","u.name AS name", "u.username AS user_slug")
            ->selectRaw("IF(u.image_url IS NOT NULL,CONCAT('$base_url',image_url),'$default_image') AS image_url")
            ->join('users AS u','u.id','=','user_comments.user_id')
            ->where('u.status',1) 
            ->orderBy('user_comments.id','asc');
    }

    public static function checkUserComment($user_id,$slug){
         $query = self::where('user_id',$user_id)->where('slug',$slug)->count();
         return $query;
    }

    public static function decrementUserCommentCount($user_id,$slug)
    {
        $getComment = self::where('user_id',$user_id)->where('slug',$slug)->first();
        $decrementGetComment = self::find($getComment->parent_id);
        if ($getComment->module == "user_comments") {
            \DB::table('user_comments')->where('id',$getComment->module_id)->decrement('reply_count',1);
        }
        else{
            \DB::table('posts')->where('id',$getComment->module_id)->decrement('total_comment',1);
        }
        
    }

    public static function getUserCommentLike($user_id,$module_id){
        $base_url    = URL::to('/');
        $placeholder = URL::to('images/default-user-placeholder.jpg');
        
        $query = self::select('user_comments.*')->with('user')
              ->selectRaw("IF(ul.id IS NOT NULL,1,0) AS is_user_like, 
                            ul.id AS user_like_id")
              ->join('users AS u','u.id','=','user_comments.user_id')
              ->leftJoin('user_like AS ul',function($leftJoin) use ($user_id){
                  $leftJoin->on('ul.module_id','=','user_comments.id')
                           ->where('ul.module','=','user_comments')
                           ->where('ul.user_id','=',$user_id);
              })
              ->selectRaw("IF(udl.id IS NOT NULL,1,0) AS is_user_dislike, 
                        udl.id AS user_dislike_id")
                        ->leftJoin('dislikes AS udl',function($leftJoin) use ($user_id){
                            $leftJoin->on('udl.module_id','=','user_comments.id')
                                    ->where('udl.module','=','user_comments')
                                    ->where('udl.user_id','=',$user_id);
                        })                      
               ->where('user_comments.id',$module_id)->get();
        return $query;
    }

}
