<?php

namespace App\Transformers;

use App\Models\Gift;

use League\Fractal\TransformerAbstract;

class GiftTransformer extends TransformerAbstract
{
    /**
     * Transform the data.
     *
     * @param Gift $model
     * @return array
     */
    public function transform(Gift $model): array
    {
        return [
            'id' => $model->id,
            'name' => $model->name,
            'description' => $model->description,
            'price' => $model->price,
            'rating' => $model->rating,
            'roundedRating' => floor($model->rating * 2) / 2,
            'stock' => $model->stock,
            'published' => $model->published,
            'created' => $model->created_at->toIso8601String(),
        ];
    }
}
{

}
