<?php

use App\Http\Controllers\AuthController;
use App\Http\Controllers\GiftController;
use App\Http\Controllers\RoleController;
use App\Http\Controllers\UserController;
use Illuminate\Support\Facades\Route;

Route::group([
    "middleware" => "api",
], function (){

    Route::group([
        'prefix' => 'auth'
    ], function () {
        Route::post('login', [AuthController::class, 'login'])->name('login');
        Route::post('register', [AuthController::class, 'register']);
        Route::post('logout', 'AuthController@logout');
        Route::post('refresh', 'AuthController@refresh');
        Route::post('me', 'AuthController@me');
    });

    Route::group([
        "prefix" => "gift",
    ], function (){
        Route::get("/", [GiftController::class, "index"]);
        Route::get("/{id}", [GiftController::class, "show"]);
        Route::post("/{id}/redeem", [GiftController::class, "redeem"]);
        Route::post("/{id}/rating", [GiftController::class, "rate"]);

        Route::group([
            "middleware" => ["role:admin,api"]
        ], function (){
            Route::post("/", [GiftController::class, "store"]);
            Route::put("/{id}", [GiftController::class, "update"]);
            Route::patch("/{id}", [GiftController::class, "upsert"]);
            Route::delete("/{id}", [GiftController::class, "destroy"]);
        });
    });

    Route::group([
        "middleware" => ["role:admin,api"],
        "prefix" => "role"
    ], function () {
        Route::get('/', [RoleController::class, 'index']);
        Route::get('/{id}', [RoleController::class, 'show']);
        Route::post('/', [RoleController::class, 'store']);
        Route::put('/{id}', [RoleController::class, 'update']);
        Route::delete('/{id}', [RoleController::class, 'destroy']);
    });

    Route::group([
        "middleware" => ["auth:api,api"],
        "prefix" => "user"
    ], function (){
        Route::get("/me", [UserController::class, "me"]);

        Route::group([
            "middleware" => ["role:admin,api"]
        ], function (){
            Route::post("/", [UserController::class, "store"]);
            Route::get('/', [UserController::class, 'index']);
            Route::get('/{id}', [UserController::class, 'show']);
            Route::put('/{id}', [UserController::class, 'update']);
            Route::delete('/{id}', [UserController::class, 'destroy']);
            Route::post('/{id}/assign-role', [UserController::class, 'assignRole']);
        });
    });
});
