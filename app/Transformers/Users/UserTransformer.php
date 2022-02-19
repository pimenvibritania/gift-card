<?php

namespace App\Transformers\Users;

use App\Models\User;
use JetBrains\PhpStorm\ArrayShape;
use League\Fractal\TransformerAbstract;

class UserTransformer extends TransformerAbstract
{
    /**
     * Transform the data.
     *
     * @param User $model
     * @return array
     */
    #[ArrayShape(['name' => "mixed", 'email' => "mixed", 'created_at' => "mixed", 'updated_at' => "mixed"])]
    public function transform(User $model): array
    {
        return [
            'name' => $model->name,
            'email' => $model->email,
            'created_at' => $model->created_at->toIso8601String(),
            'updated_at' => $model->updated_at->toIso8601String(),
            'role' => $model->getRoleNames(),
            'token' => [
                'access_token' => $model->getToken(),
                'token_type' => 'Bearer',
                'expires_at' => auth('api')->factory()->getTTL() * 60,
            ]
        ];
    }
}
{

}
