<div class="modal-header">
  <button type="button" class="pull-right btn btn-danger btn-sm" data-dismiss="modal" aria-hidden="true"><i class="fa fa-close"></i></button>
  <h4 class="modal-title"><?php echo $tab_design; ?></h4>
</div>
<div class="modal-body" id="body-mass-product-design">
  <form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data" id="form-mass-product-design" class="form-horizontal">	
	<table class="table table-bordered table-hover">
	  <thead>
		<tr>
		  <td class="text-left"><?php echo $entry_store; ?></td>
		  <td class="text-left"><?php echo $entry_layout; ?></td>
		</tr>
	  </thead>
	  <tbody>
		<tr>
		  <td class="text-left"><?php echo $text_default; ?></td>
		  <td class="text-left">
			<select name="product_layout[0]" class="form-control">
			  <option value=""></option>
			  <?php foreach ($layouts as $layout) { ?>
				 <option value="<?php echo $layout['layout_id']; ?>"><?php echo $layout['name']; ?></option>
			  <?php } ?>
			</select>
		  </td>
		</tr>
		<?php foreach ($stores as $store) { ?>
		  <tr>
			<td class="text-left"><?php echo $store['name']; ?></td>
			<td class="text-left">
			  <select name="product_layout[<?php echo $store['store_id']; ?>]" class="form-control">
				<option value=""></option>
				<?php foreach ($layouts as $layout) { ?>
				  <option value="<?php echo $layout['layout_id']; ?>"><?php echo $layout['name']; ?></option>
				<?php } ?>
			  </select>
			</td>
		  </tr>
		<?php } ?>
	  </tbody>
	</table>
  </form>
</div>
<div class="modal-footer">
  <div class="text-center"><a data-form="form-mass-product-design" class="button-save btn btn-info btn-lg"><?php echo $button_save; ?></a></div>
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
				$('#form-mass-product-design').before('<div class="alert alert-danger"><i class="fa fa-exclamation-circle"></i> ' + json['error'] + '</div>');
				
				$('.alert-danger').delay(1500).fadeOut(500);	
			}
								
			if (json['success']) {
				$('#form-mass-product-design').before('<div class="alert alert-success"><i class="fa fa-check-circle"></i> ' + json['success'] + '</div>');	
				
				setTimeout(function(){
					$('#modal-product-edit').modal('hide');
				}, 1000)
			}
		}
	});
});  
//--></script>