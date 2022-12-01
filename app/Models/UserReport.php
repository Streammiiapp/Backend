<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;
use Carbon\Carbon;

class UserReport extends Model
{
    use SoftDeletes,CRUDGenerator;
    /**
     * The table associated with the model.
     *
     * @var string
     */
    protected $table = 'user_reports';

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
        'user_id', 'module','slug', 'module_id', 'reason','report_type_id', 'created_at', 'updated_at', 'deleted_at'
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

    public function user(){
        $base_url      = \URL::to('/');
        $default_image = \URL::to('images/default-user-placeholder.jpg');

        return $this->belongsTo(User::class, 'module_id', 'id')
                    ->selectRaw("id,user_group_id,name,username,slug,email,mobile_no, IF( image_url IS NOT NULL, CONCAT('$base_url',image_url), '$default_image' ) AS image_url");
    }

    public function reportUser(){
        return $this->belongsTo(User::class, 'module_id', 'id');
    }

    public function post(){
        return $this->hasOne(Post::class, 'id', 'module_id')->withTrashed();
    }

    public function reportType(){
        return $this->belongsTo(ReportType::class, 'report_type_id', 'id');
    }
    public static function getReportUser($user_id,$module,$module_id)
    {
        $query = self::where('user_id',$user_id)
            ->where('module',$module)
            ->where('module_id',$module_id)
            ->count();

        return $query;
    }
}
