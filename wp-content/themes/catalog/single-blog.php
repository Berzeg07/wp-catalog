
<?php 
/*
 Single Post Template: single-blog
 Description: Страница записи блога
 */
?>
 
<?php get_header();?>

<main>
    <?php get_template_part('templates/breadcrumbs'); ?>

    <div class="container">
        
        <h1 class="main-title"><?php the_title(); ?></h1>
        
        <div class="blog-page_content">
            <?php if ( have_posts() ) :  while ( have_posts() ) : the_post(); ?>
            <?php the_content(); ?>
            <?php endwhile; ?>
            <?php endif; ?>
        </div>

    </div>
</main>

<?php get_footer();?>