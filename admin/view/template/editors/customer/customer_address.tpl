<div class="modal-header">
  <button type="button" class="pull-right btn btn-danger btn-sm" data-dismiss="modal" aria-hidden="true"><i class="fa fa-close"></i></button>
  <h4 class="modal-title"><?php echo $firstname; ?> <?php echo $lastname; ?> - <?php echo $tab_address; ?></h4>
</div>
<div class="modal-body">
  <form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data" id="form-customer-address" class="form-horizontal">
	<input type="hidden" name="customer_group_id" value="<?php echo $customer_group_id; ?>" />
	<div id="tab-general">
      <div class="row">
        <div class="col-sm-3">
          <ul class="nav nav-pills nav-stacked" id="address">
            <?php $address_row = 1; ?>
            <?php foreach ($addresses as $address) { ?>
              <li><a href="#tab-address<?php echo $address_row; ?>" data-toggle="tab"><span class="btn btn-danger opt-btn btn-sm" onclick="$('#address a:first').tab('show'); $('#address a[href=\'#tab-address<?php echo $address_row; ?>\']').parent().remove(); $('#tab-address<?php echo $address_row; ?>').remove();"><i class="fa fa-minus-circle"></i></span> <?php echo $tab_address . ' ' . $address_row; ?></a></li>
              <?php $address_row++; ?>
            <?php } ?>
            <li id="address-add"><a onclick="addAddress();"><span class="btn btn-danger opt-btn btn-sm"><i class="fa fa-plus-circle"></i></span> <?php echo $button_address_add; ?></a></li>
          </ul>
        </div>
        <div class="col-sm-9">
          <div class="tab-content">
            <?php $address_row = 1; ?>
            <?php foreach ($addresses as $address) { ?>
              <div class="tab-pane" id="tab-address<?php echo $address_row; ?>">
                <input type="hidden" name="address[<?php echo $address_row; ?>][address_id]" value="<?php echo $address['address_id']; ?>" />
                <div class="form-group required">
                  <label class="col-sm-3 control-label" for="input-firstname<?php echo $address_row; ?>"><?php echo $entry_firstname; ?></label>
                  <div class="col-sm-9">
                    <input type="text" name="address[<?php echo $address_row; ?>][firstname]" value="<?php echo $address['firstname']; ?>" placeholder="<?php echo $entry_firstname; ?>" id="input-firstname<?php echo $address_row; ?>" class="form-control" />
                  </div>
                </div>
                <div class="form-group required">
                  <label class="col-sm-3 control-label" for="input-lastname<?php echo $address_row; ?>"><?php echo $entry_lastname; ?></label>
                  <div class="col-sm-9">
                    <input type="text" name="address[<?php echo $address_row; ?>][lastname]" value="<?php echo $address['lastname']; ?>" placeholder="<?php echo $entry_lastname; ?>" id="input-lastname<?php echo $address_row; ?>" class="form-control" />
                  </div>
                </div>
                <div class="form-group">
                  <label class="col-sm-3 control-label" for="input-company<?php echo $address_row; ?>"><?php echo $entry_company; ?></label>
                  <div class="col-sm-9">
                    <input type="text" name="address[<?php echo $address_row; ?>][company]" value="<?php echo $address['company']; ?>" placeholder="<?php echo $entry_company; ?>" id="input-company<?php echo $address_row; ?>" class="form-control" />
                  </div>
                </div>
                <div class="form-group required">
                  <label class="col-sm-3 control-label" for="input-address-1<?php echo $address_row; ?>"><?php echo $entry_address_1; ?></label>
                  <div class="col-sm-9">
                    <input type="text" name="address[<?php echo $address_row; ?>][address_1]" value="<?php echo $address['address_1']; ?>" placeholder="<?php echo $entry_address_1; ?>" id="input-address-1<?php echo $address_row; ?>" class="form-control" />
                  </div>
                </div>
                <div class="form-group">
                  <label class="col-sm-3 control-label" for="input-address-2<?php echo $address_row; ?>"><?php echo $entry_address_2; ?></label>
                  <div class="col-sm-9">
                    <input type="text" name="address[<?php echo $address_row; ?>][address_2]" value="<?php echo $address['address_2']; ?>" placeholder="<?php echo $entry_address_2; ?>" id="input-address-2<?php echo $address_row; ?>" class="form-control" />
                  </div>
                </div>
                <div class="form-group required">
                  <label class="col-sm-3 control-label" for="input-city<?php echo $address_row; ?>"><?php echo $entry_city; ?></label>
                  <div class="col-sm-9">
                    <input type="text" name="address[<?php echo $address_row; ?>][city]" value="<?php echo $address['city']; ?>" placeholder="<?php echo $entry_city; ?>" id="input-city<?php echo $address_row; ?>" class="form-control" />
                  </div>
                </div>
                <div class="form-group required">
                  <label class="col-sm-3 control-label" for="input-postcode<?php echo $address_row; ?>"><?php echo $entry_postcode; ?></label>
                  <div class="col-sm-9">
                    <input type="text" name="address[<?php echo $address_row; ?>][postcode]" value="<?php echo $address['postcode']; ?>" placeholder="<?php echo $entry_postcode; ?>" id="input-postcode<?php echo $address_row; ?>" class="form-control" />
                  </div>
                </div>
                <div class="form-group required">
                  <label class="col-sm-3 control-label" for="input-country<?php echo $address_row; ?>"><?php echo $entry_country; ?></label>
                  <div class="col-sm-9">
                    <select name="address[<?php echo $address_row; ?>][country_id]" id="input-country<?php echo $address_row; ?>" onchange="country(this, '<?php echo $address_row; ?>', '<?php echo $address['zone_id']; ?>');" class="form-control">
                      <option value=""><?php echo $text_select; ?></option>
                      <?php foreach ($countries as $country) { ?>
                        <?php if ($country['country_id'] == $address['country_id']) { ?>
                          <option value="<?php echo $country['country_id']; ?>" selected="selected"><?php echo $country['name']; ?></option>
                          <?php } else { ?>
                          <option value="<?php echo $country['country_id']; ?>"><?php echo $country['name']; ?></option>
                        <?php } ?>
                      <?php } ?>
                    </select>
                  </div>
                </div>
                <div class="form-group required">
                  <label class="col-sm-3 control-label" for="input-zone<?php echo $address_row; ?>"><?php echo $entry_zone; ?></label>
                  <div class="col-sm-9">
                    <select name="address[<?php echo $address_row; ?>][zone_id]" id="input-zone<?php echo $address_row; ?>" class="form-control"></select>
                  </div>
                </div>
                <?php foreach ($custom_fields as $custom_field) { ?>
                  <?php if ($custom_field['location'] == 'address') { ?>
                    <?php if ($custom_field['type'] == 'select') { ?>
                      <div class="form-group custom-field custom-field<?php echo $custom_field['custom_field_id']; ?>" data-sort="<?php echo $custom_field['sort_order'] + 1; ?>">
                        <label class="col-sm-3 control-label" for="input-address<?php echo $address_row; ?>-custom-field<?php echo $custom_field['custom_field_id']; ?>"><?php echo $custom_field['name']; ?></label>
                        <div class="col-sm-9">
                          <select name="address[<?php echo $address_row; ?>][custom_field][<?php echo $custom_field['custom_field_id']; ?>]" id="input-address<?php echo $address_row; ?>-custom-field<?php echo $custom_field['custom_field_id']; ?>" class="form-control">
                            <option value=""><?php echo $text_select; ?></option>
                            <?php foreach ($custom_field['custom_field_value'] as $custom_field_value) { ?>
                              <?php if (isset($address['custom_field'][$custom_field['custom_field_id']]) && $custom_field_value['custom_field_value_id'] == $address['custom_field'][$custom_field['custom_field_id']]) { ?>
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
                      <div class="form-group custom-field custom-field<?php echo $custom_field['custom_field_id']; ?>" data-sort="<?php echo $custom_field['sort_order'] + 1; ?>">
                        <label class="col-sm-3 control-label"><?php echo $custom_field['name']; ?></label>
                        <div class="col-sm-9">
                          <div>
                            <?php foreach ($custom_field['custom_field_value'] as $custom_field_value) { ?>
                              <div class="radio">
                                <?php if (isset($address['custom_field'][$custom_field['custom_field_id']]) && $custom_field_value['custom_field_value_id'] == $address['custom_field'][$custom_field['custom_field_id']]) { ?>
								  <label>
									<input type="radio" name="address[<?php echo $address_row; ?>][custom_field][<?php echo $custom_field['custom_field_id']; ?>]" value="<?php echo $custom_field_value['custom_field_value_id']; ?>" checked="checked" />
									<?php echo $custom_field_value['name']; ?>
								  </label>
								  <?php } else { ?>
								  <label>
                                    <input type="radio" name="address[<?php echo $address_row; ?>][custom_field][<?php echo $custom_field['custom_field_id']; ?>]" value="<?php echo $custom_field_value['custom_field_value_id']; ?>" />
									<?php echo $custom_field_value['name']; ?>
								  </label>
                                <?php } ?>
                              </div>
                            <?php } ?>
                          </div>
                        </div>
                      </div>
                    <?php } ?>
                    <?php if ($custom_field['type'] == 'checkbox') { ?>
                      <div class="form-group custom-field custom-field<?php echo $custom_field['custom_field_id']; ?>" data-sort="<?php echo $custom_field['sort_order'] + 1; ?>">
                        <label class="col-sm-3 control-label"><?php echo $custom_field['name']; ?></label>
                        <div class="col-sm-9">
                          <div>
                            <?php foreach ($custom_field['custom_field_value'] as $custom_field_value) { ?>
                              <div>
                                <?php if (isset($address['custom_field'][$custom_field['custom_field_id']]) && in_array($custom_field_value['custom_field_value_id'], $address['custom_field'][$custom_field['custom_field_id']])) { ?>
								  <label>
									<input type="checkbox" name="address[<?php echo $address_row; ?>][custom_field][<?php echo $custom_field['custom_field_id']; ?>][]" value="<?php echo $custom_field_value['custom_field_value_id']; ?>" checked="checked" />
									<?php echo $custom_field_value['name']; ?>
								  </label>
								  <?php } else { ?>
								  <label>
									<input type="checkbox" name="address[<?php echo $address_row; ?>][custom_field][<?php echo $custom_field['custom_field_id']; ?>][]" value="<?php echo $custom_field_value['custom_field_value_id']; ?>" />
									<?php echo $custom_field_value['name']; ?>
								  </label>
                                <?php } ?>
                              </div>
                            <?php } ?>
                          </div>
                        </div>
                      </div>
                    <?php } ?>
                    <?php if ($custom_field['type'] == 'text') { ?>
                      <div class="form-group custom-field custom-field<?php echo $custom_field['custom_field_id']; ?>" data-sort="<?php echo $custom_field['sort_order'] + 1; ?>">
                        <label class="col-sm-3 control-label" for="input-address<?php echo $address_row; ?>-custom-field<?php echo $custom_field['custom_field_id']; ?>"><?php echo $custom_field['name']; ?></label>
                        <div class="col-sm-9">
                          <input type="text" name="address[<?php echo $address_row; ?>][custom_field][<?php echo $custom_field['custom_field_id']; ?>]" value="<?php echo (isset($address['custom_field'][$custom_field['custom_field_id']]) ? $address['custom_field'][$custom_field['custom_field_id']] : $custom_field['value']); ?>" placeholder="<?php echo $custom_field['name']; ?>" id="input-address<?php echo $address_row; ?>-custom-field<?php echo $custom_field['custom_field_id']; ?>" class="form-control" />
                        </div>
                      </div>
                    <?php } ?>
                    <?php if ($custom_field['type'] == 'textarea') { ?>
                      <div class="form-group custom-field custom-field<?php echo $custom_field['custom_field_id']; ?>" data-sort="<?php echo $custom_field['sort_order'] + 1; ?>">
                        <label class="col-sm-3 control-label" for="input-address<?php echo $address_row; ?>-custom-field<?php echo $custom_field['custom_field_id']; ?>"><?php echo $custom_field['name']; ?></label>
                        <div class="col-sm-9">
                          <textarea name="address[<?php echo $address_row; ?>][custom_field][<?php echo $custom_field['custom_field_id']; ?>]" rows="5" placeholder="<?php echo $custom_field['name']; ?>" id="input-address<?php echo $address_row; ?>-custom-field<?php echo $custom_field['custom_field_id']; ?>" class="form-control"><?php echo (isset($address['custom_field'][$custom_field['custom_field_id']]) ? $address['custom_field'][$custom_field['custom_field_id']] : $custom_field['value']); ?></textarea>
                        </div>
                      </div>
                    <?php } ?>
                    <?php if ($custom_field['type'] == 'file') { ?>
                      <div class="form-group custom-field custom-field<?php echo $custom_field['custom_field_id']; ?>" data-sort="<?php echo $custom_field['sort_order'] + 1; ?>">
                        <label class="col-sm-3 control-label"><?php echo $custom_field['name']; ?></label>
                        <div class="col-sm-9">
                          <button type="button" id="button-address<?php echo $address_row; ?>-custom-field<?php echo $custom_field['custom_field_id']; ?>" data-loading-text="<?php echo $text_loading; ?>" class="btn btn-default"><i class="fa fa-upload"></i> <?php echo $button_upload; ?></button>
                          <input type="hidden" name="address[<?php echo $address_row; ?>][custom_field][<?php echo $custom_field['custom_field_id']; ?>]" value="<?php echo (isset($address['custom_field'][$custom_field['custom_field_id']]) ? $address['custom_field'][$custom_field['custom_field_id']] : ''); ?>" />
                        </div>
                      </div>
                    <?php } ?>
                    <?php if ($custom_field['type'] == 'date') { ?>
                      <div class="form-group custom-field custom-field<?php echo $custom_field['custom_field_id']; ?>" data-sort="<?php echo $custom_field['sort_order'] + 1; ?>">
                        <label class="col-sm-3 control-label" for="input-address<?php echo $address_row; ?>-custom-field<?php echo $custom_field['custom_field_id']; ?>"><?php echo $custom_field['name']; ?></label>
                        <div class="col-sm-9">
                          <div class="input-group date">
                            <input type="text" name="address[<?php echo $address_row; ?>][custom_field][<?php echo $custom_field['custom_field_id']; ?>]" value="<?php echo (isset($address['custom_field'][$custom_field['custom_field_id']]) ? $address['custom_field'][$custom_field['custom_field_id']] : $custom_field['value']); ?>" placeholder="<?php echo $custom_field['name']; ?>" data-date-format="YYYY-MM-DD" id="input-address<?php echo $address_row; ?>-custom-field<?php echo $custom_field['custom_field_id']; ?>" class="form-control" />
                            <span class="input-group-btn"><button type="button" class="btn btn-default"><i class="fa fa-calendar"></i></button></span>
						  </div>
                        </div>
                      </div>
                    <?php } ?>
                    <?php if ($custom_field['type'] == 'time') { ?>
                      <div class="form-group custom-field custom-field<?php echo $custom_field['custom_field_id']; ?>" data-sort="<?php echo $custom_field['sort_order'] + 1; ?>">
                        <label class="col-sm-3 control-label" for="input-address<?php echo $address_row; ?>-custom-field<?php echo $custom_field['custom_field_id']; ?>"><?php echo $custom_field['name']; ?></label>
                        <div class="col-sm-9">
                          <div class="input-group time">
                            <input type="text" name="address[<?php echo $address_row; ?>][custom_field][<?php echo $custom_field['custom_field_id']; ?>]" value="<?php echo (isset($address['custom_field'][$custom_field['custom_field_id']]) ? $address['custom_field'][$custom_field['custom_field_id']] : $custom_field['value']); ?>" placeholder="<?php echo $custom_field['name']; ?>" data-date-format="HH:mm" id="input-address<?php echo $address_row; ?>-custom-field<?php echo $custom_field['custom_field_id']; ?>" class="form-control" />
                            <span class="input-group-btn"><button type="button" class="btn btn-default"><i class="fa fa-calendar"></i></button></span>
						  </div>
                        </div>
                      </div>
                    <?php } ?>
                    <?php if ($custom_field['type'] == 'datetime') { ?>
                      <div class="form-group custom-field custom-field<?php echo $custom_field['custom_field_id']; ?>" data-sort="<?php echo $custom_field['sort_order'] + 1; ?>">
                        <label class="col-sm-3 control-label" for="input-address<?php echo $address_row; ?>-custom-field<?php echo $custom_field['custom_field_id']; ?>"><?php echo $custom_field['name']; ?></label>
                        <div class="col-sm-9">
                          <div class="input-group datetime">
                            <input type="text" name="address[<?php echo $address_row; ?>][custom_field][<?php echo $custom_field['custom_field_id']; ?>]" value="<?php echo (isset($address['custom_field'][$custom_field['custom_field_id']]) ? $address['custom_field'][$custom_field['custom_field_id']] : $custom_field['value']); ?>" placeholder="<?php echo $custom_field['name']; ?>" data-date-format="YYYY-MM-DD HH:mm" id="input-address<?php echo $address_row; ?>-custom-field<?php echo $custom_field['custom_field_id']; ?>" class="form-control" />
                            <span class="input-group-btn"><button type="button" class="btn btn-default"><i class="fa fa-calendar"></i></button></span>
						  </div>
                        </div>
                      </div>
                    <?php } ?>
                  <?php } ?>
                <?php } ?>
                <div class="form-group">
                  <label class="col-sm-3 control-label"><?php echo $entry_default; ?></label>
                    <div class="col-sm-9">
                      <label class="radio">
                        <?php if (($address['address_id'] == $address_id) || !$addresses) { ?>
                          <input type="radio" name="address[<?php echo $address_row; ?>][default]" value="<?php echo $address_row; ?>" checked="checked" />
                          <?php } else { ?>
                          <input type="radio" name="address[<?php echo $address_row; ?>][default]" value="<?php echo $address_row; ?>" />
                        <?php } ?>
                      </label>
                    </div>
                  </div>
                </div>
                <?php $address_row++; ?>
              <?php } ?>
            </div>
          </div>
        </div>
      </div>
	</div>
  </form>
</div>
<div class="modal-footer">
  <div class="text-center"><a data-form="form-customer-address" class="button-save btn btn-info btn-lg"><?php echo $button_save; ?></a></div>
</div>
<script type="text/javascript"><!--
$(".button-save").on('click', function() {		
	$.ajax({
		url: $('#' + $(this).data('form')).attr('action'),
		type: 'post',
		dataType: 'json',
		data: $('#' + $(this).data('form') + ' input[type=\'text\'], #' + $(this).data('form') + ' input[type=\'hidden\'], #' + $(this).data('form') + ' input[type=\'radio\']:checked, #' + $(this).data('form') + ' input[type=\'checkbox\']:checked, #' + $(this).data('form') + ' select, #' + $(this).data('form') + ' textarea'),
		success: function(json) {
			if (json['error']) {
				$('#form-customer-address').before('<div class="alert alert-danger"><i class="fa fa-exclamation-circle"></i> ' + json['error'] + '</div>');
				
				$('.alert-danger').delay(1500).fadeOut(500);	
			}
								
			if (json['success']) {				
				$('#form-customer-address').before('<div class="alert alert-success"><i class="fa fa-exclamation-circle"></i> ' + json['success'] + '</div>');
			
				setTimeout(function(){
					$('#modal-customer-edit').modal('hide');
				}, 1000)
			}
		}
	});
}); 
//--></script>
<script type="text/javascript"><!--
$.ajax({
	url: 'index.php?route=editors/customer/customfield&token=<?php echo $token; ?>&customer_group_id=<?php echo $customer_group_id; ?>',
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
	}
});
//--></script>
<script type="text/javascript"><!--
var address_row = <?php echo $address_row; ?>;

function addAddress() {
	html  = '<div class="tab-pane" id="tab-address' + address_row + '">';
	html += '  <input type="hidden" name="address[' + address_row + '][address_id]" value="" />';

	html += '  <div class="form-group required">';
	html += '    <label class="col-sm-3 control-label" for="input-firstname' + address_row + '"><?php echo $entry_firstname; ?></label>';
	html += '    <div class="col-sm-9"><input type="text" name="address[' + address_row + '][firstname]" value="" placeholder="<?php echo $entry_firstname; ?>" id="input-firstname' + address_row + '" class="form-control" /></div>';
	html += '  </div>';

	html += '  <div class="form-group required">';
	html += '    <label class="col-sm-3 control-label" for="input-lastname' + address_row + '"><?php echo $entry_lastname; ?></label>';
	html += '    <div class="col-sm-9"><input type="text" name="address[' + address_row + '][lastname]" value="" placeholder="<?php echo $entry_lastname; ?>" id="input-lastname' + address_row + '" class="form-control" /></div>';
	html += '  </div>';

	html += '  <div class="form-group">';
	html += '    <label class="col-sm-3 control-label" for="input-company' + address_row + '"><?php echo $entry_company; ?></label>';
	html += '    <div class="col-sm-9"><input type="text" name="address[' + address_row + '][company]" value="" placeholder="<?php echo $entry_company; ?>" id="input-company' + address_row + '" class="form-control" /></div>';
	html += '  </div>';

	html += '  <div class="form-group required">';
	html += '    <label class="col-sm-3 control-label" for="input-address-1' + address_row + '"><?php echo $entry_address_1; ?></label>';
	html += '    <div class="col-sm-9"><input type="text" name="address[' + address_row + '][address_1]" value="" placeholder="<?php echo $entry_address_1; ?>" id="input-address-1' + address_row + '" class="form-control" /></div>';
	html += '  </div>';

	html += '  <div class="form-group">';
	html += '    <label class="col-sm-3 control-label" for="input-address-2' + address_row + '"><?php echo $entry_address_2; ?></label>';
	html += '    <div class="col-sm-9"><input type="text" name="address[' + address_row + '][address_2]" value="" placeholder="<?php echo $entry_address_2; ?>" id="input-address-2' + address_row + '" class="form-control" /></div>';
	html += '  </div>';

	html += '  <div class="form-group required">';
	html += '    <label class="col-sm-3 control-label" for="input-city' + address_row + '"><?php echo $entry_city; ?></label>';
	html += '    <div class="col-sm-9"><input type="text" name="address[' + address_row + '][city]" value="" placeholder="<?php echo $entry_city; ?>" id="input-city' + address_row + '" class="form-control" /></div>';
	html += '  </div>';

	html += '  <div class="form-group required">';
	html += '    <label class="col-sm-3 control-label" for="input-postcode' + address_row + '"><?php echo $entry_postcode; ?></label>';
	html += '    <div class="col-sm-9"><input type="text" name="address[' + address_row + '][postcode]" value="" placeholder="<?php echo $entry_postcode; ?>" id="input-postcode' + address_row + '" class="form-control" /></div>';
	html += '  </div>';

	html += '  <div class="form-group required">';
	html += '    <label class="col-sm-3 control-label" for="input-country' + address_row + '"><?php echo $entry_country; ?></label>';
	html += '    <div class="col-sm-9"><select name="address[' + address_row + '][country_id]" id="input-country' + address_row + '" onchange="country(this, \'' + address_row + '\', \'0\');" class="form-control">';
    html += '         <option value=""><?php echo $text_select; ?></option>';
    <?php foreach ($countries as $country) { ?>
    html += '         <option value="<?php echo $country['country_id']; ?>"><?php echo addslashes($country['name']); ?></option>';
    <?php } ?>
    html += '      </select></div>';
	html += '  </div>';

	html += '  <div class="form-group required">';
	html += '    <label class="col-sm-3 control-label" for="input-zone' + address_row + '"><?php echo $entry_zone; ?></label>';
	html += '    <div class="col-sm-9"><select name="address[' + address_row + '][zone_id]" id="input-zone' + address_row + '" class="form-control"><option value=""><?php echo $text_none; ?></option></select></div>';
	html += '  </div>';

	// Custom Fields
	<?php foreach ($custom_fields as $custom_field) { ?>
	<?php if ($custom_field['location'] == 'address') { ?>
	<?php if ($custom_field['type'] == 'select') { ?>

	html += '  <div class="form-group custom-field custom-field<?php echo $custom_field['custom_field_id']; ?>" data-sort="<?php echo $custom_field['sort_order'] + 1; ?>">';
	html += '  		<label class="col-sm-3 control-label" for="input-address' + address_row + '-custom-field<?php echo $custom_field['custom_field_id']; ?>"><?php echo addslashes($custom_field['name']); ?></label>';
	html += '  		<div class="col-sm-9">';
	html += '  		  <select name="address[' + address_row + '][custom_field][<?php echo $custom_field['custom_field_id']; ?>]" id="input-address' + address_row + '-custom-field<?php echo $custom_field['custom_field_id']; ?>" class="form-control">';
	html += '  			<option value=""><?php echo $text_select; ?></option>';

	<?php foreach ($custom_field['custom_field_value'] as $custom_field_value) { ?>
	html += '  			<option value="<?php echo $custom_field_value['custom_field_value_id']; ?>"><?php echo addslashes($custom_field_value['name']); ?></option>';
	<?php } ?>

	html += '  		  </select>';
	html += '  		</div>';
	html += '  	  </div>';
	<?php } ?>

	<?php if ($custom_field['type'] == 'radio') { ?>
	html += '  	  <div class="form-group custom-field custom-field<?php echo $custom_field['custom_field_id']; ?>">';
	html += '  		<label class="col-sm-3 control-label"><?php echo addslashes($custom_field['name']); ?></label>';
	html += '  		<div class="col-sm-9">';
	html += '  		  <div>';

	<?php foreach ($custom_field['custom_field_value'] as $custom_field_value) { ?>
	html += '  			<div class="radio"><label><input type="radio" name="address[' + address_row + '][custom_field][<?php echo $custom_field['custom_field_id']; ?>]" value="<?php echo $custom_field_value['custom_field_value_id']; ?>" /> <?php echo addslashes($custom_field_value['name']); ?></label></div>';
	<?php } ?>

	html += '		  </div>';
	html += '		</div>';
	html += '	  </div>';
	<?php } ?>

	<?php if ($custom_field['type'] == 'checkbox') { ?>
	html += '	  <div class="form-group custom-field custom-field<?php echo $custom_field['custom_field_id']; ?>" data-sort="<?php echo $custom_field['sort_order'] + 1; ?>">';
	html += '		<label class="col-sm-3 control-label"><?php echo addslashes($custom_field['name']); ?></label>';
	html += '		<div class="col-sm-9">';
	html += '		  <div>';

	<?php foreach ($custom_field['custom_field_value'] as $custom_field_value) { ?>
	html += '			<div class="checkbox"><label><input type="checkbox" name="address[<?php echo $address_row; ?>][custom_field][<?php echo $custom_field['custom_field_id']; ?>][]" value="<?php echo $custom_field_value['custom_field_value_id']; ?>" /> <?php echo addslashes($custom_field_value['name']); ?></label></div>';
	<?php } ?>

	html += '		  </div>';
	html += '		</div>';
	html += '	  </div>';
	<?php } ?>

	<?php if ($custom_field['type'] == 'text') { ?>
	html += '	  <div class="form-group custom-field custom-field<?php echo $custom_field['custom_field_id']; ?>" data-sort="<?php echo $custom_field['sort_order'] + 1; ?>">';
	html += '		<label class="col-sm-3 control-label" for="input-address' + address_row + '-custom-field<?php echo $custom_field['custom_field_id']; ?>"><?php echo addslashes($custom_field['name']); ?></label>';
	html += '		<div class="col-sm-9">';
	html += '		  <input type="text" name="address[' + address_row + '][custom_field][<?php echo $custom_field['custom_field_id']; ?>]" value="<?php echo addslashes($custom_field['value']); ?>" placeholder="<?php echo addslashes($custom_field['name']); ?>" id="input-address' + address_row + '-custom-field<?php echo $custom_field['custom_field_id']; ?>" class="form-control" />';
	html += '		</div>';
	html += '	  </div>';
	<?php } ?>

	<?php if ($custom_field['type'] == 'textarea') { ?>
	html += '	  <div class="form-group custom-field custom-field<?php echo $custom_field['custom_field_id']; ?>" data-sort="<?php echo $custom_field['sort_order'] + 1; ?>">';
	html += '		<label class="col-sm-3 control-label" for="input-address' + address_row + '-custom-field<?php echo $custom_field['custom_field_id']; ?>"><?php echo addslashes($custom_field['name']); ?></label>';
	html += '		<div class="col-sm-9">';
	html += '		  <textarea name="address[' + address_row + '][custom_field][<?php echo $custom_field['custom_field_id']; ?>]" rows="5" placeholder="<?php echo addslashes($custom_field['name']); ?>" id="input-address' + address_row + '-custom-field<?php echo $custom_field['custom_field_id']; ?>" class="form-control"><?php echo addslashes($custom_field['value']); ?></textarea>';
	html += '		</div>';
	html += '	  </div>';
	<?php } ?>

	<?php if ($custom_field['type'] == 'file') { ?>
	html += '	  <div class="form-group custom-field custom-field<?php echo $custom_field['custom_field_id']; ?>" data-sort="<?php echo $custom_field['sort_order'] + 1; ?>">';
	html += '		<label class="col-sm-3 control-label"><?php echo addslashes($custom_field['name']); ?></label>';
	html += '		<div class="col-sm-9">';
	html += '		  <button type="button" id="button-address' + address_row + '-custom-field<?php echo $custom_field['custom_field_id']; ?>" data-loading-text="<?php echo $text_loading; ?>" class="btn btn-default"><i class="fa fa-upload"></i> <?php echo $button_upload; ?></button>';
	html += '		  <input type="hidden" name="address[' + address_row + '][<?php echo $custom_field['custom_field_id']; ?>]" value="" id="input-address' + address_row + '-custom-field<?php echo $custom_field['custom_field_id']; ?>" />';
	html += '		</div>';
	html += '	  </div>';
	<?php } ?>

	<?php if ($custom_field['type'] == 'date') { ?>
	html += '	  <div class="form-group custom-field custom-field<?php echo $custom_field['custom_field_id']; ?>" data-sort="<?php echo $custom_field['sort_order'] + 1; ?>">';
	html += '		<label class="col-sm-3 control-label" for="input-address' + address_row + '-custom-field<?php echo $custom_field['custom_field_id']; ?>"><?php echo addslashes($custom_field['name']); ?></label>';
	html += '		<div class="col-sm-9">';
	html += '		  <div class="input-group date"><input type="text" name="address[' + address_row + '][custom_field][<?php echo $custom_field['custom_field_id']; ?>]" value="<?php echo addslashes($custom_field['value']); ?>" placeholder="<?php echo addslashes($custom_field['name']); ?>" data-date-format="YYYY-MM-DD" id="input-address' + address_row + '-custom-field<?php echo $custom_field['custom_field_id']; ?>" class="form-control" /><span class="input-group-btn"><button type="button" class="btn btn-default"><i class="fa fa-calendar"></i></button></span></div>';
	html += '		</div>';
	html += '	  </div>';
	<?php } ?>

	<?php if ($custom_field['type'] == 'time') { ?>
	html += '	  <div class="form-group custom-field custom-field<?php echo $custom_field['custom_field_id']; ?>" data-sort="<?php echo $custom_field['sort_order'] + 1; ?>">';
	html += '		<label class="col-sm-3 control-label" for="input-address' + address_row + '-custom-field<?php echo $custom_field['custom_field_id']; ?>"><?php echo addslashes($custom_field['name']); ?></label>';
	html += '		<div class="col-sm-9">';
	html += '		  <div class="input-group time"><input type="text" name="address[' + address_row + '][custom_field][<?php echo $custom_field['custom_field_id']; ?>]" value="<?php echo $custom_field['value']; ?>" placeholder="<?php echo addslashes($custom_field['name']); ?>" data-date-format="HH:mm" id="input-address' + address_row + '-custom-field<?php echo $custom_field['custom_field_id']; ?>" class="form-control" /><span class="input-group-btn"><button type="button" class="btn btn-default"><i class="fa fa-calendar"></i></button></span></div>';
	html += '		</div>';
	html += '	  </div>';
	<?php } ?>

	<?php if ($custom_field['type'] == 'datetime') { ?>
	html += '	  <div class="form-group custom-field custom-field<?php echo $custom_field['custom_field_id']; ?>" data-sort="<?php echo $custom_field['sort_order'] + 1; ?>">';
	html += '		<label class="col-sm-3 control-label" for="input-address' + address_row + '-custom-field<?php echo $custom_field['custom_field_id']; ?>"><?php echo addslashes($custom_field['name']); ?></label>';
	html += '		<div class="col-sm-9">';
	html += '		  <div class="input-group datetime"><input type="text" name="address[' + address_row + '][custom_field][<?php echo $custom_field['custom_field_id']; ?>]" value="<?php echo addslashes($custom_field['value']); ?>" placeholder="<?php echo addslashes($custom_field['name']); ?>" data-date-format="YYYY-MM-DD HH:mm" id="input-address' + address_row + '-custom-field<?php echo $custom_field['custom_field_id']; ?>" class="form-control" /><span class="input-group-btn"><button type="button" class="btn btn-default"><i class="fa fa-calendar"></i></button></span></div>';
	html += '		</div>';
	html += '	  </div>';
	<?php } ?>

	<?php } ?>
	<?php } ?>

	html += '  <div class="form-group">';
	html += '    <label class="col-sm-3 control-label"><?php echo $entry_default; ?></label>';
	html += '    <div class="col-sm-9"><label class="radio"><input type="radio" name="address[' + address_row + '][default]" value="1" /></label></div>';
	html += '  </div>';

    html += '</div>';

	$('#tab-general .tab-content').append(html);

	$.ajax({
		url: 'index.php?route=editors/customer/customfield&token=<?php echo $token; ?>&customer_group_id=<?php echo $customer_group_id; ?>',
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
		}
	});

	$('select[name=\'address[' + address_row + '][country_id]\']').trigger('change');

	$('#address-add').before('<li><a href="#tab-address' + address_row + '" data-toggle="tab"><span class="btn btn-danger opt-btn btn-sm" onclick="$(\'#address a:first\').tab(\'show\'); $(\'a[href=\\\'#tab-address' + address_row + '\\\']\').parent().remove(); $(\'#tab-address' + address_row + '\').remove();"><i class="fa fa-minus-circle"></i></span> <?php echo $tab_address; ?> ' + address_row + '</a></li>');

	$('#address a[href=\'#tab-address' + address_row + '\']').tab('show');

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

	$('#tab-address' + address_row + ' .form-group[data-sort]').detach().each(function() {
		if ($(this).attr('data-sort') >= 0 && $(this).attr('data-sort') <= $('#tab-address' + address_row + ' .form-group').length) {
			$('#tab-address' + address_row + ' .form-group').eq($(this).attr('data-sort')).before(this);
		}

		if ($(this).attr('data-sort') > $('#tab-address' + address_row + ' .form-group').length) {
			$('#tab-address' + address_row + ' .form-group:last').after(this);
		}

		if ($(this).attr('data-sort') < -$('#tab-address' + address_row + ' .form-group').length) {
			$('#tab-address' + address_row + ' .form-group:first').before(this);
		}
	});

	address_row++;
}
//--></script>
<script type="text/javascript"><!--
$('#address a:first').tab('show');
//--></script>
<script type="text/javascript"><!--
function country(element, index, zone_id) {
	$.ajax({
		url: 'index.php?route=localisation/country/country&token=<?php echo $token; ?>&country_id=' + element.value,
		dataType: 'json',
		beforeSend: function() {
			$('select[name=\'address[' + index + '][country_id]\']').after(' <i class="fa fa-circle-o-notch fa-spin"></i>');
		},
		complete: function() {
			$('.fa-spin').remove();
		},
		success: function(json) {
			if (json['postcode_required'] == '1') {
				$('input[name=\'address[' + index + '][postcode]\']').parent().parent().addClass('required');
			} else {
				$('input[name=\'address[' + index + '][postcode]\']').parent().parent().removeClass('required');
			}

			html = '<option value=""><?php echo $text_select; ?></option>';

			if (json['zone'] && json['zone'] != '') {
				for (i = 0; i < json['zone'].length; i++) {
					html += '<option value="' + json['zone'][i]['zone_id'] + '"';

					if (json['zone'][i]['zone_id'] == zone_id) {
						html += ' selected="selected"';
					}

					html += '>' + json['zone'][i]['name'] + '</option>';
				}
			} else {
				html += '<option value="0"><?php echo $text_none; ?></option>';
			}

			$('select[name=\'address[' + index + '][zone_id]\']').html(html);
		},
		error: function(xhr, ajaxOptions, thrownError) {
			alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
		}
	});
}

$('select[name$=\'[country_id]\']').trigger('change');
//--></script>
<script type="text/javascript"><!--
$('#form-customer-address').delegate('button[id^=\'button-address\'], button[id^=\'button-address\']', 'click', function() {
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
				url: 'index.php?route=tool/upload/upload&token=<?php echo $token; ?>',
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
					$(node).parent().find('.text-danger').remove();

					if (json['error']) {
						$(node).parent().find('input[type=\'hidden\']').after('<div class="text-danger">' + json['error'] + '</div>');
					}

					if (json['success']) {
						alert(json['success']);
					}

					if (json['code']) {
						$(node).parent().find('input[type=\'hidden\']').attr('value', json['code']);
					}
				}
			});
		}
	}, 500);
});

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

// Sort the custom fields
<?php $address_row = 1; ?>
<?php foreach ($addresses as $address) { ?>
$('#tab-address<?php echo $address_row ?> .form-group[data-sort]').detach().each(function() {
	if ($(this).attr('data-sort') >= 0 && $(this).attr('data-sort') <= $('#tab-address<?php echo $address_row ?> .form-group').length) {
		$('#tab-address<?php echo $address_row ?> .form-group').eq($(this).attr('data-sort')).before(this);
	}

	if ($(this).attr('data-sort') > $('#tab-address<?php echo $address_row ?> .form-group').length) {
		$('#tab-address<?php echo $address_row ?> .form-group:last').after(this);
	}

	if ($(this).attr('data-sort') < -$('#tab-address<?php echo $address_row ?> .form-group').length) {
		$('#tab-address<?php echo $address_row ?> .form-group:first').before(this);
	}
});
<?php $address_row++; ?>
<?php } ?>
//--></script>