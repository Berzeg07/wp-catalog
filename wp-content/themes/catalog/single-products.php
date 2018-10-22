<?php 
/*
 Single Post Template: single-products
 Description: Страница товара
 */
?>

<?php get_header();?>

<main>
<div class="container">
    <?php get_template_part('templates/breadcrumbs'); ?>

    <div class="product-page">
        
        <div class="product-page_top">
            <h1 class="main-title"><?php the_title(); ?></h1>
            <span>Артикул: <?php the_field('artikul') ?></span>
        </div>

        <div class="product-page_inner">
            <div id="slider-black" class="fotorama tab_colors product-slider" data-nav="thumbs">
                <img src="<?php the_field('img_1'); ?>" alt="" width="150" height="160">
                <img src="<?php the_field('img_2'); ?>" alt="" width="150" height="160">
                <img id="img_5-White" src="<?php the_field('img_17-WBlack'); ?>" alt="" width="150" height="160">
                <img id="img_6-White" src="<?php the_field('img_18-WBlack'); ?>" alt="" width="150" height="160">
            </div>
            <div id="slider-white" class="fotorama tab_colors product-slider" data-nav="thumbs">
                <img id="img_5-White" src="<?php the_field('img_5-White'); ?>" alt="" width="150" height="160">
                <img id="img_6-White" src="<?php the_field('img_6-White'); ?>" alt="" width="150" height="160">
                <img src="<?php the_field('img_13-WWhite'); ?>" alt="" width="150" height="160">
                <img src="<?php the_field('img_14-WWhite'); ?>" alt="" width="150" height="160">
            </div>
            <div id="slider-red" class="fotorama tab_colors product-slider" data-nav="thumbs">
                <img id="img_5-White" src="<?php the_field('img_9-Red'); ?>" alt="" width="150" height="160">
                <img id="img_6-White" src="<?php the_field('img_10-Red'); ?>" alt="" width="150" height="160">
                <img id="img_5-White" src="<?php the_field('img_21-WRed'); ?>" alt="" width="150" height="160">
                <img id="img_6-White" src="<?php the_field('img_22-WRed'); ?>" alt="" width="150" height="160">
            </div>

            
            <div class="product-page_info">
                <ul class="product_info">
                    <li class="product_info__title">Информация о товаре:</li>
                    <li><?php the_field('field1') ?></li>
                    <li><?php the_field('field2') ?></li>
                    <li><?php the_field('field3') ?></li>
                    <li><?php the_field('field4') ?></li>
                    <li><?php the_field('field5') ?></li>
                    <li class="important-field"><?php the_field('field6') ?></li>

                    <li class="price-box">
                        <p>Расчет цены по типу изделия:</p>
                        <?php the_field('typeProduct-tab') ?>
                        <p class="product-page_price">Итоговая стоимость: <span><?php the_field('price') ?></span> <i>&#8381;</i></p>
                    </li>
    
                    <li><?php the_field('color-btn') ?></li>   
                </ul>
                <div class="product-page_contact">
                    <?php if ( !function_exists('dynamic_sidebar') || !dynamic_sidebar('product-contact') ) : ?>
                    <?php endif; ?>
                </div>
            </div>
        </div> 
        <div class="product-page_article">
            <?php if ( have_posts() ) :  while ( have_posts() ) : the_post(); ?>
            <?php the_content(); ?>
            <?php endwhile; ?>
            <?php endif; ?>
        </div>
    </div>
    <div class="main-title recom">Рекомендуем</div>
    <?php wp_related_posts()?>

    <!-- <div class="recom_slider owl-carousel owl-theme">
        <?php
            // if ( have_posts() ) : query_posts('cat=19');  while (have_posts()) : the_post(); 
            // get_template_part('templates/cart-recom');
            // endwhile; 
            // endif;
            // wp_reset_query();                
        ?>
    </div> -->
</div>
    
</main>

<?php get_footer();?>