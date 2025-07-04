<?php
$app = $core->getAppByNickname($phpScriptsByCategory, $_REQUEST['app']);
$app_name = strtolower(trim($_REQUEST['app'] ?? ''));
$prefix = ($app_name === 'wordpress') ? 'wp' : $app_name;

// Now generate the random DB name
$ran_db = $core->generate_random_dbname($prefix);
$ran_table = $core->generate_table_prefix($prefix);


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
                                        
                                        
                                        
                                        <ul class="nav nav-tabs" id="myTab5" role="tablist">
                                            <li class="nav-item">
                                                <a class="nav-link active border-left-0" id="product-tab-1" data-toggle="tab" href="#tab-1" role="tab" aria-controls="product-tab-1" aria-selected="true">Install</a>
                                            </li>
                                            <li class="nav-item">
                                                <a class="nav-link" id="product-overview" data-toggle="tab" href="#overview" role="tab" aria-controls="product-overview" aria-selected="false">Overview</a>
                                            </li>
                                            <li class="nav-item">
                                                <a class="nav-link" id="product-Screenshots" data-toggle="tab" href="#Screenshots" role="tab" aria-controls="product-Screenshots" aria-selected="false">Screenshots</a>
                                            </li>
                                            <li class="nav-item">
                                                <a class="nav-link" href="<?php echo $app['demo_link'];?>" target="_blank">Demo</a>
                                            </li>
                                        </ul>
                                        <div class="tab-content px-0" id="myTabContent5">
                                            
                                            
                                            
                                            
                                            
                                            
                                            
                                            <div class="tab-pane fade show active" id="tab-1" role="tabpanel" aria-labelledby="product-tab-1">
                                              <form action="" onsubmit="ajaxFormSubmit(event)" method="POST">

  <!-- Installation URL Section -->
 <div class="col-12 mb-4 px-0">

    <div class="card">
      <div class="card-body">
        <div class="row">
          <!-- URL Section -->
          <div class="col-sm-7">
            <label class="form-label d-block mb-0" for="softdirectory">Choose Installation URL</label>
            <span class="sai_exp2">Please choose the URL to install the software</span>

            <div class="row mt-2 ml-0 mr-0">
              <div class="col-sm-3" style="padding-left:0; padding-right:1px; width:24%;">
                <select name="http" class="form-control" id="http" onchange="update_url();">
                  <option value="1">http://</option>
                  <option value="2">http://www.</option>
                  <option value="3" selected>https://</option>
                  <option value="4">https://www.</option>
                </select>
                <span class="sai_exp2 ml-1">
                  Choose Protocol
                  <a data-toggle="tooltip" data-html="true" title="If your site has SSL, then please choose the HTTPS protocol.">
                    <i class="fas fa-info-circle" style="font-size:1.1em; vertical-align:middle;cursor:pointer;color:#4B4B4B;"></i>
                  </a>
                </span>
              </div>

              <div class="col-sm-6" style="padding-left:0; padding-right:0;">
                <select name="domain" class="form-control" id="domain" onchange="update_url();">
                  <?php  foreach ($domainroots as $domain => $path) { ?>
                  <option value="<?php echo $domain;?>" data-path="<?php echo $path;?>"><?php echo $domain;?></option>
                  
                  
                  <?php } ?>
                  <!-- Add more domains here -->
                </select>
                <span class="sai_exp2 ml-1">
                  Choose Domain
                  <a data-toggle="tooltip" data-html="true" title="Please choose the domain to install the software.">
                    <i class="fas fa-info-circle" style="font-size:1.1em; vertical-align:middle;cursor:pointer;color:#4B4B4B;"></i>
                  </a>
                </span>
              </div>

              <div class="col-sm-3" style="padding-left:1px; padding-right:0;">
                <input type="text" name="target_folder" class="form-control" style="padding: 8px;" id="target_folder" value="<?=$prefix;?>" oninput="update_url();">
                <span class="sai_exp2 ml-1">
                  In Directory
                  <a data-toggle="tooltip" data-html="true" title="The directory is relative to your domain and <b>should not exist</b>. e.g. To install at http://mydomain/dir/ just type <b>dir</b>. To install only in http://mydomain/ leave this empty.">
                    <i class="fas fa-info-circle" style="font-size:1.1em; vertical-align:middle;cursor:pointer;color:#4B4B4B;"></i>
                  </a>
                </span>
              </div>

             
            </div>
          </div>

          <!-- Version Selection -->
          <div class="col-sm-5">
            <label for="version" class="form-label d-block mb-0">Select</label>
            <span class="sai_exp2">version</span>
            <select name="version" class="form-control mt-2" id="version" onchange="selectversion()" style="width:50%;">
              <option value="" selected>Default</option>
            
              <!-- Add more versions -->
            </select>
            
          </div>

          <!-- URL Preview -->
          <div class="col-12 mt-3">
            <span class="sai_exp2">Your installation URL:</span>
            <label class="form-label"><span id="ins_url">https://olspanel.com/<?=$prefix;?></span></label>
          </div>
        </div>
      </div>
    </div>
  </div>

 <!-- Site Settings & Admin Account -->
<div class="container-fluid">
  <div class="row">
    <!-- Site Settings -->
    <?php
$hasTitle = !empty($app['fields']['title']);
$hasDesc  = !empty($app['fields']['description']);

if ($hasTitle || $hasDesc): ?>
<div class="col-lg-6 col-md-8 pl-0 d-flex">
  <div class="card w-100">
    <div class="card-header">Site Settings</div>
    <div class="card-body">
      
      <?php if ($hasTitle): ?>
      <div class="form-group">
        <label class="col-form-label">Site Title:</label>
        <input type="text" name="site_title" value="My site" class="form-control" required>
      </div>
      <?php endif; ?>

      <?php if ($hasDesc): ?>
      <div class="form-group">
        <label class="col-form-label">Site Description:</label>
        <input type="text" name="site_desc" value="This is My site" class="form-control" required>
      </div>
      <?php endif; ?>

    </div>
  </div>
</div>
<?php endif; ?>


    <!-- Admin Account -->
   <?php
$hasUsername = !empty($app['fields']['username']);
$hasPassword = !empty($app['fields']['password']);
$hasEmail    = !empty($app['fields']['email']);

if ($hasUsername || $hasPassword || $hasEmail): ?>
<div class="col-lg-6 col-md-8 pl-0 d-flex">
  <div class="card w-100">
    <div class="card-header">Admin Account</div>
    <div class="card-body">

      <?php if ($hasUsername): ?>
      <div class="form-group">
        <label class="col-form-label">Admin Username:</label>
        <input type="text" name="admin_user" class="form-control" required>
      </div>
      <?php endif; ?>

      <?php if ($hasPassword): ?>
      <div class="form-group">
        <label class="col-form-label">Admin Password:</label>
        <input type="password" name="admin_pass" class="form-control" required>
      </div>
      <?php endif; ?>

      <?php if ($hasEmail): ?>
      <div class="form-group">
        <label class="col-form-label">Admin Email:</label>
        <input type="email" name="admin_email" value="<?= htmlspecialchars($user['email'] ?? '', ENT_QUOTES, 'UTF-8'); ?>" class="form-control" required>
      </div>
      <?php endif; ?>

    </div>
  </div>
</div>
<?php endif; ?>

    
    
  </div>
</div>


<!-- Advanced Settings -->
<div class="container-fluid mt-3 px-0">
  <div class="row">
    <div class="col-12">
      <div class="card">
        <div class="card-header"> 
        <span class="btn btn-link collapsed" data-toggle="collapse" data-target="#coll_adv" aria-expanded="false" aria-controls="coll_adv">
                                  <span class="fas fa-plus-square"></span> Advanced Settings
                                             </span></div>
        <div id="coll_adv" class="collapse" aria-labelledby="headingNine" data-parent="#coll_adv">
        
        <div class="card-body">
          <div class="row">
            <!-- Left Column -->
            <div class="col-md-6">
              <div class="form-group">
                <label class="col-form-label">MySQL Host:</label>
                <input type="text" name="db_host" value="localhost" class="form-control" required>
              </div>
              <div class="form-group">
                  <label class="col-form-label">MySQL Database Name:</label>
                  <div class="input-group mb-3"><span class="input-group-prepend"><span class="input-group-text"><?php echo htmlspecialchars($user['name'], ENT_QUOTES, 'UTF-8');?>_</span></span>
                                                <input type="text" name="db_name" placeholder="DB Name" value="<?php echo $ran_db;?>" class="form-control" required>
                                            </div>
                  
              </div>
            </div>

            <!-- Right Column -->
            <div class="col-md-6">
               <div class="form-group">
  <label class="col-form-label">MySQL Password:</label>
  <div class="input-group">
    <input type="password" name="db_pass" id="db_pass" class="form-control" value="<?php echo $core->generate_mysql_password(); ?>" required>
    <div class="input-group-append">
      <button class="btn btn-outline-secondary" type="button" onclick="togglePasswordVisibility()">
        Show
      </button>
    </div>
  </div>
</div>

                
               
                
                
             
              <div class="form-group">
                  <label class="col-form-label">MySQL User:</label>
                  <div class="input-group mb-3"><span class="input-group-prepend"><span class="input-group-text"><?php echo htmlspecialchars($user['name'], ENT_QUOTES, 'UTF-8');?>_</span></span>
                                                <input type="text" name="db_user" placeholder="Db Username" value="<?php echo $ran_db;?>" class="form-control" required>
                                            </div>
                  
              </div>
              
               <?php   if (!empty($app['fields']['db_prefix'])) { ?>
              
                <div class="form-group">
                  <label class="col-form-label">Table Prefix:</label>
                                                <input type="text" name="table_prefix" placeholder="" value="<?php echo $ran_table;?>" class="form-control" required>
                                            </div>
                                            
                                             <?php } ?>
                  
            
              
            </div>
          </div> <!-- .row -->
        </div> <!-- .card-body -->
        </div>
      </div> <!-- .card -->
    </div> <!-- .col-12 -->
  </div> <!-- .row -->
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
      Install <?php echo htmlspecialchars($app['script_name'], ENT_QUOTES, 'UTF-8'); ?>
    </button>
  </div>
</div>

</form>
  
  </div>                                          
                                            
                                            
                                               <div class="tab-pane fade" id="overview" role="tabpanel" aria-labelledby="product-overview">   
                                            
                                         <div class="row no-gutters">
    <div class="col-12">
        <div class="row no-gutters">
            <!-- Slider (Left Column) -->
            <div class="col-xl-6 col-lg-6 col-md-6 col-sm-12 col-12">
                <?php echo $core->renderBannerCarousel($app, 'productslider-1') ?>
            </div>

            <!-- Product Details (Right Column) -->
            <div class="col-xl-6 col-lg-6 col-md-6 col-sm-12 col-12 border-left">
                <div class="product-details p-4">
                    

                    

                   

                    <div class="product-description">
                        <h4 class="mb-1">Descriptions</h4>
                        <p><?php echo htmlspecialchars($app['description'], ENT_QUOTES, 'UTF-8');?></p>
                       
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
   
                      </div>                      
                                      
                                            
                                            <div class="tab-pane fade" id="Screenshots" role="tabpanel" aria-labelledby="product-Screenshots">
                                                
                                                <?php echo $core->renderBannerCarousel($app, 'productslider-1') ?>
                                               
                                               
                                               
                                               
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

 var actionURL = `<?php echo $globals['index'] . $core->buildCleanQueryString(['view' => 'start_install', 'app' => $core->formatNickname($_REQUEST['app'])]); ?>`;
 



</script>

       