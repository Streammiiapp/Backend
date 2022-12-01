<?php

namespace App\Http\Resources;

use Illuminate\Http\Resources\Json\JsonResource;

class ArtistType extends JsonResource
{
    /**
     * Transform the resource into an array.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return array
     */

    public function toArray($request)
    {
        if ($this->image != '') {
            $image = url('images/artist_types').'/'.$this->image;
        } else {
            $image = url('images/artist_types').'/no-user-image-found.png';
        }
        $response = [
            'id' => $this->id,
            'title' => $this->title,
            'image' => $image,
            'created_at' => date('m-d-Y', strtotime($this->created_at)),
        ];

        return $response;
    }
}
