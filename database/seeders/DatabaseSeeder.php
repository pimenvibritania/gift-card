<?php

namespace Database\Seeders;

use App\Models\Gift;
use App\Models\GiftRated;
use App\Models\GiftRedeemed;
use Database\Factories\GiftRatedFactory;
use Illuminate\Database\Seeder;

class DatabaseSeeder extends Seeder
{
    /**
     * Seed the application's database.
     *
     * @return void
     */
    public function run()
    {
        $this->call(UserRoleSeeder::class);
        Gift::factory(100)->create();
        GiftRedeemed::factory(5)->create();
        GiftRated::factory(5)->create();
    }
}
