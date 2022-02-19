<?php

namespace App\Transformers;

use App\Models\Gift;

use App\Models\GiftRated;
use App\Models\GiftRedeemed;
use League\Fractal\TransformerAbstract;

class GiftRatedTransformer extends TransformerAbstract
{
    /**
     * Transform the data.
     *
     * @param GiftRated $model
     * @return array
     */
    public function transform(GiftRated $model): array
    {
        return [
            'id' => $model->id,
            'yourRating' => $model->rating,
            'redeemedGift' => [
                'id' => $model->redeemed->id,
                'giftId' => $model->redeemed->gift_id,
                'created' => $model->redeemed->created_at->toIso8601String(),
            ],
            'created' => $model->created_at->toIso8601String(),
        ];
    }
}
{

}
