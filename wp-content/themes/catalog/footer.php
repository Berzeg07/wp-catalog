<footer class="footer">
	<ul class="footer_list container">
		 <li>
			<p>Навигация</p>
			<?php wp_nav_menu(array(
					'theme_location'=>'menu',
					'container'=>'false',
					'depth'=>'1'
            
			)); ?>
		</li>
		<li>
			<p>Информация</p>
			<?php wp_nav_menu(array( 
				'theme_location' => 'FooterMenu',
				'container'=>'false',
                'depth'=>'1'
			)); ?>
		</li>
		<li class="footer_contact">
			<?php if ( !function_exists('dynamic_sidebar') || !dynamic_sidebar('footer-cont') ) : ?>
    		<?php endif; ?>
		</li>
		<li>
			<p>Способы оплаты</p>
			<div class="payments">
				<img src="<?php echo get_template_directory_uri() ?>/img/payments.png" alt="">
			</div>
		</li>
	</ul>
	<div class="copy container">Copyright &copy; 2018</div>
</footer>


	
</body>
	<?php wp_footer();?>
	<!-- JS_BLOCK -->
	<script src="<?php echo get_template_directory_uri(); ?>/libs/jquery/jquery-3.2.1.min.js"></script>
	<script src="<?php echo get_template_directory_uri(); ?>/js/common.js"></script>
	<script src="<?php echo get_template_directory_uri(); ?>/libs/owl.carousel/owl.carousel.js"></script>
	<script src="<?php echo get_template_directory_uri(); ?>/js/jquery.maskedinput.min.js"></script>
	<script src="<?php echo get_template_directory_uri(); ?>/js/fonts.js"></script>
    
</html>