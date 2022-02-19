<?php

use App\Models\Gift;
use App\Models\User;
use Database\Seeders\UserRoleSeeder;
use Illuminate\Foundation\Testing\RefreshDatabase;
use Tymon\JWTAuth\Facades\JWTAuth;

uses(Tests\TestCase::class, RefreshDatabase::class);

$adminToken ="";
$userToken ="";

it('Create role and user seeder and get the token for each roles', function () {
    $this->seed(UserRoleSeeder::class);
    $users = User::all();
    foreach ($users as $user) {
       in_array("admin", $user->getRoleNames()->toArray()) ?
           $this->adminToken = JWTAuth::fromUser($user) :
           $this->userToken = JWTAuth::fromUser($user);
    }

    $this->assertNotEmpty($this->adminToken);
    $this->assertNotEmpty($this->userToken);
});

it('Can fetch gift list and contains pagination', function () {
    Gift::factory()->create();
    $response = $this->getJson("/api/gift");
    expect($response['data'][0]['type'])->toBe("gift");
    expect($response['links'])->toHaveKeys(['self', 'first', 'last']);
    $response->assertStatus(200);
});

it('Unauthenticated when access restricted endpoint', function () {
    $response = $this->postJson("/api/gift", []);
    $response->assertStatus(403);
});

it('Unauthorized when access restricted endpoint', function () {
    $this->seed(UserRoleSeeder::class);

    $token = JWTAuth::fromUser(User::find(2));

    $response = $this->postJson("/api/gift", [], [
        'Authorization' => 'Bearer ' . $token
    ]);
    $response->assertStatus(403);
});
