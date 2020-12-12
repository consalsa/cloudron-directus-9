#!/bin/bash

set -eu

# ensure that data directory is owned by 'cloudron' user
chown -R cloudron:cloudron /app/data


echo "==> Starting PM2"
exec /usr/local/bin/gosu cloudron:cloudron npx pm2 start -l /app/data/logs/ /app/data/pm2.process.js

