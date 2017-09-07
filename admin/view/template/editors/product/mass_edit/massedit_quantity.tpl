<div class="modal-header">
  <button type="button" class="pull-right btn btn-danger btn-sm" data-dismiss="modal" aria-hidden="true"><i class="fa fa-close"></i></button>
  <h4 class="modal-title"><?php echo $entry_quantity; ?></h4>
</div>
<div class="modal-body" id="body-mass-product-quantity">
  <form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data" id="form-mass-product-quantity" class="form-horizontal">	
	<div class="form-group">	
	  <label class="col-sm-3 control-label" for="input-quantity-method"><?php echo $entry_method_edit; ?></label>
	  <div class="col-sm-9">
		<select name="quantity_method" id="input-quantity-method" class="form-control">
          <option value="plus"><?php echo $text_plus; ?></option>
		  <option value="minus"><?php echo $text_minus; ?></option>
          <option value="multiply"><?php echo $text_multiply; ?></option>
          <option value="divide"><?php echo $text_divide; ?></option>
		  <option value="equality"><?php echo $text_equality; ?></option>
        </select>
	  </div>
	</div>
	<div class="form-group">
	  <label class="col-sm-3 control-label" for="input-quantity-value"><?php echo $entry_value_edit; ?></label>
	  <div class="col-sm-9">
		<input type="text" name="quantity_value" value="" placeholder="<?php echo $entry_value_edit; ?>" id="input-quantity-value" class="form-control" />
	  </div>
	</div>
  </form>
</div>
<div class="modal-footer">
  <div class="text-center"><a data-form="form-mass-product-quantity" class="button-save btn btn-info btn-lg"><?php echo $button_save; ?></a></div>
</div>
<script type="text/javascript"><!--
$(".button-save").on('click', function(){		
	$.ajax({
		url: $('#' + $(this).data('form')).attr('action'),
		type: 'post',
		dataType: 'json',
		data: $('#product-list input[type=\'checkbox\']:checked, #' + $(this).data('form') + ' input[type=\'text\'], #' + $(this).data('form') + ' select'),
		success: function(json) {				
			if (json['error']) {
				$('#form-mass-product-quantity').before('<div class="alert alert-danger"><i class="fa fa-exclamation-circle"></i> ' + json['error'] + '</div>');
				
				$('.alert-danger').delay(1500).fadeOut(500);	
			}
								
			if (json['success']) {
				$('#form-mass-product-quantity').before('<div class="alert alert-success"><i class="fa fa-check-circle"></i> ' + json['success'] + '</div>');			
				
				setTimeout(function(){
					location.reload(true);
				}, 1000)
			}
		}
	});
});  
//--></script>