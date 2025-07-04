<?php


$slug = $_POST['slug'] ?? '';
$ols_id = $_POST['ols_id'] ?? '';

if (!$slug || !$ols_id) {
    echo json_encode(['success' => false, 'message' => 'Missing plugin slug or install ID']);
    exit;
}

// Get DB and install path
list($mysqli, $install) = $core->get_valid_wp_db_connection($metadataDb, $ols_id);
if ($mysqli === false) {
    echo json_encode(['success' => false, 'message' => 'Could not connect to WordPress DB']);
    exit;
}

$wp_plugin_dir = rtrim($install['folder'], '/') . '/wp-content/plugins';
$table_prefix = $install['table_prefix'] ?? 'wp_';

// 1. Get plugin download link
$plugin_info_url = "https://api.wordpress.org/plugins/info/1.2/?action=plugin_information&request[slug]=$slug&request[fields][download_link]=true";
$plugin_info_json = file_get_contents($plugin_info_url);
$plugin_info = json_decode($plugin_info_json, true);

if (!isset($plugin_info['download_link'])) {
    echo json_encode(['success' => false, 'message' => 'Plugin not found or download link missing']);
    exit;
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
    echo json_encode(['success' => false, 'message' => 'Failed to extract ZIP']);
    exit;
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
    echo json_encode(['success' => false, 'message' => 'Main plugin file not found']);
    exit;
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

echo json_encode(['success' => true, 'message' => 'Plugin installed and activated']);
