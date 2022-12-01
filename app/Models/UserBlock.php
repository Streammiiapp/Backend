<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;
use Carbon\Carbon;

class UserBlock extends Model
{
    use SoftDeletes,CRUDGenerator;
    /**
     * The table associated with the model.
     *
     * @var string
     */
    protected $table = 'user_block';

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
        'actor_id', 'target_id', 'created_at', 'updated_at', 'deleted_at', 'slug'
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

    public static function getBlockUserIds($user_id)
    {
        $query = \DB::table('user_block')
            ->selectRaw("GROUP_CONCAT(IF( actor_id = {$user_id}, target_id, actor_id )) AS block_user_id")
            ->whereRaw("(actor_id = {$user_id} OR target_id = {$user_id})")
            ->first();
        return $query;
    }

    public static function blockUnBlock($params)
    {
        $checkRecord = self::where('actor_id',$params['user']->id)
            ->where('target_id',$params['target_id'])
            ->first();
        if( isset($checkRecord->id) ){
            $is_delete = true;
            $checkRecord->forceDelete();
        } else {
            $is_delete = false;
            self::insert([
                'actor_id'  => $params['user']->id,
                'target_id' => $params['target_id'],
            ]);
        }
        return [
            'is_delete' => $is_delete,
            'data'      => User::getUserById($params['user']->id,$params['target_id'])
        ];
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

    public static function deleteUserBlock($record_id,$params)
    {
        //get record
        $record = self::where('id',$record_id)->first();
        self::where('id',$record_id)->forceDelete();
        //update follower count
        $target_user_id = $params['user']->id == $record->actor_id ? $record->target_id : $record->actor_id;
        return User::getUserById($params['user']->id,$target_user_id);
    }

    public static function getBlockUser($actor_id,$target_id)
    {
        $query = self::where('actor_id',$actor_id)
            ->where('target_id',$target_id)
            ->first();

        return $query;
    }

    public static function addBlockUser($params)
    {
        \DB::table('user_block')
            ->insert([
                'actor_id'   => $params['user']->id,
                'target_id'  => $params['target_id'],
                'slug'       => $params['target_id'] . time(),
                'created_at' => Carbon::now() 
            ]);
            
        $record = User::getUserHookBYID($params['target_id']);
        return $record;    
    }

    public static function getBlockUsers($user_id)
    {
        $record = User::getBlockUsers($user_id);
        return $record; 
    }
}
