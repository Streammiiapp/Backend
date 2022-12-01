<?php

namespace App\Http\Controllers\Api;

use Validator;
use Illuminate\Validation\Rule;
use Illuminate\Http\Request;
use App\Http\Controllers\RestController;
use App\Models\{Like,DisLike};

class LikeController extends RestController
{

    public function __construct(Request $request)
    {
        parent::__construct('Like');
        $this->__request     = $request;
        //print_r($this->__request->all()); die;

        $this->__apiResource = 'Like';
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
                    'attribute'        => 'required',
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


    public function addLike()
    {
        $request = $this->__request;
        $param_rules['module']           = 'required|in:posts,user_comments';
        $param_rules['module_id']        = 'required|numeric';
        $response = $this->__validateRequestParams($request->all(),$param_rules);

        if( $this->__is_error )
            return $response;
        
        $record = Like::addOrDeleteLike($request->all());
        
        $message = __('app.success_store_message');
        $this->_apiResouce     = 'Post';
        $this->__is_paginate   = false;
        $this->__is_collection = false;
        return $this->__sendResponse($record,200,$message);    

    }

    public function addDisLike()
    {
        $request = $this->__request;
        $param_rules['module']           = 'required|in:posts,user_comments';
        $param_rules['module_id']        = 'required|numeric';
        $response = $this->__validateRequestParams($request->all(),$param_rules);

        if( $this->__is_error )
            return $response;
        
        $record = DisLike::addOrDeleteDisLike($request->all());
        $message = __('app.success_store_message');
        $this->_apiResouce     = 'Post';
        $this->__is_paginate   = false;
        $this->__is_collection = false;
        return $this->__sendResponse($record,200,$message);    

    }

    public function getLikeOrDislike(){
        $request = $this->__request;
        $param_rules['module']           = 'required|in:posts,user_comments';
        $param_rules['reaction_type']    = 'required|in:like,dislike';
        $param_rules['module_id']        = 'required|numeric';
        $response = $this->__validateRequestParams($request->all(),$param_rules);

        if( $this->__is_error )
            return $response;

        if($request->reaction_type == "like"){
            $record = Like::getLikeUsers($request->all()); 
        }else{
            $record = DisLike::getDisLikeUsers($request->all());
        }
        $message = __('app.success_listing_message');
        $this->__is_paginate   = false;
        $this->__is_collection = false;
        return $this->__sendResponse($record,200,$message); 

    }

}
