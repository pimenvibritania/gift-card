<?php

namespace App\Models;

use App\Exceptions\UnprocessableEntityException;
use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Relations\BelongsTo;
use Illuminate\Database\Eloquent\Relations\HasOne;

/**
 * @method static create(array $array)
 * @method static find(mixed $redeemedId)
 * @property mixed $gift_id
 * @property mixed $user_id
 * @property mixed $created_at
 * @property mixed $id
 * @property mixed $quantity
 */
class GiftRedeemed extends Model
{
    use HasFactory;

    protected $guarded = ['id'];

    public function gift(): BelongsTo
    {
        return $this->belongsTo(Gift::class);
    }

    public function user(): BelongsTo
    {
        return $this->belongsTo(User::class);
    }

    public function rated(): HasOne
    {
        return $this->hasOne(GiftRated::class);
    }

    /**
     * @throws UnprocessableEntityException
     */
    public function rate(float $rating): Model
    {
        if ($this->rated()) {
            throw new UnprocessableEntityException('Gift already rated');
        }

        $rated = $this->rated()->create([
            'rating' => $rating,
        ]);

        Gift::syncRating();

        return $rated;
    }

}
