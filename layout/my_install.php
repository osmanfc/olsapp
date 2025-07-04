<?php

$installs = $core->get_install_metadata($metadataDb);
?>

<div class="dashboard-wrapper">
  <div class="container-fluid dashboard-content">
    <div class="card">
      <h5 class="card-header">My Install</h5>
      <div class="card-body p-0">
        <div class="table-responsive">
          <table class="table">
            <thead class="bg-light">
              <tr class="border-0">
                <th class="border-0">Id</th>
                <th class="border-0">Image</th>
                <th class="border-0">App</th>
                <th class="border-0">Url</th>
                <th class="border-0">Time</th>
                <th class="border-0">Login</th>
                <th class="border-0" style="text-align: right;">Option</th>
              </tr>
            </thead>
            <tbody>
              <?php
              if ($installs === false || empty($installs)) {
                  echo '<tr><td colspan="7" class="text-center">No installations found.</td></tr>';
              } else {
                  foreach ($installs as $install) {
                      $app = $core->getAppByNickname($phpScriptsByCategory, $install['type']);
                      $img = htmlspecialchars('assets/appicon/'.$app['logo'], ENT_QUOTES, 'UTF-8');
                      $title = htmlspecialchars($install['title'], ENT_QUOTES, 'UTF-8');
                      $url = htmlspecialchars($install['site_url'], ENT_QUOTES, 'UTF-8');
                      $created = htmlspecialchars($install['created_at'], ENT_QUOTES, 'UTF-8');
                      $login = htmlspecialchars($install['user'], ENT_QUOTES, 'UTF-8');
                      $folder = htmlspecialchars($install['folder'], ENT_QUOTES, 'UTF-8');
                      $ran_db = htmlspecialchars($install['db_name'] ?? '', ENT_QUOTES, 'UTF-8');
                      $ran_table = htmlspecialchars($install['table_prefix'] ?? 'wp_', ENT_QUOTES, 'UTF-8');
                      $collapseId = 'coll_id_' . $install['id'];
                      $replacement_string = $user['name'] . "_"; // This will evaluate to "john_doe_"

// Perform the replacement
$ran_db = str_replace($replacement_string, "", $ran_db);
              ?>
              <tr>
                <td>
                  <?= $install['id']; ?>
                  <button class="btn btn-link p-0" data-toggle="collapse" data-target="#<?= $collapseId; ?>">
                    <i class="fas fa-plus-square"></i>
                  </button>
                </td>
                <td><img src="<?= $img; ?>" alt="app" class="rounded" width="45"></td>
                <td><?= $install['type']; ?></td>
                <td><a href="<?= $url; ?>" target="_blank"><?= $url; ?></a></td>
                <td><?= $created; ?></td>
                <td>
                  <a href="<?= $globals['index'] . $core->buildCleanQueryString(['view' => 'olsapp_auto_login', 'ols_id' => $install['id']]); ?>" target="_blank" class="btn btn-sm btn-primary rounded-pill shadow-sm px-3"> <i class="fas fa-sign-in-alt me-1"></i> Login</a>
                </td>
               <td style="text-align: right;">
                   <?php if($install['type']=='wordpress'){
                   ?>
                    <a href="<?= $globals['index'] . $core->buildCleanQueryString(['view' => 'wordpress_plugin', 'ols_id' => $install['id']]); ?>" class="icon-btn mx-1 text-primary" role="button"
       data-bs-toggle="tooltip" data-bs-placement="bottom" title="Wordpress manager">
        <i class="fab fa-wordpress"></i>
    </a>
                   
                   <?php
                   }
                   
                   if($install['staging']){
                   ?>
                    <a href="<?= $globals['index'] . $core->buildCleanQueryString(['view' => 'live', 'ols_id' => $install['id']]); ?>" class="icon-btn mx-1 text-primary" role="button"
       data-bs-toggle="tooltip" data-bs-placement="bottom" title="Push to Live">
        <i class="fas fa-code-branch"></i>
    </a>
                   
                   <?php
                   }?>
    <a href="<?= $globals['index'] . $core->buildCleanQueryString(['view' => 'staging', 'ols_id' => $install['id']]); ?>" class="icon-btn mx-1 text-primary" role="button"
       data-bs-toggle="tooltip" data-bs-placement="bottom" title="Staging">
        <i class="fa fa-network-wired"></i>
    </a>

    <a href="<?= $globals['index'] . $core->buildCleanQueryString(['view' => 'clone', 'ols_id' => $install['id']]); ?>" class="icon-btn mx-1 text-primary" role="button"
       data-bs-toggle="tooltip" data-bs-placement="bottom" title="Clone">
        <i class="fas fa-copy"></i>
    </a>

    <a href="<?= $globals['index'] . $core->buildCleanQueryString(['view' => 'backup', 'ols_id' => $install['id']]); ?>" class="icon-btn mx-1" style="color: #119768;" role="button"
       data-bs-toggle="tooltip" data-bs-placement="bottom" title="Backup">
        <i class="fas fa-file-archive"></i>
    </a>

   



  <div class="btn-group mx-1">
  <a href="#" class="icon-btn d-flex align-items-center" style="color: #dc3545;" role="button"
     data-toggle="dropdown" aria-haspopup="true" aria-expanded="false" title="Delete Options">
    <i class="fas fa-trash-alt"></i>
    
  </a>
  <div class="dropdown-menu dropdown-menu-right bg-dark">
   <a 
  class="dropdown-item text-danger" 
  href="<?= $globals['index'] . $core->buildCleanQueryString(['view' => 'download', 'delete_full_app' => $install['id']]); ?>" 
  onclick="return confirm('Are you sure you want to delete this app completely? This action cannot be undone.');"
>
  <i class="fas fa-trash mr-2"></i> Full Delete (Files + DB)
</a>

    <a class="dropdown-item text-primary" href="<?= $globals['index'] . $core->buildCleanQueryString(['view' => 'download', 'delete_app' => $install['id']]); ?>">
      <i class="fas fa-list mr-2"></i> Remove from List Only
    </a>
  </div>
</div>




</td>
              </tr>

              <!-- Collapsible row -->
              <tr class="collapse" id="<?= $collapseId; ?>">
                <td colspan="7">
                  <div class="card-body border">
                    <div class="row">
                      <!-- Left Column -->
                      <div class="col-md-6">
                        <div class="form-group">
                          <label class="col-form-label">MySQL Host:</label>
                          <input type="text" name="db_host" value="localhost" class="form-control" disabled>
                        </div>
                        <div class="form-group">
                          <label class="col-form-label">MySQL Database Name:</label>
                          <div class="input-group mb-3">
                            <span class="input-group-prepend"><span class="input-group-text"><?= htmlspecialchars($user['name']); ?>_</span></span>
                            <input type="text" name="db_name" placeholder="DB Name" value="<?= $ran_db; ?>" class="form-control" disabled>
                          </div>
                        </div>
                      </div>

                      <!-- Right Column -->
                      <div class="col-md-6">
                        <div class="form-group">
                          <label class="col-form-label">MySQL Password:</label>
                          <div class="input-group">
                            <input type="password" name="db_pass" class="form-control" value="<?= $install['db_pass']; ?>" disabled>
                            <div class="input-group-append">
                              <button class="btn btn-outline-secondary" type="button" onclick="togglePasswordVisibility(this)">Show</button>
                            </div>
                          </div>
                        </div>

                        <div class="form-group">
                          <label class="col-form-label">MySQL User:</label>
                          <div class="input-group mb-3">
                            <span class="input-group-prepend"><span class="input-group-text"><?= htmlspecialchars($user['name']); ?>_</span></span>
                            <input type="text" name="db_user" placeholder="Db Username" value="<?= $ran_db; ?>" class="form-control" disabled>
                          </div>
                        </div>

                        <div class="form-group">
                          <label class="col-form-label">Table Prefix:</label>
                          <input type="text" name="table_prefix" value="<?= $ran_table; ?>" class="form-control" disabled>
                        </div>
                      </div>
                    </div>
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


