#!/bin/sh


set -e

# first arg is `-f` or `--some-option`
if [ "${1#-}" != "$1" ]; then
	set -- php-fpm "$@"
fi

if [ "$1" = 'php-fpm' ]; then
    echo "Waiting for db to be ready..."

    EXIST_CONNECTION=10

    ATTEMPTS_LEFT_TO_REACH_DATABASE=60
    until [ $ATTEMPTS_LEFT_TO_REACH_DATABASE -eq 0 ] || DATABASE_ERROR=$(curl http://mysql:3306 2>&1); do
        if [ $? -eq 1 ]; then
            EXIST_CONNECTION=0

            break
        fi

        sleep 1
        ATTEMPTS_LEFT_TO_REACH_DATABASE=$($ATTEMPTS_LEFT_TO_REACH_DATABASE - 1)
    done

    if [ EXIST_CONNECTION -eq 10 ]; then
        echo "The database is not up or not reachable:"
        echo "$DATABASE_ERROR"
        exit 1
    else
        echo "The db is now ready and reachable"
    fi
fi

exec docker-php-entrypoint "$@"
