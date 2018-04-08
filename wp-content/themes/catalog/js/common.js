$(document).ready(function () {

	// $('.promo_slider').owlCarousel({
	// 	loop: true,
	// 	margin: 0,
	// 	nav: true,
	// 	dots: true,
	// 	items: 1,
	// 	autoplay: false,
	// 	autoplaySpeed: 1000,
	// 	navText: ['<span class="nav-left"></span>', '<span class="nav-right"></span>'],
	// });

	// Стили главных рубрик
	$('.cat-item a').css('color', '#444');
	$(".cat-item ul a").css({"color":"unset", "font-size":"15px"})
	$('.cat-item a').addClass('main-rubrick');
	$('.cat-item ul a').removeClass('main-rubrick');

	// product slider
	$('.product_slider').owlCarousel({
		loop: true,
		margin: 0,
		nav: true,
		dots: true,
		items: 1,
		autoplay: false,
		autoplaySpeed: 1000,
		navText: ['<span class="nav-left"></span>', '<span class="nav-right"></span>'],
	});

	$(".slider-wrap").hover(function () {
		$(".nav-left, .nav-right").fadeIn(300);
		$(this).mouseleave(function () {
			$(".nav-left, .nav-right").fadeOut(300);
		});
	});

	// Header menu
	$(function () {
		var menu_top = $(".main-nav ul");
			menu_top_Height	= menu_top.height();

		$(".main-nav_burger").click(function () {
			$(".main-nav ul").slideToggle(500);
		});

		$(window).resize(function () {
			var w = $(window).width();
			if (w > 768 && menu_top.is(':hidden')) {
				menu_top.removeAttr('style');
			}
		});
	});

	// catalog menu
	$(function () {
		var menu = $('.sidebar-catalog ul');
			menuHeight	= menu.height();

		$(".burger-cat").click(function () {
			$(".sidebar-catalog ul").slideToggle(500);
		});

		$(window).resize(function () {
			var w = $(window).width();
			if (w > 768 && menu.is(':hidden')) {
				menu.removeAttr('style');
			}
		});
	});

	// аккордеон в каталоге
	$(".cat-link").click(function (v) {
		v.preventDefault();
		var $this = $(this);

		if (!$this.hasClass("active")) {
			$(".cat-link").next().slideUp();
			$(".cat-link").removeClass("active");
		}

		$this.toggleClass("active");
		$this.next().slideToggle();

	});

	// бургер в каталоге












	// Fancybox
	$("a[rel=group]").fancybox({
		'transitionIn': 'none',
		'transitionOut': 'none',
		'titlePosition': 'over',
		'titleFormat': function (title, currentArray, currentIndex, currentOpts) {
			return '<span id="fancybox-title-over">Image ' + (currentIndex + 1) + ' / ' + currentArray.length + (title.length ? ' &nbsp; ' + title : '') + '</span>';
		}
	});

	// Modal window
	$('a[name=modal]').click(function (e) {
		e.preventDefault();
		var id = $(this).attr('href');
		var maskHeight = $(document).height();
		var maskWidth = $(window).width();
		$('#mask').css({ 'width': maskWidth, 'height': maskHeight });
		$('#mask').fadeTo("slow", 0.8);
		var winH = $(window).height();
		var winW = $(window).width();
		posTop = (window.pageYOffset !== undefined) ? window.pageYOffset : (document.documentElement || document.body.parentNode || document.body).scrollTop;
		$(id).css('top', posTop + 50);
		$(id).css('left', winW / 2 - $(id).width() / 2);
		$(id).fadeIn(500);
	});
	$('.window .dd-close').click(function (e) {
		e.preventDefault();
		$('#mask, .window').hide();
		$('.window').hide();
	});

	$('#mask, .an-exit__krest').click(function () {
		$('#mask').hide();
		$('.window').hide();
	});
	$(".phone").mask("+ 7 (999) 999 - 99 - 99?");
	$(".form-message").submit(function () {
		var tel = $(this).find('input[name="phone"]');
		var empty = false;
		if (tel.val() == "") {
			empty = true;
		}
		if (empty == true) {
			tel.addClass("error-input");
			tel.focus();
		} else {
			var form_data = $(this).serialize();
			$.ajax({
				type: "POST",
				url: "/message.php",
				data: form_data,
				success: function () {
					cleanTnanks(this);
				}
			});
		}
		return false;
	});

	function cleanTnanks(form) {
		$('input[type="text"]').removeClass("error-input");
		$("input[type=text], textarea").val("");
		$('.window').hide();
		$('a[href="#thanks"]').trigger('click');

	};


});//END READY
