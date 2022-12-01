<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;

class Follower extends Model
{
    use SoftDeletes,CRUDGenerator;
    /**
     * The table associated with the model.
     *
     * @var string
     */
    protected $table = 'followers';

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
    protected $fillable = ['actor_id', 'target_id', 'status','slug'];

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

    public static function getFollower($actor_id,$target_id)
    {
        $query = self::where('actor_id',$actor_id)
            ->where('target_id',$target_id)
            ->first();
        return $query;
    }

    public static function deleteFollowRequest($record_id,$params)
    {
        //get record
        $record = self::where('id',$record_id)->first();
        self::where('id',$record_id)->forceDelete();
        //update follower count
        if( $record->status == 1 ){
            User::where('id',$record->actor_id)->decrement('no_of_following',1);
            //update following count
            User::where('id',$record->target_id)->decrement('no_of_followers',1);
        }
        $target_user_id = $params['user']->id == $record->actor_id ? $record->target_id : $record->actor_id;
        return User::getUserById($params['user']->id,$target_user_id);
        // return User::getUserByEmail($params['user']->email);
    }

    public static function getFollowers($actor_id)
    {
        $query = self::where('actor_id',$actor_id)
            ->where('status','1')
            ->get();
        return $query;
    }

    /**
     * @return \Illuminate\Database\Eloquent\Relations\BelongsTo
     */
    public function users()
    {
        return $this->belongsTo(User::class,'user_id','id')->select('users.id','users.image_url','name','slug');
    }

    /**
     * @return \Illuminate\Database\Eloquent\Relations\BelongsTo
     */
    public function actor()
    {
        return $this->belongsTo(User::class,'actor_id','id');
    }

    public function target()
    {
        return $this->belongsTo(User::class,'target_id','id');
    }
 
    public static function getFollowRequest($user_id)
    {
        $query = self::select('users.*')
                    ->selectRaw('IF( followers.status IS NOT NULL,
                                              IF(followers.status = 1,1,2),
                                              0) AS is_follow, IFNULL(followers.id,0) AS followers_id')
                    ->join('users','users.id','=','followers.actor_id')
                    ->where('followers.target_id',$user_id)
                    ->where('followers.status','0')
                    ->paginate(config('constants.PAGINATION_LIMIT'));
        return $query;
    }

    public static function checkFollowRequest($actor_id,$target_id)
    {
        $query = self::where('actor_id',$actor_id)
                        ->where('target_id',$target_id)
                        ->first();
        return $query;
    }

    public static function acceptFollowRequest($record_id)
    {
        //get record
        $record = self::where('id',$record_id)->first();
        //update request status
        self::where('id',$record_id)
            ->update([
                'status' => 1
            ]);
        //update follower count
        User::where('id',$record->actor_id)->increment('no_of_following',1);
        //update following count
        User::where('id',$record->target_id)->increment('no_of_followers',1);

        return User::getUserById($record->target_id,$record->actor_id);
    }

    public static function getRequestCount($user_id)
    {
        $query = \DB::table('followers')
            ->where('target_id',$user_id)
            ->where('status','0')
            ->count();
        return $query;
    }

    public static function friendExist($user_id,$current_user_id)
    {
        $getPostUser = User::find($user_id);
        if (!empty($getPostUser)) {
            if ($getPostUser->is_public == 0) 
            {
                $query = \DB::table('followers')
                            ->whereRaw("( (actor_id = {$user_id} AND target_id = {$current_user_id}) OR ( actor_id = {$current_user_id} AND target_id = {$user_id} ) )")
                            ->where('status','1')
                            ->count();
                            if (!empty($query)) {
                                return true;
                            }else{
                                return false;
                            }
            }else{
                return true;
            }
        }else{
            return false;    
        }
       
    }
}
