#!/bin/bash

set -eu

# ensure that data directory is owned by 'cloudron' user
chown -R cloudron:cloudron /app/data

# Set environment vars

####################################################################################################
# General

cloudron env PORT=8055
cloudron env PUBLIC_URL="/"
cloudron env LOG_LEVEL="info"
cloudron env LOG_STYLE="pretty"

####################################################################################################
# Database

cloudron env DB_CLIENT="pg"
cloudron env DB_HOST="$CLOUDRON_POSTGRESQL_HOST"
cloudron env DB_PORT=$CLOUDRON_POSTGRESQL_PORT
cloudron env DB_DATABASE="$CLOUDRON_POSTGRESQL_DATABASE"
cloudron env DB_USER="$CLOUDRON_POSTGRESQL_USERNAME"
cloudron env DB_PASSWORD="$CLOUDRON_POSTGRESQL_PASSWORD"

####################################################################################################
# Rate Limiting

cloudron env RATE_LIMITER_ENABLED=true

cloudron env RATE_LIMITER_POINTS=50
cloudron env RATE_LIMITER_DURATION=1

cloudron env RATE_LIMITER_STORE=redis

cloudron env RATE_LIMITER_EXEC_EVENLY=false
cloudron env RATE_LIMITER_BLOCK_DURATION=0
cloudron env RATE_LIMITER_KEY_PREFIX=rlflx

cloudron env RATE_LIMITER_REDIS="$CLOUDRON_REDIS_URL"

####################################################################################################
# Caching

cloudron env CACHE_ENABLED=true
cloudron env CACHE_TTL="10m"
cloudron env CACHE_NAMESPACE="directus-cache"
cloudron env CACHE_STORE=redis

cloudron env CACHE_REDIS="$CLOUDRON_REDIS_URL"

####################################################################################################
# File Storage

cloudron env STORAGE_LOCATIONS="local"
cloudron env STORAGE_LOCAL_PUBLIC_URL="/files"
cloudron env STORAGE_LOCAL_DRIVER="local"
cloudron env STORAGE_LOCAL_ROOT="/app/data/files"

####################################################################################################
# Security

cloudron env KEY="70E419CF-F7C4-431E-925B-661E44D01088"
cloudron env SECRET="E2F001F9-6BCD-4858-BB4F-8CE2D2886F56"
cloudron env ACCESS_TOKEN_TTL="15m"
cloudron env REFRESH_TOKEN_TTL="7d"
cloudron env REFRESH_TOKEN_COOKIE_SECURE="false"
cloudron env REFRESH_TOKEN_COOKIE_SAME_SITE="lax"

cloudron env CORS_ENABLED="true"
cloudron env CORS_ORIGIN=*
cloudron env CORS_METHODS=GET,POST,PATCH,DELETE
cloudron env CORS_ALLOWED_HEADERS=Content-Type,Authorization
cloudron env CORS_EXPOSED_HEADERS=Content-Range
cloudron env CORS_CREDENTIALS="true"
cloudron env CORS_MAX_AGE=18000

####################################################################################################
# Extensions

cloudron env EXTENSIONS_PATH="/app/data/extensions"

####################################################################################################
# Email

cloudron env EMAIL_FROM="$CLOUDRON_MAIL_FROM"
cloudron env EMAIL_TRANSPORT="smtp"

## Email (SMTP Transport)
cloudron env EMAIL_SMTP_POOL=true
cloudron env EMAIL_SMTP_HOST="$CLOUDRON_MAIL_SMTP_SERVER"
cloudron env EMAIL_SMTP_PORT=$CLOUDRON_MAIL_SMTPS_PORT
cloudron env EMAIL_SMTP_SECURE=true
cloudron env EMAIL_SMTP_USER="$CLOUDRON_MAIL_SMTP_USERNAME"
cloudron env EMAIL_SMTP_PASSWORD="$CLOUDRON_MAIL_SMTP_PASSWORD"

# Run bootstrap
exec npm run bootstrap

echo "==> Starting supervisor"
exec /usr/bin/supervisord --configuration /etc/supervisor/supervisord.conf --nodaemon -i SupervisorExampleApp

