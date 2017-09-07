<div class="modal-header">
  <button type="button" class="pull-right btn btn-danger btn-sm" data-dismiss="modal" aria-hidden="true"><i class="fa fa-close"></i></button>
  <h4 class="modal-title"><?php echo $entry_store; ?></h4>
</div>
<div class="modal-body" id="body-mass-product-store">
  <form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data" id="form-mass-product-store" class="form-horizontal">	
	<div class="form-group">	
	  <label class="col-sm-3 control-label"><?php echo $entry_store; ?></label>
	  <div class="col-sm-9">
		<div class="well well-sm" style="height: 150px; overflow: auto;">
		  <div class="input-checkbox"">
			<label class="label-store">
			  <input type="checkbox" class="checkbox" name="product_store[]" value="0" id="input-store" />
			  <label for="input-store"></label>	
			  <span><?php echo $text_default; ?></span>
			</label>
		  </div>
		  <?php foreach ($stores as $store) { ?>
			<div class="input-checkbox">
			  <label class="label-store">
				<input type="checkbox" class="checkbox" name="product_store[]" value="<?php echo $store['store_id']; ?>" id="input-store<?php echo $store['store_id']; ?>" />
				<label for="input-store<?php echo $store['store_id']; ?>"></label>						    
				<span><?php echo $store['name']; ?></span>
			  </label>
			</div>	
		  <?php } ?>
		</div>
	  </div>
	</div>
	<div class="form-group">	
	  <label class="col-sm-3 control-label" for="input-store-method"><?php echo $entry_method_edit; ?></label>
	  <div class="col-sm-9">
		<select name="store_method_edit" id="input-store-method" class="form-control">
		  <option value="all_new"><?php echo $text_all_new; ?></option>
		  <option value="add_selected"><?php echo $text_add_selected; ?></option>
		  <option value="delete_selected"><?php echo $text_delete_selected; ?></option>
		</select>
	  </div>
	</div>
  </form>
</div>
<div class="modal-footer">
  <div class="text-center"><a data-form="form-mass-product-store" class="button-save btn btn-info btn-lg"><?php echo $button_save; ?></a></div>
</div>
<script type="text/javascript"><!--
$(".button-save").on('click', function(){		
	$.ajax({
		url: $('#' + $(this).data('form')).attr('action'),
		type: 'post',
		dataType: 'json',
		data: $('#product-list input[type=\'checkbox\']:checked, #' + $(this).data('form') + ' input[type=\'checkbox\']:checked, #' + $(this).data('form') + ' select'),
		success: function(json) {				
			if (json['error']) {
				$('#form-mass-product-store').before('<div class="alert alert-danger"><i class="fa fa-exclamation-circle"></i> ' + json['error'] + '</div>');
				
				$('.alert-danger').delay(1500).fadeOut(500);	
			}
								
			if (json['success']) {
				$('#form-mass-product-store').before('<div class="alert alert-success"><i class="fa fa-check-circle"></i> ' + json['success'] + '</div>');	
				
				setTimeout(function(){
					$('#modal-product-edit').modal('hide');
				}, 1000)
			}
		}
	});
});  
//--></script>