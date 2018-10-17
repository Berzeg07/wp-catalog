<?php 
/*
 Single Post Template: single-products
 Description: Страница товара
 */
?>

<?php get_header();?>

<main class="container">

    <?php get_template_part('templates/breadcrumbs'); ?>

    <div class="product-page">
        
        <div class="product-page_top">
            <h1 class="main-title"><?php the_title(); ?></h1>
            <span>Артикул: <?php the_field('artikul') ?></span>
        </div>

        <div class="product-page_inner">

            <div class="product_slider owl-carousel owl-theme">
                <div class="slide">
                    <img src="<?php the_field('img_1'); ?>" alt="">
                </div>
                <div class="slide">
                    <img src="<?php the_field('img_2'); ?>" alt="">
                </div>
                <div class="slide">
                    <img src="<?php the_field('img_3'); ?>" alt="">
                </div>
            </div>
            
            <div class="product-page_info">

                <div class="product_info">
                    <p>Информация о товаре:</p>
                    <p><?php the_field('field1') ?></p>
                    <p><?php the_field('field2') ?></p>
                    <p><?php the_field('field3') ?></p>
                    <p><?php the_field('field4') ?></p>
                    <p><?php the_field('field5') ?></p>
                    <p><?php the_field('field6') ?></p>
                    
                    <p class="product-page_price">Цена: <span><?php the_field('price') ?></span> <i>руб.</i></p> 
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
</main>

<?php get_footer();?>