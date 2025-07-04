<?php

list($mysqli, $install) = $core->get_valid_wp_db_connection($metadataDb, $_GET['ols_id'] ?? '');

if (!$install || empty($_GET['slug'])) {
    echo json_encode(['success' => false, 'message' => 'Missing theme slug or install ID.']);
    exit;
}

$slug = basename($_GET['slug']); // Theme folder name
$wp_theme_dir = rtrim($install['folder'], '/') . '/wp-content/themes';
$theme_folder = "$wp_theme_dir/$slug";

// Get table prefix
$table_prefix = $install['table_prefix'] ?? 'wp_';

// Step 1: Check if it's the active theme
$res = $mysqli->query("SELECT option_name, option_value FROM {$table_prefix}options WHERE option_name IN ('template', 'stylesheet')");
$active_theme = [];

while ($row = $res->fetch_assoc()) {
    $active_theme[$row['option_name']] = $row['option_value'];
}

// Prevent deletion if theme is active
if ($active_theme['template'] === $slug || $active_theme['stylesheet'] === $slug) {
    echo json_encode(['success' => false, 'message' => 'Cannot delete the active theme.']);
    exit;
}

// Step 2: Delete the theme folder
if (is_dir($theme_folder)) {
    if ($core->delete_directory_recursive($theme_folder)) {
        echo json_encode(['success' => true, 'message' => 'Theme deleted successfully.']);
        echo '<meta http-equiv="refresh" content="0;url=' . $globals['index'] . $core->buildCleanQueryString(['view' => 'wordpress_plugin', 'ols_id' => $_GET['ols_id']]) . '">';
    } else {
        echo json_encode(['success' => false, 'message' => 'Failed to delete theme directory.']);
    }
} else {
    echo json_encode(['success' => false, 'message' => 'Theme folder not found.']);
}
