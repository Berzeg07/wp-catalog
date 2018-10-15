<!doctype html>
<html lang="ru">
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1, minimum-scale=1">
	<title><?php single_term_title()?></title>
	<link rel="stylesheet" href="<?php bloginfo('stylesheet_url')?>">
    <link rel="stylesheet" href="<?php echo get_template_directory_uri(); ?>/libs/owl.carousel/assets/owl.carousel2.css">
    <?php wp_head();?>
</head>
<body>

<header>
    <div class="header-top">
        <div class="burger"></div>
        <div class="header-top_inner container">
            <div class="header-top_inner__logo">
                <span style="">Last Samurai</span>
            </div>
            <div class="header-top_inner__img">
                <img src="<?php echo get_template_directory_uri() ?> /img/t1.png">
            </div>
        </div>

    </div>
    <div class="header-bottom">
        <div class="container">
            <!-- <div class="logo"><a href="index.php"></a></div> -->
            <nav class="main-nav">
                
                <?php wp_nav_menu(array(
                    'theme_location'=>'menu',
                    'container'=>'false',
                    'depth'=>'1'
                )); ?>
            </nav>
        </div>
    </div>
</header>  