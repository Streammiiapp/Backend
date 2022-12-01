<?php

namespace App\Http\Controllers\Api;

use App\Libraries\Sms\Sms;
use App\Models\User;
use App\Models\UserApiToken;
use App\Models\{UserBlock,NotificationSetting};
use Carbon\Carbon; 
use Illuminate\Support\Facades\Hash;
use Validator;
use Illuminate\Validation\Rule;
use Illuminate\Http\Request;
use App\Http\Controllers\RestController;

class UserController extends RestController
{
    public function __construct(Request $request)
    {
        $this->middleware('custom_auth:api')->only(['index','show','update','changePassword','userLogout',
            'verifyCode', 'resendCode']);
        parent::__construct('User');
        $this->__request     = $request;
        $this->__apiResource = 'Auth';
        $this->__success_store_message = __('app.registration_successful_message');
    }

    /**
     * This function is used to validate restfull routes
     * @param $action
     * @param string $slug
     * @return array
     */
    public function validation($action,$slug='')
    {
        $validator = [];
        $custom_messages = [
            'password.regex' => __('app.password_regex')
        ];

        switch ($action){
            case 'POST':
                if($this->__request->user_type == "artist"){
                    $validator = Validator::make($this->__request->all(), [
                        'name'          => ['required','min:3','max:50','regex:/([a-z0-9]|[a-z0-9\.])/'],
                        'email'         => ['required', 'email',
                            Rule::unique('users')->whereNull('deleted_at')
                        ],
                        'username'         => ['required', 'max:50','regex:/^[a-zA-Z0-9._]+$/',
                            Rule::unique('users')->whereNull('deleted_at')
                            ,],
                        'mobile_no'     => [
                            Rule::unique('users')->whereNull('deleted_at'),
                            'regex:/^(\+?\d{1,3}[-])\d{9,11}$/'
                        ],
                        'password'      => ['required','regex:/^(?=.*[A-Z])(?=.*[!@#$&*?])(?=.*[0-9])(?=.*[a-z]).{8,150}$/'],
                        'confirm_password' => 'required|same:password',
                        'device_type'  => 'required|in:web,android,ios',
                        'device_token' => 'required',
                        'artist_type_id' => 'required|exists:artist_types,id',
                        'music_genre_id' => 'required|exists:music_genres,id',
                        'user_type' => 'required',
                    ],$custom_messages);
                }else{

                    $validator = Validator::make($this->__request->all(), [
                        'name'          => ['required','min:3','max:50','regex:/([a-z0-9]|[a-z0-9\.])/'],
                        'email'         => ['required', 'email',
                            Rule::unique('users')->whereNull('deleted_at')
                        ],
                        'username'         => ['required', 'max:50','regex:/^[a-zA-Z0-9._]+$/',
                            Rule::unique('users')->whereNull('deleted_at')
                            ,],
                        'mobile_no'     => [
                            Rule::unique('users')->whereNull('deleted_at'),
                            'regex:/^(\+?\d{1,3}[-])\d{9,11}$/'
                        ],
                        'password'      => ['required','regex:/^(?=.*[A-Z])(?=.*[!@#$&*?])(?=.*[0-9])(?=.*[a-z]).{8,150}$/'],
                        'confirm_password' => 'required|same:password',
                        'device_type'  => 'required|in:web,android,ios',
                        'user_type' => 'required',
                    ],$custom_messages);
                }

                break;
            case 'PUT':


                $custom_messages = [
                    'slug.exists' => __('app.invalid_user')
                ];
                $this->__request->merge(['slug' => $slug]);
                $validator = Validator::make($this->__request->all(), [
                    'slug'      => 'exists:users,slug,deleted_at,NULL,id,' . $this->__request['user']->id,
                    'name'      => ['min:3','max:50','regex:/^([A-Za-z0-9\s])+$/'],
                    'username'  => 'unique:users,username,' . $this->__request['user']->id,
                    // 'mobile_no'     => [
                    //     Rule::unique('users')->ignore($this->__request->user->id,'mobile_no')->whereNull('deleted_at'),
                    //     'regex:/^(\+?\d{1,3}[-])\d{9,11}$/'
                    // ],
                    'mobile_no' => 'nullable|unique:users,mobile_no,'.$this->__request->user->id.',id'                    ,
                    'image_url' => 'image',
                    'country'   => 'min:3|max:50',
                    'state'     => 'min:3|max:50',
                    'city'      => 'min:3|max:50',
                    'zipcode'   => 'min:3|max:50',
                    'address'   => 'min:3|max:50',
                    'latitude'  => 'min:3|max:50',
                    'longitude' => 'min:3|max:50',
                    'online_status' => 'in:0,1',
                ],$custom_messages);
                break;
        }
        return $validator;
    }

    /**
     * GET Request Hook
     * This function is run before a model load
     * @param $request
     */
    public function beforeIndexLoadModel($request)
    {
        $this->__apiResource = 'PublicUser';
    }

    /**
     * @param $request
     * @param $record
     */
    public function afterIndexLoadModel($request,$record)
    {

    }

    /**
     * POST Request Hook
     * This function is run before a model load
     * @param $request
     */
    public function beforeStoreLoadModel($request)
    {
        if( env('VERIFICATION_TYPE') == 'mobile' ) {
            if( env('SMS_SANDBOX',1) != 1){
                $sms = new Sms;
                $response = $sms->getInstance()->sendVerificationCode($request['mobile_no']);
                if( $response['code'] != 200 ){
                    $this->__is_error = true;
                    return $this->__sendError(__('app.validation_msg'),['message' => __('app.invalid_mobile_no') ],400);
                } else {
                    if( env('SMS_DRIVER') == 'TeleSign' ){
                        $request->merge(['mobile_otp' => $response['data']->verification_code ]);
                    }
                }
            }
        }
    }

    /**
     * @param $request
     * @param $record
     */
    public function afterStoreLoadModel($request,$record)
    {

    }

    /**
     * Get Single Record hook
     * This function is run before a model load
     * @param {object} $request
     * @param {string} $slug
     */
    public function beforeShowLoadModel($request,$slug)
    {
        if( $request['user']->slug != $slug ){
            $this->__apiResource = 'PublicUser';
        }
    }

    /**
     * @param $request
     * @param $record
     */
    public function afterShowLoadModel($request,$record)
    {

    }

    /**
     * Update Request Hook
     * This function is run before a model load
     * @param {object} $request
     * @param {string} $slug
     */
    public function beforeUpdateLoadModel($request,$slug)
    {

    }

    /**
     * @param $request
     * @param $record
     */
    public function afterUpdateLoadModel($request,$record)
    {

    }

    /**
     * Delete Request Hook
     * This function is run before a model load
     * @param {object} $request
     * @param {string} $slug
     */
    public function beforeDestroyLoadModel($request,$slug)
    {

    }

    /**
     * @param $request
     * @param $slug
     */
    public function afterDestroyLoadModel($request,$slug)
    {

    }

    public function verifyCode()
    {
        $request = $this->__request;
        $param_rules['code'] = 'required';
        $response = $this->__validateRequestParams($request->all(),$param_rules);

        if( $this->__is_error )
            return $response;

        if( env('SMS_SANDBOX',1) != 1){
            $sms = new Sms;
            $response = $sms->getInstance()->checkVerification($request['code'],$request['user']->mobile_no);
            if( $response['code'] != 200 ){
                $this->__is_error = true;
                return $this->__sendError(__('app.validation_msg'),['message' => $response['message'] ],400);
            }
        }

        User::updateUser($request['user']->id,
            [ 'is_mobile_verify' => 1 ,
              'mobile_verify_at' => Carbon::now(),
              'mobile_otp' => NULL] );

        //get updated token record
        $user = User::getUserByApiToken($request['api_token']);

        $this->__is_collection = false;
        $this->__is_paginate   = false;

        return $this->__sendResponse($user,200,__('app.otp_verified'));
    }

    public function resendCode()
    {
        $request = $this->__request;
        if( env('SMS_SANDBOX',1) != 1){
            $sms = new Sms;
            $response = $sms->getInstance()->sendVerificationCode($request['user']->mobile_no);
            if( $response['code'] != 200 ){
                $this->__is_error = true;
                return $this->__sendError(__('app.validation_msg'),['message' => __('app.invalid_mobile_no') ],400);
            }else{
                if( env('SMS_DRIVER') == 'TeleSign' ){
                    User::where('id',$request['user']->id)->update(['mobile_otp' => $response['data']->verification_code ]);
                }
            }
        }

        $this->__is_paginate   = false;
        $this->__is_collection = false;

        return $this->__sendResponse($request['user'],200,__('app.resend_otp_msg'));
    }

    public function login()
    {
        $request = $this->__request;
        $param_rule['email']        = 'required|email';
        $param_rule['password']     = 'required';
        $param_rule['device_type']  = 'required|in:android,ios,web';
        $param_rule['device_token'] = 'required';


        $response = $this->__validateRequestParams($request->all(),$param_rule);
        if( $this->__is_error )
            return $response;

        $user = User::getUserByEmail($request['email']);
        if( !isset($user->id) )
            return $this->__sendError(__('app.validation_msg'),['message' => __('app.login_failed_msg')] ,400);
        if( !Hash::check($request['password'],$user->password) )
            return $this->__sendError(__('app.validation_msg'),['message' => __('app.login_failed_msg')] ,400);
        if( $user->status != 1)
            return $this->__sendError(__('app.validation_msg'),['message' => __('app.account_disabled')], 400);
        if( env('VERIFICATION_TYPE') != 'none'){
            if( env('VERIFICATION_TYPE') == 'email' && $user->is_email_verify != 1){
                return $this->__sendError(__('app.validation_msg'),['message' => __('app.email_not_verified')], 400);
            }
            if( env('VERIFICATION_TYPE') == 'mobile' && $user->is_mobile_verify != 1){
                return $this->__sendError(__('app.validation_msg'),['message' => __('app.mobile_not_verified')], 400);
            }
        }
        //update device token
        $api_token = User::updateDeviceToken($request,$user);
        //get updated token record
        $user = User::getUserByApiToken($api_token);



        $this->__is_collection = false;
        $this->__is_paginate   = false;
        return $this->__sendResponse($user,200,__('app.login_success_msg'));
    }

    public function forgotPassword()
    {
        $request = $this->__request;
        $param_rule['email'] = 'required|email';

        $response = $this->__validateRequestParams($request->all(),$param_rule);
        if( $this->__is_error )
            return $response;

        $record = User::ForgotPassword($request['email']);
        if( $record == false )
            return $this->__sendError(__('app.validation_msg'),['message' => __('app.invalid_email')], 400);

        // if( env('VERIFICATION_TYPE') != 'none'){
        //     if( env('VERIFICATION_TYPE') == 'email' && $record->is_email_verify != 1){
        //         return $this->__sendError(__('app.validation_msg'),['message' => __('app.email_not_verified')], 400);
        //     }
        // }

        $this->__is_collection = false;
        $this->__is_paginate   = false;
        return $this->__sendResponse($record,200,__('app.forgot_password_success_msg'));
    }

    public function changePassword()
    {
        $request = $this->__request;
        $custom_messages = [
            'password.regex' => __('app.password_regex')
        ];
        $param_rule['current_password'] = 'required';
        $param_rule['new_password']     = [
            'required',
            'different:current_password',
            'regex:/^(?=.*[A-Z])(?=.*[!@#$&*])(?=.*[0-9])(?=.*[a-z]).{8,150}$/'
        ];
        $param_rule['confirm_password'] = 'required|same:new_password';

        $response = $this->__validateRequestParams($request->all(),$param_rule,$custom_messages);
        if( $this->__is_error )
            return $response;

        if( !Hash::check($request['current_password'],$request['user']->password) )
            return $this->__sendError(__('app.validation_msg'),['message' => __('app.invalid_old_password') ]);

        //update user new password
        User::updateUser($request['user']->id,['password' => Hash::make($request['new_password'])]);
        //delete api token
        UserApiToken::where('api_token','!=',$request['api_token'])->where('user_id',$request['user']->id)->forceDelete();

        $this->__is_paginate   = false;
        $this->__is_collection = false;

        return $this->__sendResponse($request['user'],200,__('app.password_success_msg'));
    }

    public function socialLogin()
    {
        $request = $this->__request;

        $param_rule['name']          = 'nullable|min:3|max:50';
        $param_rule['email']         = 'nullable|email';
        $param_rule['platform_id']   = 'required|max:255';
        $param_rule['platform_type'] = 'required|in:facebook,google,apple';
        $param_rule['device_type']   = 'required|in:android,ios';
        $param_rule['device_token']  = 'required';
        $param_rule['image_url']     = 'nullable|url';

        $response = $this->__validateRequestParams($request->all(),$param_rule);
        if( $this->__is_error )
            return $response;

        $user = User::socialUser($request->all());

        //update device token
        $deviceTokenData['platform_type'] = !empty($this->__request['platform_type']) ? $this->__request['platform_type'] : 'custom';
        $deviceTokenData['platform_id'] = !empty($this->__request['platform_id']) ? $this->__request['platform_id'] : NULL;
        $api_token = User::updateDeviceToken($request,$user,$this->__request['platform_type']);
        //get updated token record
        $user = User::getUserByApiToken($api_token);

        $getSetting = NotificationSetting::getSetting($user->id);
        // print_r($getSetting); die;
        if ($getSetting['update_notification'] == 1) {
          //update notification setting
          $params['notification_setting']['Reactions'] = 1;
          $params['notification_setting']['Comments'] = 1;
          $params['notification_setting']['Tags'] = 1;
          $params['notification_setting']['Follow_Requests'] = 1;
          if ($request['user_type'] == "artist") {
              $params['notification_setting']['Received_Tokens'] = 1;
              $params['notification_setting']['Messages'] = 1;
          }
          $params['user_id'] = $user->id;
          NotificationSetting::storeNewUserSetting($params);
        }




        $this->__is_collection = false;
        $this->__is_paginate   = false;
        return $this->__sendResponse($user,200,__('app.login_success_msg'));
    }

    public function userLogout()
    {
        $request = $this->__request;
        User::userLogout($request->all());

        $this->__collection  = false;
        $this->__is_paginate = false;
        return $this->__sendResponse([],200,__('app.logout_msg'));
    }
    public function userBlock()
    {
        $request = $this->__request;
        $param_rules['target_id'] = 'required|exists:users,id';
        $response = $this->__validateRequestParams($request->all(), $param_rules);

        if($this->__is_error == true)
            return $response;

        $data = UserBlock::blockUnBlock($request->all());
        $msg = $data['is_delete'] ? 'The user has been unblocked successfully' : 'The user has been blocked successfully';

        $this->_apiResource    = 'PublicUser';
        $this->__is_collection = false;
        $this->__is_paginate   = false;
        return $this->__sendResponse($data,200,__('app.login_success_msg'));


        $this->__is_collection = false;
        $this->__is_paginate   = false;
        return $this->__sendResponse($data['data'],200,$msg);
    }

    public function userPublicSetting(Request $request)
    {
        $request = $this->__request;
        $param_rules['is_public'] = 'required|in:0,1';
        $response = $this->__validateRequestParams($request->all(), $param_rules);

        if($this->__is_error == true)
            return $response;
        $data = User::updateUserPublicSetting($request['user']->slug,$request->is_public,$request['user']->api_token);

        $this->_apiResource    = 'PublicUser';
        $this->__is_collection = false;
        $this->__is_paginate   = false;
        return $this->__sendResponse($data,200,__('record has been updated'));

    }


    public function dataTruncate(Request $request)
    {
        if( \App::environment(['local', 'staging']) ) {
            if($request['password'] != 'admin@123')
                return $this->__sendError('validation Message',['message' => 'invalid credential'],400);

            \DB::statement('SET FOREIGN_KEY_CHECKS=0;');

            \DB::table('block_users')->truncate();
            \DB::table('block_users')->truncate();
            \DB::table('chat_messages')->truncate();
            \DB::table('chat_message_delete')->truncate();
            \DB::table('chat_message_status')->truncate();
            \DB::table('chat_rooms')->truncate();
            \DB::table('chat_room_users')->truncate();
            \DB::table('dislikes')->truncate();
            \DB::table('faqs')->truncate();
            \DB::table('followers')->truncate();
            \DB::table('jobs')->truncate();
            \DB::table('media')->truncate();
            \DB::table('notification')->truncate();
            \DB::table('notification_setting')->truncate();
            \DB::table('posts')->truncate();
            \DB::table('post_tag_users')->truncate();
            \DB::table('reset_password')->truncate();
            \DB::table('users')->truncate();
            \DB::table('user_api_token')->truncate();
            \DB::table('user_block')->truncate();
            \DB::table('user_coins')->truncate();
            \DB::table('user_coin_support')->truncate();
            \DB::table('user_comments')->truncate();
            \DB::table('user_like')->truncate();
            \DB::table('user_reports')->truncate();
            \DB::table('user_subscription')->truncate();

            \DB::statement('SET FOREIGN_KEY_CHECKS=1;');

            $this->__is_paginate = false;
            $this->__collection  = false;

            return $this->__sendResponse([],200, 'Data has been deleted successfully');
        }
        else {
            return abort(404);
        }
    }
}
