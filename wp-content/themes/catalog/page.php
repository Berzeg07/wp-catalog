<?php get_header();?>

<?php get_template_part('templates/breadcrumbs'); ?>

<div class="container page-box">

    <?php if ( have_posts() ) :  while ( have_posts() ) : the_post(); 
    the_content(); 
    endwhile; 
    endif; ?>
</div>
    
<?php get_footer();?>









