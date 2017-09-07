<div class="modal-header">
  <button type="button" class="pull-right btn btn-danger btn-sm" data-dismiss="modal" aria-hidden="true"><i class="fa fa-close"></i></button>
  <h4 class="modal-title"><?php echo $product_name; ?> - <?php echo $text_tax; ?></h4>
</div>
<div class="modal-body">
  <form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data" id="form-product-tax" class="form-horizontal">
	<div class="form-group">
      <label class="col-sm-2 control-label" for="input-location"><?php echo $entry_location; ?></label>
      <div class="col-sm-10">
        <input type="text" name="location" value="<?php echo $location; ?>" placeholder="<?php echo $entry_location; ?>" id="input-location" class="form-control" />
      </div>
    </div>
	<div class="form-group">
      <label class="col-sm-2 control-label" for="input-tax-class"><?php echo $entry_tax_class; ?></label>
      <div class="col-sm-10">
        <select name="tax_class_id" id="input-tax-class" class="form-control">
          <option value="0"><?php echo $text_none; ?></option>
          <?php foreach ($tax_classes as $tax_class) { ?>
            <?php if ($tax_class['tax_class_id'] == $tax_class_id) { ?>
              <option value="<?php echo $tax_class['tax_class_id']; ?>" selected="selected"><?php echo $tax_class['title']; ?></option>
              <?php } else { ?>
              <option value="<?php echo $tax_class['tax_class_id']; ?>"><?php echo $tax_class['title']; ?></option>
            <?php } ?>
          <?php } ?>
        </select>
      </div>
    </div>
  </form>
</div>
<div class="modal-footer">
  <div class="text-center"><a data-form="form-product-tax" class="button-save btn btn-info btn-lg"><?php echo $button_save; ?></a></div>
</div>
<script type="text/javascript"><!--
$(".button-save").on('click', function() {		
	$.ajax({
		url: $('#' + $(this).data('form')).attr('action'),
		type: 'post',
		dataType: 'json',
		data: $('#' + $(this).data('form') + ' input[type=\'text\'], #' + $(this).data('form') + ' select'),
		success: function(json) {
			if (json['error']) {
				$('#form-product-tax').before('<div class="alert alert-danger"><i class="fa fa-exclamation-circle"></i> ' + json['error'] + '</div>');
				
				$('.alert-danger').delay(1500).fadeOut(500);	
			}
								
			if (json['success']) {				
				$('#form-product-tax').before('<div class="alert alert-success"><i class="fa fa-exclamation-circle"></i> ' + json['success'] + '</div>');
			
				setTimeout(function(){
					$('#modal-product-edit').modal('hide');
				}, 1000)
			}
		}
	});
}); 
//--></script>