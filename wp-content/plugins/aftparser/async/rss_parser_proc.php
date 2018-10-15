<?php
//
/**
 * 
 * Ajax Обработчики.
 * 
 */

# Защита от мудаков
if (!defined( 'ABSPATH' )){
	header('HTTP/1.0 403 Forbidden');
	exit('Вызов файлов плагина напрямую запрещен.');
}

class RssParserProc extends pAjax{

	/**
	 * Конструктор
	 */
	function __construct() {
		add_action( 'wp_ajax_test_parse_rss', array($this, 'test_parse_rss') );
		add_action( 'wp_ajax_parse_all_rss', array($this, 'parse_all_rss') );
		add_action( 'wp_ajax_save_rss', array($this, 'save_rss') );
		parent::__construct();
	}
	
	/**
	 * Обработчики парсера rss потока
	 */
	 
	# Ajax обработчик тестирования парсера
	function test_parse_rss(){
		$this->validate_ajax();
		parse_str($_POST['fields'], $a); // Извлекаем переменные формы

		$count = 1;
		if(isset($a['tcount'])){
			$count = intval($a['tcount']);
		}

		$url		= urldecode($a['url']);
		$cat_id 	= intval($a['cat_id']);
		$publ_mode 	= htmlspecialchars_decode($a['status']);
		$macro 		= $a['macro'];

		if(!$this->validate_data($url, array("0"), $cat_id, $macro, $publ_mode)) 
			exit(json_encode(array("error","Какой-то из параметров пуст или имеет не верное значение. 
				Заполните все поля формы, прежде чем тыкать кнопочки.")));
		
		$pr 		= new Parser();
		$rss_xml 	= $pr->load($url);
		$blog_enc 	= str_replace(" ","", mb_strtoupper(get_bloginfo('charset')));
		$src_enc 	= str_replace(" ","", mb_strtoupper($pr->auto_detect_encoding($rss_xml)));

		$pr = new Parser();
		$rss_xml = $pr->load($url);
		/**
		 * По идее rss лента - xml файл. А значит надо ее обрабатывать через http://php.net/xml_parse и прочий бред.
		 * Но такой подход не поравдан и не универсален. Попадается всякое и такое <title текст блять, который тут не должен быть это не html же></title> и многое другое, через что встроенный в php xml парсер - не проходит.
		 * Поэтому я решил использовать универсаьные регулярные выражения, которые, к тому-же, в случае возникновения косяка проще править, в отличие от встроенных в язык средств обработки.
		 */
		
		$blog_enc = str_replace(" ","", mb_strtoupper(get_bloginfo('charset')));
		$src_enc = str_replace(" ","", mb_strtoupper($pr->auto_detect_encoding($rss_xml)));
		
		preg_match_all("#<item(?:[\s\S]*?|)>([\s\S]+?)<\/item>#i", $rss_xml, $matches);	// в rss потоке каждый материал находится между тегами <item></item>
		
		if(!$matches) die("[info]rss поток не валиден[/info]");
		$output = "";

		$errors = "";
		foreach(array_reverse($matches[1]) as $iteration => $item){
			if($iteration >= $count) break;
			$item = preg_replace('#<\!\[CDATA\[(.*?)\]\]>#is', '\\1', $item); // Убираем CDATA

			if(!$item) continue;
			$title = "Untitled";
			$content = "";
			$attachments = "<br /><b>Дополнительно:</b><br />\n";	// Если к ленте прикреплены файлы
			
			preg_match("#<title(?:[\s\S]*?|)>([\s\S]+?)<\/title>#i", $item, $m_title); // Название
			if($m_title[1]) $title = trim($m_title[1]);
			
			
			$ce = preg_match("#<content:encoded>(.+?)<\/content:encoded>#uis", $item, $mce_content); 

			if(!empty($mce_content)) $content = trim($mce_content[1]);

			$dc = preg_match("#<description(?:[\s\S]*?|)>([\s\S]+?)<\/description>#i", $item, $m_content); // Содержимое
			if(!empty($m_content) && $content != "") $content .= trim($m_content[1]);

			preg_match_all("#<enclosure(?:[\s\S]+?|)url(?:[\s]|)=(?:[\s]|)['\"](.+?)['\"]#i", $item, $m_att);	// Работа с вложениями
			if($m_att){
				foreach($m_att[1] as $key => $a_url){
					$file = $pr->upload_file($a_url);	// Скачиваем вложение и получаем путь до него
					if($file != false){
						$ext = pathinfo($file, PATHINFO_EXTENSION);
						if(in_array($ext, array("jpg","png","gif","jpeg","csv"))){
							$attachments .= "<img src='{$file}' title='{$title}'>";
						}else{
					 		$attachments .= "<a href='".$file."' target='_blank'>Файл №".($key+1)."</a><br />\n";
						}
					}
				}
				$item = preg_replace( '#<enclosure([\s\S]+?|)</enclosure>#i', '', $item ); // Убираем старый текст с вложением
			}
			// На данный момент этого достаточно, автора и прочую хуету я пока парсить не буду. Их можно или генерировать или просто приписать самостоятельно, через макросы.
			
			$res = "";
			ob_start();
			//Запускаем код макроса	
			eval(html_entity_decode(stripslashes_deep($macro)));
			$errors .= ob_get_contents();
   			ob_end_clean();
			
			$output .= "\n[------------- проход_".$iteration."--------------]\n".$res."\n[------------- /проход_".$iteration."--------------]\n";
		}
		echo ($errors != "") ? json_encode(array("error", $errors)) : json_encode(array("success", $output));
		unset($pr);
		die();
	}
	
	# Ajax обработчик разового парсинга ленты
	function parse_all_rss(){
		$this->validate_ajax();
		set_time_limit(0);
		ini_set('max_execution_time', 0); //0=NOLIMIT

		parse_str($_POST['fields'], $a); // Извлекаем переменные формы

		$url		= htmlspecialchars($a['url']);
		$cat_id 	= intval($a['cat_id']);
		$publ_mode 	= htmlspecialchars($a['status']);
		$macro 		= $a['macro'];

		if(!$this->validate_data($url, array("0"), $cat_id, $macro, $publ_mode)) 
			exit(json_encode(array("error","Какой-то из параметров пуст или имеет не верное значение. 
				Заполните все поля формы, прежде чем тыкать кнопочки.")));
		$pr 		= new Parser();
		$rss_xml 	= $pr->load($url);
		$blog_enc 	= str_replace(" ","", mb_strtoupper(get_bloginfo('charset')));
		$src_enc 	= str_replace(" ","", mb_strtoupper($pr->auto_detect_encoding($rss_xml)));
		
		preg_match_all("#<item(?:[\s\S]*?|)>([\s\S]+?)<\/item>#i", $rss_xml, $matches);	// в rss потоке каждый материал находится между тегами <item></item>
		
		if(!$matches) exit(json_encode(array("error","RSS поток не валиден.")));

		$output = "<br /><table id = 'info_table'>";
		$output .= "<tr><th style='width:350px;'>Номер</th><th style='padding-left: 10px; padding-right: 10px;'>Результат обработки</th></tr>";
		foreach(array_reverse($matches[1]) as $iteration => $item){
			$item = preg_replace('#<\!\[CDATA\[([\s\S]*?)\]\]>#i', '\\1', $item); // Убираем CDATA
			if(!$item) continue;
			$title = "Untitled";
			$content = "";
			$attachments = "";	// Если к ленте прикреплены файлы
			
			preg_match("#<title(?:[\s\S]*?|)>([\s\S]+?)<\/title>#i", $item, $m_title); // Название
			if($m_title[1]) $title = trim($m_title[1]);
			
			$dc = preg_match("#<description(?:[\s\S]*?|)>([\s\S]+?)<\/description>#i", $item, $m_content); // Содержимое
			if($dc == 1) $content = trim($m_content[1]);
			$ce = preg_match("#<content:encoded>([\s\S]+?)<\/content:encoded>#i", $item, $mce_content); 
			if($ce == 1) $content = trim($mce_content[1]);
			
			preg_match_all("#<enclosure(?:[\s\S]+?|)url(?:[\s]|)=(?:[\s]|)['\"](.+?)['\"]#i", $item, $m_att);	// Работа с вложениями
			if($m_att){
				$attachments .= "<br /><b>Дополнительно:</b><br />\n";
				foreach($m_att[1] as $key => $a_url){
					$file = $pr->upload_file($a_url);	// Скачиваем вложение и получаем путь до него
					if($file != false){
						$ext = pathinfo($file, PATHINFO_EXTENSION);
						if(in_array($ext, array("jpg","png","gif","jpeg","csv"))){
							$attachments .= "<img src='{$file}' title='{$title}'>";
						}else{
					 		$attachments .= "<a href='".$file."' target='_blank'>Файл №".($key+1)."</a><br />\n";
						}
					}
				}
				$item = preg_replace( '#<enclosure([\s\S]+?|)</enclosure>#i', '', $item ); // Убираем старый текст с вложением
			}
			// На данный момент этого достаточно, автора и прочую хуету я пока парсить не буду. Их можно или генерировать или просто приписать самостоятельно, через макросы.
			
			$res = "";
			$errors = "";
			ob_start();
			//Запускаем код макроса	
			eval(html_entity_decode(stripslashes_deep($macro)));
			$errors = ob_get_contents();
   			ob_end_clean();
			
			$publ = new APublisher($publ_mode, $cat_id);			
			$state = $publ->publicate($res);
			unset($publ);
			$output .= "<tr>";
			$output .= "<td style='min-width:350px; max-width:350px; text-align: left; padding-left: 20px; overflow: hidden;'>Обработка элемента №".($iteration+1)."</td>";
			if($state == true) $output .= "<td style='background: goldenrod; color: white; padding-left: 5px; padding-right: 5px;'>успешно завершена</td>";
			else $output .= "<td style='background: red; color: white; padding-left: 5px; padding-right: 5px;'>не выполнена</td>";
			$output .= "</tr>";
		}
		$output .= "</table>";
		unset($publ);
		unset($pr);
		echo json_encode(array("success", $errors.$output));
		die();
	}
	
	# Сохранение парсера
	function save_rss(){
		$this->validate_ajax();
		parse_str($_POST['fields'], $a); // Извлекаем переменные формы

		$title		= htmlspecialchars($a['title']);
		$url		= htmlspecialchars($a['url']);
		$cat_id 	= htmlspecialchars($a['cat_id']);
		$publ_mode 	= htmlspecialchars($a['status']);
		$macro 		= htmlspecialchars($a['macro']);
		$num_links 	= htmlspecialchars($a['nl']);
		if(!$this->validate_data($url, array("0"), $cat_id, $macro, $publ_mode)) 
			exit(json_encode(array("error","Какой-то из параметров пуст или имеет не верное значение. 
				Заполните все поля формы, прежде чем тыкать кнопочки.")));
		
		global $wpdb;

		$id = NULL;

		$table_name = $wpdb->prefix . 'aft_parser';
		
		if(isset($a['pid'])){
			$id = intval($a['pid']);

			$res = $wpdb->update( 
				$table_name, 
				array( 
					'id'			=> $id, 
					'title'			=> $title,
					'links_list'	=> $url,
					'num_links' 	=> $num_links, 
					'borders'		=> serialize(array("0")), 
					'macro'	    	=> $macro, 
					'publ_mode'		=> $publ_mode,
					'cat_id'		=> $cat_id,
					'state'			=> 'on', 
					'last_parsed'	=> '0', 
					'mode'			=> '1',
				),
				array("id" => $id)
			);

			if($res != false){
				echo json_encode(array("success",'Изменения сохранены!', $id));
			}else{
				echo json_encode(array("error",'Ошибка сохранения!', $id));
			}
		}else{
			$res = $wpdb->insert( 
				$table_name, 
				array( 
					'title'			=> $title,
					'links_list'	=> $url,
					'num_links' 	=> $num_links, 
					'borders'		=> serialize (array("0")), 
					'macro'	    	=> $macro, 
					'publ_mode'		=> $publ_mode,
					'cat_id'		=> $cat_id,
					'state'			=> 'on', 
					'last_parsed'	=> '0', 
					'mode'			=> '1',
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

new RssParserProc();
// end of file //