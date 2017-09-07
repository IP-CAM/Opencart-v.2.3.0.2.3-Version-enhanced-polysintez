<div class="modal-header">
  <button type="button" class="pull-right btn btn-danger btn-sm" data-dismiss="modal" aria-hidden="true"><i class="fa fa-close"></i></button>
  <h4 class="modal-title"><?php echo $category_name; ?> - <?php echo $text_parent; ?></h4>
</div>
<div class="modal-body" id="body-category-parent">
  <form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data" id="form-parent-category" class="form-horizontal">	
	<div class="form-group">
	  <div class="col-sm-12">
        <input type="text" name="path" value="<?php echo $path; ?>" placeholder="<?php echo $entry_parent; ?>" id="input-parent" class="form-control" />
        <input type="hidden" name="parent_id" value="<?php echo $parent_id; ?>" />
	  </div>
	</div>
  </form>
</div>
<div class="modal-footer">
  <div class="text-center"><a data-form="form-parent-category" class="button-save btn btn-info btn-lg"><?php echo $button_save; ?></a></div>
</div>
<script type="text/javascript"><!--
$(".button-save").on('click', function(){
	$.ajax({
		url: $('#' + $(this).data('form')).attr('action'),
		type: 'post',
		dataType: 'json',
		data: $('#' + $(this).data('form') + ' input[type=\'text\'], #' + $(this).data('form') + ' input[type=\'hidden\']'),
		success: function(json) {
			if (json['error']) {
				$('#form-parent-category').before('<div class="alert alert-danger"><i class="fa fa-exclamation-circle"></i> ' + json['error'] + '</div>');
				
				setTimeout(function(){
					$('#body-category-parent .alert-danger').addClass('hide');
				}, 1500)	
			}
									
			if (json['success']) {
				$('#form-parent-category').before('<div class="alert alert-success"><i class="fa fa-exclamation-circle"></i> ' + json['success'] + '</div>');			
									
				setTimeout(function(){			
					location.reload(true);
				}, 500);
			}
		},
        error: function(xhr, ajaxOptions, thrownError) {
            alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
        }
		
	});
});   
//--></script>
<script type="text/javascript"><!--
$('input[name=\'path\']').autocomplete({
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
		$('input[name=\'path\']').val(item['label']);
		$('input[name=\'parent_id\']').val(item['value']);
	}
});
//--></script> 