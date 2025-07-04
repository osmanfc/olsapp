<?php

return array(
    "database_info" => array(
        
            "db_file" => "/silverstripe/database.sql",
            "default_prefix" => "",
            "default_prefix_change_able" =>0
            
       
    ), 
    
     "database_replace" => array(
        
          
           "[[timestamp]]" => "{{timestamp}}",
          "[[timestamp_nextday]]" => "{{timestamp}}",
          "[[siteURL]]" => "{{siteURL}}",
            
       
    ),  
    "database" => array(
     
        array(
            "table" => "SiteConfig",
            "column" => "Title",
            "where" => "ID=1",
            "value" => "{{siteTitle}}",
            "type" => "plain"
        ),
        array(
            "table" => "SiteConfig",
            "column" => "Tagline",
            "where" => "ID=1",
            "value" => "{{siteTitle}}",
            "type" => "plain"
        )
        
    ),

   "create_file" => array(
   
    array(
        "file_name" => "olsapp.txt",
        "type" => "create",
        "location" => "root",
        "content" => <<<TEXT
app.olspnel.com
TEXT
    ),  
     array(
        "file_name" => ".env",
        "type" => "create",
        "location" => "root",
        "content" =>  <<<TEXT
SS_DATABASE_CLASS="MySQLDatabase"
SS_DATABASE_SERVER="{{dbHost}}"
SS_DATABASE_USERNAME="{{dbUser}}"
SS_DATABASE_PASSWORD="{{dbPass}}"
SS_DATABASE_NAME="{{dbName}}"
SS_DEFAULT_ADMIN_USERNAME="{{adminEmail}}"
SS_DEFAULT_ADMIN_PASSWORD="{{adminPass}}"
# WARNING: in a live environment, change this to "live" instead of dev
SS_ENVIRONMENT_TYPE="live"
TEXT
    ),
    
array(
        "file_name" => "public/.htaccess",
        "type" => "create",
        "location" => "root",
        "content" => <<<HTACCESS
<IfModule mod_rewrite.c>
    RewriteEngine On

    RewriteCond %{REQUEST_FILENAME} !-f
    RewriteRule .* index.php
</IfModule>

HTACCESS
    ),    
    
),

   "change_file" => array(
    array(
        "file_name" => ".env",
        "sample_file_name" => "",
        "location" => "root", // Adjust if your $targetFolder is not root of Drupal
        "replace_map" => array()
    )
)

,
    

    
 "download" => array(
        
            "url" => "https://github.com/osmanfc/olsapp/releases/download/script/silverstripe.zip",
            "target_name" => "latest.zip",
            "ext" => "zip",
            "type" => "remote",
            
       
    )
    ,
    

    
);
