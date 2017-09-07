<div class="modal-header">
  <button type="button" class="pull-right btn btn-danger btn-sm" data-dismiss="modal" aria-hidden="true"><i class="fa fa-close"></i></button>
  <h4 class="modal-title"><?php echo $category_name; ?> - <?php echo $text_stores; ?></h4>
</div>
<div class="modal-body">
  <form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data" id="form-store-category" class="form-horizontal">
	<div class="form-group">
      <label class="col-sm-2 control-label"><?php echo $entry_store; ?></label>
      <div class="col-sm-10">
        <div class="well well-sm" style="height: 150px; overflow: auto;">
		  <div class="input-checkbox"">
			<label class="label-store">
			  <?php if (in_array(0, $category_store)) { ?>
				<input type="checkbox" class="checkbox" name="category_store[]" value="0" checked="checked" id="input-store" />
				<label for="input-store"></label>
				<?php } else { ?>
				<input type="checkbox" class="checkbox" name="category_store[]" value="0" id="input-store" />
				<label for="input-store"></label>
			  <?php } ?>	
			  <span><?php echo $text_default; ?></span>
			</label>
		  </div>					
          <?php foreach ($stores as $store) { ?>                      
			<div class="input-checkbox">
			  <label class="label-store">
				<?php if (in_array($store['store_id'], $category_store)) { ?>
				  <input type="checkbox" class="checkbox" name="category_store[]" value="<?php echo $store['store_id']; ?>" checked="checked" id="input-store<?php echo $store['store_id']; ?>" />
				  <label for="input-store<?php echo $store['store_id']; ?>"></label>
				  <?php } else { ?>
				  <input type="checkbox" class="checkbox" name="category_store[]" value="<?php echo $store['store_id']; ?>" id="input-store<?php echo $store['store_id']; ?>" />
				  <label for="input-store<?php echo $store['store_id']; ?>"></label>						    
				<?php } ?>
				<span><?php echo $store['name']; ?></span>
			  </label>
			</div>					  
          <?php } ?>
        </div>
      </div>
    </div>
	<div class="form-group">
      <label class="col-sm-2 control-label" for="input-column"><span data-toggle="tooltip" title="<?php echo $help_column; ?>"><?php echo $entry_column; ?></span></label>
      <div class="col-sm-10">
        <input type="text" name="column" value="<?php echo $column; ?>" placeholder="<?php echo $entry_column; ?>" id="input-column" class="form-control" />
      </div>
    </div>
  </form>
</div>
<div class="modal-footer">
  <div class="text-center"><a data-form="form-store-category" class="button-save btn btn-info btn-lg"><?php echo $button_save; ?></a></div>
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
				$('#form-store-category').before('<div class="alert alert-danger"><i class="fa fa-exclamation-circle"></i> ' + json['error'] + '</div>');
				
				$('.alert-danger').delay(1500).fadeOut(500);
			}
									
			if (json['success']) {
				$('#form-store-category').before('<div class="alert alert-success"><i class="fa fa-check-circle"></i> ' + json['success'] + '</div>');				
									
				setTimeout(function(){
					$('#modal-category-edit').modal('hide');
				}, 1000)
			}
		}
	});
});   
//--></script>