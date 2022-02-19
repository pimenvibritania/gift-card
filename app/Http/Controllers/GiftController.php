<?php

namespace App\Http\Controllers;

use App\Exceptions\NotFoundException;
use App\Exceptions\UnprocessableEntityException;
use App\Models\Gift;
use App\Models\GiftRedeemed;
use App\Transformers\GiftRatedTransformer;
use App\Transformers\GiftRedeemedTransformer;
use Illuminate\Http\JsonResponse;
use Illuminate\Http\Request;
use Illuminate\Http\Response;
use League\Fractal\Pagination\IlluminatePaginatorAdapter;
use League\Fractal\Serializer\JsonApiSerializer;
use Spatie\Fractal\Facades\Fractal;

class GiftController extends Controller
{
    const RECENT_SORT = 'recent';
    const POPULAR_SORT = 'popular';

    /**
     * Display a listing of the resource.
     *
     * @return array
     */
    public function index(): array
    {
        $sortBy = match (request()->query('sortBy')) {
            self::RECENT_SORT => 'created_at',
            self::POPULAR_SORT => 'rating',
            default => 'id'
        };

        $paginator = Gift::with('redeemed.rated')
            ->orderBy($sortBy, request()->query('sort') ?: 'ASC')
            ->paginate(\request()->query('sizePerPage') ?: 10);

        $paginator->appends(request()->query())->links();

        $gifts = $paginator->getCollection();

        return Fractal::create()
            ->collection($gifts, new GiftRatedTransformer(), 'gift')
            ->serializeWith(new JsonApiSerializer())
            ->paginateWith(new IlluminatePaginatorAdapter($paginator))
            ->toArray();
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param Request $request
     * @return Response
     */
    public function store(Request $request)
    {
        $request->validate([
            "name" => "required|string|max:255",
            "price" => "required|numeric|min:0",
            "stock" => "required|integer|min:0",
        ]);

        $gift = Gift::create($request->all());

        return Fractal::create()
            ->item($gift, new GiftRatedTransformer(), 'gifts')
            ->serializeWith(new JsonApiSerializer())
            ->toArray();
    }

    /**
     * Display the specified resource.
     *
     * @param int $id
     * @return array
     * @throws NotFoundException
     */
    public function show(int $id): array
    {
        $gift = Gift::find($id);

        if (!$gift) {
            throw new NotFoundException('Gift not found');
        }

        return Fractal::create()
            ->item($gift, new GiftRatedTransformer(), 'gift')
            ->serializeWith(new JsonApiSerializer())
            ->toArray();
    }

    /**
     * Update the specified resource in storage.
     *
     * @param Request $request
     * @param int $id
     * @return array
     * @throws NotFoundException
     */
    public function update(Request $request, int $id) : array
    {
        $gift = Gift::find($id);

        if (!$gift) {
            throw new NotFoundException('Gift not found');
        }

        $gift->name = $request->input('name');
        $gift->description = $request->input('description');
        $gift->price = $request->input('price');
        $gift->stock = $request->input('stock');
        $gift->published = $request->input('published');
        $gift->save();

        return Fractal::create()
            ->item($gift, new GiftRatedTransformer(), 'gift')
            ->serializeWith(new JsonApiSerializer())
            ->toArray();
    }

    public function upsert(Request $request, int $id) : array
    {
        $gift = Gift::find($id);

        if (!$gift) {
            throw new NotFoundException('Gift not found');
        }

       $gift->update($request->all());

        return Fractal::create()
            ->item($gift, new GiftRatedTransformer(), 'gift')
            ->serializeWith(new JsonApiSerializer())
            ->toArray();
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param int $id
     * @return JsonResponse
     * @throws NotFoundException
     */
    public function destroy(int $id): JsonResponse
    {
        $gift = Gift::find($id);

        if(!$gift) {
            throw new NotFoundException('Gift not found');
        }

        return \response()->json([
            'status' => 200,
            'success' => $gift->delete(),
            'message' => 'Gift deleted'
        ], 200);
    }

    /**
     * Redeem a gift
     *
     * @param Request $request
     * @param int $id
     * @return array
     * @throws NotFoundException
     * @throws UnprocessableEntityException
     */
    public function redeem(Request $request, int $id): array
    {
        $request->validate([
            "quantity" => "required|integer|min:1",
        ]);
        /**
         * @var Gift $gift
         */
        $gift = Gift::find($id);

        if (!$gift) {
            throw new NotFoundException('Gift not found');
        }

        $quantity = $request->input('quantity');

        if ($gift->stock <= 0 || $gift->stock < $quantity) {
            throw new UnprocessableEntityException('Gift out of stock');
        }

        return Fractal::create()
            ->item($gift->redeem($quantity), new GiftRedeemedTransformer(), 'giftRedeemed')
            ->serializeWith(new JsonApiSerializer())
            ->toArray();
    }

    /**
     * @throws NotFoundException
     * @throws UnprocessableEntityException
     */
    public function rate(Request $request, int $id)
    {
        $request->validate([
            'giftRedeemedId' => 'required|integer',
            'rating' => 'required|min:1|max:5'
        ]);

        /**
         * @var Gift $gift
         */
        $gift = Gift::find($id);

        if (!$gift) {
            throw new NotFoundException('Gift not found');
        }

        /**
         * @var GiftRedeemed $giftRedeemed
         */
        $giftRedeemed = GiftRedeemed::find($request->input('giftRedeemedId'));

        if (!$giftRedeemed
            || $giftRedeemed->gift_id !== $gift->id
            || $giftRedeemed->user_id !== auth('api')->id()
        ) {
            throw new UnprocessableEntityException("You haven't redeemed this gift");
        }

        return Fractal::create()
            ->item($giftRedeemed->rate($request->input('rating')),
                new GiftRatedTransformer(), 'giftRated')
            ->serializeWith(new JsonApiSerializer())
            ->toArray();
    }
}
