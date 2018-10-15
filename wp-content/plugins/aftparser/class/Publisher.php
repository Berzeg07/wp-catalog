<?php
//
/**
 * 
 * Публикатор.
 * 
 */
 
class APublisher{
	private $cat_id 	= 0;
	private $publ_mode 	= "pending";
	
	# Конструктор. $data - данные, получаемые на выходе из парсера, $cat - идентификатор категории
	function __construct($mode, $cat) {
		$this->cat_id = $cat;
		$this->publ_mode = $mode;
	}
	
	# Извлекает из $data название поста, название категории и комментарии
	public function publicate($data){
		if(empty($data)) return false;
		$a_id = $this->process_article($data);
		if($a_id) 
			$this->process_comments($data, $a_id);
		else
			return false;
		return true;
	}
	
	
	function process_article($data){
		require_once(ABSPATH. 'wp-config.php'); 
		require_once(ABSPATH. 'wp-includes/wp-db.php'); 
		require_once(ABSPATH. 'wp-admin/includes/taxonomy.php');

		$title = "Untitled";
		$text = "Not Set Already";
		$alias = "";
		
		$t = preg_match("#\[title\]([\s\S]+?)\[/title\]#i", $data, $m_title);// определяем название
		if($t == 1 && isset($m_title[1])) $title = trim($m_title[1]);
		
		$a = preg_match("#\[alias\]([\s\S]+?)\[/alias\]#i", $data, $m_alias);// определяем ссылку, по которой будет находиться материал
		if($a == 1 && isset($m_alias[1])) $alias = trim($m_alias[1]);
		
		$c = preg_match("#\[cat\]([\s\S]+?)\[/cat\]#i", $data, $m_cat);		// определяем категорию
		if($c == 1 && isset($m_cat[1])){ 
			$cat = trim($m_cat[1]);
			$this->cat_id = wp_create_category($cat);					// функция сама проверяет, существует такая категория или нет и возвращает ее ид, что сильно экономит мне код
		}
		
		$txt = preg_replace('#\[(\w+)\]([\s\S]+?)\[\/\1\]#','',$data);  // убираем всякие [info][title][comment] и прочие пометки
		if($txt === false) return false;								// текст не определен
		else $text = $txt;
		$res = intval($this->add_node($title, $alias, $text));
		if($res != 0) return $res;
		else return false;
	}

	# Проверяет, существует ли этот пост в базе, если существует - возвращет его ид.
	function post_exists_by_content($content){
		global $wpdb;
 
		$post_content = wp_unslash( sanitize_post_field( 'post_content', $content, 0, 'db' ) );

		$query = "SELECT ID FROM $wpdb->posts WHERE 1=1";

		if ( !empty ( $content ) ) {
		    $query .= ' AND post_content = %s';
		    $args[] = $post_content;
		}

		if ( !empty ( $args ) )
		    return (int) $wpdb->get_var( $wpdb->prepare($query, $args) );
		 return 0;
	}
	
	# Обработка комментериев
	function process_comments($data, $node_id){
		preg_match_all("#\[comment\]([\s\S]+?)\[/comment\]#i", $data, $m_comment);
		if($m_comment)
			foreach($m_comment[1] as $ct){
				$author = 'anonimous';
				$email 	= 'not@mail.ru';
				$url 	= 'http://';
				$text 	= 'Текст комментария';
				
				$tmp = $this->match_tag($ct,'author');
				if($tmp) $author = $tmp;
				
				$tmp = $this->match_tag($ct,'email');
				if($tmp) $email = $tmp;
				
				$tmp = $this->match_tag($ct,'url');
				if($tmp) $url = $tmp;
				
				$tmp = $this->match_tag($ct,'text');
				if($tmp) $text = $tmp;
				
				// публикация комментария
				$this->add_comment($author, $email, $url, $text, $node_id);
			}
	}
	
	/**
	 *
	 * Вспомогательные функции
	 * 
	 */
	
	# Получаем из $data данные содержащиеся между [$tagname] и [/$tagname]
	function match_tag($data, $tagname){
		preg_match("#\[{$tagname}\]([\s\S]+?)\[/{$tagname}\]#i", $data, $mth);
		if($mth && strlen($mth[1]) > 1) return $mth[1];
		else return false;
	}
	
	# Добавляет пост
	public function add_node($title, $alias ,$text){
		if(empty($title) || empty($text) ) return false;
		include_once( ABSPATH . '/wp-load.php');
		if(!isset( $GLOBALS['wp_rewrite'] )) $GLOBALS['wp_rewrite'] = new WP_Rewrite();
		if(empty($title) || empty($text) || trim($text) == "") return false;
		if ( ! function_exists( 'post_exists' ) ) {
		    include_once( ABSPATH . 'wp-admin/includes/post.php' );
		}
		if ( ! function_exists( 'get_current_user_id' ) ) {
		    include_once( ABSPATH . '/wp-includes/user.php'); 
		}
		$tmp1 = post_exists($title);
		$tmp2 = $this->post_exists_by_content($text);
		if($tmp1 > 0) return $tmp1;
		if($tmp2 > 0) return $tmp2;

		$a_post = array(
			'post_title' 	=> $title,
			'post_name'		=> $alias,
			'post_type'  	=> 'post',
			'ping_status' 	=> get_option('default_ping_status'), 
			'post_content' 	=> $text,
			'post_status' 	=> $this->publ_mode,
			'post_author' 	=> 1,
			'post_category' => array($this->cat_id),
		);
		$post_id = wp_insert_post($a_post, false);	// в случае ошибки вернет 0, при успехе - вернет ид созданного поста
		if($post_id != 0) add_post_meta($post_id, 'ap_mark', 'Это пост был добавлен через AftParser', true);

		/*preg_match_all("~src(?:[^\S]*)=(?:[^\S]*)[\"']([\S\s]*?)[\"']~uis", $text, $matches);
		
		if(isset($matches[1]) && !empty($matches[1])){
			$filename = "";
			$max_size = 50;
			foreach ($matches[1] as $key => $ff) {
				$size = getimagesize(ABSPATH.$ff);
				if($size && intval($size[0]) > intval($max_size)){
					$filename = $ff;
					$max_size = intval($size[0]);
				}
			}
			$matches[1] = array_reverse($matches[1]);
			
			$wp_filetype = @wp_check_filetype($matches[1][0], null );
			$attachment = array(
				'guid'           => $filename, 
			    'post_mime_type' => $wp_filetype['type'],
			    'post_title'     => preg_replace( '/\.[^.]+$/', '',  $filename ),
				'post_content'   => '',
				'post_status'    => 'inherit'
			);
			$attach_id = @wp_insert_attachment( $attachment, $filename, $post_id );
			include_once(ABSPATH . 'wp-admin/includes/image.php');
			$attach_data = @wp_generate_attachment_metadata( $attach_id, $filename );
			@wp_update_attachment_metadata( $attach_id, $attach_data );

			@set_post_thumbnail( $post_id, $attach_id );
		
		}*/

		global $wpdb;

	    // First check whether Post Thumbnail is already set for this post.
	    if (get_post_meta($post_id, '_thumbnail_id', true) || get_post_meta($post_id, 'skip_post_thumb', true)) {
	        return;
	    }

		$matches = array();

	    // Get all images from post's body
	    preg_match_all('/<\s*img [^\>]*src\s*=\s*[\""\']?([^\""\'>]*)/i', $text, $matches);

	    if (count($matches)) {

	        foreach ($matches[0] as $key => $image) {
	            /**
	             * If the image is from wordpress's own media gallery, then it appends the thumbmail id to a css class.
	             * Look for this id in the IMG tag.
	             */
	            preg_match('/wp-image-([\d]*)/i', $image, $thumb_id);
	            if($thumb_id){
	                $thumb_id = $thumb_id[1];
	            }

	            /*if (!$thumb_id) {
	                $image = substr($image, strpos($image, '"')+1);
	                $result = $wpdb->get_results("SELECT ID FROM {$wpdb->posts} WHERE guid = '".$image."'");
	                if($result){
	                    $thumb_id = $result[0]->ID;
	                }
	                
	            }*/

	            // Ok. Still no id found. Some other way used to insert the image in post. Now we must fetch the image from URL and do the needful.
	            if (!$thumb_id) {
	                $thumb_id = apt_generate_post_thumb($matches, $key, $text, $post_id);
	            }

	            // If we succeed in generating thumg, let's update post meta
	            if ($thumb_id) {
	                update_post_meta( $post_id, '_thumbnail_id', $thumb_id );
	                break;
	            }
	        }
	    }

		return $post_id;
	}
	
	# Проверяет, существует ли этот пост в базе, если существует - возвращет его ид.
	function post_exists($title){
		global $wpdb;
		$table_name = $wpdb->prefix.'posts';
		$tmp = $wpdb->get_row("SELECT `ID` FROM `{$table_name}` WHERE `post_title` = '{$title}' AND `post_type` = 'post';", 'ARRAY_N');
		if(empty($tmp)) 
			return false;
		else
			return $tmp;
	}
	
	# Добавляет комментарий
	public function add_comment($author, $email, $url, $text, $node_id){
		$time = current_time('mysql');
		if(function_exists('tidy_repair_string')){
			$text = tidy_repair_string($text, array('show-body-only' => true), "utf8");
		}

		$user_id = username_exists( $author );
		if ( !$user_id and email_exists($email) == false ) {
			$random_password = wp_generate_password(12, false);
			$user_id = wp_create_user( $author, $random_password, $email );
		} else {
			$random_password = __('User already exists.  Password inherited.');
		}

		// Convert to timetamps
		$min = strtotime("-7 days");
		$max = strtotime("today");

		// Generate random number using above bounds
		$rdate = rand($min, $max);

		$data = array(
			'comment_post_ID' => $node_id,
			'comment_author' => $author,
			'comment_author_email' => $email,
			'comment_author_url' => $url,
			'comment_content' => $text,
			'comment_type' => '',
			'comment_parent' => 0,
			'user_id' => $user_id,
			'comment_author_IP' => '127.0.0.1',
			'comment_agent' => 'Mozilla/5.0 (Windows; U; Windows NT 5.1; en-US; rv:1.9.0.10) Gecko/2009042316 Firefox/3.0.10 (.NET CLR 3.5.30729)',
			'comment_date' => $rdate,
			'comment_approved' => 1,
		);

		return wp_insert_comment($data); // вернет ид комметария или false
	}
	
}
// end of file //