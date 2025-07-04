<?php

return array(
    "database_info" => array(
        
            "db_file" => "/prestashop/database.sql",
            "default_prefix" => "prestashopza_",
            "default_prefix_change_able" =>1
            
       
    ), 
    
     "database_replace" => array(
        
          
           "[[timestamp]]" => "{{timestamp}}",
          "[[time_now]]" => "{{time_now}}",
          "[[date_now]]" => "{{date_now}}",
            
       
    ),  
    "database" => array(
        
      

        array(
            "table" => "{{tablePrefix}}employee",
            "column" => "firstname",
            "where" => "id_employee=1",
            "value" => "{{adminUser}}",
            "type" => "plain"
        ),
        array(
            "table" => "{{tablePrefix}}employee",
            "column" => "lastname",
            "where" => "id_employee=1",
            "value" => "{{adminUser}}",
            "type" => "plain"
        ),
        array(
            "table" => "{{tablePrefix}}employee",
            "column" => "passwd",
            "where" => "id_employee=1",
            "value" => "{{adminPass}}",
            "type" => "BCRYPT"
        ),
        array(
            "table" => "{{tablePrefix}}employee",
            "column" => "email",
            "where" => "id_employee=1",
            "value" => "{{adminEmail}}",
            "type" => "plain"
        )
        ,
      array(
    "table" => "{{tablePrefix}}configuration",
    "column" => "value",
    "where" => "name='PS_SHOP_NAME'",
    "value" => "{{siteTitle}}",
    "type" => "plain"
),
array(
    "table" => "{{tablePrefix}}shop_url",
    "column" => "domain",
    "where" => "id_shop_url=1",
    "value" => "{{siteDomain}}",
    "type" => "plain"
),
array(
    "table" => "{{tablePrefix}}shop_url",
    "column" => "domain_ssl",
    "where" => "id_shop_url=1",
    "value" => "{{siteDomain}}",
    "type" => "plain"
),
array(
    "table" => "{{tablePrefix}}shop_url",
    "column" => "physical_uri",
    "where" => "id_shop_url=1",
    "value" => "{{rewriteBase}}/",
    "type" => "plain"
),
array(
    "table" => "{{tablePrefix}}configuration",
    "column" => "value",
    "where" => "name='PS_SHOP_DOMAIN'",
    "value" => "{{siteDomain}}",
    "type" => "plain"
),
array(
    "table" => "{{tablePrefix}}configuration",
    "column" => "value",
    "where" => "name='PS_SHOP_DOMAIN_SSL'",
    "value" => "{{siteDomain}}",
    "type" => "plain"
),
array(
    "table" => "{{tablePrefix}}configuration",
    "column" => "value",
    "where" => "name='PS_LOGS_EMAIL_RECEIVERS'",
    "value" => "{{adminEmail}}",
    "type" => "plain"
),
array(
    "table" => "{{tablePrefix}}configuration",
    "column" => "value",
    "where" => "name='MA_MERCHANT_MAILS'",
    "value" => "{{adminEmail}}",
    "type" => "plain"
),
array(
    "table" => "{{tablePrefix}}configuration",
    "column" => "value",
    "where" => "name='PS_SHOP_EMAIL'",
    "value" => "{{adminEmail}}",
    "type" => "plain"
)

    ),

   "create_file" => array(
  
  array(
    "file_name" => "app/config/parameters.php",
    "type" => "create",
    "location" => "root",
    "content" => <<<PHP
<?php return array (
  'parameters' => 
  array (
    'database_host' => '{{dbHost}}',
    'database_port' => '',
    'database_name' => '{{dbName}}',
    'database_user' => '{{dbUser}}',
    'database_password' => '{{dbPass}}',
    'database_prefix' => '{{tablePrefix}}',
    'database_engine' => 'InnoDB',
    'mailer_transport' => 'smtp',
    'mailer_host' => '127.0.0.1',
    'mailer_user' => NULL,
    'mailer_password' => NULL,
    'secret' => 'CDtxJNB24WoftuVqJXRkR7Vkrs67EIUzvf8dRXrb4BhiRQ6IArceGQPLdZ2fdNmQ',
    'ps_caching' => 'CacheMemcache',
    'ps_cache_enable' => false,
    'ps_creation_date' => '2025-06-25',
    'locale' => 'en-US',
    'use_debug_toolbar' => true,
    'cookie_key' => 'mjniy5ephslvxcmrrasmakghpzlkndsnm0ymk8dq1lrcsz0khwdcur3u8qvggjrr',
    'cookie_iv' => '8q4oacbrcnp4d1xcv0wqagc1xdbxdazw',
    'new_cookie_key' => 'def00000418ff331667eca34edf45e0126198410c5f164451e37369095420fb89f6fb6dbdeba12300437d8072191872ace65aee36ec4745237be3e0e7d0d801810239da6',
    'api_public_key' => '-----BEGIN PUBLIC KEY-----
MIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8AMIIBCgKCAQEA06IbS3iM/7BPkgNKYYqA
KwVGRGOad5dPIzVcgcXo6YRaZ+i9Ups2+w3ixXUW1oVASXnJkg5gZhlhco+ttHQQ
SJW0DdqROslG5uOYWTpk/QRUP/2sIkdLPYOc0D40XmtYwyigkFx7ZsncL7CyWOMf
HuPaL+k++/G0LzT6OJBgKdOuKsIi1Zzsz7z/nsWd/Fv4WByyLz281TzusafyrWBQ
ep12zUnoz2YJHebFwkC7hSX8P1Ueu5R/Zj0V+CLmM1k3nh55fUSER4tFfjzHLeu/
ni4XNQS/gPGAyCuMcW2qkqvWmQamaifulTFXl1ltNI20rd1rU7ZDsyzpOkAUz4Ek
twIDAQAB
-----END PUBLIC KEY-----',
    'api_private_key' => '-----BEGIN PRIVATE KEY-----
MIIEvAIBADANBgkqhkiG9w0BAQEFAASCBKYwggSiAgEAAoIBAQDTohtLeIz/sE+S
A0phioArBUZEY5p3l08jNVyBxejphFpn6L1Smzb7DeLFdRbWhUBJecmSDmBmGWFy
j620dBBIlbQN2pE6yUbm45hZOmT9BFQ//awiR0s9g5zQPjRea1jDKKCQXHtmydwv
sLJY4x8e49ov6T778bQvNPo4kGAp064qwiLVnOzPvP+exZ38W/hYHLIvPbzVPO6x
p/KtYFB6nXbNSejPZgkd5sXCQLuFJfw/VR67lH9mPRX4IuYzWTeeHnl9RIRHi0V+
PMct67+eLhc1BL+A8YDIK4xxbaqSq9aZBqZqJ+6VMVeXWW00jbSt3WtTtkOzLOk6
QBTPgSS3AgMBAAECggEACZ/rNtz2KKC3la/hn5sBZjN4tR6EhWDTwAmqudoq1Afp
ZqVeitW1Q+inQgynq7zmphDMWoCd4LbRyDiBkV3f6bUpOaIRjcdempyKLrCprBoY
zMo4HFz6roMATDYwAoVGRaXg23/hOtT+VwrlqYY2wZxiLWChtSqSY704jf7+6Jf7
KAs4KMJGrnzIT3JvDRZTtozVr5nkyxxynpe4V19ZfUSPX0YVjaGJI+xb1zgc1VEk
CFBN29eW9JEt1ItnOH3qjHRbIGOm+KV3BpsHViB3/Sl3/0ZNDmrMaWHDZI2ARaTB
y/DExjlmt2eNNyCXXXCtoEWHz6VRyWUeJ02lDEn4tQKBgQDVAcbJUmzZPTERSYOr
PZHwqSNCgAj0s7Nhj0dh5syfnyBcscWulpYTmnvw1v9/7V4/BRLVs7v9wRzr6oht
uVPrvEexntvlWfRcPeU/KTfjkaeqR1GzalOhjztB6F8sUQPciF9W3x8582IPmM11
1FzAXvin0s0wyS8faiRA+Qb2BQKBgQD+WVl4LXk34cjjcrKNZC8ZQkY+/UZbDFgk
0MBBJW2GHb/040Lg9kgZHnOn57G/DlsZZKkVLrdToveA3tC7OTQlletCSUbgnAp2
qnTTSf2saSmxGwZKbUs3Se4eyhXwF+kLe+01Qsi4r4eCK6gNtHJ75HXe2EtA+fm0
TckVa/hQiwKBgGd8VXe58+gXMp+Td8TaRO0HP3oveipoo93iHmwSFZf3V2GxfLk1
r/QWOeDok3kzeXZkoKHykILYL5TufRnR0FPXRX2mEG99JJsr9xSYke6d9TdlLuxb
3AXB8Kg0nQiK07VxC+DIxgMBm8K4GhoE8osDmQrv/4CUPbClgLeQRTGBAoGAGyHO
4HoBV0u3kUO39ks8lvYx5iBAdA/yCyNVjt1+PHNJ+caQaMz8zekorz2RAW93mlLZ
ko/kMIDO5ClgnMgyXtwKN4z3iZg7qYLvaWaYL98b+m+GkUPtZR120EQAaRcz3ey/
VhIktUbMLr+XcrbQC5VIWZg7FthTob82dxmIaJcCgYARmvCWQrUSrXd2WUrbmk/H
lM1IVvizxaJDnwgElY46znfq08PKYuy03ECUYw7/ISjk4kbztJAnDwrOWzLuF7Cg
5zsZ6Pn0MhvD9wPuuchkRX9zMX2ACTFwDhRBPX0VwLBSXs9DdjoUiqhTRagObjZw
I+FxPd8CUAloYns6qQ4AAA==
-----END PRIVATE KEY-----',
  ),
);
PHP
),

    array(
        "file_name" => ".htaccess",
        "type" => "create",
        "location" => "root",
        "content" => <<<HTACCESS
<IfModule mod_rewrite.c>
<IfModule mod_env.c>
SetEnv HTTP_MOD_REWRITE On
</IfModule>

RewriteEngine on


#Domain: {{siteDomain}}
RewriteRule . - [E=REWRITEBASE:{{rewriteBase}}/]
RewriteRule ^api(?:/(.*))?$ %{ENV:REWRITEBASE}webservice/dispatcher.php?url=$1 [QSA,L]
RewriteRule ^upload/.+$ %{ENV:REWRITEBASE}index.php [QSA,L]

# Images
RewriteCond %{HTTP_HOST} ^{{siteDomain}}$
RewriteRule ^(([\d])(?:\-[\w-]*)?)/.+(\.(?:jpe?g|webp|png|avif))$ %{ENV:REWRITEBASE}img/p/$2/$1$3 [L]
RewriteCond %{HTTP_HOST} ^{{siteDomain}}$
RewriteRule ^(([\d])([\d])(?:\-[\w-]*)?)/.+(\.(?:jpe?g|webp|png|avif))$ %{ENV:REWRITEBASE}img/p/$2/$3/$1$4 [L]
RewriteCond %{HTTP_HOST} ^{{siteDomain}}$
RewriteRule ^(([\d])([\d])([\d])(?:\-[\w-]*)?)/.+(\.(?:jpe?g|webp|png|avif))$ %{ENV:REWRITEBASE}img/p/$2/$3/$4/$1$5 [L]
RewriteCond %{HTTP_HOST} ^{{siteDomain}}$
RewriteRule ^(([\d])([\d])([\d])([\d])(?:\-[\w-]*)?)/.+(\.(?:jpe?g|webp|png|avif))$ %{ENV:REWRITEBASE}img/p/$2/$3/$4/$5/$1$6 [L]
RewriteCond %{HTTP_HOST} ^{{siteDomain}}$
RewriteRule ^(([\d])([\d])([\d])([\d])([\d])(?:\-[\w-]*)?)/.+(\.(?:jpe?g|webp|png|avif))$ %{ENV:REWRITEBASE}img/p/$2/$3/$4/$5/$6/$1$7 [L]
RewriteCond %{HTTP_HOST} ^{{siteDomain}}$
RewriteRule ^(([\d])([\d])([\d])([\d])([\d])([\d])(?:\-[\w-]*)?)/.+(\.(?:jpe?g|webp|png|avif))$ %{ENV:REWRITEBASE}img/p/$2/$3/$4/$5/$6/$7/$1$8 [L]
RewriteCond %{HTTP_HOST} ^{{siteDomain}}$
RewriteRule ^(([\d])([\d])([\d])([\d])([\d])([\d])([\d])(?:\-[\w-]*)?)/.+(\.(?:jpe?g|webp|png|avif))$ %{ENV:REWRITEBASE}img/p/$2/$3/$4/$5/$6/$7/$8/$1$9 [L]
RewriteCond %{HTTP_HOST} ^{{siteDomain}}$
RewriteRule ^c/([\d]+)(\-[\.*\w-]*)/.+(\.(?:jpe?g|webp|png|avif))$ %{ENV:REWRITEBASE}img/c/$1$2$3 [L]
RewriteCond %{HTTP_HOST} ^{{siteDomain}}$
RewriteRule ^c/([a-zA-Z_-]+)(-[\d]+)?/.+(\.(?:jpe?g|webp|png|avif))$ %{ENV:REWRITEBASE}img/c/$1$2$3 [L]
# AlphaImageLoader for IE and fancybox
RewriteRule ^images_ie/?([^/]+)\.(jpe?g|png|gif)$ %{ENV:REWRITEBASE}js/jquery/plugins/fancybox/images/$1.$2 [L]

# Dispatcher
RewriteCond %{REQUEST_FILENAME} -s [OR]
RewriteCond %{REQUEST_FILENAME} -l [OR]
RewriteCond %{REQUEST_FILENAME} -d
RewriteRule ^.*$ - [NC,L]
RewriteRule ^.*$ %{ENV:REWRITEBASE}index.php [NC,L]
</IfModule>

AddType application/vnd.ms-fontobject .eot
AddType font/ttf .ttf
AddType font/otf .otf
AddType application/font-woff .woff
AddType font/woff2 .woff2
<IfModule mod_headers.c>
	<FilesMatch "\.(ttf|ttc|otf|eot|woff|woff2|svg)$">
		Header set Access-Control-Allow-Origin "*"
	</FilesMatch>
</IfModule>

<Files composer.lock>
    # Apache 2.2
    <IfModule !mod_authz_core.c>
        Order deny,allow
        Deny from all
    </IfModule>

    # Apache 2.4
    <IfModule mod_authz_core.c>
        Require all denied
    </IfModule>
</Files>
#If rewrite mod isn't enabled
ErrorDocument 404 {{rewriteBase}}/index.php?controller=404

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
        "file_name" => "app/config/parameters.php",
      
        "location" => "root", // Adjust if your $targetFolder is not root of Drupal
        "replace_map" => array(
        )
    )
)

,

    
 "download" => array(
        
            "url" => "prestashop",
            "target_name" => "latest.zip",
            "ext" => "zip",
            "type" => "localhost",
            
       
    )
    ,
 "extract" => array(
        
            "target_name" => "prestashop.zip",
            "ext" => "zip",
          
    )
    ,   
"delete" => array(
    array(
        "path" => "install"
    )
)
    
);
