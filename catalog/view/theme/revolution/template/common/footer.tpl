</section>
<?php if (!$setting_all_settings['all_document_width'] && $setting_all_settings['all_document_h_f_width']) { ?>
</div>
<?php } ?>
<?php if ($f_map) { ?>
	<div id="map-wrapper" class="hidden-xs">
		<div class="contact-info">
			<div class="item">
				<div class="label_fconts"><?php echo $text_contact_ourcontacts; ?></div>
				<?php if ($settings_all_settings['m_conts']) { ?>
					<p class="hid_address"><i class="fa fa-map-marker" aria-hidden="true"></i><?php echo $address; ?></p>
					<p class="hid_telephone"><i class="fa fa fa-phone" aria-hidden="true"></i><?php echo $telephone; ?></p>
				<?php } ?>
				<?php if ($settings_all_settings['dop_conts']) { ?>
					<?php if ($header_phone_number != '') { ?>
						<p class="dop_contact_tel1"><i class="fa fa fa-phone" aria-hidden="true"></i><?php echo $header_phone_cod; ?> <?php echo $header_phone_number; ?></p>
					<?php } ?>
					<?php if ($header_phone_number2 != '') { ?>
						<p class="dop_contact_tel2"><i class="fa fa fa-phone" aria-hidden="true"></i><?php echo $header_phone_cod2; ?> <?php echo $header_phone_number2; ?><p>
					<?php } ?>
					<?php if ($dop_contacts) { $i_dc = 1; ?>
						<?php foreach ($dop_contacts as $dop_contact) { ?>
							<p class="dop_contact_<?php echo $i_dc; ?>"><i class="fa <?php echo $dop_contact['icon']; ?>" aria-hidden="true"></i><?php echo $dop_contact['number']; ?></p>
						<?php $i_dc++; } ?>
					<?php } ?>
				<?php } ?>
				<?php if ($settings_all_settings['soc_conts']) { ?>
					<?php if ($revtheme_footer_socs_p) { ?>
						<?php foreach ($revtheme_footer_socs_p as $revtheme_footer_soc) { ?>
							<p><i class="<?php echo $revtheme_footer_soc['image']; ?>" aria-hidden="true"></i><a href="<?php echo $revtheme_footer_soc['link']; ?>"><?php echo $revtheme_footer_soc['link_t']; ?></a></p>
						<?php } ?>
					<?php } ?>
				<?php } ?>
			</div>
		</div>
		<div id="yamap">
			<?php if ($yamap) echo $yamap; ?>
		</div>
	</div>
<?php } ?>
<footer>
	<?php echo $revsubscribe; ?>
	<div class="footer">
		<div class="container">
			<div class="row">
				<?php if ($informations || $revtheme_footer_links) { ?>
					<?php $class_informations = 'col-sm-12' ?>
					<?php if (($informations || $revtheme_footer_links) && $revtheme_footer_socs) { $class_informations = 'col-sm-8'; } ?>
					<div class="footer_links <?php echo $class_informations; ?> col-xs-12">
						<?php if ($informations) { ?>
							<?php foreach ($informations as $information) { ?>
								<a href="<?php echo $information['href']; ?>"><?php echo $information['title']; ?></a>
							<?php } ?>
						<?php } ?>
						<?php if ($revtheme_footer_links) { ?>
							<?php foreach ($revtheme_footer_links as $revtheme_footer_link) { ?>
								<a href="<?php echo $revtheme_footer_link['link']; ?>"><?php echo $revtheme_footer_link['title']; ?></a>
							<?php } ?>
						<?php } ?>
					</div>
				<?php } ?>
				<?php if ($revtheme_footer_socs) { ?>
					<?php $class_footer_socs = 'col-sm-12' ?>
					<?php if (($informations || $revtheme_footer_links) && $revtheme_footer_socs) { $class_footer_socs = 'col-sm-4'; } ?>
					<div class="soc_s <?php echo $class_footer_socs; ?> col-xs-12">
						<?php foreach ($revtheme_footer_socs as $revtheme_footer_soc) { ?>
							<a href="<?php echo $revtheme_footer_soc['link']; ?>"><i class="<?php echo $revtheme_footer_soc['image']; ?>" data-toggle="tooltip" title="<?php echo $revtheme_footer_soc['title']; ?>"></i></a>
						<?php } ?>
					</div>
				<?php } ?>
				<?php if ($revtheme_footer_icons) { ?>
					<?php $style_powered = 'text-align:right'; $class_powered = 'col-sm-6' ?>
					<div class="ficons col-sm-6 col-xs-12">
						<?php foreach ($revtheme_footer_icons as $revtheme_footer_icon) { ?>
							<span class="revtheme_footer_icon">
								<img src="<?php echo $revtheme_footer_icon['image']; ?>" alt=""/>
							</span>
						<?php } ?>
					</div>
				<?php } else { ?>
					<?php $style_powered = 'text-align:left'; $class_powered = 'col-sm-12' ?>
				<?php } ?>
				<div style="<?php echo $style_powered; ?>" class="powered <?php echo $class_powered; ?> col-xs-12"><?php echo $powered; ?></div>
			</div>
		</div>
	</div>	
</footer>
<?php if (!$setting_all_settings['all_document_width'] && !$setting_all_settings['all_document_h_f_width']) { ?>
</div>
<?php } ?>
<?php if ($popup_phone) { ?>
	<div class="popup-phone-wrapper" data-toggle="tooltip" data-placement="left"  title="<?php echo $text_footer_popup_phone_tooltip; ?>">
		<span class="scroll-top-inner">
			<i class="fa fa-phone"></i>
		</span>
	</div>
<?php } ?>
<?php if ($in_top) { ?>
	<div class="scroll-top-wrapper ">
		<span class="scroll-top-inner">
			<i class="fa fa-chevron-up"></i>
		</span>
	</div>
<?php } ?>
<script src="catalog/view/javascript/bootstrap/js/bootstrap.min.js" type="text/javascript"></script>
<script src="catalog/view/javascript/revolution/common.js" type="text/javascript"></script>
<?php if ($f_map && !$yamap) { ?>
	<script src="//api-maps.yandex.ru/2.1/?lang=ru_RU" type="text/javascript"></script>
<?php } ?>
<script type="text/javascript"><!--
<?php if ($n_progres) { ?>
	NProgress.start();
	$(window).load(function() {
		NProgress.done();
	});
	setTimeout(function() {
    NProgress.done();
    }, 0);
<?php } ?>
<?php if ($sticky) { ?>
if($(window).width() > 768) {
	$('#top3').affix({
		offset: {
			top: $('#top').outerHeight()+$('#top2').outerHeight()+$('html.common-home #menu2.inhome').outerHeight()
		}
	});
}
<?php } ?>
$(function() {
	if (localStorage.getItem('display') == 'list') {
		$('#list-view').trigger('click');
	} else if (localStorage.getItem('display') == 'price') {
		$('#price-view').trigger('click');
	} else if (localStorage.getItem('display') == 'grid') {
		$('#grid-view').trigger('click');
	} else {
		<?php if ($setting_catalog_all['vid_default'] == 'vid_price') { ?>
			$('#price-view').trigger('click');
		<?php } else if ($setting_catalog_all['vid_default'] == 'vid_list') { ?>
			$('#list-view').trigger('click');
		<?php } else if ($setting_catalog_all['vid_default'] == 'vid_grid') { ?>
			$('#grid-view').trigger('click');
		<?php } ?>
	}
	podgon_fona();
	$(window).resize(podgon_fona);
});
function podgon_fona() {
	toggle_ellipses();
	var h_top5 = $('.inhome #menu2').outerHeight();
	if (h_top5) {
		$('#top5').css('min-height', h_top5+20);
	}
	<?php if ($up_menu_height) { ?>
		var h_top4 = $('#top4').outerHeight();
		$('html.common-home #menu2.inhome').css('min-height', h_top4+50);
	<?php } ?>
	var m2inh = $('html.common-home #menu2.inhome').outerHeight();
	$('html.common-home #menu2.inhome .podmenu2').css('height', m2inh);
	var m2inhw = $('html.common-home #menu2_button').outerWidth();
	$('html.common-home #menu2.inhome .podmenu2').css('min-width', m2inhw-0.5);
	<?php if ($sticky && $up_menu_height) { ?>
		$('html.common-home #top3.affix #menu2.inhome').css('min-height', 'initial');
		var m2inh = $('html.common-home #menu2.inhome').outerHeight();
		$('html.common-home #top3.affix #menu2.inhome .podmenu2').css('height', m2inh);
		$(document).on('scroll', function(){
			var home_amazon_height = $('#top').outerHeight()+$('#top2').outerHeight()+$('html.common-home #top3 #menu2.inhome').outerHeight();
			if ($(window).scrollTop() > home_amazon_height) {
				$('html.common-home #top3.affix #menu2.inhome').css('min-height', 'initial');
				$('html.common-home #top3.affix #menu2.inhome .podmenu2').css('min-height', 'initial');
			} else {
				var h_top4 = $('#top4').outerHeight();
				$('html.common-home #top3 #menu2.inhome').css('min-height', h_top4+50);
				$('html.common-home #top3 #menu2.inhome .podmenu2').css('min-height', h_top4+50);
			}
		});
	<?php } ?>
	<?php if ($sticky) { ?>
		var h_top3 = $('#top3').outerHeight();
		$('.main-content').css('padding-top', h_top3+25);
	<?php } ?>
	<?php if (($setting_all_settings['all_document_width']) || (!$setting_all_settings['all_document_width'] && $setting_all_settings['all_document_h_f_width'])) { ?>
		$('#top3').addClass('absolutpo');
	<?php } ?>
	if($(window).width() < 767) {
		$('#grid-view').trigger('click');
	}
	<?php if ($image_in_ico && !$header_menu_type) { ?>
		var menu_ico_width = $('.image_in_ico_row').outerWidth();
		$('#menu .nav > li .dropdown-menu').css('width', menu_ico_width-30);
	<?php } ?>

	var product_grid_width = $('.product-layout .product-thumb').outerWidth();
	if (product_grid_width < 240) {
		$('.product-layout').addClass('new_line');
	} else {
		$('.product-layout').removeClass('new_line');
	}
	max_height_div('.product-grid .product-thumb .description');
	max_height_div('.product-grid .product-thumb .description_options');
	max_height_div('.product-grid .product-thumb .price');
}

function toggle_ellipses() {
  var ellipses1 = $('.br_ellipses');
  var howlong = $('.breadcrumb li:hidden').length;
  if ($('.breadcrumb li:hidden').length > 1) {
    ellipses1.show().css('display', 'inline');
  } else {
    ellipses1.hide();
  }
}

$(document).on( 'scroll', function(){
	if ($(window).scrollTop() > 100) {
		$('.scroll-top-wrapper').addClass('show');
	} else {
		$('.scroll-top-wrapper').removeClass('show');
	}
});

$('.scroll-top-wrapper').on('click', scrollToTop);
$('.popup-phone-wrapper').on('click', get_revpopup_phone);
function scrollToTop() {
	verticalOffset = typeof(verticalOffset) != 'undefined' ? verticalOffset : 0;
	element = $('body');
	offset = element.offset();
	offsetTop = offset.top;
	$('html, body').animate({scrollTop: offsetTop}, 200, 'linear');
};
function get_revpopup_notification(m_class, m_header, message) {
	if (document.body.scrollHeight > document.body.offsetHeight) {
		$('#top3.absolutpo').css('right', '8.5px');
	}
	$.magnificPopup.open({
		removalDelay: 300,
		callbacks: {
			beforeOpen: function() {
			   this.st.mainClass = 'mfp-zoom-in';
			},
			open: function() {
				$('body').addClass('razmiv2');
				$('#pagefader2').fadeIn(70);
			}, 
			close: function() {
				$('body').removeClass('razmiv2');
				$('#pagefader2').fadeOut(70);
				$('#top3.absolutpo').css('right', 'initial');
			}
		},
		tLoading: '',
		items: {
			src: $('<div class="popup_notification"><div class="popup_notification_heading '+m_class+'">'+m_header+'</div><div class="popup_notification_message">'+message+'</div></div>'),
			type: 'inline'
		}
	});
}
function get_revpopup_phone() {
	if (document.body.scrollHeight > document.body.offsetHeight) {
		$('#top3.absolutpo').css('right', '8.5px');
	}
	$.magnificPopup.open({
		removalDelay: 300,
		callbacks: {
			beforeOpen: function() {
				this.st.mainClass = 'mfp-zoom-in';
				$('.dropdown-menu.dop_contss').fadeOut(70);
			},
			open: function() {
				$('body').addClass('razmiv2');
				$('#pagefader2').fadeIn(70);
			}, 
			close: function() {
				$('body').removeClass('razmiv2');
				$('#pagefader2').fadeOut(70);
				$('#top3.absolutpo').css('right', 'initial');
				$('.dropdown-menu.dop_contss').css('display', '');
			}
		},
		tLoading: '',
		items: {
			src: 'index.php?route=revolution/revpopupphone',
			type: 'ajax'
		}
	});
}
function get_revpopup_view(product_id) {
	if (document.body.scrollHeight > document.body.offsetHeight) {
		$('#top3.absolutpo').css('right', '8.5px');
	}
	$.magnificPopup.open({
		removalDelay: 300,
		callbacks: {
			beforeOpen: function() {
			   this.st.mainClass = 'mfp-zoom-in';
			},
			open: function() {
				$('body').addClass('razmiv2');
				$('#pagefader2').fadeIn(70);
			},
			close: function() {
				$('body').removeClass('razmiv2');
				$('#pagefader2').fadeOut(70);
				$('#top3.absolutpo').css('right', 'initial');
			}
		},
		tLoading: '',
		items: {
			src: 'index.php?route=revolution/revpopupview&product_id='+product_id,
			type: 'ajax'
		}
	});
}
function get_revpopup_purchase(product_id) {
	if (document.body.scrollHeight > document.body.offsetHeight) {
		$('#top3.absolutpo').css('right', '8.5px');
	}
	$.magnificPopup.open({
		removalDelay: 300,
		callbacks: {
			beforeOpen: function() {
			   this.st.mainClass = 'mfp-zoom-in';
			},
			open: function() {
				$('body').addClass('razmiv2');
				$('#pagefader2').fadeIn(70);
			}, 
			close: function() {
				$('body').removeClass('razmiv2');
				$('#pagefader2').fadeOut(70);
				$('#top3.absolutpo').css('right', 'initial');
			}
		},
		tLoading: '',
		items: {
			src: 'index.php?route=revolution/revpopuporder&product_id='+product_id,
			type: 'ajax'
		}
	});
}

function get_revpopup_cart( product_id, action, quantity, block_id ) {
	quantity = typeof(quantity) != 'undefined' ? quantity : 1;
	if ( action == "catalog" ) {
		data = $('.products_category .product_'+product_id+' .options input[type=\'text\'], .products_category .product_'+product_id+' .options input[type=\'hidden\'], .products_category .product_'+product_id+' .options input[type=\'radio\']:checked, .products_category .product_'+product_id+' .options input[type=\'checkbox\']:checked, .products_category .product_'+product_id+' .options select');
		$.ajax({
			url: 'index.php?route=checkout/cart/add',
			type: 'post',
			data: data.serialize() + '&product_id=' + product_id + '&quantity=' + quantity,
			dataType: 'json',
			success: function( json ) {
				$('.alert, .text-danger').remove();
				$('.form-group').removeClass('has-error');
				$('.success, .warning, .attention, information, .error').remove();
				<?php if (!$description_options['options_in_cat']) { ?>
				if ( json['redirect'] ) {
					location = json['redirect'];
				}
				<?php } else { ?>
				if (localStorage.getItem('display') == 'price' || block_id) {
					if ( json['redirect'] ) {
						location = json['redirect'];
					}
				} else {
					$('.products_category .form-group.required').removeClass('opt_required');
					if (json['error']) {
						$('body').removeClass('razmiv2');
						$('#pagefader2').fadeOut(70);
						if (json['error']['option']) {
							for (i in json['error']['option']) {
								$('.products_category #input-option' + i).parent().addClass('opt_required');
							}
						}
					}
				}
				<?php } ?>
				if ( json['success'] ) {
					<?php if ($revtheme_header_cart['cart_vspl']) { ?>
						if (document.body.scrollHeight > document.body.offsetHeight) {
							$('#top3.absolutpo').css('right', '8.5px');
						}
						$.magnificPopup.open({
						removalDelay: 300,
						callbacks: {
							beforeOpen: function() {
							   this.st.mainClass = 'mfp-zoom-in';
							},
							close: function() {
								$('body').removeClass('razmiv2');
								$('#pagefader2').fadeOut(70);
								$('#top3.absolutpo').css('right', 'initial');
							}
						},
						tLoading: '',
						items: {
							src: 'index.php?route=revolution/revpopupcart',
							type: 'ajax'
						}
						});
					<?php } else { ?>
						<?php if ($setting_catalog_all['img_slider']) { ?>
						tmp_img = $('.products_category .product_'+product_id+' .image .owl-item:first-child img');
						<?php } else { ?>
						tmp_img = $('.products_category .product_'+product_id+' .image img');
						<?php } ?>
						$(tmp_img)
							.clone()
							.css({width : $('.product-price .image').outerWidth(), 'position' : 'absolute', 'z-index' : '999', top: $('.products_category .product_'+product_id+' .image img').offset().top, left: $('.products_category .product_'+product_id+' .image img').offset().left})
							.appendTo("body")
							.animate({opacity: 0.3,
								left: $("#cart #cart-total").offset()['left'],
								top: $("#cart #cart-total").offset()['top']+15,
								width: 10}, 800, function() {
								$(this).remove();
							});
					<?php } ?>
					$('#cart-total' ).html(json['total']);
					$('#cart-total-popup').html(json['total']);
					$('#cart > ul').load('index.php?route=common/cart/info ul li');
				}
			}
		});
	}
	if ( action == "catalog_mod" ) {
		data = $('.products_category .product_'+product_id+' .options input[type=\'text\'], .products_category .product_'+product_id+' .options input[type=\'hidden\'], .products_category .product_'+product_id+' .options input[type=\'radio\']:checked, .products_category .product_'+product_id+' .options input[type=\'checkbox\']:checked, .products_category .product_'+product_id+' .options select');
		$.ajax({
			url: 'index.php?route=checkout/cart/add',
			type: 'post',
			data: data.serialize() + '&product_id=' + product_id + '&quantity=' + quantity,
			dataType: 'json',
			success: function( json ) {
				$('.alert, .text-danger').remove();
				$('.form-group').removeClass('has-error');
				$('.success, .warning, .attention, information, .error').remove();

				if ( json['redirect'] ) {
					location = json['redirect'];
				}
				
				if ( json['success'] ) {
					<?php if ($revtheme_header_cart['cart_vspl']) { ?>
						if (document.body.scrollHeight > document.body.offsetHeight) {
							$('#top3.absolutpo').css('right', '8.5px');
						}
						$.magnificPopup.open({
						removalDelay: 300,
						callbacks: {
							beforeOpen: function() {
							   this.st.mainClass = 'mfp-zoom-in';
							},
							close: function() {
								$('body').removeClass('razmiv2');
								$('#pagefader2').fadeOut(70);
								$('#top3.absolutpo').css('right', 'initial');
							}
						},
						tLoading: '',
						items: {
							src: 'index.php?route=revolution/revpopupcart',
							type: 'ajax'
						}
						});
					<?php } else { ?>
						tmp_img = $('.products_category .product_'+product_id+' .image img');
						$(tmp_img)
							.clone()
							.css({width : $('.products_category .product_'+product_id+' .image img').outerWidth(), 'position' : 'absolute', 'z-index' : '999', top: $('.products_category .product_'+product_id+' .image img').offset().top, left: $('.products_category .product_'+product_id+' .image img').offset().left})
							.appendTo("body")
							.animate({opacity: 0.3,
								left: $("#cart #cart-total").offset()['left'],
								top: $("#cart #cart-total").offset()['top']+15,
								width: 10}, 800, function() {
								$(this).remove();
							});
					<?php } ?>
					$('#cart-total' ).html(json['total']);
					$('#cart-total-popup').html(json['total']);
					$('#cart > ul').load('index.php?route=common/cart/info ul li');
				}
			}
		});
	}
	if ( action == "product" ) {
		data = $('.product-info input[type=\'text\'], .product-info input[type=\'hidden\'], .product-info input[type=\'radio\']:checked, .product-info input[type=\'checkbox\']:checked, .product-info select, .product-info textarea'),
		$.ajax({
			url: 'index.php?route=checkout/cart/add',
			type: 'post',
			data: data.serialize() + '&product_id=' + product_id + '&quantity=' + quantity,
			dataType: 'json',
			<?php if ($revtheme_header_cart['cart_vspl']) { ?>
			beforeSend: function(){
				$('body').addClass('razmiv2');
				$('#pagefader2').fadeIn(70);
			},
			<?php } ?>
			success: function( json ) {
				$('.alert, .text-danger').remove();
				$('.form-group').removeClass('has-error');
				$('.success, .warning, .attention, information, .error').remove();
				if (json['error']) {
					$('body').removeClass('razmiv2');
					$('#pagefader2').fadeOut(70);
					if (json['error']['option']) {
						for (i in json['error']['option']) {
							$('#input-option' + i).before('<span class="error bg-danger">' + json['error']['option'][i] + '</span>');
						}
					}
				}
				if ( json['success'] ) {
					<?php if ($revtheme_header_cart['cart_vspl']) { ?>
						if (document.body.scrollHeight > document.body.offsetHeight) {
							$('#top3.absolutpo').css('right', '8.5px');
						}
						$.magnificPopup.open({
							removalDelay: 300,
							callbacks: {
								beforeOpen: function() {
								   this.st.mainClass = 'mfp-zoom-in';
								},
								close: function() {
									$('body').removeClass('razmiv2');
									$('#pagefader2').fadeOut(70);
									$('#top3.absolutpo').css('right', 'initial');
								}
							},
							tLoading: '',
							items: {
								src: 'index.php?route=revolution/revpopupcart',
								type: 'ajax'
							}
						});
					<?php } else { ?>
						tmp_img = $('.main-image img')
						$(tmp_img)
							.clone()
							.css({'position' : 'absolute', 'z-index' : '999', top: $('.main-image img').offset().top, left: $('.main-image img').offset().left})
							.appendTo("body")
							.animate({opacity: 0.3,
								left: $("#cart #cart-total").offset()['left'],
								top: $("#cart #cart-total").offset()['top']+15,
								width: 10}, 800, function() {
								$(this).remove();
							});
					<?php } ?>
					$('#cart-total' ).html(json['total']);
					$('#cart-total-popup').html(json['total']);
					$('#cart > ul').load('index.php?route=common/cart/info ul li');
				}
			}
		});
	}
	if ( action == "popup_product" ) {
		data = $('#popup-view-wrapper .product-info input[type=\'text\'], #popup-view-wrapper .product-info input[type=\'hidden\'], #popup-view-wrapper .product-info input[type=\'radio\']:checked, #popup-view-wrapper .product-info input[type=\'checkbox\']:checked, #popup-view-wrapper .product-info select, #popup-view-wrapper .product-info textarea');
		$.ajax({
			url: 'index.php?route=checkout/cart/add',
			type: 'post',
			data: data.serialize() + '&product_id=' + product_id + '&quantity=' + quantity,
			dataType: 'json',
			<?php if ($revtheme_header_cart['cart_vspl']) { ?>
			beforeSend: function(){
				$('body').addClass('razmiv2');
				$('#pagefader2').fadeIn(70);
			},
			<?php } ?>
			success: function( json ) {
				$('.alert, .text-danger').remove();
				$('.form-group').removeClass('has-error');
				$('.success, .warning, .attention, information, .error').remove();			
				if (json['error']) {
					$('body').removeClass('razmiv2');
					$('#pagefader2').fadeOut(70);
					if (json['error']['option']) {
						for (i in json['error']['option']) {
							$('#input-option' + i).before('<span class="error bg-danger">' + json['error']['option'][i] + '</span>');
						}
					}
				}
				if ( json['success'] ) {
					<?php if ($revtheme_header_cart['cart_vspl']) { ?>
						if (document.body.scrollHeight > document.body.offsetHeight) {
							$('#top3.absolutpo').css('right', '8.5px');
						}
						$.magnificPopup.open({
							removalDelay: 300,
							callbacks: {
								beforeOpen: function() {
								   this.st.mainClass = 'mfp-zoom-in';
								},
								close: function() {
									$('body').removeClass('razmiv2');
									$('#pagefader2').fadeOut(70);
									$('#top3.absolutpo').css('right', 'initial');
								}
							},
							tLoading: '',
							items: {
								src: 'index.php?route=revolution/revpopupcart',
								type: 'ajax'
							}
						});
					<?php } else { ?>
						$.magnificPopup.close();
					<?php } ?>	
					$('#cart-total' ).html(json['total']);
					$('#cart-total-popup').html(json['total']);
					$('#cart > ul').load('index.php?route=common/cart/info ul li');
				}
			}
		});
	}
	if ( action == "show_cart" ) {
		if (document.body.scrollHeight > document.body.offsetHeight) {
			$('#top3.absolutpo').css('right', '8.5px');
		}
		$.magnificPopup.open({
			removalDelay: 300,
			callbacks: {
				beforeOpen: function() {
				   this.st.mainClass = 'mfp-zoom-in';
				},
				open: function() {
					$('body').addClass('razmiv2');
					$('#pagefader2').fadeIn(70);
				}, 
				close: function() {
					$('body').removeClass('razmiv2');
					$('#pagefader2').fadeOut(70);
					$('#top3.absolutpo').css('right', 'initial');
				}
			},
			tLoading: '',
			items: {
				src: 'index.php?route=revolution/revpopupcart',
				type: 'ajax'
			}
		});
	}
	if ( action == "redirect_cart" ) {
		  window.location.href = "index.php?route=checkout/cart"
	}
	if ( action == "module" ) {
		quantity = typeof(quantity) != 'undefined' ? quantity : 1;
		data = $('#'+block_id+' .product_'+product_id+' .options input[type=\'text\'], #'+block_id+' .product_'+product_id+' .options input[type=\'hidden\'], #'+block_id+' .product_'+product_id+' .options input[type=\'radio\']:checked, #'+block_id+' .product_'+product_id+' .options input[type=\'checkbox\']:checked, #'+block_id+' .product_'+product_id+' .options select');
		$.ajax({
			url: 'index.php?route=checkout/cart/add',
			type: 'post',
			data: data.serialize() + '&product_id=' + product_id + '&quantity=' + quantity,
			dataType: 'json',
			success: function( json ) {
				$('.alert, .text-danger').remove();
				$('.form-group').removeClass('has-error');
				$('.success, .warning, .attention, information, .error').remove();
				<?php if (!$description_options['options_in_cat'] || !$description_options['options_in_grid']) { ?>
				if ( json['redirect'] ) {
					location = json['redirect'];
				}
				<?php } else { ?>
				$('#'+block_id+' .form-group.required').removeClass('opt_required');
				if (json['error']) {
					$('body').removeClass('razmiv2');
					$('#pagefader2').fadeOut(70);
					if (json['error']['option']) {
						for (i in json['error']['option']) {
							$('#'+block_id+' #input-option' + i).parent().addClass('opt_required');
						}
					}
				}
				<?php } ?>
				if ( json['success'] ) {
					<?php if ($revtheme_header_cart['cart_vspl']) { ?>
						if (document.body.scrollHeight > document.body.offsetHeight) {
							$('#top3.absolutpo').css('right', '8.5px');
						}
						$.magnificPopup.open({
						removalDelay: 300,
						callbacks: {
							beforeOpen: function() {
							   this.st.mainClass = 'mfp-zoom-in';
							},
							close: function() {
								$('body').removeClass('razmiv2');
								$('#pagefader2').fadeOut(70);
								$('#top3.absolutpo').css('right', 'initial');
							}
						},
						tLoading: '',
						items: {
							src: 'index.php?route=revolution/revpopupcart',
							type: 'ajax'
						}
						});
					<?php } else { ?>
						<?php if ($setting_catalog_all['img_slider']) { ?>
						tmp_img = $('#'+block_id+' .product_'+product_id+' .image .owl-item:first-child img');
						<?php } else { ?>
						tmp_img = $('#'+block_id+' .product_'+product_id+' .image img');
						<?php } ?>
						$(tmp_img)
							.clone()
							.css({'position' : 'absolute', 'z-index' : '999', top: $('#'+block_id+' .product_'+product_id+' .image img').offset().top, left: $('#'+block_id+' .product_'+product_id+' .image img').offset().left})
							.appendTo("body")
							.animate({opacity: 0.3,
								left: $("#cart #cart-total").offset()['left'],
								top: $("#cart #cart-total").offset()['top']+15,
								width: 10}, 800, function() {
								$(this).remove();
							});
					<?php } ?>
					$('#cart-total' ).html(json['total']);
					$('#cart-total-popup').html(json['total']);
					$('#cart > ul').load('index.php?route=common/cart/info ul li');
				}
			}
		});
	}
	if ( action == "module_in_product" ) {
		quantity = typeof(quantity) != 'undefined' ? quantity : 1;
		data = $('#'+block_id+' .product_'+product_id+' .options input[type=\'text\'], #'+block_id+' .product_'+product_id+' .options input[type=\'hidden\'], #'+block_id+' .product_'+product_id+' .options input[type=\'radio\']:checked, #'+block_id+' .product_'+product_id+' .options input[type=\'checkbox\']:checked, #'+block_id+' .product_'+product_id+' .options select');
		$.ajax({
			url: 'index.php?route=checkout/cart/add',
			type: 'post',
			data: data.serialize() + '&product_id=' + product_id + '&quantity=' + quantity,
			dataType: 'json',
			<?php if ($revtheme_header_cart['cart_vspl']) { ?>
			beforeSend: function(){
				$('body').addClass('razmiv2');
				$('#pagefader2').fadeIn(70);
			},
			<?php } ?>
			success: function( json ) {
				$('.alert, .text-danger').remove();
				$('.form-group').removeClass('has-error');
				$('.success, .warning, .attention, information, .error').remove();
				<?php if (!$description_options['options_in_cat'] || !$description_options['options_in_grid']) { ?>
				if ( json['redirect'] ) {
					location = json['redirect'];
				}
				<?php } else { ?>
				$('#'+block_id+' .form-group.required').removeClass('opt_required');
				if (json['error']) {
					$('body').removeClass('razmiv2');
					$('#pagefader2').fadeOut(70);
					if (json['error']['option']) {
						for (i in json['error']['option']) {
							$('#'+block_id+' #input-option' + i).parent().addClass('opt_required');
						}
					}
				}
				<?php } ?>
				if ( json['success'] ) {
					<?php if ($revtheme_header_cart['cart_vspl']) { ?>
						if (document.body.scrollHeight > document.body.offsetHeight) {
							$('#top3.absolutpo').css('right', '8.5px');
						}
						$.magnificPopup.open({
						removalDelay: 300,
						callbacks: {
							beforeOpen: function() {
							   this.st.mainClass = 'mfp-zoom-in';
							},
							close: function() {
								$('body').removeClass('razmiv2');
								$('#pagefader2').fadeOut(70);
								$('#top3.absolutpo').css('right', 'initial');
							}
						},
						tLoading: '',
						items: {
							src: 'index.php?route=revolution/revpopupcart',
							type: 'ajax'
						}
						});
					<?php } else { ?>
						<?php if ($setting_catalog_all['img_slider']) { ?>
						tmp_img = $('#'+block_id+' .product_'+product_id+' .image .owl-item:first-child img');
						<?php } else { ?>
						tmp_img = $('#'+block_id+' .product_'+product_id+' .image img');
						<?php } ?>
						$(tmp_img)
							.clone()
							.css({'position' : 'absolute', 'z-index' : '999', top: $('#'+block_id+' .product_'+product_id+' .image img').offset().top, left: $('#'+block_id+' .product_'+product_id+' .image img').offset().left})
							.appendTo("body")
							.animate({opacity: 0.3,
								left: $("#cart #cart-total").offset()['left'],
								top: $("#cart #cart-total").offset()['top']+15,
								width: 10}, 800, function() {
								$(this).remove();
							});
					<?php } ?>
					$('#cart-total' ).html(json['total']);
					$('#cart-total-popup').html(json['total']);
					$('#cart > ul').load('index.php?route=common/cart/info ul li');
				}
			}
		});
	}
}
function get_revpopup_cart_option (opt_id, option, quantity, product_id) {
	$('.options_buy .pro_'+option+' input[name=\'option['+opt_id+']\']').val(option);
	data = $('.product-info .options_buy .pro_'+option+' input[type=\'text\'], .product-info .options_buy .pro_'+option+' input[type=\'hidden\'], .product-info .options_buy .pro_'+option+' input[type=\'radio\']:checked, .product-info .options_buy .pro_'+option+' input[type=\'checkbox\']:checked, .product-info .options_buy .pro_'+option+' select, .product-info .options_buy .pro_'+option+' textarea');
    $.ajax({
        url: 'index.php?route=checkout/cart/add',
        type: 'post',
		data: data.serialize() + '&product_id=' + product_id + '&quantity=' + quantity,
        dataType: 'json',
		<?php if ($revtheme_header_cart['cart_vspl']) { ?>
			beforeSend: function(){
				$('body').addClass('razmiv2');
				$('#pagefader2').fadeIn(70);
			},
		<?php } ?>
        success: function( json ) {
			$('.alert, .text-danger').remove();
			$('.form-group').removeClass('has-error');
			$('.success, .warning, .attention, information, .error').remove();
			if (json['error']) {
				$('body').removeClass('razmiv2');
				$('#pagefader2').fadeOut(70);
			}
			if ( json['success'] ) {
				<?php if ($revtheme_header_cart['cart_vspl']) { ?>
					if (document.body.scrollHeight > document.body.offsetHeight) {
						$('#top3.absolutpo').css('right', '8.5px');
					}
					$.magnificPopup.open({
						removalDelay: 300,
						callbacks: {
							beforeOpen: function() {
							   this.st.mainClass = 'mfp-zoom-in';
							},
							close: function() {
								$('body').removeClass('razmiv2');
								$('#pagefader2').fadeOut(70);
								$('#top3.absolutpo').css('right', 'initial');
							}
						},
						tLoading: '',
						items: {
							src: 'index.php?route=revolution/revpopupcart',
							type: 'ajax'
						}
					});
				<?php } else { ?>
					tmp_img = $('.main-image img')
					$(tmp_img)
						.clone()
						.css({'position' : 'absolute', 'z-index' : '999', top: $('.main-image img').offset().top, left: $('.main-image img').offset().left})
						.appendTo("body")
						.animate({opacity: 0.3,
							left: $("#cart #cart-total").offset()['left'],
							top: $("#cart #cart-total").offset()['top']+15,
							width: 10}, 800, function() {
							$(this).remove();
						});
				<?php } ?>
				$('#cart-total' ).html(json['total']);
				$('#cart-total-popup').html(json['total']);
				$('#cart > ul').load('index.php?route=common/cart/info ul li');
			}
		}
    });
}
function get_revpopup_login() {
	if (document.body.scrollHeight > document.body.offsetHeight) {
		$('#top3.absolutpo').css('right', '8.5px');
	}
	$.magnificPopup.open({
		removalDelay: 300,
		callbacks: {
			beforeOpen: function() {
			   this.st.mainClass = 'mfp-zoom-in';
			},
			open: function() {
				$('body').addClass('razmiv2');
				$('#pagefader2').fadeIn(70);
			}, 
			close: function() {
				$('body').removeClass('razmiv2');
				$('#pagefader2').fadeOut(70);
				$('#top3.absolutpo').css('right', 'initial');
			}
		},
		tLoading: '',
		items: {
			src: 'index.php?route=revolution/revpopuplogin',
			type: 'ajax'
		}
	});
}
$(document).on('click', '.tel .dropdown-menu', function (e) {
	$(this).hasClass('dropdown-menu-right') && e.stopPropagation();
});

<?php if ($modal_status) { ?>
	function getModalButtons() {
		<?php if ($modal_buttons) { ?>
			return modal = true;
		<?php } else { ?>
			return modal = false;
		<?php } ?>
	}
	function getCookie(name) {
	var matches = document.cookie.match(new RegExp(
		"(?:^|; )" + name.replace(/([\.$?*|{}\(\)\[\]\\\/\+^])/g, '\\$1') + "=([^;]*)"
	));
	return matches ? decodeURIComponent(matches[1]) : undefined;
	}
	if (!getCookie('revmodal')) {
		$(document).ready(setTimeout(function() {
			if (document.body.scrollHeight > document.body.offsetHeight) {
				$('#top3.absolutpo').css('right', '8.5px');
			}
			$.magnificPopup.open({
				removalDelay: 300,
				modal: getModalButtons(),
				callbacks: {
					beforeOpen: function() {
						this.st.mainClass = 'mfp-zoom-in';
						$('.dropdown-menu.dop_contss').fadeOut(70);
					},
					open: function() {
						$('body').addClass('razmiv2');
						$('#pagefader2').fadeIn(70);
					}, 
					close: function() {
						$('body').removeClass('razmiv2');
						$('#pagefader2').fadeOut(70);
						$('#top3.absolutpo').css('right', 'initial');
						$('.dropdown-menu.dop_contss').css('display', '');
					}
				},
				tLoading: '',
				items: {
					src: 'index.php?route=revolution/revmodal',
					type: 'ajax'
				}
			});
			$(document).on('click', '.popup-modal-dismiss', function (e) {
				e.preventDefault();
				$.magnificPopup.close();
			});
		}, 1000));
	}
<?php } ?>

<?php if ($setting_catalog_all['pagination'] != 'standart') { ?>
	<?php if ($setting_catalog_all['pagination'] == 'standart_knopka') { ?>
	var button_more = true; var pagination_exist = true;
	<?php } else { ?>
	var button_more = true; var pagination_exist = false;
	<?php } ?>
	var window_height = 0; var product_block_offset = 0; var product_block = '.row > .product-layout'; var pages_count = 0; var pages = [];
	function gettNextProductPage(pages, pages_count) {
		if (pages_count >= pages.length) return;
		masked(product_block, true);
		$.ajax({
			url:pages[pages_count], 
			type:"GET", 
			data:'',
			beforeSend: function(){
				$('.load_more .fa-refresh').addClass('fa-spin');
			},
			success:function (data) {
				$data = $(data);
				masked(product_block, false);
				if ($data) {
					if (localStorage.getItem('display') == 'list') {
						$(product_block).parent().append($data.find('.product-list').parent().html());
						$('#list-view').trigger('click');
						if (product_block == '.product-grid') {$('#grid-view').trigger('click')};
					} else if (localStorage.getItem('display') == 'price') {
						$(product_block).parent().append($data.find('.product-list').parent().html());
						$('#price-view').trigger('click');
					} else {
						$(product_block).parent().append($data.find('.product-list').parent().html());
						$('#grid-view').trigger('click');
					}
					if (pagination_exist) {
						$('.pagination').html($data.find('.pagination'));
					}
					$('.load_more .fa-refresh').removeClass('fa-spin').css('hover');
					if (pages_count+1 >= pages.length) {$('.load_more').hide();};
				}
			}
		});
	}
	$(document).ready(function(){
		window_height = $(window).height();
		var button_more_block = $('#load_more').html(); //
		if ($(product_block).length > 0) {
			product_block_offset = $(product_block).offset().top;
			var href = $('.pagination').find('li:last a').attr('href');
			$('.pagination').each(function(){
				if (href) {
					TotalPages = href.substring(href.indexOf("page=")+5);
					First_index = $(this).find('li.active span').html();
					i = parseInt(First_index) + 1;
					while (i <= TotalPages) {
						pages.push(href.substring(0,href.indexOf("page=")+5) + i);
						i++;
					}
				}		
			});	
			if (button_more && href) {
				$('.pagination').parent().parent().before(button_more_block);
				if (!pagination_exist) {
					$('.pagpages').remove();
				}
				$(".load_more").click(function(event) {
				  event.preventDefault();
				  gettNextProductPage(pages, pages_count);
				  pages_count++;
				  if (pages_count > 0) {
					var $next = $(".pagpages .pagination li.active").next("li").children("a");
					if ($next.length == 0) return;
					$.get($next.attr("href"), function(data) {
					  $data = $(data);
					  var pag = $data.find(".pagpages > *");
					  var pag2 = pag.filter(".text-right").html();
					  var pag_ch =  pag2.substr(0,pag2.indexOf(" по")).replace(/[^\d.]/ig, '');
					  pag2 = pag2.replace(pag_ch, "1");
					  $(".pagpages").html(pag);
					  $(".pagpages .text-right").html(pag2);
					  $(".owlproduct").not(".owl-theme").owlCarousel({
						beforeInit: true,
						items: 1,
						singleItem: true,
						mouseDrag: false,
						autoPlay: false,
						navigation: true,
						navigationText: ['<i class="fa fa-chevron-left fa-3x"></i>', '<i class="fa fa-chevron-right fa-3x"></i>'],
						pagination: false
					  });
					 }, "html")
				  }
				});
			} else if (href) {
				$('.pagination').parent().parent().hide();
				$(window).scroll(function(){
					product_block = getProductBlock();
					product_block_height = $(product_block).parent().height();
					if (pages.length > 0) {
						if((product_block_offset+product_block_height-window_height)<($(this).scrollTop())){
							gettNextProductPage(pages, pages_count);
							pages_count++;
							if (pages_count > 0) {
								$('.pagination').parent().parent().find('.col-sm-6.text-right').remove();
							}
						}
					}
				});
			}
		}
	});
<?php } ?>
<?php if ($f_map && !$yamap) { ?>
	<?php if (!$yamap) { ?>
		ymaps.ready(init_map);
		function init_map(){
			var address = '<?php echo $address; ?>';
			var geocoder = ymaps.geocode(address);
			geocoder.then(
				function (res) {
					var coordinates = res.geoObjects.get(0).geometry.getCoordinates();
					var map = new ymaps.Map("yamap", {
						center: coordinates,
						zoom: 15,
						controls: [
							'typeSelector',
							'zoomControl'
						]
					});			
					map.geoObjects.add(new ymaps.Placemark(
						coordinates,
						{
							'hintContent': address,
							'balloonContent': '<?php echo $store; ?>'
						},
						{
							'preset': 'islands#redDotIcon'
						}
					));
				}
			);
		}
	<?php } ?>
	$(document).ready(function(){
		var height_f_conts = $('#map-wrapper .contact-info').outerHeight();
		$('#map-wrapper #yamap').css('height', height_f_conts);
		$('#map-wrapper #yamap ymaps').css('height', height_f_conts);
		$('#map-wrapper .contact-info').css('position', 'absolute');
	});
<?php } ?>
//--></script>
<?php if ($user_scripts) { ?>
	<?php echo $user_scripts; ?>
<?php } ?>
<?php if ($setting_catalog_all['pagination'] != 'standart') { ?>
	<div id="load_more" style="display:none;"><div class="col-sm-12 text-center"><a href="#" class="load_more btn btn-primary" rel="nofollow"><i class="fa fa-refresh"></i><?php echo $text_loadmore; ?></a></div></div>
<?php } ?>

</body>
</html>