<div class="modal-header">
  <button type="button" class="pull-right btn btn-danger btn-sm" data-dismiss="modal" aria-hidden="true"><i class="fa fa-close"></i></button>
  <h4 class="modal-title"><?php echo $category_name; ?> - <?php echo $text_filter; ?></h4>
</div>
<div class="modal-body">
  <form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data" id="form-filter-category" class="form-horizontal">
	<div class="form-group">
      <div class="col-sm-12">
        <input type="text" name="filter" value="" placeholder="<?php echo $entry_filter; ?>" id="input-filter" class="form-control" />
        <div id="category-filter" class="well well-sm maxy-scrollbox" style="height: 300px; overflow: auto;">
          <?php foreach ($category_filters as $category_filter) { ?>
            <div id="category-filter<?php echo $category_filter['filter_id']; ?>"><div class="btn btn-danger scr-box"><i class="fa fa-minus-circle"></i></div> <?php echo $category_filter['name']; ?>
              <input type="hidden" name="category_filter[]" value="<?php echo $category_filter['filter_id']; ?>" />
			</div>
		  <?php } ?>
		</div>
	  </div>
	</div>
  </form>
</div>
<div class="modal-footer">
  <div class="text-center"><a data-form="form-filter-category" class="button-save btn btn-info btn-lg"><?php echo $button_save; ?></a></div>
</div>
<script type="text/javascript"><!--
$(".button-save").on('click', function(){
	$.ajax({
		url: $('#' + $(this).data('form')).attr('action'),
		type: 'post',
		dataType: 'json',
		data: $('#' + $(this).data('form') + ' input[type=\'hidden\']'),
		success: function(json) {
			if (json['error']) {
				$('#form-filter-category').before('<div class="alert alert-danger"><i class="fa fa-exclamation-circle"></i> ' + json['error'] + '</div>');
				
				$('.alert-danger').delay(1500).fadeOut(500);
			}
			
			if (json['success']) {
				$('#form-filter-category').before('<div class="alert alert-success"><i class="fa fa-exclamation-circle"></i> ' + json['success'] + '</div>');			
									
				setTimeout(function(){
					$('#modal-category-edit').modal('hide');
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
			url: 'index.php?route=catalog/filter/autocomplete&token=<?php echo $token; ?>&filter_name=' +  encodeURIComponent(request),
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

		$('#category-filter' + item['value']).remove();

		$('#category-filter').append('<div id="category-filter' + item['value'] + '"><div class="btn btn-danger scr-box"><i class="fa fa-minus-circle"></i></div> ' + item['label'] + '<input type="hidden" name="category_filter[]" value="' + item['value'] + '" /></div>');
	}
});

$('#category-filter').delegate('.scr-box', 'click', function() {
	$(this).parent().remove();
});
//--></script> 