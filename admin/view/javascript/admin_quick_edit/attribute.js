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

function getName(attribute_id) {
	$('#attribute-name-content-' + attribute_id).load('index.php?route=editors/catalog_edit/getAttributeName&token=' + getURLVar('token') + '&attribute_id=' + attribute_id);
}

function editAttributeGroup(attribute_id) {
	var selected_attribute_group_id = $('#input-attribute-group' + attribute_id).val();	
	var attribute_group_name = $('#input-attribute-group' + attribute_id).find('option:selected').text(); 
	var type = 'attribute_group';
							
	$.ajax({
		url: 'index.php?route=editors/catalog_edit/catalog&token=' + getURLVar('token') + '&attribute_id=' + attribute_id + '&attribute_group_id=' + selected_attribute_group_id + '&type=' + type,
		type: 'post',
		dataType: 'json',
		success: function(json) {									
			if (json['error']) {								
				$('.messages-body').html('<div class="alert alert-danger alert-messages"><i class="fa fa-check-circle"></i> ' + json['error'] + '</div>');$('.maxy-backdrop, .messages-body').show().delay(1500).fadeOut(500);
			}
									
			if (json['success']) {
				$('.messages-body').html('<div class="alert alert-success alert-messages"><i class="fa fa-check-circle"></i> ' + json['success'] + '</div>');$('.maxy-backdrop, .messages-body').show().delay(1000).fadeOut(500);			
								
				$('#attribute-group' + attribute_id).html(attribute_group_name);
				$('#close-attribute-group-' + attribute_id).trigger('click');
			}
		}
	});
}

function editSort(attribute_id) {
	var sort_order = $('#input-sort' + attribute_id).val();
	var type = 'attribute_sort_order';
							
	$.ajax({
		url: 'index.php?route=editors/catalog_edit/catalog&token=' + getURLVar('token') + '&attribute_id=' + attribute_id + '&sort_order=' + sort_order + '&type=' + type,
		type: 'post',
		dataType: 'json',
		success: function(json) {									
			if (json['error']) {								
				$('.messages-body').html('<div class="alert alert-danger alert-messages"><i class="fa fa-check-circle"></i> ' + json['error'] + '</div>');$('.maxy-backdrop, .messages-body').show().delay(1500).fadeOut(500);
			}
									
			if (json['success']) {
				$('.messages-body').html('<div class="alert alert-success alert-messages"><i class="fa fa-check-circle"></i> ' + json['success'] + '</div>');$('.maxy-backdrop, .messages-body').show().delay(1000).fadeOut(500);			
				
				if (sort_order != '') {
					$('#attribute-sort' + attribute_id).html(sort_order);
				} else {
					$('#attribute-sort' + attribute_id).html('0');
				}

				$('#close-sort-' + attribute_id).trigger('click');
			}
		}
	});
}

function sortClear(attribute_id) {
	$('#input-sort' + attribute_id).val('');
}

function getGroupName(attribute_group_id) {
	$('#attribute-group-name-content-' + attribute_group_id).load('index.php?route=editors/catalog_edit/getAttributeGroupName&token=' + getURLVar('token') + '&attribute_group_id=' + attribute_group_id);
}

function editGroupSort(attribute_group_id) {
	var sort_order = $('#input-sort-group' + attribute_group_id).val();
	var type = 'attribute_group_sort_order';
							
	$.ajax({
		url: 'index.php?route=editors/catalog_edit/catalog&token=' + getURLVar('token') + '&attribute_group_id=' + attribute_group_id + '&sort_order=' + sort_order + '&type=' + type,
		type: 'post',
		dataType: 'json',
		success: function(json) {									
			if (json['error']) {								
				$('.messages-body').html('<div class="alert alert-danger alert-messages"><i class="fa fa-check-circle"></i> ' + json['error'] + '</div>');$('.maxy-backdrop, .messages-body').show().delay(1500).fadeOut(500);
			}
									
			if (json['success']) {
				$('.messages-body').html('<div class="alert alert-success alert-messages"><i class="fa fa-check-circle"></i> ' + json['success'] + '</div>');$('.maxy-backdrop, .messages-body').show().delay(1000).fadeOut(500);			
				
				if (sort_order != '') {
					$('#attribute-group-sort' + attribute_group_id).html(sort_order);
				} else {
					$('#attribute-group-sort' + attribute_group_id).html('0');
				}

				$('#close-group-sort-' + attribute_group_id).trigger('click');
			}
		}
	});
}

function sortGroupClear(attribute_group_id) {
	$('#input-sort-group' + attribute_group_id).val('');
}