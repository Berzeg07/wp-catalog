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

        <div class="fotorama" data-nav="thumbs">
          <img src="<?php the_field('img_1'); ?>" alt="" width="150" height="160">
          <img src="<?php the_field('img_2'); ?>" alt="" width="150" height="160">
          <img src="<?php the_field('img_3'); ?>" alt="" width="150" height="160">
        </div>

            <!-- <div class="product_slider owl-carousel owl-theme">
                <div class="slide">
                    <img src="<?php the_field('img_1'); ?>" alt="">
                </div>
                <div class="slide">
                    <img src="<?php the_field('img_2'); ?>" alt="">
                </div>
                <div class="slide">
                    <img src="<?php the_field('img_3'); ?>" alt="">
                </div>
            </div> -->
            
            <div class="product-page_info">

                <div class="product_info">
                    <p>Информация о товаре:</p>
                    <p><?php the_field('field1') ?></p>
                    <p><?php the_field('field2') ?></p>
                    <p><?php the_field('field3') ?></p>
                    <p><?php the_field('field4') ?></p>
                    <p><?php the_field('field5') ?></p>
                    <p><?php the_field('field6') ?></p>
                    
                    <p class="product-page_price"><span><?php the_field('price') ?></span> <i>&#8381;</i></p> 
                </div>
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