<?php get_header();?>
<?php get_template_part('templates/breadcrumbs'); ?>


<div class="product-page container">
    
    
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
            <div class="about-order">
                <span>Характеристики</span>
            </div>
            
            <div class="product-page_contact">
                <p>Размеры: <span><?php the_field('razmer') ?></span></p>
                <p>Материал: <span><?php the_field('material') ?></span></p>
                <p>Цвет: <span> <?php the_field('color') ?></span></p>
                <p>Тип печати: <span><?php the_field('tip_pechati') ?></span></p>
                <p>Формат печати: <span><?php the_field('format_pechati') ?></span></p>
                <p class="product-page_price">Цена: <span> <?php the_field('price') ?></span> руб.</p> 
            </div>

            <div class="about-order">
                <span>Как заказать</span>
            </div>

            <div class="product-page_contact">
                <p class="product-page_contact__title">Для заказа обращайтесь по указанным контактам</p>
                <span class="product-page_phone"><?php the_field('phone') ?></span><br>
                <span class="product-page_inst"><?php the_field('inst') ?></span><br>
                <span class="product-page_email"><?php the_field('email') ?></span><br>
                <p class="product-page_contact__discounts">Индивидуальная система скидок при заказе от 3 изделий</p>
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

<?php get_footer();?>