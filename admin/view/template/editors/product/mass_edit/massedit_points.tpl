<div class="modal-header">
  <button type="button" class="pull-right btn btn-danger btn-sm" data-dismiss="modal" aria-hidden="true"><i class="fa fa-close"></i></button>
  <h4 class="modal-title"><?php echo $entry_reward; ?></h4>
</div>
<div class="modal-body" id="body-mass-product-points">
  <form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data" id="form-mass-product-points" class="form-horizontal">	
	<div class="form-group">
	  <label class="col-sm-2 control-label" for="input-points"><span data-toggle="tooltip" title="<?php echo $help_points; ?>"><?php echo $entry_points; ?></span></label>
	  <div class="col-sm-10">
		<input type="text" name="points" value="" placeholder="<?php echo $entry_points; ?>" id="input-points" class="form-control" />
	  </div>
	</div>
	<div class="form-group">	
	  <div class="col-sm-12">
		<table class="table table-bordered table-hover">
		  <thead>
			<tr>
			  <td class="text-left"><?php echo $entry_customer_group; ?></td>
			  <td class="text-right"><?php echo $entry_reward; ?></td>
			</tr>
		  </thead>
		  <tbody>
			<?php foreach ($customer_groups as $customer_group) { ?>
			  <tr>
				<td class="text-left"><?php echo $customer_group['name']; ?></td>
				<td class="text-right"><input type="text" name="product_reward[<?php echo $customer_group['customer_group_id']; ?>][points]" value="" class="form-control" /></td>
			  </tr>
			<?php } ?>
		  </tbody>
		</table>
	  </div>
	</div>
  </form>
</div>
<div class="modal-footer">
  <div class="text-center"><a data-form="form-mass-product-points" class="button-save btn btn-info btn-lg"><?php echo $button_save; ?></a></div>
</div>
<script type="text/javascript"><!--
$(".button-save").on('click', function(){		
	$.ajax({
		url: $('#' + $(this).data('form')).attr('action'),
		type: 'post',
		dataType: 'json',
		data: $('#product-list input[type=\'checkbox\']:checked, #' + $(this).data('form') + ' input[type=\'text\'], #' + $(this).data('form') + ' input[type=\'hidden\'], #' + $(this).data('form') + ' select'),
		success: function(json) {				
			if (json['error']) {
				$('#form-mass-product-points').before('<div class="alert alert-danger"><i class="fa fa-exclamation-circle"></i> ' + json['error'] + '</div>');
				
				$('.alert-danger').delay(1500).fadeOut(500);	
			}
								
			if (json['success']) {
				$('#form-mass-product-points').before('<div class="alert alert-success"><i class="fa fa-check-circle"></i> ' + json['success'] + '</div>');	

				setTimeout(function(){
					$('#modal-product-edit').modal('hide');
				}, 1000)
			}
		}
	});
});  
//--></script>