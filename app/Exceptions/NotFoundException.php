<?php

namespace App\Exceptions;

use Exception;
use Illuminate\Http\JsonResponse;

class NotFoundException extends Exception
{
    public function render(): JsonResponse
    {
        return new JsonResponse([
            'status' => 404,
            'error' => 'Not Found',
            'message' => $this->getMessage()
        ], 404);
    }
}
