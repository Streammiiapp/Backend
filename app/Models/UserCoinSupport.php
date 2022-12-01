<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;
use Illuminate\Support\Facades\URL;

class UserCoinSupport extends Model
{
    use SoftDeletes,CRUDGenerator;
    /**
     * The table associated with the model.
     *
     * @var string
     */
    protected $table = 'user_coin_support';

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
    protected $fillable = ['slug','sender_id','receiver_id', 'post_id','generated_post_id', 'coins','created_at', 'updated_at', 'deleted_at'];

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

    public static function getgetPostSupportArtistList($param)
    {
        $base_url      = \URL::to('/');
        $default_image = \URL::to('images/default-user-placeholder.jpg');
        $query = self::select('user_coin_support.*')->join('users AS u', 'u.id', '=', 'user_coin_support.sender_id')
        ->select('user_coin_support.id as like_id','u.id as user_id','u.name','u.username','u.slug','u.mobile_no')
        ->selectRaw("IF(u.image_url IS NOT NULL,CONCAT('$base_url',image_url),'$default_image') AS user_image_url,
              IF(u.image_url IS NOT NULL,CONCAT('$base_url',image_url),'$default_image') AS image_url")
        ->where('user_coin_support.post_id',$param['post_id'])->get();
        return $query;
    }


    public function users()
    {
        return $this->belongsTo(User::class,'sender_id','id');
    }


    public function sender()
    {
        return $this->belongsTo(User::class,'sender_id','id');

    }

    public function reciever()
    {
        return $this->belongsTo(User::class,'receiver_id','id');

    }

    public static function getUserSupportCoin($user_id,$type)
    {
        if ($type == 'received') {
            $query = self::selectRaw('sum(coins) AS total_coins')->where('receiver_id',$user_id)->get();
        }else{
            $query = self::selectRaw('sum(coins) AS total_coins')->where('sender_id',$user_id)->get();
        }
        return ($query[0]['total_coins'] == null) ? 0  : $query[0]['total_coins'];
    }
}
