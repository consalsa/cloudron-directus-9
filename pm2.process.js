let output = {
  apps: [
    {
      name: "directus",
      script: "directus start",
      cwd: "/app/code",
      env: {
        NODE_ENV: "development",
        PORT : 8055,
        PUBLIC_URL : "/",
        LOG_LEVEL : "info",
        LOG_STYLE : "pretty",
       
        DB_CLIENT : "pg",
        DB_HOST : process.env.CLOUDRON_POSTGRESQL_HOST,
        DB_PORT : process.env.CLOUDRON_POSTGRESQL_PORT,
        DB_DATABASE : process.env.CLOUDRON_POSTGRESQL_DATABASE,
        DB_USER : process.env.CLOUDRON_POSTGRESQL_USERNAME,
        DB_PASSWORD : process.env.CLOUDRON_POSTGRESQL_PASSWORD,
       
        RATE_LIMITER_ENABLED : true,       
        RATE_LIMITER_POINTS : 50,
        RATE_LIMITER_DURATION : 1,       
        RATE_LIMITER_STORE : redis,       
        RATE_LIMITER_EXEC_EVENLY : false,
        RATE_LIMITER_BLOCK_DURATION : 0,
        RATE_LIMITER_KEY_PREFIX : rlflx,       
        RATE_LIMITER_REDIS : process.env.CLOUDRON_REDIS_URL,
       
        CACHE_ENABLED : true,
        CACHE_TTL : "10m",
        CACHE_NAMESPACE : "directus-cache",
        CACHE_STORE : redis,
       
        CACHE_REDIS : process.env.CLOUDRON_REDIS_URL,
       
        STORAGE_LOCATIONS : "local",
        STORAGE_LOCAL_PUBLIC_URL : "/files",
        STORAGE_LOCAL_DRIVER : "local",
        STORAGE_LOCAL_ROOT : "/app/data/files",
       
        KEY : "70E419CF-F7C4-431E-925B-661E44D01088",
        SECRET : "E2F001F9-6BCD-4858-BB4F-8CE2D2886F56",
        ACCESS_TOKEN_TTL : "15m",
        REFRESH_TOKEN_TTL : "7d",
        REFRESH_TOKEN_COOKIE_SECURE : "false",
        REFRESH_TOKEN_COOKIE_SAME_SITE : "lax",
       
        CORS_ENABLED : "true",
        CORS_ORIGIN : "*",
        CORS_METHODS : GET,POST,PATCH,DELETE, 
        CORS_ALLOWED_HEADERS : Content-Type,Authorization,
        CORS_EXPOSED_HEADERS : Content-Range,
        CORS_CREDENTIALS : "true",
        CORS_MAX_AGE : 18000,
       
        EXTENSIONS_PATH : "/app/data/extensions",
       
        EMAIL_FROM : process.env.CLOUDRON_MAIL_FROM, 
        EMAIL_TRANSPORT : "smtp", 
       
        EMAIL_SMTP_POOL : true,
        EMAIL_SMTP_HOST : process.env.CLOUDRON_MAIL_SMTP_SERVER,
        EMAIL_SMTP_PORT : process.env.CLOUDRON_MAIL_SMTPS_PORT,
        EMAIL_SMTP_SECURE : true,
        EMAIL_SMTP_USER : process.env.CLOUDRON_MAIL_SMTP_USERNAME,
        EMAIL_SMTP_PASSWORD : process.env.CLOUDRON_MAIL_SMTP_PASSWORD,
       
        ADMIN_EMAIL : "admin@example.com",
        ADMIN_PASSWORD : "changeme123"

      },
    },
  ],
};

module.exports = output;
