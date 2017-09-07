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
	$('.ajax-status').on('click', function() { 
		var object_id = $(this).attr('id');
		var permission = $('#review-permission').val();	
		var error_permission = $('#review-error-permission').val();
		var type = 'review_status';

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
	
	$('input[name=\'product\']').autocomplete({
		'source': function(request, response) {
			$.ajax({
				url: 'index.php?route=catalog/product/autocomplete&token=' + getURLVar('token') + '&filter_name=' +  encodeURIComponent(request),
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
			$('input[name=\'product\']').val(item['label']);
			$('input[name=\'product_id\']').val(item['value']);		
		}	
	});
	
	$('input[name=\'filter_product\']').autocomplete({
		'source': function(request, response) {
			$.ajax({
				url: 'index.php?route=catalog/product/autocomplete&token=' + getURLVar('token') + '&filter_name=' +  encodeURIComponent(request),
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
			$('input[name=\'filter_product\']').val(item['label']);	
		}	
	});
	
	$('.alert-success').delay(1000).fadeOut(1000);
	
	$('.datetime').datetimepicker({
		pickDate: true,
		pickTime: true
	});
	
	$('.date').datetimepicker({
		pickTime: false
	});
});

function filter() {
	url = 'index.php?route=editors/review&token=' + getURLVar('token');
		
	var filter_product = $('input[name=\'filter_product\']').val();
		
	if (filter_product) {
		url += '&filter_product=' + encodeURIComponent(filter_product);
	}
		
	var filter_author = $('input[name=\'filter_author\']').val();
		
	if (filter_author) {
		url += '&filter_author=' + encodeURIComponent(filter_author);
	}
		
	var filter_rating = $('select[name=\'filter_rating\']').val();
		
	if (filter_rating != '*') {
		url += '&filter_rating=' + encodeURIComponent(filter_rating); 
	}	
		
	var filter_status = $('select[name=\'filter_status\']').val();
		
	if (filter_status != '*') {
		url += '&filter_status=' + encodeURIComponent(filter_status); 
	}		
				
	var filter_date_added = $('input[name=\'filter_date_added\']').val();
		
	if (filter_date_added) {
		url += '&filter_date_added=' + encodeURIComponent(filter_date_added);
	}

	location = url;
}

function editReviewProduct(review_id) {
	var product = $('#input-name' + review_id).val();
	var product_id = $('#input-product' + review_id).val();
	var type = 'review_product';
							
	$.ajax({
		url: 'index.php?route=editors/catalog_edit/catalog&token=' + getURLVar('token') + '&review_id=' + review_id + '&product_id=' + product_id + '&type=' + type,
		type: 'post',
		dataType: 'json',
		success: function(json) {									
			if (json['error']) {								
				$('.messages-body').html('<div class="alert alert-danger alert-messages"><i class="fa fa-check-circle"></i> ' + json['error'] + '</div>');$('.maxy-backdrop, .messages-body').show().delay(1500).fadeOut(500);
			}
									
			if (json['success']) {
				$('.messages-body').html('<div class="alert alert-success alert-messages"><i class="fa fa-check-circle"></i> ' + json['success'] + '</div>');$('.maxy-backdrop, .messages-body').show().delay(1000).fadeOut(500);			

				$('#review-name' + review_id).html(product);

				$('#close-name-' + review_id).trigger('click');
			}
		}
	});
}

function nameClear(review_id) {
	$('#input-name' + review_id).val('');
}

function editReviewAuthor(review_id) {
	var author = $('#input-author' + review_id).val();
	var type = 'review_author';
							
	$.ajax({
		url: 'index.php?route=editors/catalog_edit/catalog&token=' + getURLVar('token') + '&review_id=' + review_id + '&author=' + author + '&type=' + type,
		type: 'post',
		dataType: 'json',
		success: function(json) {									
			if (json['error']) {								
				$('.messages-body').html('<div class="alert alert-danger alert-messages"><i class="fa fa-check-circle"></i> ' + json['error'] + '</div>');$('.maxy-backdrop, .messages-body').show().delay(1500).fadeOut(500);
			}
									
			if (json['success']) {
				$('.messages-body').html('<div class="alert alert-success alert-messages"><i class="fa fa-check-circle"></i> ' + json['success'] + '</div>');$('.maxy-backdrop, .messages-body').show().delay(1000).fadeOut(500);			

				$('#review-author' + review_id).html(author);

				$('#close-author-' + review_id).trigger('click');
			}
		}
	});
}

function authorClear(review_id) {
	$('#input-author' + review_id).val('');
}

function editReviewText(review_id) {
	var text = $('#input-text' + review_id).val();
	var type = 'review_text';
							
	$.ajax({
		url: 'index.php?route=editors/catalog_edit/catalog&token=' + getURLVar('token') + '&review_id=' + review_id + '&text=' + text + '&type=' + type,
		type: 'post',
		dataType: 'json',
		success: function(json) {									
			if (json['error']) {								
				$('.messages-body').html('<div class="alert alert-danger alert-messages"><i class="fa fa-check-circle"></i> ' + json['error'] + '</div>');$('.maxy-backdrop, .messages-body').show().delay(1500).fadeOut(500);
			}
									
			if (json['success']) {
				$('.messages-body').html('<div class="alert alert-success alert-messages"><i class="fa fa-check-circle"></i> ' + json['success'] + '</div>');$('.maxy-backdrop, .messages-body').show().delay(1000).fadeOut(500);			

				$('#close-text-' + review_id).trigger('click');
			}
		}
	});
}

function textClear(review_id) {
	$('#input-text' + review_id).val('');
}

function editReviewRating(review_id) {
	var rating = $('#input-rating' + review_id).val();
	var type = 'review_rating';
							
	$.ajax({
		url: 'index.php?route=editors/catalog_edit/catalog&token=' + getURLVar('token') + '&review_id=' + review_id + '&rating=' + rating + '&type=' + type,
		type: 'post',
		dataType: 'json',
		success: function(json) {									
			if (json['error']) {								
				$('.messages-body').html('<div class="alert alert-danger alert-messages"><i class="fa fa-check-circle"></i> ' + json['error'] + '</div>');$('.maxy-backdrop, .messages-body').show().delay(1500).fadeOut(500);
			}
									
			if (json['success']) {
				$('.messages-body').html('<div class="alert alert-success alert-messages"><i class="fa fa-check-circle"></i> ' + json['success'] + '</div>');$('.maxy-backdrop, .messages-body').show().delay(1000).fadeOut(500);			

				html =  '<span class="rating">';
				for ($i = 1; $i <= 5; $i++) {
					if (rating < $i) {
						html +=  '<span class="fa fa-stack" style="width: 2.22em;"><i class="fa fa-star-o fa-stack-2x"></i></span>';
					} else {
						html +=  '<span class="fa fa-stack" style="width: 2.22em;"><i class="fa fa-star fa-stack-2x"></i><i class="fa fa-star-o fa-stack-2x"></i></span>';
					}
				}
				html +=  '</span>';
				
				$('#review-rating' + review_id).html(html);
				
				$('#close-rating-' + review_id).trigger('click');
			}
		}
	});
}