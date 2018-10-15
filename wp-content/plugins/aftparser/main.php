<?php
//
/**
 * 
 * Главный файл модуля. Отвечает за создание\удаление таблиц в базе и формирование страниц меню в админке.
 * 
 */

# Защита от мудаков
if (!defined( 'ABSPATH' )){
	header('HTTP/1.0 403 Forbidden');
	exit('Вызов файлов плагина напрямую запрещен.');
}

class AftParserAdmin{
	static $instance;
	function __construct() {
        self::$instance = $this;
		add_action('admin_init', array($this, 'hook_admin_es'));	// Тут добавляем в head область админки css и js файлы плагина
		add_action('admin_menu', array($this, 'hook_admin_menu'));			// Тут создаем пункт меню для нашего плагина

		register_activation_hook( AFTPARSER__PLUGIN_DIR . '/aftparser.php' , array($this, 'hook_activate'));	// Хук активации плагина. Тут создаем дб таблицы для плагина.
		register_deactivation_hook( AFTPARSER__PLUGIN_DIR .'/aftparser.php' , array($this, 'hook_deactivate'));	// При деактивации плагина - удалям таблицы из базы
	}
	
	function hook_activate(){
		add_option("aft_time_interval", 43200, '', $autoload = 'yes');	//Время срабатывания встроенного cron'а - раз в 12 часов
		$this->create_plugin_tables();
	}
	
	/**
	 * 
	 * Создаем таблицы в базе
	 * 
	 */
	
	function create_plugin_tables(){
		global $wpdb;	// Интерфейс, а проще говоря класс для работы с базой данных
		$charset_collate = '';	// Автоматическое определение кодировки в бд пользователя.
		if ( ! empty( $wpdb->charset ) ) {
		  $charset_collate = "DEFAULT CHARACTER SET {$wpdb->charset}";
		}
		if ( ! empty( $wpdb->collate ) ) {
		  $charset_collate .= " COLLATE {$wpdb->collate}";
		}
		
		$table_name = $wpdb->prefix . 'aft_parser';
		$sql = "CREATE TABLE IF NOT EXISTS `".$table_name."`(
			`id` int(11) NOT NULL AUTO_INCREMENT,
			`title` varchar(70) DEFAULT NULL,
			`links_list` TEXT DEFAULT NULL,
			`num_links` int(2) DEFAULT NULL,
			`borders` TEXT DEFAULT NULL,
			`macro` TEXT DEFAULT NULL,
			`publ_mode` varchar(10) DEFAULT NULL,
			`cat_id` int(6) DEFAULT NULL,
			`state` varchar(10) DEFAULT NULL,
			`last_parsed` TEXT DEFAULT NULL,
			`mode` int(1) DEFAULT 0,
			UNIQUE KEY id (id)
		) ".$charset_collate.";";//state =on,off

		require_once( ABSPATH . 'wp-admin/includes/upgrade.php' );
		dbDelta( $sql );
	}
	
	function hook_deactivate(){
		$this->delete_plugin_tables();
	}
	
	/**
	 * 
	 * Удаляем таблицы плагина
	 * 
	 */
	
	function delete_plugin_tables(){
		global $wpdb;
		$table_name = $wpdb->prefix . "aft_parser";
		$sql = "DROP TABLE IF EXISTS $table_name;";
		$wpdb->query($sql);
	}
	
	/**
	 * 
	 * Добавляем скрипты на страницы модуля при инициализации
	 * 
	 */
	
	function hook_admin_es() {
		if (isset($_GET['page']) && strpos($_GET['page'], 'aft_parser') === 0) {
			wp_enqueue_script('jquery-ui-accordion'); // подрубаем accordion из jquery ui
			
			// js
			wp_enqueue_script('aftparser-ace', AFTPARSER__PLUGIN_URL . 'js/ace_code_editor/ace.js',	array( 'jquery' ));
			wp_enqueue_script('aftparser-ace-modephp', AFTPARSER__PLUGIN_URL . 'js/ace_code_editor/mode-php.js',	array( 'jquery' ));
			wp_enqueue_script('aftparser-magnific', AFTPARSER__PLUGIN_URL . 'js/jquery.magnific-popup.min.js',	array( 'jquery' ));
			wp_enqueue_script('aftparser-main-js', AFTPARSER__PLUGIN_URL . 'js/main.js', array( 'jquery' ), time(), true);
    		
			// css
			wp_enqueue_style( 'aftparser-jq-ui', 		AFTPARSER__PLUGIN_URL . "css/jquery_ui.min.css");
			wp_enqueue_style( 'aftparser-jq-ui-struct',	AFTPARSER__PLUGIN_URL . "css/jquery_ui.structure.min.css");
			wp_enqueue_style( 'aftparser-jq-ui-theme', 	AFTPARSER__PLUGIN_URL . "css/jquery_ui.theme.min.css");
			wp_enqueue_style( 'aftparser-admin-css', 	AFTPARSER__PLUGIN_URL . "css/admin.css");
			wp_enqueue_style( 'aftparser-magnific-css', 	AFTPARSER__PLUGIN_URL . "css/magnific-popup.css");
			
    	}
	}
	
	
	/**
	 * 
	 * Формирование меню модуля
	 * 
	 */
	
	function hook_admin_menu() {
		$page_title = "Парсер AftParser";
		$menu_title = "Парсер";
		$capability = "manage_options";
		$menu_slug 	= "aft_parser/index";
		$icon_url 	= AFTPARSER__PLUGIN_URL . "/img/admin_icon.png";
		$position 	= null;
		add_menu_page( $page_title, $menu_title, $capability, $menu_slug, array($this,'get_dashboard_page'), $icon_url, $position );	//Главный пунки меню админки
		
		//Подпункты
		add_submenu_page($menu_slug, $page_title, 'Главная', $capability,  $menu_slug , array($this,'get_dashboard_page'));
		add_submenu_page($menu_slug, 'Парсер сайтов', 'Парсер сайтов', $capability,  'aft_parser_plinks_parser' , array($this,'add_new_parser'));
		//add_submenu_page($menu_slug, 'Упрощенный парсер [в разработке]', 'Простой парсер<br>[в разработке]', $capability,  'aft_parser_eparser' , array($this,'add_new_eparser'));
		add_submenu_page($menu_slug, 'Парсер rss лент', 'Парсер rss лент', $capability,  'aft_parser_prss_parser' , array($this,'add_new_rss_tape'));
		add_submenu_page($menu_slug, 'Настройки CRON', 'Дополнительно', $capability,  'aft_parser_settings' , array($this,'settings_page'));
	}
	
	function get_dashboard_page(){
		include_once(AFTPARSER__PLUGIN_DIR.'pages/index_page.php');
	}
	
	function add_new_eparser(){
		include_once(AFTPARSER__PLUGIN_DIR.'pages/eparser_page.php');
	}

	function add_new_parser(){
		include_once(AFTPARSER__PLUGIN_DIR.'pages/site_parser_page.php');
	}
	
	function add_new_rss_tape(){
		include_once(AFTPARSER__PLUGIN_DIR.'pages/rss_parser_page.php');
	}
	
	function settings_page(){
		include_once(AFTPARSER__PLUGIN_DIR.'pages/settings_page.php');
	}
}

new AftParserAdmin();