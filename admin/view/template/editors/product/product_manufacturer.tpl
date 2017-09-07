<div class="popover-content">
  <form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data" id="form-product-manufacturer-<?php echo $product_id; ?>">
    <input type="text" name="manufacturer" value="<?php echo $manufacturer; ?>" placeholder="<?php echo $column_manufacturer; ?>" class="form-control" />
	<input type="hidden" name="manufacturer_id" value="<?php echo $manufacturer_id; ?>" />
  </form>
</div>
<div class="popover-footer">
  <a data-form="form-product-manufacturer-<?php echo $product_id; ?>" class="button-save btn btn-primary btn-sm"><i class="fa fa-save fa-fw"></i></a><a id="clear-product-manufacturer-<?php echo $product_id; ?>" class="btn btn-danger btn-sm"><i class="fa fa-eraser fa-fw"></i></a>
</div>
<script type="text/javascript"><!--
$('.button-save').on('click', function() {	
	var manufacturer_id = $('input[name=\'manufacturer_id\']').val(); 
	
	$.ajax({
		url: $('#' + $(this).data('form')).attr('action'),
		type: 'post',
		dataType: 'json',
		data: $('#form-product-manufacturer-<?php echo $product_id; ?> input[type=\'hidden\']'),
		success: function(json) {									
			if (json['error']) {								
				$('.messages-body').html('<div class="alert alert-danger alert-messages"><i class="fa fa-check-circle"></i> ' + json['error'] + '</div>');$('.maxy-backdrop, .messages-body').show().delay(1500).fadeOut(500);
			}
									
			if (json['success']) {
				$('.messages-body').html('<div class="alert alert-success alert-messages"><i class="fa fa-check-circle"></i> ' + json['success'] + '</div>');$('.maxy-backdrop, .messages-body').show().delay(1000).fadeOut(500);			
				
				$('#product-manufacturer<?php echo $product_id; ?>').load('index.php?route=editors/product_edit/loadProductManufacturer&token=<?php echo $token; ?>&manufacturer_id=' + manufacturer_id);
				
				$('#close-manufacturer-<?php echo $product_id; ?>').trigger('click');
			}
		}
	});
}); 

$('#close-manufacturer-<?php echo $product_id; ?>').on('click', function() {
	$('#form-product-manufacturer-<?php echo $product_id; ?>').empty();
	$('#product-manufacturer-<?php echo $product_id; ?>').popoverMaxy('hide');
});	

$('#product-manufacturer-<?php echo $product_id; ?>').on('hide.bs.modal', function () {
	$('#form-product-manufacturer-<?php echo $product_id; ?>').empty();
});

$('#clear-product-manufacturer-<?php echo $product_id; ?>').on('click', function() {
	$('#form-product-manufacturer-<?php echo $product_id; ?>').find('input').val('');
}); 
//--></script>
<script type="text/javascript"><!--
$('input[name=\'manufacturer\']').autocomplete({
	'source': function(request, response) {
		$.ajax({
			url: 'index.php?route=editors/manufacturer/autocomplete&token=' + getURLVar('token') + '&filter_name=' +  encodeURIComponent(request),
			dataType: 'json',
			success: function(json) {
				response($.map(json, function(item) {
					return {
						label: item['name'],
						value: item['manufacturer_id']
					}
				}));
			}
		});
	},
	'select': function(item) {
		$('input[name=\'manufacturer\']').val(item['label']);
		$('input[name=\'manufacturer_id\']').val(item['value']);
	}
}); 
//--></script>