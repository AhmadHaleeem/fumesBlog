@extends('admin/layouts/app')

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
                        <form role="form" action="{{ route('permission.update', $permission->id) }}" method="post">
                            {{ csrf_field() }}
                            {{ method_field('PUT') }}
                            <div class="box-body">
                                <div class="col-lg-12">
                                    <div class="form-group">
                                        <label for="name">Permission Title</label>
                                        <input type="text" class="form-control" name="name" id="name" placeholder="Permission Name" value="{{ $permission->name }}">
                                    </div>

                                    <div class="box-footer">
                                        <button type="submit" class="btn btn-primary">Submit</button>
                                        <a type="button" href="{{ route('permission.index') }}" class="btn btn-warning">Back</a>
                                    </div>
                                </div>
                            </div>
                        </form>
                    </div>
                </div>
                <!-- ./row -->
            </div>
        </section>
        <!-- /.content -->
    </div>


@endsection