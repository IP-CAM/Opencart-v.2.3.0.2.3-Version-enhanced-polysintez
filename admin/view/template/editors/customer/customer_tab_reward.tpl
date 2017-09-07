<div class="modal-header">
  <button type="button" class="pull-right btn btn-danger btn-sm" data-dismiss="modal" aria-hidden="true"><i class="fa fa-close"></i></button>
  <h4 class="modal-title"><?php echo $firstname; ?> <?php echo $lastname; ?> - <?php echo $tab_reward; ?></h4>
</div>
<div class="modal-body form-horizontal" id="tab-reward">
  <div class="form-group">
    <div class="col-sm-12" id="reward"></div>
  </div>
  <div class="form-group">
    <label class="col-sm-2 control-label" for="input-reward-description"><?php echo $entry_description; ?></label>
    <div class="col-sm-10">
      <input type="text" name="description" value="" placeholder="<?php echo $entry_description; ?>" id="input-reward-description" class="form-control" />
    </div>
  </div>
  <div class="form-group">
    <label class="col-sm-2 control-label" for="input-points"><span data-toggle="tooltip" title="<?php echo $help_points; ?>"><?php echo $entry_points; ?></span></label>
    <div class="col-sm-10">
      <input type="text" name="points" value="" placeholder="<?php echo $entry_points; ?>" id="input-points" class="form-control" />
    </div>
 </div>
</div>
<div class="modal-footer">
  <div class="text-center"><button id="button-reward" data-loading-text="<?php echo $text_loading; ?>" class="btn btn-info btn-lg"><i class="fa fa-plus-circle"></i> <?php echo $button_reward_add; ?></button></div>
</div>
<script type="text/javascript"><!--
$('#reward').delegate('.pagination a', 'click', function(e) {
	e.preventDefault();

	$('#reward').load(this.href);
});

$('#reward').load('index.php?route=editors/customer/reward&token=<?php echo $token; ?>&customer_id=<?php echo $customer_id; ?>');

$('#button-reward').on('click', function(e) {
	e.preventDefault();

	$.ajax({
		url: 'index.php?route=editors/customer/addreward&token=<?php echo $token; ?>&customer_id=<?php echo $customer_id; ?>',
		type: 'post',
		dataType: 'json',
		data: 'description=' + encodeURIComponent($('#tab-reward input[name=\'description\']').val()) + '&points=' + encodeURIComponent($('#tab-reward input[name=\'points\']').val()),
		beforeSend: function() {
			$('#button-reward').button('loading');
		},
		complete: function() {
			$('#button-reward').button('reset');
		},
		success: function(json) {
			if (json['error']) {
				 $('#tab-reward').prepend('<div class="alert alert-danger"><i class="fa fa-exclamation-circle"></i> ' + json['error'] + ' <button type="button" class="close" data-dismiss="alert">&times;</button></div></div>');
			
				$('.alert-danger').delay(1500).fadeOut(500);
			}

			if (json['success']) {
				$('#tab-reward').prepend('<div class="alert alert-success"><i class="fa fa-check-circle"></i> ' + json['success'] + ' <button type="button" class="close" data-dismiss="alert">&times;</button></div></div>');

				$('#reward').load('index.php?route=editors/customer/reward&token=<?php echo $token; ?>&customer_id=<?php echo $customer_id; ?>');

				$('#tab-reward input[name=\'points\']').val('');
				$('#tab-reward input[name=\'description\']').val('');
				
				setTimeout(function(){
					$('#modal-customer-edit').modal('hide');
				}, 1000)
			}
		}
	});
});
//--></script>