/**
 * 
 * Основной файл скриптов.
 * 
 */
// Глобальные

var editor;			// хендл текстового редактора
var get_error_info;
(function ($, root, undefined) {
	$(function () {
		"use strict";

		$(document).ready(function(){
			
			 $(document).ready(function(){
		    	$.post(ajaxurl, {	// Асинхронно выполняем запуск отложенных операций, дабы не травмировать пользователя долой загрузкой страницы.
						action			: 	'aft_docron',
						data			: 	'run'
					});
		    });
			
		});

		
	});
})(jQuery, this);