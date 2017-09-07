<div class="modal-header">
  <button type="button" class="pull-right btn btn-danger btn-sm" data-dismiss="modal" aria-hidden="true"><i class="fa fa-close"></i></button>
  <h4 class="modal-title"><?php echo $firstname; ?> <?php echo $lastname; ?> - <?php echo $tab_history; ?></h4>
</div>
<div class="modal-body form-horizontal" id="tab-history">
  <div class="form-group">
    <div class="col-sm-12" id="history"></div>
  </div>
  <div class="form-group">
    <label class="col-sm-2 control-label" for="input-comment"><?php echo $entry_comment; ?></label>
    <div class="col-sm-10">
      <textarea name="comment" rows="8" placeholder="<?php echo $entry_comment; ?>" id="input-comment" class="form-control"></textarea>
    </div>
  </div>
</div>
<div class="modal-footer">
  <div class="text-center"><button id="button-history" data-loading-text="<?php echo $text_loading; ?>" class="btn btn-info btn-lg"><i class="fa fa-plus-circle"></i> <?php echo $button_history_add; ?></button></div>
</div>
<script type="text/javascript"><!--
$('#history').delegate('.pagination a', 'click', function(e) {
	e.preventDefault();

	$('#history').load(this.href);
});

$('#history').load('index.php?route=editors/customer/history&token=<?php echo $token; ?>&customer_id=<?php echo $customer_id; ?>');

$('#button-history').on('click', function(e) {
	e.preventDefault();

	$.ajax({
		url: 'index.php?route=editors/customer/addHistory&token=<?php echo $token; ?>&customer_id=<?php echo $customer_id; ?>',
		type: 'post',
		dataType: 'json',
		data: 'comment=' + encodeURIComponent($('#tab-history textarea[name=\'comment\']').val()),
		beforeSend: function() {
			$('#button-history').button('loading');
		},
		complete: function() {
			$('#button-history').button('reset');
		},
		success: function(json) {
			if (json['error']) {
				 $('#tab-history').prepend('<div class="alert alert-danger"><i class="fa fa-exclamation-circle"></i> ' + json['error'] + ' <button type="button" class="close" data-dismiss="alert">&times;</button></div></div>');
			
				$('.alert-danger').delay(1500).fadeOut(500);
			}

			if (json['success']) {
				$('#tab-history').prepend('<div class="alert alert-success"><i class="fa fa-check-circle"></i> ' + json['success'] + ' <button type="button" class="close" data-dismiss="alert">&times;</button></div></div>');

				$('#history').load('index.php?route=editors/customer/history&token=<?php echo $token; ?>&customer_id=<?php echo $customer_id; ?>');

				$('#tab-history textarea[name=\'comment\']').val('');
				
				setTimeout(function(){
					$('#modal-customer-edit').modal('hide');
				}, 1000)
			}
		}
	});
});
//--></script>