<?php

namespace App\Http\Controllers\Api;

use App\Models\{Follower,User,Notification,NotificationSetting};
use Validator;
use Illuminate\Validation\Rule;
use Illuminate\Http\Request;
use App\Http\Controllers\RestController;

class FollowerController extends RestController
{

    public function __construct(Request $request)
    {
        parent::__construct('Follower');
        $this->__request     = $request;
        $this->__apiResource = 'Follower';
    }

    /**
     * This function is used for validate restfull request
     * @param $action
     * @param string $slug
     * @return array
     */
    public function validation($action,$slug=0)
    {
        $validator = [];
        switch ($action){
            case 'POST':
                $validator = Validator::make($this->__request->all(), [
                    'actor_id'        => 'required|exists:users,id',
                    'target_id'        => 'required|exists:users,id',
                    'status'        => 'required',
                ]);
                break;
            case 'PUT':
                $validator = Validator::make($this->__request->all(), [
                    'attribute'     => 'required',
                ]);
                break;
        }
        return $validator;
    }

    /**
     * @param $request
     */
    public function beforeIndexLoadModel($request)
    {

    }

    /**
     * @param $request
     * @param $record
     */
    public function afterIndexLoadModel($request,$record)
    {

    }

    /**
     * @param $request
     */
    public function beforeStoreLoadModel($request)
    {
        if($request->user->id == $request->target_id) {
            $this->__is_error = true;
            return $this->__sendError(__('app.validation_msg'),['message' => __('app.yourself_error') ],400);
        }
        $checkRecord = Follower::getFollower($request['user']->id,$request['target_id']);
        if( isset($checkRecord->id) ){
            if( $checkRecord->status == 1 ) {
                $this->__is_error = true;
                return $this->__sendError(__('app.validation_msg'),['message' => __('app.follower_already_error') ],400);
            } else if ( $checkRecord->status == 0 ){
                $this->__is_error = true;
                return $this->__sendError(__('app.validation_msg'),['message' => __('app.follower_already_sent_error') ],400);
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
     * @param $request
     * @param $slug
     */
    public function beforeShowLoadModel($request,$slug)
    {

    }

    /**
     * @param $request
     * @param $record
     */
    public function afterShowLoadModel($request,$record)
    {

    }

    /**
     * @param $request
     * @param $slug
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
     * @param $request
     * @param $slug
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

    public function destroy($target_user_id)
    {
        $actor_id = $this->__request['user']->id;
        $checkRecord = Follower::whereRaw("(actor_id = {$actor_id} AND target_id = {$target_user_id}) OR (actor_id = {$target_user_id} AND target_id = {$actor_id})")->first();
        if( !isset($checkRecord->id) )
        return $this->__sendError(__('app.validation_msg'),['message' => __('app.invalid_record_id_error') ],400);

        $user = Follower::deleteFollowRequest($checkRecord->id,$this->__request->all());

        $this->__is_paginate   = false;
        $this->__is_collection = false;
        $this->_apiResource    = 'PublicUser';
        return $this->__sendResponse($user,200,__('app.success_delete_message'));
    }

    public function getFollowRequest(Request $request)
    {
        $users = Follower::getFollowRequest($request['user']->id);
        $this->_apiResource    = 'PublicUser';
        return $this->__sendResponse($users,200,'Request follow list');
    }


    public function acceptRequest(Request $request)
    {
        $param_rules['user_id'] = 'required';

        $response = $this->__validateRequestParams($request->all(), $param_rules);

        if($this->__is_error == true)
            return $response;

        $checkFollowRequest = Follower::checkFollowRequest($request['user_id'],$request['user']->id);
        if( !isset($checkFollowRequest->id) )
            return $this->__sendError('Validation Message',['message' => 'Invalid record id'],400);

        //accept follow request
        $user = Follower::acceptFollowRequest($checkFollowRequest->id);

        $targetUsers = User::getUserApiTokenByID($request['user_id']);
        $userBadge   = Notification::getBadge($request['user_id']);
        if (count($targetUsers) > 0) {
            if ($request['user_id'] = $targetUsers[0]->id) {
                $getNotificationSetting = NotificationSetting::getSetting($targetUsers[0]->id);
                $getRequestCount = Follower::getRequestCount($targetUsers[0]->id);

                if ($getNotificationSetting['Follow_Requests'] == 1) {
                    $notification_data = [
                        'actor'            => $request['user'],
                        'actor_type'      => 'users',
                        'target'           => $targetUsers,
                        'target_type'      => 'users',
                        'title'            => env('APP_NAME'),
                        'message'          => ''.$request['user']->name.' has accepted your request',
                        'reference_id'     => $request['user']->id,
                        'reference_module' => 'user_follow',
                        'redirect_link'    => NULL,
                        'badge'            => $userBadge
                    ];
                    $custom_data = [
                        'record_id'     => $request['user']->id,
                        'redirect_link' => NULL,
                        'request_count' => $getRequestCount,
                        'identifier'    => 'disliked your',
                    ];
                    Notification::sendPushNotification('accepted_follow_request',$notification_data,$custom_data,$targetUsers[0]->device_type);
                }
            }
        }
        $this->__is_paginate   = false;
        $this->__is_collection = false;
        $this->_apiResource    = 'PublicUser';

        return $this->__sendResponse($user,200,'Request has been accepted successfully');
    }


    public function getRequestCount(Request $request)
    {
        $getRequestCount = Follower::getRequestCount($request['user']->id);
        $totalbadge['request_count'] = $getRequestCount;
        $this->__is_paginate = false;
        $this->__collection  = false;

        return $this->__sendResponse($totalbadge, 200, __('app.success_listing_message'));
    }
}
