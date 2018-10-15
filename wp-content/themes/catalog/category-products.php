<?php
/*
 * Template name: Каталог
 */
?>

<?php get_header();?>

<!-- <div class="slider-wrap">
    <div class="promo_slider owl-carousel owl-theme">
        <div class="slide">
            <img src="<?php bloginfo('template_url')?>/img/test.jpg" alt="">
        </div>
        <div class="slide">
            <img src="<?php bloginfo('template_url')?>/img/test.jpg" alt="">
        </div>
        <div class="slide">
            <img src="<?php bloginfo('template_url')?>/img/test.jpg" alt="">
        </div>
    </div>
</div> -->

<main>
    <div class="container">
        <?php get_template_part('templates/breadcrumbs'); ?>
    </div>
    <div class="catalog container"> 
        <div class="catalog_inner">  
        
            <div class="content-catalog content-box">

                <div class="category-top">
                    <h1 class="main-title"><?php mayak_cat_h1($name_cat) ?></h1>
                </div>
                
                <div class="product-box">
                    <?php query_posts('cat=18&paged='.$paged); ?>
                    <?php if ( have_posts() ) : while ( have_posts() ) : the_post();?>
                    <?php get_template_part('templates/cart') ?>
                    <?php endwhile; ?>
                    <?php else: ?>
                    <?php endif; ?>
                </div>

                <?php catalog_pagination(); ?>

            </div>

             <div class="sidebar">
             <?php get_sidebar();?>
            </div>
        </div>
    </div>

    <div class="cateory-desc container">
        <?php
            if (is_category()) {
            if (is_paged()) { echo '';}
            else {
                echo category_description(); }
            }
        ?>
    </div>
</main>

<?php get_footer();?>










