<div class="cart">
    <a href="<?php the_permalink(); ?>"><?php the_post_thumbnail('full');?></a>
    <a class="blog-box_btn cart_btn" href="<?php the_permalink(); ?>">Подробнее</a>
    <div class="cart_info cat_info">
        <span class="product_price"><?php the_field('price') ?> &#8381;</span>
        <a href="<?php the_permalink(); ?>"><?php the_title(); ?></a>
    </div>
</div>