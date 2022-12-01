<?php

namespace App\Http\Controllers\Api;

use App\Models\Follower;
use App\Models\UserBlock;
use Validator;
use Illuminate\Validation\Rule;
use Illuminate\Http\Request;
use App\Http\Controllers\RestController;

class UserBlockController extends RestController
{

    public function __construct(Request $request)
    {
        parent::__construct('UserBlock');
        $this->__request     = $request;
        $this->__apiResource = 'UserBlock'; 
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
                    'target_id'        => 'required|exists:users,id',
                ]);
                break;
            case 'PUT':
                $validator = Validator::make($this->__request->all(), [
                    'target_id'        => 'required|exists:users,id',
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
     * @param $request
     */
    public function beforeStoreLoadModel($request)
    {
        $this->__apiResource = 'PublicUser';
        $checkRecord = UserBlock::getBlockUser($request['user']->id,$request['target_id']);
        if( isset($checkRecord->id) ){
            $this->__is_error = true;
            return $this->__sendError(__('app.validation_msg'),['message' => __('app.block_already_error') ],400);
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
        $checkRecord = UserBlock::whereRaw("(actor_id = {$actor_id} AND target_id = {$target_user_id})")->first();
        if( !isset($checkRecord->id) )
            return $this->__sendError(__('app.validation_msg'),['message' => __('app.invalid_record_id_error') ],400);

        $user = UserBlock::deleteUserBlock($checkRecord->id,$this->__request->all());
        
        $this->__request['target_id'] = $target_user_id;
        $this->__is_paginate   = false;
        $this->__is_collection = false;
        $this->_apiResource    = 'UserBlock';
        return $this->__sendResponse($user,200,__('app.success_delete_message'));
    }

    public function store()
    {
        $request = $this->__request;
        $param_rule['target_id'] = 'required|exists:users,id';
        $response = $this->__validateRequestParams($request->all(),$param_rule);
        if( $this->__is_error )
            return $response;

        $checkRecord = UserBlock::getBlockUser($request['user']->id,$request['target_id']);
        if( isset($checkRecord->id) ){
            $this->__is_error = true;
            return $this->__sendError(__('app.validation_msg'),['message' => __('app.block_already_error') ],400);
        }
         
        $record = UserBlock::addBlockUser($request->all());
        
        $this->__apiResource   = 'PublicUser';
        $this->__is_collection = false;
        $this->__is_paginate   = false;
        
        return $this->__sendResponse($record, 200, 'User has been blocked successfully');
    }

    public function index()
    {
        $request = $this->__request;
        $records = UserBlock::getBlockUsers($request['user']->id);

        $this->__apiResource   = 'PublicUser';
        return $this->__sendResponse($records, 200, 'User has been blocked successfully');
    }


    
}
