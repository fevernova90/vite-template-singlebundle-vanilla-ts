#! /bin/bash

set -e

export NODE_ENV="production"

npm run build

#  Create less-privileged user for nginx if it doesn't exists
id -u nginx &>/dev/null || useradd -r -s /bin/false nginx

chown nginx:nginx /app/dist -R
nginx -t

echo "Server is listening on port 80"
nginx -g "daemon off;"
