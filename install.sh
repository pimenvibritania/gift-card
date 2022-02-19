#!/bin/sh
app_dir="/home/pimenvibritania/gift-card"

init_install() {
    git checkout development &&
    /usr/bin/php8.1 /usr/local/bin/composer install --no-interaction -vvv &&
    openssl enc -bf -d -in .secret.enc -out .env -k ${AES_PASS} &&
    php artisan migrate:fresh --seed
}

#check if folder exist
if [ ! -d "$app_dir" ]; then
    cd /home/pimenvibritania &&
    git clone git@bitbucket.org:pimenvibritania13/gift-card.git &&
    cd gift-card &&
    init_install
else
    cd $app_dir &&
    git checkout development &&
    git pull origin development &&
    /usr/bin/php8.1 /usr/local/bin/composer install --no-interaction -vvv
fi

