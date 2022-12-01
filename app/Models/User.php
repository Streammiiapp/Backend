<?php

namespace App\Models;

use App\Helpers\CustomHelper;
use Carbon\Carbon;
use Illuminate\Database\Eloquent\Builder;
use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\SoftDeletes;
use Illuminate\Foundation\Auth\User as Authenticatable;
use Illuminate\Support\Facades\Hash;
use Illuminate\Support\Str;
use App\Models\Hooks\Api\UserHook;
use Illuminate\Support\Facades\URL;


class User extends Authenticatable
{
    use HasFactory, CRUDGenerator, SoftDeletes;
    /**
     * The table associated with the model.
     *
     * @var string
     */
    protected $table = 'users';

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
        'user_group_id', 'name', 'username','driver', 'slug', 'email', 'mobile_no', 'password', 'image_url', 'status', 'is_email_verify', 'email_verify_at', 'is_mobile_verify', 'mobile_verify_at', 'country', 'city', 'state', 'zipcode', 'address', 'latitude', 'longitude', 'online_status','mobile_otp', 'email_otp', 'remember_token', 'created_at', 'updated_at', 'deleted_at', 'artist_type_id', 'music_genre_id'
        , 'user_type'
        , 'bio'
        , 'gender'
        , 'date_of_birth'
        , 'facebook_url'
        , 'instagram_url'
        , 'twitter_url'
        , 'snapchat_url'
        , 'youtube_url'
        , 'weblink_url'
        , 'is_first_login'
        ,'total_post'
        ,'total_coins'
    ];

    /**
     * The attributes that should be hidden for arrays.
     *
     * @var array
     */
    protected $hidden = [
        'remember_token'
    ];

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
    public function musicGenre()
    {
        return $this->belongsTo(MusicGenre::class,'music_genre_id','id');
    }

    /**
     * @return \Illuminate\Database\Eloquent\Relations\BelongsTo
     */
    public function artistType()
    {
        return $this->belongsTo(ArtistType::class,'artist_type_id','id');
    }

    public function userApiToken()
    {
        return $this->hasMany(UserApiToken::class,'user_id','id');
    }

    /**
     * @return \Illuminate\Database\Eloquent\Relations\BelongsTo
     */
    public function posts()
    {
        return $this->hasMany(Post::class,'user_id','id');
    }

    public function userNotificationSetting()
    {
        return $this->hasMany(NotificationSetting::class, "user_id", "id");
    }

    public function notificationSetting()
    {
        return $this->hasOne(NotificationSetting::class, "user_id", "id");
    }

    /**
     * This function is used to generate unique username
     * @param string $username
     * @return string $username
     */
    public static function generateUniqueUserName($username)
    {
        $username = Str::slug($username);
        $query = self::where('username',$username)->count();
        if( $query > 0){
            $username = $username . $query . rand(111,999);
        }
        if(empty($username) || $username == "null"){
            $username = $username . $query . rand(111,999);
            return $username;
        }else{
            return Str::slug($username);
        }

    }

    /**
     * This function is used to get user by email
     * @param $email
     * @return object $query
     */
    public static function getUserByEmail($email)
    {
        $query = self::with('musicGenre','artistType')->where('email',$email)->first();
        return $query;
    }

    public static function getUserByID2($id)
    {
        $query = self::with('musicGenre','artistType')->where('id',$id)->first();
        return $query;
    }

    /**
     * This function is used to update user device token
     * @param illuminate\http\request $request
     * @param object $user
     * @return bool
     */
    public static function updateDeviceToken($request,$user,$platform_type = 'custom')
    {

        $api_token  = UserApiToken::generateApiToken($user->id,$request->ip(),$request->header('token'),$user->created_at);
        $record = UserApiToken::updateOrCreate(
            ['api_token' => $api_token],
            [
                'user_id'       => $user->id,
                'api_token'     => $api_token,
                'refresh_token' => UserApiToken::generateRefreshToken($user->id),
                'udid'          => $request->header('token'),
                'device_type'   => $request['device_type'],
                'device_token'  => $request['device_token'],
                'platform_type' => $platform_type,
                'platform_id' => $request['platform_id'],
                'ip_address'    => $request->ip(),
                'user_agent'    => $request->server('HTTP_USER_AGENT'),
                'created_at'    => Carbon::now(),
            ]
        );
        //new device login attempt
        if( !$record->wasChanged() ){

        }
        return $api_token;
    }

    /**
     * @param $email
     * @param string $module
     * @return false|object
     */
    public static function ForgotPassword($email, $module = 'users')
    {
        $user = self::getUserByEmail($email);
        if( !isset($user->id) )
            return false;
        elseif( $user->status != 1)
            return false;

        $reset_pass_token = Str::random(150);
        ResetPassword::insert([
            'module'     => $module,
            'email'      => $email,
            'token'      => $reset_pass_token,
            'created_at' => Carbon::now(),
        ]);
        //send reset password email
        $mail_params['USERNAME'] = $user->name;
        $mail_params['LINK']     = route('reset-password',['any' => $reset_pass_token]);
        $mail_params['YEAR']     = date('Y');
        $mail_params['APP_NAME'] = env('APP_NAME');
        CustomHelper::sendMail($user->email,'forgot-password',$mail_params);

        return $user;
    }

    public static function updateUser($user_id,$data)
    {
        self::where('id',$user_id)->update($data);
    }

    public static function updateUserByEmail($email,$data)
    {
        self::where('email',$email)->update($data);
    }

    public static function getUserByApiToken($api_token)
    {
        $user = self::with('musicGenre','artistType','userNotificationSetting')->select('users.*')
                    ->selectRaw('api_token,device_type,device_token,platform_type,platform_id')
                    ->join('user_api_token AS uat','uat.user_id','=','users.id')
                    ->where('uat.api_token',$api_token)
                    ->first();
        return $user;
    }

    public static function getUserByApiId($user_id)
    {
        $user = self::with('musicGenre','artistType','userNotificationSetting')->select('users.*')
                    ->selectRaw('api_token,device_type,device_token,platform_type,platform_id')
                    ->join('user_api_token AS uat','uat.user_id','=','users.id')
                    ->where('users.id',$user_id)
                    ->orderBy('uat.id','desc')
                    ->first();
        return $user;
    }

    public static function userLogout($params)
    {
        UserApiToken::where('api_token',$params['api_token'])->forceDelete();
        return true;
    }

    public static function socialUser($params)
    {
        $data  = new \stdClass();
        $email = !empty($params['email']) ? $params['email'] : '';
        $user  = self::getUserByEmail($email);
        if( !isset($user->id) ){
            $user = self::getUserByPlatformID($params['platform_type'],$params['platform_id']);
        }
        //upload image by url
        if( !empty($params['image_url']) )
            $image_url = $params['image_url'];
        else
            $image_url = null;
        //create new user
        if( !isset($user->id) ){
            $created_at    = Carbon::now();
            $temp_password = Str::random(8);
            if(empty($params['name'])){
                $params['name'] = "";
            }

            $username      = self::generateUniqueUserName($params['name']);
            if(isset($params['email']) || $params['email'] != "null"){
                $email = $params['email'];
            }else{
                $email = null;
            }
            $record_id = self::insertGetId([
                'user_group_id'   => 1,
                'name'            => $params['name'],
                'user_type'       => $params['user_type'],
                'username'        => $username,
                'slug'            => $username,
                'email'           => $email,
                'password'        => Hash::make($temp_password),
                'mobile_no'       => !empty($params['mobile_no']) ? $params['mobile_no'] : null,
                'image_url'       => $image_url,
                'is_email_verify' => 1,
                'is_first_login' => "0",
                // 'user_type' => $params['user_type'],
                'latitude'        => !empty($params['latitude']) ? $params['latitude'] : null,
                'longitude'       => !empty($params['longitude']) ? $params['longitude'] : null,
                'created_at'      => Carbon::now(),
            ]);
            $data->id = $record_id;
            $data->created_at = $created_at;
        } else {

            //update existing user
            $update_data = [];
            if( !empty($params['latitude']) && !empty($params['longitude']) ){
                $update_data['latitude'] = $params['latitude'];
                $update_data['longitude'] = $params['longitude'];
            }


            $update_data['is_email_verify'] = 1;
            $update_data['is_first_login'] = 0;
            $update_data['updated_at']      = Carbon::now();
            if( !empty($update_data) )
                self::where('id',$user->id)->update($update_data);

            $data->id = $user->id;
            $data->created_at = $user->created_at;
        }
        return $data;
    }

    public static function getUserByPlatformID($platform_type,$platform_id)
    {
        $query = self::select('users.*')
                    ->selectRaw('api_token,device_type,device_token,platform_type,platform_id')
                    ->join('user_api_token AS uat','uat.user_id','=','users.id')
                    ->where('platform_type',$platform_type)
                    ->where('platform_id',$platform_id)
                    ->first();
        return $query;
    }

    public static function getUserApiTokenByID($user_id, $module=NULL)
    {
        $query = self::select('users.*','uat.device_type','uat.device_token');
        if(!empty($module)){
            $query->with(['notificationSetting'=>function($raw)use($module){
                $raw->where('meta_key',$module);
            }]);
        }
        $query->join('user_api_token AS uat','uat.user_id','=','users.id')
                    ->where('uat.user_id',$user_id);

        $rec = $query->get();
        return $rec;
    }

    public static function getUserById($user_id,$target_id)
    {
        $query = self::select('users.*')
            ->selectRaw('IF( uf.status IS NOT NULL,
                                      IF(uf.status = 1,1,2),
                                      0) AS is_follow, IFNULL(uf.id,0) AS user_follow_id,
                                     IF(ub.id IS NOT NULL,1,0) AS is_block')
            ->leftJoin('followers AS uf',function($leftJoin) use ($user_id){
                $leftJoin->on('uf.target_id','=','users.id')
                    ->where('uf.actor_id','=',$user_id);
            })
            ->leftJoin('user_block AS ub',function($leftJoin) use ($user_id) {
                $leftJoin->on('ub.target_id','=','users.id')
                    ->where('ub.actor_id','=',$user_id);
            })
            ->where('users.id',$target_id)
            ->first();
        return $query;
    }

    public static function getUserHookBYID($user_id)
    {
        $query = User::select('users.*');
        $query->with('musicGenre');
        $query->with('artistType');
        $query->selectRaw("IF( uf.status IS NOT NULL,
                                      IF(uf.status = 1,1,0),
                                      0) AS is_follow, IFNULL(uf.id,0) AS user_follow_id");
        $query->leftJoin('followers AS uf',function($leftJoin) use ($user_id){
            $leftJoin->on('uf.target_id','=','users.id')
                ->where('uf.actor_id','=',$user_id);
        });
        return $query->first();
    }

    public static function getBlockUsers($user_id)
    {
        $query = User::select('users.*');
        $query->with('musicGenre');
        $query->with('artistType');
        $query->join('user_block AS ub','ub.target_id','=','users.id');
        $query->where('ub.actor_id',$user_id);
        return $query->orderBy('users.id','desc')->paginate(config('constants.PAGINATION_LIMIT'));
    }

    public static function getByUserID($params){

        $base_url    = URL::to('/');
        $placeholder = URL::to('images/default-user-placeholder.jpg');

        for($j=0;$j <count($params); $j++){
            $user_id[] = $params[$j]->user_id;
        }
        $query = User::select('id','name','slug','image_url')
        ->selectRaw("IF(image_url IS NOT NULL, CONCAT('$base_url',image_url), '$placeholder') AS image_url");
        $query->whereIn('id',$user_id)->whereNull('deleted_at');
        return $query->get();

    }

    public static function updateUserPublicSetting($slug,$is_public,$api_token)
    {
        self::where('slug',$slug)->update(['is_public'=>$is_public]);
        $query = self::getUserByApiToken($api_token);
        return $query;
    }

    public static function getChatMessageCounter($user_id)
    {
        $query = \DB::table('chat_message_status')
            ->where('user_id',$user_id)
            ->where('is_read',0)
            ->groupBy('chat_room_id')
            ->count();
        return $query;
    }

}
