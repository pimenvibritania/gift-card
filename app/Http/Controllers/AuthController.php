<?php

namespace App\Http\Controllers;

use App\Models\User;
use App\Transformers\Users\UserTransformer;
use Illuminate\Http\JsonResponse;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Hash;
use Spatie\Fractal\Fractal;

class AuthController extends Controller
{
    public function login(): Fractal | JsonResponse
    {
        $credentials = request(['email', 'password']);

        if (!auth('api')->attempt($credentials)) {
            return response()->json(['error' => 'Unauthorized'], 401);
        }

        $user = User::where('email', request('email'))->first();

        return fractal($user, new UserTransformer())->respond(200);
    }

    public function register(Request $request): JsonResponse
    {
        $request->validate([
            'name' => 'required',
            'email' => 'required|email|unique:users',
            'password' => 'required|confirmed|min:6',
        ]);

        $user = User::create([
            'name' => $request->name,
            'email' => $request->email,
            'password' => Hash::make($request->password)
        ]);

        /**
         * @var User $user
         */
        $user->assignRole("Member");
        return fractal($user, new UserTransformer())->respond(201);
    }

    protected function respondWithToken($token): JsonResponse
    {
        return response()->json([
            'access_token' => $token,
            'token_type' => 'bearer',
            'expires_in' => auth('api')->factory()->getTTL() * 60
        ]);
    }
}
