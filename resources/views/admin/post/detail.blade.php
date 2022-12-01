@extends('admin.master')
@section('content')
{{--    @dd($comments)--}}
    <section class="main-content">
        <div class="row">
            <div class="col-md-4">
                <div class="widget white-bg">
                    <div class="padding-20 text-center">
                        <img alt="Profile Picture" class="rounded-circle mar-btm margin-b-10 circle-border " src="{{ is_file(public_path($record->users->image_url)) ? asset($record->users->image_url) : asset("images/default-user-placeholder.jpg") }}" style="width:150px;height:150px;">
                        <p class="lead font-500 margin-b-0">{{ $record->users->name }}</p>
                        <hr>
                        <ul class="list-unstyled margin-b-0 text-center row">
                            <li class="col-4">
                                <span class="font-600">{{ $record->total_comment }}</span>
                                <p class="text-muted text-sm margin-b-0">Comments</p>
                            </li>
                            <li class="col-4">
                                <span class="font-600">{{ $record->total_like }}</span>
                                <p class="text-muted text-sm margin-b-0">Likes</p>
                            </li>
                        </ul>
                    </div>
                </div>
            </div>
            <div class="col-8">
                <div class="card">
                    <div class="card-header card-default">
                        Post
                    </div>
                    <div class="card-body">
                        @if($record->media_type == "video")
                            <video class="embed-responsive" poster="{{asset($record->media_thumbnail_url)}}" controls controlsList="nodownload">
                                <source src="{{ asset($record->media_file) }}" type="video/mp4">
                            </video>
                            @else
                            <audio class="embed-responsive" controls>
                                <source src="{{ asset($record->media_file) }}" type="audio/mpeg">
                            </audio>
                        @endif
                    </div>
                </div>
                <div class="card">
                    <div class="card-body">
                        <div class="card-default">Comments</div>
                        <br>
                        @if(count($comments)>0)
                            <div class="tab-content">
                                <div role="tabpanel" class="tab-pane active" id="timeline">
                                    <div class="widget white-bg">
                                        <ul class="comments-list list-unstyled clearfix">
                                            @foreach($comments as $comment)
                                                <li class="clearfix">
                                                    <img src="{{ $comment->image_url }}" alt="{{ $comment->name }}" width="70" class="rounded-circle circle-border">
                                                    <div class="content">
                                                        <div class="comments-header">
                                                            <strong>{{ $comment->name }}</strong>
                                                            <small class="text-muted">{{$comment->created_at->diffForHumans()}}</small>
                                                            <a title="Delete" class="btn btn-xs btn-danger _delete_record float-right" data-comment-id="{{$comment->id}}"><i class="fa fa-trash"></i></a>
                                                        </div>
                                                        <p>{{ $comment->comment }}</p>
                                                    </div>
                                                    @if(count($comment->child)>0)
                                                        <ul class="comments-list list-unstyled clearfix">
                                                            @foreach($comment->child as $child)
                                                            <li class="clearfix" style="border-bottom: none;padding: 0;margin: 0;">
                                                                <img src="{{ $child->image_url }}" class="avatar" alt="{{ $child->name }}">
                                                                <div class="content">
                                                                    <div class="comments-header">
                                                                        <strong>{{ $child->name }}</strong>
                                                                        <small class="text-muted">{{$child->created_at->diffForHumans()}}</small>
                                                                        <a title="Delete" class="btn btn-xs btn-danger _delete_record float-right" data-comment-id="{{$child->id}}"><i class="fa fa-trash"></i></a>
                                                                    </div>
                                                                    <p>{{ $child->comment }}</p>
                                                                </div>
                                                            </li>
                                                            @endforeach
                                                        </ul>
                                                    @endif
                                                </li>
                                            @endforeach
                                        </ul>
                                    </div>
                                </div>
                            </div>
                            @else
                            <p>No comments</p>
                        @endif
                    </div>
                </div>

            </div>
        </div>
        @include('admin.footer')
    </section>
@push('scripts')
    <script>
        $(document).on( 'click','._delete_record',function(e){
            e.preventDefault();
            // var slug = $(this).parent().parent().find('.record_id').val();
            let comment_id = $(this).data('comment-id');
            // alert($(this).data('comment-id'));

            alertify.confirm('Confirmation Alert', 'Are you sure you want to delete this record?', function(){
                //confirm
                let request_url = '{!! route('delete.comment') !!}';
                // console.log(request_url);
                ajaxRequest(request_url,'DELETE',{id:comment_id}).then( function(res){
                    // console.log(res);
                    $.toast({
                        heading: 'Success',
                        text: res.message,
                        icon: 'success',
                        position:'top-right',
                    })
                    window.location.reload();
                }).catch(err => alert(err.message))

            } , function(){
                //cancel
            });
        })
    </script>
@endpush
@endsection
