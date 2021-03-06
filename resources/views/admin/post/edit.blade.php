@extends('admin/layouts/app')

@section('headSection')
    <link rel="stylesheet" href="{{ asset("admin/bower_components/select2/dist/css/select2.min.css") }}">

@endsection

@section('main-content')

    <div class="content-wrapper">
        <!-- Content Header (Page header) -->
        <section class="content-header">
            <h1>
                Text Editors
                <small>Advanced form element</small>
            </h1>
            <ol class="breadcrumb">
                <li><a href="#"><i class="fa fa-dashboard"></i> Home</a></li>
                <li><a href="#">Forms</a></li>
                <li class="active">Editors</li>
            </ol>
        </section>

        <!-- Main content -->
        <section class="content">
            <div class="row">
                <div class="col-md-12">

                    <div class="box box-primary">
                        <div class="box-header with-border">
                            <h3 class="box-title">Titles</h3>
                        </div>
                    @include('includes/messages')
                    <!-- /.box-header -->
                        <!-- form start -->
                        <form role="form" action="{{ route('post.update', $post->id) }}" method="post" enctype="multipart/form-data">
                            {{ csrf_field() }}
                            {{ method_field('PUT') }}
                            <div class="box-body">
                                <div class="col-lg-6">
                                    <div class="form-group">
                                        <label for="title">Post Title</label>
                                        <input type="text" class="form-control" name="title" id="title" placeholder="Title" value="{{ $post->title }}">
                                    </div>

                                    <div class="form-group">
                                        <label for="subtitle">Post Sub Title</label>
                                        <input type="text" class="form-control" name="subtitle" id="subtitle" placeholder="Subtitle" value="{{ $post->subtitle }}">
                                    </div>

                                    <div class="form-group">
                                        <label for="slug">Post Slug </label>
                                        <input type="text" class="form-control" name="slug" id="slug" placeholder="Slug" value="{{ $post->slug }}">
                                    </div>
                                </div>

                                <div class="col-lg-6">
                                    <div class="form-group">
                                        <div class="pull-right" style="margin-top: 10px">
                                            <label for="Image">File input</label>
                                            <input type="file" name="image" id="Image">
                                        </div>
                                    </div>

                                    <div class="checkbox pull-left">
                                        <label>
                                            <input type="checkbox" name="status" value="1" {{ $post->status === 1 ? 'checked' : ''}}> Publish
                                        </label>
                                    </div>
                                    <br>
                                    <br>
                                    <div class="form-group" style="margin-top: 8px">
                                        <label>Select Tags</label>
                                        <select name="tags[]" class="form-control select2 select2-hidden-accessible" multiple="" data-placeholder="Select a State" style="width: 100%;" tabindex="-1" aria-hidden="true">
                                            @foreach($tags as $tag)
                                                <option value="{{ $tag->id }}"
                                                    @foreach($post->tags as $postTag)
                                                        @if($postTag->id === $tag->id)
                                                                selected
                                                        @endif
                                                    @endforeach
                                                >{{ $tag->name }}</option>
                                            @endforeach
                                        </select>
                                    </div>

                                    <div class="form-group" style="margin-top: 8px">
                                        <label>Select Category</label>
                                        <select name="cats[]" class="form-control select2 select2-hidden-accessible" multiple="" data-placeholder="Select a State" style="width: 100%;" tabindex="-1" aria-hidden="true">

                                            @foreach($categories as $cat)
                                                <option value="{{ $cat->id }}"
                                                    @foreach($post->categories as $postCats)
                                                            @if ($postCats->id === $cat->id)
                                                                    selected
                                                            @endif
                                                    @endforeach
                                                >{{ $cat->name }}</option>
                                            @endforeach

                                        </select>
                                    </div>
                                </div>

                            </div>


                            <!-- /.box-body -->

                            <div class="box">
                                <div class="box-header">
                                    <h3 class="box-title">Write Post Body Here
                                        <small>Simple and fast</small>
                                    </h3>
                                    <!-- tools box -->
                                    <div class="pull-right box-tools">
                                        <button type="button" class="btn btn-default btn-sm" data-widget="collapse" data-toggle="tooltip"
                                                title="Collapse">
                                            <i class="fa fa-minus"></i>
                                        </button>
                                    </div>
                                </div>




                                <!-- /.box-header -->
                                <div class="box-body pad">
                                      <textarea id="editor1" class="textarea" placeholder="Place some text here" name="body"
                                                style="width: 100%; height: 200px; font-size: 14px; line-height: 18px; border: 1px solid #dddddd; padding: 10px;">{!! $post->body !!}</textarea>
                                </div>
                            </div>

                    </div>
                    <!-- /.col-->
                    <div class="box-footer">
                        <button type="submit" class="btn btn-primary">Submit</button>
                        <a type="button" href="{{ route('post.index') }}" class="btn btn-warning">Back</a>
                    </div>
                    </form>
                </div>

            </div>
            <!-- ./row -->
        </section>
        <!-- /.content -->
    </div>
@endsection


@section('footerSection')
    <script src="{{ asset("admin/bower_components/select2/dist/js/select2.full.min.js") }}"></script>
    <script src="{{ asset('admin/ckeditor/ckeditor.js') }}"></script>
    <script>
        $(function () {
            CKEDITOR.replace( 'editor1' );

        });
    </script>
    <script>
        $(document).ready(function () {
            $('.select2').select2();
        });
    </script>
@endsection