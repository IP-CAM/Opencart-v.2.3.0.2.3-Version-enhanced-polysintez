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

$(document).ready(function() {
	$('.ajax-top-menu').on('click', function() { 
		var object_id = $(this).attr('id');
		var permission = $('#category-permission').val();	
		var error_permission = $('#category-error-permission').val();
		var type = 'category_top';

		if (permission) {
			$.ajax({
				url: 'index.php?route=editors/catalog_edit/catalog&token=' + getURLVar('token') + '&type=' + type,
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
	
	$('.ajax-status').on('click', function() { 
		var object_id = $(this).attr('id');
		var permission = $('#category-permission').val();	
		var error_permission = $('#category-error-permission').val();
		var type = 'category_status';

		if (permission) {
			$.ajax({
				url: 'index.php?route=editors/catalog_edit/catalog&token=' + getURLVar('token') + '&type=' + type,
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
});

function linkImage(category_id) {
	var element = $('#category-image-' + category_id);
	
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

function editImage(category_id) {
	var image = $('#category-image').val();
	var type = 'category_image';
	
	$.ajax({
		url: 'index.php?route=editors/catalog_edit/catalog&token=' + getURLVar('token') + '&category_id=' + category_id + '&image=' + image + '&type=' + type,
		type: 'post',
		dataType: 'json',
		success: function(json) {									
			if (json['error']) {								
				$('.messages-body').html('<div class="alert alert-danger alert-messages"><i class="fa fa-check-circle"></i> ' + json['error'] + '</div>');$('.maxy-backdrop, .messages-body').show().delay(1500).fadeOut(500);
			}
									
			if (json['success']) {
				$('.messages-body').html('<div class="alert alert-success alert-messages"><i class="fa fa-check-circle"></i> ' + json['success'] + '</div>');$('.maxy-backdrop, .messages-body').show().delay(1000).fadeOut(500);			
								
				$('#category-image' + category_id).load('index.php?route=editors/catalog_edit/loadCategoryImage&token=' + getURLVar('token') + '&category_id=' + category_id);
				$('#close-image-' + category_id).trigger('click');
			}
		}	
	});
	
	$('#category-image-' + category_id).on('hide.bs.modal', function () {
		$('#category-image').attr('value', '');
	});
}

function imageClear(category_id) {
	var placeholder = $('#category-placeholder').val();
	
	$('#category-image-' + category_id).find('a').find('img').attr('src', placeholder);
	$('#category-image').attr('value', placeholder);
}

function getName(category_id) {
	$('#category-name-content-' + category_id).load('index.php?route=editors/catalog_edit/getCategoryName&token=' + getURLVar('token') + '&category_id=' + category_id);
}

function editSort(category_id) {
	var sort_order = $('#input-sort' + category_id).val();
	var type = 'category_sort_order';
							
	$.ajax({
		url: 'index.php?route=editors/catalog_edit/catalog&token=' + getURLVar('token') + '&category_id=' + category_id + '&sort_order=' + sort_order + '&type=' + type,
		type: 'post',
		dataType: 'json',
		success: function(json) {									
			if (json['error']) {								
				$('.messages-body').html('<div class="alert alert-danger alert-messages"><i class="fa fa-check-circle"></i> ' + json['error'] + '</div>');$('.maxy-backdrop, .messages-body').show().delay(1500).fadeOut(500);
			}
									
			if (json['success']) {
				$('.messages-body').html('<div class="alert alert-success alert-messages"><i class="fa fa-check-circle"></i> ' + json['success'] + '</div>');$('.maxy-backdrop, .messages-body').show().delay(1000).fadeOut(500);			
				
				if (sort_order != '') {
					$('#category-sort' + category_id).html(sort_order);
				} else {
					$('#category-sort' + category_id).html('0');
				}

				$('#close-sort-' + category_id).trigger('click');
			}
		}
	});
}

function sortClear(category_id) {
	$('#input-sort' + category_id).val('');
}

function editMore(category_id, val) {	
	$('#category-more-' + category_id).popoverMaxy('hide');
	$('#modal-category-edit').modal('show');
		
	$('#modal-category-edit').on('hide.bs.modal', function() {
		$('#modal-category-content').empty();
	});
	
	$('#modal-category-content').load('index.php?route=editors/catalog_edit/edit_category_' + val + '&token=' + getURLVar('token') + '&category_id=' + category_id);
}