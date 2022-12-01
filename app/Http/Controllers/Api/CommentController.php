<?php

namespace App\Http\Controllers\Api;

use Validator;
use Illuminate\Validation\Rule;
use Illuminate\Http\Request;
use App\Http\Controllers\RestController;
use App\Models\Comment;
class CommentController extends RestController
{

    public function __construct(Request $request)
    {
        parent::__construct('Comment');
        $this->__request     = $request;
        $this->__apiResource = 'Comment';
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
                    'module'    => 'required|in:posts,user_comments',
                    'module_id' => 'required',
                    'comment'   => 'required|min:1|max:1000',
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
        $CheckUser = Comment::checkUserComment($request['user']->id,$slug);
        if ($CheckUser == 0) {
            $this->__is_error = true;
            return $this->__sendError(__('app.validation_msg'),['message' => __('app.delete_error') ],400);
        }
        Comment::decrementUserCommentCount($request['user']->id,$slug);
    }

    /**
     * @param $request
     * @param $slug
     */
    public function afterDestroyLoadModel($request,$slug)
    {

    }
}
