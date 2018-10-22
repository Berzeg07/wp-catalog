<?php
/*
 * Template name: Главная страница
 */
?>
<?php get_header();?>
<main>
    <div class="container page-main">
        <p class="main-title">Каталог товаров</p>
        <!-- <div class="recom_slider owl-carousel owl-theme">
        <?php
            // if ( have_posts() ) : query_posts('cat=19');  while (have_posts()) : the_post(); 
            // get_template_part('templates/cart-recom');
            // endwhile; 
            // endif;
            // wp_reset_query();                
            ?>
        </div> -->
        <div class="recom_slider owl-carousel owl-theme">
            <?php
                $ID=18; // id рубрики
                $count=5; // кол-во записей для показа
                $recent = new WP_Query("cat=$ID&showposts=$count");
                while($recent->have_posts()){
                $recent->the_post();?>
                <div class="item">
                    <div class="cart">
                        <a href="<?php the_permalink(); ?>"><?php the_post_thumbnail('full');?></a>
                        <a class="blog-box_btn cart_btn" href="<?php the_permalink(); ?>">Подробнее</a>
                        <div class="cart_info cat_info">
                            <span class="product_price"><?php the_field('price') ?> &#8381;</span>
                            <a href="<?php the_permalink(); ?>"><?php the_title(); ?></a>
                        </div>
                    </div>
                </div>
            <?php } ?>
        </div>

        <div class="last-posts_main">
            <p class="main-title">Новые статьи</p>
            <?php echo do_shortcode("[pt_view id=c84a8a08xz]"); ?>
        </div>
    </div>
    <?php get_template_part('templates/advantage'); ?>
    <div class="article-main">
        <div class="container">
        <h1 class="main-title">Каталог товаров Highland Market</h1>
        <p> 
            Highland Market это уникальный проект, позволяющий каждому человеку почувствовать себя дизайнером одежды и аксессуаров.
            У нас вы можете создавать свои собственные коллекции одежды как для личных нужд, так и для последующей продажи.
            Вы можете радовать себя и своих близких вещами с эксклюзивными принтами, а также можете создать успешный бизнес без стартовых затрат.
            Вы можете заказать от одной до тысячи футболок и наши партнеры с радостью произведут их всего за 48 часов.
        </p>
        </div>
    </div>
</main>
<?php get_footer();?>