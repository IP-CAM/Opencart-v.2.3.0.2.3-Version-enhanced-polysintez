<div class="modal-header">
  <button type="button" class="pull-right btn btn-danger btn-sm" data-dismiss="modal" aria-hidden="true"><i class="fa fa-close"></i></button>
  <h4 class="modal-title"><?php echo $entry_name; ?></h4>
</div>
<div class="modal-body" id="body-mass-product-name">
  <form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data" id="form-mass-product-name" class="form-horizontal">	
	<div class="form-group">
	  <?php foreach ($languages as $language) { ?>
		<div class="col-sm-12">
		  <div class="input-group"><span class="input-group-addon"><img src="language/<?php echo $language['code']; ?>/<?php echo $language['code']; ?>.png" title="<?php echo $language['name']; ?>" /></span><input type="text" name="product_description[<?php echo $language['language_id']; ?>][name]" value="" id="input-name" class="form-control" /></div><br />
		</div>
	  <?php } ?>
	</div>
  </form>
</div>
<div class="modal-footer">
  <div class="text-center"><a data-form="form-mass-product-name" class="button-save btn btn-info btn-lg"><?php echo $button_save; ?></a></div>
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
				$('#form-mass-product-name').before('<div class="alert alert-danger"><i class="fa fa-exclamation-circle"></i> ' + json['error'] + '</div>');
				
				$('.alert-danger').delay(1500).fadeOut(500);	
			}
								
			if (json['success']) {
				$('#form-mass-product-name').before('<div class="alert alert-success"><i class="fa fa-check-circle"></i> ' + json['success'] + '</div>');			
				
				setTimeout(function(){
					location.reload(true);
				}, 1000)
			}
		}
	});
});  
//--></script>