@extends('admin/layouts/app')
@section('headSection')
    <link rel="stylesheet" href="{{ asset('admin/bower_components/datatables.net-bs/css/dataTables.bootstrap.min.css') }}">

@endsection
@section('main-content')

    <div class="content-wrapper">
        <!-- Content Header (Page header) -->
        <section class="content-header">
            <h1>
                Blank page
                <small>it all starts here</small>
            </h1>
            <ol class="breadcrumb">
                <li><a href="#"><i class="fa fa-dashboard"></i> Home</a></li>
                <li><a href="#">Examples</a></li>
                <li class="active">Blank page</li>
            </ol>
        </section>

        <!-- Main content -->
        <section class="content">

            <!-- Default box -->
            <div class="box">
                <div class="box-header with-border">
                    <h3 class="box-title">Title</h3>

                    <div class="box-tools pull-right">
                        <button type="button" class="btn btn-box-tool" data-widget="collapse" data-toggle="tooltip"
                                title="Collapse">
                            <i class="fa fa-minus"></i></button>
                        <button type="button" class="btn btn-box-tool" data-widget="remove" data-toggle="tooltip" title="Remove">
                            <i class="fa fa-times"></i></button>
                    </div>
                </div>
                <div class="box-body">
                    <div class="box">
                        <div class="box-header">
                            <h3 class="box-title">Data Table With Full Features</h3>
                        </div>
                        <!-- /.box-header -->
                        <div class="box-body">
                            <table id="example1" class="table table-bordered table-striped">
                                <thead>

                                <tr style="text-align: center">
                                    <th>S.No</th>
                                    <th>Post Title</th>
                                    <th>Post Subtitle</th>
                                    <th>Post Slug</th>

                                    <th>Post Status</th>
                                    <th>Posted By</th>
                                    <th>Created at</th>
                                    @can('posts.update', Auth::user())
                                        <th>Edit</th>
                                    @endcan
                                    @can('posts.delete', Auth::user())
                                        <th>Delete</th>
                                    @endcan

                                </tr>
                                </thead>
                                <tbody>
                                @foreach($posts as $post)

                                    {{--@php--}}

                                        {{--if ($post->posted_by === NULL) {--}}
                                            {{--$post->posted_by === 'Done';--}}
                                        {{--}--}}
                                    {{--@endphp--}}
                                    <tr style="text-align: center">
                                        <td>{{ $loop->index + 1 }}</td>
                                        <td>{{ $post->title }}</td>
                                        <td>{{ $post->subtitle }}</td>
                                        <td>{{ $post->slug }}</td>


                                        <td>{{ $post->status }}</td>
                                        <td >{{ $post->posted_by }}</td>
                                        <td>{{ $post->updated_at->diffForHumans() }}</td>
                                        @can('posts.update', Auth::user())
                                            <td><a href="{{ route('post.edit', $post->id) }}"><span class="glyphicon glyphicon-edit"></span></a></td>
                                        @endcan
                                        @can('posts.delete', Auth::user())
                                            <td>
                                                <form id="delete-form-{{$post->id}}" method="post" action="{{ route('post.destroy', $post->id) }}" style="display: none">
                                                    {{ csrf_field() }}
                                                    {{ method_field('DELETE') }}
                                                </form>
                                                <a href=""
                                                   onclick="if(confirm('Are you sure, You want to delete this?')) {
                                                           event.preventDefault();
                                                           document.getElementById('delete-form-{{$post->id}}').submit();
                                                           }else {
                                                           event.preventDefault();
                                                           }"><span class="glyphicon glyphicon-trash"></span></a>
                                            </td>
                                        @endcan

                                    </tr>

                                @endforeach
                                </tbody>
                                <tfoot>
                                <tr>
                                    <th>S.No</th>
                                    <th>Post Title</th>
                                    <th>Post Subtitle</th>
                                    <th>Post Slug</th>

                                    <th>Post Status</th>
                                    <th>Posted By</th>
                                    <th>Created at</th>

                                    @can('posts.update', Auth::user())
                                        <th>Edit</th>
                                    @endcan
                                    @can('posts.delete', Auth::user())
                                        <th>Delete</th>
                                    @endcan
                                </tr>
                                </tfoot>
                            </table>
                            @can('posts.create', Auth::user())
                                <a class="pull-left btn btn-success" href="{{ route('post.create') }}">Add New Post</a>
                            @endcan

                        </div>
                    </div>
                </div>
                <!-- /.box-body -->
                <div class="box-footer">
                    Footer
                </div>
                <!-- /.box-footer-->
            </div>
            <!-- /.box -->

        </section>
        <!-- /.content -->
    </div>


@endsection

@section('footerSection')
    <script src="{{ asset("admin/bower_components/datatables.net/js/jquery.dataTables.min.js") }}"></script>
    <script src="{{ asset("admin/bower_components/datatables.net-bs/js/dataTables.bootstrap.min.js") }}"></script>
    <script>
        $(function () {
            $('#example1').DataTable()
            $('#example2').DataTable({
                'paging'      : true,
                'lengthChange': false,
                'searching'   : false,
                'ordering'    : true,
                'info'        : true,
                'autoWidth'   : false
            })
        })
    </script>

@endsection