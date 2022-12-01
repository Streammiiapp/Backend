<?php

namespace App\Http\Controllers\Api;

use Validator;
use Illuminate\Validation\Rule;
use Illuminate\Http\Request;
use App\Http\Controllers\RestController;
use App\Models\{Post,Follower};
use DB;
use Carbon\Carbon;

class PostController extends RestController
{

    public function __construct(Request $request)
    {

        parent::__construct('Post');
        $this->__request     = $request;
        $this->__apiResource = 'Post';
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
                //dd(config('constants.VID_THUMB_STORAGE_PATH'));
                $validator = Validator::make($this->__request->all(), [
                    'user_id'        => 'required|exists:users,id',
                    //'title'        => 'required',
                    //'latitude'        => 'required',
                   // 'longitude'        => 'required',
                    'media_file'        => 'required',
                    'media_type'        => 'required',
                ]);
                break;
            case 'PUT':
                $validator = Validator::make($this->__request->all(), [
                    // 'media_file'        => 'required',
                    // 'media_type'        => 'required',
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
        // $checkFriendExist = Follower::friendExist($request->user_id,$request->user->id);
        // if ($checkFriendExist == 0) {
        //     $this->__is_error = true;
        //     return $this->__sendError(__('app.validation_msg'),['message' => __('app.private_account') ],400);
        // }
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
        // $checkUserPost = Post::checkAuthUserPost($request,$slug);
        // if($checkUserPost == 0){
        //     $this->__is_error = true;
        //     return $this->__sendError(__('app.validation_msg'),['message' => __('app.delete_error') ],400);
        // }

        $checkAutoGenPost = Post::checkAutoGenPost($request,$slug);
        if($checkAutoGenPost > 0){
            $this->__is_error = true;
            return $this->__sendError(__('app.validation_msg'),['message' => __('app.post_delete_error') ],400);
        }

    }

    /**
     * @param $request
     * @param $slug
     */
    public function afterDestroyLoadModel($request,$slug)
    {
        $getpost = DB::table('posts')->where('slug',$slug)->where('deleted_at','!=',NULL)->first();
        $getpostcomment = DB::table('user_comments')->where('module','posts')->where('module_id',$getpost->id)->get();
        if (!empty($getpostcomment)) {
            for ($i=0; $i < count($getpostcomment); $i++) {
                DB::table('user_comments')->where('module','user_comments')->where('module_id',$getpostcomment[$i]->id)->update(['deleted_at'=>Carbon::now()]);
                DB::table('notification')->where('reference_module','user_comment')->where('reference_id',$getpostcomment[$i]->id)->delete();
            }
        }
        DB::table('user_comments')->where('module','posts')->where('module_id',$getpost->id)->update(['deleted_at'=>Carbon::now()]);
        DB::table('post_tag_users')->where('post_id',$getpost->id)->update(['deleted_at'=>Carbon::now()]);
        DB::table('user_like')->where('module','posts')->where('module_id',$getpost->id)->update(['deleted_at'=>Carbon::now()]);
        DB::table('dislikes')->where('module','posts')->where('module_id',$getpost->id)->update(['deleted_at'=>Carbon::now()]);
        ///notification delete///

        DB::table('notification')->where('reference_module','post_dislike')->where('reference_id',$getpost->id)->delete();
        DB::table('notification')->where('reference_module','comment_dislike')->where('reference_id',$getpost->id)->delete();
        DB::table('notification')->where('reference_module','post_like')->where('reference_id',$getpost->id)->delete();
        DB::table('notification')->where('reference_module','comment_like')->where('reference_id',$getpost->id)->delete();
        DB::table('notification')->where('reference_module','post_comment')->where('reference_id',$getpost->id)->delete();
        DB::table('notification')->where('reference_module','post_tag')->where('reference_id',$getpost->id)->delete();
        DB::table('notification')->where('reference_module','support_artist')->where('reference_id',$getpost->id)->delete();


    }
}
