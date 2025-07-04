<?php

return [

    'Blogs' => [ 
        [
            'script_name' => 'Wordpress',
            'logo'        => 'wordpress.png',
            'nickname'    => 'wordpress',
            'version'     => '6.5.3',
            'sorder'      => 1,
            'description' => "WordPress is web software you can use to create a beautiful website or blog. We like to say that WordPress is both free and priceless at the same time.
            The core software is built by hundreds of community volunteers, and when you're ready for more there are thousands of plugins and themes available to transform your site into almost anything you can imagine.
            Over 60 million people have chosen WordPress to power the place on the web they call 'home' we'd love you to join the family.",
            'rating'      => 4.9,
            'demo_link'   => 'https://wordpress.org/playground/demo/?step=playground&theme=twentytwentythree',
            'admin_path'   => '/wp-admin/',
            'demo_user'   => 'admin',
            'demo_pass'   => 'demo123',
            'status'      => 'active',
            'banners'     => [
                'https://wordpress.org/documentation/files/2018/10/500px-dashboard.png',
                'https://codex.wordpress.org/images/thumb/e/e1/twentyelevendefault1.png/787px-twentyelevendefault1.png',
                
            ],
            
            'fields' => [
                'username'  => 1,
                'email'     => 1,
                'password'  => 1,
                'title'     => 1,
                'db_prefix' => 1,
                'description'=> 1,
                ]    
        ],
        ],
     'CMS' => [    
        [
            'script_name' => 'Joomla',
            'logo'        => 'joomla.png',
            'nickname'    => 'Joomla',
            'version'     => '5.0.1',
            'sorder'      => 2,
            'description' => 'Flexible and powerful CMS for building websites and apps.',
            'rating'      => 3.5,
            'demo_link'   => 'https://demo.rsjoomla.com/administrator/',
            'admin_path'   => '/administrator/',
            'demo_user'   => 'admin',
            'demo_pass'   => 'demo123',
            'status'      => 'active',
            'banners'     => [
                'https://launch.joomla.org/images/what-is-joomla4.jpg',
                'https://launch.joomla.org/images/what-is-joomla4.jpg'
            ],
            
            'fields' => [
                'username'  => 1,
                'email'     => 1,
                'password'  => 1,
                'title'     => 1,
                'db_prefix' => 1,
                'description'=> 1,
                ]   
            
        ],
        [
            'script_name' => 'Drupal',
            'logo'        => 'drupal.png',
            'nickname'    => 'Drupal',
            'version'     => '10.2.2',
            'sorder'      => 3,
            'description' => 'Highly customizable CMS for complex websites.',
            'rating'      => 4.4,
            'demo_link'   => 'https://simplytest.me/configure?project=drupal&version=',
            'admin_path'   => '/user/login',
            'demo_user'   => 'admin',
            'demo_pass'   => 'demo123',
            'status'      => 'active',
            'banners'     => [
                'https://www.drupal.org/files/dashboard_6.png',
                'https://www.drupal.org/files/project-images/Capture%20d%27%C3%A9cran%202023-12-11%20010804.png'
            ],
            
            'fields' => [
                'username'  => 1,
                'email'     => 1,
                'password'  => 1,
                'title'     => 0,
                'db_prefix' => 1,
                'description'=> 0,
                ]   
        ],
        [
            'script_name' => 'Silverstripe',
            'logo'        => 'silverstripe.png',
            'nickname'    => 'SilverStripe',
            'version'     => '4.13.0',
            'sorder'      => 4,
            'description' => 'Open-source CMS and framework with a simple interface.',
            'rating'      => 4.0,
            'demo_link'   => 'https://demo.silverstripe.org/admin',
            'admin_path'   => '/public/admin/',
            'demo_user'   => 'admin',
            'demo_pass'   => 'demo123',
            'status'      => 'active',
            'banners'     => [
                'https://demo.silverstripe.org/assets/Uploads/_resampled/resizedimage750552-Screen-Shot-2012-05-25-at-10.23.44-AM.png',
                'https://demo.silverstripe.org/assets/Uploads/_resampled/resizedimage600424-Screen-Shot-2012-05-25-at-10.41.34-AM2.png',
                'https://demo.silverstripe.org/assets/Uploads/_resampled/resizedimage600327-media-inserter.png'
            ],
            
            'fields' => [
                'username'  => 0,
                'email'     => 1,
                'password'  => 1,
                'title'     => 1,
                'db_prefix' => 0,
                'description'=> 0,
                ]   
        ],
        [
            'script_name' => 'Concrete',
            'logo'        => 'conc.png',
            'nickname'    => 'Concrete',
            'version'     => '9.2.0',
            'sorder'      => 5,
            'description' => 'User-friendly CMS with in-context editing.',
            'rating'      => 4.1,
            'demo_link'   => 'https://demo.concretecms.com',
            'admin_path'   => '/index.php/login/',
            'demo_user'   => 'admin',
            'demo_pass'   => 'demo123',
            'status'      => 'active',
            'banners'     => [
                'https://www.opensourcecms.com/wp-content/uploads/Bildschirmfoto-2017-09-21-um-18.13.23.png',
                'https://www.opensourcecms.com/wp-content/uploads/Bildschirmfoto-2017-09-21-um-18.13.00.png'
            ],
            
            'fields' => [
                'username'  => 1,
                'email'     => 1,
                'password'  => 1,
                'title'     => 1,
                'db_prefix' => 0,
                'description'=> 0,
                ]   
        ]
    ],

    'Forum' => [
        [
            'script_name' => 'Phpbb',
            'logo'        => 'phpbb.png',
            'nickname'    => 'phpBB',
            'version'     => '3.3.11',
            'sorder'      => 1,
            'description' => 'Open-source forum software built in PHP.',
            'rating'      => 4.2,
            'demo_link'   => 'https://www.phpbb.com/demo/',
            'admin_path'   => '/adm/',
            'demo_user'   => 'admin',
            'demo_pass'   => 'demo123',
            'status'      => 'active',
            'banners'     => [
                'https://upload.wikimedia.org/wikipedia/commons/thumb/b/bb/PhpBB_3.2_Index_page.png/1920px-PhpBB_3.2_Index_page.png',
                'https://upload.wikimedia.org/wikipedia/commons/d/d9/PhpBB_2.0.png'
            ],
            
            'fields' => [
                'username'  => 1,
                'email'     => 1,
                'password'  => 1,
                'title'     => 1,
                'db_prefix' => 1,
                'description'=> 0,
                ]   
        ],
       
       
    ],

    'Framework' => [
        [
            'script_name' => 'Laravel',
            'logo'        => 'laravel.png',
            'nickname'    => 'Laravel',
            'version'     => '11.x',
            'sorder'      => 1,
            'description' => 'Modern PHP framework for building web apps.',
            'rating'      => 4.8,
            'demo_link'   => 'https://laravel.com/docs',
            'admin_path'   => '',
            'demo_user'   => 'N/A',
            'demo_pass'   => 'N/A',
            'status'      => 'active',
            'banners'     => [
                'https://laravel.com/images/home/deploy-cloud.png',
                'https://laravel.com/images/home/monitor-nightwatch.png'
            ],
            
            'fields' => [
                'username'  => 0,
                'email'     => 0,
                'password'  => 0,
                'title'     => 0,
                'db_prefix' => 0,
                'description'=> 0,
                ]   
        ],
        [
            'script_name' => 'Codeigniter',
            'logo'        => 'codeigniter.png',
            'nickname'    => 'codeigniter',
            'version'     => '4.5',
            'sorder'      => 2,
            'description' => 'Lightweight PHP framework for fast development.',
            'rating'      => 4.3,
            'demo_link'   => 'https://codeigniter.com/demo',
            'admin_path'   => '',
            'demo_user'   => 'admin',
            'demo_pass'   => 'demo123',
            'status'      => 'active',
            'banners'     => [
                'https://www.codeigniter.com/userguide3/_images/appflowchart.gif'
            ],
            
            'fields' => [
                'username'  => 0,
                'email'     => 0,
                'password'  => 0,
                'title'     => 0,
                'db_prefix' => 1,
                'description'=> 0,
                ]   
        ],
        
    ],

    'E-commerce' => [
        
        [
            'script_name' => 'Prestashop',
            'logo'        => 'presta.png',
            'nickname'    => 'PrestaShop',
            'version'     => '8.1.4',
            'sorder'      => 2,
            'description' => 'Free and powerful shopping cart software.',
            'rating'      => 4.4,
            'demo_link'   => 'https://demo.prestashop.com',
            'admin_path'   => '/admin/',
            'demo_user'   => 'demo@prestashop.com',
            'demo_pass'   => 'demodemo',
            'status'      => 'active',
            'banners'     => [
                'https://dsv16luwmjfsl.cloudfront.net/wp-content/uploads/2023/03/Showcase_Visuel_1920_Visiofactory_UK.jpg',
                'https://dsv16luwmjfsl.cloudfront.net/wp-content/uploads/2023/03/Showcase_Visuel_1920_Kenable_UK.jpg'
            ],
            
            'fields' => [
                'username'  => 1,
                'email'     => 1,
                'password'  => 1,
                'title'     => 1,
                'db_prefix' => 1,
                'description'=> 0,
                ]   
        ],
        [
            'script_name' => 'Opencart',
            'logo'        => 'opencart.png',
            'nickname'    => 'OpenCart',
            'version'     => '4.3.4',
            'sorder'      => 3,
            'description' => 'Simple and powerful open-source online store system.',
            'rating'      => 4.1,
            'demo_link'   => 'https://demo.opencart.com',
            'admin_path'   => '/administrator/',
            'demo_user'   => 'demo',
            'demo_pass'   => 'demo',
            'status'      => 'active',
            'banners'     => [
                'https://www.opencart.com/application/view/image/feature/admin/dashboard.png',
                'https://www.opencart.com/application/view/image/feature/admin/attributes.png'
            ],
            
            'fields' => [
                'username'  => 1,
                'email'     => 1,
                'password'  => 1,
                'title'     => 1,
                'db_prefix' => 1,
                'description'=> 0,
                ]   
        ]
    ],

   

    'Project Management' => [
        [
            'script_name' => 'Kanboard',
            'logo'        => 'kanboard.png',
            'nickname'    => 'Kanboard',
            'version'     => '1.2.18',
            'sorder'      => 1,
            'description' => 'Simple and efficient project management software.',
            'rating'      => 4.0,
            'demo_link'   => 'https://kanboard.org/assets/img/board.png',
            'demo_user'   => 'demo',
            'demo_pass'   => 'demo',
            'status'      => 'active',
            'banners'     => [
                'https://kanboard.org/assets/img/board.png',
                'https://kanboard.org/assets/img/drag-and-drop.png'
            ],
            
            'fields' => [
                'username'  => 1,
                'email'     => 1,
                'password'  => 1,
                'title'     => 0,
                'db_prefix' => 0,
                'description'=> 0,
                ]   
        ]
    ]

];

?>
