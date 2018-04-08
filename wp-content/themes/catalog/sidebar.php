<?php get_template_part('templates/search'); ?>
<div class="sidebar_last-posts">
	<h3 class="main-title">Новые статьи</h3>
	<?php
		$ID=1; // id рубрики
		$count=7; // кол-во записей для показа
		$recent = new WP_Query("cat=$ID&showposts=$count");
		while($recent->have_posts()){
		$recent->the_post();?>
		<ul>
			<li>
				<div class="sidebar_last-posts__img">
					<a href="<?php the_permalink(); ?>"><?php the_post_thumbnail();?></a>
				</div>
				<div class="sidebar_last-posts__title"> 
					<a href="<?php the_permalink() ?>" rel="bookmark"><?php the_title(); ?></a><br>
					<span><?php the_time('d.m.Y');?></span>
				</div>
			</li>
		</ul>	
	<?php } ?>
</div>
<div class="sidebar-rubricks">
	<?php dynamic_sidebar('homepage-sidebar')?>
</div>
