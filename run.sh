#!/bin/sh

set -e

if [ ! -f "/data/www/config/.config.php" ]; then
    echo "Init example config file"
    curl -sSL -o /data/www/config/.config.php https://raw.githubusercontent.com/esdeathlove/ss-panel-v3-mod/new_master/config/.config.php.example
fi

if [ ! -f "/data/www/config/routes.php" ]; then
    echo "Init router"
    curl -sSL -o /data/www/config/routes.php https://raw.githubusercontent.com/esdeathlove/ss-panel-v3-mod/new_master/config/routes.php
fi

/usr/bin/supervisord -n -c /etc/supervisord.conf