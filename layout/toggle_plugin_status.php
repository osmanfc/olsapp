<?php


$slug = $_POST['slug'] ?? '';
$active = isset($_POST['active']) ? (int)$_POST['active'] : null;
$ols_id = $_POST['ols_id'] ?? '';

if (!$slug || !in_array($active, [0, 1], true) || !$ols_id) {
    echo json_encode(['success' => false, 'message' => 'Invalid request']);
    exit;
}

list($mysqli, $install) = $core->get_valid_wp_db_connection($metadataDb, $ols_id);
if ($mysqli === false) {
    echo json_encode(['success' => false, 'message' => 'DB connection failed']);
    exit;
}

$table_prefix = $install['table_prefix'] ?? 'wp_';

// Fetch current active plugins
$res = $mysqli->query("SELECT option_value FROM {$table_prefix}options WHERE option_name = 'active_plugins' LIMIT 1");
$row = $res->fetch_assoc();
$active_plugins = @unserialize($row['option_value']) ?: [];

// Add or remove the plugin
$plugin_file = $slug . '/' . $slug . '.php'; // adjust if plugin main file isn't same name

if ($active) {
    if (!in_array($plugin_file, $active_plugins)) {
        $active_plugins[] = $plugin_file;
    }
} else {
    $active_plugins = array_filter($active_plugins, function($p) use ($plugin_file) {
    return $p !== $plugin_file;
});

}

// Update DB
$new_value = $mysqli->real_escape_string(serialize(array_values($active_plugins)));
$update = $mysqli->query("UPDATE {$table_prefix}options SET option_value = '$new_value' WHERE option_name = 'active_plugins'");

if ($update) {
    echo json_encode(['success' => true, 'message' => 'Plugin status updated']);
} else {
    echo json_encode(['success' => false, 'message' => 'Failed to update plugin status']);
}
?>
