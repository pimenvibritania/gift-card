<?php

namespace App\Exceptions;

use Exception;
use Illuminate\Http\JsonResponse;

class UnprocessableEntityException extends Exception
{
    public function render(): JsonResponse
    {
        return new JsonResponse([
            'status' => 442,
            'error' => 'Unprocessable Entity',
            'message' => $this->getMessage()
        ], 442);
    }
}
