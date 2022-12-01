<?php

namespace App\Http\Controllers\Api;

use Validator;
use Illuminate\Validation\Rule;
use Illuminate\Http\Request;
use App\Http\Controllers\RestController;
use App\Models\{ReportType,UserReport};

class UserReportController extends RestController
{

    public function __construct(Request $request)
    {
        parent::__construct('UserReport');
        $this->__request     = $request;
        $this->__apiResource = 'UserReport'; 
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
                    'module'        => 'required',
                    'module_id'     => 'required',    
                    'report_type_id'=>'required',
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
        $checkRecord = UserReport::getReportUser($request['user']->id,$request['module'],$request['module_id']);
        if($checkRecord > 0 ){
            $this->__is_error = true;
            return $this->__sendError(__('app.validation_msg'),['message' => __('app.report_already_error') ],400);
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

    public function getReportTypeList()
    {
        $getReportList = ReportType::all();
        $this->__is_collection = false;
        $this->__is_paginate   = false;
        return $this->__sendResponse($getReportList, 200, 'User has been blocked successfully');
    }

    
}
