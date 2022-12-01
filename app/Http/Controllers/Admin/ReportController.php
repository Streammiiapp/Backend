<?php

namespace App\Http\Controllers\Admin;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Validator;
use Illuminate\Validation\Rule;

class ReportController extends CRUDCrontroller
{
    public function __construct(Request $request)
    {
        parent::__construct('UserReport');
        $this->__request    = $request;
        $this->__data['page_title'] = 'Post Reports';
        $this->__indexView  = 'report.index';
        $this->__createView = 'report.add';
        $this->__editView   = 'report.edit';
        $this->__detailView = 'report.detail';
        $request['module'] = 'posts';
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
        $postSlug  = '<a href="'. route('post-management.show',['post_management' => $record->post['slug'] ]) .'">'.$record->post['post_type'].'</a>';
        return [
            $record->username,
            $record->reportType->title,
            $postSlug,
            $record->reason,
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
