<?php

namespace Database\Factories;

use Illuminate\Database\Eloquent\Factories\Factory;

/**
 * @extends Factory
 */
class GiftFactory extends Factory
{
    /**
     * Define the model's default state.
     *
     * @return array
     */
    public function definition()
    {
        return [
            "name" => $this->faker->name,
            "price" => $this->faker->randomFloat(2, 0, 100),
            "description" => $this->faker->text,
            "published" => $this->faker->boolean,
            "stock" => $this->faker->randomDigit(),
            "rating" => $this->faker->randomFloat(2, 0, 5),
        ];
    }
}
