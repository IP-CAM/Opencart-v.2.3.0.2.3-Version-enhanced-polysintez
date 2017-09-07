<div class="popover-content">
  <form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data" id="form-category-name-<?php echo $category_id; ?>">
	<?php foreach ($languages as $language) { ?>
	  <div class="input-group" style="margin-bottom: 3px;"><span class="input-group-addon"><img src="language/<?php echo $language['code']; ?>/<?php echo $language['code']; ?>.png" title="<?php echo $language['name']; ?>" /></span><input type="text" name="category_description[<?php echo $language['language_id']; ?>][name]" value="<?php echo isset($category_description[$language['language_id']]) ? $category_description[$language['language_id']]['name'] : ''; ?>" placeholder="<?php echo $entry_name; ?>" class="form-control" /></div>
	<?php } ?>
  </form>
</div>
<div class="popover-footer">
  <a data-form="form-category-name-<?php echo $category_id; ?>" class="button-save btn btn-primary btn-sm"><i class="fa fa-save fa-fw"></i></a><a id="clear-category-name-<?php echo $category_id; ?>" class="btn btn-danger btn-sm"><i class="fa fa-eraser fa-fw"></i></a>
</div>
<script type="text/javascript"><!--
$('.button-save').on('click', function() {	
	$.ajax({
		url: $('#' + $(this).data('form')).attr('action'),
		type: 'post',
		dataType: 'json',
		data: $('#form-category-name-<?php echo $category_id; ?> input[type="text"]'),
		success: function(json) {									
			if (json['error']) {								
				$('.messages-body').html('<div class="alert alert-danger alert-messages"><i class="fa fa-check-circle"></i> ' + json['error'] + '</div>');$('.maxy-backdrop, .messages-body').show().delay(1500).fadeOut(500);
			}
									
			if (json['success']) {
				$('.messages-body').html('<div class="alert alert-success alert-messages"><i class="fa fa-check-circle"></i> ' + json['success'] + '</div>');$('.maxy-backdrop, .messages-body').show().delay(1000).fadeOut(500);			
				
				$('#close-name-<?php echo $category_id; ?>').trigger('click');
				
				setTimeout(function(){			
					location.reload(true);
				}, 500);
			}
		}
	});
}); 

$('#close-name-<?php echo $category_id; ?>').on('click', function() {
	$('#form-category-name-<?php echo $category_id; ?>').empty();
	$('#category-name-<?php echo $category_id; ?>').popoverMaxy('hide');
});	

$('#category-name-<?php echo $category_id; ?>').on('hide.bs.modal', function () {
	$('#form-category-name-<?php echo $category_id; ?>').empty();
});

$('#clear-category-name-<?php echo $category_id; ?>').on('click', function() {
	$('#form-category-name-<?php echo $category_id; ?>').find('input').val('');
});  
//--></script>