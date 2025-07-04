<?php
$user_id = $_GET['user_id'] ?? 0;
$ols_id = $_GET['ols_id'] ?? '';

list($mysqli, $install) = $core->get_valid_wp_db_connection($metadataDb, $ols_id);
$table_prefix = $install['table_prefix'] ?? 'wp_';

$res = $mysqli->query("SELECT user_login, user_email FROM {$table_prefix}users WHERE ID = $user_id");
$user = $res->fetch_assoc();
?>

<form id="editUserForm">
     <div id="fstatus" style="margin-top: 5px; font-weight: bold; display: none;"></div>
  <div class="mb-3">
    <label>Username</label>
    <input type="text" class="form-control" value="<?= htmlspecialchars($user['user_login']); ?>" disabled>
  </div>
  <div class="mb-3">
    <label>Email</label>
    <input type="email" class="form-control" name="user_email" value="<?= htmlspecialchars($user['user_email']); ?>" required>
  </div>
  <input type="hidden" name="user_id" value="<?= $user_id ?>">
  <input type="hidden" name="ols_id" value="<?= $ols_id ?>">
  <button type="submit" class="btn btn-primary" onclick="submitEditUserForm()">Update</button>
</form>


