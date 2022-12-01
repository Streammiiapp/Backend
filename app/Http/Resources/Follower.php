<?php

namespace App\Http\Resources;

use Illuminate\Http\Resources\Json\JsonResource;
use App\Models\UserCoinSupport; 
use Illuminate\Support\Facades\Storage;

class Follower extends JsonResource
{
    /**
     * Transform the resource into an array.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return array
     */
    public function toArray($request)
    {
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
            'name'                  => $this->name,
            'username'              => $this->username,
            'slug'                  => $this->slug,
            'email'                 => $this->email,
            'mobile_no'             => $this->mobile_no,
            'image_url'             => $image_url,
            'status'                => $this->status,
            'is_email_verify'       => $this->is_email_verify,
            'is_mobile_verify'      => $this->is_mobile_verify,
            'country'               => $this->country,
            'state'                 => $this->state,
            'city'                  => $this->city,
            'zipcode'               => $this->zipcode,
            'address'               => $this->address,
            'latitude'              => $this->latitude,
            'longitude'             => $this->longitude,
            'api_token'             => $this->api_token,
            'device_type'           => $this->device_type,
            'device_token'          => $this->device_token,
            'platform_type'         => $this->platform_type,
            'platform_id'           => $this->platform_id,
            'created_at'            => $this->created_at,
            'artist_type_id'        => $this->artist_type_id,
            'music_genre_id'        => $this->music_genre_id,
            'user_type'             => $this->user_type,
            'bio'                   => $this->bio,
            'gender'                => $this->gender,
            'date_of_birth'         => $this->date_of_birth,
            'facebook_url'          => $this->facebook_url,
            'instagram_url'         => $this->instagram_url,
            'twitter_url'           => $this->twitter_url,
            'snapchat_url'          => $this->snapchat_url,
            'youtube_url'           => $this->youtube_url,
            'weblink_url'           => $this->weblink_url,
            'artist_type'           => \App\Models\ArtistType::getArtistType($this->artist_type_id),
            'music_genre'           => \App\Models\MusicGenre::getMusicGenre($this->music_genre_id),
            'is_first_login'        => $this->is_first_login,
            'total_post'            => $this->total_post,
            'no_of_followers'       => (int)$this->no_of_followers,
            'no_of_following'       => (int)$this->no_of_following,
            'no_of_token_received' => UserCoinSupport::getUserSupportCoin($this->id,'received'),
            'no_of_token_supported' => UserCoinSupport::getUserSupportCoin($this->id,'sender'),
            'total_coins'  => $this->total_coins,
            'total_coins' =>$this->total_coins,
            'following'             => $this->is_follow,
            'user_follow_id'        =>$this->user_follow_id,

        ];
    }
}
