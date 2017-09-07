<div class="modal-header">
  <button type="button" class="pull-right btn btn-danger btn-sm" data-dismiss="modal" aria-hidden="true"><i class="fa fa-close"></i></button>
  <h4 class="modal-title"><?php echo $text_size; ?></h4>
</div>
<div class="modal-body" id="body-mass-product-weight">
  <form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data" id="form-mass-product-weight" class="form-horizontal">	
	<div class="form-group">
	  <div class="alert alert-info"><i class="fa fa-info-circle"></i> <?php echo $text_edit_info; ?></div>
	</div>
	<div class="form-group">	
	  <label class="col-sm-3 control-label" for="input-length"><?php echo $entry_length; ?></label>
	  <div class="col-sm-3">
		<div class="input-group">
		  <span class="input-group-addon"><input type="checkbox" name="status_length" value="1" /></span>
		  <input type="text" name="length" value="" placeholder="<?php echo $entry_length; ?>" id="input-length" class="form-control" />
		</div>
	  </div>
	  <label class="col-sm-3 control-label" for="input-height"><?php echo $entry_height; ?></label>
	  <div class="col-sm-3">
		<div class="input-group">
		  <span class="input-group-addon"><input type="checkbox" name="status_height" value="1" /></span>
		  <input type="text" name="height" value="" placeholder="<?php echo $entry_height; ?>" id="input-height" class="form-control" />
		</div>
	  </div>
	</div>
	<div class="form-group">	
	  <label class="col-sm-3 control-label" for="input-width"><?php echo $entry_width; ?></label>
	  <div class="col-sm-3">
		<div class="input-group">
		  <span class="input-group-addon"><input type="checkbox" name="status_width" value="1" /></span>
		  <input type="text" name="width" value="" placeholder="<?php echo $entry_width; ?>" id="input-width" class="form-control" />
		</div>
	  </div>
	  <label class="col-sm-3 control-label" for="input-weight"><?php echo $entry_weight; ?></label>
	  <div class="col-sm-3">
		<div class="input-group">
		  <span class="input-group-addon"><input type="checkbox" name="status_weight" value="1" /></span>
		  <input type="text" name="weight" value="" placeholder="<?php echo $entry_weight; ?>" id="input-weight" class="form-control" />
		</div>
	  </div>
	</div>
	<div class="form-group">	
	  <label class="col-sm-3 control-label" for="input-length-class"><?php echo $entry_length_class; ?></label>
	  <div class="col-sm-3">
		<div class="input-group">
		  <span class="input-group-addon"><input type="checkbox" name="status_length_class" value="1" /></span>
		  <select name="length_class_id" id="input-length-class" class="form-control">
			<?php foreach ($length_classes as $length_class) { ?>
			  <option value="<?php echo $length_class['length_class_id']; ?>"><?php echo $length_class['title']; ?></option>
			<?php } ?>
		  </select>
		</div>
	  </div>
	  <label class="col-sm-3 control-label" for="input-length-class"><?php echo $entry_weight_class; ?></label>
	  <div class="col-sm-3">
		<div class="input-group">
		  <span class="input-group-addon"><input type="checkbox" name="status_weight_class" value="1" /></span>
		  <select name="weight_class_id" id="input-weight-class" class="form-control">
			<?php foreach ($weight_classes as $weight_class) { ?>
			  <option value="<?php echo $weight_class['weight_class_id']; ?>"><?php echo $weight_class['title']; ?></option>
			<?php } ?>
		  </select>
		</div>
	  </div>
	</div>
  </form>
</div>
<div class="modal-footer">
  <div class="text-center"><a data-form="form-mass-product-weight" class="button-save btn btn-info btn-lg"><?php echo $button_save; ?></a></div>
</div>
<script type="text/javascript"><!--
$(".button-save").on('click', function(){		
	$.ajax({
		url: $('#' + $(this).data('form')).attr('action'),
		type: 'post',
		dataType: 'json',
		data: $('#product-list input[type=\'checkbox\']:checked, #' + $(this).data('form') + ' input[type=\'text\'], #' + $(this).data('form') + ' input[type=\'checkbox\']:checked, #' + $(this).data('form') + ' select'),
		success: function(json) {				
			if (json['error']) {
				$('#form-mass-product-weight').before('<div class="alert alert-danger"><i class="fa fa-exclamation-circle"></i> ' + json['error'] + '</div>');
				
				$('.alert-danger').delay(1500).fadeOut(500);	
			}
								
			if (json['success']) {
				$('#form-mass-product-weight').before('<div class="alert alert-success"><i class="fa fa-check-circle"></i> ' + json['success'] + '</div>');	
				
				setTimeout(function(){
					$('#modal-product-edit').modal('hide');
				}, 1000)
			}
		}
	});
});  
//--></script>