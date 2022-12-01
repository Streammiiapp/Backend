<?php

namespace App\Http\Resources;

use Illuminate\Http\Resources\Json\JsonResource;
use App\Models\User;

class UserCoins extends JsonResource
{
    /**
     * Transform the resource into an array.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return array
     */
    public function toArray($request)
    {
    //     return [
    //         'id'  => $this->id,
    //         'slug'=> $this->slug,
    //         'subscription_package_id' => $this->subscription_package_id,
    //         'user_id' => $this->user_id,
    //         'gateway_transaction_id' => $this->gateway_transaction_id,
    //         'gateway_original_transaction_id'=>$this->gateway_original_transaction_id,
    //         'gateway_type' => $this->gateway_type,
    //         'gateway_response' => json_decode($this->gateway_response),
    //         'coin' => $this->coin,
    //         'amount' => $this->amount,
    //         'created_at' => $this->created_at,
    //         'updated_at' => $this->updated_at,
    //         'updated_at' => $this->updated_at,
    //    ];

        return $this->getUserByID($request);
    }

    public function getUserByID($request)
    {
        $userModel = new User;
        $user = $userModel->getUserByApiToken($request->user->api_token);
        return $user;
    }
}
