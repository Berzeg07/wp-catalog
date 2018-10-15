<?php
//
/**
 * Парсер, он-же API макросов
 */
 
class Parser{

	public  $cookie;
	public $errors;
	public  $post;
	private $borders_list = array();	
	private $border_pos = 0;	// позиция от начала страницы до начала поиска границы.
	private $macro;
	private $current_url;		// урл сайта, который парсится в данный момент
	
	function __construct() { /** тут что-то когда-то было **/ }
	
	/**
	 * Парсер. Основной функционал
	 */
	
	# Подготовка парсера. Вообще это следовало делать через конструктор, но у нас тут функционал парсера ссылок еще заложен, так что конструктор должен быть без параметров.
	public function prepare_parser($borders, $custom_macro){
		$this->borders_list = $borders;
		// убираем дубли
		if( !empty($borders) ) foreach($borders as $key=>$b1){
			$i = 0;
			foreach($this->borders_list as $b2){
				if($b2['top_border'] == $b1['top_border'] && $b2['bottom_border'] == $b1['bottom_border']) $i++;
			}
			if($i >= 2){
				unset($this->borders_list[$key]);
			}
		}
		
		$this->macro = html_entity_decode(stripslashes($custom_macro));
	}
	
	# Парсит переданный урл
	public function parse($url){

		if(empty($this->borders_list) ||  empty($this->macro)) exit(1);
		$this->current_url = $url;
		$html = $this->load(trim($url));

		if(!$html) return false;
		return $this->process_macro($html);
	}

	# получение ссылок из ПС по запросу
	public function get_links($query, $count = 1){
		$links = array();
				
		if(!function_exists("str_get_html")) # подключаем simple_html_dom
			include_once( AFTPARSER__PLUGIN_DIR . 'class/simple_html_dom.php');

		# получаем список поисковых систем на текущий момент + кешируем его на 1 час
		$clist = get_transient( "clist" );
		if($clist == false){

			$clist =  $this->load("http://stats.searx.oe5tpo.com/"); // список счетчиков

			if( $clist == false || $clist == "") return "";
			else set_transient( "clist", $clist, 1 * HOUR_IN_SECONDS  );

		}

		$html = str_get_html($clist);
		$table = $html->find("table"); // парсим ссылки
		if($table != null && !empty($table)){

			$nodes = $table[0]->find('tr > td > a');
			if($nodes != null && !empty($nodes) && count($nodes) > 3){

				$nodes = array_slice($nodes, 0, 3); // вырезаем первые 3 элемента
				shuffle($nodes); // и перемешиваем случайным образом, тогда $nodes[0] будет выбран случайно

				if($nodes[0] != null){
					foreach ($nodes as $key => $node) {
						$link = $node->href;

						// получаем результаты поисковика
						$data =  $this->load($link."?q=".urlencode($query)."&category_general=1&format=json&pageno=1");

						if( $data != null && $data !="" ){

							$jsonp = json_decode($data, true);
							if(isset($jsonp["results"])) foreach($jsonp["results"] as $j => $item){
								if(count($links) > $count || in_array($item["url"], $links)) continue;
								$links[] = $item["url"]; // суем ссылки в общий массив
							}
							
						}
					}
				}
			}
		}

		return array_slice($links, 0, $count);
	}

	# Парсинг в простом режиме(простом, разумеется, для пользователя, а для меня - тот еще геморрой)
	public function parse_easy($macro, $url,$charset){
		$res = ""; // сюда помещаем результаты

		if(!class_exists("Readability")) # подключаем Readability
			include_once( AFTPARSER__PLUGIN_DIR . 'class/Readability.inc.php');

		$html = $this->load($url);
		$this->current_url = $url;

		if($charset == "auto")
			$charset = $this->auto_detect_encoding($html);

		$r = new Readability($html, $charset);

		try{
			$rd = $r->getContent();
			$res .= "[title]".$rd['title']."[/title]";
			$res .= (strpos("[text]", $macro) !== false) ? str_replace("[text]", $rd['content'], $macro) : $rd['content'];
			$res = strip_tags($res, "<p><i><b><a><strong><span><q><blockquote><u><i><ul><ol><li><artickle><section><br><h1><h2><h3><h4><h5><img><hr>");
			
		}catch (Exception $e){
			$this->errors .= "<p>Парсер не смог распознать контент на этой странице</p>";
			$res = "";
		}
		$res = $this->process_images($res);
		return $res;
	}

	# удаление всякой там адсенсе-хуенсе и прочего говна
	public function remove_script_tags($html){
		return preg_replace('~<script([\r\n\t\s\S]*?)>([\r\n\t\s\S]*?)</script>~is', '', $html);
	}

	# удаление комментариев из html
	public function remove_html_comments($html){
		return preg_replace('~<\!--[\r\n\t\s\S]*?-->~is', '', $html);
	}
	
	# Определяет кодировку страниц сайта, берет инфу из тега <meta>
	public function auto_detect_encoding($html){
		if(preg_match( '~(?:charset|encoding)(?:\s+|)=(?:\s+|)(?:[\'"]|)(.+?)[\'"]~i', $html, $matches )){
			return $matches[1];
		}else 
			return get_bloginfo('charset');
	}
	
	# Выполняет код макроса для переданного html
	private function process_macro($html){
		
		$blog_enc = str_replace(" ","", mb_strtoupper(get_bloginfo('charset')));
		$src_enc = str_replace(" ","", mb_strtoupper($this->auto_detect_encoding($html)));
		
		ob_start();
		//Запускаем код макроса	

		eval(html_entity_decode(stripslashes_deep($this->macro)));
		$this->errors = ob_get_contents();
		ob_end_clean();

		return $res;
	}
	
	# Выполняет поиск и загрузку всех картинок в переданном html
	public function process_images($fr_html){
		$fr_html = stripslashes($fr_html);
		$fr_html = preg_replace("~<a[\s\S]*?>(?:[^\S]*?|)(<img[\s\S]*?>)(?:[^\S]*?|)<\/a>~is", "\$1", $fr_html); // убираем ссылки у картинок

		preg_match_all("~<img(?:[\S\s]*?|)src(?:[^\S]*)=(?:[^\S]*)[\"']([\S\s]*?)[\"'](?:[\S\s]*?)(?:>|$)~uis", $fr_html, $matches);

		foreach ($matches[1] as $key=>$url) {
			$url = trim($url);
			$url = str_replace("&#9;", "", $url);
			$url = str_replace("&#10;", "", $url);
			$path_parts = pathinfo($url);

			// убераем из имени файла все GET параметры
			$path_parts['extension'] = preg_replace("~\?.*~is", "", $path_parts['extension']);
			$path_parts['basename'] = preg_replace("~\?.*~is", "", $path_parts['basename']);
			
			/** 
			 * Пропускаем мусорные пути, в ссылках типа: <img src="//bs.yandex.ru/informer/26888820/2_0_FFFFFFFF_EFEFEFFF_0_pageviews"/>
			 * Это путь к картинке яндекс метрики.
			 * Ее скачать не получится.
			 */
			if ( empty($path_parts['extension']) ||(
				!empty($path_parts['extension']) && 
				preg_match('/[\'\/~`\!@#\$%\^&\*\(\)_\-\+=\{\}\[\]\|;:"<>,\.\?]/', $path_parts['extension']) != 0
				)) continue;
			$furl = $url;
			if(substr( $url, 0, 2 ) == "//"){
				$scheme = parse_url($this->current_url, PHP_URL_SCHEME);
				$furl = $scheme.":".$url;
			}

			if($url[0] == "/"){
				$host = parse_url($this->current_url, PHP_URL_HOST);
				$scheme = parse_url($this->current_url, PHP_URL_SCHEME);
				$furl = $scheme."://".$host.$url;
			}
			if(strpos($furl, "http") === false) $furl = "http://".$furl;
			if(strpos($furl, "?") !== false){
				$furl = explode("?", $furl);
				$furl = $furl[0];
			}
			$filename = $path_parts['basename']; //старое имя файла
			
			//$filename = "img".$this->mt_rand_str(9)."n.".$path_parts['extension']; //с этим именем файл сохраняется у нас
			
			$media_folder = wp_upload_dir();
			$uploaded_file = parse_url($media_folder['url'].'/'.$filename, PHP_URL_PATH);
			
			$d = false;

			if(!file_exists($media_folder["path"]."/".$filename)){ // файл не скачан - скачиваем
				$upload_file = $this->download($furl, $filename);
				if($upload_file != false){
					$d = true;

					$wp_filetype = @wp_check_filetype($filename, null );
					$attachment = array(
						'post_mime_type' => $wp_filetype['type'],
						'post_parent' => 0,
						'post_title' => preg_replace('/\.[^.]+$/', '', $filename),
						'post_content' => '',
						'post_status' => 'inherit'
					);
					$attachment_id = @wp_insert_attachment( $attachment, $upload_file['file'], 0 );
					if (!is_wp_error($attachment_id)) {
						require_once(ABSPATH . "wp-admin" . '/includes/image.php');
						$attachment_data = @wp_generate_attachment_metadata( $attachment_id, $upload_file['file'] );
						@wp_update_attachment_metadata( $attachment_id,  $attachment_data );
					}

				}
			}else{
				$d = true; // файл уже скачан
			}
			// если файл загружен - добавляем его в медиа-библиотеку
			if($d !== false){

			}
			$fr_html = $d === false ? str_replace($matches[0][$key] , '' , $fr_html ) : str_replace($url , $uploaded_file , $fr_html );
		}
		$fr_html = preg_replace("~srcset(?:[^\S]*?)=(?:[^\S]*?|)[\"'][\r\n\t\s\S]*?[\"']~uis", "", $fr_html);
		$fr_html = preg_replace("~data-src-retina(?:[^\S]*?)=(?:[^\S]*?|)[\"'][\r\n\t\s\S]*?[\"']~uis", "", $fr_html);
		$fr_html = preg_replace("~data-src(?:[^\S]*?)=(?:[^\S]*?|)[\"'][\r\n\t\s\S]*?[\"']~uis", "", $fr_html);
		return $fr_html;
	}
	
	# Скачивает файл с указанного адреса
	public function upload_file($url){
		$path_parts = pathinfo(trim($url));
		
		$media_folder = wp_upload_dir();
		$n_name = "file".$this->mt_rand_str(9)."t.".$path_parts['extension']; // с этим именем файл сохраняется у нас
		
		if($this->download($url, $n_name)){
			$n_path = parse_url($media_folder['url'].'/'.$n_name, PHP_URL_PATH); // возвращаем url файла
			return $n_path;
		}else return false;
		
	}
	
	# Установка названия для материала
	public function set_title($title){
		if($title)
			return "\n[title]".$title."[/title]\n";
		else return "";
	}

	# Перевод с одного языка на другой
	public function get_translation($text, $fromlg, $tolg, $key = "trnsl.1.1.20130728T024200Z.5e3fdb8569741490.0ce056938cd0b8e0138941f04553c6bed2b7f85a"){
		$text = $this->load("https://translate.yandex.net/api/v1.5/tr/translate",'',"key=".$key."&text=".$text."&lang=".$fromlg."-".$tolg."&format=html");
		$text = preg_replace('~<\?xml version="1\.0" encoding="utf-8"\?>~',"",$text);
		$text = preg_replace('~<Translation code="200" lang=".+?"><text>~',"",$text);
		$text = str_replace('</text>',"",$text);
		$text = str_replace('</Translation>',"",$text);
		return htmlspecialchars_decode(trim($text));
	}
	
	# Установка ссылки для материала
	public function set_alias($alias){
		if($alias)
			return "\n[alias]".htmlentities($alias)."[/alias]\n";
		else return "";
	}
	
	# Добавление комментария к материалу
	public function add_comment($author = '',$email = '',$author_url = '',$text = ''){
		$rez  = "[comment]";
		$rez .= "[author]"	.$author.	 "[/author]";
		$rez .= "[email]"	.$email.	 "[/email]";
		$rez .= "[url]"		.$author_url."[/url]";
		$rez .= "[text]"	.$text.		 "[/text]";
		$rez .= "[/comment]";
		return $rez;
	}
	
	# Установка имени категории
	public function set_catname($catname){
		return "\n[cat]".$catname."[/cat]\n";
	}
	
	# Получаем границу по ее имени
	public function get_border($b_title, $html, $fix_pos = false){
		$rez = "";
		// Ищем порядковый номер границы в списке границ и заносим его в $index
		$index = -1;
		foreach($this->borders_list as $key=>$border){
			if($border['title'] == $b_title) {
				$index = $key;
				break;
			}
		}
		if($index == -1) return false;
		
		$top = $this->prepare_html($this->borders_list[$index]['top_border']);
		$bottom = $this->prepare_html($this->borders_list[$index]['bottom_border']);
		
		$html_t = preg_replace("/(<\/?\w+)(.*?>)/e", "strtolower('\\1') . '\\2'", $html);
		$html .= str_replace("'", "\"", $html_t);
		$f_index = strpos($html,$top,$this->border_pos);

		if($f_index === false) return false;
		$f_index = $f_index + mb_strlen($top);
		$b_index = strpos($html,$bottom,$f_index);
		if($b_index === false || $b_index <= $f_index) return false;
		$length = $b_index - $f_index;
		if($fix_pos)
			$this->border_pos = $f_index + $length;
		$rez = substr($html, $f_index, $length);
		if(trim($rez) == "") return false;
		return $rez;
	}
	
	# Возвращает массив фрагментов текста, если они повторяются несколько раз
	public function get_recurrence_border($b_title, $html){
		$rez = array();
		$data = "";
		while(($data = $this->get_border($b_title, $html, true)) != false){ // по уму надо было юзать do - while. ну да похуй...
			if($data != "")
				$rez[] = $data;
		};
		$this->border_pos = 0;
		return $rez;
	}
	
	/**
	 * Встроенный парсер ссылок
	 */
	
	# Парсит ссылки с указанной страницы
	
	public function parse_links($url){
		$this->current_url = $url;
		$html = $this->load($url, $this->cookie);
		if(!$html) return false;
		return $this->get_internal_links($html);
	}
	
	# Парсер карты сайта
	public function get_sitemap_links($url){
		$rez = "";
		$this->current_url = $url;
		$html = $this->load($url, $this->cookie);
		// Карты сайта бывают разные... синие белые красные....
		// Если карта сайта выполнена по стандартам, то собираем то-что между тегами <loc>
		preg_match_all("/<loc>(.+?)<\/loc>/i",$html,$matches);
		foreach($matches[1] as $key => $map_url){
			if(!empty($map_url) && strlen($map_url) > 1)
			$rez .= $map_url."\n";
		}
		
		// Если карта сайта представляет из себя обычный html файл, к  примеру как тут: http://seo-keys.ru/sitemap.xml
		// То грабим ссылки через get_internal_links
		$rez .= $this->get_internal_links($html);
		
		return $rez;
	}
	
	# Возвращает все внутренние ссылки на странице
	# вы знаете, я никогда бы не подумал, что знание жанров порно поможет мне выбирать имена для функций...
	public function get_internal_links($html){
		$result = "";
		preg_match_all("/<a(?:.*?)href(?:\s*)=(?:\s*)['\"](\S*?)['\"]/si",$html,$matches);
		// Добавляем в массив links все ссылки не имеющие аттрибут nofollow
		foreach($matches[1] as $key => $link){
			$url = $this->rel_to_abs($link, $this->current_url);
			$url_host = parse_url ($url,PHP_URL_HOST);
			if(in_array(pathinfo ($url,PATHINFO_EXTENSION),array("jpg","png","js","css","jpeg","xml","txt","inc","psd","djvu","doc","docx","xls","xlsx","gif","tiff","swf","mp3","mp4","mpeg"))) continue;	//Пропускаем файлы
			$a_host = parse_url ($this->current_url,PHP_URL_HOST);
			if($url_host == $a_host) {
				$url = preg_replace('/#{2,}/','#',$url); //Иногда знак хеша повторяется подряд слишком часто. Это не есть гуд.
				$url = preg_replace('/\?{2,}/','?',$url); //Повторяющийся знак вопроса убираем тоже. Да, я в курсе что можно сделать 1 реулярку.
				$url = preg_replace('/&{2,}/','&',$url);				
				if(!empty($url) && strlen($url) > 1)
					$result .= $url."\n";
			}
		}
		return $result;
	}
	
	/**
	 * 
	 * Функции загрузки и подготовки контента
	 * 
	 */
	
	# Предобработка html
	public function prepare_html($str){
		return html_entity_decode(stripslashes_deep($str));
	}
	
	# Генерация случайной строки для имени картинки
	# $l- длинна строки, к примеру 9 символов. $c - из каких символов бдет эта строка состоять
	public function mt_rand_str ($l, $c = 'abcdefghijklmnopqrstuvwxyz1234567890') {
		for ($s = '', $cl = strlen($c)-1, $i = 0; $i < $l; $s .= $c[mt_rand(0, $cl)], ++$i);
		return $s;
	}
	
	# Делает из относительного урла абсолютный.
	private function rel_to_abs($rel, $base){
		if(startsWith($rel,"//")) return "http://".$rel;
        if (parse_url($rel, PHP_URL_SCHEME) != '') return $rel; // Если урл уже является абсолютным на данный момент - возвращаем без изменений 
        if ($rel[0]=='#' || $rel[0]=='?') return $base.$rel;	//Если эта хуйня является хешем или get запросом
        $scheme = "http://";
		extract(parse_url($base));	//Эта хуйня извлекает данные из массива в локальные переменные: $scheme, $host, $path 
        $path = preg_replace('#/[^/]*$#', '', $path);
		
        if ($rel[0] == '/') $path = '';		// если путь - путь до главной страницы 
        $abs = $host.$path."/".$rel;		// формируем урл
        
        $re = array('#(/\.?/)#', '#/(?!\.\.)[^/]+/\.\./#');	// Замены всякой хуйни типа '//', '/./', '/foo/../' на '/'
        for($n = 1; $n > 0; $abs = preg_replace($re, '/', $abs, -1, $n)) {}
        return $scheme.'://'.$abs;
    }

    # Очистка тегов от мусора
    public function clear_tags_from_trash($res){
    	return preg_replace("~<(?!img|a|br|\/|\S{1,10}>|iframe|script|style|!--|ul|li|table|tr|td|ol|ld|dl|object|Object|audio|video)(\S{1,10})\s(.+?)>~isu", "<\$1>", $res); // я познал дзен регулярок =)
    }
	
	# Убираем ссылки
    public function remove_a_href($res){
    	return preg_replace("~<a.+?>(.+?)<\/a>~isu", "\$1", $res);
    }

	# Скачка чего угодно
	public function download($file_url, $s_fname) {
		$data = $this->load($file_url);
		
		if($data === false) return false;
		$upload_file = wp_upload_bits(trim($s_fname), null, $data);
		if(!$upload_file['error']){
			return $upload_file;
		}else{ return false; }
	}
	
	# Вырезает из $src участок начинающийся с $top и заканчивающийся $bottom
	public function cut_str($src, $top, $bottom){
		$f_index = strpos($src, $top);
		if($f_index === false) return false;
		$f_index = $f_index + mb_strlen($top);
		$b_index = strpos($src, $bottom, $f_index);
		if($b_index === false || $b_index <= $f_index) return false;
		$length = $b_index - $f_index;
		$rez = substr($src, $f_index, $length);
		return $rez;
	}

	# Проставляет отступы для первого предложения контента
	public function add_indent(){
		return '<style>p{text-indent: 1.5em;}</style>';
	}
	
	# Маскировка под браузер через утсновку юзер агента
	private function get_user_agent(){
		$a_list = array(
			"Mozilla/5.0 (Windows; U; Windows NT 5.1; en-US; rv:1.9.0.3) Gecko/2008092417 Firefox/3.0.3",
			"Mozilla/5.0 (Windows NT 6.2; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/30.0.1599.105 CoRom/30.0.1599.105 Safari/537.36",
			"Mozilla/5.0 (X11; Linux i686 on x86_64; rv:12.0) Gecko/20100101 Firefox/12.0",
			"Mozilla/5.0 (Windows; U; Windows NT 5.1; cs; rv:1.9.0.8) Gecko/2009032609 Firefox/3.0.8",
			"Mozilla/5.0 (Windows NT 6.1; WOW64; rv:33.0) Gecko/20100101 Firefox/33.0",
			"Mozilla/5.0 (compatible; MSIE 9.0; Windows NT 6.1; WOW64; Trident/5.0; SLCC2; Media Center PC 6.0; InfoPath.3; MS-RTC LM 8; Zune 4.7)",
			"Mozilla/4.0 (Windows; MSIE 6.0; Windows NT 5.1; SV1; .NET CLR 2.0.50727)",
			"Mozilla/5.0 (X11; U; Linux i686; en-US; rv:1.8.1.6) Gecko/20071115 Firefox/2.0.0.6 LBrowser/2.0.0.6",
			"Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/33.0.1750.154 Safari/537.36 OPR/20.0.1387.91",
			"Opera/9.80 (Linux armv6l ; U; CE-HTML/1.0 NETTV/3.0.1;; en) Presto/2.6.33 Version/10.60",
			"Mozilla/5.0 (Windows NT 5.1) AppleWebKit/536.5 (KHTML, like Gecko) YaBrowser/1.0.1084.5402 Chrome/19.0.1084.5402 Safari/536.5",
			"Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/30.0.1599.12785 YaBrowser/13.12.1599.12785 Safari/537.36",
			"Mozilla/5.0 (Windows; U; Windows NT 5.2; en-US) AppleWebKit/534.4 (KHTML, like Gecko) Chrome/6.0.481.0 Safari/534.4",
			"Mozilla/5.0 (Windows NT 6.3; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/30.0.1599.101 Safari/537.36",
			"Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.1 (KHTML, like Gecko) Chrome/22.0.1207.1 Safari/537.1",
			"Mozilla/5.0 (X11; U; Linux x86_64; en-US) AppleWebKit/534.10 (KHTML, like Gecko) Ubuntu/10.10 Chromium/8.0.552.237 Chrome/8.0.552.237 Safari/534.10",
			"Mozilla/5.0 (X11; Linux i686) AppleWebKit/535.1 (KHTML, like Gecko) Ubuntu/10.04 Chromium/14.0.813.0 Chrome/14.0.813.0 Safari/535.1",
		);
		
		$key = array_rand($a_list);
		
		return $a_list[$key];
	}
	
	# Маскируемся под пользователя, подменяя реферер
	private function get_referer(){
		$a_list = array(
			"http://www.google.com/",
			"http://pastebin.com",
			"http://www.yandex.ru/",
			"http://www.yahoo.com/",
			"http://www.youtube.ru/",
			"http://www.carderlife.ms/",
			"http://www.hacker-pro.net/",
			"http://www.host-tracker.com/",
			"http://www.forum.antichat.ru/",
			"http://www.lenta.ru/",
			"http://www.wikpedia.org/",
			"http://www.mail.ru/",
			"http://www.vkontakte.ru/",
			"http://www.upyachka.ru/",
			"http://www.2ip.ru/",
			"http://www.webmoney.ru/",
			"http://www.live.com/",
			"http://www.libertyreserve.com/",
			"http://www.ebay.com/",
			"http://www.microsoft.com/",
			"http://www.ninemsn.com/",
			"http://oce.leagueoflegends.com/",
			"http://aftamat4ik.ru/",
			"http://vk.com/",
			"http://facebook.com/",
			"http://twitter.com/",
			"https://www.dropbox.com/"
		);
		
		$key = array_rand($a_list);
		
		return $a_list[$key];
	}
	
	# Загрузка страницы по адресу $url, с куками(пока не используем этот функционал, ибо я про него вообще забыл) и с отправкой $post данных(это мы тоже не используем пока)
	public function load($url, $cookie = "", $post = ""){
		$url = (strpos($url, "feeds.feedburner.com") !== false) ? $url."?format=xml" : $url;
		$rez = "";
		$cookie = empty($this->cookie) ? $this->cookie : $cookie;
		if(function_exists('curl_version')){	// Сначала пытаемся получить страницу через Curl, если он установлен, конечно-же
			
			$ch = curl_init($url);
			curl_setopt($ch, CURLOPT_RETURNTRANSFER, 1);
			curl_setopt($ch, CURLOPT_USERAGENT, $this->get_user_agent());
			curl_setopt($ch, CURLOPT_REFERER, $this->get_referer());
			curl_setopt($ch, CURLOPT_SSL_VERIFYHOST, 0);
			curl_setopt($ch, CURLOPT_SSL_VERIFYPEER, 0);
			if(!empty($cookie)){
				curl_setopt($ch, CURLOPT_COOKIE, $cookie);
			}
			if(!empty($post)){
				curl_setopt($ch, CURLOPT_POST, 1);
				curl_setopt($ch, CURLOPT_POSTFIELDS, $post);
			}
			$rez = curl_exec($ch);
			curl_close($ch);
		}
		if(empty($rez) && function_exists('file_get_contents')){	// Нет курла - не проблема.
			$method = "GET";
			$data = null;
			if(!empty($post)){
				$method = "POST";
				$data = array('content' => $post);
			}
			$opts = array(
				'http'=>array(
				'method'=>$method,
				'header'=>"Accept-language: en\r\n" .
						"Cookie: ".$cookie."\r\n",
						"User-Agent: ".$this->get_user_agent()."\r\n",
						"Referer: ".$this->get_referer()."\r\n",
						$data
				),
			);
			$context = stream_context_create($opts);
			$rez = @file_get_contents($url, false, $context);
		}
		$is_gzip = 0 === mb_strpos($rez, "\x1f" . "\x8b" . "\x08", 0, "ASCII");
		if($is_gzip) $rez = m_gzdecode($rez);
		
		if($rez && strlen($rez)>3)
			return $rez;
		else return false;
	}
	
}
// end of file //