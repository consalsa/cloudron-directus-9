#!/bin/bash

set -eu

# ensure that data directory is owned by 'cloudron' user
chown -R cloudron:cloudron /app/data

if [[ ! -f /app/data/.bootstrapped ]]; then
  echo "Run bootstrap"
  exec /app/data/setenv.sh
  exec npm run bootstrap
  touch /app/data/.bootstrapped
  echo "Done."
fi

echo "==> Starting supervisor"
exec /usr/bin/supervisord --configuration /etc/supervisor/supervisord.conf --nodaemon -i SupervisorExampleApp

