#!/bin/bash

set -eu

# ensure that data directory is owned by 'cloudron' user
chown -R cloudron:cloudron /app/data


echo "==> Starting PM2"
exec /usr/local/bin/gosu cloudron:cloudron pm2 start /app/data/pm2.process.js

