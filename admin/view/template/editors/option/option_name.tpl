<div class="popover-content">
  <form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data" id="form-option-name-<?php echo $option_id; ?>">
	<?php foreach ($languages as $language) { ?>
	  <div class="input-group" style="margin-bottom: 3px;"><span class="input-group-addon"><img src="language/<?php echo $language['code']; ?>/<?php echo $language['code']; ?>.png" title="<?php echo $language['name']; ?>" /></span><input type="text" name="option_description[<?php echo $language['language_id']; ?>][name]" value="<?php echo isset($option_description[$language['language_id']]) ? $option_description[$language['language_id']]['name'] : ''; ?>" placeholder="<?php echo $entry_name; ?>" class="form-control" /></div>
	<?php } ?>
</div>
<div class="popover-footer">
  <a data-form="form-option-name-<?php echo $option_id; ?>" class="button-save btn btn-primary btn-sm"><i class="fa fa-save fa-fw"></i></a><a id="clear-option-name-<?php echo $option_id; ?>" class="btn btn-danger btn-sm"><i class="fa fa-eraser fa-fw"></i></a>
</div>
<script type="text/javascript"><!--
$('.button-save').on('click', function() {	
	var name = $('input[name="option_description[<?php echo $config_language_id; ?>][name]"]').val(); 	
	$.ajax({
		url: $('#' + $(this).data('form')).attr('action'),
		type: 'post',
		dataType: 'json',
		data: $('#form-option-name-<?php echo $option_id; ?> input[type=\'text\']'),
		success: function(json) {									
			if (json['error']) {								
				$('.messages-body').html('<div class="alert alert-danger alert-messages"><i class="fa fa-check-circle"></i> ' + json['error'] + '</div>');$('.maxy-backdrop, .messages-body').show().delay(1500).fadeOut(500);
			}
									
			if (json['success']) {
				$('.messages-body').html('<div class="alert alert-success alert-messages"><i class="fa fa-check-circle"></i> ' + json['success'] + '</div>');$('.maxy-backdrop, .messages-body').show().delay(1000).fadeOut(500);			
								
				$('#option-name<?php echo $option_id; ?>').html(name);
				$('#close-name-<?php echo $option_id; ?>').trigger('click');
			}
		}
	});
}); 

$('#close-name-<?php echo $option_id; ?>').on('click', function() {
	$('#form-option-name-<?php echo $option_id; ?>').empty();
	$('#option-name-<?php echo $option_id; ?>').popoverMaxy('hide');
});	

$('#option-name-<?php echo $option_id; ?>').on('hide.bs.modal', function () {
	$('#form-option-name-<?php echo $option_id; ?>').empty();
});

$('#clear-option-name-<?php echo $option_id; ?>').on('click', function() {
	$('#form-option-name-<?php echo $option_id; ?>').find('input').val('');
});  
//--></script>