<?php

namespace App\Models;

use Carbon\Carbon;
use Illuminate\Database\Eloquent\Model;
use CustomHelper;
use Illuminate\Support\Facades\Hash;

class NotificationSetting extends Model
{
    /**
     * The table associated with the model.
     *
     * @var string
     */
    protected $table = 'notification_setting';

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
        'user_id', 'meta_key', 'meta_value', 'created_at', 'updated_at', 'deleted_at'
    ];

    public static function saveSetting($params)
    {
        $user = $params['user'];
        unset($params['user']);
        if( count($params) ){
            //delete old key
            if ($user->user_type == "fan") {
                unset($params['notification_setting']['received_token']);
                unset($params['notification_setting']['message']);
            }
            self::where('user_id',$user->id)->whereIn('meta_key',array_keys($params['notification_setting']))->forceDelete();

            foreach($params['notification_setting'] as $key => $value){
                // add new key
                $data[] = [
                    'user_id'    => $user->id,
                    'meta_key'   => $key,
                    'meta_value' => $value,
                    'created_at' => Carbon::now(),
                ];
            }

            self::insert($data);
        }

        return User::getUserByApiToken($user->api_token);
    }

    public static function storeNewUserSetting($params)
    {
        foreach($params['notification_setting'] as $key => $value){
            // add new key
            $data[] = [
                'user_id'    => $params['user_id'],
                'meta_key'   => $key,
                'meta_value' => $value,
                'created_at' => Carbon::now(),
            ];
        }

        self::insert($data);

        return 1;
    }

    public static function getSetting($user_id)
    {
        $records = self::where('user_id',$user_id)->get();
        if( count($records) ){
            foreach($records as $record){
                $data[$record->meta_key] = $record->meta_value;
                $data['update_notification'] = 0;
            }
        } else {
            //default notification setting
            $data['post'] = 1;
            $data['comment'] = 1;
            $data['update_notification'] = 1;

        }
        return $data;
    }
}
