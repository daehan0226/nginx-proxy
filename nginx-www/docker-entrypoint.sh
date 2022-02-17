#!/usr/bin/env bash
set -eu

envsubst '${REDIRECT}' < /etc/nginx/conf.d/www.conf.template > /etc/nginx/conf.d/www.conf

exec "$@"
