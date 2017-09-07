<div class="popover-content">
  <form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data" id="form-filter-name-<?php echo $filter_group_id; ?>">
	<?php foreach ($languages as $language) { ?>
	  <div class="input-group" style="margin-bottom: 3px;"><span class="input-group-addon"><img src="language/<?php echo $language['code']; ?>/<?php echo $language['code']; ?>.png" title="<?php echo $language['name']; ?>" /></span><input type="text" name="filter_group_description[<?php echo $language['language_id']; ?>][name]" value="<?php echo isset($filter_group_description[$language['language_id']]) ? $filter_group_description[$language['language_id']]['name'] : ''; ?>" placeholder="<?php echo $entry_group; ?>" class="form-control" /></div>
	<?php } ?>
  </form>
</div>
<div class="popover-footer">
  <a data-form="form-filter-name-<?php echo $filter_group_id; ?>" class="button-save btn btn-primary btn-sm"><i class="fa fa-save fa-fw"></i></a><a id="clear-filter-name-<?php echo $filter_group_id; ?>" class="btn btn-danger btn-sm"><i class="fa fa-eraser fa-fw"></i></a>
</div>
<script type="text/javascript"><!--
$('.button-save').on('click', function() {	
	var name = $('input[name="filter_group_description[<?php echo $config_language_id; ?>][name]"]').val(); 	
	$.ajax({
		url: $('#' + $(this).data('form')).attr('action'),
		type: 'post',
		dataType: 'json',
		data: $('#form-filter-name-<?php echo $filter_group_id; ?> input[type=\'text\']'),
		success: function(json) {									
			if (json['error']) {								
				$('.messages-body').html('<div class="alert alert-danger alert-messages"><i class="fa fa-check-circle"></i> ' + json['error'] + '</div>');$('.maxy-backdrop, .messages-body').show().delay(1500).fadeOut(500);
			}
									
			if (json['success']) {
				$('.messages-body').html('<div class="alert alert-success alert-messages"><i class="fa fa-check-circle"></i> ' + json['success'] + '</div>');$('.maxy-backdrop, .messages-body').show().delay(1000).fadeOut(500);			
								
				$('#filter-name<?php echo $filter_group_id; ?>').html(name);
				$('#close-name-<?php echo $filter_group_id; ?>').trigger('click');
			}
		}
	});
}); 

$('#close-name-<?php echo $filter_group_id; ?>').on('click', function() {
	$('#form-filter-name-<?php echo $filter_group_id; ?>').empty();
	$('#filter-name-<?php echo $filter_group_id; ?>').popoverMaxy('hide');
});	

$('#filter-name-<?php echo $filter_group_id; ?>').on('hide.bs.modal', function () {
	$('#form-filter-name-<?php echo $filter_group_id; ?>').empty();
});

$('#clear-filter-name-<?php echo $filter_group_id; ?>').on('click', function() {
	$('#form-filter-name-<?php echo $filter_group_id; ?>').find('input').val('');
});  
//--></script>