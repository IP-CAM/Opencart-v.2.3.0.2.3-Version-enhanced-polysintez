<div class="popover-content" style="height: 192px !important; padding: 0 15px;">
  <form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data" id="form-product-category-<?php echo $product_id; ?>" class="form-horizontal">
	<div class="form-group">
	  <label class="col-sm-3 control-label" for="input-main-category"><?php echo $entry_main_category; ?></label>
      <div class="col-sm-9">
	    <input type="text" name="main_category" value="<?php echo $main_category; ?>" placeholder="<?php echo $entry_main_category; ?>" id="input-main-category" class="form-control" />
	    <input type="hidden" name="main_category_id" value="<?php echo $main_category_id; ?>" class="form-control" />
	  </div>
	</div>
	<div class="form-group">	
	  <div class="col-sm-12">
	    <input type="text" name="category" value="" placeholder="<?php echo $entry_category; ?>" id="input-category" class="form-control" />
        <div id="product-category" class="well well-sm maxy-scrollbox" style="height: 124px; overflow: auto;">
          <?php foreach ($product_categories as $product_category) { ?>
            <div id="product-category<?php echo $product_category['category_id']; ?>"><div class="btn btn-danger scr-box"><i class="fa fa-minus-circle"></i></div> <?php echo $product_category['name']; ?>
              <input type="hidden" name="product_category[]" value="<?php echo $product_category['category_id']; ?>" />
		    </div>
          <?php } ?>
        </div>
	  </div>
	</div>
  </form>
</div>
<div class="popover-footer">
  <a data-form="form-product-category-<?php echo $product_id; ?>" class="button-save btn btn-primary btn-sm"><i class="fa fa-save fa-fw"></i></a>
</div>
<script type="text/javascript"><!--
$('.button-save').on('click', function() {	
	$.ajax({
		url: $('#' + $(this).data('form')).attr('action'),
		type: 'post',
		dataType: 'json',
		data: $('#form-product-category-<?php echo $product_id; ?> input[type=\'hidden\']'),
		success: function(json) {									
			if (json['error']) {								
				$('.messages-body').html('<div class="alert alert-danger alert-messages"><i class="fa fa-check-circle"></i> ' + json['error'] + '</div>');$('.maxy-backdrop, .messages-body').show().delay(1500).fadeOut(500);
			}
									
			if (json['success']) {
				$('.messages-body').html('<div class="alert alert-success alert-messages"><i class="fa fa-check-circle"></i> ' + json['success'] + '</div>');$('.maxy-backdrop, .messages-body').show().delay(1000).fadeOut(500);			
				
				$('#product-categories-<?php echo $product_id; ?>').load('index.php?route=editors/product_edit/loadCategory&token=<?php echo $token; ?>&product_id=<?php echo $product_id; ?>');
				$('#close-category-<?php echo $product_id; ?>').trigger('click');
			}
		}
	});
}); 

$('#close-category-<?php echo $product_id; ?>').on('click', function() {
	$('#form-product-category-<?php echo $product_id; ?>').empty();
	$('#product-category-<?php echo $product_id; ?>').popoverMaxy('hide');
});	

$('#product-category-<?php echo $product_id; ?>').on('hide.bs.modal', function () {
	$('#form-product-category-<?php echo $product_id; ?>').empty();
});
//--></script>
<script type="text/javascript"><!--	
$('input[name=\'category\']').autocomplete({
	'source': function(request, response) {
		$.ajax({
			url: 'index.php?route=editors/category/autocomplete&token=<?php echo $token; ?>&filter_name=' +  encodeURIComponent(request),
			dataType: 'json',			
			success: function(json) {
				response($.map(json, function(item) {
					return {
						label: item['name'],
						value: item['category_id']
					}
				}));
			}
		});
	},
	'select': function(item) {
		$('input[name=\'category\']').val('');
		
		$('#product-category' + item['value']).remove();
		
		$('#product-category').append('<div id="product-category' + item['value'] + '"><div class="btn btn-danger scr-box"><i class="fa fa-minus-circle"></i></div> ' + item['label'] + '<input type="hidden" name="product_category[]" value="' + item['value'] + '" /></div>');	
	}
});

$('#product-category').delegate('.scr-box', 'click', function() {
	$(this).parent().remove();
});

$('input[name=\'main_category\']').autocomplete({
	'source': function(request, response) {
		$.ajax({
			url: 'index.php?route=editors/category/autocomplete&token=<?php echo $token; ?>&filter_name=' +  encodeURIComponent(request),
			dataType: 'json',			
			success: function(json) {
				json.unshift({
					category_id: 0,
					name: '<?php echo $text_none; ?>'
				});
				
				response($.map(json, function(item) {
					return {
						label: item['name'],
						value: item['category_id']
					}
				}));
			}
		});
	},
	'select': function(item) {
		$('input[name=\'main_category\']').val(item['label']);
		$('input[name=\'main_category_id\']').val(item['value']);		
	}
});
//--></script>