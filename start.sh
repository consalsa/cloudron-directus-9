#!/bin/bash

set -eu

# ensure that data directory is owned by 'cloudron' user
chown -R cloudron:cloudron /app/data

if [[ ! -f /app/data/directus/.env ]]; then
  echo "copy .env"  
  cp /app/data/directus/example.env  /app/data/directus/.env
  echo "Done."
fi

echo "==> Starting"
exec /usr/local/bin/gosu cloudron:cloudron npm start

