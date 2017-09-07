<div class="modal-header">
  <button type="button" class="pull-right btn btn-danger btn-sm" data-dismiss="modal" aria-hidden="true"><i class="fa fa-close"></i></button>
  <h4 class="modal-title"><?php echo $heading_title_info; ?> <?php echo $order_id; ?> - <?php echo $text_shipping_address; ?></h4>
</div>
<div class="modal-body">
  <form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data" id="form-order-shipping-address" class="form-horizontal">
    <div class="form-group">
      <label class="col-sm-3 control-label" for="input-shipping-address"><?php echo $entry_address; ?></label>
      <div class="col-sm-9">
        <select name="shipping_address" id="input-shipping-address" class="form-control">
          <option value="0" selected="selected"><?php echo $text_none; ?></option>
          <?php foreach ($addresses as $address) { ?>
            <option value="<?php echo $address['address_id']; ?>"><?php echo $address['firstname'] . ' ' . $address['lastname'] . ', ' . $address['address_1'] . ', ' . $address['city'] . ', ' . $address['country']; ?></option>
          <?php } ?>
        </select>
      </div>
    </div>
	<div class="hidden">
      <select name="customer_group_id" id="input-customer-group" class="form-control">
        <?php foreach ($customer_groups as $customer_group) { ?>
          <?php if ($customer_group['customer_group_id'] == $customer_group_id) { ?>
            <option value="<?php echo $customer_group['customer_group_id']; ?>" selected="selected"><?php echo $customer_group['name']; ?></option>
            <?php } else { ?>
            <option value="<?php echo $customer_group['customer_group_id']; ?>"><?php echo $customer_group['name']; ?></option>
          <?php } ?>
        <?php } ?>
      </select>
    </div>
    <div class="form-group required">
      <label class="col-sm-3 control-label" for="input-shipping-firstname"><?php echo $entry_firstname; ?></label>
      <div class="col-sm-9">
        <input type="text" name="firstname" value="<?php echo $shipping_firstname; ?>" id="input-shipping-firstname" class="form-control" />
      </div>
    </div>
    <div class="form-group required">
      <label class="col-sm-3 control-label" for="input-shipping-lastname"><?php echo $entry_lastname; ?></label>
      <div class="col-sm-9">
        <input type="text" name="lastname" value="<?php echo $shipping_lastname; ?>" id="input-shipping-lastname" class="form-control" />
      </div>
    </div>
    <div class="form-group">
      <label class="col-sm-3 control-label" for="input-shipping-company"><?php echo $entry_company; ?></label>
      <div class="col-sm-9">
        <input type="text" name="company" value="<?php echo $shipping_company; ?>" id="input-shipping-company" class="form-control" />
      </div>
    </div>
    <div class="form-group required">
      <label class="col-sm-3 control-label" for="input-shipping-address-1"><?php echo $entry_address_1; ?></label>
      <div class="col-sm-9">
        <input type="text" name="address_1" value="<?php echo $shipping_address_1; ?>" id="input-shipping-address-1" class="form-control" />
      </div>
    </div>
    <div class="form-group">
      <label class="col-sm-3 control-label" for="input-shipping-address-2"><?php echo $entry_address_2; ?></label>
      <div class="col-sm-9">
        <input type="text" name="address_2" value="<?php echo $shipping_address_2; ?>" id="input-shipping-address-2" class="form-control" />
      </div>
    </div>
    <div class="form-group required">
      <label class="col-sm-3 control-label" for="input-shipping-city"><?php echo $entry_city; ?></label>
      <div class="col-sm-9">
        <input type="text" name="city" value="<?php echo $shipping_city; ?>" id="input-shipping-city" class="form-control" />
      </div>
    </div>
    <div class="form-group required">
      <label class="col-sm-3 control-label" for="input-shipping-postcode"><?php echo $entry_postcode; ?></label>
      <div class="col-sm-9">
        <input type="text" name="postcode" value="<?php echo $shipping_postcode; ?>" id="input-shipping-postcode" class="form-control" />
      </div>
    </div>
    <div class="form-group required">
      <label class="col-sm-3 control-label" for="input-shipping-country"><?php echo $entry_country; ?></label>
      <div class="col-sm-9">
        <select name="country_id" id="input-shipping-country" class="form-control">
          <option value=""><?php echo $text_select; ?></option>
          <?php foreach ($countries as $country) { ?>
            <?php if ($country['country_id'] == $shipping_country_id) { ?>
              <option value="<?php echo $country['country_id']; ?>" selected="selected"><?php echo $country['name']; ?></option>
              <?php } else { ?>
              <option value="<?php echo $country['country_id']; ?>"><?php echo $country['name']; ?></option>
            <?php } ?>
          <?php } ?>
        </select>
      </div>
    </div>
    <div class="form-group required">
      <label class="col-sm-3 control-label" for="input-shipping-zone"><?php echo $entry_zone; ?></label>
      <div class="col-sm-9">
        <select name="zone_id" id="input-shipping-zone" class="form-control"></select>
      </div>
    </div>
    <?php foreach ($custom_fields as $custom_field) { ?>
      <?php if ($custom_field['location'] == 'address') { ?>
        <?php if ($custom_field['type'] == 'select') { ?>
          <div class="form-group custom-field custom-field<?php echo $custom_field['custom_field_id']; ?>" data-sort="<?php echo $custom_field['sort_order'] + 3; ?>">
            <label class="col-sm-3 control-label" for="input-shipping-custom-field<?php echo $custom_field['custom_field_id']; ?>"><?php echo $custom_field['name']; ?></label>
            <div class="col-sm-9">
              <select name="custom_field[<?php echo $custom_field['custom_field_id']; ?>]" id="input-shipping-custom-field<?php echo $custom_field['custom_field_id']; ?>" class="form-control">
                <option value=""><?php echo $text_select; ?></option>
                <?php foreach ($custom_field['custom_field_value'] as $custom_field_value) { ?>
                  <?php if (isset($shipping_custom_field[$custom_field['custom_field_id']]) && $custom_field_value['custom_field_value_id'] == $shipping_custom_field[$custom_field['custom_field_id']]) { ?>
                    <option value="<?php echo $custom_field_value['custom_field_value_id']; ?>" selected="selected"><?php echo $custom_field_value['name']; ?></option>
                    <?php } else { ?>
                    <option value="<?php echo $custom_field_value['custom_field_value_id']; ?>"><?php echo $custom_field_value['name']; ?></option>
                  <?php } ?>
                <?php } ?>
              </select>
            </div>
          </div>
        <?php } ?>
        <?php if ($custom_field['type'] == 'radio') { ?>
          <div class="form-group custom-field custom-field<?php echo $custom_field['custom_field_id']; ?>" data-sort="<?php echo $custom_field['sort_order'] + 3; ?>">
            <label class="col-sm-3 control-label"><?php echo $custom_field['name']; ?></label>
            <div class="col-sm-9">
              <div id="input-shipping-custom-field<?php echo $custom_field['custom_field_id']; ?>">
                <?php foreach ($custom_field['custom_field_value'] as $custom_field_value) { ?>
                  <div class="radio">
                    <?php if (isset($shipping_custom_field[$custom_field['custom_field_id']]) && $custom_field_value['custom_field_value_id'] == $shipping_custom_field[$custom_field['custom_field_id']]) { ?>
                      <label>
                        <input type="radio" name="custom_field[<?php echo $custom_field['custom_field_id']; ?>]" value="<?php echo $custom_field_value['custom_field_value_id']; ?>" checked="checked" />
                        <?php echo $custom_field_value['name']; ?></label>
                      <?php } else { ?>
                      <label>
                        <input type="radio" name="custom_field[<?php echo $custom_field['custom_field_id']; ?>]" value="<?php echo $custom_field_value['custom_field_value_id']; ?>" />
                        <?php echo $custom_field_value['name']; ?></label>
                    <?php } ?>
                  </div>
                <?php } ?>
              </div>
            </div>
          </div>
        <?php } ?>
        <?php if ($custom_field['type'] == 'checkbox') { ?>
          <div class="form-group custom-field custom-field<?php echo $custom_field['custom_field_id']; ?>" data-sort="<?php echo $custom_field['sort_order'] + 3; ?>">
            <label class="col-sm-3 control-label"><?php echo $custom_field['name']; ?></label>
            <div class="col-sm-9">
              <div id="input-shipping-custom-field<?php echo $custom_field['custom_field_id']; ?>">
                <?php foreach ($custom_field['custom_field_value'] as $custom_field_value) { ?>
                  <div>
                    <?php if (isset($shipping_custom_field[$custom_field['custom_field_id']]) && in_array($custom_field_value['custom_field_value_id'], $shipping_custom_field[$custom_field['custom_field_id']])) { ?>
                      <label>
                        <input type="checkbox" name="custom_field[<?php echo $custom_field['custom_field_id']; ?>][]" value="<?php echo $custom_field_value['custom_field_value_id']; ?>" checked="checked" />
                        <?php echo $custom_field_value['name']; ?></label>
                      <?php } else { ?>
                      <label>
                        <input type="checkbox" name="custom_field[<?php echo $custom_field['custom_field_id']; ?>][]" value="<?php echo $custom_field_value['custom_field_value_id']; ?>" />
                        <?php echo $custom_field_value['name']; ?></label>
                    <?php } ?>
                  </div>
                <?php } ?>
              </div>
            </div>
          </div>
        <?php } ?>
        <?php if ($custom_field['type'] == 'text') { ?>
          <div class="form-group custom-field custom-field<?php echo $custom_field['custom_field_id']; ?>" data-sort="<?php echo $custom_field['sort_order'] + 3; ?>">
            <label class="col-sm-3 control-label" for="input-shipping-custom-field<?php echo $custom_field['custom_field_id']; ?>"><?php echo $custom_field['name']; ?></label>
            <div class="col-sm-9">
              <input type="text" name="custom_field[<?php echo $custom_field['custom_field_id']; ?>]" value="<?php echo (isset($shipping_custom_field[$custom_field['custom_field_id']]) ? $shipping_custom_field[$custom_field['custom_field_id']] : $custom_field['value']); ?>" placeholder="<?php echo $custom_field['name']; ?>" id="input-shipping-custom-field<?php echo $custom_field['custom_field_id']; ?>" class="form-control" />
            </div>
          </div>
        <?php } ?>
        <?php if ($custom_field['type'] == 'textarea') { ?>
          <div class="form-group custom-field custom-field<?php echo $custom_field['custom_field_id']; ?>" data-sort="<?php echo $custom_field['sort_order'] + 3; ?>">
            <label class="col-sm-3 control-label" for="input-shipping-custom-field<?php echo $custom_field['custom_field_id']; ?>"><?php echo $custom_field['name']; ?></label>
            <div class="col-sm-9">
              <textarea name="custom_field[<?php echo $custom_field['custom_field_id']; ?>]" rows="5" placeholder="<?php echo $custom_field['name']; ?>" id="input-shipping-custom-field<?php echo $custom_field['custom_field_id']; ?>" class="form-control"><?php echo (isset($shipping_custom_field[$custom_field['custom_field_id']]) ? $shipping_custom_field[$custom_field['custom_field_id']] : $custom_field['value']); ?></textarea>
            </div>
          </div>
        <?php } ?>
        <?php if ($custom_field['type'] == 'file') { ?>
          <div class="form-group custom-field custom-field<?php echo $custom_field['custom_field_id']; ?>" data-sort="<?php echo $custom_field['sort_order'] + 3; ?>">
            <label class="col-sm-3 control-label"><?php echo $custom_field['name']; ?></label>
            <div class="col-sm-9">
              <button type="button" id="button-shipping-custom-field<?php echo $custom_field['custom_field_id']; ?>" data-loading-text="<?php echo $text_loading; ?>" class="btn btn-default"><i class="fa fa-upload"></i> <?php echo $button_upload; ?></button>
              <input type="hidden" name="custom_field[<?php echo $custom_field['custom_field_id']; ?>]" value="<?php echo (isset($shipping_custom_field[$custom_field['custom_field_id']]) ? $shipping_custom_field[$custom_field['custom_field_id']] : ''); ?>" id="input-shipping-custom-field<?php echo $custom_field['custom_field_id']; ?>" />
            </div>
          </div>
        <?php } ?>
        <?php if ($custom_field['type'] == 'date') { ?>
          <div class="form-group custom-field custom-field<?php echo $custom_field['custom_field_id']; ?>" data-sort="<?php echo $custom_field['sort_order'] + 3; ?>">
            <label class="col-sm-3 control-label" for="input-shipping-custom-field<?php echo $custom_field['custom_field_id']; ?>"><?php echo $custom_field['name']; ?></label>
            <div class="col-sm-9">
              <div class="input-group date">
                <input type="text" name="custom_field[<?php echo $custom_field['custom_field_id']; ?>]" value="<?php echo (isset($shipping_custom_field[$custom_field['custom_field_id']]) ? $shipping_custom_field[$custom_field['custom_field_id']] : $custom_field['value']); ?>" placeholder="<?php echo $custom_field['name']; ?>" data-date-format="YYYY-MM-DD" id="input-shipping-custom-field<?php echo $custom_field['custom_field_id']; ?>" class="form-control" />
                <span class="input-group-btn"><button type="button" class="btn btn-default"><i class="fa fa-calendar"></i></button></span>
			  </div>
            </div>
          </div>
        <?php } ?>
        <?php if ($custom_field['type'] == 'time') { ?>
          <div class="form-group custom-field custom-field<?php echo $custom_field['custom_field_id']; ?>" data-sort="<?php echo $custom_field['sort_order'] + 3; ?>">
            <label class="col-sm-3 control-label" for="input-shipping-custom-field<?php echo $custom_field['custom_field_id']; ?>"><?php echo $custom_field['name']; ?></label>
            <div class="col-sm-9">
              <div class="input-group time">
                <input type="text" name="custom_field[<?php echo $custom_field['custom_field_id']; ?>]" value="<?php echo (isset($shipping_custom_field[$custom_field['custom_field_id']]) ? $shipping_custom_field[$custom_field['custom_field_id']] : $custom_field['value']); ?>" placeholder="<?php echo $custom_field['name']; ?>" data-date-format="HH:mm" id="input-shipping-custom-field<?php echo $custom_field['custom_field_id']; ?>" class="form-control" />
                <span class="input-group-btn"><button type="button" class="btn btn-default"><i class="fa fa-calendar"></i></button></span>
			  </div>
            </div>
          </div>
        <?php } ?>
        <?php if ($custom_field['type'] == 'datetime') { ?>
          <div class="form-group custom-field custom-field<?php echo $custom_field['custom_field_id']; ?>" data-sort="<?php echo $custom_field['sort_order'] + 3; ?>">
            <label class="col-sm-3 control-label" for="input-shipping-custom-field<?php echo $custom_field['custom_field_id']; ?>"><?php echo $custom_field['name']; ?></label>
            <div class="col-sm-9">
              <div class="input-group datetime">
                <input type="text" name="custom_field[<?php echo $custom_field['custom_field_id']; ?>]" value="<?php echo (isset($shipping_custom_field[$custom_field['custom_field_id']]) ? $shipping_custom_field[$custom_field['custom_field_id']] : $custom_field['value']); ?>" placeholder="<?php echo $custom_field['name']; ?>" data-date-format="YYYY-MM-DD HH:mm" id="input-shipping-custom-field<?php echo $custom_field['custom_field_id']; ?>" class="form-control" />
                <span class="input-group-btn"><button type="button" class="btn btn-default"><i class="fa fa-calendar"></i></button></span>
			  </div>
            </div>
          </div>
        <?php } ?>
      <?php } ?>
    <?php } ?>
  </form>
</div>
<div class="modal-footer">
  <div class="text-center"><a data-form="form-order-shipping-address" id="button-save" class="btn btn-info btn-lg"><?php echo $button_save; ?></a></div>
</div>
<script type="text/javascript"><!--
$('#button-save').on('click', function(){
	$.ajax({
		url: $('#' + $(this).data('form')).attr('action'),
		type: 'post',
		dataType: 'json',
		data: $('#' + $(this).data('form') + ' input[type="text"], #' + $(this).data('form') + ' input[type="hidden"], #' + $(this).data('form') + ' input[type="checkbox"]:checked , #' + $(this).data('form') + ' input[type="radio"]:checked, #' + $(this).data('form') + ' textarea, #' + $(this).data('form') + ' select'),
		success: function(json) {
			$('.alert, .text-danger').remove();
			$('.form-group').removeClass('has-error');
			
			if (json['error']) {
				if (json['error']['warning']) {
					$('#form-order-shipping-address').prepend('<div class="alert alert-danger"><i class="fa fa-exclamation-circle"></i> ' + json['error']['warning'] + '</div>');
					
					$('.alert-danger').delay(1500).fadeOut(500);
				}

				for (i in json['error']) {
					var element = $('#input-shipping-' + i.replace('_', '-'));

					if (element.parent().hasClass('input-group')) {
                   		$(element).parent().after('<div class="text-danger">' + json['error'][i] + '</div>');
					} else {
						$(element).after('<div class="text-danger">' + json['error'][i] + '</div>');
					}
				}

				// Highlight any found errors
				$('.text-danger').parentsUntil('.form-group').parent().addClass('has-error');
			}
			
			if (json['success']) {
				$('#form-order-shipping-address').before('<div class="alert alert-success"><i class="fa fa-exclamation-circle"></i> ' + json['success'] + '</div>');

				$('#order-shipping-address').load('index.php?route=editors/catalog_edit/getOrderShippingAddress&token=<?php echo $token; ?>&order_id=<?php echo $order_id; ?>');
									
				setTimeout(function(){
					$('#modal-order').modal('hide');
				}, 1000)
			}
		}
	});
});   
//--></script>
<script type="text/javascript"><!--
$('select[name=\'shipping_address\']').on('change', function() {
	$.ajax({
		url: 'index.php?route=editors/customer/address&token=<?php echo $token; ?>&address_id=' + this.value,
		dataType: 'json',
		beforeSend: function() {
			$('select[name=\'shipping_address\']').after(' <i class="fa fa-circle-o-notch fa-spin"></i>');
		},
		complete: function() {
			$('#form-order-shipping-address .fa-spin').remove();
		},
		success: function(json) {
			// Reset all fields
			$('#form-order-shipping-address input[type=\'text\'], #form-order-shipping-address input[type=\'text\'], #form-order-shipping-address textarea').val('');
			$('#form-order-shipping-address select option').not('#form-order-shipping-address select[name=\'shipping_address\']').removeAttr('selected');
			$('#form-order-shipping-address input[type=\'checkbox\'], #form-order-shipping-address input[type=\'radio\']').removeAttr('checked');

			$('#form-order-shipping-address input[name=\'firstname\']').val(json['firstname']);
			$('#form-order-shipping-address input[name=\'lastname\']').val(json['lastname']);
			$('#form-order-shipping-address input[name=\'company\']').val(json['company']);
			$('#form-order-shipping-address input[name=\'address_1\']').val(json['address_1']);
			$('#form-order-shipping-address input[name=\'address_2\']').val(json['address_2']);
			$('#form-order-shipping-address input[name=\'city\']').val(json['city']);
			$('#form-order-shipping-address input[name=\'postcode\']').val(json['postcode']);
			$('#form-order-shipping-address select[name=\'country_id\']').val(json['country_id']);

			shipping_zone_id = json['zone_id'];

			for (i in json['custom_field']) {
				$('#form-order-shipping-address select[name=\'custom_field[' + i + ']\']').val(json['custom_field'][i]);
				$('#form-order-shipping-address textarea[name=\'custom_field[' + i + ']\']').val(json['custom_field'][i]);
				$('#form-order-shipping-address input[name^=\'custom_field[' + i + ']\'][type=\'text\']').val(json['custom_field'][i]);
				$('#form-order-shipping-address input[name^=\'custom_field[' + i + ']\'][type=\'hidden\']').val(json['custom_field'][i]);
				$('#form-order-shipping-address input[name^=\'custom_field[' + i + ']\'][type=\'radio\'][value=\'' + json['custom_field'][i] + '\']').prop('checked', true);
				$('#form-order-shipping-address input[name^=\'custom_field[' + i + ']\'][type=\'checkbox\'][value=\'' + json['custom_field'][i] + '\']').prop('checked', true);

				if (json['custom_field'][i] instanceof Array) {
					for (j = 0; j < json['custom_field'][i].length; j++) {
						$('#form-order-shipping-address input[name^=\'custom_field[' + i + ']\'][type=\'checkbox\'][value=\'' + json['custom_field'][i][j] + '\']').prop('checked', true);
					}
				}
			}

			$('#form-order-shipping-address select[name=\'country_id\']').trigger('change');
		},
		error: function(xhr, ajaxOptions, thrownError) {
			alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
		}
	});
});

var shipping_zone_id = '<?php echo $shipping_zone_id; ?>';

$('#form-order-shipping-address select[name=\'country_id\']').on('change', function() {
	$.ajax({
		url: 'index.php?route=localisation/country/country&token=<?php echo $token; ?>&country_id=' + this.value,
		dataType: 'json',
		beforeSend: function() {
			$('#form-order-shipping-address select[name=\'country_id\']').after(' <i class="fa fa-circle-o-notch fa-spin"></i>');
		},
		complete: function() {
			$('#form-order-shipping-address .fa-spin').remove();
		},
		success: function(json) {
			if (json['postcode_required'] == '1') {
				$('#form-order-shipping-address input[name=\'postcode\']').parent().parent().addClass('required');
			} else {
				$('#form-order-shipping-address input[name=\'postcode\']').parent().parent().removeClass('required');
			}

			html = '<option value=""><?php echo $text_select; ?></option>';

			if (json['zone'] && json['zone'] != '') {
				for (i = 0; i < json['zone'].length; i++) {
        			html += '<option value="' + json['zone'][i]['zone_id'] + '"';

					if (json['zone'][i]['zone_id'] == shipping_zone_id) {
	      				html += ' selected="selected"';
	    			}

	    			html += '>' + json['zone'][i]['name'] + '</option>';
				}
			} else {
				html += '<option value="0" selected="selected"><?php echo $text_none; ?></option>';
			}

			$('#form-order-shipping-address select[name=\'zone_id\']').html(html);
		},
		error: function(xhr, ajaxOptions, thrownError) {
			alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
		}
	});
});

$('#form-order-shipping-address select[name=\'country_id\']').trigger('change');

$('select[name=\'customer_group_id\']').on('change', function() {
	$.ajax({
		url: 'index.php?route=editors/customer/customfield&token=<?php echo $token; ?>&customer_group_id=' + this.value,
		dataType: 'json',
		success: function(json) {
			$('.custom-field').hide();
			$('.custom-field').removeClass('required');

			for (i = 0; i < json.length; i++) {
				custom_field = json[i];

				$('.custom-field' + custom_field['custom_field_id']).show();

				if (custom_field['required']) {
					$('.custom-field' + custom_field['custom_field_id']).addClass('required');
				}
			}
		},
		error: function(xhr, ajaxOptions, thrownError) {
			alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
		}
	});
});

$('select[name=\'customer_group_id\']').trigger('change');

$('.date').datetimepicker({
	pickTime: false
});

$('.datetime').datetimepicker({
	pickDate: true,
	pickTime: true
});

$('.time').datetimepicker({
	pickDate: false
});
//--></script>
<script type="text/javascript"><!--
$('#form-order-shipping-address .form-group[data-sort]').detach().each(function() {
	if ($(this).attr('data-sort') >= 0 && $(this).attr('data-sort') <= $('#form-order-shipping-address .form-group').length) {
		$('#form-order-shipping-address .form-group').eq($(this).attr('data-sort')).before(this);
	}

	if ($(this).attr('data-sort') > $('#form-order-shipping-address .form-group').length) {
		$('#form-order-shipping-address .form-group:last').after(this);
	}

	if ($(this).attr('data-sort') < -$('#form-order-shipping-address .form-group').length) {
		$('#form-order-shipping-address .form-group:first').before(this);
	}
});
//--></script>