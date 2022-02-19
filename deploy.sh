#!/bin/sh

app_dir="/home/pimenvibritania/gift-card"

#check if folder exist
if [ ! -d "$app_dir" ]; then
    cd /home/pimenvibritania && git clone git@bitbucket.org:pimenvibritania13/gift-card.git
else
    cd $app_dir && git pull origin development
fi

init_install() {
    composer install -vvv
    php artisan migrate:fresh --seed
    php artisan jwt:secret
}
