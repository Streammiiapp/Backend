<?php

namespace App\Http\Resources;

use Illuminate\Http\Resources\Json\JsonResource;
use Illuminate\Support\Facades\Storage;

class Comment extends JsonResource
{
    /**
     * Transform the resource into an array.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return array
     */
    public function toArray($request)
    {
        // return parent::toArray($request);
        if(!empty($this->image_url)){
            if ($this->driver == 'local') {
                $image_url = url($this->image_url);
            }else{
                $image_url = Storage::url($this->image_url);

            }
        }else{
            $image_url = url('images/default-user-placeholder.jpg');
        }
        return [
            'id'                    => $this->id,
            'parent_id'             => $this->parent_id,
            'user_id'               => $this->user_id,
            'module'                => $this->module,


            'module_id'                    => $this->module_id,
            'comment'             => $this->comment,
            'status'               => $this->status,
            'total_like'                => $this->total_like,



            'total_dislike'                    => $this->total_dislike,
            'reply_count'             => $this->reply_count,
            'created_at'               => $this->created_at,
            'updated_at'                => $this->updated_at,


            'deleted_at'                    => $this->deleted_at,
            'slug'             => $this->slug,
            'username'               => $this->username,
            'name'                => $this->name,

            'user_slug'                    => $this->user_slug,
            'image_url'             => $image_url,
            'is_user_like'               => $this->is_user_like,
            'user_like_id'                => $this->user_like_id,


            'is_user_dislike'                    => $this->is_user_dislike,
            'user_dislike_id'             => $this->user_dislike_id,
            'child'               => $this->child,

        ];
    }
}
