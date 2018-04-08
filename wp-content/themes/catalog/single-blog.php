
<?php 
/*
 Single Post Template: single-blog
 Description: Страница записи блога
 */
?>
 
<?php get_header();?>

<main class="container">
    <?php get_template_part('templates/breadcrumbs'); ?>

    <div class="single-post_wrap">
        <!-- post-text -->
        <div class="content-box">
            <h1 class="main-title main-title_single"><?php the_title(); ?></h1>
            <div class="blog-page_content">
                <?php if ( have_posts() ) :  while ( have_posts() ) : the_post(); ?>
                <?php the_content(); ?>
                <?php endwhile; ?>
                <?php endif; ?>
            </div>
        </div>
        <!-- Sidebar -->
        <div class="sidebar">
            <?php get_sidebar();?>
        </div>
    </div>

</main>

<?php get_footer();?>