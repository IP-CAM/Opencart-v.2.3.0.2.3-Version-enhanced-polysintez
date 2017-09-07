<div class="modal-header">
  <button type="button" class="pull-right btn btn-danger btn-sm" data-dismiss="modal" aria-hidden="true"><i class="fa fa-close"></i></button>
  <h4 class="modal-title"><?php echo $entry_image; ?></h4>
</div>
<div class="modal-body" id="body-mass-product-image">
  <form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data" id="form-mass-product-image" class="form-horizontal">	
	<div class="form-group text-center">
      <div class="col-sm-12">
        <a id="thumb-image" class="btn btn-link"><img src="<?php echo $placeholder; ?>" data-placeholder="<?php echo $placeholder; ?>" class="img-thumbnail" /></a>
        <input type="hidden" name="image" value="" id="input-mass-image" />
      </div>
    </div>
  </form>
</div>
<div class="modal-footer">
  <div class="text-center"><a data-form="form-mass-product-image" class="button-save btn btn-info btn-lg"><?php echo $button_save; ?></a></div>
</div>
<script type="text/javascript"><!--
$(".button-save").on('click', function(){		
	$.ajax({
		url: $('#' + $(this).data('form')).attr('action'),
		type: 'post',
		dataType: 'json',
		data: $('#product-list input[type=\'checkbox\']:checked, #' + $(this).data('form') + ' input[type=\'hidden\']'),
		success: function(json) {				
			if (json['error']) {
				$('#form-mass-product-image').before('<div class="alert alert-danger"><i class="fa fa-exclamation-circle"></i> ' + json['error'] + '</div>');
				
				$('.alert-danger').delay(1500).fadeOut(500);
			}
								
			if (json['success']) {
				$('#form-mass-product-image').before('<div class="alert alert-success"><i class="fa fa-check-circle"></i> ' + json['success'] + '</div>');			
				
				setTimeout(function(){
					location.reload(true);
				}, 1000)
			}
		}
	});
});  
//--></script>
<script type="text/javascript"><!--
$(document).ready(function() {
	$('#thumb-image').on('click', function() {
		var element = this;			
		$('#modal-image').remove();
		$.ajax({
			url: 'index.php?route=common/filemanager&token=<?php echo $token; ?>&target=' + $(element).parent().find('input').attr('id') + '&thumb=' + $(element).attr('id'),
			dataType: 'html',
			success: function(html) {
				$('body').append('<div id="modal-image" class="modal">' + html + '</div>');

				$('#modal-image').modal('show');
			}
		});
	});
});
//--></script>