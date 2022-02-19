<?php

namespace App\Http\Middleware;

use App\Exceptions\UnauthenticatedException;
use Closure;
use Illuminate\Support\Facades\Auth;
use Spatie\Permission\Exceptions\UnauthorizedException;

class RoleMiddleware
{
    /**
     * @throws UnauthenticatedException
     */
    public function handle($request, Closure $next, $role, $guard = null)
    {
        $authGuard = Auth::guard($guard);
        if ($authGuard->guest()) {
            throw new UnauthenticatedException("Unauthenticated");
        }

        $roles = is_array($role)
            ? $role
            : explode('|', $role);

        if (! $authGuard->user()->hasAnyRole($roles)) {
            throw new UnauthenticatedException("Unauthorized");
        }

        return $next($request);
    }
}
