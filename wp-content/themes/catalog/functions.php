<?php

// произвольные поля ACF
// if(function_exists("register_field_group"))
// {
// 	register_field_group(array (
// 		'id' => 'acf_%d1%85%d0%b0%d1%80%d0%b0%d0%ba%d1%82%d0%b5%d1%80%d0%b8%d1%81%d1%82%d0%b8%d0%ba%d0%b8',
// 		'title' => 'Характеристики',
// 		'fields' => array (
// 			array (
// 				'key' => 'field_5a9fae0c7ccbb',
// 				'label' => 'Характеристики',
// 				'name' => 'product',
// 				'type' => 'text',
// 				'required' => 1,
// 				'default_value' => '',
// 				'placeholder' => '',
// 				'prepend' => '',
// 				'append' => '',
// 				'formatting' => 'html',
// 				'maxlength' => '',
// 			),
// 		),
// 		'location' => array (
// 			array (
// 				array (
// 					'param' => 'page',
// 					'operator' => '==',
// 					'value' => '8',
// 					'order_no' => 0,
// 					'group_no' => 0,
// 				),
// 			),
// 		),
// 		'options' => array (
// 			'position' => 'normal',
// 			'layout' => 'no_box',
// 			'hide_on_screen' => array (
// 			),
// 		),
// 		'menu_order' => 0,
// 	));
// }

// меню в футере ==========================================================================

function register_my_menus() {
  register_nav_menus(
    array(
      'FooterMenu' => __( 'FooterMenu' )
    )
  );
}
add_action( 'init', 'register_my_menus' );


// сайдбар ====================================================================
function catalog_widgets(){
	register_sidebar( array(
		'name' => 'Сайдбар',
		'id' => 'homepage-sidebar',
		'description' => 'Вывод бокового меню в каталоге.',
		'before_widget' => '<div class="sidebar-catalog">',
		'after_widget' => '</div>',
		'before_title' => ' <h3 class="main-title cat-title">',
		'after_title' => '</h3>',
	) );
}
add_action( 'widgets_init', 'catalog_widgets' );

//миниатюры анонсов записей ===================================================================
add_theme_support( 'post-thumbnails'); 

// меню =======================================================================
register_nav_menu('menu', 'Меню в шапке');

// хлебные крошки =============================================================
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

?>