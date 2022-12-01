<?php

namespace App\Http\Resources;

use Illuminate\Http\Resources\Json\JsonResource;
use App\Models\User as UserModel;

class UserBlock extends JsonResource
{
    /**
     * Transform the resource into an array.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return array
     */
    public function toArray($request)
    {
        return $this->getUserBySlug($request);
    }

    public function getUserBySlug($request)
    {
        $userModel = new UserModel;
        if( \Route::currentRouteName() == 'user-block.index' ){
            $user = PublicUser::collection($userModel->getUserHookBYID($request));
        } else {
            $user = new PublicUser($userModel->getUserHookBYID($request,$request->target_id));
        }
        return $user;
    }
}
