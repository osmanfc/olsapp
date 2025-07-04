<?php

return array(
    "database_info" => array(
        
            "db_file" => "/wordpress/database.sql",
            "default_prefix" => "wp_",
            "default_prefix_change_able" =>1
            
       
    ),   
    "database" => array(
        array(
            "table" => "{{tablePrefix}}options",
            "column" => "option_value",
            "where" => "option_name='blogname'",
            "value" => "{{siteTitle}}",
            "type" => "plain"
        ),
        
    array(
        "table" => "{{tablePrefix}}options",
        "column" => "option_value",
        "where" => "option_name='blogdescription'",
        "value" => "{{siteDesc}}",
        "type" => "plain"
    ),
        array(
            "table" => "{{tablePrefix}}options",
            "column" => "option_value",
            "where" => "option_name='siteurl'",
            "value" => "{{siteURL}}",
            "type" => "plain"
        ),
        array(
            "table" => "{{tablePrefix}}options",
            "column" => "option_value",
            "where" => "option_name='home'",
            "value" => "{{siteURL}}",
            "type" => "plain"
        ),
        array(
            "table" => "{{tablePrefix}}options",
            "column" => "option_value",
            "where" => "option_name='admin_email'",
            "value" => "{{adminEmail}}",
            "type" => "plain"
        ),
        array(
            "table" => "{{tablePrefix}}users",
            "column" => "user_login",
            "where" => "ID=1",
            "value" => "{{adminUser}}",
            "type" => "plain"
        ),
        array(
            "table" => "{{tablePrefix}}users",
            "column" => "user_pass",
            "where" => "ID=1",
            "value" => "{{adminPass}}",
            "type" => "BCRYPT"
        ),
        array(
            "table" => "{{tablePrefix}}users",
            "column" => "user_email",
            "where" => "ID=1",
            "value" => "{{adminEmail}}",
            "type" => "plain"
        )
    ),

   "create_file" => array(
    array(
        "file_name" => ".htaccess",
        "type" => "create",
        "location" => "root",
        "content" => <<<HTACCESS
# BEGIN WordPress
<IfModule mod_rewrite.c>
RewriteEngine On
RewriteBase {{rewriteBase}}
RewriteRule ^index\.php$ - [L]

RewriteCond %{REQUEST_FILENAME} !-f
RewriteCond %{REQUEST_FILENAME} !-d
RewriteRule . {{rewriteBase}}/index.php [L]
</IfModule>
# END WordPress
HTACCESS
    ),
    array(
        "file_name" => "olsapp.txt",
        "type" => "create",
        "location" => "root",
        "content" => <<<TEXT
app.olspnel.com
TEXT
    )
),

    "change_file" => array(
        array(
            "file_name" => "wp-config.php",
            "sample_file_name" => "wp-config-sample.php",
            "location" => "root",
            "replace_map" => array(
                "database_name_here" => "{{dbName}}",
                "username_here" => "{{dbUser}}",
                "password_here" => "{{dbPass}}",
                "localhost" => "{{dbHost}}",
                "'wp_'" => "'{{tablePrefix}}'"
            )
        ),
        // Add more file rules here if needed
    ),
    
 "move" => array(
        array(
            "move" => 1,
            "source_path" => "wordpress",
            
        ),
        // Add more file rules here if needed
    ),
    
 "download" => array(
        
            "url" => "https://wordpress.org/latest.zip",
            "target_name" => "latest.zip",
            "ext" => "zip",
            "type" => "remote",
            
       
    )      
    
);
