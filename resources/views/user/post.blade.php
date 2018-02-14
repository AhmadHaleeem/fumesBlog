@extends('user/app')

@section('bg-img', Storage::disk('local')->url($post->image))
@section('head')
    <link rel="stylesheet" href="{{ asset('user/css/prism.css') }}">

@endsection
@section('title', $post->title)
@section('subHeading',  $post->subtitle )

@section('main-content')
    <div id="fb-root"></div>
    <script>(function(d, s, id) {
            var js, fjs = d.getElementsByTagName(s)[0];
            if (d.getElementById(id)) return;
            js = d.createElement(s); js.id = id;
            js.src = 'https://connect.facebook.net/en_GB/sdk.js#xfbml=1&version=v2.11&appId=130820037584873';
            fjs.parentNode.insertBefore(js, fjs);
        }(document, 'script', 'facebook-jssdk'));</script>
    <!-- Post Content -->
    <article>
        <div class="container">
            <div class="row">
                <div class="col-lg-8 col-md-10 mx-auto">
                    <small style="margin-bottom: 20px"><span style="color: #DA4939">Created at </span>{{ $post->created_at->diffForHumans() }}</small>

                    <br>
                    {!! $post->body !!}

                    {{-- tag clouds--}}
                    <div>
                        <div class="pull-left col-md-6 col-sm-12" style='margin-top: 40px'>
                            <h3 style="margin-bottom: 1em">Tag Clouds</h3>
                            @foreach($post->tags as $tag)
                                <a href="tag/{{ $tag->slug }}"> <small  style="margin-top: 40px;margin-right: 20px;color: gray; border-radius: 5px; border: 1px solid gray;padding: 7px;">{{ $tag->name}}  </small></a>
                            @endforeach
                        </div>
                        <div class="pull-right col-md-6  col-sm-12" style='margin-top: 40px'>
                            <h3 style="margin-bottom: 1em">Category Clouds</h3>
                            @foreach($post->categories as $cat)
                                <small  class="" style="margin-top: 40px;margin-right: 20px;color: gray; border-radius: 5px; border: 1px solid gray;padding: 7px;"><a href="category/{{ $cat->slug }}"> {{ $cat->name}} </a></small>
                            @endforeach
                        </div>
                    </div>

                </div>
                <div style="margin-top: 50px" class="fb-comments" data-href="{{ Request::url() }}" data-numposts="5"></div>
            </div>
        </div>
    </article>

    @section('footer')

        <script src="{{ asset('user/js/prism.js') }}"></script>

    @endsection
@endsection