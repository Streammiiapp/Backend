<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;
use Illuminate\Support\Facades\URL;
use App\Models\User;
use App\Models\UserCoinSupport;
use DB;
class Post extends Model
{
    use SoftDeletes,CRUDGenerator;
    /**
     * The table associated with the model.
     *
     * @var string
     */
    protected $table = 'posts';

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
    protected $fillable = ['user_id','title','driver','slug','latitude','longitude','media_file','support_coin','media_thumbnail_url','media_type','post_identify','status','created_at','updated_at','address','post_type','post_meta_data'];

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

    /**
     * @return \Illuminate\Database\Eloquent\Relations\BelongsTo
     */
    public function users()
    {
        return $this->belongsTo(User::class,'user_id','id')->select('users.id','users.image_url','name','username','driver','slug','total_post');
    }

    /**
     * Get all of the comments for the Post
     *
     * @return \Illuminate\Database\Eloquent\Relations\HasMany
     */
    public function post_tagusers()
    {
        return $this->hasMany(PostTagUser::class, 'post_id', 'id');
    }

    public function reports(){
        return $this->hasMany(UserReport::class, 'id', 'module_id')->where('module', 'posts');
    }

    public function userCoinSupport()
    {
        return $this->hasOne(UserCoinSupport::class, 'generated_post_id', 'id');

    }

    public static function getUserPostBYID($user_id,$module_id)
    {
        $base_url    = URL::to('/');
        $placeholder = URL::to('images/default-user-placeholder.jpg');

        $query = Post::select('posts.*')->with('users')
        ->selectRaw("IF(posts.media_file IS NOT NULL, CONCAT('$base_url',posts.media_file), '$placeholder') AS media_file")
        ->selectRaw("IF(posts.media_thumbnail_url IS NOT NULL, CONCAT('$base_url',posts.media_thumbnail_url), '$placeholder') ASmedia_thumbnail_url")
              ->selectRaw("IF(ul.id IS NOT NULL,1,0) AS is_user_like,
                            ul.id AS user_like_id")
              ->join('users AS u','u.id','=','posts.user_id')
              ->leftJoin('user_like AS ul',function($leftJoin) use ($user_id){
                  $leftJoin->on('ul.module_id','=','posts.id')
                           ->where('ul.module','=','posts')
                           ->where('ul.user_id','=',$user_id);
              })
              ->selectRaw("IF(udl.id IS NOT NULL,1,0) AS is_user_dislike,
                        udl.id AS user_dislike_id")
                        ->leftJoin('dislikes AS udl',function($leftJoin) use ($user_id){
                            $leftJoin->on('udl.module_id','=','posts.id')
                                    ->where('udl.module','=','posts')
                                    ->where('udl.user_id','=',$user_id);
                        })
               ->where('posts.id',$module_id)->get();

        return $query;
    }

    public static function checkAuthUserPost($request,$slug)
    {
        $query = Post::where('slug',$slug)->where('user_id',$request['user']->id)->count();
        return $query;

    }

    public static function autoGeneratedPost($sender_id,$receiver_id,$coins)
    {
        $getactor = User::find($sender_id);
        $gettarget = User::find($receiver_id);
        $query = self::create([
                'user_id'=>$sender_id,
                'title' => ''.$getactor->name.' support '.$gettarget->name.' with '.$coins.' token ',
                'post_identify'=>"auto_generated_post",
                'post_type'    =>'support'

            ]);

            return $query;
    }

    public static function checkAutoGenPost($request,$slug)
    {
        $post = Post::where('slug',$slug)->first();
        $query = DB::table('user_coin_support')->where('post_id',$post->id)->count();

        return $query;
    }


}
