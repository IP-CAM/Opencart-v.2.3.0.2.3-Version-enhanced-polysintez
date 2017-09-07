<div class="modal-header">
  <button type="button" class="pull-right btn btn-danger btn-sm" data-dismiss="modal" aria-hidden="true"><i class="fa fa-close"></i></button>
  <h4 class="modal-title"><?php echo $text_model; ?></h4>
</div>
<div class="modal-body" id="body-mass-product-model">
  <form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data" id="form-mass-product-model" class="form-horizontal">	
	<div class="form-group">
	  <div class="col-sm-12">
	    <div class="alert alert-info"><i class="fa fa-info-circle"></i> <?php echo $text_edit_info; ?></div>
	  </div>
	</div>
	<div class="form-group<?php if ($model_required) { ?> required<?php } ?>">	
	  <label class="col-sm-3 control-label" for="input-model"><?php echo $entry_model; ?></label>
	  <div class="col-sm-9">
		<div class="input-group">
		  <span class="input-group-addon"><input type="checkbox" name="status_model" value="1" /></span>
		  <input type="text" name="model" value="" placeholder="<?php echo $entry_model; ?>" id="input-model" class="form-control" />
		</div>
	  </div>
	</div>
	<div class="form-group">
	  <label class="col-sm-3 control-label" for="input-location"><?php echo $entry_location; ?></label>
	  <div class="col-sm-9">
		<div class="input-group">
		  <span class="input-group-addon"><input type="checkbox" name="status_location" value="1" /></span>
		  <input type="text" name="location" value="" placeholder="<?php echo $entry_location; ?>" id="input-location" class="form-control" />
		</div>
	  </div>
	</div>
	<div class="form-group">
	  <label class="col-sm-3 control-label" for="input-tax-class"><?php echo $entry_tax_class; ?></label>
	  <div class="col-sm-9">
		<div class="input-group">
		  <span class="input-group-addon"><input type="checkbox" name="status_tax_class_id" value="1" /></span>
		  <select name="tax_class_id" id="input-tax-class" class="form-control">
			<option value="0"><?php echo $text_none; ?></option>
			<?php foreach ($tax_classes as $tax_class) { ?>
			  <option value="<?php echo $tax_class['tax_class_id']; ?>"><?php echo $tax_class['title']; ?></option>
			<?php } ?>
		  </select>
		</div>
	  </div>
	</div>
  </form>
</div>
<div class="modal-footer">
  <div class="text-center"><a data-form="form-mass-product-model" class="button-save btn btn-info btn-lg"><?php echo $button_save; ?></a></div>
</div>
<script type="text/javascript"><!--
$(".button-save").on('click', function(){		
	var status_model = $('#form-mass-product-model input[name=\'status_model\']:checked').val();	
	$.ajax({
		url: $('#' + $(this).data('form')).attr('action'),
		type: 'post',
		dataType: 'json',
		data: $('#product-list input[type=\'checkbox\']:checked, #' + $(this).data('form') + ' input[type=\'text\'], #' + $(this).data('form') + ' input[type=\'checkbox\']:checked, #' + $(this).data('form') + ' select'),
		success: function(json) {				
			if (json['error']) {
				$('#form-mass-product-model').before('<div class="alert alert-danger"><i class="fa fa-exclamation-circle"></i> ' + json['error'] + '</div>');
				
				$('.alert-danger').delay(1500).fadeOut(500);	
			}
								
			if (json['success']) {
				$('#form-mass-product-model').before('<div class="alert alert-success"><i class="fa fa-check-circle"></i> ' + json['success'] + '</div>');	
				
				setTimeout(function(){
					if (status_model == '1') {
						location.reload(true);
					} else {
						$('#modal-product-edit').modal('hide');
					}
				}, 1000)
			}
		}
	});
});  
//--></script>