<?php
$install = $core->get_single_install_metadata($metadataDb,$_GET['ols_id']);
$app = $core->getAppByNickname($phpScriptsByCategory, $install['type']);
$app_name = strtolower(trim($install['type'] ?? ''));
$prefix = ($app_name === 'wordpress') ? 'wp' : $app_name;

// Now generate the random DB name
$ran_db = $core->generate_random_dbname($prefix);
$ran_table = $core->generate_table_prefix($prefix);
$tars= $core->get_single_install_metadata($metadataDb,$install['staging']);

?>
  <div class="dashboard-wrapper">
            <div class="dashboard-ecommerce">
                <div class="container-fluid dashboard-content ">
                    <div class="col-xl-12 col-lg-12 col-md-12 col-sm-12 col-12 m-b-60 px-0">
                                  <div class="bg-white pb-4">
                                        <div class="card-header">
            <!-- Flex container: image left, text+stars right -->
            <div class="d-flex align-items-start">
                <img src="<?php echo htmlspecialchars('assets/appicon/'.$app['logo'], ENT_QUOTES, 'UTF-8');?>" alt="<?php echo htmlspecialchars($app['script_name'], ENT_QUOTES, 'UTF-8');?>" style="height: 50px; margin-right: 10px;">
                
                <div>
                    <h5 class="mb-1"><?php echo htmlspecialchars($app['script_name'], ENT_QUOTES, 'UTF-8');?></h5>
                   <?php echo $core->renderRatingStars($app['rating']);?>
                </div>
            </div>
        </div> 
                                        
                                        
          
            <form action="" onsubmit="ajaxFormSubmitLive(event)" method="POST">

  <!-- Installation URL Section -->
 <div class="col-12 mb-4 px-0">

    <div class="card">
      <div class="card-body">
          <div class="form-group">
            <label class="col-form-label">Source of <?php echo htmlspecialchars($title, ENT_QUOTES, 'UTF-8'); ?>:</label>
            <input type="text" name="source" value="<?=$install['site_url']?>" class="form-control" disabled>
          </div>
          <div class="form-group">
            <label class="col-form-label">Push on :</label>
            <input type="text" name="source" value="<?=$tars['site_url']?>" class="form-control" disabled>
          </div>
        <div class="row">
          <!-- URL Section -->
          <div class="col-sm-7">
       
                                        <div class="card-body">

                                            <!-- Restore Directory -->
                                            <div class="form-check mb-3">
                                                <input class="form-check-input" type="checkbox" id="old_file_del" name="old_file_del" value="on" checked>
                                                <label class="form-check-label" for="backup_dir">
                                                    <strong>Overwrite Files/Folders</strong><br>
                                                    <small class="text-muted">live site files/folders will be overwritten.</small>
                                                </label>
                                            </div>

                                            <!-- Restore Database -->
                                            <div class="form-check mb-3">
                                                <input class="form-check-input" type="checkbox" id="old_db_del" name="old_db_del" value="on">
                                                <label class="form-check-label" for="backup_db">
                                                    <strong>Push Full Database</strong><br>
                                                    <small class="text-muted">Full database will be erased from live installation and current database will be imported to live site.</small>
                                                </label>
                                            </div>

                                          
                                        </div>
                                    
          </div>

        

          <!-- URL Preview -->
          
        </div>
      </div>
    </div>
  </div>





 <div class="col-md-6 mx-auto">
  <div class="form-group text-center">

    <!-- Progress Container (Initially Hidden) -->
     <!-- Status Text -->
    <div id="status" style="margin-top: 5px; font-weight: bold; display: none;"></div>
    <div id="progressContainer" style="display: none;" class="progress mb-3">
      <div class="progress-bar progress-bar-striped progress-bar-animated bg-success" id="progressBar" style="width: 0%; height: 100%;"></div>
    </div>

   <br/>

    <!-- Submit Button -->
    <button type="submit" class="btn btn-primary btn-block">
      <?php echo htmlspecialchars($title, ENT_QUOTES, 'UTF-8'); ?> <?php echo htmlspecialchars($app['script_name'], ENT_QUOTES, 'UTF-8'); ?>
    </button>
  </div>
</div>

</form>
                                        
                                       
                                       
                                    </div>
                                </div>
                                
                                
                                
                                
                                
                    
                </div>
               
            </div>
            <!-- ============================================================== -->
            <!-- end wrapper  -->
            <!-- ============================================================== -->
        </div>
<script>

var actionURL = `<?php echo $globals['index'] . $core->buildCleanQueryString(['view' => $view.'_bg']); ?>`;

var submit_id='<?=$_GET['ols_id'];?>';

var view_name ='<?php echo htmlspecialchars($view, ENT_QUOTES, 'UTF-8'); ?>';



</script>

       