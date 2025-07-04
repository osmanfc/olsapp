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

// Only activate (WordPress allows only one theme active at a time)
if ($active === 1) {
    $slug_safe = $mysqli->real_escape_string($slug);

    $success1 = $mysqli->query("UPDATE {$table_prefix}options SET option_value = '$slug_safe' WHERE option_name = 'template'");
    $success2 = $mysqli->query("UPDATE {$table_prefix}options SET option_value = '$slug_safe' WHERE option_name = 'stylesheet'");

    if ($success1 && $success2) {
        echo json_encode(['success' => true, 'message' => 'Theme activated']);
    } else {
        echo json_encode(['success' => false, 'message' => 'Failed to activate theme']);
    }
} else {
    echo json_encode(['success' => false, 'message' => 'Only one theme can be active']);
}
