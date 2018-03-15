<div class="blog-box_item"> 
    <div class="blog-box_item__title">   
        <a href="<?php the_permalink(); ?>" class="main-title"><?php the_title(); ?></a>
        <span><?php the_time('d.m.Y');?></span>
    </div>

    <div class="blog-box_item__inner">
        <div class="blog-box_img">
            <a href="<?php the_permalink(); ?>"><?php the_post_thumbnail();?></a>
        </div>
        <div class="blog-box_article">
            <p>
                <?php the_excerpt();?>
            </p>
            <a class="blog-box_btn" href="<?php the_permalink(); ?>">Подробнее</a>
        </div>
    </div>
</div>