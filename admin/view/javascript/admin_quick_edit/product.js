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

function filter() {
	var url = 'index.php?route=editors/product&token=' + getURLVar('token');

	var filter_name = $('input[name=\'filter_name\']').val();

	if (filter_name) {
		url += '&filter_name=' + encodeURIComponent(filter_name);
	}

	var filter_model = $('input[name=\'filter_model\']').val();

	if (filter_model) {
		url += '&filter_model=' + encodeURIComponent(filter_model);
	}
	
	var filter_sku = $('input[name=\'filter_sku\']').val();

	if (filter_sku) {
		url += '&filter_sku=' + encodeURIComponent(filter_sku);
	}
	
	var filter_location = $('input[name=\'filter_location\']').val();

	if (filter_location) {
		url += '&filter_location=' + encodeURIComponent(filter_location);
	}
	
	var filter_category_id = $('input[name=\'filter_category_id\']').val();

	if (filter_category_id) {
		url += '&filter_category_id=' + encodeURIComponent(filter_category_id);
	}
	
	var filter_manufacturer_id = $('input[name=\'filter_manufacturer_id\']').val();

	if (filter_manufacturer_id) {
		url += '&filter_manufacturer_id=' + encodeURIComponent(filter_manufacturer_id);
	}
	
	var filter_attribute_id = $('input[name=\'filter_attribute_id\']').val();

	if (filter_attribute_id) {
		url += '&filter_attribute_id=' + encodeURIComponent(filter_attribute_id);
	}
	
	var filter_filter_id = $('input[name=\'filter_filter_id\']').val();

	if (filter_filter_id) {
		url += '&filter_filter_id=' + encodeURIComponent(filter_filter_id);
	}

	var filter_price = $('input[name=\'filter_price\']').val();

	if (filter_price) {
		url += '&filter_price=' + encodeURIComponent(filter_price);
	}

	var filter_quantity = $('input[name=\'filter_quantity\']').val();

	if (filter_quantity) {
		url += '&filter_quantity=' + encodeURIComponent(filter_quantity);
	}
	
	var filter_sort_order = $('input[name=\'filter_sort_order\']').val();

	if (filter_sort_order) {
		url += '&filter_sort_order=' + encodeURIComponent(filter_sort_order);
	}

	var filter_status = $('select[name=\'filter_status\']').val();

	if (filter_status != '*') {
		url += '&filter_status=' + encodeURIComponent(filter_status);
	}
	
	var filter_image = $('select[name=\'filter_image\']').val();

	if (filter_image != '*') {
		url += '&filter_image=' + encodeURIComponent(filter_image);
	}

	location = url;
}

$(document).ready(function() {
	var text_all_categories = $('#product-text-all-categories').val();
	var text_all_brands = $('#product-text-all-brands').val();
	var text_all_attributes = $('#product-text-all-attributes').val();
	var text_all_filters = $('#product-text-all-filters').val();
	var text_no_category = $('#product-text-no-category').val();
	var text_no_brand = $('#product-text-no-brand').val();
	var text_no_attribute = $('#product-text-no-attribute').val();
	var text_no_filter = $('#product-text-no-filter').val();
	
	$('input[name=\'filter_name\']').autocomplete({
		'source': function(request, response) {
			$.ajax({
				url: 'index.php?route=editors/product/autocomplete&token=' + getURLVar('token') + '&filter_name=' +  encodeURIComponent(request),
				dataType: 'json',
				success: function(json) {
					response($.map(json, function(item) {
						return {
							label: item['name'],
							value: item['product_id']
						}
					}));
				}
			});
		},
		'select': function(item) {
			$('input[name=\'filter_name\']').val(item['label']);
		}
	});

	$('input[name=\'filter_model\']').autocomplete({
		'source': function(request, response) {
			$.ajax({
				url: 'index.php?route=editors/product/autocomplete_model&token=' + getURLVar('token') + '&filter_model=' +  encodeURIComponent(request),
				dataType: 'json',
				success: function(json) {
					response($.map(json, function(item) {
						return {
							label: item['model'],
							value: item['product_id']
						}
					}));
				}
			});
		},
		'select': function(item) {
			$('input[name=\'filter_model\']').val(item['label']);
		}
	});

	$('input[name=\'filter_sku\']').autocomplete({
		'source': function(request, response) {
			$.ajax({
				url: 'index.php?route=editors/product/autocomplete_sku&token=' + getURLVar('token') + '&filter_sku=' +  encodeURIComponent(request),
				dataType: 'json',
				success: function(json) {
					response($.map(json, function(item) {
						return {
							label: item['sku'],
							value: item['product_id']
						}
					}));
				}
			});
		},
		'select': function(item) {
			$('input[name=\'filter_sku\']').val(item['label']);
		}
	});

	$('input[name=\'filter_location\']').autocomplete({
		'source': function(request, response) {
			$.ajax({
				url: 'index.php?route=editors/product/autocomplete_location&token=' + getURLVar('token') + '&filter_location=' +  encodeURIComponent(request),
				dataType: 'json',
				success: function(json) {
					response($.map(json, function(item) {
						return {
							label: item['location'],
							value: item['product_id']
						}
					}));
				}
			});
		},
		'select': function(item) {
			$('input[name=\'filter_location\']').val(item['label']);
		}
	});

	$('input[name=\'filter_category\']').autocomplete({
		'source': function(request, response) {
			$.ajax({
				url: 'index.php?route=editors/category/autocomplete&token=' + getURLVar('token') + '&filter_name=' +  encodeURIComponent(request),
				dataType: 'json',
				success: function(json) {
					json.unshift({
						category_id: '*',
						name: text_no_category
					});	
					
					json.unshift({
						category_id: 0,
						name: text_all_categories
					});	
					
					response($.map(json, function(item) {
						return {
							label: item['name'],
							value: item['category_id']
						}
					}));
				}
			});
		},
		'select': function(item) {
			$('input[name=\'filter_category\']').val(item['label']);
			$('input[name=\'filter_category_id\']').val(item['value']);
		}
	});

	$('input[name=\'filter_manufacturer\']').autocomplete({
		'source': function(request, response) {
			$.ajax({
				url: 'index.php?route=editors/manufacturer/autocomplete&token=' + getURLVar('token') + '&filter_name=' +  encodeURIComponent(request),
				dataType: 'json',
				success: function(json) {					
					json.unshift({
						manufacturer_id: '*',
						name: text_no_brand
					});	
					
					json.unshift({
						manufacturer_id: 0,
						name: text_all_brands
					});	
					
					response($.map(json, function(item) {
						return {
							label: item['name'],
							value: item['manufacturer_id']
						}
					}));
				}
			});
		},
		'select': function(item) {
			$('input[name=\'filter_manufacturer\']').val(item['label']);
			$('input[name=\'filter_manufacturer_id\']').val(item['value']);
		}
	});

	$('input[name=\'filter_attribute\']').autocomplete({
		'source': function(request, response) {
			$.ajax({
				url: 'index.php?route=editors/attribute/autocomplete&token=' + getURLVar('token') + '&filter_name=' +  encodeURIComponent(request),
				dataType: 'json',
				success: function(json) {
					json.unshift({
						attribute_id: '*',
						name: text_no_attribute
					});	
					
					json.unshift({
						attribute_id: 0,
						name: text_all_attributes
					});	
					
					response($.map(json, function(item) {
						return {
							label: item['name'],
							value: item['attribute_id']
						}
					}));
				}
			});
		},
		'select': function(item) {
			$('input[name=\'filter_attribute\']').val(item['label']);
			$('input[name=\'filter_attribute_id\']').val(item['value']);
		}
	});

	$('input[name=\'filter_filter\']').autocomplete({
		'source': function(request, response) {
			$.ajax({
				url: 'index.php?route=editors/filter/autocomplete&token=' + getURLVar('token') + '&filter_name=' +  encodeURIComponent(request),
				dataType: 'json',
				success: function(json) {
					json.unshift({
						filter_id: '*',
						name: text_no_filter
					});	
					
					json.unshift({
						filter_id: 0,
						name: text_all_filters
					});	
					
					response($.map(json, function(item) {
						return {
							label: item['name'],
							value: item['filter_id']
						}
					}));
				}
			});
		},
		'select': function(item) {
			$('input[name=\'filter_filter\']').val(item['label']);
			$('input[name=\'filter_filter_id\']').val(item['value']);
		}
	});
	
	$('.ajax-status').on('click', function() { 
		var object_id = $(this).attr('id');
		var permission = $('#product-permission').val();	
		var error_permission = $('#product-error-permission').val();
		var type = 'product_status';

		if (permission) {
			$.ajax({
				url: 'index.php?route=editors/product_edit/product&token=' + getURLVar('token') + '&type=' + type,
				type: 'get',
				data: {object_id:object_id},
				dataType: 'html',
				success: function(html) {
					if(html!=''){				
						$('#'+object_id).html(html);
					}
				}
			});
		} else {
			$('.messages-body').html('<div class="alert alert-danger alert-messages"><i class="fa fa-check-circle"></i> ' + error_permission + '</div>');$('.maxy-backdrop, .messages-body').show().delay(1500).fadeOut(500);
		}
	});
	
	$('#btn-codes').on('click', function() {	
		var text_hide = $('#text-hide').val();
		var text_show = $('#text-show').val();
		
		$('#form-group-codes').slideToggle(300);
		$(this).toggleClass('show');                                  
		if ($(this).hasClass('show')) {
			$(this).find('i').replaceWith('<i class="fa fa-chevron-up"></i>');
			$('#btn-codes').removeClass('btn-info');
			$('#btn-codes').addClass('btn-primary');
			$('#text-codes').html(text_hide);
		} else {
			$(this).find('i').replaceWith('<i class="fa fa-chevron-down"></i>');
			$('#btn-codes').removeClass('btn-primary');
			$('#btn-codes').addClass('btn-info');
			$('#text-codes').html(text_show);
		}
	});
	
	$('.product-list-title input[type=\'checkbox\'], #product-list input[type=\'checkbox\']').on('change', function() {
		if ($('#product-list input[type=\'checkbox\']:checked').val()) {
			$('.table-selector').find('select').prop('disabled', false);
			$('.table-selector').find('select').selectpicker('refresh');	
			$('.selector-left .input-group-addon').removeClass('input-group-edit');
			$('.selector-left .input-group-addon').addClass('input-group-edit-active');			
			$('.selector-right .input-group-addon').removeClass('input-group-delete');
			$('.selector-right .input-group-addon').addClass('input-group-delete-active');
		} else {
			$('.table-selector').find('select').prop('disabled', true);
			$('.table-selector').find('select').selectpicker('refresh');
			$('.table-selector').find('select').selectpicker('val', '0');			
			$('.selector-left .input-group-addon').removeClass('input-group-edit-active');
			$('.selector-left .input-group-addon').addClass('input-group-edit');			
			$('.selector-right .input-group-addon').removeClass('input-group-delete-active');
			$('.selector-right .input-group-addon').addClass('input-group-delete');
		}
	});

	$('#top-mass-edit-data').on('change', function() {
		$('#bottom-mass-edit-data').selectpicker('val', $('#top-mass-edit-data').val());
	});
	
	$('#bottom-mass-edit-data').on('change', function() {
		$('#top-mass-edit-data').selectpicker('val', $('#bottom-mass-edit-data').val());
	});
	
	$('#top-mass-edit-data, #bottom-mass-edit-data').on('change', function() {
		var error_select_product = $('#error-select-product').val();
		var permission = $('#product-permission').val();	
		var error_permission = $('#product-error-permission').val();
		
		if (permission) {
			if ($('#product-list input[type=\'checkbox\']:checked').val()) {	
				$('.product-list-title input[type=\'checkbox\']').prop('checked', false);		
				$('#modal-product-edit').modal('show');
				$('#modal-product-edit').on('hide.bs.modal', function() {
					$('#modal-product-content').empty();
					$('.product-list-title input[type=\'checkbox\']').prop('checked', false);
					$('#product-list input[type=\'checkbox\']').prop('checked', false);
					$('.table-selector').find('select').prop('disabled', true);
					$('.table-selector').find('select').selectpicker('refresh');
					$('.table-selector').find('select').selectpicker('val', '0');
					$('.selector-left .input-group-addon').addClass('input-group-edit');
					$('.selector-right .input-group-addon').addClass('input-group-delete');
				});
				$('#modal-product-content').load('index.php?route=editors/product_edit/edit_mass_' + $(this).val() + '&token=' + getURLVar('token'));
			} else {
				$('.messages-body').html('<div class="alert alert-danger alert-messages"><i class="fa fa-check-circle"></i> ' + error_select_product + '</div>');$('.maxy-backdrop, .messages-body').show().delay(1500).fadeOut(500);
			}
		} else {
			$('.messages-body').html('<div class="alert alert-danger alert-messages"><i class="fa fa-check-circle"></i> ' + error_permission + '</div>');$('.maxy-backdrop, .messages-body').show().delay(1500).fadeOut(500);
			$('.product-list-title input[type=\'checkbox\']').prop('checked', false);
			$('#product-list input[type=\'checkbox\']').prop('checked', false);
			$('.table-selector').find('select').prop('disabled', true);
			$('.table-selector').find('select').selectpicker('refresh');
			$('.table-selector').find('select').selectpicker('val', '0');
			$('.selector-left .input-group-addon').addClass('input-group-edit');
			$('.selector-right .input-group-addon').addClass('input-group-delete');
		}
	});
	
	$('#top-mass-delete-data').on('change', function() {
		$('#bottom-mass-delete-data').selectpicker('val', $('#top-mass-delete-data').val());
	});
	
	$('#bottom-mass-delete-data').on('change', function() {
		$('#top-mass-delete-data').selectpicker('val', $('#bottom-mass-delete-data').val());
	});
});

function massDelete(del_val) {
	var error_select_product = $('#error-select-product').val();
	var permission = $('#product-permission').val();	
	var error_permission = $('#product-error-permission').val();
	var text_confirm = $('#text-confirm').val();
	var type = 'mass_delete';
	
	if (permission) {
		if ($('#product-list input[type=\'checkbox\']:checked').val()) {	
			if (confirm(text_confirm)) {
				$.ajax({
					url: 'index.php?route=editors/product_edit/product&token=' + getURLVar('token') + '&del_val=' + del_val + '&type=' + type,
					type: 'post',
					dataType: 'json',
					data: $('#product-list input[type=\'checkbox\']:checked'),
					success: function(json) {
						if (json['error']) {
							$('.messages-body').html('<div class="alert alert-danger alert-messages"><i class="fa fa-check-circle"></i> ' + json['error'] + '</div>');$('.maxy-backdrop, .messages-body').show().delay(1500).fadeOut(500);
						}

						if (json['success']) {
							$('.messages-body').html('<div class="alert alert-success alert-messages"><i class="fa fa-check-circle"></i> ' + json['success'] + '</div>');$('.maxy-backdrop, .messages-body').show().delay(1500).fadeOut(500);						
															
							if (del_val == 'name' || del_val == 'image' || del_val == 'model' || del_val == 'price' || del_val == 'quantity' || del_val == 'sort_order' || del_val == 'manufacturer' || del_val == 'category' || del_val == 'special' || del_val == 'products') {
								setTimeout(function(){
									location.reload(true);
								}, 1000)
							} else {
								$('.product-list-title input[type=\'checkbox\']').prop('checked', false);
								$('#product-list input[type=\'checkbox\']').prop('checked', false);
								$('.table-selector').find('select').prop('disabled', true);
								$('.table-selector').find('select').selectpicker('refresh');
								$('.table-selector').find('select').selectpicker('val', '0');
								$('.selector-left .input-group-addon').addClass('input-group-edit');
								$('.selector-right .input-group-addon').addClass('input-group-delete');
							}
						}
					}
				});
			} else {
				$('.product-list-title input[type=\'checkbox\']').prop('checked', false);
				$('#product-list input[type=\'checkbox\']').prop('checked', false);
				$('.table-selector').find('select').prop('disabled', true);
				$('.table-selector').find('select').selectpicker('refresh');
				$('.table-selector').find('select').selectpicker('val', '0');
				$('.selector-left .input-group-addon').addClass('input-group-edit');
				$('.selector-right .input-group-addon').addClass('input-group-delete');
			}				
		} else {
			$('.messages-body').html('<div class="alert alert-danger alert-messages"><i class="fa fa-check-circle"></i> ' + error_select_product + '</div>');$('.maxy-backdrop, .messages-body').show().delay(1500).fadeOut(500);
		}
	} else {
		$('.messages-body').html('<div class="alert alert-danger alert-messages"><i class="fa fa-check-circle"></i> ' + error_permission + '</div>');$('.maxy-backdrop, .messages-body').show().delay(1500).fadeOut(500);
	}
}  

function linkImage(product_id) {
	var element = $('#product-image-' + product_id);
	
	$('#modal-image').remove();
	$.ajax({
		url: 'index.php?route=common/filemanager&token=' + getURLVar('token') + '&target=' + $(element).find('input').attr('id') + '&thumb=' + $(element).attr('id'),
		dataType: 'html',
		success: function(html) {
			$('body').append('<div id="modal-image" class="modal">' + html + '</div>');

			$('#modal-image').modal('show');
		}
	});
}

function editImage(product_id) {
	var image = $('#product-image').val();
	var type = 'product_image';
	
	$.ajax({
		url: 'index.php?route=editors/product_edit/product&token=' + getURLVar('token') + '&product_id=' + product_id + '&image=' + image + '&type=' + type,
		type: 'post',
		dataType: 'json',
		success: function(json) {									
			if (json['error']) {								
				$('.messages-body').html('<div class="alert alert-danger alert-messages"><i class="fa fa-check-circle"></i> ' + json['error'] + '</div>');$('.maxy-backdrop, .messages-body').show().delay(1500).fadeOut(500);
			}
									
			if (json['success']) {
				$('.messages-body').html('<div class="alert alert-success alert-messages"><i class="fa fa-check-circle"></i> ' + json['success'] + '</div>');$('.maxy-backdrop, .messages-body').show().delay(1000).fadeOut(500);			
								
				$('#product-image' + product_id).load('index.php?route=editors/product_edit/loadImage&token=' + getURLVar('token') + '&product_id=' + product_id);
				$('#close-image-' + product_id).trigger('click');
			}
		}
	});
	
	$('#product-image-' + product_id).on('hide.bs.modal', function () {
		$('#product-image').attr('value', '');
	});
}

function imageClear(product_id) {
	var placeholder = $('#product-placeholder').val();
	
	$('#product-image-' + product_id).find('a').find('img').attr('src', placeholder);
	$('#product-image').attr('value', placeholder);
}

function getName(product_id) {
	$('#product-name-content-' + product_id).load('index.php?route=editors/product_edit/getProductName&token=' + getURLVar('token') + '&product_id=' + product_id);
}

function getCategory(product_id) {
	$('#product-category-content-' + product_id).load('index.php?route=editors/product_edit/getProductCategory&token=' + getURLVar('token') + '&product_id=' + product_id);
}

function getManufacturer(product_id) {
	$('#product-manufacturer-content-' + product_id).load('index.php?route=editors/product_edit/getProductManufacturer&token=' + getURLVar('token') + '&product_id=' + product_id);
}

function editModel(product_id) {
	var model = $('#input-model' + product_id).val();
	var without = $('#text-without').val();
	var type = 'product_model';
							
	$.ajax({
		url: 'index.php?route=editors/product_edit/product&token=' + getURLVar('token') + '&product_id=' + product_id + '&model=' + model + '&type=' + type,
		type: 'post',
		dataType: 'json',
		success: function(json) {									
			if (json['error']) {								
				$('.messages-body').html('<div class="alert alert-danger alert-messages"><i class="fa fa-check-circle"></i> ' + json['error'] + '</div>');$('.maxy-backdrop, .messages-body').show().delay(1500).fadeOut(500);
			}
									
			if (json['success']) {
				$('.messages-body').html('<div class="alert alert-success alert-messages"><i class="fa fa-check-circle"></i> ' + json['success'] + '</div>');$('.maxy-backdrop, .messages-body').show().delay(1000).fadeOut(500);			
				
				if (model) {
					$('#product-model' + product_id).html(model);
				} else {
					$('#product-model' + product_id).html(without);
				}

				$('#close-model-' + product_id).trigger('click');
			}
		}
	});
}

function modelClear(product_id) {
	$('#input-model' + product_id).val('');
}

function editQuantity(product_id) {
	var quantity = $('#input-quantity' + product_id).val();
	var type = 'product_quantity';
							
	$.ajax({
		url: 'index.php?route=editors/product_edit/product&token=' + getURLVar('token') + '&product_id=' + product_id + '&quantity=' + quantity + '&type=' + type,
		type: 'post',
		dataType: 'json',
		success: function(json) {									
			$('#product-quantity' + product_id).removeClass('btn-danger');
			$('#product-quantity' + product_id).removeClass('btn-warning');
			$('#product-quantity' + product_id).removeClass('btn-info');
			$('#product-quantity' + product_id).removeClass('btn-primary');
			$('#product-quantity' + product_id).removeClass('btn-success');
			$('#product-quantity' + product_id).removeClass('btn-default');
			
			if (json['error']) {								
				$('.messages-body').html('<div class="alert alert-danger alert-messages"><i class="fa fa-check-circle"></i> ' + json['error'] + '</div>');$('.maxy-backdrop, .messages-body').show().delay(1500).fadeOut(500);
			}
									
			if (json['success']) {
				$('.messages-body').html('<div class="alert alert-success alert-messages"><i class="fa fa-check-circle"></i> ' + json['success'] + '</div>');$('.maxy-backdrop, .messages-body').show().delay(1000).fadeOut(500);			
				
				if (quantity == '' || quantity <= 0) {
					$('#product-quantity' + product_id).addClass('btn-danger').html('0');
				} else if (quantity <= 4) {
					$('#product-quantity' + product_id).addClass('btn-warning').html(quantity);
				} else if (quantity <= 9) {
					$('#product-quantity' + product_id).addClass('btn-info').html(quantity);
				} else if (quantity <= 14) {
					$('#product-quantity' + product_id).addClass('btn-primary').html(quantity);
				} else if (quantity <= 19) {
					$('#product-quantity' + product_id).addClass('btn-success').html(quantity);
				} else {
					$('#product-quantity' + product_id).addClass('btn-default').html(quantity);
				}	

				$('#close-quantity-' + product_id).trigger('click');
			}
		}
	});
}

function quantityClear(product_id) {
	$('#input-quantity' + product_id).val('');
}

function editPrice(product_id) {
	var price = $('#input-price' + product_id).val();	
	var type = 'product_price';
							
	$.ajax({
		url: 'index.php?route=editors/product_edit/product&token=' + getURLVar('token') + '&product_id=' + product_id + '&price=' + price + '&type=' + type,
		type: 'post',
		dataType: 'json',
		success: function(json) {								
			if (json['error']) {								
				$('.messages-body').html('<div class="alert alert-danger alert-messages"><i class="fa fa-check-circle"></i> ' + json['error'] + '</div>');$('.maxy-backdrop, .messages-body').show().delay(1500).fadeOut(500);
			}
									
			if (json['success']) {
				$('.messages-body').html('<div class="alert alert-success alert-messages"><i class="fa fa-check-circle"></i> ' + json['success'] + '</div>');$('.maxy-backdrop, .messages-body').show().delay(1000).fadeOut(500);			
				
				$('#product-price' + product_id).load('index.php?route=editors/product_edit/loadPrice&token=' + getURLVar('token') + '&product_id=' + product_id);	

				$('#close-price-' + product_id).trigger('click');
			}
		},
        error: function(xhr, ajaxOptions, thrownError) {
            alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
        }
	});
}

function priceClear(product_id) {
	$('#input-price' + product_id).val('');
}

function editSort(product_id) {
	var sort_order = $('#input-sort' + product_id).val();
	var type = 'product_sort_order';
							
	$.ajax({
		url: 'index.php?route=editors/product_edit/product&token=' + getURLVar('token') + '&product_id=' + product_id + '&sort_order=' + sort_order + '&type=' + type,
		type: 'post',
		dataType: 'json',
		success: function(json) {									
			if (json['error']) {								
				$('.messages-body').html('<div class="alert alert-danger alert-messages"><i class="fa fa-check-circle"></i> ' + json['error'] + '</div>');$('.maxy-backdrop, .messages-body').show().delay(1500).fadeOut(500);
			}
									
			if (json['success']) {
				$('.messages-body').html('<div class="alert alert-success alert-messages"><i class="fa fa-check-circle"></i> ' + json['success'] + '</div>');$('.maxy-backdrop, .messages-body').show().delay(1000).fadeOut(500);			
				
				if (sort_order != '') {
					$('#product-sort' + product_id).html(sort_order);
				} else {
					$('#product-sort' + product_id).html('0');
				}

				$('#close-sort-' + product_id).trigger('click');
			}
		}
	});
}

function sortClear(product_id) {
	$('#input-sort' + product_id).val('');
}

function editMore(product_id, val) {	
	$('#product-more-' + product_id).popoverMaxy('hide');
	$('#modal-product-edit').modal('show');
		
	$('#modal-product-edit').on('hide.bs.modal', function() {
		$('#modal-product-content').empty();
	});
	
	$('#modal-product-content').load('index.php?route=editors/product_edit/edit_' + val + '&token=' + getURLVar('token') + '&product_id=' + product_id);
}

function closeMore(product_id) {	
	$('#product-more-' + product_id).popoverMaxy('hide');
}

function editProductSetting(val) {
	$('#modal-product-edit').modal('show');
		
	$('#modal-product-edit').on('hide.bs.modal', function() {
		$('#modal-product-content').empty();
	});
	
	$('#modal-product-content').load('index.php?route=editors/product_edit/product_settings_' + val + '&token=' + getURLVar('token'));
}