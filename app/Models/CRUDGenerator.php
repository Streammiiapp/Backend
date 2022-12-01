<?php

namespace App\Models;

use Illuminate\Support\Facades\Cache;

trait CRUDGenerator
{
    private $_request;
    /**
     * This function is used for save record
     *
     * @param  {array} $data
     * @param  {object} $request
     * @return Response
     */
    public function createRecord($request,$data = [])
    {
        $this->_request = $request;
        if(!empty($data)){
            //before create record request hook
            if(method_exists($this->loadHook(),'hook_before_add'))
                $this->loadHook()->hook_before_add($request,$data);
            //filter column
            $data = $this->fill($data);
            //create record
            $record = self::create($data->toArray());
            //after create record request hook
            if(method_exists($this->loadHook(),'hook_after_add'))
                $this->loadHook()->hook_after_add($request,$record);
            //delete old cache data
            //set response
            return $this->getRecordBySlug($request,$record->slug);
        }
    }

    /**
     * This function is used for get record
     *
     * @param {object} $request
     * @param {array} $filterParams (optional)
     * @return Response
     */
    public function getRecords($request)
    {
        $this->_request = $request;
        $query = self::select();
        if(method_exists($this->loadHook(),'hook_query_index'))
            $this->loadHook()->hook_query_index($query,$request);

        $limit = $request->input('limit',config('constants.PAGINATION_LIMIT'));
        $data = $query->orderBy($request->input('sort_column',$this->table .'.' .$this->primaryKey),$request->input('sort_order','desc'))->paginate($limit);
        return $data;
    }

    /**
     * This function is used for get record by id
     *
     * @param {object} $request
     * @param  {sting} $slug
     * @return Response
     */
    public function getRecordBySlug($request,$slug)
    {
        $this->_request = $request;
        $query = self::select();
        if(method_exists($this->loadHook(),'hook_query_index'))
            $this->loadHook()->hook_query_index($query,$request,$slug);

        $data = $query->where($this->table . '.slug',$slug)->first();
        return $data;
    }

    /**
     * This function is used for update record
     *
     * @param {object} $request
     * @param {slug} $slug
     * @param {array} $data
     * @return Response
     */
    public function updateRecord($request, $slug, $data=[])
    {
        $this->_request = $request;
        if(!empty($data)){
            //before update record request hook
            if(method_exists($this->loadHook(),'hook_before_edit'))
                $this->loadHook()->hook_before_edit($request, $slug, $data);
            //filter column
            $data = $this->fill($data);
            //update record
            self::where('slug',$slug)->update($data->toArray());
            //after create record request hook
            if(method_exists($this->loadHook(),'hook_after_edit'))
                $this->loadHook()->hook_after_edit($request, $slug);

            return $this->getRecordBySlug($request,$slug);
        }
        return $data;
    }

    /**
     * This function is used for delete record
     *
     * @param  {int} $id
     * @return Response
     */
    public function deleteRecord($request, $slug)
    {
        $this->_request = $request;
        if( !is_array($slug) )
            $slug = [$slug];
        //before request hook
        if(method_exists($this->loadHook(),'hook_before_delete'))
            $this->loadHook()->hook_before_delete($request, $slug );
        //get record
        $records = self::whereIn('slug',$slug )->get();
        //delete cache items
        if( count($records) ){
            //delete record
            self::whereIn('slug',$slug)->delete();
            //after request hook
            if(method_exists($this->loadHook(),'hook_after_delete'))
                $this->loadHook()->hook_after_delete($request, $records);
            }
        return true;
    }

    public function dataTableRecords($request)
    {
        $this->_request = $request;
        $query = self::select('*');
        if(method_exists($this->loadHook(),'hook_query_index'))
            $this->loadHook()->hook_query_index($query,$request);

        $data['total_record'] = count($query->get());
        $query = $query->take($request['length'])->skip($request['start'])->orderBy('id','desc');
        $query = $query->get();
        $data['records'] = $query;
        return $data;
    }

    /**
     *  This function is used load hook
     * @return class instance
     */
    public function loadHook()
    {
        $className = explode('\\',get_class($this));
        $className = end($className) . 'Hook';
        if( $this->_request->is('api/*') )
            $hook = '\App\Models\Hooks\Api\\' . $className;
        else
            $hook = '\App\Models\Hooks\Admin\\' . $className;
        return new $hook($this);
    }
}
