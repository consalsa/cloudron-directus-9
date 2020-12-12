#!/bin/bash

set -eu

# ensure that data directory is owned by 'cloudron' user
chown -R cloudron:cloudron /app/data

if [[ -f /app/data/setenv.sh ]]; then
  echo "Set environment Variables"
  cp /app/data/setenv.sh /app/code
  chmod +x /app/code/setenv.sh
  echo "Done."
fi

if [[ ! -f /app/data/.bootstrapped ]]; then
  echo "Run bootstrap"
  exec npm run bootstrap
  touch /app/data/.bootstrapped
  echo "Done."
fi

echo "==> Starting supervisor"
exec /usr/bin/supervisord --configuration /etc/supervisor/supervisord.conf --nodaemon -i SupervisorExampleApp

