<?php

return array(
    "database_info" => array(
        
            "db_file" => "/joomla/database.sql",
            "default_prefix" => "joomla_",
            "default_prefix_change_able" =>1
            
       
    ), 
    "database_replace" => array(
        
            "[[regtime]]" => "{{time_now}}",
           "[[timestamp]]" => "{{timestamp}}",
            
       
    ),   
    "database" => array(
        array(
            "table" => "{{tablePrefix}}users",
            "column" => "name",
            "where" => "id=1",
            "value" => "{{adminUser}}",
            "type" => "plain"
        ),
         array(
            "table" => "{{tablePrefix}}users",
            "column" => "username",
            "where" => "id=1",
            "value" => "{{adminUser}}",
            "type" => "plain"
        ),
        array(
            "table" => "{{tablePrefix}}users",
            "column" => "password",
            "where" => "id=1",
            "value" => "{{adminPass}}",
            "type" => "BCRYPT"
        ),
        array(
            "table" => "{{tablePrefix}}users",
            "column" => "email",
            "where" => "id=1",
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
<IfModule mod_headers.c>
	# Serve gzip compressed CSS files if they exist
	# and the client accepts gzip.
	RewriteCond "%{HTTP:Accept-encoding}" "gzip"
	RewriteCond "%{REQUEST_FILENAME}\.gz" -s
	RewriteRule "^(.*)\.css" "$1\.css\.gz" [QSA]

	# Serve gzip compressed JS files if they exist
	# and the client accepts gzip.
	RewriteCond "%{HTTP:Accept-encoding}" "gzip"
	RewriteCond "%{REQUEST_FILENAME}\.gz" -s
	RewriteRule "^(.*)\.js" "$1\.js\.gz" [QSA]

	# Serve correct content types, and prevent mod_deflate double compression.
	RewriteRule "\.css\.gz$" "-" [T=text/css,E=no-gzip:1,E=no-brotli:1]
	RewriteRule "\.js\.gz$" "-" [T=text/javascript,E=no-gzip:1,E=no-brotli:1]

	<FilesMatch "(\.js\.gz|\.css\.gz)$">
		# Serve correct encoding type.
		Header set Content-Encoding gzip

		# Force proxies to cache gzipped &
		# non-gzipped css/js files separately.
		Header append Vary Accept-Encoding
	</FilesMatch>
</IfModule>
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
            "file_name" => "configuration.php",
            "sample_file_name" => "installation/configuration.php-dist",
            "location" => "root",
            "replace_map" => array(
               "public \$host = 'localhost';" => "public \$host = '{{dbHost}}';",
    "public \$user = '';" => "public \$user = '{{dbUser}}';",
    "public \$password = '';" => "public \$password = '{{dbPass}}';",
    "public \$db = '';" => "public \$db = '{{dbName}}';",
    "public \$dbprefix = 'jos_';" => "public \$dbprefix = '{{tablePrefix}}';",
    "public \$sitename = 'Joomla!';" => "public \$sitename = '{{siteTitle}}';",
    "public \$MetaDesc = 'Joomla! - the dynamic portal engine and content management system';" => "public \$MetaDesc = '{{siteDesc}}';"
            )
        ),
        // Add more file rules here if needed
    ),
 
    
 "download" => array(
        
            "url" => "https://downloads.joomla.org/cms/joomla5/5-3-1/Joomla_5-3-1-Stable-Full_Package.zip?format=zip",
            "target_name" => "latest.zip",
            "ext" => "zip",
            "type" => "remote",
            
       
    ) ,
    
"delete" => array(
    array(
        "path" => "installation"
    )
)

    
    
    
);
