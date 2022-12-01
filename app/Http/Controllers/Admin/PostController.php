<?php

namespace App\Http\Controllers\Admin;

use App\Models\Comment;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Validator;
use Illuminate\Validation\Rule;

class PostController extends CRUDCrontroller
{
    public function __construct(Request $request)
    {
        parent::__construct('Post');
        $this->__request    = $request;
        $this->__data['page_title'] = 'Post';
        $this->__indexView  = 'post.index';
        $this->__createView = 'post.add';
        $this->__editView   = 'post.edit';
        $this->__detailView = 'post.detail';
    }

    /**
     * This function is used for validate data
     * @param string $action
     * @param string $slug
     * @return array|\Illuminate\Contracts\Validation\Validator
     */
    public function validation(string $action, string $slug='')
    {
        $validator = [];
        switch ($action){
            case 'POST':
                $validator = Validator::make($this->__request->all(), [
                    'attribute' => 'required',
                ]);
                break;
            case 'PUT':
                $validator = Validator::make($this->__request->all(), [
                    '_method'   => 'required|in:PUT',
//                    'attribute' => 'required',
                ]);
                break;
        }
        return $validator;
    }

    /**
     * This function is used for before the index view render
     * data pass on view eg: $this->__data['title'] = 'Title';
     */
    public function beforeRenderIndexView()
    {

    }

    /**
     * This function is used to add data in datatable
     * @param object $record
     * @return array
     */
    public function dataTableRecords($record)
    {
        $options  = '<a href="'. route('post-management.edit',['post_management' => $record->slug]) .'" title="Edit" class="btn btn-xs btn-primary"><i class="fa fa-pencil"></i></a> ';
        $options  .= '<a href="'. route('post-management.show',['post_management' => $record->slug ]) .'" title="Detail" class="btn btn-xs btn-primary"><i class="fa fa-eye"></i></a> ';
        $options .= '<a title="Delete" class="btn btn-xs btn-danger _delete_record"><i class="fa fa-trash"></i></a>';

        return [
            '<input type="hidden" name="record_id[]" class="record_id" value="'. $record->slug .'">'.$record->users->name,
            $record->post_type,
            $record->total_comment,
            $record->total_like,
            $record->status == 1 ? '<span class="btn btn-xs btn-success">Active</span>' : '<span class="btn btn-xs btn-danger">Disabled</span>',
            $options
        ];
    }

    /**
     * This function is used for before the create view render
     * data pass on view eg: $this->__data['title'] = 'Title';
     */
    public function beforeRenderCreateView()
    {

    }

    /**
     * This function is called before a model load
     */
    public function beforeStoreLoadModel()
    {

    }

    /**
     * This function is used for before the edit view render
     * data pass on view eg: $this->__data['title'] = 'Title';
     * @param string @slug
     */
    public function beforeRenderEditView($slug)
    {

    }

    /**
     * This function is called before a model load
     */
    public function beforeUpdateLoadModel()
    {

    }

    /**
     * This function is called before a model load
     */
    public function beforeRenderDetailView($record)
    {
        $base_url      = \URL::to('/');
        $default_image = \URL::to('images/default-user-placeholder.jpg');
        $query = Comment::with(['child'])->select('user_comments.*')
            ->selectRaw("u.name AS username, u.name, u.username AS user_slug,
              IF(u.image_url IS NOT NULL,CONCAT('$base_url',image_url),'$default_image') AS user_image_url,
              IF(u.image_url IS NOT NULL,CONCAT('$base_url',image_url),'$default_image') AS image_url")
            ->join('users AS u','u.id','=','user_comments.user_id')
            ->where('user_comments.module','posts')
            ->where('user_comments.module_id',$record->id)
            ->where('u.status',1)
            ->where('user_comments.deleted_at',null)
            ->where('user_comments.parent_id',0)
            ->orderBy('user_comments.id','asc')
            ->get();

        $this->__data['comments'] = $query;
    }

    /**
     * This function is called before a model load
     */
    public function beforeDeleteLoadModel()
    {

    }

    public function deleteComment(Request $request){

        $child = Comment::where('parent_id',$request->id)->get();

        if(count($child)>0){
            $child->each->delete();
            Comment::find($request->id)->delete();
        }else{
            Comment::find($request->id)->delete();
        }
        return response()->json(['code' => 200,'message' => 'delete record successfully'],200);

    }
}
