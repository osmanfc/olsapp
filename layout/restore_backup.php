<?php

 $backup = $core->get_backup_metadata($metadataDb,$_GET['id']);
$prefix = ($app_name === 'wordpress') ? 'wp' : $app_name;

   $app = $core->getAppByNickname($phpScriptsByCategory, $backup[0]['app_type']);
                     


?>
  <div class="dashboard-wrapper">
    <div class="dashboard-ecommerce">
        <div class="container-fluid dashboard-content">
            <div class="col-12 mb-5 px-0">
                <div class="bg-white rounded shadow-sm">
                    
                    <!-- App Info Header -->
                    <div class="card-header d-flex align-items-center">
                        <img src="<?= htmlspecialchars('assets/appicon/' . $app['logo'], ENT_QUOTES, 'UTF-8'); ?>" 
                             alt="<?= htmlspecialchars($app['script_name'], ENT_QUOTES, 'UTF-8'); ?>" 
                             style="height: 50px; margin-right: 15px;">
                        <div>
                            <h5 class="mb-1"><?= htmlspecialchars($app['script_name'], ENT_QUOTES, 'UTF-8'); ?></h5>
                            <?= $core->renderRatingStars($app['rating']); ?>
                        </div>
                    </div>

                    <!-- Restore Form -->
                    <form action="" onsubmit="ajaxFormSubmitR(event)" method="POST">
                        <div class="container-fluid py-4">
                            <div class="row">
                                <!-- Restore Settings -->
                                <div class="col-lg-6 col-md-8 mx-auto">
                                    <div class="card shadow-sm">
                                        <div class="card-header bg-light font-weight-bold">Restore Backup Options</div>
                                        <div class="card-body">
<label class="text-danger">Backup file: <?=$backup[0]['folder'];?></label>
                                            <!-- Restore Directory -->
                                            <div class="form-check mb-3">
                                                <input class="form-check-input" type="checkbox" id="backup_dir" name="backup_dir" checked>
                                                <label class="form-check-label" for="backup_dir">
                                                    <strong>Restore Backup Directory</strong><br>
                                                    <small class="text-muted">The folder will be restored.</small>
                                                </label>
                                            </div>

                                            <!-- Restore Database -->
                                            <div class="form-check mb-3">
                                                <input class="form-check-input" type="checkbox" id="backup_db" name="backup_db" checked>
                                                <label class="form-check-label" for="backup_db">
                                                    <strong>Restore Database</strong><br>
                                                    <small class="text-muted">The associated database will also be restored.</small>
                                                </label>
                                            </div>

                                            <!-- Delete Existing -->
                                            <div class="form-check mb-3">
                                                <input class="form-check-input" type="checkbox" id="old_file_del" name="old_file_del">
                                                <label class="form-check-label" for="old_file_del">
                                                    <strong>Delete Existing Files/Folders</strong><br>
                                                    <small class="text-muted">Existing files/folders will be removed before restoring.</small>
                                                </label>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>

                            <!-- Progress and Submit -->
                            <div class="row mt-4">
                                <div class="col-md-6 mx-auto text-center">
                                    
                                    <!-- Status and Progress -->
                                    <div id="status" class="font-weight-bold text-success mb-2" style="display: none;"></div>
                                    <div id="progressContainer" class="progress mb-3" style="display: none;">
                                        <div id="progressBar" class="progress-bar progress-bar-striped progress-bar-animated bg-success" 
                                             style="width: 0%; height: 100%;"></div>
                                    </div>

                                    <!-- Submit Button -->
                                    <button type="submit" class="btn btn-primary btn-lg btn-block">
                                        Restore Backup <?= htmlspecialchars($app['script_name'], ENT_QUOTES, 'UTF-8'); ?>
                                    </button>
                                </div>
                            </div>
                        </div>
                    </form>
                    
                </div>
            </div>
        </div>
    </div>
</div>

<script>



var actionURL = `<?php echo $globals['index'] . $core->buildCleanQueryString(['view' => 'restore_bg', 'id' => $_GET['id']]); ?>`;
var submit_id='<?=$_GET['id'];?>'




</script>

       