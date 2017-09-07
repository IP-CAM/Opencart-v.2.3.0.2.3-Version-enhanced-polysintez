function getURLVar(key) {
	var value = [];

	var query = String(document.location).split('?');

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

function updateOrderMethod(order_id, method){	
	$('#modal-order').modal('show');
		
	$('#modal-order').on('hide.bs.modal', function() {
		$('#content-order').empty();
	});
	
	$('#content-order').load('index.php?route=editors/catalog_edit/updateOrderMethod&token=' + getURLVar('token') + '&order_id=' + order_id + '&method=' + method);
	
	setTimeout(function(){
		$('#button-customer').trigger('click');
	}, 500)
	setTimeout(function(){
		$('#button-cart').trigger('click');
	}, 1000)
	setTimeout(function(){
	$('#button-payment-address').trigger('click');
	}, 1500)
	setTimeout(function(){
		$('#button-shipping-address').trigger('click');
	}, 2000)	
}

function updateOrderData(order_id, type){	
	$('#modal-order').modal('show');
		
	$('#modal-order').on('hide.bs.modal', function() {
		$('#content-order').empty();
	});
	
	$('#content-order').load('index.php?route=editors/catalog_edit/update_order_' + type  + '&token=' + getURLVar('token') + '&order_id=' + order_id);
}

function deleteProduct(order_product_id, order_id){	
	var text_confirm = $('#text-confirm').val();
	var type = 'order_product_delete';

	if (confirm(text_confirm)) {
		$.ajax({
			url: 'index.php?route=editors/catalog_edit/catalog&token=' + getURLVar('token') + '&order_id=' + order_id + '&order_product_id=' + order_product_id + '&type=' + type,
			type: 'get',
			dataType: 'json',
			success: function(json) {
				if (json['error']) {
					$('.messages-body').html('<div class="alert alert-danger alert-messages"><i class="fa fa-check-circle"></i> ' + json['error'] + '</div>');$('.maxy-backdrop, .messages-body').show().delay(1500).fadeOut(500);
				}
					
				if (json['success']) {
					$('.messages-body').html('<div class="alert alert-success alert-messages"><i class="fa fa-check-circle"></i> ' + json['success'] + '</div>');$('.maxy-backdrop, .messages-body').show().delay(1500).fadeOut(500);	
					
					$('#order-products').load('index.php?route=editors/catalog_edit/order_products&token=' + getURLVar('token') + '&order_id=' + order_id);
				}
			}
		});	
	}
}

function addOrderProduct(order_id){		
	var type = 'order_product_add';
	
	$.ajax({		
		url: 'index.php?route=editors/catalog_edit/catalog&token=' + getURLVar('token') + '&order_id=' + order_id + '&type=' + type,
		type: 'post',
		dataType: 'json',
		data: $('#product input[name=\'product_id\'], #product input[name=\'quantity\'], #product input[name^=\'option\'][type=\'text\'], #product input[name^=\'option\'][type=\'hidden\'], #product input[name^=\'option\'][type=\'radio\']:checked, #product input[name^=\'option\'][type=\'checkbox\']:checked, #product select[name^=\'option\'], #product textarea[name^=\'option\']'),
		beforeSend: function() {
			$('#button-add-product').button('loading');
		},
		complete: function() {
			$('#button-add-product').button('reset');
		},
		success: function(json) {
			$('.alert, .text-danger').remove();
			$('.form-group').removeClass('has-error');
			
			if (json['error']) {
				$('.messages-body').html('<div class="alert alert-danger alert-messages"><i class="fa fa-check-circle"></i> ' + json['error'] + '</div>');$('.maxy-backdrop, .messages-body').show().delay(1500).fadeOut(500);
				
				if (json['error']['option']) {
					$('.alert, .text-danger').remove();
					$('.maxy-backdrop, .messages-body').hide().delay(0).fadeOut(0);
					
					for (i in json['error']['option']) {
						var element = $('#input-option' + i.replace('_', '-'));
						
						if (element.parent().hasClass('input-group')) {
							element.parent().after('<div class="text-danger">' + json['error']['option'][i] + '</div>');
						} else {
							element.after('<div class="text-danger">' + json['error']['option'][i] + '</div>');
						}
					}
				}

				$('.text-danger').parent().addClass('has-error');
			}
			
			if (json['success']) {
				$('.messages-body').html('<div class="alert alert-success alert-messages"><i class="fa fa-check-circle"></i> ' + json['success'] + '</div>');$('.maxy-backdrop, .messages-body').show().delay(1500).fadeOut(500);	
					
				$('#order-products').load('index.php?route=editors/catalog_edit/order_products&token=' + getURLVar('token') + '&order_id=' + order_id);
					
				$('#product-row-add').addClass('hidden');
				$('#button-add').removeClass('hidden');
				$('#product-row-add input[name=\'product\']').val('');
				$('#product-row-add input[name=\'product_id\']').val('');
				$('#product-row-add input[name=\'quantity\']').val('1');
				$('#product-row-add #option').html('');
			}
		},
		error: function(xhr, ajaxOptions, thrownError) {
			alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
		}
	});
}

function updateOrderProduct(order_product_id, order_id, field){	
	var type = 'order_product_data';
	
	$.ajax({
		url: 'index.php?route=editors/catalog_edit/catalog&token=' + getURLVar('token') + '&order_id=' + order_id + '&order_product_id=' + order_product_id + '&field=' + field + '&type=' + type,
		type: 'post',
		dataType: 'json',
		data: $('#order-product-' + field + '-' + order_product_id + ' input[name="' + field + '"]'),
		success: function(json) {
			if (json['error']) {
				$('.messages-body').html('<div class="alert alert-danger alert-messages"><i class="fa fa-check-circle"></i> ' + json['error'] + '</div>');$('.maxy-backdrop, .messages-body').show().delay(1500).fadeOut(500);
			}
					
			if (json['success']) {
				$('.messages-body').html('<div class="alert alert-success alert-messages"><i class="fa fa-check-circle"></i> ' + json['success'] + '</div>');$('.maxy-backdrop, .messages-body').show().delay(1500).fadeOut(500);	
					
				$('#close-' + field + '-' + order_product_id).trigger('click');
				
				$('#order-products').load('index.php?route=editors/catalog_edit/order_products&token=' + getURLVar('token') + '&order_id=' + order_id);
			}
		}
	});
}

function updateOrderProductTitle(order_product_id, order_id, field){	
	var type = 'order_product_title';
	
	$.ajax({
		url: 'index.php?route=editors/catalog_edit/catalog&token=' + getURLVar('token') + '&order_id=' + order_id + '&order_product_id=' + order_product_id + '&field=' + field + '&type=' + type,
		type: 'post',
		dataType: 'json',
		data: $('#order-product-' + field + '-' + order_product_id + ' input[name="' + field + '"]'),
		success: function(json) {
			if (json['error']) {
				$('.messages-body').html('<div class="alert alert-danger alert-messages"><i class="fa fa-check-circle"></i> ' + json['error'] + '</div>');$('.maxy-backdrop, .messages-body').show().delay(1500).fadeOut(500);
			}
					
			if (json['success']) {
				$('.messages-body').html('<div class="alert alert-success alert-messages"><i class="fa fa-check-circle"></i> ' + json['success'] + '</div>');$('.maxy-backdrop, .messages-body').show().delay(1500).fadeOut(500);	
					
				$('#close-' + field + '-' + order_product_id).trigger('click');
				
				$('#order-products').load('index.php?route=editors/catalog_edit/order_products&token=' + getURLVar('token') + '&order_id=' + order_id);
			}
		}
	});
}

function orderClear(order_product_id, field){	
	$('#order-product-' + field + '-' + order_product_id + ' input[name="' + field + '"]').val('');
}

$(document).ready(function() {	
	$('#show-add-product').on('click', function() {
		$('.alert, .text-danger').remove();
		$('#product-row-add').removeClass('hidden');
		$('#button-add').addClass('hidden');
	});

	$('#product-add-cancel').on('click', function() {
		$('#product-row-add').addClass('hidden');
		$('#button-add').removeClass('hidden');
		$('#product-row-add input[name=\'product\']').val('');
		$('#product-row-add input[name=\'product_id\']').val('');
		$('#product-row-add input[name=\'quantity\']').val('1');
		$('#product-row-add #option').html('');	
	});
});