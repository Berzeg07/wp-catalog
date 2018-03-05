<!doctype html>
<html lang="ru">
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1, minimum-scale=1">
	<title><?php bloginfo('name')?></title>
	<link rel="stylesheet" href="<?php bloginfo('stylesheet_url')?>">
    <link rel="stylesheet" href="<?php echo get_template_directory_uri(); ?>/libs/owl.carousel/assets/owl.carousel.css">
    <?php wp_head();?>

	
</head>
<body>

<header class="header-wrap">
    <div class="header container">
        <div class="logo"><a href="#">PrintHouse</a></div>

        <nav class="main-nav">
            <span class="main-nav_burger"></span>
            <ul>
                <li><a class="main-nav_link active" href="index.php">Главная</a></li>
                <li><a class="main-nav_link" href="catalog.php">Каталог</a></li>
                <li><a class="main-nav_link" href="#">Контакты</a></li>
            </ul>
        </nav>
    </div>
</header>  