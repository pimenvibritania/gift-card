<?php

namespace App\Http\Controllers;

use App\Exceptions\NotFoundException;
use App\Models\User;
use App\Transformers\GiftRatedTransformer;
use App\Transformers\Users\UserRedeemedTransformer;
use App\Transformers\Users\UserTransformer;
use Illuminate\Http\JsonResponse;
use Illuminate\Http\Request;
use Illuminate\Http\Response;
use League\Fractal\Pagination\IlluminatePaginatorAdapter;
use League\Fractal\Serializer\JsonApiSerializer;
use Spatie\Fractal\Facades\Fractal;
use Spatie\Permission\Models\Role;

class UserController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return array
     */
    public function index(): array
    {
        $paginator = User::paginate(10);
        $users = $paginator->getCollection();

        return Fractal::create()
            ->collection($users, new UserRedeemedTransformer(), 'user')
            ->serializeWith(new JsonApiSerializer())
            ->paginateWith(new IlluminatePaginatorAdapter($paginator))
            ->toArray();
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param Request $request
     * @return JsonResponse
     */
    public function store(Request $request): JsonResponse
    {
        $request->validate([
            "name" => "required|string",
            "email" => "required|email|unique:users",
            "password" => "required|confirmed|min:6",
            "role" => "required|string",
        ]);

        $user = User::create([
            "name" => $request->input("name"),
            "email" => $request->input("email"),
            "password" => bcrypt($request->input("password")),
        ]);

        $user->assignRole($request->input("role"));

        return fractal()
            ->item($user)
            ->transformWith(new UserTransformer)
            ->respond(201);

    }

    /**
     * Display the specified resource.
     *
     * @param int $id
     * @return array
     * @throws NotFoundException
     */
    public function show(int $id): array
    {
        $user = User::find($id);

        if (!$user) {
            throw new NotFoundException("User not found");
        }

        return fractal()
            ->item($user)
            ->transformWith(new UserRedeemedTransformer)
            ->toArray();
    }

    public function me(): array
    {
        return fractal()
            ->item(auth()->user())
            ->transformWith(new UserTransformer)
            ->toArray();
    }

    /**
     * Update the specified resource in storage.
     *
     * @param Request $request
     * @param int $id
     * @return JsonResponse
     * @throws NotFoundException
     */
    public function update(Request $request, int $id): JsonResponse
    {
        $user = User::find($id);
        if (!$user) {
            throw new NotFoundException("User not found");
        }

        $user->update($request->all());
        return fractal()
            ->item($user)
            ->transformWith(new UserTransformer)
            ->respond(200);
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param int $id
     * @return JsonResponse
     * @throws NotFoundException
     */
    public function destroy(int $id): JsonResponse
    {
        $user = User::find($id);
        if (!$user) {
            throw new NotFoundException("User not found");
        }
        return \response()->json([
            'message' => 'User deleted'
        ], 200);
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
            ->transformWith(new UserRedeemedTransformer)
            ->toArray();
    }
}
