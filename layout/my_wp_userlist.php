<?php
list($mysqli, $install) = $core->get_valid_wp_db_connection($metadataDb, $_GET['ols_id']);

if ($mysqli === false) {
    echo "Could not connect to WordPress database.";
    exit;
}

$table_prefix = $install['table_prefix'] ?? 'wp_';
$users_table = $table_prefix . 'users';

$per_page = 20;
$page = isset($_GET['page']) ? max(1, intval($_GET['page'])) : 1;
$offset = ($page - 1) * $per_page;

// Total users count
$result = $mysqli->query("SELECT COUNT(*) as total FROM $users_table");
$total = $result->fetch_assoc()['total'] ?? 0;
$total_pages = ceil($total / $per_page);

// Fetch paginated users
$query = "SELECT ID, user_login, user_email, user_registered FROM $users_table ORDER BY ID ASC LIMIT $offset, $per_page";
$users_result = $mysqli->query($query);
?>

<div class="card-body p-0">
  <div class="table-responsive card">
    <table class="table">
      <thead class="bg-light">
        <tr class="border-0">
          <th class="border-0">ID</th>
          <th class="border-0">Username</th>
          <th class="border-0">Email</th>
          <th class="border-0">Registered</th>
          <th class="border-0" style="text-align: right;">Actions</th>
        </tr>
      </thead>
      <tbody>
        <?php while ($user = $users_result->fetch_assoc()): ?>
          <tr>
            <td><?= (int)$user['ID']; ?></td>
            <td><?= htmlspecialchars($user['user_login']); ?></td>
            <td><?= htmlspecialchars($user['user_email']); ?></td>
            <td><?= htmlspecialchars($user['user_registered']); ?></td>
           <td style="text-align: right;">
  <button class="icon-btn mx-1" title="Edit" onclick="openUserModal('edit', <?= $user['ID']; ?>)">
    <i class="fas fa-edit text-primary"></i>
  </button>
  <button class="icon-btn mx-1" title="Change Password" onclick="openUserModal('password', <?= $user['ID']; ?>)">
    <i class="fas fa-key text-warning"></i>
  </button>
</td>

          </tr>
        <?php endwhile; ?>
      </tbody>
    </table>
  </div>

  <!-- Pagination -->
  <nav class="mt-3 px-3 pb-3">
    <ul class="pagination justify-content-end">
      <?php if ($page > 1): ?>
        <li class="page-item">
          <a class="page-link" onclick="loadv('userTableBody', 'userSpinner', 'my_wp_userlist','<?= $page - 1; ?>');">Previous</a>
        </li>
      <?php endif; ?>
      <?php for ($i = 1; $i <= $total_pages; $i++): ?>
        <li class="page-item <?= ($i === $page) ? 'active' : ''; ?>">
          <a class="page-link" onclick="loadv('userTableBody', 'userSpinner', 'my_wp_userlist','<?= $i; ?>');"><?= $i; ?></a>
        </li>
      <?php endfor; ?>
      <?php if ($page < $total_pages): ?>
        <li class="page-item">
          <a class="page-link" onclick="loadv('userTableBody', 'userSpinner', 'my_wp_userlist','<?= $page + 1; ?>');">Next</a>
        </li>
      <?php endif; ?>
    </ul>
  </nav>
</div>


<div class="modal fade" id="userModal" tabindex="-1" role="dialog" aria-labelledby="userModalLabel" aria-hidden="true">
  <div class="modal-dialog modal-dialog-centered" role="document">
    <div class="modal-content">
      <div class="modal-header justify-content-between">
        <h5 class="modal-title" id="userModalLabel">User Action</h5>
       <button type="button" class="btn p-0 border-0 text-danger" onclick="dismissModal()" aria-label="Close">
  <i class="fas fa-window-close fa-lg"></i>
</button>

      </div>
      <div class="modal-body" id="userModalBody">Loading...</div>
    </div>
    
    
  </div>
</div>


