<?php

namespace App\Transformers;

use App\Models\Gift;

use App\Models\GiftRedeemed;
use League\Fractal\TransformerAbstract;

class GiftRedeemedTransformer extends TransformerAbstract
{
    /**
     * Transform the data.
     *
     * @param GiftRedeemed $model
     * @return array
     */
    public function transform(GiftRedeemed $model): array
    {
        $gift = Gift::find($model->gift_id);

        return [
            'id' => $model->id,
            'gift_id' => $model->gift_id,
            'quantity' => $model->quantity,
            'gift' => [
                'id' => $gift->id,
                'name' => $gift->name,
                'description' => $gift->description,
                'price' => $gift->price,
                'rating' => $gift->rating,
                'roundedRating' => floor($gift->rating * 2) / 2,
                'stock' => $gift->stock,
                'published' => $gift->published,
                'created' => $gift->created_at->toIso8601String(),
            ],
            'created' => $model->created_at->toIso8601String(),
        ];
    }
}
{

}
