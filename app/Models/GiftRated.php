<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Relations\BelongsTo;

/**
 * @property mixed $id
 * @property mixed $rating
 * @property GiftRedeemed $redeemed
 */
class GiftRated extends Model
{
    use HasFactory;

    protected $guarded = ['id'];

    public function redeemed(): BelongsTo
    {
        return $this->belongsTo('App\Models\GiftRedeemed');
    }

}
