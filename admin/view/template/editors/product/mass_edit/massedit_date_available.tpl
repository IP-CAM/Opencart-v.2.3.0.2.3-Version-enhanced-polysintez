<div class="modal-header">
  <button type="button" class="pull-right btn btn-danger btn-sm" data-dismiss="modal" aria-hidden="true"><i class="fa fa-close"></i></button>
  <h4 class="modal-title"><?php echo $text_date_available; ?></h4>
</div>
<div class="modal-body" id="body-mass-product-dateavailable">
  <form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data" id="form-mass-product-dateavailable" class="form-horizontal">	
	<div class="form-group">
	  <div class="col-sm-12">
	    <div class="alert alert-info"><i class="fa fa-info-circle"></i> <?php echo $text_edit_info_2; ?></div>
	  </div>
	</div>
	<div class="form-group">	
	  <label class="col-sm-2 control-label" for="input-date-available"><?php echo $entry_date_available; ?></label>
	  <div class="col-sm-4">
		<div class="input-group date">
		  <input type="text" name="date_available" value="" placeholder="<?php echo $entry_date_available; ?>" id="input-date-available" data-date-format="YYYY-MM-DD" class="form-control" />
		  <span class="input-group-btn"><button class="btn btn-default" type="button"><i class="fa fa-calendar"></i></button></span>
		</div>
	  </div>
	  <label class="col-sm-2 control-label" for="input-status"><?php echo $entry_status; ?></label>
	  <div class="col-sm-4">
		<div class="input-group">
		  <span class="input-group-addon"><input type="checkbox" name="product_status" value="1" /></span>
		  <select name="status" id="input-status" class="form-control">
			<option value="1" selected="selected"><?php echo $text_enabled; ?></option>
			<option value="0"><?php echo $text_disabled; ?></option>
		  </select>
		</div>
	  </div>
	</div>
  </form>
</div>
<div class="modal-footer">
  <div class="text-center"><a data-form="form-mass-product-dateavailable" class="button-save btn btn-info btn-lg"><?php echo $button_save; ?></a></div>
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
				$('#form-mass-product-dateavailable').before('<div class="alert alert-danger"><i class="fa fa-exclamation-circle"></i> ' + json['error'] + '</div>');
				
				$('.alert-danger').delay(1500).fadeOut(500);	
			}
								
			if (json['success']) {
				$('#form-mass-product-dateavailable').before('<div class="alert alert-success"><i class="fa fa-check-circle"></i> ' + json['success'] + '</div>');	
				
				setTimeout(function(){
					location.reload(true);
				}, 1000)
			}
		}
	});
});  
//--></script>
<script type="text/javascript"><!--
$('.date').datetimepicker({
	pickTime: false
});
//--></script>