#!/bin/bash

set -eu

# ensure that data directory is owned by 'cloudron' user
chown -R cloudron:cloudron /app/data

export PORT=8055
export PUBLIC_URL="/api/"
export LOG_LEVEL="info"
export LOG_STYLE="pretty"
       
export DB_CLIENT="pg" 
export DB_HOST="$CLOUDRON_POSTGRESQL_HOST"
export DB_PORT="$CLOUDRON_POSTGRESQL_PORT"
export DB_DATABASE="$CLOUDRON_POSTGRESQL_DATABASE"
export DB_USER="$CLOUDRON_POSTGRESQL_USERNAME"
export DB_PASSWORD="$CLOUDRON_POSTGRESQL_PASSWORD"
       
export RATE_LIMITER_ENABLED=true
export RATE_LIMITER_POINTS=5
export RATE_LIMITER_DURATION=1
export RATE_LIMITER_STORE="redis"
export RATE_LIMITER_EXEC_EVENLY=false
export RATE_LIMITER_BLOCK_DURATION=0
export RATE_LIMITER_KEY_PREFIX="rlflx"       
export RATE_LIMITER_REDIS="$CLOUDRON_REDIS_URL"
       
export CACHE_ENABLED=true
export CACHE_TTL="10m"
export CACHE_NAMESPACE="directus-cache"
export CACHE_STORE="redis"
       
export CACHE_REDIS="$CLOUDRON_REDIS_URL"
       
export STORAGE_LOCATIONS="local"
export STORAGE_LOCAL_PUBLIC_URL="/files"
export STORAGE_LOCAL_DRIVER="local"
export STORAGE_LOCAL_ROOT="/app/data/files"
       
export KEY="70E419CF-F7C4-431E-925B-661E44D01088"
export SECRET="E2F001F9-6BCD-4858-BB4F-8CE2D2886F56"
export ACCESS_TOKEN_TTL="15m"
export REFRESH_TOKEN_TTL="7d"
export REFRESH_TOKEN_COOKIE_SECURE="false"
export REFRESH_TOKEN_COOKIE_SAME_SITE="lax"
       
export CORS_ENABLED="true"
export CORS_ORIGIN="*"
export CORS_METHODS="GET,POST,PATCH,DELETE" 
export CORS_ALLOWED_HEADERS="Content-Type,Authorization"
export CORS_EXPOSED_HEADERS2="Content-Range"
export CORS_CREDENTIALS="true"
export CORS_MAX_AGE=18000
       
export EXTENSIONS_PATH="/app/data/extensions"
       
export EMAIL_FROM="$CLOUDRON_MAIL_FROM" 
export EMAIL_TRANSPORT="smtp" 
       
export EMAIL_SMTP_POOL=true
export EMAIL_SMTP_HOST="$CLOUDRON_MAIL_SMTP_SERVER"
export EMAIL_SMTP_PORT="$CLOUDRON_MAIL_SMTPS_PORT"
export EMAIL_SMTP_SECURE=true
export EMAIL_SMTP_USER="$CLOUDRON_MAIL_SMTP_USERNAME"
export EMAIL_SMTP_PASSWORD="$CLOUDRON_MAIL_SMTP_PASSWORD"
       
export ADMIN_EMAIL="admin@example.com"
export ADMIN_PASSWORD="changeme123"

if [[ ! -f /app/data/.initialized ]]; then
  echo "Fresh installation, setting up data directory..."
  exec /usr/local/bin/gosu cloudron:cloudron npx directus bootstrap
  touch /app/data/.initialized
  echo "Done."
fi

echo "==> Starting"
exec /usr/local/bin/gosu cloudron:cloudron npx directus start

