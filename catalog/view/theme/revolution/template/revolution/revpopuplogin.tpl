<div id="popup-order-okno" class="account_login">
<div class="popup-heading"><?php echo $text_revpopuplogin_autoriz; ?></div>
<div class="popup-center">
	<form method="post" enctype="multipart/form-data" id="login-form">
		<div class="payment-info">
			<div>
				<label><span class="required">*</span><?php echo $text_revpopuplogin_email; ?></label>
				<input name="email" />
			</div>
			<div>
				<label><span class="required">*</span><?php echo $text_revpopuplogin_pass; ?></label>
				<input type="password" name="password" />
			</div>
			<div style="text-align: right;">
				<a href="<?php echo $forgotten; ?>"><?php echo $text_revpopuplogin_forgotten; ?></a>
			</div>
		</div>
	</form>
</div>
<div class="popup-footer">
	<button class="account_login_close" onclick="$.magnificPopup.close();"><?php echo $text_revpopuplogin_otmena; ?></button>
	<a id="popup-checkout-button"><?php echo $text_revpopuplogin_enter; ?></a>
</div>
<script type="text/javascript"><!--
function masked(element, status) {
  if (status == true) {
    $('<div/>')
    .attr({ 'class':'masked' })
    .prependTo(element);
    $('<div class="masked_loading" />').insertAfter($('.masked'));
  } else {
    $('.masked').remove();
    $('.masked_loading').remove();
  }
}

$('#popup-checkout-button').on('click', function() {
  masked('#popup-order-okno', true);
  $.ajax({
      type: 'post',
      url:  'index.php?route=revolution/revpopuplogin/login',
      dataType: 'json',
      data: $('#login-form').serialize(),
      success: function(json) {
        if (json['error']) {
            masked('#popup-order-okno', false);
            $('.text-danger').remove();
            $('.payment-info').after('<div class="text-danger text-right">' + json['error'] + '</div>');
        } else {
			if (json['output']) {
				masked('#popup-order-okno', false);
				$('#popup-checkout-button').remove();
				$('.account_login_close').after('<a id="popup-checkout-button" href="' + json['output_button1'] + '">' + json['output_button2'] + '</a');
				$('.account_login_close').html('<?php echo $text_revpopuplogin_close; ?>');
				$('#popup-order-okno .popup-center').html(json['output']);
			}
        }
      }
  });
});
//--></script>
</div>
