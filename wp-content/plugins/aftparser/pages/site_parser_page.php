<?php
//
/**
 * 
 * Страница парсера сайтов
 * 
 */

# Защита от мудаков
if (!defined( 'ABSPATH' )){
	header('HTTP/1.0 403 Forbidden');
	exit('Вызов файлов плагина напрямую запрещен.');
}

$links_list 	= "";
$borders_html	= "";
$title 			= "";
$id 			= NULL;

global $wpdb;
$table_name = $wpdb->prefix.'aft_parser';
// кол-во парсеров
$pcount = $wpdb->get_var( "SELECT COUNT(*) FROM {$table_name}" );

$opt = null;
?>

<script type="text/javascript">
	/**
	 * глобальный массив границ фрагментов 
	 * каждый фрагмент идет в формате json-объекта {title:_title, top_border:_top_border, bottom_border:_bottom_border, mode: _mode}
	 */
	var fragments = !fragments ? [] : fragments;			 
</script>
<?php

// режим редактирования
if(isset($_GET['action']) && $_GET['action'] == "edit"){
	
	$id = trim($_GET['parser_id']);
	$query = $wpdb->prepare("SELECT * FROM {$table_name}
									WHERE `id` = '%d' AND `mode` = '0'", 
										array(
											$id,
										)
									);
	
	$data = $wpdb->get_results($query, ARRAY_A);
	if(!empty($data)){	
		$links_list = $data[0]['links_list'];
		$borders_html = "";
		$borders_old = "";
		$b = unserialize($data[0]['borders']);
		
		if(count($b)>0){
			echo '<script type="text/javascript">
						fragments = '.json_encode($b).';
						jQuery(document).ready(function(){';
			foreach($b as $key=>$border){
				$borders_old .= '<p>Название: '.htmlspecialchars(stripslashes($border['title'])).'<br>
								<i>верх:</i> <code>'.htmlspecialchars(stripslashes($border['top_border'])).'</code><br>
								<i>низ:</i> <code>'.htmlspecialchars(stripslashes($border['bottom_border'])).'</code></p>';

				$borders_html .= '<option value="'.($key+1).'"> Название: '.htmlspecialchars($border['title']).' &amp; Режим использования: '.$border['mode'].'
				</option>';
				//echo 'fragments.push({title:"'.$border['title'].'", top_border:"'.$border['top_border'].'", bottom_border:"'.$border['bottom_border'].'", mode: "'.$border['mode'].'"});';
			}
			echo '});</script>';
		}
		$macro = $data[0]['macro'];
		$title = $data[0]['title'];
		$opt = $data[0];
	}
}
?>

<div class="wrap">
<h2>Универсальный парсер сайтов</h2>
	<div class="parse_list">
	<form method="POST" id="main-form" page="rss">
		<table class="form-table"><!-- Таблицами верстает.... наркоман наверное... -->
		<tr valign="top">
			<th scope="row">Ссылки:</th>
			<td class='top_al'>
				<p>Добавьте ссылки на материалы</p>
				<p><textarea id="aft_links_list" style="width:100%; height:110px;" wrap="off" name="links_list"><?php echo $links_list; ?></textarea><p>
				<a id="btn_links_revert" href="#" class='button-secondary'>Реверсия ссылок</a>
			</td>
			<td>
				<div class="aft_attention">
					<b>Информация:</b>
					<ol>
						<li> Ссылки могут принадлежать разным сайтам. </li>
						<li> Каждая ссылка должна начинаться с http://</li>
						<li> Размещайте по одной ссылке на строку.</li>
					</ol>
				</div>
			</td>
		</tr>
		<tr valign="top">
			<th scope="row">Автоматический сбор и фильтрация ссылок:<br /><small>(только для опытных пользователей)<small></th>
			<td class='top_al' colspan="2">			
				<div class="pvariants" nactive="none">
					<h4>Парсинг карты сайта</h4>
					<div>
						<input type="text" name="sitemap_url" id="aft_sitemap_url" value="http://" />
						<a id="btn_parse_sitemap" href="#" class='button-primary' style="display:inline-block;">Старт</a>
						<div class='aft_attention'>
						<div>
						<b>Информация:</b>
						<p>Укажите путь до карты сайта и бот соберет с нее все ссылки.
						Так-же можно собрать все ссылки с любой html страницы. Если это валидные ссылки, конечно-же...</p>
						</div>
						</div>
					</div>
					<h4>Граббинг ссылок</h4>
					<div>
						<input type="text" name="map_url" id="aft_map_url" value="http://" />
						<input type="hidden" id="stop_mapping" value="run" />
						<input type="checkbox" checked="checked" id="aft_index_hash" value="index_hash" >Пропускать хеши(ссылки содержащие #)</input>
						<a id="btn_map_site" href="#" class='button-primary' style="display:inline-block;">Старт</a>
						<div class='aft_attention'>
						<div>
						<b>Информация:</b>
						Бот, подобно поисковой системе, пройдется по всем внутренным ссылкам переданнго ему сайта и создаст из них список.
						<br />После парсинга придется отфильтровать полученные ссылки т.к. бот собирает все подряд.
						<br />
						<b>Внимание:</b>
						Этот режим затратен, использовать его стоит только опытным пользователям.<br /> Если вы не понимаете как это работает - не трогайте тут ничего! 
						Лучше вставьте ссылки в список в ручную.<br />
						Процесс сбора ссылок долог, затратен и не рационален,поэтому парсить большие сайты крайне не рекомендуется. <b>Одна</b> страница обрабатывается <b>две</b> секунды, поэтому при парсинге сайта с 1000 страниц придется ждать около <b>35 минут</b>.</div>
						</div>
					</div>
					<h4>Простой фильтр ссылок</h4>
					<div>
						<div class='aft_attention'>
						<b>Информация:</b>
						<p>Чтобы отфильтровать ссылки из списка, укажите параметры фильрации. Каждый - с новой строки.</p>
						<b>Механизм работы фильтров:</b>
						<p>Если прописать в список "не содержит" строчки: #,about и feed, то ссылки, содержищие одно из этих слов - будут исключены из результата фильтрации.</p>
						<p>Если прописать в список "содержит" строчки: category и page, то ссылки, содержищие одно из этих слов - будут включены в результаты фильтрации, при условии, что они не содержат слова из списка "не содержит".</p>
						</div>
						<table><!-- таблицами верстает... наркоман наверное =) -->
							<tr valign="top">
								<td class='top_al'>
									<p>Строка содержит:</p>
									<textarea id="aft_link_cont" style="width:100%; height: 80px;" wrap="off" name="link_cont"></textarea>
								</td>
								<td class='top_al'>
									<p>Строка не содержит:</p>
									<textarea id="aft_link_not_cont" style="width:100%; height: 80px;" wrap="off" name="link_not_cont">#</textarea>
								</td>
							</tr>
						</table>
						<a id="btn_efilter_links" href="#" class='button-primary'>Фильтровать</a>
					</div>
					
					<h4>Продвинутый фильтр/редактор ссылок(php)</h4>
					<div>
						<div class='aft_attention'>
						<b>Информация:</b>
						<p>Переменная $link представлет из себя ссылку, обрабатываемую в текущий момент времени.</p>
						<p>Переменная-результат, отвечающая за то, выводить ссылку или нет, называется $result.</p>
						<p>Дубли удаляются автоматически.</p>
						<p>Так-же можно изменять содержимое ссылок. К примеру так: $result = $link.'123';</p>
						<p>Доступен весь функционал языка PHP, за исключением опасных функций. Но! Кто вас <s>дибилоидов</s> знает... Короче будьте осторожны.</p>
						</div>
						<br>
						<textarea id="aft_txt_filter_ex" class="editor" style="width:100%; height: 130px; " wrap="off" name="txt_filter_ex">
/**
 * Код, приведенный ниже проверяет урл на знаки #
 * все адреса, содержащие в себе знак # будут отфильтрованы и исключены из результата
 */
if(strpos($link,'#') === false) $result = $link;
						</textarea>
						<a id="btn_filter_links" href="#" class='button-primary'>Фильтровать</a>
					</div>
				</div>
			</td>
		</tr>
		
		<tr valign="top">
			<th scope="row">Задайте границы парсинга:</th>
			
			<td>
				<div class='aft_add_new_fragment'>
					<p>Добавить новый фрагмент текста:<p>
					<table class="form-table">
						<tr valign="top">
							<th scope="row">Название:</th>
							<td><input type="text" name="n_border_title" id="new_fragnemt_title" value="" /></td>
						</tr>
						<tr valign="top">
							<th scope="row">Верхняя граница фрагмента:</th>
							<td><textarea type="text" name="n_top_border" id="new_fragment_top" value="" ></textarea></td>
						</tr>
						<tr valign="top">
							<th scope="row">Нижняя граница фрагмента:</th>
							<td><textarea type="text" name="n_bottom_border" id="new_fragment_bottom" value="" ></textarea></td>
						</tr>
						<tr valign="top">
							<th scope="row">Роль:</th>
							<td>
								<select id='aft_f_role' name='f_role'>
									<option value='title'>Заголовок</option>
									<option value='content'>Содержимое</option>
								</select>
							</td>
						</tr>
					</table>
					<p><a id="btn_add_fragment" href="#" class='button-primary'>Добавить</a></p>
					<p>Заготовки:&nbsp;
						<a id="btn_tmp_h1" href="#" class='button-primary'>&lt;h1&gt;</a>
						<a id="btn_tmp_title" href="#" class='button-primary'>&lt;title&gt;</a>
					</p>
				</div>
			</td>
			
			<td class='top_al'>
				<p>Чтобы добавить в список границы воспользуйтесь левой колонкой. Обязательно должна быть создана граница, играющая роль заголовка страницы.</p>
				<p>
					<?php if(isset($borders_old) && $borders_old != ""){ ?>
						<div class="aft_info">
							<h4>Параметры сохраненных границ:</h4>
							<?php echo $borders_old; ?>
						</div>
					<?php } ?>
					<select id="aft_fragments_list"  style="width: 100%; height: 100%;" size="9" name="borders[]"><?php echo $borders_html; ?></select>
				</p>
				<p>
					<a id="btn_remove_fragment" href="#" class='button-primary'>Удалить</a>
				</p>
			</td>
			
		</tr>
		
		<tr valign="top">
			<th scope="row">Формирование материала:</th>
			<td class='top_al' colspan="2">
				<div class="pvariants" nactive='<?php echo ($opt == null)? "0" : "1"; ?>'>
					<h4>Подготовка макроса</h4>
					<div id="eproc-cont">
						<p><input type="checkbox" name="chk_strip_tags">Чистить содержимое мусорных тегов?( То есть удалять атрибуты class,id, width, align, style, etc... у всех тегов, кроме: a,img,audio,video,iframe,object )</input></p>
						<p><input type="checkbox" name="chk_strip_links">Вырезать ссылки внутри содержимого?</input></p>
						<p><input type="checkbox" name="chk_indent">Добавлять отступы к параграфам(тегам p)?</input></p>
						<br />
						<p><h4>Обработка изображений:</h4>
							<ul>
								<li><input type="radio" name="rb_proc_img" value="nothing" checked="true" >Обработка картинок отключена</input></li>
								<li><input type="radio" name="rb_proc_img" value="upload_img">Скачивать картинки, находящиеся внутри материала, на сервер.</input></li>
							</ul>
						</p>
						
						<div class="aft_info"><p>Используя этот режим не забудьте задать 2 границы: Границу для Заголовка и Границу для Содержимого.</p>
						<p><img src='<?php echo AFTPARSER__PLUGIN_URL; ?>/img/screen_b.png'></img></p></div>
					</div>
					<h4>Редактор макроса(PHP)</h4>
					<div>
					<p>Тут можно настроить способ формирования статьи из границ.</p>
<p><textarea class='aft_textarea editor' wrap="off" name="macro" id="aft_macro">
<?php if(!isset($macro) || $macro == ""){ ?>
/* 
* Приведение кодировки
* $blog_enc - кодировка страниц блога
* $src_enc - автоматически определенное значение кодировки. Берется из тега &lt;meta&gt; страницы.
* Если значение $src_enc определяется не верно - укажите его самостоятельно.
*/
if($blog_enc != $src_enc) $html = mb_convert_encoding($html, $blog_enc, $src_enc);
<?php } else echo stripslashes_deep($macro); ?>
</textarea></p>
				<div class='aft_attention'>
					<p><b>Внимание: Используется php код. Конструкции вида &lt;?php ?&gt; <b>ЗАПРЕЩЕНЫ!</b></b></p> 
					Будьте <b>внимательны</b> при написании скрипта,
					т.к. <i>"кривые руки"</i> могут привести к плачевным последствиям.<br />
					<br />
					<strong>Вам доступны следующие переменные:</strong>
					<ul>
						<li><i>$res</i> - Переменная, в которой формируется содержимое страницы.</li>
						<li><i>$html</i> - HTML код текущей страницы.</li>
					</ul>
					
					<strong>Методы для продвинутой обработки:</strong>
					<ul>
						<li class='aft_macro_info'><p>$res .= $this->get_border('Имя Фрагмента',$html); - Получение фрагмента страницы по его имени. В случае неудачи возвращает <i>false</i>.</p></li>
						<li class='aft_macro_info'><p>$html = $this->load($url, $cookie, $post); - Загружает страницу по переданному адресу. Адрес должен начинатся с http://. Два последних параметра($cookie и $post) - не обязательные.</p></li>
						<li class='aft_macro_info'><p>$res = $this->process_images($res); - Ищет в $res(результате) все теги &lt;img&gt; и скачивает на сервер в стандартную папку картинки, которые в этих тегах размещены. Возвращает строку с измененными путями картинок. Имена изображений так-же меняются.</p></li>
						<li class='aft_macro_info'><p>$res .= $this->set_title($this->get_border('fragment_1',$html)); - Устанавливает название будущего материала. В данном случае названием будет текст, размещенный в границе с именем "fragment_1"</p></li>
						<li class='aft_macro_info'><p>$res .= $this->add_comment($author,$email,$author_url,$text); - Добавляет комментарий с текстом $text, от имени пользователя $author.</p></li>
						<li class='aft_macro_info'><p>$res .= $this->set_catname($catname); - Задает категорию, в которую публикуется материал. Если категория с таким именем не существует - она будет создана. Этот параметр можно не указывать, если вы хотите настроить этот парсер только для одной категории.</p></li>
						<li class='aft_macro_info'><p>$res = $this->remove_script_tags($res); - убирает все теги script из текста</p></li>
						<li class='aft_macro_info'><p>$res = $this->remove_html_comments($res); - убирает все блоки &lt;-- --&gt;</p></li>
						<li class='aft_macro_info'><p>$res .= $this->set_alias($path); - Задает алиас, то есть адрес, по которому будет доступен создаваемый материал.</p></li>
						<li class='aft_macro_info'><p>$res .= $this->get_translation($res, $fromlg, $tolg, $key); - перевод текста $text с языка $fromlg(например ru) на язык $tolg(en). Ключ API $key - опционален(не обязателен).</p></li>
						<li class='aft_macro_info'><p>$this->cookie = 'Session_id=3:1418046935.5.0.1401987771000'; - Установка кукисов, которые должны отправляться  каждым запросом.</p></li>
						<li class='aft_macro_info'><p>$f_name = $this->upload_file($url); - Загружает файл с указанного адреса и возвращает его url, который потом удобно вставлять в ссылки. В случае неудачи вернет fasle;</p></li>
						<li class='aft_macro_info'><p>$title = $this->cut_str($html,'&lt;title&gt;','&lt;/title&gt;'); - Вырезает из $html участок начинающийся с &lt;title&gt; и заканчивающийся &lt;/title&gt;, возвращает вырезанный участок или false.</p></li>
						<li class='aft_macro_info'><p>$res = $this->clear_tags_from_trash($res); - Чистит теги от мусора. Теги, которые не обрабатываются и остаются в исходном виде: a, img, object, iframe, audio, video;</p></li>
						<li class='aft_macro_info'><p>$res = $this->remove_a_href($res); - Убирает из текста материала абсолютно все ссылки.</p></li>
						<li class='aft_macro_info'><p>$res .= $this->add_indent(); - Добавляет отступ к тегам &lt;p&gt;</p></li>
						<li class='aft_macro_info'><p>$data_arr = $this->get_recurrence_border('Имя Фрагмента',$html); - Если границы фрагмента повторяется на странице больше 1го раза, то 
														вы можете, с помощью функции <i>get_recurrence_border</i> получить массив фрагментов, удовлетворяющих этим границам. 
														Использовать так: <i>if(!empty($data_arr)) $res .= data_arr[0];</i></p></li>
						</li>
						<li class='aft_macro_info'><p>Помимо этого вам доступны почти все стандартные функции(за исключением ini_set и прочих не рекомендованных функций навроде show_source) php и его расширений. Вы можете выводить данные через echo или print или записывая их в переменную $rez в виде строки. Вся мощ php к вашим услугам, но будьте острожны.</p></li>
						<li class='aft_macro_info'><p>Работают регулярные выражения:</p>
							<ol>
								<li>preg_match ($pattern , $subject, $matches);</li>
								<li>preg_match_all ($pattern , $subject, $matches);</li>
								<li>$res = preg_replace ($pattern , $replacement, $subject);</li>
							</ol>
							<p>Для составления собственных регулярных выражений советую использовать сервис <a href="http://www.regexr.com/" target="_blank" rel="noindex external nofollow">RegExr</a></p>
						</li>
					</ul>
					<p>Нужно больше функций? Окей.<br />Пишите на <a href="http://aftamat4ik.ru/contacts" target="_blank" rel="external noindex nofollow">тут</a> свои предложения и я их рассмотрю.</p>
				</div>
				</div>
			</div>
			</td>
			<td />
		</tr>
		
		<tr valign="top">
			<th scope="row">Разное:</th>
			<td>
				<p>В какой категории публиковать полученные материалы?</p>
				<?php 
					$args = array(
						'type'		=>	'post',
						'orderby'	=>	'name',
						'order'		=>	'ASC',
						'hide_empty'=>	0
						);

					$categories = get_categories($args);
					foreach($categories as $key=>$category){ 
						$ch = "";
						if($key == 0 && $opt == null || $opt != null && $category->cat_ID == $opt['cat_id'])
							$ch = "checked";
						echo '<label><input type="radio" name="cat_id" value="'.$category->cat_ID.'" '.$ch.'>'.$category->name.'</label><br />';
					} 
				?>
			</td>
			<td class='top_al'>
				<p>Статус добавляемых материалов:</p>
				<select name='status' id='aft_status'>
					<option value="pending" <?php echo ($opt != null && $opt['publ_mode'] == 'pending') ? 'selected' : ''; ?>>На утверждении</option>
					<option value="publish" <?php echo ($opt != null && $opt['publ_mode'] == 'publish') ? 'selected' : ''; ?>>Опубликовано</option>
				</select>
			</td>
		</tr>
		
		<tr valign="top">
			<th scope="row">Обработка:<br><small>Прежде чем тыкать тут кнопки - проверьте, все ли поля у вас заполнены.</small></th>
			<td>
				Протестировать работу, обработав <input id="aft_test_count" type="number" name="tcount" min="1" step="1" value ="1"/> ссылок.<br /> 
				<div class='aft_attention'>
					<b>Внимание:</b>
					<p>Если вы укажите слишком большое число, то ваш хостинг, скорее всего, упадет. Будьте осторожны.</p>
					<p>После нажатия кнопки будет выведено окно с информацией, содержащей результаты работы парсера.</p>
				</div>
				<p class="submit"><a id='test_parse' class="button-primary" href="#"><?php _e('Запуск теста') ?></a></p>
				
			</td>
			<td>
				<div>
				<p>Парсить все страницы.</p>
				<div class='aft_attention'>
					<b>Информация:</b>
					<p>В результате работы парсера будут добавлены новые материалы.</p>
					<br />
					<p>Чтобы сберечь ресурсы вашего хостинга, парсер обрабатывает по 1 материалу в секунду(максимум).</p>
					<p>Процесс может быть длительным, особенно если ссылок много.</p>
					<p>К примеру: парсинг 1000 материалов занимает от 17 до 30 минут(зависит от скорости сетевого соединения).</p>
					<br />
				</div>
				<p class="submit" style="position: relative;"><a id='parse_all' class="button-primary" href="#"><?php _e('Начать парсинг') ?></a></p>
				</div>
			</td>
		</tr>
		<?php if($id != NULL){ ?> 
			<input type="hidden" name="pid" value="<?php echo $id; ?>">
		<?php } ?>
		<input type="hidden" id="tp_mode" name="tp_mode" value="custom">
		<tr valign="top">
			<th scope="row">Отложенный парсинг:</small></th>
			<td colspan="2">
				<p>Название парсера: <input id="aft_ptitle" type="text" name="title" placeholder="Это поле обязательно!" value="<?php echo !empty($title)? $title : "site_parser".$pcount; ?>" />&nbsp;
				<p>Количество ссылок, обрабатываемое за 1 проход: <input id="aft_links_pd" name="nl" type="number" min="1" step="1" max="10" value ="<?php echo ($opt != null) ? $opt['num_links'] : '1'; ?>"/></p>
				
				<p class="submit"><a id="aft_save_parser" class="button-primary" href="#"><?php _e('Сохранить для отложенного парсинга'); ?></a></p>
				<div class='aft_attention'>
					<b>Инфо:</b>
					<p><i>Отложенный парсинг</i> - это процесс обработки страниц, растянутый на определенный временной промежуток.</p> 
					<p>Каждый день парсер будет обрабатывать указанное число ссылок, создавая таким образом видимость обновления сайта.</p>
					<p>Этот метод наиболее практичен и экономит ресурсы сервера.</p>
				</div>
			<td>
		</tr>
		
		<?php
			//Т.к. код, отправленный в поле macro выполняется нативно через eval, нам приходится прибегать к особым мерам безопасности. К примеру тут у нас два проверочных поля.
			//Одно - стандартное, для форм, второе - для ajax
			//Инъекций и прочей хуеты навроде eval'а можно не бояться, т.к. без их валидации ни один из обработчиков ajax не работает.
			wp_nonce_field('new_site_parser_action','nonce_cheker'); 
			$ajax_nonce = wp_create_nonce( "aft_parser_key" );
		?>
		</table>
	</form>
	</div>

</div>

<script type="text/javascript">
	var ajax_nonce_field = '<?php echo $ajax_nonce; ?>';
</script>
<!-- end -->