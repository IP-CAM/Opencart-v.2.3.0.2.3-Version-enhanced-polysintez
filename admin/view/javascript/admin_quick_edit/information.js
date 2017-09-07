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
	$('.ajax-bottom').on('click', function() { 
		var object_id = $(this).attr('id');
		var permission = $('#information-permission').val();	
		var error_permission = $('#information-error-permission').val();
		var type = 'information_bottom';

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
		var permission = $('#information-permission').val();	
		var error_permission = $('#information-error-permission').val();
		var type = 'information_status';

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

function getTitle(information_id) {
	$('#information-title-content-' + information_id).load('index.php?route=editors/catalog_edit/getInformationTitle&token=' + getURLVar('token') + '&information_id=' + information_id);
}

function editSort(information_id) {
	var sort_order = $('#input-sort' + information_id).val();
	var type = 'information_sort_order';
							
	$.ajax({
		url: 'index.php?route=editors/catalog_edit/catalog&token=' + getURLVar('token') + '&information_id=' + information_id + '&sort_order=' + sort_order + '&type=' + type,
		type: 'post',
		dataType: 'json',
		success: function(json) {									
			if (json['error']) {								
				$('.messages-body').html('<div class="alert alert-danger alert-messages"><i class="fa fa-check-circle"></i> ' + json['error'] + '</div>');$('.maxy-backdrop, .messages-body').show().delay(1500).fadeOut(500);
			}
									
			if (json['success']) {
				$('.messages-body').html('<div class="alert alert-success alert-messages"><i class="fa fa-check-circle"></i> ' + json['success'] + '</div>');$('.maxy-backdrop, .messages-body').show().delay(1000).fadeOut(500);			
				
				if (sort_order != '') {
					$('#information-sort' + information_id).html(sort_order);
				} else {
					$('#information-sort' + information_id).html('0');
				}

				$('#close-sort-' + information_id).trigger('click');
			}
		}
	});
}

function sortClear(information_id) {
	$('#input-sort' + information_id).val('');
}

function editMore(information_id, val) {	
	$('#information-more-' + information_id).popoverMaxy('hide');
	$('#modal-information-edit').modal('show');
		
	$('#modal-information-edit').on('hide.bs.modal', function() {
		$('#modal-information-content').empty();
	});
	
	$('#modal-information-content').load('index.php?route=editors/catalog_edit/edit_information_' + val + '&token=' + getURLVar('token') + '&information_id=' + information_id);
}