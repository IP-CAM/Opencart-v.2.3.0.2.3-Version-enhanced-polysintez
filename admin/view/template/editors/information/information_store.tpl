<div class="modal-header">
  <button type="button" class="pull-right btn btn-danger btn-sm" data-dismiss="modal" aria-hidden="true"><i class="fa fa-close"></i></button>
  <h4 class="modal-title"><?php echo $information_title; ?> - <?php echo $text_store; ?></h4>
</div>
<div class="modal-body">
  <form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data" id="form-store-information" class="form-horizontal">
	<div class="form-group">
      <div class="col-sm-12">
        <div class="well well-sm" style="height: 150px; overflow: auto;">
		  <div class="input-checkbox"">
			<label class="label-store">
			  <?php if (in_array(0, $information_store)) { ?>
				<input type="checkbox" class="checkbox" name="information_store[]" value="0" checked="checked" id="input-store" />
				<label for="input-store"></label>
				<?php } else { ?>
				<input type="checkbox" class="checkbox" name="information_store[]" value="0" id="input-store" />
				<label for="input-store"></label>
			  <?php } ?>	
			  <span><?php echo $text_default; ?></span>
			</label>
		  </div>					
          <?php foreach ($stores as $store) { ?>                      
			<div class="input-checkbox">
			  <label class="label-store">
				<?php if (in_array($store['store_id'], $information_store)) { ?>
				  <input type="checkbox" class="checkbox" name="information_store[]" value="<?php echo $store['store_id']; ?>" checked="checked" id="input-store<?php echo $store['store_id']; ?>" />
				  <label for="input-store<?php echo $store['store_id']; ?>"></label>
				  <?php } else { ?>
				  <input type="checkbox" class="checkbox" name="information_store[]" value="<?php echo $store['store_id']; ?>" id="input-store<?php echo $store['store_id']; ?>" />
				  <label for="input-store<?php echo $store['store_id']; ?>"></label>						    
				<?php } ?>
				<span><?php echo $store['name']; ?></span>
			  </label>
			</div>					  
          <?php } ?>
        </div>
      </div>
    </div>
  </form>
</div>
<div class="modal-footer">
  <div class="text-center"><a data-form="form-store-information" class="button-save btn btn-info btn-lg"><?php echo $button_save; ?></a></div>
</div>
<script type="text/javascript"><!--
$(".button-save").on('click', function(){
	$.ajax({
		url: $('#' + $(this).data('form')).attr('action'),
		type: 'post',
		dataType: 'json',
		data: $('#' + $(this).data('form') + ' input[type=\'text\'], #' + $(this).data('form') + ' input[type=\'checkbox\']:checked'),
		success: function(json) {
			if (json['error']) {
				$('#form-store-information').before('<div class="alert alert-danger"><i class="fa fa-exclamation-circle"></i> ' + json['error'] + '</div>');
				
				$('.alert-danger').delay(1500).fadeOut(500);
			}
									
			if (json['success']) {
				$('#form-store-information').before('<div class="alert alert-success"><i class="fa fa-check-circle"></i> ' + json['success'] + '</div>');				
									
				setTimeout(function(){
					$('#modal-information-edit').modal('hide');
				}, 1000)
			}
		}
	});
});   
//--></script>