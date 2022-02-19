<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Relations\HasMany;
use Illuminate\Database\Eloquent\Relations\HasOne;

/**
 * @method static paginate(int $int)
 * @method static find(int $id)
 * @property mixed $id
 * @property mixed $stock
 */
class Gift extends Model
{
    use HasFactory;

    protected $guarded = ["id"];

    public static function syncRating(mixed $gift_id)
    {
        $gift = Gift::find($gift_id);
        $gift->rating = $gift->redeemed->sum('rated.rating') / $gift->redeemed->count();
        $gift->save();
    }

    public function redeemed(): HasMany
    {
        return $this->hasMany(GiftRedeemed::class);
    }

    public function redeem(int $quantity) : GiftRedeemed
    {
        $redeemed = GiftRedeemed::create([
            "gift_id" => $this->id,
            "quantity" => $quantity,
        ]);

        $this->stock-=$quantity;
        $this->save();

        return  $redeemed;
    }
}
