<?php

namespace App\Http\Resources;

use Illuminate\Http\Resources\Json\JsonResource;
use Illuminate\Support\Facades\Storage;

class Notification extends JsonResource
{
    /**
     * Transform the resource into an array.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return array
     */
    public function toArray($request)
    {
        if(!empty($this->actor_image_url)){
            if ($this->actor_driver == 'local') {
                $image_url = url($this->actor_image_url);
            }else{
                $image_url = Storage::url($this->actor_image_url);
            }
        }else{

            $image_url = url('images/default-user-placeholder.jpg');
        }

          return [
                'id'=>$this->id,
                'unique_id'=>$this->unique_id,
                'identifier'=>$this->identifier,
                'actor_id'=>$this->actor_id,
                'actor_slug'=>$this->actor_slug,
                'actor_type'=>$this->actor_type,
                'target_id'=>$this->target_id,
                'target_type'=>$this->target_type,
                'reference_id'=>$this->reference_id,
                'reference_module'=>$this->reference_module,
                'title'=>$this->title,
                'description' => $this->notificatinMessage($this->identifier,$this->description),
                'web_redirect_link'=>$this->web_redirect_link,
                'is_read'=>$this->is_read,
                'is_view'=>$this->is_view,
                'created_at'=>$this->created_at,
                'updated_at'=>$this->updated_at,
                'actor_name'=>$this->actor_name,
                'actor_email'=>$this->actor_email,
                'actor_image_url'=>$image_url, 
          ];
    }

    public function notificatinMessage($identifier,$description)
    {
        $message = '';
        if( $identifier == 'accepted_follow_request' ){
            $message = 'has accepted your request';
        } else if( $identifier == 'comment_dislike' ){
            $message = 'disliked your comment';

        } else if( $identifier == 'comment_like' ){
            $message = 'liked your comment';

        } else if( $identifier == 'followers' ){
            $message = 'started following you';

        } else if( $identifier == 'post_comment' ){
            $message = 'commented on your post';

        } else if( $identifier == 'post_dislike' ){
            $msg = explode(' ',$description);
            $postType = end($msg);
            $message = 'disliked your post';

        } else if( $identifier == 'post_like' ){
            $msg = explode(' ',$description);
            $postType = end($msg);
            $message = ' liked your  post';

        } else if( $identifier == 'post_tag' ){
            $message = 'tagged you on his post.';

        } else if( $identifier == 'support_artist' ){
            $msg = explode(' ',$description);
            end($msg);
            $coin = prev($msg);
            $message = 'supported with '.$coin.' tokens.';
        }else{
            $message = 'reply on your comment';
        }
        return $message;
    }
}
