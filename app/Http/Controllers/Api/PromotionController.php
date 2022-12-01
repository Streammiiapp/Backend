<?php

namespace App\Http\Controllers\Api;

use Validator;
use Illuminate\Validation\Rule;
use Illuminate\Http\Request;
use App\Http\Controllers\RestController;
use App\Models\User;

class PromotionController extends RestController
{

    public function __construct(Request $request)
    {
        parent::__construct('Promotion');
        $this->__request     = $request;
        $this->__apiResource = 'Promotion';
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
                    'music_genres_id'        => 'required|integer',
                    'promotion_status'        => 'required|in:50_coins,125_coins',
                    'post_id'                => 'required|integer',

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
        if ($request->promotion_status == "50_coins") {
            $coins = '50';
        }else{
            $coins = '125';
        }

        $getUserCoins = User::find($request['user']->id);
        if ($getUserCoins->total_coins < $coins) {
            $this->__is_error = true;
            return $this->__sendError(__('app.validation_msg'),['message' => __('app.promotion_insufficient_coins_error') ],400);

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
}
