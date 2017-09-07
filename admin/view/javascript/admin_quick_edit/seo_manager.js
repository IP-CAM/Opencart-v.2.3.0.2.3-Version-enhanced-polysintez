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
	$('#button-filter').on('click', function() {
		var url = 'index.php?route=tool/seo_manager&token=' + getURLVar('token');
		
		var filter_query = $('input[name=\'filter_query\']').val();

		if (filter_query) {
			url += '&filter_query=' + encodeURIComponent(filter_query);
		}
		
		var filter_keyword = $('input[name=\'filter_keyword\']').val();

		if (filter_keyword) {
			url += '&filter_keyword=' + encodeURIComponent(filter_keyword);
		}	

		location = url;
	});
	
	$('input[name=\'filter_query\']').autocomplete({
		'source': function(request, response) {
			$.ajax({
				url: 'index.php?route=tool/seo_manager/autocomplete&token=' + getURLVar('token') + '&filter_query=' +  encodeURIComponent(request),
				dataType: 'json',
				success: function(json) {
					response($.map(json, function(item) {
						return {
							label: item['query'],
							value: item['url_alias_id']
						}
					}));
				}
			});
		},
		'select': function(item) {
			$('input[name=\'filter_query\']').val(item['label']);
		}
	});

	$('input[name=\'filter_keyword\']').autocomplete({
		'source': function(request, response) {
			$.ajax({
				url: 'index.php?route=tool/seo_manager/autocomplete&token=' + getURLVar('token') + '&filter_keyword=' +  encodeURIComponent(request),
				dataType: 'json',
				success: function(json) {
					response($.map(json, function(item) {
						return {
							label: item['keyword'],
							value: item['url_alias_id']
						}
					}));
				}
			});
		},
		'select': function(item) {
			$('input[name=\'filter_keyword\']').val(item['label']);
		}
	});
});

function editQuery(url_alias_id) {
	var query = $('#input-url-query' + url_alias_id).val();						
							
	$.ajax({
		url: 'index.php?route=tool/seo_manager/editQuery&token=' + getURLVar('token') + '&url_alias_id=' + url_alias_id + '&query=' + query,
		dataType: 'json',
		success: function(json) {									
			if (json['error']) {								
				$('.messages-body').html('<div class="alert alert-danger alert-messages"><i class="fa fa-check-circle"></i> ' + json['error'] + '</div>');$('.maxy-backdrop, .messages-body').show().delay(1500).fadeOut(500);
			}
									
			if (json['success']) {
				$('.messages-body').html('<div class="alert alert-success alert-messages"><i class="fa fa-check-circle"></i> ' + json['success'] + '</div>');$('.maxy-backdrop, .messages-body').show().delay(1000).fadeOut(500);			

				$('#url-query' + url_alias_id).html(query);

				$('#close-url-query-' + url_alias_id).trigger('click');
			}
		}
	});
}

function clearQuery(url_alias_id) {
	$('#input-url-query' + url_alias_id).val('');
}

function editKeyword(url_alias_id) {
	var keyword = $('#input-url-keyword' + url_alias_id).val();	
	var keyword_none = $('#keyword-none').val();
							
	$.ajax({
		url: 'index.php?route=tool/seo_manager/editKeyword&token=' + getURLVar('token') + '&url_alias_id=' + url_alias_id + '&keyword=' + keyword,
		dataType: 'json',
		success: function(json) {									
			if (json['error']) {								
				$('.messages-body').html('<div class="alert alert-danger alert-messages"><i class="fa fa-check-circle"></i> ' + json['error'] + '</div>');$('.maxy-backdrop, .messages-body').show().delay(1500).fadeOut(500);
			}
									
			if (json['success']) {
				$('.messages-body').html('<div class="alert alert-success alert-messages"><i class="fa fa-check-circle"></i> ' + json['success'] + '</div>');$('.maxy-backdrop, .messages-body').show().delay(1000).fadeOut(500);			

				$('#url-keyword' + url_alias_id).html(keyword);
				
				if (keyword != '') {
					$('#url-keyword' + url_alias_id).html(keyword);
				} else {
					$('#url-keyword' + url_alias_id).html(keyword_none);
				}

				$('#close-url-keyword-' + url_alias_id).trigger('click');
			}
		}
	});
}

function clearKeyword(url_alias_id) {
	$('#input-url-keyword' + url_alias_id).val('');
}

function urlAlias(url_alias_id) {	
	$('#modal-url-alias').modal('show');
		
	$('#modal-url-alias').on('hide.bs.modal', function() {
		$('#modal-url-alias-content').empty();
	});
	
	if (url_alias_id) {
		$('#modal-url-alias-content').load('index.php?route=tool/seo_manager/urlAlias&token=' + getURLVar('token') + '&url_alias_id=' + url_alias_id);
	} else {
		$('#modal-url-alias-content').load('index.php?route=tool/seo_manager/urlAlias&token=' + getURLVar('token'));
	}
}

function generatorUrlAlias(generator) {	
	$('#modal-url-alias').modal('show');
		
	$('#modal-url-alias').on('hide.bs.modal', function() {
		$('#modal-url-alias-content').empty();
	});
	
	$('#modal-url-alias-content').load('index.php?route=tool/seo_manager/generator_' + generator + '&token=' + getURLVar('token'));
}

function generator(generator, val) {
	var language_code = $('#source-language-code').val();
	var overwrite = $('#input-overwrite').val();
	var suffix = $('#input-suffix').val();
	var url_alias = $('#template-url-alias').val();
	var meta_title = $('#template-meta-title').val();
	var meta_h1 = $('#template-meta-h1').val();
	var meta_description = $('#template-meta-description').val();
	var meta_keywords = $('#template-meta-keywords').val();
	var tags = $('#template-tags').val();
	
	$.ajax({
		url: 'index.php?route=tool/seo_manager/generator' + generator + '&token=' + getURLVar('token') + '&value=' + val + '&language_code=' + language_code + '&url_alias=' + url_alias + '&meta_title=' + meta_title + '&meta_h1=' + meta_h1 + '&meta_description=' + meta_description + '&meta_keywords=' + meta_keywords + '&overwrite=' + overwrite + '&suffix=' + suffix + '&tags=' + tags,
		dataType: 'json',
		success: function(json) {									
			if (json['error']) {
				$('#form-generator').before('<div class="alert alert-danger"><i class="fa fa-exclamation-circle"></i> ' + json['error'] + '</div>');
				
				$('.alert-danger').delay(1500).fadeOut(500);
			}
			
			if (json['success']) {
				$('#form-generator').before('<div class="alert alert-success"><i class="fa fa-exclamation-circle"></i> ' + json['success'] + '</div>');	
				
				if (val == 'seo_keyword') {
					setTimeout(function(){			
						location.reload(true);
					}, 500);
				} else {
					$('.alert-success').delay(1500).fadeOut(500);
				}
			}
		}
	});
}

function deleteSeo(manager, val) {
	var confirm_delete = $('#delete-seo-confirm').val();
	
	if (confirm(confirm_delete)) {
		$.ajax({
			url: 'index.php?route=tool/seo_manager/deleteSeo' + manager + '&token=' + getURLVar('token') + '&value=' + val,
			dataType: 'json',
			success: function(json) {									
				if (json['error']) {
					$('#form-generator').before('<div class="alert alert-danger"><i class="fa fa-exclamation-circle"></i> ' + json['error'] + '</div>');
					
					$('.alert-danger').delay(1500).fadeOut(500);
				}
				
				if (json['success']) {
					$('#form-generator').before('<div class="alert alert-success"><i class="fa fa-exclamation-circle"></i> ' + json['success'] + '</div>');	
					
					$('.alert-success').delay(1500).fadeOut(500);
				}
			}
		});
	}
}