<div class="modal-header">
  <button type="button" class="pull-right btn btn-danger btn-sm" data-dismiss="modal" aria-hidden="true"><i class="fa fa-close"></i></button>
  <h4 class="modal-title"><?php echo $text_images; ?></h4>
</div>
<div class="modal-body" id="body-mass-product-images">
  <form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data" id="form-mass-product-images" class="form-horizontal">	
	<div class="form-group">
 	  <div class="col-sm-12	">
	    <table id="images" class="table table-striped table-bordered table-hover">
		  <thead>
			<tr>
			  <td class="text-left"><?php echo $entry_image; ?></td>
			  <td class="text-right"><?php echo $entry_sort_order; ?></td>
			  <td width="1%"></td>
			</tr>
		  </thead>
		  <tbody>
			<?php $image_row = 0; ?>
			<tr id="image-row<?php echo $image_row; ?>"></tr>
			<?php $image_row++; ?>
		  </tbody>
		  <tfoot>
			<tr>
			  <td colspan="2"></td>
			  <td class="text-left"><button type="button" onclick="addImage();" class="btn btn-primary"><i class="fa fa-plus-circle"></i></button></td>
			</tr>
		  </tfoot>
		</table>
	  </div>
	</div>
	<div class="form-group">	
	  <label class="col-sm-3 control-label" for="input-images-method"><?php echo $entry_method_edit; ?></label>
	  <div class="col-sm-9">
		<select name="option_images_edit" id="input-images-method" class="form-control">
		  <option value="all_new"><?php echo $text_all_new; ?></option>
		  <option value="add_selected"><?php echo $text_add_selected; ?></option>
		  <option value="delete_selected"><?php echo $text_delete_selected; ?></option>
		</select>
	  </div>
	</div>
  </form>
</div>
<div class="modal-footer">
  <div class="text-center"><a data-form="form-mass-product-images" class="button-save btn btn-info btn-lg"><?php echo $button_save; ?></a></div>
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
				$('#form-mass-product-images').before('<div class="alert alert-danger"><i class="fa fa-exclamation-circle"></i> ' + json['error'] + '</div>');
				
				$('.alert-danger').delay(1500).fadeOut(500);
			}
								
			if (json['success']) {
				$('#form-mass-product-images').before('<div class="alert alert-success"><i class="fa fa-check-circle"></i> ' + json['success'] + '</div>');	
				
				setTimeout(function(){
					$('#modal-product-edit').modal('hide');
				}, 1000)
			}
		}
	});
});  
//--></script>
<script type="text/javascript"><!--
var image_row = <?php echo $image_row; ?>;

function addImage() {
	html  = '<tr id="image-row' + image_row + '">';
	html += '  <td class="text-left"><a href="" id="thumb-image' + image_row + '"data-toggle="image" class="img-thumbnail"><img src="<?php echo $placeholder; ?>" alt="" title="" data-placeholder="<?php echo $placeholder; ?>" /><input type="hidden" name="product_image[' + image_row + '][image]" value="" id="input-image' + image_row + '" /></td>';
	html += '  <td class="text-right"><input type="text" name="product_image[' + image_row + '][sort_order]" value="" placeholder="<?php echo $entry_sort_order; ?>" class="form-control" /></td>';
	html += '  <td class="text-left"><button type="button" onclick="$(\'#image-row' + image_row  + '\').remove();" class="btn btn-danger"><i class="fa fa-minus-circle"></i></button></td>';
	html += '</tr>';
	
	$('#images tbody').append(html);
	
	image_row++;
}
//--></script>