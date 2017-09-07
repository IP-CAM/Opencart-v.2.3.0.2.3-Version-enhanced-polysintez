<div class="modal-header">
  <button type="button" class="pull-right btn btn-danger btn-sm" data-dismiss="modal" aria-hidden="true"><i class="fa fa-close"></i></button>
  <h4 class="modal-title"><?php echo $firstname; ?> <?php echo $lastname; ?> - <?php echo $tab_transaction; ?></h4>
</div>
<div class="modal-body form-horizontal" id="tab-transaction">
  <div class="form-group">
    <div class="col-sm-12" id="transaction"></div>
  </div>
  <div class="form-group">
    <label class="col-sm-2 control-label" for="input-transaction-description"><?php echo $entry_description; ?></label>
    <div class="col-sm-10">
      <input type="text" name="description" value="" placeholder="<?php echo $entry_description; ?>" id="input-transaction-description" class="form-control" />
    </div>
  </div>
  <div class="form-group">
    <label class="col-sm-2 control-label" for="input-amount"><span data-toggle="tooltip" title="<?php echo $help_amount; ?>"><?php echo $entry_amount; ?></span></label>
    <div class="col-sm-10">
      <input type="text" name="amount" value="" placeholder="<?php echo $entry_amount; ?>" id="input-amount" class="form-control" />
    </div>
  </div>
</div>
<div class="modal-footer">
  <div class="text-center"><button id="button-transaction" data-loading-text="<?php echo $text_loading; ?>" class="btn btn-info btn-lg"><i class="fa fa-plus-circle"></i> <?php echo $button_transaction_add; ?></button></div>
</div>
<script type="text/javascript"><!--
$('#transaction').delegate('.pagination a', 'click', function(e) {
	e.preventDefault();

	$('#transaction').load(this.href);
});

$('#transaction').load('index.php?route=editors/customer/transaction&token=<?php echo $token; ?>&customer_id=<?php echo $customer_id; ?>');

$('#button-transaction').on('click', function(e) {
  e.preventDefault();

  $.ajax({
		url: 'index.php?route=editors/customer/addTransaction&token=<?php echo $token; ?>&customer_id=<?php echo $customer_id; ?>',
		type: 'post',
		dataType: 'json',
		data: 'description=' + encodeURIComponent($('#tab-transaction input[name=\'description\']').val()) + '&amount=' + encodeURIComponent($('#tab-transaction input[name=\'amount\']').val()),
		beforeSend: function() {
			$('#button-transaction').button('loading');
		},
		complete: function() {
			$('#button-transaction').button('reset');
		},
		success: function(json) {
			if (json['error']) {
				 $('#tab-transaction').prepend('<div class="alert alert-danger"><i class="fa fa-exclamation-circle"></i> ' + json['error'] + ' <button type="button" class="close" data-dismiss="alert">&times;</button></div></div>');
				
				$('.alert-danger').delay(1500).fadeOut(500);
			}

			if (json['success']) {
				$('#tab-transaction').prepend('<div class="alert alert-success"><i class="fa fa-check-circle"></i> ' + json['success'] + ' <button type="button" class="close" data-dismiss="alert">&times;</button></div></div>');

				$('#transaction').load('index.php?route=editors/customer/transaction&token=<?php echo $token; ?>&customer_id=<?php echo $customer_id; ?>');

				$('#tab-transaction input[name=\'amount\']').val('');
				$('#tab-transaction input[name=\'description\']').val('');
				
				setTimeout(function(){
					$('#modal-customer-edit').modal('hide');
				}, 1000)
			}
		}
	});
});
//--></script>