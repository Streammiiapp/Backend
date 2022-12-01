<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use App\Models\Notification;
use App\Models\NotificationSetting;
use App\Models\{User,Follower};
use Illuminate\Http\Request;

class NotificationController extends Controller
{

    public function __construct()
    {
        $this->__apiResource = 'Notification';
    }

    public function index(Request $request)
    {
        $records = Notification::getUserNotifications($request->all());
        return $this->__sendResponse($records,200,__('app.success_listing_message'));
    }

    public function update(Request $request,$unique_id)
    {
        $record = Notification::updateNotification($request->all(),$unique_id);

        $this->__is_collection = false;
        $this->__is_paginate   = false;
        return $this->__sendResponse($record,200,__('app.success_update_message'));
    }

    public function sendNotification(Request $request)
    {
        $params = $request->all();

        $param_rule['target_id'] = 'required|exists:users,id';

        $response = $this->__validateRequestParams($params,$param_rule);
        if( $this->__is_error )
            return $response;

        $targetUsers = User::getUserApiTokenByID($params['target_id']);
        $userBadge   = Notification::getBadge($params['target_id']);
        $getRequestCount = Follower::getRequestCount($targetUsers[0]->id);

        if( count($targetUsers) ){
            //send push notification to research center
            $notification_data = [
                'actor'            => $params['user'],
                'actor_type'      => 'users',
                'target'           => $targetUsers,
                'target_type'      => 'users',
                'title'            => env('APP_NAME'),
                'message'          => __('app.test_notification_msg'),
                'reference_id'     => 0,
                'reference_module' => 'identifier',
                'redirect_link'    => NULL,
                'badge'            => $userBadge
            ];
            $custom_data = [
                'record_id'     => 0,
                'redirect_link' => NULL,
                'identifier'    => 'identifier',
                'request_count' => $getRequestCount,

            ];
            Notification::sendPushNotification('identifier',$notification_data,$custom_data,$targetUsers[0]->device_type);
        }

        $this->__is_paginate = false;
        $this->__collection  = false;

        return $this->__sendResponse([],200,__('app.success_listing_message'));
    }

    public function saveNotificationSetting(Request $request)
    {
        $param_rule['notification_setting']   = 'required';
        $param_rule['notification_setting.*'] = 'required|in:1,0';

        $response = $this->__validateRequestParams($request->all(),$param_rule);
        if( $this->__is_error )
            return $response;

        NotificationSetting::saveSetting($request->all());

        $user = User::getUserByApiToken($request['user']->api_token);
        $this->__is_paginate = false;
        $this->__is_collection = false;
        $this->__apiResource = 'Auth';

        return $this->__sendResponse($user,200,__('app.success_store_message'));
    }

    public function getNotificationSetting(Request $request)
    {
        $records = NotificationSetting::getSetting($request['user']->id);
        $user = User::getUserByApiToken($request['user']->api_token);
        $this->__is_paginate = false;
        $this->__is_collection = false;
        $this->__apiResource = 'Auth';

        return $this->__sendResponse($user,200,__('app.login_success_msg'));
    }

    public function getNotificationCount(Request $request){
        $records = Notification::getBadge($request['user']->id);
        $getRequestCount = Follower::getRequestCount($request['user']->id);
        $totalbadge['badge_count'] = $records;
        $totalbadge['request_count'] = $getRequestCount;
        $totalbadge['message_counter'] = User::getChatMessageCounter($request['user']->id);

        $this->__is_paginate = false;
        $this->__collection  = false;

        return $this->__sendResponse($totalbadge, 200, __('app.success_listing_message'));
    }
}
