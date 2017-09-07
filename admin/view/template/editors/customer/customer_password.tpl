<div class="modal-header">
  <button type="button" class="pull-right btn btn-danger btn-sm" data-dismiss="modal" aria-hidden="true"><i class="fa fa-close"></i></button>
  <h4 class="modal-title"><?php echo $firstname; ?> <?php echo $lastname; ?> - <?php echo $entry_password; ?></h4>
</div>
<div class="modal-body">
  <form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data" id="form-customer-password" class="form-horizontal">
    <div class="form-group required">
      <label class="col-sm-2 control-label" for="input-password"><?php echo $entry_password; ?></label>
      <div class="col-sm-10">
        <input type="password" name="password" value="" placeholder="<?php echo $entry_password; ?>" id="input-password" class="form-control" autocomplete="off" />
      </div>
    </div>
    <div class="form-group required">
      <label class="col-sm-2 control-label" for="input-confirm"><?php echo $entry_confirm; ?></label>
      <div class="col-sm-10">
        <input type="password" name="confirm" value="" placeholder="<?php echo $entry_confirm; ?>" autocomplete="off" id="input-confirm" class="form-control" />
      </div>
    </div>
  </form>
</div>
<div class="modal-footer">
  <div class="text-center"><a data-form="form-customer-password" class="button-save btn btn-info btn-lg"><?php echo $button_save; ?></a></div>
</div>
<script type="text/javascript"><!--
$(".button-save").on('click', function() {		
	$.ajax({
		url: $('#' + $(this).data('form')).attr('action'),
		type: 'post',
		dataType: 'json',
		data: $('#' + $(this).data('form') + ' input[type=\'password\']'),
		success: function(json) {
			if (json['error']) {
				$('#form-customer-password').before('<div class="alert alert-danger"><i class="fa fa-exclamation-circle"></i> ' + json['error'] + '</div>');
				
				$('.alert-danger').delay(1500).fadeOut(500);	
			}
								
			if (json['success']) {				
				$('#form-customer-password').before('<div class="alert alert-success"><i class="fa fa-exclamation-circle"></i> ' + json['success'] + '</div>');
			
				setTimeout(function(){
					$('#modal-customer-edit').modal('hide');
				}, 1000)
			}
		}
	});
}); 
//--></script>