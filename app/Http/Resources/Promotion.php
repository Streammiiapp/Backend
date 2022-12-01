<?php

namespace App\Http\Resources;

use Illuminate\Http\Resources\Json\JsonResource;
use App\Http\Resources\Auth as AuthRes;
use App\Models\User as UserModel;

class Promotion extends JsonResource
{
    /**
     * Transform the resource into an array.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return array
     */
    public function toArray($request)
    {
        return new AuthRes(UserModel::getUserByApiId($this->user_id));
    }
}
