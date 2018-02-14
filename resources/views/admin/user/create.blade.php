@extends('admin/layouts/app')

@section('main-content')

    <div class="content-wrapper">
        <!-- Content Header (Page header) -->
        <section class="content-header">
            <h1>
               Admin Page
                <small>Advanced form element</small>
            </h1>
            <ol class="breadcrumb">
                <li><a href="#"><i class="fa fa-dashboard"></i>Admin Panel</a></li>

                <li class="active">Admin Page</li>
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
                        <form role="form" action="{{ route('user.store') }}" method="post">
                            {{ csrf_field() }}

                            <div class="box-body">
                                <div class="col-lg-6 col-md-offset-3">
                                    <div class="form-group">
                                        <label for="Username">Username</label>
                                        <input type="text" class="form-control" name="name" id="Username" placeholder="Username" value="{{ old('name') }}">
                                    </div>

                                    <div class="form-group">
                                        <label for="email">Email</label>
                                        <input type="email" class="form-control" name="email" id="email" placeholder="Email" value="{{ old('email') }}">
                                    </div>

                                    <div class="form-group">
                                        <label for="Phone">Phone</label>
                                        <input type="text" class="form-control" name="phone" id="Phone" placeholder="Phone" value="{{ old('Phone') }}">
                                    </div>

                                    <div class="form-group">
                                        <label for="Password">Password</label>
                                        <input type="password" class="form-control" name="password" id="password" placeholder="Password" value="{{ old('password') }}">
                                    </div>
                                    <div class="form-group">
                                        <label for="password_confirmation">Confirm Password</label>
                                        <input type="password" class="form-control" name="password_confirmation" id="password_confirmation" placeholder="Confirm Password">
                                    </div>

                                    <div class="form-group">
                                        <label for="Password">Status</label>
                                        <div class="checkbox">
                                            <label><input type="checkbox" name="status" value="1" @if(old('status') == 1) checked @endif> Status </label>
                                        </div>
                                    </div>



                                    <div class="form-group col-md-12">
                                        <div class="row">
                                            @foreach($roles as $role)

                                                <div class="col-lg-3">
                                                    <div class="checkbox">
                                                        <label><input type="checkbox" name="role[]" value="{{ $role->id }}"> {{ $role->name }} </label>
                                                    </div>
                                                </div>
                                            @endforeach
                                        </div>



                                    </div>
                                    <div class="box-footer">
                                        <button type="submit" class="btn btn-primary">Submit</button>
                                        <a type="button" href="{{ route('user.index') }}" class="btn btn-warning">Back</a>
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