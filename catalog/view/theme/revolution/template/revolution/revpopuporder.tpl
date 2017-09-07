<div id="popup-order-okno">

<div class="popup-heading"><?php echo $popuporder_heading_title; ?></div>
<div class="popup-center">
    <?php if ($stock_warning) { ?>
    <div class="alert alert-danger"><i class="fa fa-exclamation-circle"></i> <?php echo $stock_warning; ?>
      <button type="button" class="close" data-dismiss="alert">&times;</button>
    </div>
    <?php } ?>
    <?php if ($minimum > 1) { ?>
    <div class="alert alert-info"><i class="fa fa-info-circle"></i> <?php echo $text_minimum; ?>
      <button type="button" class="close" data-dismiss="alert">&times;</button>
    </div>
    <?php } ?>
		
    <form method="post" enctype="multipart/form-data" id="purchase-form">
	<input name="product_id" value="<?php echo $product_id; ?>" style="display: none;" type="hidden" />
	<input class="product_max" value="<?php echo $quantity; ?>" style="display: none;" type="hidden" />
	<table class="display-products-cart porder">
		<tbody>
			<tr>
				<td class="image">
					<?php if ($thumb) { ?>
						<img src="<?php echo $thumb; ?>" title="<?php echo $popuporder_heading_title; ?>" alt="<?php echo $popuporder_heading_title; ?>" />
					<?php } ?>
				</td>
				<td class="name">
					<?php echo $product_name; ?>
					<?php if ($discounts && !$special) { ?>
						<div class="discounts">
							<?php foreach ($discounts as $discount) { ?>
								<span><?php echo $discount['quantity']; ?><?php echo $text_discount; ?><?php echo $discount['price']; ?></span><br/>
							<?php } ?>
						</div>
					<?php } ?>
				</td>
				<td class="qt">
					<?php if (!$stock_warning || $zakaz) { ?>
					<div class="number">
						<div class="frame-change-count">
					<div class="btn-plus">
						<button type="button" onclick="validate_pole_popuporder(this,'+')">+</button>
					</div>
					<div class="btn-minus">
						<button type="button" onclick="validate_pole_popuporder(this,'-')">-</button>
					</div>
				</div>
						<input name="quantity" value="<?php echo $minimum; ?>"  class="all_quantity plus-minus" onkeyup="validate_pole_popuporder(this);" onchange="validate_pole_popuporder(this);" />
					</div>
					<?php } ?>
				</td>
				<td class="totals">
					<?php if (!$special) { ?>
						<span id="main-price"><?php echo $price; ?></span>
					<?php } else { ?>
						<span id="main-price" class="spec"><?php echo $price; ?></span>
						<span id="special-price"><?php echo $special; ?></span>
					<?php } ?>
				</td>
			</tr>
		</tbody>
	</table>
	<div class="mobile-products-cart">
		<div>
		<div class="image">
			<?php if ($thumb) { ?>
				<img src="<?php echo $thumb; ?>" title="<?php echo $popuporder_heading_title; ?>" alt="<?php echo $popuporder_heading_title; ?>" />
			<?php } ?>
		</div>
		<div class="name">
			<?php echo $product_name; ?>
			<?php if ($discounts && !$special) { ?>
				<div class="discounts">
					<?php foreach ($discounts as $discount) { ?>
						<span><?php echo $discount['quantity']; ?><?php echo $text_discount; ?><?php echo $discount['price']; ?></span><br/>
					<?php } ?>
				</div>
			<?php } ?>
		</div>
		<div class="qt">
			<?php if (!$stock_warning || $zakaz) { ?>
			<div class="number">
				<div class="frame-change-count">
					<div class="btn-plus">
						<button type="button" onclick="validate_pole_popuporder(this,'+')">+</button>
					</div>
					<div class="btn-minus">
						<button type="button" onclick="validate_pole_popuporder(this,'-')">-</button>
					</div>
				</div>
				<input name="quantity" value="<?php echo $minimum; ?>"  class="all_quantity plus-minus" onkeyup="validate_pole_popuporder(this);" onchange="validate_pole_popuporder(this);" />
			</div>
			<?php } ?>
		</div>
		<div class="totals">
			<?php if (!$special) { ?>
				<span id="main-price" class="mobi"><?php echo $price; ?></span>
			<?php } else { ?>
				<span id="main-price" class="mobi spec"><?php echo $price; ?></span>
				<span id="special-price" class="mobi"><?php echo $special; ?></span>
			<?php } ?>
		</div>		
		</div>
	</div>
	<?php if ($options) { ?>
	<div class="well well-sm product-info">
	<?php foreach ($options as $option) { ?>
            <?php if ($option['type'] == 'select') { ?>
            <div class="form-group<?php echo ($option['required'] ? ' required' : ''); ?>">
              <label class="control-label" for="input-option<?php echo $option['product_option_id']; ?>"><?php echo $option['name']; ?>:</label>
              <select onchange="validate_pole_popuporder(this)" name="option[<?php echo $option['product_option_id']; ?>]" id="input-option<?php echo $option['product_option_id']; ?>" class="form-control">
                <option value=""><?php echo $text_select; ?></option>
                <?php foreach ($option['product_option_value'] as $option_value) { ?>
                <option value="<?php echo $option_value['product_option_value_id']; ?>"><?php echo $option_value['name']; ?>
                <?php if ($opt_price) { ?>
					<?php if ($option_value['price']) { ?>
						<span class="option_price">(<?php echo $option_value['price_prefix']; ?><?php echo $option_value['price']; ?>)</span>
					<?php } ?>
				<?php } ?>
                <?php } ?>
              </select>
            </div>
            <?php } ?>
            <?php if ($option['type'] == 'radio') { ?>
            <div class="form-group<?php echo ($option['required'] ? ' required' : ''); ?>">
              <label class="control-label"><?php echo $option['name']; ?>:</label>
              <div id="input-option<?php echo $option['product_option_id']; ?>">
                <?php foreach ($option['product_option_value'] as $option_value) { ?>
                <div class="radio">
					<input onchange="validate_pole_popuporder(this)" type="radio" name="option[<?php echo $option['product_option_id']; ?>]" value="<?php echo $option_value['product_option_value_id']; ?>" id="<?php echo $option['product_option_id']; ?>_<?php echo $option_value['product_option_value_id']; ?>" />
					<label class="btn btn-default label-in-img" for="<?php echo $option['product_option_id']; ?>_<?php echo $option_value['product_option_value_id']; ?>">
						<?php if ($option_value['image']) { ?>
							<img src="<?php echo $option_value['image']; ?>" alt="<?php echo $option_value['name'] . ($option_value['price'] ? ' ' . $option_value['price_prefix'] . $option_value['price'] : ''); ?>" class="img-thumbnail" /> <?php if (!strstr($option['name'], 'Цвет')) { ?><?php echo $option_value['name']; ?><?php } ?>
						<?php } else { ?>
							<span><?php echo $option_value['name']; ?></span>
						<?php } ?>
						<?php if ($option_value['price']) { ?>
							<span class="option_price"><?php echo $option_value['price_prefix']; ?><?php echo $option_value['price']; ?></span>
						<?php } ?>
					<i class="fa fa-check" aria-hidden="true"></i>	
					</label>
                </div>
				<?php if (strstr($option['name'], 'Цвет') && $option_value['image']) { ?>
				<style>
				.product-info .radio input[type='radio'] + .label-in-img {padding: 2px;}
				.product-info .radio .img-thumbnail {margin: 0; width: 30px;}
				.product-info .radio input[type='radio']:checked + .label-in-img .fa {color: #fff; left: 21px; right: inherit; bottom: 3px;}
				</style>
				<?php } ?>
                <?php } ?>
              </div>
            </div>
            <?php } ?>
            <?php if ($option['type'] == 'checkbox') { ?>
            <div class="form-group<?php echo ($option['required'] ? ' required' : ''); ?>">
              <label class="control-label"><?php echo $option['name']; ?>:</label>
              <div id="input-option<?php echo $option['product_option_id']; ?>">
                <?php foreach ($option['product_option_value'] as $option_value) { ?>
                <div class="checkbox radio">
                  <input onchange="validate_pole_popuporder(this)" type="checkbox" name="option[<?php echo $option['product_option_id']; ?>][]" value="<?php echo $option_value['product_option_value_id']; ?>" id="<?php echo $option['product_option_id']; ?>_<?php echo $option_value['product_option_value_id']; ?>" />
					<label class="btn btn-default label-in-img" for="<?php echo $option['product_option_id']; ?>_<?php echo $option_value['product_option_value_id']; ?>">
						<?php if ($option_value['image']) { ?>
							<img src="<?php echo $option_value['image']; ?>" alt="<?php echo $option_value['name'] . ($option_value['price'] ? ' ' . $option_value['price_prefix'] . $option_value['price'] : ''); ?>" class="img-thumbnail" /> <?php if (!strstr($option['name'], 'Цвет')) { ?><?php echo $option_value['name']; ?><?php } ?>
						<?php } else { ?>
							<span><?php echo $option_value['name']; ?></span>
						<?php } ?>
						<?php if ($option_value['price']) { ?>
							<span class="option_price"><?php echo $option_value['price_prefix']; ?><?php echo $option_value['price']; ?></span>
						<?php } ?>
					<i class="fa fa-check" aria-hidden="true"></i>
					</label>
                </div>
				<?php if (strstr($option['name'], 'Цвет') && $option_value['image']) { ?>
				<style>
				.product-info .radio input[type='checkbox'] + .label-in-img {padding: 2px;}
				.product-info .radio .img-thumbnail {margin: 0; width: 30px;}
				.product-info .radio input[type='checkbox']:checked + .label-in-img .fa {color: #fff; left: 21px; right: inherit; bottom: 3px;}
				</style>
				<?php } ?>
                <?php } ?>
              </div>
            </div>
            <?php } ?>
            <?php if ($option['type'] == 'image') { ?>
				<div class="form-group<?php echo ($option['required'] ? ' required' : ''); ?>">
				  <label class="control-label"><?php echo $option['name']; ?>:</label>
				  <div id="input-option<?php echo $option['product_option_id']; ?>">
					<?php foreach ($option['product_option_value'] as $option_value) { ?>
					<div class="radio">
						<input onchange="validate_pole_popuporder(this)" type="radio" name="option[<?php echo $option['product_option_id']; ?>]" value="<?php echo $option_value['product_option_value_id']; ?>" id="<?php echo $option['product_option_id']; ?>_<?php echo $option_value['product_option_value_id']; ?>" />
						<label <?php if (strstr($option['name'], 'Цвет')) { ?>data-toggle="tooltip" title="<?php echo $option_value['name']; ?>"<?php } ?> class="btn btn-default label-in-img" for="<?php echo $option['product_option_id']; ?>_<?php echo $option_value['product_option_value_id']; ?>">
						<img src="<?php echo $option_value['image']; ?>" alt="<?php echo $option_value['name'] . ($option_value['price'] ? ' ' . $option_value['price_prefix'] . $option_value['price'] : ''); ?>" class="img-thumbnail" /> <?php if (!strstr($option['name'], 'Цвет')) { ?><?php echo $option_value['name']; ?><?php } ?>
						<?php if ($option_value['price']) { ?>
						<span class="option_price"><?php echo $option_value['price_prefix']; ?><?php echo $option_value['price']; ?></span>
						<?php } ?>
						<i class="fa fa-check" aria-hidden="true"></i>
						</label>
					</div>
					<?php } ?>
				  </div>
				</div>
				<?php if (strstr($option['name'], 'Цвет')) { ?>
				<style>
				.product-info .radio input[type='radio'] + .label-in-img {padding: 2px;}
				.product-info .radio .img-thumbnail {margin: 0; width: 30px;}
				.product-info .radio input[type='radio']:checked + .label-in-img .fa {color: #fff; left: 21px; right: inherit; bottom: 3px;}
				</style>
				<?php } ?>
            <?php } ?>
            <?php if ($option['type'] == 'text') { ?>
            <div class="form-group<?php echo ($option['required'] ? ' required' : ''); ?>">
              <label class="control-label" for="input-option<?php echo $option['product_option_id']; ?>"><?php echo $option['name']; ?>:</label>
              <input type="text" name="option[<?php echo $option['product_option_id']; ?>]" value="<?php echo $option['value']; ?>" placeholder="<?php echo $option['name']; ?>" id="input-option<?php echo $option['product_option_id']; ?>" class="form-control" />
            </div>
            <?php } ?>
            <?php if ($option['type'] == 'textarea') { ?>
            <div class="form-group<?php echo ($option['required'] ? ' required' : ''); ?>">
              <label class="control-label" for="input-option<?php echo $option['product_option_id']; ?>"><?php echo $option['name']; ?>:</label>
              <textarea name="option[<?php echo $option['product_option_id']; ?>]" rows="5" placeholder="<?php echo $option['name']; ?>" id="input-option<?php echo $option['product_option_id']; ?>" class="form-control"><?php echo $option['value']; ?></textarea>
            </div>
            <?php } ?>
            <?php if ($option['type'] == 'file') { ?>
            <div class="form-group<?php echo ($option['required'] ? ' required' : ''); ?>">
              <label class="control-label"><?php echo $option['name']; ?>:</label>
              <button type="button" id="button-upload<?php echo $option['product_option_id']; ?>" data-loading-text="<?php echo $text_loading; ?>" class="btn btn-default btn-block"><i class="fa fa-upload"></i> <?php echo $button_upload; ?></button>
              <input type="hidden" name="option[<?php echo $option['product_option_id']; ?>]" value="" id="input-option<?php echo $option['product_option_id']; ?>" />
            </div>
            <?php } ?>
            <?php if ($option['type'] == 'date') { ?>
            <div class="form-group<?php echo ($option['required'] ? ' required' : ''); ?>">
              <label class="control-label" for="input-option<?php echo $option['product_option_id']; ?>"><?php echo $option['name']; ?>:</label>
              <div class="input-group date">
                <input type="text" name="option[<?php echo $option['product_option_id']; ?>]" value="<?php echo $option['value']; ?>" data-date-format="YYYY-MM-DD" id="input-option<?php echo $option['product_option_id']; ?>" class="form-control" />
                <span class="input-group-btn">
                <button class="btn btn-default" type="button"><i class="fa fa-calendar"></i></button>
                </span></div>
            </div>
            <?php } ?>
            <?php if ($option['type'] == 'datetime') { ?>
            <div class="form-group<?php echo ($option['required'] ? ' required' : ''); ?>">
              <label class="control-label" for="input-option<?php echo $option['product_option_id']; ?>"><?php echo $option['name']; ?>:</label>
              <div class="input-group datetime">
                <input type="text" name="option[<?php echo $option['product_option_id']; ?>]" value="<?php echo $option['value']; ?>" data-date-format="YYYY-MM-DD HH:mm" id="input-option<?php echo $option['product_option_id']; ?>" class="form-control" />
                <span class="input-group-btn">
                <button type="button" class="btn btn-default"><i class="fa fa-calendar"></i></button>
                </span></div>
            </div>
            <?php } ?>
            <?php if ($option['type'] == 'time') { ?>
            <div class="form-group<?php echo ($option['required'] ? ' required' : ''); ?>">
              <label class="control-label" for="input-option<?php echo $option['product_option_id']; ?>"><?php echo $option['name']; ?>:</label>
              <div class="input-group time">
                <input type="text" name="option[<?php echo $option['product_option_id']; ?>]" value="<?php echo $option['value']; ?>" data-date-format="HH:mm" id="input-option<?php echo $option['product_option_id']; ?>" class="form-control" />
                <span class="input-group-btn">
                <button type="button" class="btn btn-default"><i class="fa fa-calendar"></i></button>
                </span></div>
            </div>
            <?php } ?>
            <?php } ?>
	</div>
	<?php } ?>
            
	<?php if ($recurrings) { ?>
	<div class="info-heading-2"><?php echo $text_payment_recurring ?></div>
	<div class="form-group required">
		<select name="recurring_id" class="form-control">
			<option value=""><?php echo $text_select; ?></option>
			<?php foreach ($recurrings as $recurring) { ?>
			<option value="<?php echo $recurring['recurring_id'] ?>"><?php echo $recurring['name'] ?></option>
			<?php } ?>
		</select>
		<div class="help-block" id="recurring-description"></div>
	</div>
	<?php } ?>

	<div class="payment-info">
		<?php if ($revtheme_catalog_popuporder['firstname']) { ?>
		<div>
		  <label><?php if ($revtheme_catalog_popuporder['firstname'] == 2) { ?><span class="required">*</span><?php } ?><?php echo $enter_firstname; ?></label>
		  <input name="firstname" value="<?php echo $firstname;?>" />
		</div>
		<?php } ?>
		<?php if ($revtheme_catalog_popuporder['telephone']) { ?>
		<div>
		  <label><?php if ($revtheme_catalog_popuporder['telephone'] == 2) { ?><span class="required">*</span><?php } ?><?php echo $enter_telephone; ?></label>
		  <input name="telephone" value="<?php echo $telephone;?>" <?php if ($telephone_mask) { ?> data-mask="<?php echo $telephone_mask;?>" <?php } ?> />
		</div>
		<?php } ?>
		<?php if ($revtheme_catalog_popuporder['email']) { ?>
		<div>
		  <label><?php if ($revtheme_catalog_popuporder['email'] == 2) { ?><span class="required">*</span><?php } ?><?php echo $enter_email; ?></label>
		  <input name="email" value="<?php echo $email;?>" />
		</div>
		<?php } ?>
		<?php if ($revtheme_catalog_popuporder['comment']) { ?>
		<div>
		  <label><?php if ($revtheme_catalog_popuporder['comment'] == 2) { ?><span class="required">*</span><?php } ?><?php echo $enter_comment; ?></label>
		  <textarea name="comment"><?php echo $comment;?></textarea>
		</div>
		<?php } ?>
	</div>
    </form>
</div>
<div class="popup-footer">
    <button onclick="$.magnificPopup.close();"><?php echo $button_shopping; ?></button>
    <?php if (!$stock_warning || $zakaz) { ?>
		<a id="popup-checkout-button"><?php echo $button_checkout; ?></a>
    <?php } ?>
</div>
<?php if (!$stock_warning || $zakaz) { ?>
<script src="catalog/view/javascript/jquery/datetimepicker/moment.js" type="text/javascript"></script>
<script src="catalog/view/javascript/jquery/datetimepicker/bootstrap-datetimepicker.min.js" type="text/javascript"></script>
<link href="catalog/view/javascript/jquery/datetimepicker/bootstrap-datetimepicker.min.css" rel="stylesheet" type="text/css" />
<script type="text/javascript"><!--
$('.date').datetimepicker({
  pickTime: false,
});

$('.datetime').datetimepicker({
  pickDate: true,
  pickTime: true
});

$('.time').datetimepicker({
  pickDate: false,
});

$(document).on('click', 'button[id^=\'button-upload\']', function() {
  var node = this;

  $('#form-upload').remove();

  $('body').prepend('<form enctype="multipart/form-data" id="form-upload" style="display: none;"><input type="file" name="file" /></form>');

  $('#form-upload input[name=\'file\']').trigger('click');

  if (typeof timer != 'undefined') {
      clearInterval(timer);
  }

  timer = setInterval(function() {
    if ($('#form-upload input[name=\'file\']').val() != '') {
      clearInterval(timer);

      $.ajax({
        url: 'index.php?route=tool/upload',
        type: 'post',
        dataType: 'json',
        data: new FormData($('#form-upload')[0]),
        cache: false,
        contentType: false,
        processData: false,
        beforeSend: function() {
          $(node).button('loading');
        },
        complete: function() {
          $(node).button('reset');
        },
        success: function(json) {
          $('.text-danger').remove();

          if (json['error']) {
            $(node).parent().find('input').after('<div class="text-danger">' + json['error'] + '</div>');
          }

          if (json['success']) {
            alert(json['success']);

            $(node).parent().find('input').attr('value', json['code']);
          }
        },
        error: function(xhr, ajaxOptions, thrownError) {
          alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
        }
      });
    }
  }, 500);
});

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
      url:  'index.php?route=revolution/revpopuporder/make_order',
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

          if (json['error']['option']) {
            for (i in json['error']['option']) {
              masked('#popup-order-okno', false);
              $('.required .text-danger').remove();
              var element = $('#input-option' + i.replace('_', '-'));
              element.after('<div class="text-danger">' + json['error']['option'][i] + '</div>');
            }
          }

          if (json['error']['recurring']) {
            $('select[name=\'recurring_id\']').after('<div class="text-danger">' + json['error']['recurring'] + '</div>');
          }

        } else {
          if (json['output']) {



            masked('#popup-order-okno', false);
             $('#popup-checkout-button').remove();
                $('#popup-order-okno .popup-center').html(json['output']);

          }
        }
      }
  });
});

function validate_pole_popuporder(val, znak) {
	val.value = val.value.replace(/[^\d,]/g, '');
	input_val = $('input.all_quantity');
	if (val.value == '') {
	val.value = <?php echo $minimum; ?>;
	input_val.val(<?php echo $minimum; ?>);
	}
	quantity = parseInt(input_val.val());
	minimumvalue = <?php echo $minimum; ?>;
	maximumvalue = parseInt($('input.product_max').val());
	if (maximumvalue == 0) maximumvalue = 9999;
	
	if(znak=='+' && input_val.val() < maximumvalue) input_val.val(quantity+1);
	else if(znak=='-' && input_val.val() > minimumvalue) input_val.val(quantity-1);
	else if(znak=='=' && input_val.val() < maximumvalue && input_val.val() < maximumvalue) input_val.val(input_val.val());
	if (quantity < 1 || quantity < minimumvalue) {
		input_val.val(minimumvalue);
		val.value = minimumvalue;
	} else if (quantity > maximumvalue) {
		input_val.val(maximumvalue);
		val.value = maximumvalue;
	}
	
	update_prices_product_popuporder(input_val.val());
}
<?php if ($minimum > 1) { ?>
	update_prices_product_popuporder(<?php echo $minimum; ?>);
<?php } ?>
function update_prices_product_popuporder(quantity) {

	data = $('#purchase-form input[type=\'hidden\'], #purchase-form .product-info input[type=\'text\'], #purchase-form .product-info input[type=\'hidden\'], #purchase-form .product-info input[type=\'radio\']:checked, #purchase-form .product-info input[type=\'checkbox\']:checked, #purchase-form .product-info select, #purchase-form .product-info textarea'),
  $.ajax({
    url: 'index.php?route=product/product/update_prices',
    type: 'post',
    dataType: 'json',
    data: data.serialize() + '&quantity=' + quantity,
    success: function(json) {

		$('#purchase-form .image img').attr('src', json['opt_image_2']).css('width', 80).css('height', 80);
		
		<?php if ($price_number > 0) { ?>
			var start_price = parseFloat($('#main-price').html().replace(/\s*/g,''));
			<?php if ($discounts && !$special) { ?>
			var price = json['special_n'];
			<?php } else { ?>
			var price = json['price_n'];
			<?php } ?>
			$({val:start_price}).animate({val:price}, {
				duration: 500,
				easing: 'swing',
				step: function(val) {
					$('#main-price').html(price_format(val));
				}
			});
			
			<?php if ($special) { ?>
			var start_special = parseFloat($('#special-price').html().replace(/\s*/g,''));
			var special = json['special_n'];
			$({val:start_special}).animate({val:special}, {
				duration: 500,
				easing: 'swing',
				step: function(val) {
					$('#special-price').html(price_format(val));
				}
			});
			<?php } ?>
		<?php } ?>
		
    }
  });
}
function price_format(n) {
	c = <?php echo (empty($currency['decimals']) ? "0" : $currency['decimals'] ); ?>;
    d = '<?php echo $currency['decimal_point']; ?>';
    t = '<?php echo $currency['thousand_point']; ?>';
    s_left = '<?php echo $currency['symbol_left']; ?>';
    s_right = '<?php echo $currency['symbol_right']; ?>';
    n = n * <?php echo $currency['value']; ?>;
    i = parseInt(n = Math.abs(n).toFixed(c)) + ''; 
    j = ((j = i.length) > 3) ? j % 3 : 0; 
    return s_left + (j ? i.substr(0, j) + t : '') + i.substr(j).replace(/(\d{3})(?=\d)/g, "$1" + t) + (c ? d + Math.abs(n - i).toFixed(c).slice(2) : '') + s_right; 
}
//--></script>
<?php } ?>
</div>
