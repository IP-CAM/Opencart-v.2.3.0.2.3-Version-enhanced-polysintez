<div class="modal-header">
  <button type="button" class="pull-right btn btn-danger btn-sm" data-dismiss="modal" aria-hidden="true"><i class="fa fa-close"></i></button>
  <h4 class="modal-title"><?php echo $product_name; ?> - <?php echo $text_stock; ?></h4>
</div>
<div class="modal-body">
  <form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data" id="form-product-stock" class="form-horizontal">
	<div class="form-group">
      <label class="col-sm-3 control-label" for="input-minimum"><span data-toggle="tooltip" title="<?php echo $help_minimum; ?>"><?php echo $entry_minimum; ?></span></label>
      <div class="col-sm-9">
        <input type="text" name="minimum" value="<?php echo $minimum; ?>" placeholder="<?php echo $entry_minimum; ?>" id="input-minimum" class="form-control" />
      </div>
    </div>
	<div class="form-group">
      <label class="col-sm-3 control-label" for="input-subtract"><?php echo $entry_subtract; ?></label>
      <div class="col-sm-9">
        <select name="subtract" id="input-subtract" class="form-control">
          <?php if ($subtract) { ?>
            <option value="1" selected="selected"><?php echo $text_yes; ?></option>
            <option value="0"><?php echo $text_no; ?></option>
            <?php } else { ?>
            <option value="1"><?php echo $text_yes; ?></option>
            <option value="0" selected="selected"><?php echo $text_no; ?></option>
          <?php } ?>
        </select>
      </div>
    </div>
    <div class="form-group">
      <label class="col-sm-3 control-label" for="input-stock-status"><span data-toggle="tooltip" title="<?php echo $help_stock_status; ?>"><?php echo $entry_stock_status; ?></span></label>
      <div class="col-sm-9">
        <select name="stock_status_id" id="input-stock-status" class="form-control">
          <?php foreach ($stock_statuses as $stock_status) { ?>
            <?php if ($stock_status['stock_status_id'] == $stock_status_id) { ?>
              <option value="<?php echo $stock_status['stock_status_id']; ?>" selected="selected"><?php echo $stock_status['name']; ?></option>
              <?php } else { ?>
              <option value="<?php echo $stock_status['stock_status_id']; ?>"><?php echo $stock_status['name']; ?></option>
            <?php } ?>
          <?php } ?>
        </select>
      </div>
    </div>
    <div class="form-group">
      <label class="col-sm-3 control-label"><?php echo $entry_shipping; ?></label>
      <div class="col-sm-9">
        <label class="radio-inline">
          <?php if ($shipping) { ?>
            <input type="radio" name="shipping" value="1" checked="checked" />
            <?php echo $text_yes; ?>
            <?php } else { ?>
            <input type="radio" name="shipping" value="1" />
            <?php echo $text_yes; ?>
          <?php } ?>
        </label>
        <label class="radio-inline">
          <?php if (!$shipping) { ?>
            <input type="radio" name="shipping" value="0" checked="checked" />
            <?php echo $text_no; ?>
            <?php } else { ?>
            <input type="radio" name="shipping" value="0" />
            <?php echo $text_no; ?>
          <?php } ?>
        </label>
      </div>
    </div>
  </form>
</div>
<div class="modal-footer">
  <div class="text-center"><a data-form="form-product-stock" class="button-save btn btn-info btn-lg"><?php echo $button_save; ?></a></div>
</div>
<script type="text/javascript"><!--
$(".button-save").on('click', function() {		
	$.ajax({
		url: $('#' + $(this).data('form')).attr('action'),
		type: 'post',
		dataType: 'json',
		data: $('#' + $(this).data('form') + ' input[type=\'text\'], #' + $(this).data('form') + ' input[type=\'radio\']:checked, #' + $(this).data('form') + ' select'),
		success: function(json) {
			if (json['error']) {
				$('#form-product-stock').before('<div class="alert alert-danger"><i class="fa fa-exclamation-circle"></i> ' + json['error'] + '</div>');
				
				$('.alert-danger').delay(1500).fadeOut(500);	
			}
								
			if (json['success']) {				
				$('#form-product-stock').before('<div class="alert alert-success"><i class="fa fa-exclamation-circle"></i> ' + json['success'] + '</div>');
			
				setTimeout(function(){
					$('#modal-product-edit').modal('hide');
				}, 1000)
			}
		}
	});
}); 
//--></script>