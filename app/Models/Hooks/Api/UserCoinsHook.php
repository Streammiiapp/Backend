<?php

namespace App\Models\Hooks\Api;
use App\Models\{SubscriptionPackages,User};

class UserCoinsHook
{
    private $_model;

    public function __construct($model)
    {
        $this->_model = $model;
    }

    /*
   | ----------------------------------------------------------------------
   | Hook for manipulate query of index result
   | ----------------------------------------------------------------------
   | @query   = current sql query
   | @request = laravel http request class
   |
   */
    public function hook_query_index(&$query,$request, $slug='') {
        //Your code here
    }

    /*
    | ----------------------------------------------------------------------
    | Hook for manipulate data input before add data is execute
    | ----------------------------------------------------------------------
    | @arr
    |
    */
    public function hook_before_add($request,&$postdata)
    {
        $getDecodeJsonGateWayResponse = json_decode($postdata['gateway_response']);
        if ($postdata['gateway_type'] == 'ios') {
            $postdata['transaction_id'] = $getDecodeJsonGateWayResponse->transaction_id;
            $postdata['gateway_original_transaction_id'] = $getDecodeJsonGateWayResponse->original_transaction_id;
            $postdata['product_id'] = $getDecodeJsonGateWayResponse->product_id;
        }else{
            $postdata['transaction_id'] = $getDecodeJsonGateWayResponse->transactionId;
            $postdata['gateway_original_transaction_id'] = 0;
            $postdata['product_id'] = $getDecodeJsonGateWayResponse->productId;
        }

        $SubscriptionPackages = SubscriptionPackages::where('identifier',$postdata['gateway_type'])->where('slug',$postdata['product_id'])->first();
        $postdata['subscription_package_id'] = $SubscriptionPackages->id;
        $postdata['slug'] = uniqid();
        $postdata['user_id'] = $request['user']->id;
        $postdata['gateway_transaction_id'] = $postdata['transaction_id'];
        $postdata['gateway_original_transaction_id'] = $postdata['gateway_original_transaction_id'];
        $postdata['gateway_type'] = $request['gateway_type'];
        $postdata['gateway_response'] = $request['gateway_response'];
        $postdata['coin'] = $SubscriptionPackages->coins;
        $postdata['amount'] = $SubscriptionPackages->amount;

    }

    /*
    | ----------------------------------------------------------------------
    | Hook for execute command after add public static function called
    | ----------------------------------------------------------------------
    | @record
    |
    */
    public function hook_after_add($request,$record)
    {
          User::where('id',$record->user_id)
        ->increment('total_coins',$record->coin);
    }

    /*
    | ----------------------------------------------------------------------
    | Hook for manipulate data input before update data is execute
    | ----------------------------------------------------------------------
    | @request  = http request object
    | @postdata = input post data
    | @id       = current id
    |
    */
    public function hook_before_edit($request, $slug, &$postData)
    {

    }

    /*
    | ----------------------------------------------------------------------
    | Hook for execute command after edit public static function called
    | ----------------------------------------------------------------------
    | @request  = Http request object
    | @$slug    = $slug
    |
    */
    public function hook_after_edit($request, $slug) {
        //Your code here
    }

    /*
    | ----------------------------------------------------------------------
    | Hook for execute command before delete public static function called
    | ----------------------------------------------------------------------
    | @request  = Http request object
    | @$id      = record id = int / array
    |
    */
    public function hook_before_delete($request, $slug) {
        //Your code here

    }

    /*
    | ----------------------------------------------------------------------
    | Hook for execute command after delete public static function called
    | ----------------------------------------------------------------------
    | @$request       = Http request object
    | @records        = deleted records
    |
    */
    public function hook_after_delete($request,$records) {
        //Your code here
    }

    public function create_cache_signature($request)
    {
        $cache_params = $request->except(['user','api_token']);
        return 'ArtistTypeHook' . md5(implode('',$cache_params));
    }
}
