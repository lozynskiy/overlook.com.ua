function getURLVar(key) {
	var value = [];

	var query = document.location.search.split('?');

	if (query[1]) {
		var part = query[1].split('&');

		for (i = 0; i < part.length; i++) {
			var data = part[i].split('=');

			if (data[0] && data[1]) {
				value[data[0]] = data[1];
			}
		}

		if (value[key]) {
			return value[key];
		} else {
			return '';
		}
	}
}
function setLocation(url){
    document.location.href = url;
}

$(document).ready(function() {
    function q() {
        $(".overlayOffCanvas").addClass("show").fadeIn(),
            $("html, body").addClass("scrollYRemove"),
            $(document).trigger({
                type: "onOverlayOffCanvasShow"
            })
    }
    function p() {
        $(".overlayOffCanvas").fadeOut(function() {
            $(this).removeClass("show")
        }), $("html, body").removeClass("scrollYRemove");
        Ps.destroy(document.getElementById("megamenu-menu"));
        if ($('.filtersContainer.open').length > 0){
            Ps.destroy(document.getElementsByClassName('filtersContainer')[0])
        };
    };

    var reslocked = 0;
    var mobilepiont = 1000;

 function attach() {

    var searchBox = $('.search-box.store-search-box');
    var headerLinks = $('.header-links');
    var headerSelectors = $('.header-selectors');
    var shoppingCart = $('.flyout-cart-wrapper');

        if (window.innerWidth < mobilepiont && reslocked == 0) {
            // mobile
            searchBox.removeAttr('style');
            headerLinks.removeAttr('style');
            headerSelectors.removeAttr('style');
            shoppingCart.removeAttr('style');

            searchBox.detach().appendTo('.responsive-nav-wrapper .search-wrap');
            headerLinks.detach().appendTo('.responsive-nav-wrapper #header-links-opener');
            if (headerSelectors != undefined && headerSelectors.length > 0) {
                 headerSelectors.detach().appendTo('.responsive-nav-wrapper #header-selectors-opener');
            }
             else {
                $('#header-selectors-opener').hide();
            }
            shoppingCart.detach().appendTo('.responsive-nav-wrapper .shopping-cart-link');
            reslocked = 1;

        }
        else if (window.innerWidth > mobilepiont && reslocked == 1) {
            // desktop
            searchBox.removeAttr('style');
            headerLinks.removeAttr('style');
            headerSelectors.removeAttr('style');
            shoppingCart.removeAttr('style');

            searchBox.detach().appendTo('.header-lower #megamenu-menu');
            headerLinks.detach().appendTo('.header-links-wrapper');
            if (headerSelectors != undefined && headerSelectors.length > 0) {
                headerSelectors.detach().appendTo('.header-selectors-wrapper');
            }
            else {
                $('#header-selectors-opener').show();
            }
            shoppingCart.detach().appendTo('.header-middle .center');

         	reslocked = 0;
        }
 }
    $(window).resize(attach);
    $(attach);
    $(".close-menu").click(function() {
        $(".header-menu").removeClass("open"),
            p()
    });

    $(".menu-title").click(function() {
        $(this).addClass("close");
        $("#megamenu-menu.navbar").addClass("open"), $("#megamenu-menu.navbar").addClass("move-right");
        $(".overlayOffCanvas").addClass("show").fadeIn(), $("html, body").addClass("scrollYRemove");
        Ps.initialize(document.getElementById("megamenu-menu"), {
            swipePropagation: !1,
            wheelSpeed: 1,
            suppressScrollX: !0
        });
    });

    $('.header, .shopping-cart-link').on('mouseenter', '.flyout-cart-wrapper', function () {
        if ($(".flyout-cart-wrapper .mini-shopping-cart .items").length){
            var windowHeight = $(window).height();
            var miniShoppingCart = $('.mini-shopping-cart');
            var miniShoppingCartItems = miniShoppingCart.children('.items');
            var miniShoppingCartOffsetTop = miniShoppingCart.offset().top - $(window).scrollTop();
            var miniShoppingCartHeight = miniShoppingCart.outerHeight();
            var miniShoppingCartItemsHeight = miniShoppingCartItems.outerHeight();
            var newItemsHeight = (windowHeight - miniShoppingCartOffsetTop - (miniShoppingCartHeight - miniShoppingCartItemsHeight) - 10);

            miniShoppingCartItems.css('max-height', newItemsHeight + 'px');
            Ps.initialize(document.getElementsByClassName('items')[0], {
                swipePropagation: false,
                wheelSpeed: 1,
                suppressScrollX: true
            });
        };
    });

    $(".overlayOffCanvas").click(function() {
        $(".header-menu").removeClass("open"),
            $(".searchBox").removeClass("open"),
            $(".headerLinksWrapper").removeClass("open"),
            $(".filtersContainer").removeClass("open"),
            p()
    });

    $(".filters-button").click(function() {
        $(".filtersContainer").toggleClass("open"),
            $(".movedElements").toggleClass("move-right"),
            q(),
            Ps.initialize(document.getElementsByClassName('filtersContainer')[0], {
                swipePropagation: false,
                wheelSpeed: 1,
                suppressScrollX: true
            });
    });
    $(".close-filters").click(function() {
        $(".filtersContainer").toggleClass("open"),
            $(".movedElements").toggleClass("move-right"),
            $(".overlayOffCanvas").fadeOut(function() {
                $(this).removeClass("show")
            }), $("html, body").removeClass("scrollYRemove"),
            Ps.destroy(document.getElementsByClassName('filtersContainer')[0])
    });

    $('body').on('click', '.customer-blocks .title', function () {
        if (!$(this).hasClass('active')) {
            $('.customer-blocks .title').toggleClass('active');
        }
        if (!$(this).siblings().hasClass("show")) {
            $('.customer-blocks .title').siblings().toggleClass('show');
        }
    });
    $('.header, .shopping-cart-link').on('mouseleave', '.flyout-cart-wrapper', function () {
        if ($(".flyout-cart-wrapper .mini-shopping-cart .items").length) {
            Ps.destroy(document.getElementsByClassName('items')[0])
        }
    });
    var responsiveHeaderLinkOpeners = $('.responsive-nav-wrapper').find('.shopping-cart-link > span, #header-links-opener > span, #header-selectors-opener > span, .search-wrap > span');

    $('.responsive-nav-wrapper .menu-title, .responsive-nav-wrapper .filters-button, .overlayOffCanvas').on('click', function () {

        responsiveHeaderLinkOpeners.next().slideUp();
        setTimeout(function () {
            $('.admin-header-links, .responsive-nav-wrapper-parent').css('z-index', '');
            $('.header').css({ 'position': '', 'z-index': '' });
        }, 400);
    });

    responsiveHeaderLinkOpeners.on('click', function () {
        var nextElement = $(this).next();

        responsiveHeaderLinkOpeners.next().not(nextElement).slideUp();

        if (nextElement.is(':visible')) {
            nextElement.slideUp('slow');
            $('.overlayOffCanvas').fadeOut(function () {
                $(this).removeClass('show');
                $('.admin-header-links, .responsive-nav-wrapper-parent').css('z-index', '');
                if ($('.mobile-sticky-logo').length > 0) {
                    $('.header').css({ 'position': '', 'z-index': '' });
                }
            });
        } else {
            nextElement.slideDown('slow');
            $('.admin-header-links, .responsive-nav-wrapper-parent').css('z-index', '1070');
            $('.overlayOffCanvas').addClass('show').fadeIn();
            if ($('.mobile-sticky-logo').length > 0) {
                $('.header').css({ 'position': 'relative', 'z-index': '1070' });
            }
        }
    });

	// Highlight any found errors
	$('.text-danger').each(function() {
		var element = $(this).parent().parent();

		if (element.hasClass('form-group')) {
			element.addClass('has-error');
		}
	});
    $(".parent-title-toggle").on("click", function(a) {
        $(this).toggleClass("opened"), $(this).next().toggleClass("megamenu-ischild-opened"), a.preventDefault(), a.stopPropagation()
    });

	// Currency
	$('#form-currency select').on('change', function(e) {
		e.preventDefault();

		$('#form-currency input[name=\'code\']').val(this.value);
		//console.log(this.value);
		$('#form-currency').submit();
	});

	// Language
	$('#form-language .language-select').on('click', function(e) {
		e.preventDefault();

		$('#form-language input[name=\'code\']').val($(this).attr('name'));

		$('#form-language').submit();
	});

	/* Search */
	$('#search input[name=\'search\']').parent().find('button').on('click', function() {
		var url = $('base').attr('href') + 'index.php?route=product/search';

		var value = $('#search input[name=\'search\']').val();

		if (value) {
			url += '&search=' + encodeURIComponent(value);
		}

		location = url;
	});

	$('#search input[name=\'search\']').on('keydown', function(e) {
		if (e.keyCode == 13) {
			$('#search input[name=\'search\']').parent().find('button').trigger('click');
		}
	});

	// Menu
	$('#menu .dropdown-menu').each(function() {
		var menu = $('#menu').offset();
		var dropdown = $(this).parent().offset();

		var i = (dropdown.left + $(this).outerWidth()) - (menu.left + $('#menu').outerWidth());

		if (i > 0) {
			$(this).css('margin-left', '-' + (i + 10) + 'px');
		}
	});

	// Product List
	$('#list-view').click(function() {
		$('#content .product-grid > .clearfix').remove();

		$('#content .product-grid').attr('class', 'product-list');
		$('#grid-view').removeClass('selected');
		$('#list-view').addClass('selected');

		localStorage.setItem('display', 'list');
	});

	// Product Grid
	$('#grid-view').click(function() {
		// What a shame bootstrap does not take into account dynamically loaded columns
		var cols = $('#column-right, #column-left').length;
		
		$('#content .product-list').attr('class', 'product-grid');

		$('#list-view').removeClass('selected');
		$('#grid-view').addClass('selected');

		localStorage.setItem('display', 'grid');
	});

	if (localStorage.getItem('display') == 'list') {
		$('#list-view').trigger('click');
		$('#list-view').addClass('selected');
	} else {
		$('#grid-view').trigger('click');
		$('#grid-view').addClass('selected');
	}

	// Checkout
	$(document).on('keydown', '#collapse-checkout-option input[name=\'email\'], #collapse-checkout-option input[name=\'password\']', function(e) {
		if (e.keyCode == 13) {
			$('#collapse-checkout-option #button-login').trigger('click');
		}
	});

	// tooltips on hover
	$('[data-toggle=\'tooltip\']').tooltip({container: 'body',trigger: 'hover'});

	// Makes tooltips work on ajax generated content
	$(document).ajaxStop(function() {
		$('[data-toggle=\'tooltip\']').tooltip({container: 'body'});
	});

	
	$(".footer-block .title").click(function (e) {
		if (window.innerWidth < 1000){
        	$(this).siblings(".list").slideToggle("slow");
        	e.preventDefault();
        }
    });
});
       
// Cart add remove functions
var cart = {
	'add': function(product_id, quantity) {
		$.ajax({
			url: 'index.php?route=checkout/cart/add',
			type: 'post',
			data: 'product_id=' + product_id + '&quantity=' + (typeof(quantity) != 'undefined' ? quantity : 1),
			dataType: 'json',
			beforeSend: function() {
				$('#cart > button').button('loading');
			},
			complete: function() {
				$('#cart > button').button('reset');
			},
			success: function(json) {
				$('.alert, .text-danger').remove();

				if (json['redirect']) {
					location = json['redirect'];
				}

				if (json['success']) {
                    $.ajax({
                        url: 'index.php?route=common/cart/info',
                        type: 'html',
                        success: function(html){
                            var newHtml = $(html).find('ul').html();
                            var btnCheckout = $(html).find('p.text-right a:eq(1)').text();

                            $('#notification .modal-footer #popup_checkout').html(btnCheckout);

                            $("#notification .modal-body").html('<ul style="list-style: outside none none;margin-left: -3em;">' + newHtml + '</ul>');

                            $("#notification .modal-body p.text-right").remove();

                            $("#notification").modal('show');
                            $("#notification .modal-footer").show();
                            $('#cart-total').html(json['total']);

                            $('#notification .btn-danger').click(function(){
                                $("#notification").modal('hide');
                            })
                        }
                    })

					// Need to set timeout otherwise it wont update the total
					setTimeout(function () {
						$('#cart > button').html('<span id="cart-total">' + json['total'] + '</span>');
					}, 100);

					$('html, body').animate({ scrollTop: 0 }, 'slow');

                    $('#cart > ul').load('index.php?route=common/cart/info ul li');
				}
			},
			error: function(xhr, ajaxOptions, thrownError) {
				alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
			}
		});
	},
	'update': function(key, quantity) {
		$.ajax({
			url: 'index.php?route=checkout/cart/edit',
			type: 'post',
			data: 'key=' + key + '&quantity=' + (typeof(quantity) != 'undefined' ? quantity : 1),
			dataType: 'json',
			beforeSend: function() {
				$('#cart > button').button('loading');
			},
			complete: function() {
				$('#cart > button').button('reset');
			},
			success: function(json) {
				// Need to set timeout otherwise it wont update the total
				setTimeout(function () {
					$('#cart > button').html('<span id="cart-total">' + json['total'] + '</span>');
				}, 100);

				if (getURLVar('route') == 'checkout/cart' || getURLVar('route') == 'checkout/checkout') {
					location = 'index.php?route=checkout/cart';
				} else {
					$('#cart > ul').load('index.php?route=common/cart/info ul li');
				}
			},
			error: function(xhr, ajaxOptions, thrownError) {
				alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
			}
		});
	},
	'remove': function(key) {
		$.ajax({
			url: 'index.php?route=checkout/cart/remove',
			type: 'post',
			data: 'key=' + key,
			dataType: 'json',
			beforeSend: function() {
				$('#cart > button').button('loading');
			},
			complete: function() {
				$('#cart > button').button('reset');
			},
			success: function(json) {
				// Need to set timeout otherwise it wont update the total
				setTimeout(function () {
					$('#cart > button').html('<span id="cart-total">' + json['total'] + '</span>');
				}, 100);
				
				var now_location = String(document.location.pathname);

				if ((now_location.includes('/cart/')) || (now_location.includes('/checkout/')) || (getURLVar('route') == 'checkout/cart') || (getURLVar('route') == 'checkout/checkout')) {
					location = 'index.php?route=checkout/cart';
				} else {
					$('#cart > ul').load('index.php?route=common/cart/info ul li');
				}
			},
			error: function(xhr, ajaxOptions, thrownError) {
				alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
			}
		});
	}
}

var voucher = {
	'add': function() {

	},
	'remove': function(key) {
		$.ajax({
			url: 'index.php?route=checkout/cart/remove',
			type: 'post',
			data: 'key=' + key,
			dataType: 'json',
			beforeSend: function() {
				$('#cart > button').button('loading');
			},
			complete: function() {
				$('#cart > button').button('reset');
			},
			success: function(json) {
				// Need to set timeout otherwise it wont update the total
				setTimeout(function () {
					$('#cart > button').html('<span id="cart-total">' + json['total'] + '</span>');
				}, 100);

				if (getURLVar('route') == 'checkout/cart' || getURLVar('route') == 'checkout/checkout') {
					location = 'index.php?route=checkout/cart';
				} else {
					$('#cart > ul').load('index.php?route=common/cart/info ul li');
				}
			},
			error: function(xhr, ajaxOptions, thrownError) {
				alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
			}
		});
	}
}

var wishlist = {
	'add': function(product_id) {
		$.ajax({
			url: 'index.php?route=account/wishlist/add',
			type: 'post',
			data: 'product_id=' + product_id,
			dataType: 'json',
			success: function(json) {
				$('.alert').remove();

				if (json['redirect']) {
					location = json['redirect'];
				}

				if (json['success']) {
					$('#content').parent().before('<div class="alert alert-success master-wrapper-content"><i class="fa fa-check-circle"></i> ' + json['success'] + ' <button type="button" class="close" data-dismiss="alert">&times;</button></div>');
				}

				$('#wishlist-total').html(json['total']);
				$('#wishlist-total').attr('title', json['total']);

				$('html, body').animate({ scrollTop: 0 }, 'slow');
			},
			error: function(xhr, ajaxOptions, thrownError) {
				alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
			}
		});
	},
	'remove': function() {

	}
}

var compare = {
	'add': function(product_id) {
		$.ajax({
			url: 'index.php?route=product/compare/add',
			type: 'post',
			data: 'product_id=' + product_id,
			dataType: 'json',
			success: function(json) {
				$('.alert').remove();

				if (json['success']) {
					$('#content').parent().before('<div class="alert alert-success master-wrapper-content"><i class="fa fa-check-circle"></i> ' + json['success'] + ' <button type="button" class="close" data-dismiss="alert">&times;</button></div>');

					$('#compare-total').html('<i class="fa fa-exchange "></i><span class="hidden-xs hidden-sm hidden-md">'+json['total']+'</span>');

					$('html, body').animate({ scrollTop: 0 }, 'slow');
				}
			},
			error: function(xhr, ajaxOptions, thrownError) {
				alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
			}
		});
	},
	'remove': function() {

	}
}

/* Agree to Terms */
$(document).delegate('.agree', 'click', function(e) {
	e.preventDefault();

	$('#modal-agree').remove();

	var element = this;

	$.ajax({
		url: $(element).attr('href'),
		type: 'get',
		dataType: 'html',
		success: function(data) {
			html  = '<div id="modal-agree" class="modal">';
			html += '  <div class="modal-dialog">';
			html += '    <div class="modal-content">';
			html += '      <div class="modal-header">';
			html += '        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>';
			html += '        <h4 class="modal-title">' + $(element).text() + '</h4>';
			html += '      </div>';
			html += '      <div class="modal-body">' + data + '</div>';
			html += '    </div>';
			html += '  </div>';
			html += '</div>';

			$('body').append(html);

			$('#modal-agree').modal('show');
		}
	});
});
// Autocomplete */
(function($) {
	$.fn.autocomplete = function(option) {
		return this.each(function() {
			this.timer = null;
			this.items = new Array();

			$.extend(this, option);

			$(this).attr('autocomplete', 'off');

			// Focus
			$(this).on('focus', function() {
				this.request();
			});

			// Blur
			$(this).on('blur', function() {
				setTimeout(function(object) {
					object.hide();
				}, 200, this);
			});

			// Keydown
			$(this).on('keydown', function(event) {
				switch(event.keyCode) {
					case 27: // escape
						this.hide();
						break;
					default:
						this.request();
						break;
				}
			});

			// Click
			this.click = function(event) {
				event.preventDefault();

				value = $(event.target).parent().attr('data-value');

				if (value && this.items[value]) {
					this.select(this.items[value]);
				}
			}

			// Show
			this.show = function() {
				var pos = $(this).position();

				$(this).siblings('ul.dropdown-menu').css({
					top: pos.top + $(this).outerHeight(),
					left: pos.left
				});

				$(this).siblings('ul.dropdown-menu').show();
			}

			// Hide
			this.hide = function() {
				$(this).siblings('ul.dropdown-menu').hide();
			}

			// Request
			this.request = function() {
				clearTimeout(this.timer);

				this.timer = setTimeout(function(object) {
					object.source($(object).val(), $.proxy(object.response, object));
				}, 200, this);
			}

			// Response
			this.response = function(json) {
				html = '';

				if (json.length) {
					for (i = 0; i < json.length; i++) {
						this.items[json[i]['value']] = json[i];
					}

					for (i = 0; i < json.length; i++) {
						if (!json[i]['category']) {
							html += '<li data-value="' + json[i]['value'] + '"><a href="#">' + json[i]['label'] + '</a></li>';
						}
					}

					// Get all the ones with a categories
					var category = new Array();

					for (i = 0; i < json.length; i++) {
						if (json[i]['category']) {
							if (!category[json[i]['category']]) {
								category[json[i]['category']] = new Array();
								category[json[i]['category']]['name'] = json[i]['category'];
								category[json[i]['category']]['item'] = new Array();
							}

							category[json[i]['category']]['item'].push(json[i]);
						}
					}

					for (i in category) {
						html += '<li class="dropdown-header">' + category[i]['name'] + '</li>';

						for (j = 0; j < category[i]['item'].length; j++) {
							html += '<li data-value="' + category[i]['item'][j]['value'] + '"><a href="#">&nbsp;&nbsp;&nbsp;' + category[i]['item'][j]['label'] + '</a></li>';
						}
					}
				}

				if (html) {
					this.show();
				} else {
					this.hide();
				}

				$(this).siblings('ul.dropdown-menu').html(html);
			}

			$(this).after('<ul class="dropdown-menu"></ul>');
			$(this).siblings('ul.dropdown-menu').delegate('a', 'click', $.proxy(this.click, this));

		});
	}
})(window.jQuery);
