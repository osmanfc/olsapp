<?php

return array(
    "database_info" => array(
        
            "db_file" => "/drupal/database.sql",
            "default_prefix" => "drupal_",
            "default_prefix_change_able" =>1
            
       
    ), 
    
     "database_replace" => array(
        
          
           "[[timestamp]]" => "{{timestamp}}",
          "[[timestamp_nextday]]" => "{{timestamp}}",
          "[[siteURL]]" => "{{siteURL}}",
            
       
    ),  
    "database" => array(
        
      

        array(
            "table" => "{{tablePrefix}}users_field_data",
            "column" => "name",
            "where" => "uid=1",
            "value" => "{{adminUser}}",
            "type" => "plain"
        ),
        array(
            "table" => "{{tablePrefix}}users_field_data",
            "column" => "pass",
            "where" => "uid=1",
            "value" => "{{adminPass}}",
            "type" => "BCRYPT"
        ),
        array(
            "table" => "{{tablePrefix}}users_field_data",
            "column" => "mail",
            "where" => "uid=1",
            "value" => "{{adminEmail}}",
            "type" => "plain"
        )
        ,
        array(
            "table" => "{{tablePrefix}}users_field_data",
            "column" => "init",
            "where" => "uid=1",
            "value" => "{{adminEmail}}",
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
    )
),

   "change_file" => array(
    array(
        "file_name" => "sites/default/settings.php",
        "sample_file_name" => "sites/default/default.settings.php",
        "location" => "root", // Adjust if your $targetFolder is not root of Drupal
        "replace_map" => array(
            "\$settings['hash_salt'] = '';" => "\$settings['hash_salt'] = 'i9wdhZsHLAOGTtPvK6ubWOOkKDHOX0-CRq1v8mLsePwM3KsoO4RpWocR1PtQ3njtN2MjGQQo3g';",
               "# \$settings['config_sync_directory'] = '/directory/outside/webroot';" =>
                "\$settings['config_sync_directory'] = 'sites/default/files/config_i9wdhZsHLAOGTtPvK6ubWOOkKDHOX0-CRq1v8mLsePwM3KsoO4RpWocR1PtQ3njtN2MjGQQo3g/sync';",
            # $settings['config_sync_directory'] = '/directory/outside/webroot';
            '$databases = [];' => <<<PHP
\$databases['default']['default'] = [
  'database' => '{{dbName}}',
  'username' => '{{dbUser}}',
  'password' => '{{dbPass}}',
  'host' => '{{dbHost}}',
  'port' => '3306',
  'driver' => 'mysql',
  'prefix' => '{{tablePrefix}}',
  'collation' => 'utf8mb4_general_ci',
];
PHP

        )
    )
)

,
    
 "move" => array(
        array(
            "move" => 1,
            "source_path_pattern" => "drupal-*",
            
        ),
        // Add more file rules here if needed
    ),
    
 "download" => array(
        
            "url" => "drupal",
            "target_name" => "latest.zip",
            "ext" => "zip",
            "type" => "localhost",
            
       
    )
    ,
    
"delete" => array(
    array(
        "path" => "core/install.php"
    )
)
    
);
