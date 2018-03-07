
<?php get_header();?>

    <div class="search-result container">
        <h1 class="main-title">Поиск по: "<?php echo $_GET['s'];?>"</h1><br/><br/>
        <?php if (have_posts()) : while (have_posts()) : the_post(); ?>
        <a href="<?php the_permalink();?>"><?php the_title(); ?></a><br/><br/>

        <?php endwhile; else: ?>
            <p>Поиск не дал результатов.</p>
        <?php endif;?>
    </div>

<?php get_footer();?>