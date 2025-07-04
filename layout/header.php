<!doctype html>
<html lang="en">
 
<head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <link rel="icon" type="image/png" sizes="32x32" href="assets/appicon/logo.png">
    <link rel="stylesheet" href="assets/vendor/bootstrap/css/bootstrap.min.css">
    <link href="assets/vendor/fonts/circular-std/style.css" rel="stylesheet">
    <link rel="stylesheet" href="assets/libs/css/style.css">
    <link rel="stylesheet" href="assets/vendor/fonts/fontawesome/css/fontawesome-all.css">
    <link rel="stylesheet" href="assets/vendor/charts/chartist-bundle/chartist.css">
    <link rel="stylesheet" href="assets/vendor/charts/morris-bundle/morris.css">
    <link rel="stylesheet" href="assets/vendor/fonts/material-design-iconic-font/css/materialdesignicons.min.css">
    
    <title> <?php echo $title; ?></title>
</head>

<body>
    <!-- ============================================================== -->
    <!-- main wrapper -->
    <!-- ============================================================== -->
    <div class="dashboard-main-wrapper">
        <!-- ============================================================== -->
        <!-- navbar -->
        <!-- ============================================================== -->
        <div class="dashboard-header">
            <nav class="navbar navbar-expand-lg fixed-top">
                <a class="navbar-brand" href="<?php echo $globals['index'];?>"><img src="assets/appicon/olsapp_logo.png?id=2"/></a>
                <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                  <i class="fas fa-bars" style="font-size: 1.4rem; margin-right: 10px; color: white; display: flex; align-items: center;"></i>

                </button>
                <div class="collapse navbar-collapse " id="navbarSupportedContent">
                    <ul class="navbar-nav ml-auto navbar-right-top">
                        
                        
              <li class="nav-item">
    <a class="nav-link" href="<?php echo $globals['index'] . $core->buildCleanQueryString(['view' => 'wordpress_manager']); ?>" id="navbarDropdown" role="button" 
       data-bs-toggle="tooltip" data-bs-placement="bottom" title="Wordpress Manager">
        <i class=" fab fa-wordpress"></i>
         <span class="d-inline d-lg-none ml-2">Wordpress Manager</span>
    </a>
</li>
          
                        
                          <li class="nav-item">
    <a class="nav-link" href="<?php echo $globals['index'] . $core->buildCleanQueryString(['view' => 'my_install']); ?>" id="navbarDropdown" role="button" 
       data-bs-toggle="tooltip" data-bs-placement="bottom" title="All Installation">
        <i class="fas fa-archive"></i>
         <span class="d-inline d-lg-none ml-2">All Installation</span>
    </a>
</li>

   <li class="nav-item">
    <a class="nav-link" href="<?php echo $globals['index'] . $core->buildCleanQueryString(['view' => 'my_backup']); ?>" id="navbarDropdown" role="button" 
       data-bs-toggle="tooltip" data-bs-placement="bottom" title="Backup & Restore">
        <i class="fas fa-file-archive"></i>
        <span class="d-inline d-lg-none ml-2">Backup & Restore</span>
    </a>
</li>


 
                        <li class="nav-item dropdown nav-user">
                          <a class="nav-link nav-user-img" href="#" id="navbarDropdownMenuLink2" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
  <small style="font-size: 14px;margin-right:10px;"><?php echo htmlspecialchars($user['displayname'], ENT_QUOTES, 'UTF-8'); ?></small>
</a>
    <div class="dropdown-menu dropdown-menu-right nav-user-dropdown" aria-labelledby="navbarDropdownMenuLink2">
                                <div class="nav-user-info">
                                    <h5 class="mb-0 text-white nav-user-name"><?php echo htmlspecialchars($user['name'], ENT_QUOTES, 'UTF-8');?> </h5>
                                    <span class="status"></span><span class="ml-2"><?php echo htmlspecialchars($user['displayname'], ENT_QUOTES, 'UTF-8'); ?></span>
                                </div>
                                
                                <a class="dropdown-item" href="<?= $globals['index'] . $core->buildCleanQueryString(['view' => 'download', 'logout' => 1]); ?>"><i class="fas fa-power-off mr-2"></i>Logout</a>
                            </div>
                        </li>
                    </ul>
                </div>
            </nav>
        </div>
        <!-- ============================================================== -->
        <!-- end navbar -->
        <!-- ============================================================== -->
        <!-- ============================================================== -->
        <!-- left sidebar -->
        <!-- ============================================================== -->
        <div class="nav-left-sidebar sidebar-dark">
            <div class="menu-list">
                <nav class="navbar navbar-expand-lg navbar-light" style="padding-top:10px">
                    <a class="d-xl-none d-lg-none" href="<?php echo $globals['index'];?>">Category</a>
                    <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
                        <span class="fas fa-angle-down"></span>
                    </button>
                    
                    <div class="collapse navbar-collapse" id="navbarNav">
                      

                        <ul class="navbar-nav flex-column">
                            
                           <div id="custom-search" class="top-search-bar px-3 mb-2">
    <div class="input-group">
         <input type="text" name="fakeusernameremembered" style="display:none" />
  <input type="password" name="fakepasswordremembered" style="display:none" />

        <input class="form-control rounded-pill shadow-sm" autocomplete="off" id="menuSearchInput" type="text" placeholder="Search..." style="padding-left: 1.2rem;border-radius: 10px;">
    </div>
</div>

                            
                            
                             <li class="nav-item" style="padding-top:10px">
                                <a class="nav-link" href="<?php echo $globals['index'];?>" ><i class="fa fa-fw fa-home"></i>Home</a>
                               
                            </li>
                            
                             <li class="nav-divider">
                                Category
                            </li>
                            
                            
                             <?php       foreach ($phpScriptsByCategory as $categorymenu => $appsmenu) { 
                             $categorysubmenu = str_replace(' ', '_', $categorymenu);

                             
                             ?>
                            
                               <li class="nav-item">
                                <a class="nav-link " href="#" data-toggle="collapse" aria-expanded="false" data-target="#<?php echo htmlspecialchars($categorysubmenu, ENT_QUOTES, 'UTF-8');?>-2" aria-controls="<?php echo htmlspecialchars($categorysubmenu, ENT_QUOTES, 'UTF-8');?>-2"><i class="<?php echo $core->getCategoryIconClass($categorysubmenu);?>"></i><?php echo htmlspecialchars($categorymenu, ENT_QUOTES, 'UTF-8');?></a>
                                <div id="<?php echo htmlspecialchars($categorysubmenu, ENT_QUOTES, 'UTF-8');?>-2" class="collapse submenu" style="">
                                    <ul class="nav flex-column">
                                        <?php  foreach ($appsmenu as $appmenu) { ?>
                                        
                                        
                                        
                                        
                                        <li class="nav-item">
                                            <a class="nav-link" href="<?php echo $globals['index'] . $core->buildCleanQueryString(['view' => 'install', 'app' => $core->formatNickname($appmenu['nickname'])]); ?>"><?php echo htmlspecialchars($appmenu['script_name'], ENT_QUOTES, 'UTF-8');?></a>
                                        </li>
                                        
                                        
                                        <?php } ?>
                                       
                                    </ul>
                                </div>
                            </li>
                          
                          <?php } ?>
                          
                          
                            <li class="nav-divider">
                                Others
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" href="#" data-toggle="collapse" aria-expanded="false" data-target="#submenu-6" aria-controls="submenu-6"><i class="fas fa-fw fa-file"></i> Account </a>
                                <div id="submenu-6" class="collapse submenu" style="">
                                    <ul class="nav flex-column">
                                       
                                        <li class="nav-item">
                                            <a class="nav-link" href="<?= $globals['index'] . $core->buildCleanQueryString(['view' => 'download', 'logout' => 1]); ?>">Logout</a>
                                        </li>
                                      
                                    </ul>
                                </div>
                            </li>
                          
                            
                         
                           
                        </ul>
                    </div>
                </nav>
            </div>
        </div>
        <!-- ============================================================== -->
        <!-- end left sidebar -->
        <!-- ============================================================== -->
      




