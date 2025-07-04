 <?php $baseUrl = $globals['index'] . $core->buildCleanQueryString(['ols_id' => $_REQUEST['ols_id']]); 
 
 $install = $core->get_single_install_metadata($metadataDb, $_REQUEST['ols_id']);
 $app = $core->getAppByNickname($phpScriptsByCategory, $install['type']);
 ?>
<div class="dashboard-wrapper">
  <div class="container-fluid dashboard-content">
 <div class="card-header">
            <!-- Flex container: image left, text+stars right -->
            <div class="d-flex align-items-start">
                <img src="<?php echo htmlspecialchars('assets/appicon/'.$app['logo'], ENT_QUOTES, 'UTF-8');?>" alt="<?php echo htmlspecialchars($app['script_name'], ENT_QUOTES, 'UTF-8');?>" style="height: 50px; margin-right: 10px;">
                
                <div>
                    <h5 class="mb-1"> <a href="<?= htmlspecialchars($install['site_url'] ?? '#') ?>" target="_blank"><?= htmlspecialchars($install['site_url'] ?? 'N/A') ?></a></h5>
                   <?php echo $core->renderRatingStars($app['rating']);?>
                </div>
            </div>
        </div> 
        
        
        
  
  <ul class="nav nav-tabs" id="myTab5" role="tablist">
                                            <li class="nav-item">
                                                <a class="nav-link active border-left-0" id="product-tab-1" data-toggle="tab" href="#tab-1" role="tab" aria-controls="product-tab-1" aria-selected="true" onclick="loadv('pluginTableBodymy', 'pluginmySpinner', 'my_wp_plugin')">My Plugin</a>
                                            </li>
                                            <li class="nav-item">
                                                <a class="nav-link" id="product-plugin" data-toggle="tab" href="#plugin" role="tab" aria-controls="product-plugin" aria-selected="false"  onclick="loadv('pluginTableBody', 'pluginSpinner', 'search_plugin');">Add Plugin</a>
                                            </li>
                                            <li class="nav-item">
                                                <a class="nav-link" id="product-mythemes" data-toggle="tab" href="#mythemes" role="tab" aria-controls="product-mythemes" aria-selected="false" onclick="loadv('mythemeTableBody', 'mythemeSpinner', 'my_wp_themes');">My Themes</a>
                                            </li>
                                             <li class="nav-item">
                                                <a class="nav-link" id="product-themes" data-toggle="tab" href="#themes" role="tab" aria-controls="product-themes" aria-selected="false" onclick="loadv('themesTableBody', 'themesSpinner', 'wordpress_themes_search');">Add Themes</a>
                                            </li>
                                            <li class="nav-item">
                                                <a class="nav-link" id="product-adduser" data-toggle="tab" href="#adduser" role="tab" aria-controls="product-adduser" aria-selected="false">Add Users</a>
                                            </li>
                                            <li class="nav-item">
                                                <a class="nav-link" id="product-userlist" data-toggle="tab" href="#userlist" role="tab" aria-controls="product-userlist" aria-selected="false" onclick="loadv('userTableBody', 'userSpinner', 'my_wp_userlist');">User Mangement</a>
                                            </li>
                                        </ul>
                                        <div class="tab-content px-0" id="myTabContent5">
                                            
                                            
                                            
                                            
                                            
                                            
                                            
                                            <div class="tab-pane fade show card active" id="tab-1" role="tabpanel" aria-labelledby="product-tab-1">


    
      <h5 class="card-header">My Plugin</h5>
      <div id="spinnerContainer" style="display: none;  display: flex; justify-content: center; align-items: center;">
  <span id="pluginmySpinner" class="dashboard-spinner spinner-sm"></span>
</div>
       <div id="pluginTableBodymy">
             
             
             
             
           
        </div>
     
    </div>
    
    
    
    
    
     <div class="tab-pane fade" id="plugin" role="tabpanel" aria-labelledby="product-plugin">  

 <div id="spinnerContainer" style="display: none;  display: flex; justify-content: center; align-items: center;">
  <span id="pluginSpinner" class="dashboard-spinner spinner-sm"></span>
</div>

    
       <div class="d-flex justify-content-between align-items-center px-3 pt-3 pb-2 flex-wrap gap-2 card-header">
    <h5 class="mb-0">Add Plugin</h5>

    <div class="input-group" style="max-width: 400px;">
      <input type="text" id="pluginSearchInput" class="form-control" placeholder="Search plugins...">
      <button type="button" class="btn btn-primary" id="pluginSearchBtn" onclick="loadv('pluginTableBody', 'pluginSpinner', 'search_plugin');">Search</button>
    </div>
  </div>
  <br/>
      <div class="card-body p-0">
      
            <div id="pluginTableBody">
             
             
             
             
           
        </div>
      </div>
    </div>
       
    
   <div class="tab-pane fade card" id="mythemes" role="tabpanel" aria-labelledby="product-mythemes">  

 <div id="spinnerContainer" style="display: none;  display: flex; justify-content: center; align-items: center;">
  <span id="mythemeSpinner" class="dashboard-spinner spinner-sm"></span>
</div>

    
      <div class="card-body p-0">
      
            <div id="mythemeTableBody">
             
             
             
             
           
        </div>
      </div>
    </div>
         
    
    
     <div class="tab-pane fade" id="themes" role="tabpanel" aria-labelledby="product-themes">  

 <div id="spinnerContainer" style="display: none;  display: flex; justify-content: center; align-items: center;">
  <span id="themesSpinner" class="dashboard-spinner spinner-sm"></span>
</div>

    
       <div class="d-flex justify-content-between align-items-center px-3 pt-3 pb-2 flex-wrap gap-2 card-header">
    <h5 class="mb-0">Add themes</h5>

    <div class="input-group" style="max-width: 400px;">
      <input type="text" id="themesSearchInput" class="form-control" placeholder="Search themes...">
      <button type="button" class="btn btn-primary" id="pluginSearchBtn" onclick="loadv('themesTableBody', 'themesSpinner', 'wordpress_themes_search');">Search</button>
    </div>
  </div>
  <br/>
      <div class="card-body p-0">
      
            <div id="themesTableBody">
             
             
             
             
           
        </div>
      </div>
    </div> 
    
    
  <div class="tab-pane fade" id="adduser" role="tabpanel" aria-labelledby="product-adduser">      
    
<div class="card">
<div class="card-body">					
					<div class="form-group" id="user_roles"><label for="role">Role:</label><select class="form-control" id="role" name="role"><option value="administrator">Administrator</option><option value="editor">Editor</option><option value="author">Author</option><option value="contributor">Contributor</option><option value="subscriber">Subscriber</option></select></div>
				
					<div class="form-group">
						<label for="user_login">Username (Required) :</label>
						<input type="text" class="form-control" name="user_login" id="user_login" wfd-id="id15">
					</div>
					
					<div class="form-group">
						<label for="user_email">Email (Required) :</label>
						<input type="text" class="form-control" name="user_email" id="user_email" wfd-id="id16">
					</div>
					
					<div class="form-group">
						<label for="user_pass">Password (Required) :</label>
						<div class="input-group">
    <input type="password" name="user_pass" id="user_pass" class="form-control" value="" required>
    <div class="input-group-append">
      <button class="btn btn-outline-secondary" type="button" onclick="togglePasswordVisibility()">
        Show
      </button>
    </div>
  </div>
					</div>
					
					<div class="form-group">
						<label for="first_name">First Name :</label>
						<input type="text" class="form-control" name="first_name" id="first_name">
					</div>
					
					<div class="form-group">
						<label for="last_name">Last Name :</label>
						<input type="text" class="form-control" name="last_name" id="last_name">
					</div>
					
					<div class="form-group">
						<label for="user_url">Website :</label>
						<input type="text" class="form-control" name="user_url" id="user_url" wfd-id="id20">
					</div>
				<div class="form-group">
						<div id="manage_users_loader" class="manage_users_loader" style="display:inline;"></div>
						<input type="button" class="btn btn-rounded btn-success" name="add_user"  id="add_user" value="Add User" onclick="addUser();">
						
					</div>
			
			 <div id="status" style="margin-top: 5px; font-weight: bold; display: none;"></div>
				</div>    
				</div>    
    
</div>    
    
    
   <div class="tab-pane fade" id="userlist" role="tabpanel" aria-labelledby="product-userlist">  

 <div id="spinnerContainer" style="display: none;  display: flex; justify-content: center; align-items: center;">
  <span id="userSpinner" class="dashboard-spinner spinner-sm"></span>
</div>

    
       <div class="d-flex justify-content-between align-items-center px-3 pt-3 pb-2 flex-wrap gap-2 card-header">
    <h5 class="mb-0"></h5>

    <div class="input-group" style="max-width: 400px;">
      <input type="text" id="userSearchInput" class="form-control" placeholder="Search user...">
      <button type="button" class="btn btn-primary" id="pluginSearchBtn" onclick="loadv('userTableBody', 'userSpinner', 'my_wp_userlist');">Search</button>
    </div>
  </div>
  <br/>
      <div class="card-body p-0">
      
            <div id="userTableBody">
             
             
             
             
           
        </div>
      </div>
    </div>   
    
    
    
   </div> 
  </div>
</div>



<script>
 var actionURL = `<?= $globals['index'] . $core->buildCleanQueryString(['view' => 'manage_plugin_status', 'ols_id' => $_REQUEST['ols_id']]); ?>`;
 var baseUrl = '<?= $baseUrl ?>';

 var ols_id = '<?=$_REQUEST['ols_id']; ?>';

var plugin_url ='<?= $globals['index'] . $core->buildCleanQueryString(['view' => 'install_plugin']); ?>';
var theme_url='<?= $globals['index'] . $core->buildCleanQueryString(['view' => 'install_themes']); ?>';

var actionURLtheme = '<?= $globals['index'] . $core->buildCleanQueryString(['view' => 'manage_theme_status', 'ols_id' => $_REQUEST['ols_id']]); ?>';
var add_user_url='<?= $globals['index'] . $core->buildCleanQueryString(['view' => 'add_wp_user']); ?>';
var indexurl ='<?= $globals['index']; ?>';

let userModalInstance = null;
var update_usr_url='<?= $globals['index'] . $core->buildCleanQueryString(['view' => 'update_user']); ?>';
var update_pass_url='<?= $globals['index'] . $core->buildCleanQueryString(['view' => 'update_password']); ?>';
 document.addEventListener('DOMContentLoaded', function() {
    loadv('pluginTableBodymy', 'pluginmySpinner', 'my_wp_plugin');
  });
</script>




