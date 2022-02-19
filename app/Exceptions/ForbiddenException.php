<?php

namespace App\Exceptions;

use Exception;
use Illuminate\Http\JsonResponse;

class ForbiddenException extends Exception
{
    public function render(): JsonResponse
    {
        return new JsonResponse([
            'status' => 403,
            'error' => 'Forbidden',
            'message' => $this->getMessage()
        ], 403);
    }
}
