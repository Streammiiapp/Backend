<?php

namespace App\Http\Controllers\Admin;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Validator;
use Illuminate\Validation\Rule;

class ArtistController extends CRUDCrontroller
{
    public function __construct(Request $request)
    {
        parent::__construct('User');
        $request->merge(["user_type"=>"artist"]);
        $this->__request    = $request;
        $this->__data['page_title'] = 'Artist';
        $this->__indexView  = 'artist.index';
        $this->__createView = 'artist.add';
        $this->__editView   = 'artist.edit';
        $this->__detailView = 'artist.detail';
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
                    'attribute' => 'required',
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
        $options  = '<a href="'. route('artist-management.edit',['artist_management' => $record->slug]) .'" title="Edit" class="btn btn-xs btn-primary"><i class="fa fa-pencil"></i></a> ';
        $options .= '<a title="Delete" class="btn btn-xs btn-danger _delete_record"><i class="fa fa-trash"></i></a> ';
        $image = is_file(public_path($record->image_url)) ? url($record->image_url) : asset("images/default-user-placeholder.jpg");
        return [
            '<input type="hidden" name="record_id[]" class="record_id" value="'. $record->slug .'">'."<img src='{$image}' width='50px' height='50px' >",
            $record->name,
            $record->email,
            $record->mobile_no,
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
    public function beforeRenderDetailView()
    {

    }

    /**
     * This function is called before a model load
     */
    public function beforeDeleteLoadModel()
    {

    }
}
