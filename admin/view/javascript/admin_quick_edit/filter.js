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

function getName(filter_group_id) {
	$('#filter-name-content-' + filter_group_id).load('index.php?route=editors/catalog_edit/getFilterName&token=' + getURLVar('token') + '&filter_group_id=' + filter_group_id);
}

function editSort(filter_group_id) {
	var sort_order = $('#input-sort' + filter_group_id).val();
	var type = 'filter_sort_order';	
							
	$.ajax({
		url: 'index.php?route=editors/catalog_edit/catalog&token=' + getURLVar('token') + '&filter_group_id=' + filter_group_id + '&sort_order=' + sort_order + '&type=' + type,
		type: 'post',
		dataType: 'json',
		success: function(json) {									
			if (json['error']) {								
				$('.messages-body').html('<div class="alert alert-danger alert-messages"><i class="fa fa-check-circle"></i> ' + json['error'] + '</div>');$('.maxy-backdrop, .messages-body').show().delay(1500).fadeOut(500);
			}
									
			if (json['success']) {
				$('.messages-body').html('<div class="alert alert-success alert-messages"><i class="fa fa-check-circle"></i> ' + json['success'] + '</div>');$('.maxy-backdrop, .messages-body').show().delay(1000).fadeOut(500);			
				
				if (sort_order != '') {
					$('#filter-sort' + filter_group_id).html(sort_order);
				} else {
					$('#filter-sort' + filter_group_id).html('0');
				}

				$('#close-sort-' + filter_group_id).trigger('click');
			}
		}
	});
}

function sortClear(filter_group_id) {
	$('#input-sort' + filter_group_id).val('');
}

function editFilterValue(filter_group_id) {	
	$('#modal-filter-edit').modal('show');
		
	$('#modal-filter-edit').on('hide.bs.modal', function() {
		$('#modal-filter-content').empty();
	});
	
	$('#modal-filter-content').load('index.php?route=editors/catalog_edit/editFilterValue&token=' + getURLVar('token') + '&filter_group_id=' + filter_group_id);
}