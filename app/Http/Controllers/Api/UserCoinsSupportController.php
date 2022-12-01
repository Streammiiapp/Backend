<?php

namespace App\Http\Controllers\Api;

use Validator;
use Illuminate\Validation\Rule;
use Illuminate\Http\Request;
use App\Http\Controllers\RestController;
use App\Models\{User,UserCoinSupport};

class UserCoinsSupportController extends RestController
{

    public function __construct(Request $request)
    {
        parent::__construct('UserCoinSupport');
        $this->__request      = $request;
        $this->__apiResource  = 'UserCoinSupport';
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
                    'receiver_id' => 'required|exists:users,id',
                    'post_id'      => 'required|exists:posts,id',
                    'coins'        => 'required|integer',
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
        $getUserCoins = User::find($request['user']->id);
        if ($getUserCoins->total_coins < $request->coins) {
            $this->__is_error = true;
            return $this->__sendError(__('app.validation_msg'),['message' => __('app.insufficient_coins_error') ],400);

        }
    }

    /**
     * @param $request
     * @param $record
     */
    public function afterStoreLoadModel($request,$record)
    {
        $this->__apiResource  = 'ChangeUserCoinSupport';

        // $record = User::getUserByApiId($request->user->id);
        // // print_r($record); die;
        // $this->_apiResouce     = 'PublicUser';
        // //$this->__is_collection = false;
        // $this->__collection = false;
        // $this->__is_paginate   = false;
        // return $this->__sendResponse($record,200,__('app.success_store_message'));
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
    public function beforeUpdateLoadModel($request, $slug)
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
    public function beforeDestroyLoadFaq($request,$slug)
    {

    }

    /**
     * @param $request
     * @param $slug
     */
    public function afterDestroyLoadModel($request,$slug)
    {

    }

    public function getPostSupportArtist(){
        $request = $this->__request;
        $param_rules['post_id'] = 'required|exists:posts,id';
        $response = $this->__validateRequestParams($request->all(),$param_rules);

        if( $this->__is_error )
            return $response;

        $record = UserCoinSupport::getgetPostSupportArtistList($request->all());

        $message = __('app.success_listing_message');
        $this->__is_paginate   = false;
        $this->__is_collection = false;
        return $this->__sendResponse($record,200,$message);

    }
}
