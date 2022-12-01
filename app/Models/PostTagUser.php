<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;

class PostTagUser extends Model
{
    use SoftDeletes,CRUDGenerator;
    /**
     * The table associated with the model.
     *
     * @var string
     */
    protected $table = 'post_tag_users';

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
    protected $fillable = ['post_id','user_id','created_at','updated_at'];

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

    public function tagusers()
    {
        return $this->hasOne(User::class, 'id', 'user_id')->select('id','name','slug','email','image_url');
    }
}
