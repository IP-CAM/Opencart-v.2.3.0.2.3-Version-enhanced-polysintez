<div class="modal-header">
  <button type="button" class="pull-right btn btn-danger btn-sm" data-dismiss="modal" aria-hidden="true"><i class="fa fa-close"></i></button>
  <h4 class="modal-title"><?php echo $heading_title_info; ?> <?php echo $order_id; ?> - <?php echo $text_customer_detail; ?></h4>
</div>
<div class="modal-body">
  <form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data" id="form-order-customer" class="form-horizontal">
    <div class="form-group">
      <label class="col-sm-3 control-label" for="input-customer"><?php echo $entry_customer; ?></label>
      <div class="col-sm-9">
        <input type="text" name="customer" value="<?php echo $customer; ?>" placeholder="<?php echo $entry_customer; ?>" id="input-customer" class="form-control" />
        <input type="hidden" name="customer_id" value="<?php echo $customer_id; ?>" />
      </div>
    </div>
    <div class="form-group">
      <label class="col-sm-3 control-label" for="input-customer-group"><?php echo $entry_customer_group; ?></label>
      <div class="col-sm-9">
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
    </div>
	<div class="form-group required">
      <label class="col-sm-3 control-label" for="input-email"><?php echo $entry_email; ?></label>
      <div class="col-sm-9">
        <input type="text" name="email" value="<?php echo $email; ?>" id="input-email" class="form-control" />
      </div>
    </div>
    <div class="form-group required">
      <label class="col-sm-3 control-label" for="input-firstname"><?php echo $entry_firstname; ?></label>
      <div class="col-sm-9">
        <input type="text" name="firstname" value="<?php echo $firstname; ?>" id="input-firstname" class="form-control" />
      </div>
	</div>
    <div class="form-group required">
      <label class="col-sm-3 control-label" for="input-lastname"><?php echo $entry_lastname; ?></label>
      <div class="col-sm-9">
        <input type="text" name="lastname" value="<?php echo $lastname; ?>" id="input-lastname" class="form-control" />
      </div>
    </div>
    <div class="form-group required">
      <label class="col-sm-3 control-label" for="input-telephone"><?php echo $entry_telephone; ?></label>
      <div class="col-sm-9">
        <input type="text" name="telephone" value="<?php echo $telephone; ?>" id="input-telephone" class="form-control" />
      </div>
	</div>
	<div class="form-group">
      <label class="col-sm-3 control-label" for="input-fax"><?php echo $entry_fax; ?></label>
      <div class="col-sm-9">
        <input type="text" name="fax" value="<?php echo $fax; ?>" id="input-fax" class="form-control" />
      </div>
    </div>
    <?php foreach ($custom_fields as $custom_field) { ?>
      <?php if ($custom_field['location'] == 'account') { ?>
        <?php if ($custom_field['type'] == 'select') { ?>
          <div class="form-group custom-field custom-field<?php echo $custom_field['custom_field_id']; ?>" data-sort="<?php echo $custom_field['sort_order'] + 3; ?>">
            <label class="col-sm-3 control-label" for="input-custom-field<?php echo $custom_field['custom_field_id']; ?>"><?php echo $custom_field['name']; ?></label>
            <div class="col-sm-9">
              <select name="custom_field[<?php echo $custom_field['custom_field_id']; ?>]" id="input-custom-field<?php echo $custom_field['custom_field_id']; ?>" class="form-control">
                <option value=""><?php echo $text_select; ?></option>
                <?php foreach ($custom_field['custom_field_value'] as $custom_field_value) { ?>
                  <?php if (isset($account_custom_field[$custom_field['custom_field_id']]) && $custom_field_value['custom_field_value_id'] == $account_custom_field[$custom_field['custom_field_id']]) { ?>
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
              <div id="input-custom-field<?php echo $custom_field['custom_field_id']; ?>">
                <?php foreach ($custom_field['custom_field_value'] as $custom_field_value) { ?>
                  <div class="radio">
                    <?php if (isset($account_custom_field[$custom_field['custom_field_id']]) && $custom_field_value['custom_field_value_id'] == $account_custom_field[$custom_field['custom_field_id']]) { ?>
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
              <div id="input-custom-field<?php echo $custom_field['custom_field_id']; ?>">
                <?php foreach ($custom_field['custom_field_value'] as $custom_field_value) { ?>
                  <div>
                    <?php if (isset($account_custom_field[$custom_field['custom_field_id']]) && in_array($custom_field_value['custom_field_value_id'], $account_custom_field[$custom_field['custom_field_id']])) { ?>
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
            <label class="col-sm-3 control-label" for="input-custom-field<?php echo $custom_field['custom_field_id']; ?>"><?php echo $custom_field['name']; ?></label>
            <div class="col-sm-9">
              <input type="text" name="custom_field[<?php echo $custom_field['custom_field_id']; ?>]" value="<?php echo (isset($account_custom_field[$custom_field['custom_field_id']]) ? $account_custom_field[$custom_field['custom_field_id']] : $custom_field['value']); ?>" placeholder="<?php echo $custom_field['name']; ?>" id="input-custom-field<?php echo $custom_field['custom_field_id']; ?>" class="form-control" />
            </div>
          </div>
        <?php } ?>
        <?php if ($custom_field['type'] == 'textarea') { ?>
          <div class="form-group custom-field custom-field<?php echo $custom_field['custom_field_id']; ?>" data-sort="<?php echo $custom_field['sort_order'] + 3; ?>">
            <label class="col-sm-3 control-label" for="input-custom-field<?php echo $custom_field['custom_field_id']; ?>"><?php echo $custom_field['name']; ?></label>
            <div class="col-sm-9">
              <textarea name="custom_field[<?php echo $custom_field['custom_field_id']; ?>]" rows="5" placeholder="<?php echo $custom_field['name']; ?>" id="input-custom-field<?php echo $custom_field['custom_field_id']; ?>" class="form-control"><?php echo $custom_field['value']; ?></textarea>
            </div>
          </div>
        <?php } ?>
        <?php if ($custom_field['type'] == 'file') { ?>
          <div class="form-group custom-field custom-field<?php echo $custom_field['custom_field_id']; ?>" data-sort="<?php echo $custom_field['sort_order'] + 3; ?>">
            <label class="col-sm-3 control-label"><?php echo $custom_field['name']; ?></label>
            <div class="col-sm-9">
              <button type="button" id="button-custom-field<?php echo $custom_field['custom_field_id']; ?>" class="btn btn-default"><i class="fa fa-upload"></i> <?php echo $button_upload; ?></button>
              <input type="hidden" name="custom_field[<?php echo $custom_field['custom_field_id']; ?>]" value="<?php echo (isset($account_custom_field[$custom_field['custom_field_id']]) ? $account_custom_field[$custom_field['custom_field_id']] : ''); ?>" id="input-custom-field<?php echo $custom_field['custom_field_id']; ?>" />
            </div>
          </div>
        <?php } ?>
        <?php if ($custom_field['type'] == 'date') { ?>
          <div class="form-group custom-field custom-field<?php echo $custom_field['custom_field_id']; ?>" data-sort="<?php echo $custom_field['sort_order'] + 3; ?>">
            <label class="col-sm-3 control-label" for="input-custom-field<?php echo $custom_field['custom_field_id']; ?>"><?php echo $custom_field['name']; ?></label>
            <div class="col-sm-9">
              <div class="input-group date">
                <input type="text" name="custom_field[<?php echo $custom_field['custom_field_id']; ?>]" value="<?php echo (isset($account_custom_field[$custom_field['custom_field_id']]) ? $account_custom_field[$custom_field['custom_field_id']] : $custom_field['value']); ?>" placeholder="<?php echo $custom_field['name']; ?>" data-date-format="YYYY-MM-DD" id="input-custom-field<?php echo $custom_field['custom_field_id']; ?>" class="form-control" />
                <span class="input-group-btn"><button type="button" class="btn btn-default"><i class="fa fa-calendar"></i></button></span>
			  </div>
            </div>
          </div>
        <?php } ?>
        <?php if ($custom_field['type'] == 'time') { ?>
          <div class="form-group custom-field custom-field<?php echo $custom_field['custom_field_id']; ?>" data-sort="<?php echo $custom_field['sort_order'] + 3; ?>">
            <label class="col-sm-3 control-label" for="input-custom-field<?php echo $custom_field['custom_field_id']; ?>"><?php echo $custom_field['name']; ?></label>
            <div class="col-sm-9">
              <div class="input-group time">
                <input type="text" name="custom_field[<?php echo $custom_field['custom_field_id']; ?>]" value="<?php echo (isset($account_custom_field[$custom_field['custom_field_id']]) ? $account_custom_field[$custom_field['custom_field_id']] : $custom_field['value']); ?>" placeholder="<?php echo $custom_field['name']; ?>" data-date-format="HH:mm" id="input-custom-field<?php echo $custom_field['custom_field_id']; ?>" class="form-control" />
                <span class="input-group-btn"><button type="button" class="btn btn-default"><i class="fa fa-calendar"></i></button></span>
			  </div>
            </div>
          </div>
        <?php } ?>
        <?php if ($custom_field['type'] == 'datetime') { ?>
          <div class="form-group custom-field custom-field<?php echo $custom_field['custom_field_id']; ?>" data-sort="<?php echo $custom_field['sort_order'] + 3; ?>">
            <label class="col-sm-3 control-label" for="input-custom-field<?php echo $custom_field['custom_field_id']; ?>"><?php echo $custom_field['name']; ?></label>
            <div class="col-sm-9">
              <div class="input-group datetime">
                <input type="text" name="custom_field[<?php echo $custom_field['custom_field_id']; ?>]" value="<?php echo (isset($account_custom_field[$custom_field['custom_field_id']]) ? $account_custom_field[$custom_field['custom_field_id']] : $custom_field['value']); ?>" placeholder="<?php echo $custom_field['name']; ?>" data-date-format="YYYY-MM-DD HH:mm" id="input-custom-field<?php echo $custom_field['custom_field_id']; ?>" class="form-control" />
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
  <div class="text-center"><a data-form="form-order-customer" id="button-save" class="btn btn-info btn-lg"><?php echo $button_save; ?></a></div>
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
					$('#form-order-customer').prepend('<div class="alert alert-danger"><i class="fa fa-exclamation-circle"></i> ' + json['error']['warning'] + '</div>');
					
					$('.alert-danger').delay(1500).fadeOut(500);
				}

				for (i in json['error']) {
					var element = $('#input-' + i.replace('_', '-'));

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
				$('#form-order-customer').before('<div class="alert alert-success"><i class="fa fa-exclamation-circle"></i> ' + json['success'] + '</div>');

				$('#order-customer-detail').load('index.php?route=editors/catalog_edit/getOrderCustomer&token=<?php echo $token; ?>&order_id=<?php echo $order_id; ?>');
									
				setTimeout(function(){
					$('#modal-order').modal('hide');
				}, 1000)
			}
		}
	});
});   
//--></script>
<script type="text/javascript"><!--
$('input[name=\'customer\']').autocomplete({
	'source': function(request, response) {
		$.ajax({
			url: 'index.php?route=editors/customer/autocomplete&token=<?php echo $token; ?>&filter_name=' +  encodeURIComponent(request),
			dataType: 'json',
			success: function(json) {
				json.unshift({
					customer_id: '0',
					customer_group_id: '<?php echo $customer_group_id; ?>',
					name: '<?php echo $text_none; ?>',
					customer_group: '',
					firstname: '',
					lastname: '',
					email: '',
					telephone: '',
					fax: '',
					custom_field: [],
					address: []
				});

				response($.map(json, function(item) {
					return {
						category: item['customer_group'],
						label: item['name'],
						value: item['customer_id'],
						customer_group_id: item['customer_group_id'],
						firstname: item['firstname'],
						lastname: item['lastname'],
						email: item['email'],
						telephone: item['telephone'],
						fax: item['fax'],
						custom_field: item['custom_field'],
						address: item['address']
					}
				}));
			}
		});
	},
	'select': function(item) {
		// Reset all custom fields
		$('#form-order-customer input[type=\'text\'], #form-order-customer textarea').not('#form-order-customer input[name=\'customer\'], #form-order-customer input[name=\'customer_id\']').val('');
		$('#form-order-customer select option').removeAttr('selected');
		$('#form-order-customer input[type=\'checkbox\'], #form-order-customer input[type=\'radio\']').removeAttr('checked');

		$('#form-order-customer input[name=\'customer\']').val(item['label']);
		$('#form-order-customer input[name=\'customer_id\']').val(item['value']);
		$('#form-order-customer select[name=\'customer_group_id\']').val(item['customer_group_id']);
		$('#form-order-customer input[name=\'firstname\']').val(item['firstname']);
		$('#form-order-customer input[name=\'lastname\']').val(item['lastname']);
		$('#form-order-customer input[name=\'email\']').val(item['email']);
		$('#form-order-customer input[name=\'telephone\']').val(item['telephone']);
		$('#form-order-customer input[name=\'fax\']').val(item['fax']);

		for (i in item.custom_field) {
			$('#form-order-customer select[name=\'custom_field[' + i + ']\']').val(item.custom_field[i]);
			$('#form-order-customer textarea[name=\'custom_field[' + i + ']\']').val(item.custom_field[i]);
			$('#form-order-customer input[name^=\'custom_field[' + i + ']\'][type=\'text\']').val(item.custom_field[i]);
			$('#form-order-customer input[name^=\'custom_field[' + i + ']\'][type=\'hidden\']').val(item.custom_field[i]);
			$('#form-order-customer input[name^=\'custom_field[' + i + ']\'][type=\'radio\'][value=\'' + item.custom_field[i] + '\']').prop('checked', true);

			if (item.custom_field[i] instanceof Array) {
				for (j = 0; j < item.custom_field[i].length; j++) {
					$('#form-order-customer input[name^=\'custom_field[' + i + ']\'][type=\'checkbox\'][value=\'' + item.custom_field[i][j] + '\']').prop('checked', true);
				}
			}
		}

		$('select[name=\'customer_group_id\']').trigger('change');
	}
});

// Custom Fields
$('select[name=\'customer_group_id\']').on('change', function() {
	$.ajax({
		url: 'index.php?route=customer/customer/customfield&token=<?php echo $token; ?>&customer_group_id=' + this.value,
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
$('#form-order-customer .form-group[data-sort]').detach().each(function() {
	if ($(this).attr('data-sort') >= 0 && $(this).attr('data-sort') <= $('#form-order-customer .form-group').length) {
		$('#form-order-customer .form-group').eq($(this).attr('data-sort')).before(this);
	}

	if ($(this).attr('data-sort') > $('#form-order-customer .form-group').length) {
		$('#form-order-customer .form-group:last').after(this);
	}

	if ($(this).attr('data-sort') < -$('#form-order-customer .form-group').length) {
		$('#form-order-customer .form-group:first').before(this);
	}
});
//--></script>