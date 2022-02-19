<?php

namespace Database\Factories;

use Illuminate\Database\Eloquent\Factories\Factory;

/**
 * @extends Factory
 */
class GiftRedeemedFactory extends Factory
{
    /**
     * Define the model's default state.
     *
     * @return array
     */
    public function definition()
    {
        return [
            "gift_id" => $this->faker->numberBetween(1, 100),
            "user_id" => $this->faker->numberBetween(1, 2),
            "quantity" => $this->faker->numberBetween(1, 10),
        ];
    }
}
