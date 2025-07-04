<?php
 $main_path = rtrim($user['homedir'], '/');
              $metadataroot = $main_path . '/.olsapp';
              $metadataDb = $metadataroot . '/metadata.sqlite';
              $totalinstalls = $core->get_single_install_count($metadataDb);
              $totalbackups = $core->get_single_backup_count($metadataDb);
              $totalwp = $core->get_single_install_count($metadataDb,"wordpress");
        //  print_r($download_latest->opencart()); exit;
             
?>

 <div class="dashboard-wrapper">
            <div class="container-fluid dashboard-content">
                      
                     <div class="row">
    <!-- Total Install -->
    <div class="col-md-4 col-sm-12 mb-3">
        <a href="<?php echo $globals['index'] . $core->buildCleanQueryString(['view' => 'my_install']); ?>" class="text-decoration-none">
            <div class="card border-3 border-top border-top-primary">
                <div class="card-body py-2 px-3 d-flex justify-content-between align-items-center">
                    <div>
                        <h3 class="mb-0 text-dark"><span class="badge badge-success"><?php echo $totalinstalls; ?></span></h3>
                        <small class="text-muted">Total Install</small>
                    </div>
                    
                    <i class="fas fa-archive text-primary" style="font-size: 2rem;"></i>
                </div>
            </div>
        </a>
    </div>

    <!-- Total Backup -->
    <div class="col-md-4 col-sm-12 mb-3">
        <a href="<?php echo $globals['index'] . $core->buildCleanQueryString(['view' => 'my_backup']); ?>" class="text-decoration-none">
            <div class="card border-3 border-top border-top-primary">
                <div class="card-body py-2 px-3 d-flex justify-content-between align-items-center">
                    <div>
                        <h3 class="mb-0 text-dark"><span class="badge badge-warning"><?=$totalbackups;?></span></h3>
                        <small class="text-muted">Total Backup</small>
                    </div>
                    <i class="fas fa-file-archive text-success" style="font-size: 2rem;"></i>
                </div>
            </div>
        </a>
    </div>

    <!-- Total WordPress -->
    <div class="col-md-4 col-sm-12 mb-3">
        <a href="<?php echo $globals['index'] . $core->buildCleanQueryString(['view' => 'wordpress_manager']); ?>" class="text-decoration-none">
            <div class="card border-3 border-top border-top-primary">
                <div class="card-body py-2 px-3 d-flex justify-content-between align-items-center">
                    <div>
                        <h3 class="mb-0 text-dark"><span class="badge badge-primary"><?php echo $totalwp; ?></span></h3>
                        <small class="text-muted">Total WordPress</small>
                    </div>
                    <i class="fab fa-wordpress text-info" style="font-size: 2rem;"></i>
                </div>
            </div>
        </a>
    </div>
</div>
   
                        
                        
                        
                        
                        <div class="row">
                            
                  <?php       foreach ($phpScriptsByCategory as $category => $apps) {
   
    foreach ($apps as $app) {
    
    ?>
    
    
    
                            <div class="col-xl-3 col-lg-6 col-md-6 col-sm-12 col-12 ">
                             <a href="<?php echo $globals['index'] . $core->buildCleanQueryString(['view' => 'install', 'app' => $core->formatNickname($app['nickname'])]); ?>" class="text-decoration-none">   
    <div class="card">
     
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
<div class="card-body">
            <!-- Image below title, assumed as "below star 5" -->
          
          
            <p class="card_description"><?php echo htmlspecialchars($app['description'], ENT_QUOTES, 'UTF-8');?></p>
            <br/>
            <div class="p-0 text-center justify-content-center">
            <a href="<?php echo $globals['index'] . $core->buildCleanQueryString(['view' => 'install', 'app' => $core->formatNickname($app['nickname'])]); ?>"  class="btn btn-primary">Install</a>
            <a href="<?php echo $app['demo_link'];?>" class="btn btn-outline-primary" target="_blank">Demo</a>
            <a href="<?php echo $globals['index']  . $core->buildCleanQueryString(['view' => 'overview', 'app' => $core->formatNickname($app['nickname'])]); ?>"  class="btn btn-outline-info">Overview</a>
            </div>
        </div>
    </div>
    </a>
    
</div>

<?php 
        
    }
}
?>





                        </div>
                       
                  
            </div>
          
        </div>
       
       