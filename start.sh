#!/bin/sh

nginx
php-fpm81 -D
# htpasswd -bc /var/www/htpasswd ${USER} ${PASSWD}

while true; do sleep 60; done