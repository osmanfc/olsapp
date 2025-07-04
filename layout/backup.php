<?php

$install = $core->get_single_install_metadata($metadataDb,$_GET['ols_id']);
$prefix = ($app_name === 'wordpress') ? 'wp' : $app_name;

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
                                        
                                        
                                        
                                    
                                        <div class="tab-content px-0" id="myTabContent5">
                                            
                                            
                                            
                                            
                                            
                                            
                                            
                                            <div class="tab-pane fade show active" id="tab-1" role="tabpanel" aria-labelledby="product-tab-1">
                                              <form action="" onsubmit="ajaxFormSubmit_backup(event)" method="POST">




 <!-- Site Settings & Admin Account -->
<div class="container-fluid">
  <div class="row">
    <!-- Site Settings -->
    <div class="col-lg-6 col-md-8 pl-0 d-flex">
      <div class="card w-100">
        <div class="card-header">Backup settings</div>
        <div class="card-body">
            
           <div class="row mb-2">
						<div class="col-sm-5">
							<label for="backup_dir">Backup Directory</label><br>
							<span class="text-secondary"> Folder will be backup</span>
						</div>
						<div class="col-sm-2">
							<input type="checkbox" name="backup_dir" id="backup_dir" checked="checked">
						</div>
					</div>
					<div class="row mb-2">
						<div class="col-sm-5">
							<label for="backup_db">Backup Database</label><br>
							<span class="text-secondary">Database will also be backup</span>
						</div>
						<div class="col-sm-2">
							<input type="checkbox" name="backup_db" id="backup_db" checked="checked">
						</div>
					</div>
				
            
            
            
            
         
        </div>
      </div>
    </div>

    <!-- Admin Account -->
    <div class="col-lg-6 col-md-8 pl-0 d-flex">
      <div class="card w-100">
        <div class="card-header">Advance</div>
        <div class="card-body">
            
            	<div class="row mb-2">
						<div class="col-sm-5">
							<label for="backup_note" class="sai_head mb-2">Backup Note</label>
							&nbsp;<a data-toggle="tooltip" data-html="true" title="" data-original-title="You can save a note for your reference"><i class="fas fa-info-circle" style="font-size:1.1em; vertical-align:middle;cursor:pointer;color:#4B4B4B;"></i></a><span class="sai_exp" style="display: none;">You can save a note for your reference</span>
						</div>
						<div class="col-sm-7">
							<input type="text" name="backup_note" id="backup_note" class="form-control" size="50" value="My <?=$install['type'];?> backup" maxlength="255"><br>
						</div>
					</div>
					<div class="row mb-2">
						<div class="col-sm-5">
							<label for="backup_location" class="sai_head mb-2">Backup Location</label>
							&nbsp;<a data-toggle="tooltip" data-html="true" title="" data-original-title="Choose the backup location where you would like to store the backup"><i class="fas fa-info-circle" style="font-size:1.1em; vertical-align:middle;cursor:pointer;color:#4B4B4B;"></i></a><span class="sai_exp" style="display: none;">Choose the backup location where you would like to store the backup</span>
						</div>
						<div class="col-sm-7">
						 <div class="form-group">
                          
                          <div class="input-group mb-3">
                            <span class="input-group-prepend"><span class="input-group-text"><?= rtrim($user['softdir'], '/'); ?>/.olsapp/</span></span>
                            <input type="text" name="target_folder" value="backup" class="form-control">
                          </div>
                        </div>
						</div>
					</div> 
            
            
            
         
        </div>
      </div>
    </div>
  </div>
</div>


<!-- Advanced Settings -->
<div class="container-fluid mt-3 px-0">
  <div class="card-body border">
                    <div class="row">
                      <!-- Left Column -->
                      <div class="col-md-6">
                          <div class="form-group">
                          <label class="col-form-label">Url:</label>
                          <input type="text"  value="<?= htmlspecialchars($install['site_url']); ?>" class="form-control" disabled>
                        </div>
                        
                        <div class="form-group">
                          <label class="col-form-label">Path:</label>
                          <input type="text"  value="<?= htmlspecialchars($install['folder']); ?>" class="form-control" disabled>
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
                          <label class="col-form-label">MySQL Host:</label>
                          <input type="text" name="db_host" value="localhost" class="form-control" disabled>
                        </div>
                        <div class="form-group">
                          <label class="col-form-label">MySQL Password:</label>
                          <div class="input-group">
                            <input type="password" name="db_pass" class="form-control" value="<?= $install['db_pass']; ?>" disabled>
                            <div class="input-group-append">
                              <button class="btn btn-outline-secondary" type="button" onclick="togglePasswordVisibility_name()">Show</button>
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

                        
                      </div>
                    </div>
                  </div>
</div> <!-- .container-fluid -->
<!-- Progress Bar Container -->

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
      Backup <?php echo htmlspecialchars($app['script_name'], ENT_QUOTES, 'UTF-8'); ?>
    </button>
  </div>
</div>

</form>
  
  </div>                                          
                                            
                                            
                                            
                                        </div>
                                    </div>
                                </div>
                                
                                
                                
                                
                                
                    
                </div>
               
            </div>
            <!-- ============================================================== -->
            <!-- end wrapper  -->
            <!-- ============================================================== -->
        </div>
<script>




var actionURL = `<?php echo $globals['index'] . $core->buildCleanQueryString(['view' => 'backup_bg', 'ols_id' => $_GET['ols_id']]); ?>`;








</script>

       