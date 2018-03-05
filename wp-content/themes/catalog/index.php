

<?php get_header();?>

<div class="slider-wrap">
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
</div>

<div class="bradcrumbs">
    <ul>
        <li><a href="#">Каталог </a></li>
    </ul>
</div>  

<div class="catalog container"> 
    <div class="catalog_inner">  
        <?php get_sidebar();?>

        <div class="content-catalog">
            <div class="category-top">
                <h1 class="main-title">Каталог</h1>
                <div class="search-box">
                    <form action="#" method="post">
                        <input class="search-area" type="text" placeholder="Поиск">
                        <button type="submit"></button>
                    </form>
                </div>
            </div>
			

            <div class="product-box">
				<?php if ( have_posts() ) : while ( have_posts() ) : the_post();?>
					<div class="cart">
                    <a href="<?php the_permalink(); ?>"><?php the_post_thumbnail('full');?></a>
                    <a class="blog-box_btn cart_btn" href="<?php the_permalink(); ?>">Подробнее</a>
                    <div class="cart_info cat_info">
                        <a href="<?php the_permalink(); ?>"><?php the_title(); ?></a><br>
                    </div>
                </div>
				<?php endwhile; ?>
				
				<?php else: ?>
				
				<?php endif; ?>
			
               
                
            </div>

            <div class="pagination">
                <ul>
                    <li><a href="#">Назад</a></li>
                    <li><a class="active" href="#">1</a></li>
                    <li><a href="#">2</a></li>
                    <li><a href="#">3</a></li>
                    <li><a href="#">...</a></li>
                    <li><a href="#">50</a></li>
                    <li><a href="#">Далее</a></li>
                </ul>
            </div>
        </div>
    </div>
</div>
<?php get_footer();?>










