<?php

namespace App\Http\Resources;

use Illuminate\Http\Resources\Json\JsonResource;
use App\Models\User as UserModel;
use App\Http\Resources\PublicUser as PublicUserRes;
use App\Http\Resources\UserCoinSupport as UserCoinSupportRes;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\URL;
use Illuminate\Support\Facades\Storage;

class Post extends JsonResource
{
    /**
     * Transform the resource into an array.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return array
     */
    public function toArray($request)
    {

        if(!empty($this->media_file)){
            if ($this->driver == 'local') {
                $media_file = url($this->media_file);
            }else{
                $media_file = Storage::url($this->media_file);

            }
        }else{
            $media_file = url('images/default-user-placeholder.jpg');
        }

        if(!empty($this->media_thumbnail_url)){
            if ($this->driver == 'local') {
                $media_thumbnail_url = url($this->media_thumbnail_url);
            }else{
                $media_thumbnail_url = Storage::url($this->media_thumbnail_url);

            }
        }else{
            $media_thumbnail_url = url('images/default-user-placeholder.jpg');
        }

        if(!empty($this->users->image_url)){
            if ($this->users->driver == 'local') {
                $user_image_url = url($this->users->image_url);
            }else{
                $user_image_url = Storage::url($this->users->image_url);

            }
        }else{
            $user_image_url = url('images/default-user-placeholder.jpg');
        }

        $user['id'] = $this->users->id;
        $user['name'] = $this->users->name;
        $user['image_url'] = $user_image_url;
        $user['slug'] = $this->users->slug;
        $user['username'] = $this->users->username;
        $user['total_post'] = $this->users->total_post;
        if (!empty($this->post_tagusers[0])) {
            $UserModel = UserModel::getByUserID($this->post_tagusers);
        }else{
            $UserModel = [];
        }
        return [
            'id'                       => $this->id,
            'post_identify'            =>$this->post_identify,
            'user_id'                  => $this->user_id,
            'title'                    => ($this->title == null) ?  "" : $this->title,
            'slug'                     => $this->slug,
            'post_type'                => $this->post_type,
            'latitude'                 => $this->latitude,
            'longitude'                => $this->longitude,
            'address'                  => ($this->address == null) ?  "" : $this->address,
            'media_file'               => $media_file,
            'media_thumbnail_url'      =>$media_thumbnail_url,
            'media_type'               => $this->media_type,
            'post_status'              => $this->post_status,
            'status'                   => $this->status,
            'total_comment'            => $this->total_comment,
            'total_like'               => $this->total_like,
            'total_dislike'            => $this->total_dislike,
            'total_token'              => 0,
            'total_votes'              => $this->total_votes,
            'created_at'               => $this->created_at,
            'updated_at'               => $this->updated_at,
            'post_meta_data'           => $this->post_meta_data,
            'total_post'               => $this->users->total_post,
            'is_user_like'             => $this->is_user_like,
            'user_like_id'             => $this->user_like_id,
            'is_user_dislike'          => $this->is_user_dislike,
            'user_dislike_id'          => $this->user_dislike_id,
            'user'                     => $user,
            'post_tagusers'            => $UserModel,
            'support_coin'             => $this->support_coin,
            'userCoinSupport_data'     =>  new UserCoinSupport($this->getCoinSupportData($this->id)),
        ];
    }

    public static function getCoinSupportData($post_id)
    {
        $query = DB::table('user_coin_support')->where('generated_post_id',$post_id)->first();
        return $query;
    }
}
