<?php

namespace App\Http\Controllers;

use App\Exceptions\NotFoundException;
use App\Models\User;
use App\Transformers\Users\UserTransformer;
use Illuminate\Http\Request;
use Spatie\Permission\Models\Role;

class UserController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        //
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {
        //
    }

    /**
     * Display the specified resource.
     *
     * @param int $id
     * @return array
     */
    public function show(int $id): array
    {
        $user = User::find($id);

        return fractal()
            ->item($user)
            ->transformWith(new UserTransformer)
            ->toArray();
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, $id)
    {
        //
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function destroy($id)
    {
        //
    }

    /**
     * @throws NotFoundException
     */
    public function assignRole(Request $request, $id): array
    {
        $user = User::find($id);

        if (!$user) {
            throw new NotFoundException('User not found');
        }

        $role = Role::find($request->roleId);

        if (!$role) {
            throw new NotFoundException('Role not found');
        }

        $user->assignRole($request->roleId);

        return fractal()
            ->item($user)
            ->transformWith(new UserTransformer)
            ->toArray();
    }
}
