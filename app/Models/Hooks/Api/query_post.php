
        if (!empty($request['check_post_type']) && $request['check_post_type'] == 'like_user_post') {
            $getBlockUserIds = $this->getBlockUserIds($request['user']->id);
            $query->select('posts.*')->with(['users','post_tagusers','userCoinSupport']);
            $query->join('users AS post_user','post_user.id','=','posts.user_id');
            $query->selectRaw("IF(ul.id IS NOT NULL,1,0) AS is_user_like,
                        ul.id AS user_like_id, ul.user_id AS like_user_id")
                    ->join('users AS u','u.id','=','posts.user_id')
                    ->leftJoin('user_like AS ul',function($leftJoin) use ($request){
                    $leftJoin->on('ul.module_id','=','posts.id')
                        ->where('ul.module','=','posts')
                        ->where('ul.user_id','=',$request['user']->id);
                    })
                    ->selectRaw("IF(udl.id IS NOT NULL,1,0) AS is_user_dislike,
                        udl.id AS user_dislike_id")
                        ->leftJoin('dislikes AS udl',function($leftJoin) use ($request){
                            $leftJoin->on('udl.module_id','=','posts.id')
                                    ->where('udl.module','=','posts')
                                    ->where('udl.user_id','=',$request['user']->id);
                        });
                if( isset($getBlockUserIds->block_user_id)  && !empty($getBlockUserIds->block_user_id) ){
                    $query->whereNotIn('posts.user_id',explode(',',$getBlockUserIds->block_user_id));
                }

                $query->join('user_like','user_like.module_id','posts.id')
                      ->where('user_like.user_id',$request['user_id']);

                $query->whereNull('posts.deleted_at');
                $query->whereNull('post_user.deleted_at');

    }else{
        $checkFriend = Follower::friendExist($request['user_id'],$request['user']->id);
        if( !$checkFriend && !empty($request['user_id'])){
            if ($request['user']->id != $request['user_id']) {
                $query->where('posts.id',0);
            }
            if ($request['user']->id == $request['user_id']) {
                $query->where('posts.user_id',$request['user_id']);
            }
        } else {
            $getBlockUserIds = $this->getBlockUserIds($request['user']->id);
            $query->select('posts.*')->with(['post_tagusers','userCoinSupport']);
            $query->join('users AS post_user','post_user.id','=','posts.user_id');
            $query->selectRaw("IF(ul.id IS NOT NULL,1,0) AS is_user_like,
                        ul.id AS user_like_id, ul.user_id AS like_user_id")
                    ->join('users AS u','u.id','=','posts.user_id')
                    ->leftJoin('user_like AS ul',function($leftJoin) use ($request){
                    $leftJoin->on('ul.module_id','=','posts.id')
                        ->where('ul.module','=','posts')
                        ->where('ul.user_id','=',$request['user']->id);
                    })
                    ->selectRaw("IF(udl.id IS NOT NULL,1,0) AS is_user_dislike,
                        udl.id AS user_dislike_id")
                        ->leftJoin('dislikes AS udl',function($leftJoin) use ($request){
                            $leftJoin->on('udl.module_id','=','posts.id')
                                    ->where('udl.module','=','posts')
                                    ->where('udl.user_id','=',$request['user']->id);
                        });

            $query->with('users');
            //get user own post
            if(!$request->isMethod('post') && !empty($request['user_id']) ){
                $query->where('posts.user_id',$request['user_id']);
            } else {
                //except block user post
                if( isset($getBlockUserIds->block_user_id)  && !empty($getBlockUserIds->block_user_id) ){
                    $query->whereNotIn('posts.user_id',explode(',',$getBlockUserIds->block_user_id));
                }
                if( !empty($report_ids) ){
                    //$query->whereNotIn('posts.id',$report_ids);
                }
            }

            if ( empty( $request['user_id'] ) ) {
                $followers = Follower::getFollowers($request->user->id);
                $followers_array_ids = array();
                if($followers){
                    foreach ($followers as $followersItem){
                        $followers_array_ids[] = $followersItem->target_id;
                    }
                }
                $followers_array_ids[]  = $request->user->id;
                if( $request['media_type'] == 'audio' || $request['media_type'] == 'video' ){
                    $query->where(function($where) use ($followers_array_ids){
                        $where->orWhereIn('posts.user_id', $followers_array_ids);
                        $where->orWhere('u.is_public','1');
                    });
                } else {
                    $query->whereIn('posts.user_id', $followers_array_ids);
                }
            }

            if( $request['media_type'] == 'audio' || $request['media_type'] == 'video' )
                $query->where('posts.media_type', $request['media_type']);

            if(isset($request['keyword']) && !empty($request['keyword']) ){
                $keyword = $request['keyword'];
                $query->where( function($where) use ($keyword) {
                    $where->orWhere('posts.title','like',"%$keyword%");
                    $where->orWhere('posts.address','like',"%$keyword%");
                    $where->orWhere('post_user.name','like',"%$keyword%");
                });
            }
            if($request['screen_name'] == "search" && empty($request['keyword'])){
                $query->where('posts.id','=','0');
            }

             if (!empty($request['check_post_type']) && !empty($request['tag_user_id'])) {
                    $query->join('post_tag_users AS ptu','ptu.post_id','=','posts.id')
                    ->where('ptu.user_id',$request['tag_user_id']);
                }

            if (!empty($request['post_id'])) {
                $query->where('posts.id',$request['post_id']);
            }

            $query->whereNull('posts.deleted_at');
            $query->whereNull('post_user.deleted_at');
        }
    }
