<?php

namespace Database\Seeders;

use App\Models\User;
use Illuminate\Database\Console\Seeds\WithoutModelEvents;
use Illuminate\Database\Seeder;
use Illuminate\Support\Facades\Hash;
use Spatie\Permission\Models\Role;

class UserRoleSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        $admin = User::firstOrCreate([
            'name' => 'Admin',
            'email' => 'admin@mail.com',
            'password' => bcrypt('password')]);
        Role::create([
            'name' => 'admin',
            'guard_name' => 'api',
        ]);
        $admin->assignRole('admin');

        $member = User::firstOrCreate([
            'name' => 'Member',
            'email' => 'member@mail.com',
            'password' => bcrypt('password')]);
        Role::create([
            'name' => 'member',
            'guard_name' => 'api',
        ]);
        $member->assignRole('member');

    }
}
