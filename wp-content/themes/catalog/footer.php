<footer class="footer">
	<ul class="footer_list container">
		
		<!-- <li class="footer_copy">Copyright &#169; 2018</li>
		 -->
		 <li>
		 <p>Навигация</p>
		 <?php wp_nav_menu(array(
                'theme_location'=>'menu',
                'container'=>'false',
                'depth'=>'1'
            
            )); ?></li>
		<li>
			<p>Информация</p>
			<?php wp_nav_menu(array( 
				'theme_location' => 'FooterMenu',
				'container'=>'false',
                'depth'=>'1'
			)); ?>
		</li>
		<li class="footer_contact">
			<p>Контакты</p>
			<span class="product-page_phone">+7(988)929-45-11</span><br>
			<span class="product-page_inst">printhouse07</span><br>
			<span class="product-page_email">test@gmail.com</span><br>
		</li>
	</ul>
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