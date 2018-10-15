<?php
//
/**
 * 
 * Страница парсера по селекторам(простого)
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
		$b = unserialize($data[0]['borders']);
		if(count($b)>0){
			echo '<script type="text/javascript">
						jQuery(document).ready(function(){';
			foreach($b as $key=>$border){
				$borders_html .= '<option value="'.($key+1).'"> Название: '.$border['title'].' &amp; Режим использования: '.$border['mode'].'</option>';
				echo 'fragments.push({title:"'.$border['title'].'", top_border:"'.$border['top_border'].'", bottom_border:"'.$border['bottom_border'].'", mode: "'.$border['mode'].'"});';
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
	<script type="text/javascript">
		/**
		 * глобальный массив границ фрагментов 
		 * каждый фрагмент идет в формате json-объекта {title:_title, top_border:_top_border, bottom_border:_bottom_border, mode: _mode}
		 */
		var fragments = [];			 
	</script>
	<form method="POST" id="main-form" page="rss">
		<table class="form-table"><!-- Таблицами верстает.... наркоман наверное... -->
		<tr valign="top">
			<th scope="row">Источник материалов:</th>
			<td class='top_al' colspan="2">

				<label><input type="radio" name="pmode" value="requests" checked>По списку запросов</label>
				<label><input type="radio" name="pmode" value="links">По списку ссылок</label>

				<div class="aft_attention pinfo pmode-links" style="display:none;">
					<b>Информация:</b>
					<ol>
						<li> Ссылки могут принадлежать разным сайтам. </li>
						<li> Каждая ссылка должна начинаться с http://</li>
						<li> Размещайте по одной ссылке на строку.</li>
					</ol>
				</div>

				<div class="aft_attention pinfo pmode-requests">
					<b>Информация:</b>
					<ol>
						<li> По каждому запросу будет собран(о) <input type="number" name="material-count" min="1" step="1" value ="1"> материал(а,ов)</li>
						<li> Материалы ищутся в гибридной поисковой системе http://searx.me/</li>
						<li> Размещайте по одному запросу на строку.</li>
						<li> После обработки запросы удаляются из списка.</li>
					</ol>
				</div>
				<p>Кодировка: <input type="text" name="charset-mode" value ="auto"><br>
					<code>auto</code> - при парсинге по ключевым словам,<code>utf-8</code> или <code>cp-1251</code>  и так далее... - при парсинге по вручную собранным ссылкам
				</p>
				<p><textarea id="aft_links_list" style="width:100%; height:210px;" wrap="off" name="links_list"><?php echo $links_list; ?></textarea><p>
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
			<th scope="row">Формирование материала</th>
			<td colspan="2">
				<div class="aft_attention">
					<p>материал собирается из блоков, вы можете добавить до или после текста материала свою информацию</p>
					<code>[text]</code> - текст материала
				</div>
<p><textarea class='aft_textarea editor' wrap="off" name="macro" id="aft_macro"><?php if(!isset($macro) || $macro == ""){ ?>[text]<?php } else echo stripslashes_deep($macro); ?></textarea></p>
			</td>
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
				Протестировать работу, обработав <input id="aft_test_count" type="number" name="tcount" min="1" step="1" value ="1"> ссылок.<br /> 
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
		<input type="hidden" id="tp_mode" name="tp_mode" value="easy">
		<tr valign="top">
			<th scope="row">Отложенный парсинг:</small></th>
			<td colspan="2">
				<p>Название парсера: <input id="aft_ptitle" type="text" name="title" placeholder="Это поле обязательно!" value="<?php echo !empty($title)? $title : "easy_parser".$pcount; ?>" />&nbsp;
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