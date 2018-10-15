<?php
//
/**
 * 
 * Ajax обработчики для парсера сайтов
 * 
 * 
 */

# Защита от мудаков
if (!defined( 'ABSPATH' )){
	header('HTTP/1.0 403 Forbidden');
	exit('Вызов файлов плагина напрямую запрещен.');
}

class SiteParserProc extends pAjax{

	/**
	 * Конструктор
	 */
	function __construct() {
		// хуки парсера ссылок
		add_action( 'wp_ajax_test_parse',  	array($this, 'test_parse') );
		add_action( 'wp_ajax_parse_single',  	array($this, 'parse_single') );
		
		// хук сохранения парсера для отложенной обработки
		add_action( 'wp_ajax_save_parser',    array($this, 'save_parser') );
		parent::__construct();
	}
	
	/**
	 * Обработчики парсера ссылок
	 */
	 
	function parse_single(){
		$this->validate_ajax();
		set_time_limit(0);
		parse_str($_POST['fields'], $a); // Извлекаем переменные формы
		$url		= htmlspecialchars($_POST['url']);
		$cat_id 	= intval($a['cat_id']);
		$publ_mode 	= isset($a['publication_mode']) && !empty($a['publication_mode']) ? htmlspecialchars($a['publication_mode']) : htmlspecialchars($a['status']);
		$macro 		= $a['macro'];
		$mode 		= $a['tp_mode'];
		$links_list	= htmlspecialchars_decode($a['links_list']);

		$borders 	= $_POST['borders'];
		
		$pr = new Parser();
		$res = "";
		if($mode == "custom"){ // режим парсинга с границами
			if(!$this->validate_data($url,$borders, $cat_id, $macro, $publ_mode))
				exit(json_encode(array("error","Какой-то из параметров пуст или имеет не верное значение. 
												Заполните все поля формы, прежде чем тыкать кнопочки.")));

			$pr->prepare_parser($borders,$macro);
			$res = $pr->parse($url);
		}
		if($mode == "easy"){ // "простой" парсинг

			$links = array();
			if($a["pmode"] == "links") 
				$links = $url;
			
			if($a["pmode"] == "requests")
				$links = $pr->get_links($url, intval($a["material-count"])); // получаем ссылки по запросу
			
			if(!empty($links)) foreach ($links as $key => $q) {
				$res = $pr->parse_easy($macro, $q, $a["charset-mode"]);
			}

		}
		$publ = new APublisher($publ_mode, $cat_id);
		$state = $publ->publicate($res);

		if($state == true){
			echo json_encode(array("success","Метариал успешно добавлен"));
		}else{
			echo json_encode(array("warning","Ошибка добавления материала"));	
		}
		die();
	}
	
	# Ajax обработчик пробного парсинга
	function test_parse(){
		$this->validate_ajax();
		parse_str($_POST['fields'], $a); // Извлекаем переменные формы

		$count = 1;
		if(isset($a['tcount'])){
			$count = intval($a['tcount']);
			if($count > 0) $count -= 1;
			else $count = 1;
		}
		
		$links_list	= htmlspecialchars_decode($a['links_list']);
		$cat_id 	= $a['cat_id'];
		$publ_mode 	= $a['status'];
		$macro 		= $a['macro'];
		$mode 		= $_POST['tp_mode'];
		foreach($_POST['borders'] as $key => $border){

			$_POST['borders'][$key]['top_border'] = stripslashes($border['top_border']);
			$_POST['borders'][$key]['bottom_border'] = stripslashes($border['bottom_border']);

		}
		$borders 	= $_POST['borders'];
		$ll = array_filter( explode("\n", $links_list), 'strlen' );
		shuffle($ll);

		$output = "";

		$pr = new Parser();
		if($mode == "custom"){ // режим парсинга с границами
			if(!$this->validate_data($links_list,$borders, $cat_id, $macro, $publ_mode))
				exit(json_encode(array("error","Какой-то из параметров пуст или имеет не верное значение. 
												Заполните все поля формы, прежде чем тыкать кнопочки.")));

			$pr->prepare_parser($borders,$macro);
			foreach($ll as $key=>$url){
				if($key > $count) continue;
				$text = $pr->parse(trim($url));
				$output .= "\n[------------- проход_".$key."--------------]\n".$text."\n[------------- /проход_".$key."--------------]\n";
			}
		}
		if($mode == "easy"){ // "простой" парсинг

			foreach($ll as $index=>$query){
				$links = array();
				if($index > $count) continue;

				if($a["pmode"] == "links") 
					$links = $ll;
				
				if($a["pmode"] == "requests")
					$links = $pr->get_links($query, intval($a["material-count"])); // получаем ссылки по запросу
				
				foreach ($links as $key => $q) {
					$text = $pr->parse_easy($macro, $q, $a["charset-mode"]);
					$output .= "\n[------------- проход_".$key."--------------]\n".$text."\n[------------- /проход_".$key."--------------]\n";
				}
			}
		}
		// выводим
		exit(($pr->errors != "") ? json_encode(array("error", $pr->errors)) : json_encode(array("success", $output)));
	}
	
	# Ajax обработчик, сохраняющий сайт для отложенного парсинга
	function save_parser(){
		$this->validate_ajax();
		parse_str($_POST['fields'], $a); // Извлекаем переменные формы

		$links_list	= htmlspecialchars($a['links_list']);
		$cat_id 	= htmlspecialchars($a['cat_id']);
		$publ_mode 	= htmlspecialchars($a['status']);
		$macro 		= htmlspecialchars(stripslashes_deep($a['macro']));
		$num_links 	= htmlspecialchars($a['nl']);
		$title 		= htmlspecialchars($a['title']);
		
		foreach($_POST['borders'] as $key => $border){

			$_POST['borders'][$key]['top_border'] = stripslashes($border['top_border']);
			$_POST['borders'][$key]['bottom_border'] = stripslashes($border['bottom_border']);

		}

		$borders = serialize($_POST['borders']);

		if(!$this->validate_data($links_list, array("0"), $cat_id, $macro, $publ_mode)) 
			exit(json_encode(array("error","Какой-то из параметров пуст или имеет не верное значение. 
				Заполните все поля формы, прежде чем тыкать кнопочки.")));
		global $wpdb;

		$id = NULL;

		$table_name = $wpdb->prefix . 'aft_parser';
		
		if(isset($a['pid'])){
			$id = $a['pid'];
			$res = $wpdb->update( 
				$table_name, 
				array( 
					'id'			=> $id, 
					'title'			=> $title,
					'links_list'	=> $links_list,
					'num_links' 	=> $num_links, 
					'borders'		=> $borders, 
					'macro'	    	=> $macro, 
					'publ_mode'		=> $publ_mode,
					'cat_id'		=> $cat_id,
					'state'			=> 'on', 
					'last_parsed'	=> '0', 
					'mode'			=> '0',
				),
				array("id" => $id)
			);
			echo json_encode(array("success",'Изменения сохранены!', $id));
			
		}else{
			$res = $wpdb->insert( 
				$table_name, 
				array( 
					'id'			=> NULL, 
					'title'			=> $title,
					'links_list'	=> $links_list,
					'num_links' 	=> $num_links, 
					'borders'		=> $borders, 
					'macro'	    	=> $macro, 
					'publ_mode'		=> $publ_mode,
					'cat_id'		=> $cat_id,
					'state'			=> 'on', 
					'last_parsed'	=> '0', 
					'mode'			=> '0',
				)
			);
			if($res != false){
				echo json_encode(array("success",'Изменения сохранены!', $wpdb->insert_id));
			}else{
				echo json_encode(array("error",'Ошибка сохранения!'));
			}
		}
								
		die();
	}
	
}

new SiteParserProc();
// end of file //