<div class="modal-header">
  <button type="button" class="pull-right btn btn-danger btn-sm" data-dismiss="modal" aria-hidden="true"><i class="fa fa-close"></i></button>
  <h4 class="modal-title"><?php echo $text_code; ?></h4>
</div>
<div class="modal-body" id="body-mass-product-code">
  <form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data" id="form-mass-product-code" class="form-horizontal">	
	<div class="form-group">
	  <div class="alert alert-info"><i class="fa fa-info-circle"></i> <?php echo $text_edit_info; ?></div>
	</div>
	<div class="form-group">	
	  <label class="col-sm-2 control-label" for="input-sku"><span data-toggle="tooltip" title="<?php echo $help_sku; ?>"><?php echo $entry_sku; ?></span></label>
	  <div class="col-sm-4">
		<div class="input-group">
		  <span class="input-group-addon"><input type="checkbox" name="status_sku" value="1" /></span>
		  <input type="text" name="sku" value="" placeholder="<?php echo $entry_sku; ?>" id="input-sku" class="form-control" />
		</div>
	  </div>
	  <label class="col-sm-2 control-label" for="input-upc"><span data-toggle="tooltip" title="<?php echo $help_upc; ?>"><?php echo $entry_upc; ?></span></label>
	  <div class="col-sm-4">
		<div class="input-group">
		  <span class="input-group-addon"><input type="checkbox" name="status_upc" value="1" /></span>
		  <input type="text" name="upc" value="" placeholder="<?php echo $entry_upc; ?>" id="input-upc" class="form-control" />
		</div>
	  </div>
	</div>
	<div class="form-group">	
	  <label class="col-sm-2 control-label" for="input-ean"><span data-toggle="tooltip" title="<?php echo $help_ean; ?>"><?php echo $entry_ean; ?></span></label>
	  <div class="col-sm-4">
		<div class="input-group">
		  <span class="input-group-addon"><input type="checkbox" name="status_ean" value="1" /></span>
		  <input type="text" name="ean" value="" placeholder="<?php echo $entry_ean; ?>" id="input-ean" class="form-control" />
		</div>
	  </div>
	  <label class="col-sm-2 control-label" for="input-jan"><span data-toggle="tooltip" title="<?php echo $help_jan; ?>"><?php echo $entry_jan; ?></span></label>
	  <div class="col-sm-4">
		<div class="input-group">
		  <span class="input-group-addon"><input type="checkbox" name="status_jan" value="1" /></span>
		  <input type="text" name="jan" value="" placeholder="<?php echo $entry_jan; ?>" id="input-jan" class="form-control" />
		</div>
	  </div>
	</div>
	<div class="form-group">	
	  <label class="col-sm-2 control-label" for="input-isbn"><span data-toggle="tooltip" title="<?php echo $help_isbn; ?>"><?php echo $entry_isbn; ?></span></label>
	  <div class="col-sm-4">
		<div class="input-group">
		  <span class="input-group-addon"><input type="checkbox" name="status_isbn" value="1" /></span>
		  <input type="text" name="isbn" value="" placeholder="<?php echo $entry_isbn; ?>" id="input-isbn" class="form-control" />
		</div>
	  </div>
	  <label class="col-sm-2 control-label" for="input-mpn"><span data-toggle="tooltip" title="<?php echo $help_mpn; ?>"><?php echo $entry_mpn; ?></span></label>
	  <div class="col-sm-4">
		<div class="input-group">
		  <span class="input-group-addon"><input type="checkbox" name="status_mpn" value="1" /></span>
		  <input type="text" name="mpn" value="" placeholder="<?php echo $entry_mpn; ?>" id="input-mpn" class="form-control" />
		</div>
	  </div>
	</div>
  </form>
</div>
<div class="modal-footer">
  <div class="text-center"><a data-form="form-mass-product-code" class="button-save btn btn-info btn-lg"><?php echo $button_save; ?></a></div>
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
				$('#form-mass-product-code').before('<div class="alert alert-danger"><i class="fa fa-exclamation-circle"></i> ' + json['error'] + '</div>');
				
				$('.alert-danger').delay(1500).fadeOut(500);
			}
								
			if (json['success']) {
				$('#form-mass-product-code').before('<div class="alert alert-success"><i class="fa fa-check-circle"></i> ' + json['success'] + '</div>');	
				
				setTimeout(function(){
					$('#modal-product-edit').modal('hide');
				}, 1000)
			}
		}
	});
});  
//--></script>