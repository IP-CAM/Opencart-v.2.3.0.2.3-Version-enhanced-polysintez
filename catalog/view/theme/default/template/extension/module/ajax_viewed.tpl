<div id="load_container" style="display: none;"></div>
<script>
$(function() {
	var ajaxUrl = 'index.php?route=extension/module/ajax_viewed/getproducts';
	
	postData = {};
	
	if (<?php echo $product_id; ?> != 0) {
		postData.product_id = "<?php echo $product_id; ?>";
	} 
	
	postData.setting = "<?php echo $module_setting; ?>";
	 
	var ajaxContainer = '#load_container';

	$.post(ajaxUrl, postData)
		.done(function(data) {
		
			if(data)
				$(ajaxContainer).replaceWith(data);
				
				var cols = $('#column-right, #column-left').length;

				if (cols == 2) {
					$('.product-viewed').attr('class', 'product-layout product-grid col-lg-6 col-md-6 col-sm-12 col-xs-12');
				} else if (cols == 1) {
					$('.product-viewed').attr('class', 'product-layout product-grid col-lg-4 col-md-4 col-sm-6 col-xs-12');
				} else {
					$('.product-viewed').attr('class', 'product-layout product-grid col-lg-3 col-md-3 col-sm-6 col-xs-12');
				}
				
				
		});

});
</script>
