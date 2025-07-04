<?php

return array(
    "database_info" => array(
        
            "db_file" => "/laravel/database.sql",
            "default_prefix" => "",
            "default_prefix_change_able" =>0
            
       
    ),   
    "database" => array(),

   "create_file" => array(
    array(
        "file_name" => ".htaccess",
        "type" => "create",
        "location" => "root",
        "content" => <<<HTACCESS
        # Prevent access to dotfiles like .env
<FilesMatch "^\.">
    <IfModule !mod_authz_core.c>
        Order deny,allow
        Deny from all
    </IfModule>
    <IfModule mod_authz_core.c>
        Require all denied
    </IfModule>
</FilesMatch>

RewriteEngine On
RewriteRule ^{{rewriteBase}}/?$ {{siteURL}} [R=301,L]
HTACCESS
    ),
    array(
        "file_name" => "olsapp.txt",
        "type" => "create",
        "location" => "root",
        "content" => <<<TEXT
app.olspnel.com
TEXT
    ),
array(
    "file_name" => "index.php", 
    "type" => "create",
    "location" => "root",
    "content" => <<<PHP
<?php
header("Location: public/");
exit;
PHP
)
,
array(
        "file_name" => ".env",
        "type" => "create",
        "location" => "root",
        "content" => <<<TEXT
APP_NAME=Laravel
APP_ENV=local
APP_KEY=base64:eGN1ZXZyczV0eHdydmZ2dW5md3Bsd216eTBkYTh3Y2Y=
APP_DEBUG=true
APP_TIMEZONE=UTC
APP_URL={{siteURL}}

APP_LOCALE=en
APP_FALLBACK_LOCALE=en
APP_FAKER_LOCALE=en_US

APP_MAINTENANCE_DRIVER=file
# APP_MAINTENANCE_STORE=database

PHP_CLI_SERVER_WORKERS=4

BCRYPT_ROUNDS=12

LOG_CHANNEL=stack
LOG_STACK=single
LOG_DEPRECATIONS_CHANNEL=null
LOG_LEVEL=debug

DB_CONNECTION=mysql
DB_HOST={{dbHost}}
DB_PORT=3306
DB_DATABASE={{dbName}}
DB_USERNAME={{dbUser}}
DB_PASSWORD={{dbPass}}

SESSION_DRIVER=database
SESSION_LIFETIME=120
SESSION_ENCRYPT=false
SESSION_PATH=/
SESSION_DOMAIN=null

BROADCAST_CONNECTION=log
FILESYSTEM_DISK=local
QUEUE_CONNECTION=database

CACHE_STORE=database
CACHE_PREFIX=

MEMCACHED_HOST=127.0.0.1

REDIS_CLIENT=phpredis
REDIS_HOST=127.0.0.1
REDIS_PASSWORD=null
REDIS_PORT=6379

MAIL_MAILER=log
MAIL_SCHEME=null
MAIL_HOST=127.0.0.1
MAIL_PORT=2525
MAIL_USERNAME=null
MAIL_PASSWORD=null
MAIL_FROM_ADDRESS="hello@example.com"
MAIL_FROM_NAME="\${APP_NAME}"

AWS_ACCESS_KEY_ID=
AWS_SECRET_ACCESS_KEY=
AWS_DEFAULT_REGION=us-east-1
AWS_BUCKET=
AWS_USE_PATH_STYLE_ENDPOINT=false

VITE_APP_NAME="\${APP_NAME}"
TEXT
    )    
),

    "change_file" => array(
        array(
            "file_name" => ".env",
            "sample_file_name" => "",
            "location" => "root",
            "replace_map" => array()
        ),
        // Add more file rules here if needed
    ),
    
 "move" => array(),
    
 "download" => array(
        
            "url" => "https://github.com/osmanfc/olsapp/releases/download/script/laravel.zip",
            "target_name" => "latest.zip",
            "ext" => "zip",
            "type" => "remote",
            
       
    )      
    
);
