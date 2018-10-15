<?php
//
/**
 * 
 *  Класс-предок для ajax обработчиков
 * 
 */

class pAjax{
	static $instance;
	function __construct() {
        self::$instance = $this;

        add_action( 'wp_ajax_map_page',  	array($this, 'map_page') );
		add_action( 'wp_ajax_parse_sitemap',array($this, 'parse_sitemap') );
		add_action( 'wp_ajax_filter_links', array($this, 'filter_links') );
	}
	
	/**
	 * 
	 * Вспомогательные методы
	 * 
	 */
	
	# Проверка значений
	public function validate_data($url_list, $borders, $cat_id, $macro, $publ_mode){
		if(!is_admin()) return false;	// Дальше этого ни один кулцхакер не прыгнет. Без доступа к админке eval не работает. Обломчик.
		
		if(empty($url_list) || empty($borders) || empty($macro)) return false;

		// защита от долбоеба
		$deny = '#(?:[\s\S]*)include|require|readfile|show_source|highlight_file|import_request_variables|extract|base64_decode|create_function|parse_str|eval|$wpdb|global|assert|passthru|exec|system|shell_exec|proc_open|mysql_query|fopen(?:[\s\S]*)#is';
		
		if(preg_match_all($deny, $macro, $matches)) return false;
		
		$cat_to_check = get_term_by( 'id', $cat_id, 'category');	// если категории с таким айди не существует
		if (!$cat_to_check){
			return false;
		}
		
		if($publ_mode != "publish" && $publ_mode != "pending") return false;
		return true;
	}

	# Ajax обработчик, индексирующий сайт.
	public function map_page(){
		$this->validate_ajax();
		if(empty($_POST['url'])) exit(1);
		$url = htmlspecialchars($_POST['url']);
		
		$pr = new Parser();
		$links = $pr->parse_links($url);
		if(!empty($links)) echo $links; 
		die();
	}
	
	# Ajax обработчик парсера карты сайта
	public function parse_sitemap(){
		$this->validate_ajax();
		if(empty($_POST['url'])) exit(1);
		$url = htmlspecialchars($_POST['url']);
		
		$pr = new Parser();
		$links = $pr->get_sitemap_links($url);
		if(!empty($links)) echo $links;
		die();
	}
	
	# Ajax фильтровка списка ссылок. Сначала я хотел вынеси все это в класс парсера, но потом решил то не стоит.
	public function filter_links(){
		$this->validate_ajax();
		$links_list = stripslashes(urldecode($_POST['links']));
		$macro 		= stripslashes(urldecode($_POST['filter']));
		
		$deny = '#(?:[\s\S]*)include|require|readfile|show_source|highlight_file|import_request_variables|extract|base64_decode|create_function|parse_str|eval|$wpdb|global|assert|passthru|exec|system|shell_exec|proc_open|mysql_query|fopen(?:[\s\S]*)#is';
		if(preg_match_all($deny, $macro, $matches)){
				exit(json_encode(array("error","Вы используете запрещенные к вызову функции!")));
			}
		$tmp = "";
		$ll = explode("\n", $links_list);
		$ll = array_unique($ll);
		$error = "";
		foreach($ll as $link){
			$result = $link;
			ob_start();					//Перехват стандартного вывода в буфер
			eval($macro);
			$error = ob_get_contents();	//Получние данных из буфера
			ob_end_clean();
			if(!empty($result)) $tmp .= $result."\r\n";
		}
		if($error == ""){
			echo json_encode(array("success",$tmp));
		}else{
			echo json_encode(array("error",$error));
		}
		exit();
	}
	
	#Валидация Ajax запроса
	
	public function validate_ajax(){
		check_ajax_referer( 'aft_parser_key', 'security', true );
		if (!empty($_POST['nonce_cheker']) && !wp_verify_nonce($_POST['nonce_cheker'],'new_site_parser_action')) exit();
	}
}