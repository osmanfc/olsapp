<?php
$backups = $core->get_backup_metadata($metadataDb);



?>

<div class="dashboard-wrapper">
  <div class="container-fluid dashboard-content">
    <div class="card">
      <h5 class="card-header">My Backups</h5>
      <div class="card-body p-0">
        <div class="table-responsive">
          <table class="table">
            <thead class="bg-light">
              <tr class="border-0">
                <th class="border-0">ID</th>
                <th class="border-0">Image</th>
                <th class="border-0">App</th>
                <th class="border-0">URL</th>
                <th class="border-0">Time</th>
                <th class="border-0">Path</th>
                <th class="border-0">Option</th>
              </tr>
            </thead>
            <tbody>
              <?php
              if ($backups === false || empty($backups)) {
                  echo '<tr><td colspan="7" class="text-center">No backups found.</td></tr>';
              } else {
                  foreach ($backups as $backup) {
                      $app = $core->getAppByNickname($phpScriptsByCategory, $backup['app_type']);
                      $img = htmlspecialchars('assets/appicon/' . $app['logo'], ENT_QUOTES, 'UTF-8');
                      $url = htmlspecialchars($backup['site_url'], ENT_QUOTES, 'UTF-8');
                      $created = htmlspecialchars($backup['created_at'], ENT_QUOTES, 'UTF-8');
                      $folder = htmlspecialchars($backup['folder'], ENT_QUOTES, 'UTF-8');
                      $file =  htmlspecialchars(basename($backup['folder']));
                      $collapseId = 'backup_coll_' . $backup['id'];
              ?>
              <tr>
                <td>
                  <?= $backup['id']; ?>
                  <button class="btn btn-link p-0" data-toggle="collapse" data-target="#<?= $collapseId; ?>">
                    <i class="fas fa-plus-square"></i>
                  </button>
                </td>
                <td><img src="<?= $img; ?>" alt="app" class="rounded" width="45"></td>
                <td><?= htmlspecialchars($backup['app_type']); ?></td>
                <td><a href="<?= $url; ?>" target="_blank"><?= $url; ?></a></td>
                <td><?= $created; ?></td>
                <td><code><?= $file; ?></code></td>
                <td>
                 <a href="<?= $globals['index'] . $core->buildCleanQueryString(['view' => 'download', 'download' => $backup['id']]); ?>" 
   class="icon-btn mx-1 text-primary" 
   title="Download">
   <i class="fas fa-download"></i>
</a>
                  <a href="<?= $globals['index'] . $core->buildCleanQueryString(['view' => 'restore_backup', 'id' => $backup['id']]); ?>" class="icon-btn mx-1 text-success" title="Restore">
                    <i class="fas fa-undo-alt"></i>
                  </a>
                 <a href="<?= $globals['index'] . $core->buildCleanQueryString(['view' => 'download', 'delete' => $backup['id']]); ?>"
   class="icon-btn mx-1 text-danger"
   title="Delete"
   onclick="return confirm('Are you sure you want to delete this backup?');">
    <i class="fas fa-trash-alt"></i>
</a>

                </td>
              </tr>
              <tr class="collapse" id="<?= $collapseId; ?>">
                <td colspan="7">
                  <div class="card-body border">
                    <p><strong>App ID:</strong> <?= htmlspecialchars($backup['app_id']); ?></p>
                    <p><strong>Backup file :</strong> <?= htmlspecialchars(basename($backup['folder'])); ?></p>
                    <p><strong>File:</strong> <?= htmlspecialchars($backup['folder']); ?></p>
                    <p><strong>Created:</strong> <?= $created; ?></p>
                  </div>
                </td>
              </tr>
              <?php
                  }
              }
              ?>
            </tbody>
          </table>
        </div>
      </div>
    </div>
  </div>
</div>



