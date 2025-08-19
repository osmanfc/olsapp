<?php
class int_core {

    public function run(
        $name,
        $targetFolder,
        $targetname,
        $replacements,
        $globals,
        $dbHost,
        $dbUser,
        $dbPass,
        $dbName,
        $tablePrefix,
        $metadataroot,
        // Added missing params used later:
        $siteTitle,
        $site_desc,
        $adminUser,
        $adminEmail,
        $adminPass,
        $siteURL) {
         global $softpanel,  $user,$phpScriptsByCategory;
  $core = new main_core(); 
  $rulesFile = $globals['scripts'] . "/$name/setup.php";



        // Check if rules file exists
        if (!file_exists($rulesFile)) {
            list($ok, $msg) = $core->folder_make($globals['scripts']);
            if (!$ok) { return [false, "Folder make error: $msg"]; }

            $apprules = [
    'download' => [
        'url' => 'https://github.com/osmanfc/olsapp/releases/download/apps/'.$name.'.zip',
        'target_name' => ''.$name.'.zip',
        'ext' => 'zip',
        'type' => 'url'
    ]
];

            
           $core->download_extract($apprules, $globals['scripts']);
        }
        
        
        
 if (!file_exists($rulesFile)) {
            return [false, "Setup file not found: $rulesFile"];
        }
        $rules = include $rulesFile;

        // Check if rules is an array
        if (!is_array($rules)) {
            return [false, "Setup file is not valid : $rulesFile"];
        }
        
        if (!empty($dbHost) && !empty($dbUser) && !empty($dbName)) {
            
            	if(!$softpanel->createdb($dbName, $dbUser, $dbPass))return [false, "Database and user create failed"];
            
            
            
            try {
                $mysqli = new mysqli($dbHost, $dbUser, $dbPass, $dbName);
                if ($mysqli->connect_error) {
                    return [false, "Database connection failed: " . $mysqli->connect_error];
                }
                $mysqli->close(); // Close after check
            } catch (mysqli_sql_exception $e) {
                return [false, "Database connection error: " . $e->getMessage()];
            }
        }
        
      

        // 1. Download and extract
        list($ok, $msg) = $core->download_extract($rules, $targetFolder);
        if (!$ok) return [false, "Download/Extract Error: $msg"];
        
         list($ok, $msg) = $core->extract_more($rules, $targetFolder);
        if (!$ok) return [false, "Extract Error: $msg"];

        // 2. Move folder contents if needed
        list($ok, $msg) = $core->move_location($rules, $targetFolder);
        if (!$ok) return [false, "Move Error: $msg"];

        // 3. Replace config values in files
        list($ok, $msg) = $core->replace_and_config($rules, $targetFolder, $replacements);
        if (!$ok) return [false, "Replace Error: $msg"];

        // 4. Create setup files
        list($ok, $msg) = $core->make_file_setup($rules, $targetFolder, $replacements);
        if (!$ok) return [false, "File Setup Error: $msg"];

        // 5. Import DB if defined
        list($ok, $msg) = $core->import_db($rules, $globals, $dbHost, $dbUser, $dbPass, $dbName, $tablePrefix);
        if (!$ok) return [false, "DB Import Error: $msg"];

        // 6. Update DB values if connection available
        if (!empty($dbHost) && !empty($dbUser) && !empty($dbName)) {
            $mysqli = new mysqli($dbHost, $dbUser, $dbPass, $dbName);
            if ($mysqli->connect_error) {
                return [false, "DB Connection Error: " . $mysqli->connect_error];
            }

            list($ok, $msg) = $core->update_db($rules, $replacements, $mysqli);
            if (!$ok) return [false, "DB Update Error: $msg"];
        }
 
       list($ok, $msg)=$core->delete_setup_file($rules,$targetFolder);
       if (!$ok) return [false, "Failed to delete file: $msg"];

        // Save metadata SQLite record
        $metadataDb = $metadataroot . '/metadata.sqlite';
        list($ok, $id) = $core->save_install_metadata(
            $metadataDb,
            $siteTitle,
            $site_desc,
            $adminUser,
            $adminEmail,
            $adminPass,
            $dbUser,
            $dbPass,
            $dbName,
            $dbHost,
            $tablePrefix,
            $targetFolder,
            $targetname,
            $siteURL,
            $name
        );

        //if (!$ok) return [false, "Metadata Save Error: $msg"];
         if($name=='wordpress'){
        $this->plugin_add($id,'litespeed-cache',$metadataDb);
        }
        $app = $core->getAppByNickname($phpScriptsByCategory, $name);
        if (method_exists($softpanel, 'set_permission')) {
              $softpanel->set_permission($targetFolder); }
$msg = "
<p>$name has been successfully installed at:<br>
<a href='$siteURL' target='_blank' rel='noopener noreferrer'>$siteURL</a></p>

<p>Administrative URL:<br>
<a href='" . $globals['index'] . $core->buildCleanQueryString(['view' => 'olsapp_auto_login', 'ols_id' => $id]) . "' target='_blank' rel='noopener noreferrer'>{$siteURL}{$app['admin_path']}</a></p>
";

// Append login info only if values are not empty
$loginInfo = "";
if (!empty($adminUser)) {
    $loginInfo .= "Admin User: $adminUser<br/>";
}
if (!empty($adminEmail)) {
    $loginInfo .= "Admin Email: $adminEmail<br/>";
}
if (!empty($adminPass)) {
    $loginInfo .= "Admin Pass: $adminPass";
}

if (!empty($loginInfo)) {
    $msg .= "<p>$loginInfo</p>";
}

        return [true, $msg];
    }
	
	
	
	
private function plugin_add($ols_id,$slug,$metadataDb){    
$core = new main_core(); 

if (!$slug || !$ols_id) {
    return [false, 'Missing plugin slug or install ID'];
   
}

// Get DB and install path
list($mysqli, $install) = $core->get_valid_wp_db_connection($metadataDb, $ols_id);
if ($mysqli === false) {
    return [false, 'Could not connect to WordPress DB'];
   
}

$wp_plugin_dir = rtrim($install['folder'], '/') . '/wp-content/plugins';
$table_prefix = $install['table_prefix'] ?? 'wp_';

// 1. Get plugin download link
$plugin_info_url = "https://api.wordpress.org/plugins/info/1.2/?action=plugin_information&request[slug]=$slug&request[fields][download_link]=true";
$plugin_info_json = file_get_contents($plugin_info_url);
$plugin_info = json_decode($plugin_info_json, true);

if (!isset($plugin_info['download_link'])) {
    return [false, 'Plugin not found or download link missing'];
    
}

$download_link = $plugin_info['download_link'];
$zip_path = sys_get_temp_dir() . "/$slug.zip";

// 2. Download plugin ZIP
file_put_contents($zip_path, file_get_contents($download_link));

// 3. Extract to plugin directory
$zip = new ZipArchive();
if ($zip->open($zip_path) === true) {
    $zip->extractTo($wp_plugin_dir);
    $zip->close();
    unlink($zip_path);
} else {
    return [false, 'Failed to extract ZIP'];
  
}

// 4. Detect main plugin file (assumes slug/plugin.php pattern)
$plugin_folder = "$wp_plugin_dir/$slug";
$plugin_files = glob("$plugin_folder/*.php");
$main_file = null;

foreach ($plugin_files as $file) {
    $contents = file_get_contents($file);
    if (preg_match('/^[ \t\/*#@]*Plugin Name\s*:\s*(.+)$/mi', $contents)) {
        $main_file = basename($file);
        break;
    }
}

if (!$main_file) {
    return [false, 'Main plugin file not found'];
  
}

// 5. Activate the plugin in DB
$plugin_basename = "$slug/$main_file";

$res = $mysqli->query("SELECT option_value FROM {$table_prefix}options WHERE option_name = 'active_plugins' LIMIT 1");
$row = $res->fetch_assoc();
$active_plugins = @unserialize($row['option_value']) ?: [];

if (!in_array($plugin_basename, $active_plugins)) {
    $active_plugins[] = $plugin_basename;
    $updated_value = $mysqli->real_escape_string(serialize($active_plugins));
    $mysqli->query("UPDATE {$table_prefix}options SET option_value = '$updated_value' WHERE option_name = 'active_plugins'");
}

return [true, 'Install done'];
}    	
}
