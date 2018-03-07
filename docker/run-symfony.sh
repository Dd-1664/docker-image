#!/usr/bin/env bash

set -e
cd /var/www/html


# prepare chmod
if [[ "$APACHE_USER_ID" -eq "" ]]; then
    APACHE_USER_ID="www-data"
fi
if [[ "$APACHE_USER_ID" -ne "www-data" ]]; then
    echo "Tweak apache user id to $APACHE_USER_ID"
    usermod -u $APACHE_USER_ID www-data

    echo "Disable opcache"
    sed -ie 's/opcache.enable=1/opcache.enable=0/g' /etc/php/7.1/apache2/conf.d/php.ini
fi

# fix cache chmod
mkdir -p var/cache && mkdir -p var/logs
chown -R $APACHE_USER_ID:$APACHE_USER_ID /var/www/html
chmod -R 777 /var/www/html/var/cache
chmod -R 777 /var/www/html/var/logs


# We are all set, run apache in foreground
exec /usr/sbin/apache2ctl -D FOREGROUND
