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
	$(window).scroll(function() {			
		var position = $(window).scrollTop();
		var headingTop = $('.page-header').position().top;
		
		if (position >= 200) {
			$('#scroll-to-top').removeAttr('style').removeClass('hidden').removeClass('zoomOut').addClass('zoomIn');	
		} else {
			$('#scroll-to-top').removeClass('zoomIn').addClass('zoomOut').attr('style','cursor:default;');	
		}
		
		if ($(window).scrollTop() <= 45) {
            if ($('.page-header').hasClass('fixed-page-header')) {
                $('.page-header').removeClass('fixed-page-header');
            }
			
			$('.panel').css('margin-top', '0');
        } else { 
            if (!$('.page-header').hasClass('fixed-page-header')) {
                $('.page-header').addClass('fixed-page-header');
            }
			
			$('.panel').css('margin-top', '65px');
			$('.panel-margin').css('margin-top', '0');
        }
	});
	
	$('#scroll-to-top').on('click', function() {
		$('html, body').animate({ scrollTop: 0 }, 'slow');
	});
});

function updateSettingModule() {
	$.ajax({
		url: 'index.php?route=extension/module/admin_quick_edit/updateSettingModule&token=' + getURLVar('token'),
		type: 'post',
		dataType: 'json',
		data: $('#form-setting input[type=\'text\'], #form-setting input[type=\'checkbox\']:checked'),
		success: function(json) {
			$('.alert-success, .alert-danger').remove();
												
			if (json['error']) {
				$('.messages-body').html('<div class="alert alert-danger alert-messages"><i class="fa fa-check-circle"></i> ' + json['error'] + '</div>');$('.maxy-backdrop, .messages-body').show().delay(1000).fadeOut(500);
			}
												
			if (json['success']) {
				$('.messages-body').html('<div class="alert alert-success alert-messages"><i class="fa fa-check-circle"></i> ' + json['success'] + '</div>');$('.maxy-backdrop, .messages-body').show().delay(1000).fadeOut(500);
			}
		}
	});
}