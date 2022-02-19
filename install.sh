#!/bin/sh
app_dir="/home/pimenvibritania/gift-card"

#check if folder exist
if [ ! -d "$app_dir" ]; then
    cd /home/pimenvibritania &&
    git clone git@bitbucket.org:pimenvibritania13/gift-card.git &&
    init_install
else
    cd $app_dir &&
    git checkout development &&
    git pull origin development &&
    composer install -vvv
fi

init_install() {
    git checkout development
    composer install -vvv
    openssl enc -aes-256-cbc -d -in .secret.enc -out .env -k ${AES_PASS}
    php artisan migrate:fresh --seed
    php artisan jwt:secret
}
