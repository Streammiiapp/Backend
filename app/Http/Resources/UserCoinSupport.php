<?php

namespace App\Http\Resources;

use Illuminate\Http\Resources\Json\JsonResource;
use App\Http\Resources\Auth as AuthRes;
use App\Models\User as UserModel;

class UserCoinSupport extends JsonResource
{
    /**
     * Transform the resource into an array.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return array
     */
    public function toArray($request)
    {
        return [
            'id'                  => $this->id,
            'reference_id'        => $this->post_id,
            'coins'               => $this->coins,
            'sender'              => new AuthRes(UserModel::getUserByID2($this->sender_id)),
            'reciever'            => new AuthRes(UserModel::getUserByID2($this->receiver_id)),
        ];
    }
}
