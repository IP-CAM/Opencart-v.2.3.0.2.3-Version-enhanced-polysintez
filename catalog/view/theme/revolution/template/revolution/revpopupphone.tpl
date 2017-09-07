<div id="popup-order-okno" class="popphone">
<div class="popup-heading"><?php echo $popupphone_heading_title; ?></div>
<div class="popup-center">
	<form method="post" enctype="multipart/form-data" id="purchase-form">
		<div class="payment-info">
			<?php if ($revtheme_header_popupphone['firstname']) { ?>
				<div>
					<label><?php if ($revtheme_header_popupphone['firstname'] == 2) { ?><span class="required">*</span><?php } ?><?php echo $enter_firstname; ?></label>
					<input name="firstname" value="<?php echo $firstname;?>" />
				</div>
			<?php } ?>
			<?php if ($revtheme_header_popupphone['telephone']) { ?>
				<div>
					<label><?php if ($revtheme_header_popupphone['telephone'] == 2) { ?><span class="required">*</span><?php } ?><?php echo $enter_telephone; ?></label>
					<input name="telephone" value="<?php echo $telephone;?>" <?php if ($telephone_mask) { ?> data-mask="<?php echo $telephone_mask;?>" <?php } ?> />
				</div>
			<?php } ?>
			<?php if ($revtheme_header_popupphone['email']) { ?>
				<div>
					<label><?php if ($revtheme_header_popupphone['email'] == 2) { ?><span class="required">*</span><?php } ?><?php echo $enter_email; ?></label>
					<input name="email" value="<?php echo $email;?>" />
				</div>
			<?php } ?>
			<?php if ($revtheme_header_popupphone['comment']) { ?>
				<div>
					<label><?php if ($revtheme_header_popupphone['comment'] == 2) { ?><span class="required">*</span><?php } ?><?php echo $enter_comment; ?></label>
					<textarea name="comment"><?php echo $comment;?></textarea>
				</div>
			<?php } ?>
		</div>
	</form>
</div>
<div class="popup-footer">
	<button onclick="$.magnificPopup.close();"><?php echo $button_shopping; ?></button>
	<a id="popup-checkout-button"><?php echo $button_checkout; ?></a>
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
      url:  'index.php?route=revolution/revpopupphone/make_order_phone',
      dataType: 'json',
      data: $('#purchase-form').serialize(),
      success: function(json) {
        if (json['error']) {
          if (json['error']['field']) {
            masked('#popup-order-okno', false);
            $('.text-danger').remove();
            $.each(json['error']['field'], function(i, val) {
              $('[name="' + i + '"]').addClass('error_style').after('<div class="text-danger">' + val + '</div>');
            });
          }
        } else {
          if (json['output']) {
            masked('#popup-order-okno', false);
             $('#popup-checkout-button').remove();
                $('#popup-order-okno .popup-center').html(json['output']);
				yaCounter23924353.reachGoal('form_above');
          }
        }
      }
  });
});
//--></script>
</div>
