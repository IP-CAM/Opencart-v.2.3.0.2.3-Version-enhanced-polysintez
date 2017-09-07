<div class="popover-content">
  <form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data" id="form-information-title-<?php echo $information_id; ?>">
	<?php foreach ($languages as $language) { ?>
	  <div class="input-group" style="margin-bottom: 3px;"><span class="input-group-addon"><img src="language/<?php echo $language['code']; ?>/<?php echo $language['code']; ?>.png" title="<?php echo $language['name']; ?>" /></span><input type="text" name="information_description[<?php echo $language['language_id']; ?>][title]" value="<?php echo isset($information_description[$language['language_id']]) ? $information_description[$language['language_id']]['title'] : ''; ?>" placeholder="<?php echo $entry_title; ?>" class="form-control" /></div>
	<?php } ?>
</div>
<div class="popover-footer">
  <a data-form="form-information-title-<?php echo $information_id; ?>" class="button-save btn btn-primary btn-sm"><i class="fa fa-save fa-fw"></i></a><a id="clear-information-title-<?php echo $information_id; ?>" class="btn btn-danger btn-sm"><i class="fa fa-eraser fa-fw"></i></a>
</div>
<script type="text/javascript"><!--
$('.button-save').on('click', function() {	
	var title = $('input[name="information_description[<?php echo $config_language_id; ?>][title]"]').val(); 	
	$.ajax({
		url: $('#' + $(this).data('form')).attr('action'),
		type: 'post',
		dataType: 'json',
		data: $('#form-information-title-<?php echo $information_id; ?> input[type=\'text\']'),
		success: function(json) {									
			if (json['error']) {								
				$('.messages-body').html('<div class="alert alert-danger alert-messages"><i class="fa fa-check-circle"></i> ' + json['error'] + '</div>');$('.maxy-backdrop, .messages-body').show().delay(1500).fadeOut(500);
			}
									
			if (json['success']) {
				$('.messages-body').html('<div class="alert alert-success alert-messages"><i class="fa fa-check-circle"></i> ' + json['success'] + '</div>');$('.maxy-backdrop, .messages-body').show().delay(1000).fadeOut(500);			
				
				$('#information-title<?php echo $information_id; ?>').html(title);
				$('#close-title-<?php echo $information_id; ?>').trigger('click');
			}
		}
	});
}); 

$('#close-title-<?php echo $information_id; ?>').on('click', function() {
	$('#form-information-title-<?php echo $information_id; ?>').empty();
	$('#information-title-<?php echo $information_id; ?>').popoverMaxy('hide');
});	

$('#information-title-<?php echo $information_id; ?>').on('hide.bs.modal', function () {
	$('#form-information-title-<?php echo $information_id; ?>').empty();
});

$('#clear-information-title-<?php echo $information_id; ?>').on('click', function() {
	$('#form-information-title-<?php echo $information_id; ?>').find('input').val('');
});  
//--></script>