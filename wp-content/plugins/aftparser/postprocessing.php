<?php
//
/**
 * 
 * Файл, обрабатывающий сайты, схраненные для отложенного парсинга.
 * Так-как стандартный Cron, встроенный во вротпресс - глучная паскуда, то я эмулирую его сам. Ненавижу!!! писать велосипеды еще со времен си++.
 * 
 */

# Защита от мудаков
if (!defined( 'ABSPATH' )){
	header('HTTP/1.0 403 Forbidden');
	exit('Вызов файлов плагина напрямую запрещен.');
}

class FPostProcessing{
	
	/**
	 * Конструктор
	 */
	function __construct(){

		$cron_secret = get_option("ap_cron_secret");
		if($cron_secret == false){
			// Если секретное слово для запуска CRON не задано - задаем его
			$cron_secret = h_rand_str(7);
			update_option("ap_cron_secret", $cron_secret);
		}

		add_action( 'wp_enqueue_scripts', array($this, 'add_postproc_scripts'));
		add_action( 'admin_enqueue_scripts', array($this, 'add_postproc_scripts'));
		add_action( 'wp_head', array($this, 'add_ajaxurl_cdata_to_front'), 1);

		add_action( 'wp_ajax_aft_docron', array($this, 'aft_docron'),1);
		add_action( 'wp_ajax_nopriv_aft_docron', array($this, 'aft_docron'));

		// парсинг встроенным кроном
		if(isset($_GET['aftcron']) && $_GET['aftcron'] == $cron_secret){
			header('Content-Type: text/html; charset=utf-8');
			try{
				$this->process_parsers();
			}catch(Exception $e){}
			die("<br>Обработка завершена");
		}
	}

	# На все страницы сайта добавляем js переменную ajaxurl
	function add_ajaxurl_cdata_to_front(){
		echo '<script type="text/javascript"> //<![CDATA[
				ajaxurl = "'.admin_url('admin-ajax.php').'";
			//]]></script>';
	}

	# Добавляем скрипт, вызывающий Ajax обработчик крона
	function add_postproc_scripts(){
		wp_enqueue_script('aftparser-postprocessingW', AFTPARSER__PLUGIN_URL . 'js/postprocessing.js', array( 'jquery' ), time(), false);
	}

	function aft_docron(){
		$time_interval = get_option("aft_time_interval");
		$l_time = get_option("aft_cron_ltime"); // последнее время срабатывания
		if(!$l_time){
			$l_time = time();
			update_option("aft_cron_ltime", $l_time);
		}
		header('Content-Type: text/plain; charset=utf-8');

		if($time_interval != false && $l_time + $time_interval < time() ){
			
			echo "Начнаем обработку CRON\r\n";
			try{
				$this->process_parsers();
			}catch(Exception $e){}
			update_option("aft_cron_ltime", $l_time);
		}else{
			echo "<br>Время еще не пришло\r\n";
		}
		die();
	}
	
	/**
	 * 
	 * Обработка парсера
	 * 
	 */
	function process_parsers() {
		global $wpdb;
		$table_name = $wpdb->prefix.'aft_parser';
		
		// выборка всех активных парсеров
		$data_arr = $wpdb->get_results("SELECT * FROM {$table_name} WHERE `state` = 'on'", ARRAY_A);	// ARRAY_A - ассоциативный массив
		
		foreach($data_arr as $parser){
			if(intval($parser['mode']) == 0){
				echo "<br>Запуск парсера ссылок";
				$this->process_links_parser($parser);
			}
			if(intval($parser['mode']) == 1){
				echo "<br>Запуск парсера rss";
				$this->process_rss_parser($parser);
			}
		}
	}
	
	/**
	 * 
	 * Обработка rss ленты
	 * 
	 */
	function process_rss_parser($parser){
		extract($parser);	// извлекаем все в переменные $title, $mode и так далее
		$rss_url 	= $links_list;	//"ссылка"
		$is_renew	= false;
		$pr 		= new Parser();
		$rss_xml 	= $pr->load($rss_url);
		$blog_enc 	= str_replace(" ","", mb_strtoupper(get_bloginfo('charset')));
		$src_enc 	= str_replace(" ","", mb_strtoupper($pr->auto_detect_encoding($rss_xml)));
		// У валидной rss ленты в тегах pubDate хранится время последнего обновления этой самой ленты.
		// Если таких тегов нет - парсер работать не будет
		preg_match("#<pubDate>(.*?)</pubDate>#i",$rss_xml,$pdate);	
		if($pdate == false || $pdate == $last_parsed) return;
		
		preg_match_all("#<item(?:[\s\S]*?|)>([\s\S]+?)<\/item>#i", $rss_xml, $matches);	// в rss потоке каждый материал находится между тегами <item></item>
		
		if(!$matches) return;
		
		$publ = new APublisher($publ_mode, $cat_id);	
		foreach(array_reverse($matches[1]) as $iteration => $item){
			$item = preg_replace('#<\!\[CDATA\[([\s\S]*?)\]\]>#i', '\\1', $item); // Убираем CDAT'у
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
							$attachments .= "<img src='{$file}' title='{$title}'>\n";
						}else{
					 		$attachments .= "<a href='".$file."' target='_blank'>Файл №".($key+1)."</a><br />\n";
						}
					}
				}
				$item = preg_replace( '#<enclosure([\s\S]+?|)</enclosure>#i', '', $item ); // Убираем старый текст с вложением
			}
			
			$res = "";	// Переменная результата выполнения макроса
			//Запускаем код макроса	
			eval(html_entity_decode(stripslashes_deep(trim($macro))));
					
			$state = $publ->publicate($res);	//Фишка в том, что публишер сам проверяет, существует ли в базе текущая запись. Если нет - то она будет добавлена.
			
		}
		unset($publ);
		unset($pr);
		
		$this->set_last_parsed($pdate[1],$id);
	}	
	
	
	/**
	 * 
	 * Обработка парсера ссылок
	 * 
	 */
	function process_links_parser($parser){
		extract($parser);	// извлекаем все в переменные $title, $mode и так далее
		$title 		= htmlspecialchars_decode($title);
		$num_links	= htmlspecialchars_decode($num_links);
		$publ_mode 	= htmlspecialchars_decode($publ_mode);
		$cat_id		= htmlspecialchars_decode($cat_id);
		$links_list	= htmlspecialchars_decode($links_list);
		$state		= htmlspecialchars_decode($state);

		$borders = unserialize ($borders);	// десериализация массива границ
		$ll = explode("\n",$links_list);
		$index = 0;
		if($last_parsed != NULL) $index = intval(array_search($last_parsed, $ll)) + 1; // ищем индекс элемента, который парсили в последний раз и увеличиваем его на единицу
		$url = NULL;

		// парсер
		$pr = new Parser();
		$pr->prepare_parser($borders,$macro);

		// публикатор

		$publ = new APublisher($publ_mode, $cat_id);
		for($i = 0; $i < intval($num_links); $i++){
			if(isset($ll[($index + $i)])){	// если индекс существует, находим элемент массива и парсим страницу.
				$url = $ll[($index + $i)];
				
				$rez = $pr->parse($url);
				$state = $publ->publicate($rez);
			}
		}
		$this->set_last_parsed($url,$id);
	}
	
	/**
	 * 
	 * Обновление поля `last_parsed` в таблице
	 * 
	 */
	function set_last_parsed($url, $id){
		global $wpdb;
		$table_name = $wpdb->prefix.'aft_parser';
		
		$wpdb->query($wpdb->prepare("UPDATE {$table_name} SET `last_parsed` = '%s' WHERE `id`=%d",
									array($url, $id)
									));
	}
}

new FPostProcessing();
// end of file //