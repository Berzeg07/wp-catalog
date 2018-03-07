

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

<?php get_template_part('templates/breadcrumbs'); ?>

<div class="catalog container"> 
    <div class="catalog_inner">  

        <?php get_sidebar();?>

        <div class="content-catalog">

            <div class="category-top">
                <h1 class="main-title"><?php single_cat_title()?></h1>
                <?php get_template_part('templates/search'); ?>
            </div>
			
            <div class="product-box">
				<?php if ( have_posts() ) : while ( have_posts() ) : the_post();?>
                <?php get_template_part('templates/cart') ?>
				<?php endwhile; ?>
				<?php else: ?>
				<?php endif; ?>
             </div>

            <?php catalog_pagination(); ?>

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

<?php get_footer();?>










