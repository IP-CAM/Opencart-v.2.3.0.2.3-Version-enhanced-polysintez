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

function linkImage(manufacturer_id) {
	var element = $('#manufacturer-image-' + manufacturer_id);
	
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

function editImage(manufacturer_id) {
	var image = $('#manufacturer-image').val();
	var type = 'manufacturer_image';
	
	$.ajax({
		url: 'index.php?route=editors/catalog_edit/catalog&token=' + getURLVar('token') + '&manufacturer_id=' + manufacturer_id + '&image=' + image + '&type=' + type,
		type: 'post',
		dataType: 'json',
		success: function(json) {									
			if (json['error']) {								
				$('.messages-body').html('<div class="alert alert-danger alert-messages"><i class="fa fa-check-circle"></i> ' + json['error'] + '</div>');$('.maxy-backdrop, .messages-body').show().delay(1500).fadeOut(500);
			}
									
			if (json['success']) {
				$('.messages-body').html('<div class="alert alert-success alert-messages"><i class="fa fa-check-circle"></i> ' + json['success'] + '</div>');$('.maxy-backdrop, .messages-body').show().delay(1000).fadeOut(500);			
								
				$('#manufacturer-image' + manufacturer_id).load('index.php?route=editors/catalog_edit/loadManufacturerImage&token=' + getURLVar('token') + '&manufacturer_id=' + manufacturer_id);
				$('#close-image-' + manufacturer_id).trigger('click');
			}
		}
	});
	
	$('#manufacturer-image-' + manufacturer_id).on('hide.bs.modal', function () {
		$('#manufacturer-image').attr('value', '');
	});
}

function imageClear(manufacturer_id) {
	var placeholder = $('#manufacturer-placeholder').val();
	
	$('#manufacturer-image-' + manufacturer_id).find('a').find('img').attr('src', placeholder);
	$('#manufacturer-image').attr('value', placeholder);
}

function editName(manufacturer_id) {
	var name = $('#input-name' + manufacturer_id).val();
	var type = 'manufacturer_name';
							
	$.ajax({
		url: 'index.php?route=editors/catalog_edit/catalog&token=' + getURLVar('token') + '&manufacturer_id=' + manufacturer_id + '&name=' + name + '&type=' + type,
		type: 'post',
		dataType: 'json',
		success: function(json) {									
			if (json['error']) {								
				$('.messages-body').html('<div class="alert alert-danger alert-messages"><i class="fa fa-check-circle"></i> ' + json['error'] + '</div>');$('.maxy-backdrop, .messages-body').show().delay(1500).fadeOut(500);
			}
									
			if (json['success']) {
				$('.messages-body').html('<div class="alert alert-success alert-messages"><i class="fa fa-check-circle"></i> ' + json['success'] + '</div>');$('.maxy-backdrop, .messages-body').show().delay(1000).fadeOut(500);			

				$('#manufacturer-name' + manufacturer_id).html(name);

				$('#close-name-' + manufacturer_id).trigger('click');
			}
		}
	});
}

function nameClear(manufacturer_id) {
	$('#input-name' + manufacturer_id).val('');
}

function editSort(manufacturer_id) {
	var sort_order = $('#input-sort' + manufacturer_id).val();
	var type = 'manufacturer_sort_order';
							
	$.ajax({
		url: 'index.php?route=editors/catalog_edit/catalog&token=' + getURLVar('token') + '&manufacturer_id=' + manufacturer_id + '&sort_order=' + sort_order + '&type=' + type,
		type: 'post',
		dataType: 'json',
		success: function(json) {									
			if (json['error']) {								
				$('.messages-body').html('<div class="alert alert-danger alert-messages"><i class="fa fa-check-circle"></i> ' + json['error'] + '</div>');$('.maxy-backdrop, .messages-body').show().delay(1500).fadeOut(500);
			}
									
			if (json['success']) {
				$('.messages-body').html('<div class="alert alert-success alert-messages"><i class="fa fa-check-circle"></i> ' + json['success'] + '</div>');$('.maxy-backdrop, .messages-body').show().delay(1000).fadeOut(500);			
				
				if (sort_order != '') {
					$('#manufacturer-sort' + manufacturer_id).html(sort_order);
				} else {
					$('#manufacturer-sort' + manufacturer_id).html('0');
				}

				$('#close-sort-' + manufacturer_id).trigger('click');
			}
		}
	});
}

function sortClear(manufacturer_id) {
	$('#input-sort' + manufacturer_id).val('');
}

function editMore(manufacturer_id, val) {	
	$('#manufacturer-more-' + manufacturer_id).popoverMaxy('hide');
	$('#modal-manufacturer-edit').modal('show');
		
	$('#modal-manufacturer-edit').on('hide.bs.modal', function() {
		$('#modal-manufacturer-content').empty();
	});
	
	$('#modal-manufacturer-content').load('index.php?route=editors/catalog_edit/edit_manufacturer_' + val + '&token=' + getURLVar('token') + '&manufacturer_id=' + manufacturer_id);
}