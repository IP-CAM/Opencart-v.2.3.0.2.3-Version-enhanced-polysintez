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
	url = 'index.php?route=editors/customer&token=' + getURLVar('token');
	
	var filter_name = $('input[name=\'filter_name\']').val();
		
	if (filter_name) {
		url += '&filter_name=' + encodeURIComponent(filter_name);
	}
		
	var filter_email = $('input[name=\'filter_email\']').val();
		
	if (filter_email) {
		url += '&filter_email=' + encodeURIComponent(filter_email);
	}
		
	var filter_customer_group_id = $('select[name=\'filter_customer_group_id\']').val();
		
	if (filter_customer_group_id != '*') {
		url += '&filter_customer_group_id=' + encodeURIComponent(filter_customer_group_id);
	}	
		
	var filter_status = $('select[name=\'filter_status\']').val();
		
	if (filter_status != '*') {
		url += '&filter_status=' + encodeURIComponent(filter_status); 
	}	
		
	var filter_newsletter = $('select[name=\'filter_newsletter\']').val();
		
	if (filter_newsletter != '*') {
		url += '&filter_newsletter=' + encodeURIComponent(filter_newsletter); 
	}
		
	var filter_approved = $('select[name=\'filter_approved\']').val();
		
	if (filter_approved != '*') {
		url += '&filter_approved=' + encodeURIComponent(filter_approved);
	}	
		
	var filter_ip = $('input[name=\'filter_ip\']').val();
		
	if (filter_ip) {
		url += '&filter_ip=' + encodeURIComponent(filter_ip);
	}
			
	var filter_date_added = $('input[name=\'filter_date_added\']').val();
		
	if (filter_date_added) {
		url += '&filter_date_added=' + encodeURIComponent(filter_date_added);
	}
		
	location = url;
}
	
$(document).ready(function() {
	$('input[name=\'filter_name\']').autocomplete({
		'source': function(request, response) {
			$.ajax({
				url: 'index.php?route=editors/customer/autocomplete&token=' + getURLVar('token') + '&filter_name=' +  encodeURIComponent(request),
				dataType: 'json',			
				success: function(json) {
					response($.map(json, function(item) {
						return {
							label: item['name'],
							value: item['customer_id']
						}
					}));
				}
			});
		},
		'select': function(item) {
			$('input[name=\'filter_name\']').val(item['label']);
		}	
	});

	$('input[name=\'filter_email\']').autocomplete({
		'source': function(request, response) {
			$.ajax({
				url: 'index.php?route=editors/customer/autocomplete&token=' + getURLVar('token') + '&filter_email=' +  encodeURIComponent(request),
				dataType: 'json',			
				success: function(json) {
					response($.map(json, function(item) {
						return {
							label: item['email'],
							value: item['customer_id']
						}
					}));
				}
			});
		},
		'select': function(item) {
			$('input[name=\'filter_email\']').val(item['label']);
		}	
	});

	$('.date').datetimepicker({
		pickTime: false
	});
	
	$('.ajax-status').on('click', function() { 
		var object_id = $(this).attr('id');
		var permission = $('#customer-permission').val();	
		var error_permission = $('#customer-error-permission').val();
		var type = 'customer_status';

		if (permission) {
			$.ajax({
				url: 'index.php?route=editors/catalog_edit/catalog&token=' + getURLVar('token') + '&type=' + type,
				type: 'get',
				data: {object_id:object_id},
				dataType: 'html',
				success: function(html) {
					if (html != '') {				
						$('#' +object_id).html(html);
					}
				}
			});
		} else {
			$('.messages-body').html('<div class="alert alert-danger alert-messages"><i class="fa fa-check-circle"></i> ' + error_permission + '</div>');$('.maxy-backdrop, .messages-body').show().delay(1500).fadeOut(500);
		}
	});
	
	$('.ajax-newsletter').on('click', function() { 
		var object_id = $(this).attr('id');
		var permission = $('#customer-permission').val();	
		var error_permission = $('#customer-error-permission').val();
		var type = 'customer_newsletter';

		if (permission) {
			$.ajax({
				url: 'index.php?route=editors/catalog_edit/catalog&token=' + getURLVar('token') + '&type=' + type,
				type: 'get',
				data: {object_id:object_id},
				dataType: 'html',
				success: function(html) {
					if (html != '') {				
						$('#' +object_id).html(html);
					}
				}
			});
		} else {
			$('.messages-body').html('<div class="alert alert-danger alert-messages"><i class="fa fa-check-circle"></i> ' + error_permission + '</div>');$('.maxy-backdrop, .messages-body').show().delay(1500).fadeOut(500);
		}
	});
	
	$('.ajax-approved').on('click', function() { 
		var object_id = $(this).attr('id');
		var permission = $('#customer-permission').val();	
		var error_permission = $('#customer-error-permission').val();
		var type = 'customer_approved';

		if (permission) {
			$.ajax({
				url: 'index.php?route=editors/catalog_edit/catalog&token=' + getURLVar('token') + '&type=' + type,
				type: 'get',
				data: {object_id:object_id},
				dataType: 'html',
				success: function(html) {
					if (html != '') {				
						$('#' +object_id).html(html);
					}
				}
			});
		} else {
			$('.messages-body').html('<div class="alert alert-danger alert-messages"><i class="fa fa-check-circle"></i> ' + error_permission + '</div>');$('.maxy-backdrop, .messages-body').show().delay(1500).fadeOut(500);
		}
	});
});

function editName(customer_id) {
	var firstname = $('#input-firstname' + customer_id).val();
	var lastname = $('#input-lastname' + customer_id).val();
	var type = 'customer_name';
							
	$.ajax({
		url: 'index.php?route=editors/catalog_edit/catalog&token=' + getURLVar('token') + '&customer_id=' + customer_id + '&firstname=' + firstname + '&lastname=' + lastname + '&type=' + type,
		type: 'post',
		dataType: 'json',
		success: function(json) {									
			if (json['error']) {								
				$('.messages-body').html('<div class="alert alert-danger alert-messages"><i class="fa fa-check-circle"></i> ' + json['error'] + '</div>');$('.maxy-backdrop, .messages-body').show().delay(1500).fadeOut(500);
			}
									
			if (json['success']) {
				$('.messages-body').html('<div class="alert alert-success alert-messages"><i class="fa fa-check-circle"></i> ' + json['success'] + '</div>');$('.maxy-backdrop, .messages-body').show().delay(1000).fadeOut(500);			
				
				$('#customer-name' + customer_id).html(firstname + ' ' + lastname);

				$('#close-name-' + customer_id).trigger('click');
			}
		}
	});
}

function nameClear(customer_id) {
	$('#input-firstname' + customer_id).val('');
	$('#input-lastname' + customer_id).val('');
}

function editEmail(customer_id) {
	var email = $('#input-email' + customer_id).val();
	var type = 'customer_email';
							
	$.ajax({
		url: 'index.php?route=editors/catalog_edit/catalog&token=' + getURLVar('token') + '&customer_id=' + customer_id + '&email=' + email + '&type=' + type,
		type: 'get',
		dataType: 'json',
		success: function(json) {									
			if (json['error']) {								
				$('.messages-body').html('<div class="alert alert-danger alert-messages"><i class="fa fa-check-circle"></i> ' + json['error'] + '</div>');$('.maxy-backdrop, .messages-body').show().delay(1500).fadeOut(500);
			}
									
			if (json['success']) {
				$('.messages-body').html('<div class="alert alert-success alert-messages"><i class="fa fa-check-circle"></i> ' + json['success'] + '</div>');$('.maxy-backdrop, .messages-body').show().delay(1000).fadeOut(500);			
				
				$('#customer-email' + customer_id).html(email);

				$('#close-email-' + customer_id).trigger('click');
			}
		}
	});
}

function emailClear(customer_id) {
	$('#input-email' + customer_id).val('');
}

function editCustomerGroup(customer_id) {
	var customer_group_id = $('#input-customer-group-' + customer_id).val();
	var customer_group = $('#input-customer-group-' + customer_id + ' option:selected').text();
	var type = 'customer_group';
							
	$.ajax({
		url: 'index.php?route=editors/catalog_edit/catalog&token=' + getURLVar('token') + '&customer_id=' + customer_id + '&customer_group_id=' + customer_group_id + '&type=' + type,
		type: 'get',
		dataType: 'json',
		success: function(json) {									
			if (json['error']) {								
				$('.messages-body').html('<div class="alert alert-danger alert-messages"><i class="fa fa-check-circle"></i> ' + json['error'] + '</div>');$('.maxy-backdrop, .messages-body').show().delay(1500).fadeOut(500);
			}
									
			if (json['success']) {
				$('.messages-body').html('<div class="alert alert-success alert-messages"><i class="fa fa-check-circle"></i> ' + json['success'] + '</div>');$('.maxy-backdrop, .messages-body').show().delay(1000).fadeOut(500);			
				
				$('#customer-group' + customer_id).html(customer_group);

				$('#close-group-' + customer_id).trigger('click');
			}
		}
	});
}

function editMore(customer_id, val) {	
	$('#customer-more-' + customer_id).popoverMaxy('hide');
	$('#modal-customer-edit').modal('show');
		
	$('#modal-customer-edit').on('hide.bs.modal', function() {
		$('#modal-customer-content').empty();
	});
	
	$('#modal-customer-content').load('index.php?route=editors/catalog_edit/edit_customer_' + val + '&token=' + getURLVar('token') + '&customer_id=' + customer_id);
}