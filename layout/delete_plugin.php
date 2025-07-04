<?php

list($mysqli, $install) = $core->get_valid_wp_db_connection($metadataDb, $_GET['ols_id'] ?? '');

if (!$install || empty($_GET['slug'])) {
    echo json_encode(['success' => false, 'message' => 'Missing data.']);
    exit;
}

$slug = basename($_GET['slug']);
$wp_plugin_dir = rtrim($install['folder'], '/') . '/wp-content/plugins';
$plugin_folder = "$wp_plugin_dir/$slug";

// Step 1: Deactivate the plugin
$table_prefix = $install['table_prefix'] ?? 'wp_';
$res = $mysqli->query("SELECT option_value FROM {$table_prefix}options WHERE option_name = 'active_plugins'");
$row = $res->fetch_assoc();
$active_plugins = @unserialize($row['option_value']);

if (is_array($active_plugins)) {
    $active_plugins = array_filter($active_plugins, function($plugin) use ($slug) {
        return strpos($plugin, "$slug/") !== 0;
    });

    $active_plugins_serialized = serialize(array_values($active_plugins));
    $mysqli->query("UPDATE {$table_prefix}options SET option_value = '" . $mysqli->real_escape_string($active_plugins_serialized) . "' WHERE option_name = 'active_plugins'");
}

// Step 2: Delete plugin folder


if (is_dir($plugin_folder)) {
    $core->delete_directory_recursive($plugin_folder);
    echo json_encode(['success' => true, 'message' => 'Plugin deleted']);
    echo '<meta http-equiv="refresh" content="0;url=' . $globals['index'] . $core->buildCleanQueryString(['view' => 'wordpress_plugin', 'ols_id' => $_GET['ols_id']]) . '">';

} else {
    echo json_encode(['success' => false, 'message' => 'Plugin folder not found']);
}
