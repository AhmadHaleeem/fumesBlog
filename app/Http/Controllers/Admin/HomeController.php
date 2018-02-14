<?php

namespace App\Http\Controllers\Admin;

use Illuminate\Http\Request;
use App\Http\Controllers\Controller;

class HomeController extends Controller
{

    /**
     * Create a new controller instance.
     *
     * @return void
     */
    public function __construct()
    {
        $this->middleware('auth:admins');
    }
    public function index() {
        return view('admin.home');
    }

    public function logout() {
        auth()->logout();
        return redirect()->back();
    }
}
