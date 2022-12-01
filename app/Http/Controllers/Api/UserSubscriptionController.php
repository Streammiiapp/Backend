<?php

namespace App\Http\Controllers\Api;

use Validator;
use Illuminate\Validation\Rule;
use Illuminate\Http\Request;
use App\Http\Controllers\RestController;
use App\Models\UserSubscription;
use App\Models\User;

class UserSubscriptionController extends RestController
{

    public function __construct(Request $request)
    {
        parent::__construct('UserSubscription');
        $this->__request     = $request;
        $this->__apiResource = 'UserSubscription'; 
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
                    'subscription_package_id' => 'required|in:1,2',
                    'gateway_request'         => 'json', 
                    'gateway_response'        => 'required|json',
                    'device_type'             => 'required',
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
     */
    public function beforeStoreLoadModel($request)
    {

    }

    /**
     * @param $request
     */
    public function beforeShowLoadModel($request,$slug)
    {

    }

    /**
     * @param $request
     */
    public function beforeUpdateLoadModel($request,$slug)
    {

    }

    /**
     * @param $request
     */
    public function beforeDestroyLoadModel($request,$slug)
    {

    }

    public function storeUserSubscription(Request $request)
    {
        $this->__apiResource = 'Auth'; 

        $param_rules['subscription_package_id'] = 'required'; 
        $param_rules['gateway_request']         = 'json';
        $param_rules['gateway_response']        = 'required|json';
        $param_rules['device_type']             = 'required';

        $response = $this->__validateRequestParams($request->all(), $param_rules);

        if($this->__is_error == true)
            return $response;

        $gateway_response = json_decode($request['gateway_response'],true);  

        if( $request['device_type'] == 'android' ){
            $data_android =  json_decode($gateway_response['transactionReceipt'],true);
            $gateway_response['transactionId'] = $data_android['orderId'];
            
            $gateway_response['original_transaction_id'] = $gateway_response['purchaseToken'];
        }else{
            $gateway_response['transactionId'] = $gateway_response['transaction_id'];
            $gateway_response['original_transaction_id'] = $gateway_response['original_transaction_id'];
        }   

        $checkSubscription = UserSubscription::checkSubscription($gateway_response['original_transaction_id']);

        $data = UserSubscription::addUserSubscription($request->all());
            
        if($data['error'] == 1){
            return $this->__sendError('Error Message',['message' => $data['message']], 400);
        }

        $this->__is_collection  = false;
        $this->__is_paginate    = false;

        $user = User::getUserByEmail($request->user->email);
        return $this->__sendResponse($user,200, 'User has been subscribe successfully');     

    }
}
