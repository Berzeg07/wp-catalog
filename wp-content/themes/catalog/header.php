<!doctype html>
<html lang="ru">
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1, minimum-scale=1">
	<title><?php single_term_title()?></title>
    <link rel="stylesheet" href="<?php echo get_template_directory_uri(); ?>/libs/owl.carousel/assets/owl.carousel.min.css">
    <link  href="http://cdnjs.cloudflare.com/ajax/libs/fotorama/4.6.4/fotorama.css" rel="stylesheet">
    <link rel="stylesheet" href="<?php bloginfo('stylesheet_url')?>">
    <?php wp_head();?>
</head>
<body>
<header>
    <div class="header-top">

        <div class="burger-wrap">
            <div class="burger">
                <div class="burger_inner"></div>
            </div>
        </div>

        <div class="header-top_inner container">
            <ul>
                <li><div class="main-logo"><img src="<?php echo get_template_directory_uri() ?>/img/logo.png" alt=""></div></li>
                <li class="header-cont">
                    <div class="header-cont_phone">
                        <span class="header_phone">+7(928)706-73-84</span><br>
                        <span class="work_time">Ежедневно: с 9:00 до 20:00</span>
                    </div>
                    <div class="header-cont_inst">
                        <span class="header_inst"><a href="https://www.instagram.com/printhouse07/?hl=ru" target="_blank"> @highlandmarket</a></span>
                    </div>
                </li>
                <li>
                    <?php get_template_part('templates/search'); ?>
                </li>
            </ul>
        </div>
    </div>
    <div class="header-bottom">
        <div class="container ">
            <nav class="main-nav">
                <?php wp_nav_menu(array(
                    'theme_location'=>'menu',
                    'container'=>'false',
                    'depth'=>'1'
                )); ?>
                <?php if ( !function_exists('dynamic_sidebar') || !dynamic_sidebar('menu-catalog') ) : ?>
                <?php endif; ?>
            </nav>
        </div>
    </div>
    <div class="header-banner">
        <div class="promo_slider owl-carousel">
            <div class="slide">
                <img src="<?php echo get_template_directory_uri(); ?>/img/bgb.jpg" alt="">
            </div>
            <div class="slide">
                <img src="<?php echo get_template_directory_uri(); ?>/img/bgb.jpg" alt="">                    
            </div>
            <div class="slide">
                <img src="<?php echo get_template_directory_uri(); ?>/img/bgb.jpg" alt="">                        
            </div>
        </div>
    </div>
</header>  