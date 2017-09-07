<div class="modal-header">
  <button type="button" class="pull-right btn btn-danger btn-sm" data-dismiss="modal" aria-hidden="true"><i class="fa fa-close"></i></button>
  <h4 class="modal-title"><?php echo $entry_filter; ?></h4>
</div>
<div class="modal-body" id="body-mass-product-filter">
  <form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data" id="form-mass-product-filter" class="form-horizontal">	
	<div class="form-group">	
	  <label class="col-sm-3 control-label" for="input-filter"><?php echo $entry_filter; ?></label>
	  <div class="col-sm-9">
		<input type="text" name="filter" value="" placeholder="<?php echo $entry_filter; ?>" id="input-filter" class="form-control" />
		<div id="product-filter" class="well well-sm maxy-scrollbox" style="height: 300px; overflow: auto;">
		  <input type="hidden" name="product_filter[]" value="" id="product-filter-value" />			
		</div>
	  </div>
	</div>
	<div class="form-group">	
	  <label class="col-sm-3 control-label" for="input-filter-method"><?php echo $entry_method_edit; ?></label>
	  <div class="col-sm-9">
		<select name="filter_method_edit" id="input-filter-method" class="form-control">
		  <option value="all_new"><?php echo $text_all_new; ?></option>
		  <option value="add_selected"><?php echo $text_add_selected; ?></option>
		  <option value="delete_selected"><?php echo $text_delete_selected; ?></option>
		</select>
	  </div>
	</div>
  </form>
</div>
<div class="modal-footer">
  <div class="text-center"><a data-form="form-mass-product-filter" class="button-save btn btn-info btn-lg"><?php echo $button_save; ?></a></div>
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
				$('#form-mass-product-filter').before('<div class="alert alert-danger"><i class="fa fa-exclamation-circle"></i> ' + json['error'] + '</div>');
				
				$('.alert-danger').delay(1500).fadeOut(500);
			}
								
			if (json['success']) {
				$('#form-mass-product-filter').before('<div class="alert alert-success"><i class="fa fa-check-circle"></i> ' + json['success'] + '</div>');	
				
				setTimeout(function(){
					$('#modal-product-edit').modal('hide');
				}, 1000)
			}
		}
	});
});  
//--></script>
<script type="text/javascript"><!--
$('input[name=\'filter\']').autocomplete({
	'source': function(request, response) {
		$.ajax({
			url: 'index.php?route=editors/filter/autocomplete&token=<?php echo $token; ?>&filter_name=' +  encodeURIComponent(request),
			dataType: 'json',			
			success: function(json) {
				response($.map(json, function(item) {
					return {
						label: item['name'],
						value: item['filter_id']
					}
				}));
			}
		});
	},
	'select': function(item) {
		$('input[name=\'filter\']').val('');
		
		$('#product-filter' + item['value']).remove();
		
		$('#product-filter').append('<div id="product-filter' + item['value'] + '"><div class="btn btn-danger scr-box"><i class="fa fa-minus-circle"></i></div> ' + item['label'] + '<input type="hidden" name="product_filter[]" value="' + item['value'] + '" /></div>');	
	}	
});

$('#product-filter').delegate('.scr-box', 'click', function() {
	$(this).parent().remove();
});
//--></script>