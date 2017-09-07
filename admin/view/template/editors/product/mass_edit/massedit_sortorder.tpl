<div class="modal-header">
  <button type="button" class="pull-right btn btn-danger btn-sm" data-dismiss="modal" aria-hidden="true"><i class="fa fa-close"></i></button>
  <h4 class="modal-title"><?php echo $entry_sort_order; ?></h4>
</div>
<div class="modal-body" id="body-mass-product-sort">
  <form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data" id="form-mass-product-sort" class="form-horizontal">	
	<div class="form-group">
	  <div class="alert alert-info"><i class="fa fa-info-circle"></i> <?php echo $text_sort_info; ?></div>
	</div>
	<div class="form-group">
      <label class="col-sm-2 control-label" for="input-sort-order"><?php echo $entry_start; ?></label>
      <div class="col-sm-10">
        <input type="text" name="sort_order" value="" placeholder="<?php echo $entry_start; ?>" id="input-sort-order" class="form-control" />
      </div>
    </div>
  </form>
</div>
<div class="modal-footer">
  <div class="text-center"><a data-form="form-mass-product-sort" class="button-save btn btn-info btn-lg"><?php echo $button_save; ?></a></div>
</div>
<script type="text/javascript"><!--
$(".button-save").on('click', function(){		
	$.ajax({
		url: $('#' + $(this).data('form')).attr('action'),
		type: 'post',
		dataType: 'json',
		data: $('#product-list input[type=\'checkbox\']:checked, #' + $(this).data('form') + ' input[type=\'text\']'),
		success: function(json) {				
			if (json['error']) {
				$('#form-mass-product-sort').before('<div class="alert alert-danger"><i class="fa fa-exclamation-circle"></i> ' + json['error'] + '</div>');
				
				$('.alert-danger').delay(1500).fadeOut(500);	
			}
								
			if (json['success']) {
				$('#form-mass-product-sort').before('<div class="alert alert-success"><i class="fa fa-check-circle"></i> ' + json['success'] + '</div>');			
				
				setTimeout(function(){
					location.reload(true);
				}, 1000)
			}
		}
	});
});  
//--></script>