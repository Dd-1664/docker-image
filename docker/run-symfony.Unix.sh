#!/usr/bin/env bash
set -xe
cd /var/www/html

# prepare chmod default values
if [[ "$APACHE_USER_ID" -eq "" ]]; then
    APACHE_USER_ID="www-data"
fi
if [[ "$APACHE_GROUP_ID" -eq "" ]]; then
    APACHE_GROUP_ID="$APACHE_USER_ID"
fi

# Tweak values for dev
if [[ "$APACHE_GROUP_ID" -ne "www-data" ]]; then
   echo "Tweak apache group id to $APACHE_GROUP_ID"
   groupmod -g $APACHE_GROUP_ID www-data
fi

if [[ "$APACHE_USER_ID" -ne "www-data" ]]; then
    echo "Tweak apache user id to $APACHE_USER_ID"
    usermod -u $APACHE_USER_ID www-data
fi

# fix cache chmod
if [[ -d var/cache ]]; then
    mkdir -p var/logs
    chmod -R 777 var/cache
    chmod -R 777 var/logs
fi

# We are all set, run apache in foreground
echo "run apache2"

if [[ $# -gt 0 ]]; then
    cd /var/www/html
	exec "$@"
fi
exec /usr/sbin/apache2ctl -D FOREGROUND