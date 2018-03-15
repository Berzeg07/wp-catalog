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

<header class="header-wrap">
    <div class="header container">
        <div class="logo"><a href="index.php">Company</a></div>
        <nav class="main-nav">
            <span class="main-nav_burger"></span>
            <?php wp_nav_menu(array(
                'theme_location'=>'menu',
                'container'=>'false',
                'depth'=>'1'
            
            )); ?>
        </nav>
    </div>
</header>  