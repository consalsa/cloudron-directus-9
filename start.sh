#!/bin/bash

set -eu

# ensure that data directory is owned by 'cloudron' user
chown -R cloudron:cloudron /app/data

echo "==> Starting"
exec /usr/local/bin/gosu cloudron:cloudron npm start

