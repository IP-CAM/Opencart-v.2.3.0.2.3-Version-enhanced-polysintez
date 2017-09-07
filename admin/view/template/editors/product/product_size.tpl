<div class="modal-header">
  <button type="button" class="pull-right btn btn-danger btn-sm" data-dismiss="modal" aria-hidden="true"><i class="fa fa-close"></i></button>
  <h4 class="modal-title"><?php echo $product_name; ?> - <?php echo $text_size; ?></h4>
</div>
<div class="modal-body">
  <form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data" id="form-product-size" class="form-horizontal">
    <div class="form-group">
      <label class="col-sm-3 control-label" for="input-length"><?php echo $entry_dimension; ?></label>
      <div class="col-sm-9">
        <div class="row">
          <div class="col-sm-4">
            <input type="text" name="length" value="<?php echo $length; ?>" placeholder="<?php echo $entry_length; ?>" id="input-length" class="form-control" />
          </div>
          <div class="col-sm-4">
            <input type="text" name="width" value="<?php echo $width; ?>" placeholder="<?php echo $entry_width; ?>" id="input-width" class="form-control" />
          </div>
          <div class="col-sm-4">
            <input type="text" name="height" value="<?php echo $height; ?>" placeholder="<?php echo $entry_height; ?>" id="input-height" class="form-control" />
          </div>
        </div>
      </div>
    </div>
    <div class="form-group">
      <label class="col-sm-3 control-label" for="input-length-class"><?php echo $entry_length_class; ?></label>
      <div class="col-sm-9">
        <select name="length_class_id" id="input-length-class" class="form-control">
          <?php foreach ($length_classes as $length_class) { ?>
            <?php if ($length_class['length_class_id'] == $length_class_id) { ?>
              <option value="<?php echo $length_class['length_class_id']; ?>" selected="selected"><?php echo $length_class['title']; ?></option>
              <?php } else { ?>
              <option value="<?php echo $length_class['length_class_id']; ?>"><?php echo $length_class['title']; ?></option>
            <?php } ?>
          <?php } ?>
        </select>
      </div>
    </div>
    <div class="form-group">
      <label class="col-sm-3 control-label" for="input-weight"><?php echo $entry_weight; ?></label>
      <div class="col-sm-9">
        <input type="text" name="weight" value="<?php echo $weight; ?>" placeholder="<?php echo $entry_weight; ?>" id="input-weight" class="form-control" />
      </div>
    </div>
    <div class="form-group">
      <label class="col-sm-3 control-label" for="input-weight-class"><?php echo $entry_weight_class; ?></label>
      <div class="col-sm-9">
        <select name="weight_class_id" id="input-weight-class" class="form-control">
          <?php foreach ($weight_classes as $weight_class) { ?>
            <?php if ($weight_class['weight_class_id'] == $weight_class_id) { ?>
              <option value="<?php echo $weight_class['weight_class_id']; ?>" selected="selected"><?php echo $weight_class['title']; ?></option>
              <?php } else { ?>
              <option value="<?php echo $weight_class['weight_class_id']; ?>"><?php echo $weight_class['title']; ?></option>
            <?php } ?>
          <?php } ?>
        </select>
      </div>
    </div>
  </form>
</div>
<div class="modal-footer">
  <div class="text-center"><a data-form="form-product-size" class="button-save btn btn-info btn-lg"><?php echo $button_save; ?></a></div>
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
				$('#form-product-size').before('<div class="alert alert-danger"><i class="fa fa-exclamation-circle"></i> ' + json['error'] + '</div>');
				
				$('.alert-danger').delay(1500).fadeOut(500);	
			}
								
			if (json['success']) {				
				$('#form-product-size').before('<div class="alert alert-success"><i class="fa fa-exclamation-circle"></i> ' + json['success'] + '</div>');
			
				setTimeout(function(){
					$('#modal-product-edit').modal('hide');
				}, 1000)
			}
		}
	});
}); 
//--></script>