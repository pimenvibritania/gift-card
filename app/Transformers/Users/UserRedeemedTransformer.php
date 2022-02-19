<?php

namespace App\Transformers\Users;

use App\Models\User;
use JetBrains\PhpStorm\ArrayShape;
use League\Fractal\TransformerAbstract;

class UserRedeemedTransformer extends TransformerAbstract
{
    /**
     * Transform the data.
     *
     * @param User $model
     * @return array
     */
    public function transform(User $model): array
    {
        return [
            'id' => $model->id,
            'name' => $model->name,
            'email' => $model->email,
            'role' => $model->getRoleNames(),
            'redeemed' => [
                'totalRedeemed' => $model->redeemed->count(),
                'items' => $model->redeemed->toArray(),
            ],
        ];
    }
}
{

}
