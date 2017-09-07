<div class="modal-header">
  <button type="button" class="pull-right btn btn-danger btn-sm" data-dismiss="modal" aria-hidden="true"><i class="fa fa-close"></i></button>
  <h4 class="modal-title"><?php echo $text_shipping; ?></h4>
</div>
<div class="modal-body" id="body-mass-product-stock">
  <form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data" id="form-mass-product-stock" class="form-horizontal">	
	<div class="form-group">
	  <div class="col-sm-12">
	    <div class="alert alert-info"><i class="fa fa-info-circle"></i> <?php echo $text_edit_info; ?></div>
	  </div>
	</div>
	<div class="form-group">	
	  <label class="col-sm-3 control-label" for="input-subtract"><?php echo $entry_subtract; ?></label>
	  <div class="col-sm-9">
		<div class="input-group">
		  <span class="input-group-addon"><input type="checkbox" name="status_subtract" value="1" /></span>
		  <select name="subtract" id="input-subtract" class="form-control">
			<option value="1" selected="selected"><?php echo $text_yes; ?></option>
			<option value="0"><?php echo $text_no; ?></option>
		  </select>
		</div>
	  </div>
	</div>
	<div class="form-group">
	  <label class="col-sm-3 control-label" for="input-stock-status"><span data-toggle="tooltip" title="<?php echo $help_stock_status; ?>"><?php echo $entry_stock_status; ?></span></label>
	  <div class="col-sm-9">
		<div class="input-group">
		  <span class="input-group-addon"><input type="checkbox" name="status_stock_status" value="1" /></span>
		  <select name="stock_status_id" id="input-stock-status" class="form-control">
			<?php foreach ($stock_statuses as $stock_status) { ?>
			  <option value="<?php echo $stock_status['stock_status_id']; ?>"><?php echo $stock_status['name']; ?></option>
			<?php } ?>
		  </select>
		</div>
	  </div>	
	</div>
	<div class="form-group">
	  <label class="col-sm-3 control-label" for="input-shipping"><?php echo $entry_shipping; ?></label>
	  <div class="col-sm-9">
		<div class="input-group">
		  <span class="input-group-addon"><input type="checkbox" name="status_shipping" value="1" /></span>
		  <select name="shipping" id="input-shipping" class="form-control">
			<option value="1" selected="selected"><?php echo $text_yes; ?></option>
			<option value="0"><?php echo $text_no; ?></option>
		  </select>
		</div>
	  </div>
	</div>
  </form>
</div>
<div class="modal-footer">
  <div class="text-center"><a data-form="form-mass-product-stock" class="button-save btn btn-info btn-lg"><?php echo $button_save; ?></a></div>
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
				$('#form-mass-product-stock').before('<div class="alert alert-danger"><i class="fa fa-exclamation-circle"></i> ' + json['error'] + '</div>');
				
				$('.alert-danger').delay(1500).fadeOut(500);	
			}
								
			if (json['success']) {
				$('#form-mass-product-stock').before('<div class="alert alert-success"><i class="fa fa-check-circle"></i> ' + json['success'] + '</div>');	
				
				setTimeout(function(){
					$('#modal-product-edit').modal('hide');
				}, 1000)
			}
		}
	});
});  
//--></script>