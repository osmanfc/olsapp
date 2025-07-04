<?php

$slug = $_POST['slug'] ?? '';
$ols_id = $_POST['ols_id'] ?? '';

if (!$slug || !$ols_id) {
    echo json_encode(['success' => false, 'message' => 'Missing theme slug or install ID']);
    exit;
}

// Get DB and install path
list($mysqli, $install) = $core->get_valid_wp_db_connection($metadataDb, $ols_id);
if ($mysqli === false) {
    echo json_encode(['success' => false, 'message' => 'Could not connect to WordPress DB']);
    exit;
}

$wp_theme_dir = rtrim($install['folder'], '/') . '/wp-content/themes';
$table_prefix = $install['table_prefix'] ?? 'wp_';

// 1. Get theme download link from WP.org API
$theme_info_url = "https://api.wordpress.org/themes/info/1.2/?action=theme_information&request[slug]=$slug";
$theme_info_json = file_get_contents($theme_info_url);
$theme_info = json_decode($theme_info_json, true);

if (empty($theme_info['download_link'])) {
    echo json_encode(['success' => false, 'message' => 'Theme not found or download link missing']);
    exit;
}

$download_link = $theme_info['download_link'];
$zip_path = sys_get_temp_dir() . "/$slug-theme.zip";

// 2. Download theme ZIP
file_put_contents($zip_path, file_get_contents($download_link));

// 3. Extract ZIP to themes directory
$zip = new ZipArchive();
if ($zip->open($zip_path) === true) {
    $zip->extractTo($wp_theme_dir);
    $zip->close();
    unlink($zip_path);
} else {
    echo json_encode(['success' => false, 'message' => 'Failed to extract ZIP']);
    exit;
}

// 4. Activate the theme in DB
$theme_slug = basename($slug);
$theme_stylesheet = $mysqli->real_escape_string($theme_slug);

$update1 = $mysqli->query("UPDATE {$table_prefix}options SET option_value = '$theme_stylesheet' WHERE option_name = 'template'");
$update2 = $mysqli->query("UPDATE {$table_prefix}options SET option_value = '$theme_stylesheet' WHERE option_name = 'stylesheet'");

if ($update1 && $update2) {
    echo json_encode(['success' => true, 'message' => 'Theme installed and activated']);
} else {
    echo json_encode(['success' => false, 'message' => 'Theme installed but activation failed']);
}
