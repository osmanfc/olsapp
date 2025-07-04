<div class="dashboard-wrapper">
  <div class="container-fluid dashboard-content">
    <div class="row">
      <div class="col-xl-6 col-lg-8 col-md-10 col-sm-12 mx-auto">
        <div class="card">
          <?php 
          if (!empty($_GET['ols_id'])) {
              $ols_id = $_GET['ols_id'];
              $main_path = rtrim($user['homedir'], '/');
              $metadataroot = $main_path . '/.olsapp';
              $metadataDb = $metadataroot . '/metadata.sqlite';
              $installs = $core->get_single_install_metadata($metadataDb, $ols_id);

              if ($installs !== false) {
                  $type=$core->formatNickname($installs['type']);
                  

                  $path = rtrim($installs['folder'], '/') . '/ols_auto_login.php';
                  $token = $core->generate_mysql_password(32);
                  if (method_exists($auto_login, $type)) {
                  $auto_login->$type($path, $token);
echo '<h5 class="card-header">Auto login process, please wait</h5>
                        <div class="card-body text-center">
                          <span class="dashboard-spinner spinner-primary spinner-xxl"></span>
                        </div>';
                  echo '<meta http-equiv="refresh" content="3;url=' . rtrim($installs['site_url'], '/') . '/ols_auto_login.php?pass='.$token.'">';
                  exit;
                  }else{
                      
                    echo '<h5 class="card-header">Error</h5>
                        <div class="card-body text-center text-danger">
                          ⚠️ Auto login not supported please wait redicting now
                           <div class="card-body text-center">
                          <span class="dashboard-spinner spinner-primary spinner-xxl"></span>
                        </div>
                        </div>'; 
                        $app = $core->getAppByNickname($phpScriptsByCategory, $installs['type']);
                         echo '<meta http-equiv="refresh" content="2;url=' . rtrim($installs['site_url'], '/') . '/'.$app['admin_path'].'">';
                  exit;
                  }
              } else {
                  echo '<h5 class="card-header">Error</h5>
                        <div class="card-body text-center text-danger">
                          ⚠️ Installation ID not found or invalid.
                        </div>';
              }
          } else {
              echo '<h5 class="card-header">Error</h5>
                    <div class="card-body text-center text-warning">
                      ⚠️ Missing installation ID (ols_id).
                    </div>';
          }
          ?>
        </div>
      </div>
    </div>
  </div>
</div>
