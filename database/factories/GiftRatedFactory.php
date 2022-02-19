<?php

namespace Database\Factories;

use Illuminate\Database\Eloquent\Factories\Factory;

/**
 * @extends Factory
 */
class GiftRatedFactory extends Factory
{
    /**
     * Define the model's default state.
     *
     * @return array
     */
    public function definition()
    {
        return [
            'gift_redeemed_id' => $this->faker->numberBetween(1, 5),
            'rating' => $this->faker->randomFloat(2, 0, 5),
        ];
    }
}
