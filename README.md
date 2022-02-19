
<p align="center">
<a href="https://travis-ci.org/laravel/framework"><img src="https://travis-ci.org/laravel/framework.svg" alt="Build Status"></a>
<a href="https://packagist.org/packages/laravel/framework"><img src="https://img.shields.io/packagist/dt/laravel/framework" alt="Total Downloads"></a>
<a href="https://packagist.org/packages/laravel/framework"><img src="https://img.shields.io/packagist/v/laravel/framework" alt="Latest Stable Version"></a>
<a href="https://packagist.org/packages/laravel/framework"><img src="https://img.shields.io/packagist/l/laravel/framework" alt="License"></a>
</p>

# Tech spec & libraries
- Framework Laravel v.9.1
- PHP 8.1
- Composer 2
- MySQL 5.7 | AWS RDS MySQL 5.7
- Apache 2.4
- Spatie/laravel-permission v.5.5
- Spatie/laravel-fractal v.6.0
- tomfordrumm/jwt-auth dev-development

# Installation guide
### Prerequisites
- Install PHP 8.1
- Install Composer 2
- Install MySQL 5.7
- Install Apache 2.4

### Local Installation
- Clone this repository `git clone git@bitbucket.org:pimenvibritania13/gift-card.git`
- Run `composer install` inside app directory 
- Copy `.env.example` to `.env` and fill in the required values like database credentials
- Run `php artisan key:generate`
- Run `php artisan migrate:fresh --seed` to create tables , seed data, and sync the rating seed
- Run `php artisan jwt:secret` to generate a new key
- Run `php artisan serve` to run the application or install [Laravel Valet](https://laravel.com/docs/9.x/valet)

### Deployment
There is two ways to deploy this application.
1. Deploy manually to Heroku from the local machine with command line [here](https://devcenter.heroku.com/articles/git).
2. Automatically deploy to Heroku with Bitbucket Pipelines (CI/CD) [here](https://bitbucket.org/pimenvibritania13/gift-card/projects/1/pipelines).

This is the base url of the application: 
- [`https://pim-gift-cards.herokuapp.com/api`](https://pim-gift-cards.herokuapp.com/api)
- [`http://gift.pimenvibritania.tech/api`](http://gift.pimenvibritania.tech/api)

### Endpoints
| Method | Path                      | Action                    |
|--------|---------------------------|---------------------------|
| POST   | api/auth/login            | AuthController@login      |
| POST   | api/auth/register         | AuthController@register   |
| GET    | api/gift                  | GiftController@index      |
| POST   | api/gift                  | GiftController@store      |
| GET    | api/gift/{id}             | GiftController@show       |
| PUT    | api/gift/{id}             | GiftController@update     |
| PATCH  | api/gift/{id}             | GiftController@upsert     |
| DELETE | api/gift/{id}             | GiftController@delete     |
| POST   | api/gift/{id}/rating      | GiftController@rate       |
| POST   | api/gift/{id}/redeem      | GiftController@redeem     |
| GET    | api/role                  | RoleController@index      |
| POST   | api/role                  | RoleController@store      |
 | GET    | api/role/{id}             | RoleController@show       |
| PUT    | api/role/{id}             | RoleController@update     |
| DELETE | api/role/{id}             | RoleController@delete     |
| GET    | api/user                  | UserController@index      |
| GET    | api/user/me               | UserController@me         |
| POST   | api/user                  | UserController@store      |
| PUT    | api/user/{id}             | UserController@update     |
| GET    | api/user/{id}             | UserController@show       |
| DELETE | api/user/{id}             | UserController@delete     |
| POST   | api/user/{id}/assign-role | UserController@assignRole |

## Automated Testing
#### Library using [PESTPhp Testing Framework](https://pestphp.com/)
- Install PEST autoladed using command `php artisan pest:install` 
### Test the API
There is two ways to test the API:
1. Test the API manually from the local machine using command `./vendor/bin/pest`
2. Automated testing will run automatically using [Bitbucket Pipelines](https://bitbucket.org/pimenvibritania13/gift-card/projects/1/pipelines) when running pipelines or push new code into remote repository.
## License
The Laravel framework is open-sourced software licensed under the [MIT license](https://opensource.org/licenses/MIT).
