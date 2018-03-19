<?php

// Выводим title / description / keywords для рубрик ==============================
function mayak_cat_keywords($keywords){
	if(is_category()){
	$terms = get_category( get_query_var( 'cat' ));
	$cat_id = $terms->cat_ID;
	$keywords = get_term_meta ( $cat_id, 'keywords', true );
	echo '<meta name="keywords" content="'.$keywords.'">'."\n";
	}
}

add_action('wp_head', 'mayak_cat_keywords', 1, 1);
add_action("category_edit_form_fields", 'mayak_category_meta');

function mayak_category_meta( $term ) {
	?>
		<tr class="form-field">
			<th scope="row" valign="top"><label>Заголовок (title)</label></th>
			<td>
				<input type="text" name="mayak[title]" value="<?php echo esc_attr( get_term_meta( $term->term_id, 'title', 1 ) ) ?>"><br />
				<p class="description">Не более 60 знаков, включая пробелы</p>
			</td>
		</tr>
		<tr class="form-field">
			<th scope="row" valign="top"><label>Заголовок h1</label></th>
			<td>
				<input type="text" name="mayak[h1]" value="<?php echo esc_attr( get_term_meta( $term->term_id, 'h1', 1 ) ) ?>"><br />
				<p class="description">Заголовок страницы</p>
			</td>
		</tr>
		<tr class="form-field">
			<th scope="row" valign="top"><label>Ключевые слова</label></th>
			<td>
				<input type="text" name="mayak[keywords]" value="<?php echo esc_attr( get_term_meta( $term->term_id, 'keywords', 1 ) ) ?>"><br />
				<p class="description">Ключевые слова (keywords)</p>
			</td>
		</tr>
<tr class="form-field">
<th scope="row" valign="top"><label>Краткое описание (description)</label></th>
<td>
<input type="text" name="mayak[description]" value="<?php echo esc_attr( get_term_meta( $term->term_id, 'description', 1 ) ) ?>"><br />
<p class="description">Краткое описание (description)</p>
</td>
</tr>
	<?php
}

function mayak_cat_description($description){
	if(is_category()){
	$desc = get_category( get_query_var( 'cat' ));
	$category_id = $desc->cat_ID;
	$description = get_term_meta ( $category_id, 'description', true );
	if(!empty($description)){
	$meta = '<meta name="description"  content="'.$description.'" />'."\n";
	}
    else {		   
	   $description = wp_filter_nohtml_kses(substr(category_description(), 0, 280));
	   $meta = '<meta name="description"  content="'.$description.'" />'."\n";	   
	}
	echo $meta;
	}
}
add_action('wp_head', 'mayak_cat_description', 1, 1);
function mayak_save_meta( $term_id ) {
	if ( ! isset($_POST['mayak']) )
		return;
	$mayak = array_map('trim', $_POST['mayak']);
	foreach( $mayak as $key => $value ){
		if( empty($value) ){
			delete_term_meta( $term_id, $key );
			continue;
		}
		update_term_meta( $term_id, $key, $value );
	}
	return $term_id;
}
add_action("create_category", 'mayak_save_meta');
add_action("edited_category", 'mayak_save_meta');

function mayak_filter_single_cat_title($term_name) {
    $terms = get_category( get_query_var('cat'));
    $cat_id = $terms->cat_ID;
    $term_name = get_term_meta ($cat_id, 'title', true);
	return $term_name;	
}
add_filter('single_cat_title', 'mayak_filter_single_cat_title', 10, 1 );

function mayak_single_cat_title ($term_name){
    if(empty($term_name)){
	    $terms = get_category( get_query_var( 'cat' ));
	    $cat_id = $terms->cat_ID;
	    $term_name = get_cat_name($cat_id);
	}
	return $term_name;
}
add_filter( 'single_cat_title', 'mayak_single_cat_title', 10, 1 ); 

function mayak_cat_caption($caption) {
	$terms = get_category( get_query_var( 'cat' ));
	$cat_id = $terms->cat_ID;
	$caption = get_cat_name($cat_id);
    echo $caption; 
}
function mayak_cat_h1($name_cat) {
	$terms = get_category( get_query_var( 'cat' ));
	$cat_id = $terms->cat_ID;
	$name_cat = get_term_meta ( $cat_id, 'h1', true );
    echo $name_cat;
	if(empty($name_cat)){
	   echo	mayak_cat_caption($caption);
	}
}

// меню в футере ==============================================================

function register_my_menus() {
  register_nav_menus(
    array(
      'FooterMenu' => __( 'FooterMenu' )
    )
  );
}
add_action( 'init', 'register_my_menus' );

// контакты в футере =========================================================
register_sidebar(array(
    'name' => 'Footer contacts',
    'id' => 'footer-cont',
    'description' => 'Контакты в футере',
    'before_widget' => '<div id="footer-cont">',
    'after_widget' => '</div>',
    'before_title' => '<p>',
    'after_title' => '</p>',
	));

// контакты в товарах ========================================================
register_sidebar(array(
    'name' => 'Product contacts',
    'id' => 'product-contact',
    'description' => 'Контакты в товарах',
    'before_widget' => '<div id="product-contact">',
    'after_widget' => '</div>',
    'before_title' => '<p class="product-page_contact__title">',
    'after_title' => '</p>',
	));

// Кол-во символов в анонсах записей ==========================================
	function new_excerpt_length($length) {
		return 80;
	}
	add_filter('excerpt_length', 'new_excerpt_length');

// сайдбар ====================================================================
function catalog_widgets(){
	register_sidebar( array(
		'name' => 'Сайдбар',
		'id' => 'homepage-sidebar',
		'description' => 'Вывод бокового меню в каталоге.',
		'before_widget' => '<div class="sidebar-catalog"><div class="burger-cat"></div>',
		'after_widget' => '</div>',
		'before_title' => ' <h3 class="main-title cat-title">',
		'after_title' => '</h3>',
	) );
}
add_action( 'widgets_init', 'catalog_widgets' );

//миниатюры анонсов записей ====================================================
add_theme_support( 'post-thumbnails'); 

// меню ========================================================================
register_nav_menu('menu', 'Меню в шапке');

// хлебные крошки ==============================================================
function the_breadcrumb(){
	global $post;
	if(!is_home()){ 
	   echo '<li><a href="'.site_url().'">Главная</a></li><li> / </li>  ';
		if(is_single()){ // записи
		echo '<li>'	;
		the_category(', ');
		echo '</li>'	;
		echo '<li> / </li>';
		echo '<li>';
		the_title();
		echo '</li>';
		}
		elseif (is_page()) { // страницы
			if ($post->post_parent ) {
				$parent_id  = $post->post_parent;
				$breadcrumbs = array();
				while ($parent_id) {
					$page = get_page($parent_id);
					$breadcrumbs[] = '<a href="' . get_permalink($page->ID) . '">' . get_the_title($page->ID) . '</a>';
					$parent_id  = $page->post_parent;
				}
				$breadcrumbs = array_reverse($breadcrumbs);
				// лишки
				foreach ($breadcrumbs as $crumb) echo $crumb . '  ';
			}
			echo '<li>';
			echo the_title();
			echo '</li>';
		}
		elseif (is_category()) { // категории
			global $wp_query;
			$obj_cat = $wp_query->get_queried_object();
			$current_cat = $obj_cat->term_id;
			$current_cat = get_category($current_cat);
			
			$parent_cat = get_category($current_cat->parent);
			
		
			if ($current_cat->parent != 0) 
				echo '<li>' , (get_category_parents( $parent_cat, TRUE, ' <li> / </li> '));
				echo '<li>';
			single_cat_title();
			echo '</li>';
		}
		elseif (is_search()) { // страницы поиска
			echo 'Результаты поиска для "' . get_search_query() . '"';
		}
		elseif (is_tag()) { // теги (метки)
			echo single_tag_title('', false);
		}
		elseif (is_day()) { // архивы (по дням)
			echo '<a href="' . get_year_link(get_the_time('Y')) . '">' . get_the_time('Y') . '</a> &amp;raquo; ';
			echo '<a href="' . get_month_link(get_the_time('Y'),get_the_time('m')) . '">' . get_the_time('F') . '</a> &amp;raquo; ';
			echo get_the_time('d');
		}
		elseif (is_month()) { // архивы (по месяцам)
			echo '<a href="' . get_year_link(get_the_time('Y')) . '">' . get_the_time('Y') . '</a> &amp;raquo; ';
			echo get_the_time('F');
		}
		elseif (is_year()) { // архивы (по годам)
			echo get_the_time('Y');
		}
		elseif (is_author()) { // авторы
			global $author;
			$userdata = get_userdata($author);
			echo 'Опубликовал(а) ' . $userdata->display_name;
		} elseif (is_404()) { // если страницы не существует
			echo 'Ошибка 404';
		}
	 
		if (get_query_var('paged')) // номер текущей страницы
			echo ' (' . get_query_var('paged').'-я страница)';
	 
	} else { // главная
	   $pageNum=(get_query_var('paged')) ? get_query_var('paged') : 1;
	   if($pageNum>1)
		  echo '<li><a href="'.site_url().'">Главная</a></li><li> / <li>  <li>'.$pageNum.'-я страница</li>';
	   else
		  echo '<li>Главная</li>';
	}
}

// Скрываем товары на главной ==============================================

function exclude_category($query) {
	if ( $query->is_feed or $query->is_home ) {
	$query->set('category__not_in', array(18));}
	return $query;
	}
	add_filter('pre_get_posts', 'exclude_category');

//Пагинация ================================================================
function catalog_pagination( $args = array() ) {
    
    $defaults = array(
        'range'           => 4,
        'custom_query'    => FALSE,
        'previous_string' => __( 'Предыдущая', 'text-domain' ),
        'next_string'     => __( 'Далее', 'text-domain' ),
        'before_output'   => '<div class="pagination"><ul class="pager">',
        'after_output'    => '</ul></div>'
    );
    
    $args = wp_parse_args( 
        $args, 
        apply_filters( 'wp_bootstrap_pagination_defaults', $defaults )
    );
    
    $args['range'] = (int) $args['range'] - 1;
    if ( !$args['custom_query'] )
        $args['custom_query'] = @$GLOBALS['wp_query'];
    $count = (int) $args['custom_query']->max_num_pages;
    $page  = intval( get_query_var( 'paged' ) );
    $ceil  = ceil( $args['range'] / 2 );
    
    if ( $count <= 1 )
        return FALSE;
    
    if ( !$page )
        $page = 1;
    
    if ( $count > $args['range'] ) {
        if ( $page <= $args['range'] ) {
            $min = 1;
            $max = $args['range'] + 1;
        } elseif ( $page >= ($count - $ceil) ) {
            $min = $count - $args['range'];
            $max = $count;
        } elseif ( $page >= $args['range'] && $page < ($count - $ceil) ) {
            $min = $page - $ceil;
            $max = $page + $ceil;
        }
    } else {
        $min = 1;
        $max = $count;
    }
    
    $echo = '';
    $previous = intval($page) - 1;
    $previous = esc_attr( get_pagenum_link($previous) );
    
    $firstpage = esc_attr( get_pagenum_link(1) );
    if ( $firstpage && (1 != $page) )
        $echo .= '<li class="previous"><a href="' . $firstpage . '">' . __( 'В начало', 'text-domain' ) . '</a></li>';
    if ( $previous && (1 != $page) )
        $echo .= '<li><a href="' . $previous . '" title="' . __( 'Предыдущая', 'text-domain') . '">' . $args['previous_string'] . '</a></li>';
    
    if ( !empty($min) && !empty($max) ) {
        for( $i = $min; $i <= $max; $i++ ) {
            if ($page == $i) {
                $echo .= '<li class="active"><span class="active">' . str_pad( (int)$i, 1, '0', STR_PAD_LEFT ) . '</span></li>';
            } else {
                $echo .= sprintf( '<li><a href="%s">%2d</a></li>', esc_attr( get_pagenum_link($i) ), $i );
            }
        }
    }
    
    $next = intval($page) + 1;
    $next = esc_attr( get_pagenum_link($next) );
    if ($next && ($count != $page) )
        $echo .= '<li><a href="' . $next . '" title="' . __( 'next', 'text-domain') . '">' . $args['next_string'] . '</a></li>';
    
    $lastpage = esc_attr( get_pagenum_link($count) );
    if ( $lastpage ) {
        $echo .= '<li class="next"><a href="' . $lastpage . '">' . __( 'Последняя', 'text-domain' ) . '</a></li>';
    }
    if ( isset($echo) )
        echo $args['before_output'] . $echo . $args['after_output'];
} 
