<div class="popover-content">
  <form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data" id="form-attribute-name-<?php echo $attribute_id; ?>">
	<?php foreach ($languages as $language) { ?>
	  <div class="input-group" style="margin-bottom: 3px;"><span class="input-group-addon"><img src="language/<?php echo $language['code']; ?>/<?php echo $language['code']; ?>.png" title="<?php echo $language['name']; ?>" /></span><input type="text" name="attribute_description[<?php echo $language['language_id']; ?>][name]" value="<?php echo isset($attribute_description[$language['language_id']]) ? $attribute_description[$language['language_id']]['name'] : ''; ?>" placeholder="<?php echo $entry_name; ?>" id="input-name<?php echo $language['language_id']; ?>" class="form-control input-name<?php echo $language['language_id']; ?>" /></div>
	<?php } ?>
  </form>
</div>
<div class="popover-footer">
  <a data-form="form-attribute-name-<?php echo $attribute_id; ?>" class="button-save btn btn-primary btn-sm"><i class="fa fa-save fa-fw"></i></a><a id="clear-attribute-name-<?php echo $attribute_id; ?>" class="btn btn-danger btn-sm"><i class="fa fa-eraser fa-fw"></i></a>
</div>
<script type="text/javascript"><!--
$('.button-save').on('click', function() {	
	var name = $('input[name="attribute_description[<?php echo $config_language_id; ?>][name]"]').val(); 	
	$.ajax({
		url: $('#' + $(this).data('form')).attr('action'),
		type: 'post',
		dataType: 'json',
		data: $('#form-attribute-name-<?php echo $attribute_id; ?> input[type="text"]'),
		success: function(json) {									
			if (json['error']) {								
				$('.messages-body').html('<div class="alert alert-danger alert-messages"><i class="fa fa-check-circle"></i> ' + json['error'] + '</div>');$('.maxy-backdrop, .messages-body').show().delay(1500).fadeOut(500);
			}
									
			if (json['success']) {
				$('.messages-body').html('<div class="alert alert-success alert-messages"><i class="fa fa-check-circle"></i> ' + json['success'] + '</div>');$('.maxy-backdrop, .messages-body').show().delay(1000).fadeOut(500);			
								
				$('#attribute-name<?php echo $attribute_id; ?>').html(name);
				$('#close-name-<?php echo $attribute_id; ?>').trigger('click');
			}
		}
	});
}); 

$('#close-name-<?php echo $attribute_id; ?>').on('click', function() {
	$('#form-attribute-name-<?php echo $attribute_id; ?>').empty();
	$('#attribute-name-<?php echo $attribute_id; ?>').popoverMaxy('hide');
});	

$('#attribute-name-<?php echo $attribute_id; ?>').on('hide.bs.modal', function () {
	$('#form-attribute-name-<?php echo $attribute_id; ?>').empty();
});

$('#clear-attribute-name-<?php echo $attribute_id; ?>').on('click', function() {
	$('#form-attribute-name-<?php echo $attribute_id; ?>').find('input').val('');
});  
//--></script>