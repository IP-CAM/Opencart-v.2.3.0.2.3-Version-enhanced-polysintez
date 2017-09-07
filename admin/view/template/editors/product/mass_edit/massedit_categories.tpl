<div class="modal-header">
  <button type="button" class="pull-right btn btn-danger btn-sm" data-dismiss="modal" aria-hidden="true"><i class="fa fa-close"></i></button>
  <h4 class="modal-title"><?php echo $column_category; ?></h4>
</div>
<div class="modal-body" id="body-mass-product-categories">
  <form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data" id="form-mass-product-categories" class="form-horizontal">	
	<div class="form-group">
	  <label class="col-sm-3 control-label" for="input-main-category"><?php echo $entry_main_category; ?></label>
      <div class="col-sm-9">
	    <input type="text" name="main_category" value="" placeholder="<?php echo $entry_main_category; ?>" id="input-main-category" class="form-control" />
	    <input type="hidden" name="main_category_id" value="" class="form-control" />
	  </div>
	</div>
	<div class="form-group">	
	  <label class="col-sm-3 control-label" for="input-category"><?php echo $entry_category; ?></label>
	  <div class="col-md-9">
		<input type="text" name="category" value="" placeholder="<?php echo $entry_category; ?>" id="input-category" class="form-control" />
		<div id="product-category" class="well well-sm maxy-scrollbox" style="height: 230px; overflow: auto;">
		  <input type="hidden" name="product_category[]" value="" id="product-category-value" />			
		</div>
	  </div>
	</div>
	<div class="form-group">	
	  <label class="col-sm-3 control-label" for="input-category-method"><?php echo $entry_method_edit; ?></label>
	  <div class="col-sm-9">
		<select name="category_method_edit" id="input-category-method" class="form-control">
		  <option value="all_new"><?php echo $text_all_new; ?></option>
		  <option value="add_selected"><?php echo $text_add_selected; ?></option>
		  <option value="delete_selected"><?php echo $text_delete_selected; ?></option>
		</select>
	  </div>
	</div>
  </form>
</div>
<div class="modal-footer">
  <div class="text-center"><a data-form="form-mass-product-categories" class="button-save btn btn-info btn-lg"><?php echo $button_save; ?></a></div>
</div>
<script type="text/javascript"><!--
$(".button-save").on('click', function(){		
	$.ajax({
		url: $('#' + $(this).data('form')).attr('action'),
		type: 'post',
		dataType: 'json',
		data: $('#product-list input[type=\'checkbox\']:checked, #' + $(this).data('form') + ' input[type=\'hidden\'], #' + $(this).data('form') + ' select'),
		success: function(json) {				
			if (json['error']) {
				$('#form-mass-product-categories').before('<div class="alert alert-danger"><i class="fa fa-exclamation-circle"></i> ' + json['error'] + '</div>');
				
				$('.alert-danger').delay(1500).fadeOut(500);	
			}
								
			if (json['success']) {
				$('#form-mass-product-categories').before('<div class="alert alert-success"><i class="fa fa-check-circle"></i> ' + json['success'] + '</div>');	
				
				setTimeout(function(){
					location.reload(true);
				}, 1000)
			}
		}
	});
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