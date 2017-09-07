<?php echo $header; ?><?php echo $column_left; ?>
<div id="content">
	<div class="page-header">
	    <div class="container-fluid">
		<div class="pull-right"></div>
		      <ul class="breadcrumb">
		        <?php foreach ($breadcrumbs as $breadcrumb) { ?>
		        <li><a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a></li>
		        <?php } ?>
		      </ul>
	    </div>
	 </div>
	<div class="container-fluid">
	<div class="g f-content">
		<?php if (isset($warning) && !empty($warning)) { ?>
		<div class="f-message f-message-error"><?php echo $warning; ?></div>
		<?php } ?>
		<?php if (isset($success) && !empty($success)) { ?>
		<div class="f-message f-message-success"><?php echo $success; ?></div>
		<?php } ?>
		<?php echo $app_header; ?>
		<div class="g-row">
			<div class="g-6 f-sub-header">
				<h3><?php echo $heading_title; ?></h3>
			</div>
			<div class="g-6 f-text-right">&nbsp;</div>
		</div>
		<div class="g-row">
			<ul class="nav nav-tabs f-nav f-nav-tabs">
				<li class="active"><a href="#tab_setting" data-toggle="tab" id="link_tab_setting"><?php echo $tab_setting; ?></a></li>
				<li><a href="#tab_export" data-toggle="tab" id="link_tab_export"><?php echo $tab_export; ?></a></li>
				<li><a href="#tab_import" data-toggle="tab" id="link_tab_import"><?php echo $tab_import; ?></a></li>
				<li><a href="#tab_macros" data-toggle="tab" id="link_tab_macros"><?php echo $tab_macros; ?></a></li>
			</ul>
			<div class="tab-content">
			<div id="tab_setting" class="tab-pane fade">
				<form action="<?php echo $action;?>" method="post" id="form_product_setting" enctype="multipart/form-data">
					<div class="f-row f-title"><span><?php echo $caption_product_setting; ?></span></div>
					<input type="hidden" name="form_product_setting_status" id="setting_default" value="1" />
					<div class="f-row">
						<label><?php echo $entry_store; ?></label>
						<div class="f-input">
							<div class="scrollbox" style="height: 100px;width: 300px;">
								<?php $class = 'even'; ?>
								<div class="<?php echo $class; ?>">
									<?php if (isset($csv_setting['to_store']) && is_array($csv_setting['to_store']) && in_array(0, $csv_setting['to_store'])) { ?>
									<label><input type="checkbox" name="csv_setting[to_store][]" value="0" checked="checked" />
									<?php echo $text_default; ?></label>
									<?php } else { ?>
									<label><input type="checkbox" name="csv_setting[to_store][]" value="0" />
									<?php echo $text_default; ?></label>
									<?php } ?>
								</div>
								<?php foreach ($stores as $store) { ?>
								<?php $class = ($class == 'even' ? 'odd' : 'even'); ?>
								<div class="<?php echo $class; ?>">
									<?php if ( isset($csv_setting['to_store']) && is_array($csv_setting['to_store']) && in_array($store['store_id'], $csv_setting['to_store'])) { ?>
									<label><input type="checkbox" name="csv_setting[to_store][]" value="<?php echo $store['store_id']; ?>" checked="checked" />
									<?php echo $store['name']; ?></label>
									<?php } else { ?>
									<label><input type="checkbox" name="csv_setting[to_store][]" value="<?php echo $store['store_id']; ?>" />
									<?php echo $store['name']; ?></label>
									<?php } ?>
								</div>
								<?php } ?>
							</div>
						</div>
						<!-- end f-input -->
					</div>
					<!-- end f-row -->
					<div class="f-row">
						<label><?php echo $entry_tax_class; ?></label>
						<div class="f-input">
							<select name="csv_setting[tax_class_id]" class="g-3">
								<option value="0"><?php echo $text_none; ?></option>
								<?php foreach ($tax_classes as $tax_class) { ?>
								<?php if ($tax_class['tax_class_id'] == $csv_setting['tax_class_id']) { ?>
								<option value="<?php echo $tax_class['tax_class_id']; ?>" selected="selected"><?php echo $tax_class['title']; ?></option>
								<?php } else { ?>
								<option value="<?php echo $tax_class['tax_class_id']; ?>"><?php echo $tax_class['title']; ?></option>
								<?php } ?>
								<?php } ?>
							</select>
						</div>
						<!-- end f-input -->
					</div>
					<!-- end f-row -->
					<div class="f-row">
						<label data-prop_id="0"><?php echo $entry_minimum; ?></label>
						<div class="f-input">
							<input class="g-1 f-text-right" type="text" name="csv_setting[minimum]" value="<?php echo $csv_setting['minimum']; ?>" />
						</div>
						<!-- end f-input -->
					</div>
					<!-- end f-row -->
					<div class="f-row">
						<label><?php echo $entry_subtract; ?></label>
						<div class="f-input">
							<select class="g-2" name="csv_setting[subtract]">
								<?php if ($csv_setting['subtract']) { ?>
								<option value="1" selected="selected"><?php echo $text_yes; ?></option>
								<option value="0"><?php echo $text_no; ?></option>
								<?php } else { ?>
								<option value="1"><?php echo $text_yes; ?></option>
								<option value="0" selected="selected"><?php echo $text_no; ?></option>
								<?php } ?>
							</select>
						</div>
						<!-- end f-input -->
					</div>
					<!-- end f-row -->
					<div class="clearfix"></div>
					<div class="f-row">
						<label data-prop_id="1"><?php echo $entry_stock_status; ?></label>
						<div class="f-input">
							<select class="g-3" name="csv_setting[stock_status_id]">
								<?php foreach ($stock_statuses as $stock_status) { ?>
								<?php if (isset($stock_status['stock_status_id']) && $stock_status['stock_status_id'] == $csv_setting['stock_status_id']) { ?>
								<option value="<?php echo $stock_status['stock_status_id']; ?>" selected="selected"><?php echo $stock_status['name']; ?></option>
								<?php } else { ?>
								<option value="<?php echo $stock_status['stock_status_id']; ?>"><?php echo $stock_status['name']; ?></option>
								<?php } ?>
								<?php } ?>
							</select>
						</div>
						<!-- end f-input -->
					</div>
					<!-- end f-row -->
					<div class="clearfix"></div>
					<div class="f-row">
						<label><?php echo $entry_shipping; ?></label>
						<div class="f-input">
							<select class="g-2" name="csv_setting[shipping]">
								<?php if ($csv_setting['shipping']) { ?>
								<option value="1" selected="selected"><?php echo $text_yes; ?></option>
								<option value="0"><?php echo $text_no; ?></option>
								<?php } else { ?>
								<option value="1"><?php echo $text_yes; ?></option>
								<option value="0" selected="selected"><?php echo $text_no; ?></option>
								<?php } ?>
							</select>
						</div>
						<!-- end f-input -->
					</div>
					<!-- end f-row -->
					<div class="f-row">
						<label><?php echo $entry_length_class; ?></label>
						<div class="f-input">
							<select class="g-3" name="csv_setting[length_class_id]">
								<?php foreach ($length_classes as $length_class) { ?>
								<?php if ($length_class['length_class_id'] == $csv_setting['length_class_id']) { ?>
								<option value="<?php echo $length_class['length_class_id']; ?>" selected="selected"><?php echo $length_class['title']; ?></option>
								<?php } else { ?>
								<option value="<?php echo $length_class['length_class_id']; ?>"><?php echo $length_class['title']; ?></option>
								<?php } ?>
								<?php } ?>
							</select>
						</div>
						<!-- end f-input -->
					</div>
					<!-- end f-row -->
					<div class="f-row">
						<label><?php echo $entry_weight_class; ?></label>
						<div class="f-input">
							<select class="g-3" name="csv_setting[weight_class_id]">
								<?php foreach ($weight_classes as $weight_class) { ?>
								<?php if ($weight_class['weight_class_id'] == $csv_setting['weight_class_id']) { ?>
								<option value="<?php echo $weight_class['weight_class_id']; ?>" selected="selected"><?php echo $weight_class['title']; ?></option>
								<?php } else { ?>
								<option value="<?php echo $weight_class['weight_class_id']; ?>"><?php echo $weight_class['title']; ?></option>
								<?php } ?>
								<?php } ?>
							</select>
						</div>
						<!-- end f-input -->
					</div>
					<!-- end f-row -->
					<div class="f-row">
						<label><?php echo $entry_sort_order; ?></label>
						<div class="f-input">
							<input class="g-1 f-text-right" type="text" name="csv_setting[sort_order]" value="<?php echo $csv_setting['sort_order']; ?>" />
						</div>
						<!-- end f-input -->
					</div>
					<!-- end f-row -->
					<div class="f-row">
						<label><?php echo $entry_status; ?></label>
						<div class="f-input">
							<select class="g-2" name="csv_setting[status]">
								<?php if ($csv_setting['status']) { ?>
								<option value="1" selected="selected"><?php echo $text_enabled; ?></option>
								<option value="0"><?php echo $text_disabled; ?></option>
								<?php } else { ?>
								<option value="1"><?php echo $text_enabled; ?></option>
								<option value="0" selected="selected"><?php echo $text_disabled; ?></option>
								<?php } ?>
							</select>
						</div>
						<!-- end f-input -->
					</div>
					<!-- end f-row -->
					<div class="f-row f-title"><span><?php echo $text_default_options_setting;?></span></div>
					<div class="f-row">
						<label><?php echo $entry_option_type; ?></label>
						<div class="f-input">
							<select class="g-2" name="csv_setting[option_type]">
								<optgroup label="Choose">
									<option value="select"<?php if (isset($csv_setting['option_type']) && $csv_setting['option_type'] == 'select') {echo ' selected="selected"';} ?>>Select</option>
									<option value="radio"<?php if (isset($csv_setting['option_type']) && $csv_setting['option_type'] == 'radio') {echo ' selected="selected"';} ?>>Radio</option>
									<option value="checkbox"<?php if (isset($csv_setting['option_type']) && $csv_setting['option_type'] == 'checkbox') {echo ' selected="selected"';} ?>>Checkbox</option>
									<option value="image"<?php if (isset($csv_setting['option_type']) && $csv_setting['option_type'] == 'image') {echo ' selected="selected"';} ?>>Image</option>
								</optgroup>
								<optgroup label="Input">
									<option value="text"<?php if (isset($csv_setting['option_type']) && $csv_setting['option_type'] == 'text') {echo ' selected="selected"';} ?>>Text</option>
									<option value="textarea"<?php if (isset($csv_setting['option_type']) && $csv_setting['option_type'] == 'textarea') {echo ' selected="selected"';} ?>>Textarea</option>
								</optgroup>
								<optgroup label="File">
									<option value="file"<?php if (isset($csv_setting['option_type']) && $csv_setting['option_type'] == 'file') {echo ' selected="selected"';} ?>>File</option>
								</optgroup>
								<optgroup label="Date">
									<option value="date"<?php if (isset($csv_setting['option_type']) && $csv_setting['option_type'] == 'date') {echo ' selected="selected"';} ?>>Date</option>
									<option value="time"<?php if (isset($csv_setting['option_type']) && $csv_setting['option_type'] == 'time') {echo ' selected="selected"';} ?>>Time</option>
									<option value="datetime"<?php if (isset($csv_setting['option_type']) && $csv_setting['option_type'] == 'datetime') {echo ' selected="selected"';} ?>>Date &amp; Time</option>
								</optgroup>
							</select>
						</div>
						<!-- end f-input -->
					</div>
					<!-- end f-row -->
					<div class="f-row">
						<label><?php echo $entry_option_required; ?></label>
						<div class="f-input">
							<select class="g-2" name="csv_setting[option_required]">
								<?php if (isset($csv_setting['option_required']) && $csv_setting['option_required'] == 1) { ?>
								<option value="1" selected="selected"><?php echo $text_yes; ?></option>
								<option value="0"><?php echo $text_no; ?></option>
								<?php } else { ?>
								<option value="1"><?php echo $text_yes; ?></option>
								<option value="0" selected="selected"><?php echo $text_no; ?></option>
								<?php } ?>
							</select>
						</div>
						<!-- end f-input -->
					</div>
					<!-- end f-row -->
					<div class="f-row">
						<label><?php echo $entry_option_quantity; ?></label>
						<div class="f-input">
							<input class="g-1 f-text-right" type="text" name="csv_setting[option_quantity]" value="<?php if(isset($csv_setting['option_quantity']))echo $csv_setting['option_quantity']; ?>" />
						</div>
						<!-- end f-input -->
					</div>
					<!-- end f-row -->
					<div class="f-row">
						<label><?php echo $entry_option_subtract_stock; ?></label>
						<div class="f-input">
							<select class="g-2" name="csv_setting[option_subtract_stock]">
								<?php if (isset($csv_setting['option_subtract_stock']) && $csv_setting['option_subtract_stock'] == 1) { ?>
								<option value="1" selected="selected"><?php echo $text_yes; ?></option>
								<option value="0"><?php echo $text_no; ?></option>
								<?php } else { ?>
								<option value="1"><?php echo $text_yes; ?></option>
								<option value="0" selected="selected"><?php echo $text_no; ?></option>
								<?php } ?>
							</select>
						</div>
						<!-- end f-input -->
					</div>
					<!-- end f-row -->
					<div class="f-row">
						<label><?php echo $entry_option_price_prefix; ?></label>
						<div class="f-input">
							<select class="g-1" name="csv_setting[option_price_prefix]">
								<option value="+"<?php if (isset($csv_setting['option_price_prefix']) && $csv_setting['option_price_prefix'] == '+') {echo ' selected="selected"';} ?>>+</option>
								<option value="-"<?php if (isset($csv_setting['option_price_prefix']) && $csv_setting['option_price_prefix'] == '-') {echo ' selected="selected"';} ?>>-</option>
							</select>
						</div>
						<!-- end f-input -->
					</div>
					<!-- end f-row -->
					<div class="f-row">
						<label><?php echo $entry_option_points_prefix; ?></label>
						<div class="f-input">
							<select class="g-1" name="csv_setting[option_points_prefix]">
								<option value="+"<?php if (isset($csv_setting['option_points_prefix']) && $csv_setting['option_points_prefix'] == '+') {echo ' selected="selected"';} ?>>+</option>
								<option value="-"<?php if (isset($csv_setting['option_points_prefix']) && $csv_setting['option_points_prefix'] == '-') {echo ' selected="selected"';} ?>>-</option>
							</select>
						</div>
						<!-- end f-input -->
					</div>
					<!-- end f-row -->
					<div class="f-row">
						<label><?php echo $entry_option_points_default; ?></label>
						<div class="f-input">
							<input class="g-1 f-text-right" type="text" name="csv_setting[option_points_default]" value="<?php if(isset($csv_setting['option_points_default']))echo $csv_setting['option_points_default']; ?>" />
						</div>
						<!-- end f-input -->
					</div>
					<!-- end f-row -->
					<div class="f-row">
						<label><?php echo $entry_option_weight_prefix; ?></label>
						<div class="f-input">
							<select class="g-1" name="csv_setting[option_weight_prefix]">
								<option value="+"<?php if (isset($csv_setting['option_weight_prefix']) && $csv_setting['option_weight_prefix'] == '+') {echo ' selected="selected"';} ?>>+</option>
								<option value="-"<?php if (isset($csv_setting['option_weight_prefix']) && $csv_setting['option_weight_prefix'] == '-') {echo ' selected="selected"';} ?>>-</option>
							</select>
						</div>
						<!-- end f-input -->
					</div>
					<!-- end f-row -->
					<div class="f-row">
						<label><?php echo $entry_option_weight_default; ?></label>
						<div class="f-input">
							<input class="g-1 f-text-right" type="text" name="csv_setting[option_weight_default]" value="<?php if(isset($csv_setting['option_weight_default']))echo $csv_setting['option_weight_default']; ?>" />
						</div>
						<!-- end f-input -->
					</div>
					<!-- end f-row -->
					<div class="f-row"></div>
					<div class="f-row f-actions-left"><a onclick="$('#form_product_setting').submit();" class="f-bu f-bu-default g-2"><?php echo $button_save;?></a> <a onclick="$('#setting_default').val(0);$('#form_product_setting').submit();" class="f-bu g-2"><?php echo $button_default;?></a></div>
				</form>
			</div>
			<!-- end tab_setting -->
			<div id="tab_export" class="tab-pane fade">
				<div class="g-row">
					<div id="wrap_profile_export" class="f-wrap">
						<form id="form_profile_export">
							<div class="f-row">
								<label><?php echo $text_profile_load;?></label>
								<div class="f-input">
									<select class="g-3" name="profile_export_select" id="profile_export_select"></select>
									<a onclick="LoadProfile('profile_export');" class="f-bu"><?php echo $button_load;?></a> - <a onclick="UpdateProfile('profile_export');" class="f-bu"><?php echo $button_save;?></a> - <a onclick="DeleteProfile('profile_export');" class="f-bu"><?php echo $button_delete;?></a>
								</div>
							</div>
							<div class="f-row" style="margin-bottom: 0">
								<label><?php echo $text_import_create_profile;?></label>
								<div class="f-input">
									<input type="text" name="profile_export_name" id="profile_export_name" class="g-3" value=""> <a onclick="CreateProfile('profile_export');" class="f-bu"><?php echo $button_insert;?></a>
								</div>
							</div>
						</form>
					</div>
				</div>
				<div class="g-row"></div>
				<form action="<?php echo $action_export; ?>" method="post" id="form_product_export" enctype="multipart/form-data">
				<div class="g-row">
						<div class="g-7">
							<div class="f-row">
								<label data-prop_id="2"><?php echo $entry_file_encoding; ?></label>
								<div class="f-input">
									<select name="csv_export[file_encoding]" class="g-3">
									<?php if (isset($charsets) && !empty($charsets)) { ?>
										<?php foreach ($charsets as $key => $val) { ?>
											<?php if ( $csv_export['file_encoding'] == $key ) { ?>
												<option value="<?php echo $key;?>" selected="selected"><?php echo $val;?></option>
											<?php } else { ?>
												<option value="<?php echo $key;?>"><?php echo $val;?></option>
											<?php } ?>
										<?php } ?>
									<?php } else { ?>
										<option value="UTF-8" <?php if ( $csv_export['file_encoding'] == 'UTF-8' ) echo 'selected'; ?>>UTF-8</option>
										<option value="WINDOWS-1251" <?php if ( $csv_export['file_encoding'] == 'WINDOWS-1251' ) echo 'selected'; ?>>Windows-1251</option>
									<?php } ?>
									</select>
								</div>
							</div>
							<div class="f-row">
								<label data-prop_id="3"><?php echo $entry_csv_delimiter; ?></label>
								<div class="f-input">
									<select name="csv_export[csv_delimiter]" class="g-1">
										<option value=";" <?php if ( isset($csv_export['csv_delimiter']) && $csv_export['csv_delimiter'] == ';' ) echo 'selected'; ?>> ; </option>
										<option value="," <?php if ( isset($csv_export['csv_delimiter']) && $csv_export['csv_delimiter'] == ',' ) echo 'selected'; ?>> , </option>
										<option value="^" <?php if ( isset($csv_export['csv_delimiter']) && $csv_export['csv_delimiter'] == '^' ) echo ' selected="selected"'; ?>> ^ </option>
									</select>
								</div>
							</div>
							<!-- <div class="f-row">
								<label data-prop_id="31"><?php echo $entry_csv_text_delimiter; ?></label>
								<div class="f-input">
									<input class="g-1" type="text" name="csv_export[csv_text_delimiter]" value='<?php if ( isset($csv_export['csv_text_delimiter']) ) echo $csv_export['csv_text_delimiter'];else echo '"'; ?>' />
								</div>
							</div> -->
							<div class="f-row">
								<label data-prop_id="28"><?php echo $entry_languages; ?></label>
								<div class="f-input">
									<select class="g-3" name="csv_export[language_id]">
										<?php foreach ($languages as $language) { ?>
										<?php if ( $csv_export['language_id'] == $language['language_id'] ) { ?>
										<option value="<?php echo $language['language_id']; ?>" selected="selected"><?php echo $language['name']; ?></option>
										<?php } else { ?>
										<option value="<?php echo $language['language_id']; ?>"><?php echo $language['name']; ?></option>
										<?php } ?>
										<?php } ?>
									</select>
								</div>
							</div>
							<div class="f-row">
								<input type="hidden" name="csv_export[from_store]" value="0">
								<label data-prop_id="27"><?php echo $entry_store; ?></label>
								<div class="f-input">
									<div class="scrollbox">
										<?php $class = 'even'; ?>
										<?php if (!empty($csv_export['from_store']) && in_array(0, $csv_export['from_store'])) { ?>
										<label class="<?php echo $class; ?>"><input type="checkbox" name="csv_export[from_store][]" value="0" checked="checked" /><?php echo $text_default; ?></label>
										<?php } else { ?>
										<label class="<?php echo $class; ?>"><input type="checkbox" name="csv_export[from_store][]" value="0" /><?php echo $text_default; ?></label>
										<?php } ?>
										
										<?php foreach ($stores as $store) { ?>
										<?php $class = ($class == 'even' ? 'odd' : 'even'); ?>
										<?php if (is_array($csv_export['from_store']) && in_array($store['store_id'], $csv_export['from_store'])) { ?>
										<label class="<?php echo $class; ?>"><input type="checkbox" name="csv_export[from_store][]" value="<?php echo $store['store_id']; ?>" checked="checked" /><?php echo $store['name']; ?></label>
										<?php } else { ?>
										<label class="<?php echo $class; ?>"><input type="checkbox" name="csv_export[from_store][]" value="<?php echo $store['store_id']; ?>" /><?php echo $store['name']; ?></label>
										<?php } ?>
										<?php } ?>
									</div>
									<a onclick="$(this).parent().find(':checkbox').prop('checked', true);"><?php echo $text_select_all; ?></a> / <a onclick="$(this).parent().find(':checkbox').prop('checked', false);"><?php echo $text_unselect_all; ?></a>
								</div>
								<!-- end f-input -->
							</div>
							<!-- end f-row -->
							<div class="f-row">
								<label data-prop_id="4"><?php echo $entry_category; ?></label>
								<div class="f-input">
									<input type="hidden" name="csv_export[product_category]" value="0" />
									<div id="export_product_category">
									<div class="scrollbox">
										<?php $class = 'odd'; ?>
										<?php foreach ($categories as $category) { ?>
										<?php $class = ($class == 'even' ? 'odd' : 'even'); ?>
										<label class="<?php echo $class; ?>">
											<span>
												<input type="checkbox" name="csv_export[product_category][]" <?php if ( isset($csv_export['product_category']) && is_array($csv_export['product_category']) && in_array($category['category_id'], $csv_export['product_category'])) { echo ' checked="checked"';} ?> value="<?php echo $category['category_id']; ?>" />
												<?php echo $category['name']; ?>
											</span>
										</label>
										<?php } ?>
									</div>
									<a onclick="$(this).parent().find(':checkbox').prop('checked', true);"><?php echo $text_select_all; ?></a> / <a onclick="$(this).parent().find(':checkbox').prop('checked', false);"><?php echo $text_unselect_all; ?></a>
									/ <a class="show_scroll"><?php echo $text_select;?></a>
									</div>
								</div>
							</div>
							<div class="f-row">
								<label><?php echo $entry_export_related; ?></label>
								<div class="f-input">
									<select class="g-3" name="csv_export[export_related]">
										<option value="0"<?php if (!isset($csv_export['export_related']) || $csv_export['export_related'] == 0) { echo '  selected="selected"'; }?>><?php echo $text_disabled; ?></option>
										<?php foreach($csv_export_key_related as $key => $name) { ?>
											<?php if( isset($csv_export['export_related']) && (string)$csv_export['export_related'] == $key ) { ?>
											<option value="<?php echo $key; ?>" selected="selected"><?php echo sprintf($text_as, $name);?></option>
											<?php } else { ?>
											<option value="<?php echo $key; ?>"><?php echo sprintf($text_as, $name);?></option>
											<?php } ?>
										<?php } ?>
									</select>
								</div>
							</div>
							<div class="clearfix"></div>
							<div class="f-row">
								<label data-prop_id="5"><?php echo $entry_export_category; ?></label>
								<div class="f-input">
									<select class="g-3" name="csv_export[export_category]">
										<option value="0"<?php if (!isset($csv_export['export_category']) || $csv_export['export_category'] == 0) { echo '  selected="selected"'; }?>><?php echo $text_disabled; ?></option>
										<option value="1"<?php if ( isset($csv_export['export_category']) && $csv_export['export_category'] == 1 ) { echo '  selected="selected"'; }?>><?php echo sprintf($text_as, '_CATEGORY_ID_'); ?></option>
										<option value="2"<?php if ( isset($csv_export['export_category']) && $csv_export['export_category'] == 2 ) { echo '  selected="selected"'; }?>><?php echo sprintf($text_as, '_CATEGORY_'); ?></option>
									</select>
								</div>
							</div>
							<div class="clearfix"></div>
							<div class="f-row">
								<label data-prop_id="6"><?php echo $entry_category_delimiter; ?></label>
								<div class="f-input">
									<select class="g-1" name="csv_export[delimiter_category]">
										<option value="|"<?php if(isset($csv_export['delimiter_category']) && $csv_export['delimiter_category'] == '|'){echo ' selected="selected"';}?>> | </option>
										<option value="/"<?php if(isset($csv_export['delimiter_category']) && $csv_export['delimiter_category'] == '/'){echo ' selected="selected"';}?>> / </option>
										<option value=">"<?php if(isset($csv_export['delimiter_category']) && $csv_export['delimiter_category'] == '>'){echo ' selected="selected"';}?>> &gt; </option>
										<option value=","<?php if(isset($csv_export['delimiter_category']) && $csv_export['delimiter_category'] == ','){echo ' selected="selected"';}?>> , </option>
									</select>
								</div>
							</div>
							<div class="clearfix"></div>
							<div class="f-row">
								<label data-prop_id="10"><?php echo $entry_category_parent; ?></label>
								<div class="f-input">
									<select class="g-2" name="csv_export[category_parent]">
										<option value="1"<?php if ( !isset($csv_export['category_parent']) || $csv_export['category_parent'] == 1 ) { echo '  selected="selected"'; }?>><?php echo $text_enabled; ?></option>
										<option value="0"<?php if (isset($csv_export['category_parent']) && $csv_export['category_parent'] == 0) { echo '  selected="selected"'; }?>><?php echo $text_disabled; ?></option>
									</select>
								</div>
							</div>
							<div class="clearfix"></div>
							<div class="f-row">
								<label data-prop_id="7"><?php echo $entry_manufacturer; ?></label>
								<div class="f-input">
									<input type="hidden" name="csv_export[product_manufacturer]" value="0" />
									<div id="expot_product_manufacturer">
									<div class="scrollbox">
										<?php $class = 'odd'; ?>
										<?php foreach ($manufacturers as $manufacturer) { ?>
										<?php $class = ($class == 'even' ? 'odd' : 'even'); ?>
										<label title="<?php echo $manufacturer['name']; ?>" class="<?php echo $class; ?>">
											<span>
												<input type="checkbox" name="csv_export[product_manufacturer][]" value="<?php echo $manufacturer['manufacturer_id']; ?>" <?php if(isset($csv_export['product_manufacturer']) && is_array($csv_export['product_manufacturer']) && in_array($manufacturer['manufacturer_id'], $csv_export['product_manufacturer'])){echo ' checked="checked"';}?> />
												<?php echo $manufacturer['name']; ?>
											</span>
										</label>
										<?php } ?>
									</div>
									<a onclick="$(this).parent().find(':checkbox').prop('checked', true);"><?php echo $text_select_all; ?></a> / <a onclick="$(this).parent().find(':checkbox').prop('checked', false);"><?php echo $text_unselect_all; ?></a>
									/ <a class="show_scroll"><?php echo $text_select;?></a>
									</div>
								</div>
							</div>
							<div class="f-row">
								<label data-prop_id="32"><?php echo $entry_image_url; ?></label>
								<div class="f-input">
									<select class="g-2" name="csv_export[image_url]">
										<option value="1"<?php if ( isset($csv_export['image_url']) && $csv_export['image_url'] == 1 ) { echo '  selected="selected"'; }?>><?php echo $text_enabled; ?></option>
										<option value="0"<?php if ( !isset($csv_export['image_url']) || $csv_export['image_url'] == 0 ) { echo '  selected="selected"'; }?>><?php echo $text_disabled; ?></option>
									</select>
								</div>
							</div>
							<div class="clearfix"></div>
							<div class="f-row">
								<label data-prop_id="8"><?php echo $entry_export_limit; ?></label>
								<div class="f-input">
									<input title="<?php echo $help_export_limit; ?>" type="text" class="g-1 f-text-right" name="csv_export[limit_start]" value="<?php echo $csv_export['limit_start']; ?>">&nbsp;-&nbsp;<input title="<?php echo $help_export_limit; ?>" type="text" class="g-1 f-text-right" name="csv_export[limit_end]" value="<?php echo $csv_export['limit_end']; ?>">
								</div>
							</div>
							<!-- BEGIN FIlter -->
							<div>&nbsp;</div>
							<div class="f-row f-wrap">
								<label for="w_product_filter"><?php echo $entry_product_filter; ?></label>
								<div class="f-input">
									<select class="g-2" name="csv_export[product_filter]" id="w_product_filter" onchange="f_product_filter();">
										<?php if (isset($csv_export['product_filter']) && $csv_export['product_filter']) { ?>
										<option value="1" selected="selected"><?php echo $text_enabled; ?></option>
										<option value="0"><?php echo $text_disabled; ?></option>
										<?php } else { ?>
										<option value="1"><?php echo $text_enabled; ?></option>
										<option value="0" selected="selected"><?php echo $text_disabled; ?></option>
										<?php } ?>
									</select>
								</div>
							</div>
							<div class="clearfix"></div>
							<div id="wrap_product_filter">
								<div class="f-row">
									<label><?php echo $entry_filter_name; ?></label>
									<div class="f-input">
										<input type="text" class="g-3" name="csv_export[filter_name]" value="<?php if(isset($csv_export['filter_name'])){echo $csv_export['filter_name'];}?>" />
									</div>
								</div>
								<div class="f-row">
									<label><?php echo $entry_filter_sku; ?></label>
									<div class="f-input">
										<input type="text" class="g-3" name="csv_export[filter_sku]" value="<?php if(isset($csv_export['filter_sku'])){echo $csv_export['filter_sku'];}?>" />
									</div>
								</div>
								<div class="f-row">
									<label><?php echo $entry_filter_location; ?></label>
									<div class="f-input">
										<input type="text" class="g-3" name="csv_export[filter_location]" value="<?php if(isset($csv_export['filter_location'])){echo $csv_export['filter_location'];}?>" />
									</div>
								</div>
								<div class="f-row">
									<label><?php echo $entry_filter_price; ?></label>
									<div class="f-input">
										<select class="g-1" name="csv_export[filter_price_prefix]">
											<option value="1"<?php if( isset($csv_export['filter_price_prefix']) && $csv_export['filter_price_prefix'] == 1 ){echo ' selected="selected"';}?>> = </option>
											<option value="2"<?php if( isset($csv_export['filter_price_prefix']) && $csv_export['filter_price_prefix'] == 2 ){echo ' selected="selected"';}?>> &gt;= </option>
											<option value="3"<?php if( isset($csv_export['filter_price_prefix']) && $csv_export['filter_price_prefix'] == 3 ){echo ' selected="selected"';}?>> &lt;= </option>
											<option value="4"<?php if( isset($csv_export['filter_price_prefix']) && $csv_export['filter_price_prefix'] == 4 ){echo ' selected="selected"';}?>> &lt;&gt; </option>
										</select>
										<input type="text" class="g-1 f-text-right" name="csv_export[filter_price]" value="<?php if(isset($csv_export['filter_price'])){echo $csv_export['filter_price'];}?>" />
									</div>
								</div>
								<div class="f-row">
									<label><?php echo $entry_filter_price_range; ?></label>
									<div class="f-input">
										<input type="text" class="g-1 f-text-right" name="csv_export[filter_price_start]" value="<?php if(isset($csv_export['filter_price_start'])){echo $csv_export['filter_price_start'];}?>" /> - <input type="text" class="g-1 f-text-right" name="csv_export[filter_price_end]" value="<?php if(isset($csv_export['filter_price_end'])){echo $csv_export['filter_price_end'];}?>" />
									</div>
								</div>
								<div class="f-row">
									<label><?php echo $entry_filter_quantity; ?></label>
									<div class="f-input">
										<select class="g-1" name="csv_export[filter_quantity_prefix]">
											<option value="1"<?php if( isset($csv_export['filter_quantity_prefix']) && $csv_export['filter_quantity_prefix'] == 1 ){echo ' selected="selected"';}?>> = </option>
											<option value="2"<?php if( isset($csv_export['filter_quantity_prefix']) && $csv_export['filter_quantity_prefix'] == 2 ){echo ' selected="selected"';}?>> &gt;= </option>
											<option value="3"<?php if( isset($csv_export['filter_quantity_prefix']) && $csv_export['filter_quantity_prefix'] == 3 ){echo ' selected="selected"';}?>> &lt;= </option>
											<option value="4"<?php if( isset($csv_export['filter_quantity_prefix']) && $csv_export['filter_quantity_prefix'] == 4 ){echo ' selected="selected"';}?>> &lt;&gt; </option>
										</select>
										<input type="text" class="g-1 f-text-right" name="csv_export[filter_quantity]" value="<?php if(isset($csv_export['filter_price'])){echo $csv_export['filter_quantity'];}?>" />
									</div>
								</div>
								<div class="clearfix"></div>
								<div class="f-row">
									<label><?php echo $entry_stock_status; ?></label>
									<div class="f-input">
										<select class="g-3" name="csv_export[filter_stock_status]">
											<option value="0" selected="selected">&nbsp;</option>
											<?php foreach ($stock_statuses as $stock_status) { ?>
											<option value="<?php echo $stock_status['stock_status_id']; ?>" <?php if( isset($csv_export['filter_stock_status']) && $csv_export['filter_stock_status'] == $stock_status['stock_status_id'] ){echo ' selected="selected"';}?>><?php echo $stock_status['name']; ?></option>
											<?php } ?>
										</select>
									</div>
								</div>
								<div class="clearfix"></div>
								<div class="f-row">
									<label><?php echo $entry_filter_status; ?></label>
									<div class="f-input">
										<select class="g-2" name="csv_export[filter_status]">
											<option value="3"<?php if( isset($csv_export['filter_status']) && $csv_export['filter_status'] == 3 ){echo ' selected="selected"';}?>>&nbsp;</option>
											<option value="1"<?php if( isset($csv_export['filter_status']) && $csv_export['filter_status'] == 1 ){echo ' selected="selected"';}?>><?php echo $text_enabled; ?></option>
											<option value="0"<?php if( isset($csv_export['filter_status']) && $csv_export['filter_status'] == 0 ){echo ' selected="selected"';}?>><?php echo $text_disabled; ?></option>
										</select>
									</div>
								</div>
							</div>
							<!-- END Filter -->
						</div>
						<!-- end g-7 -->
						<div class="g-5">
							<div><a onclick="$('.f-field-set').find(':checkbox:not(:checked)').parent().parent().parent().hide();"><?php echo $text_hide_all; ?></a> / <a onclick="$('.f-field-set').find('tr').show();"><?php echo $text_show_all; ?></a></div>
							<table class="f-field-set">
								<?php foreach( $csv_export['fields_set_data'] as $field ) { ?>
								<tr id="row_<?php echo $field['uid']; ?>">
									<td>
										<label title="<?php echo $fields_set_help[$field['uid']]; ?> <?php echo $field['uid']; ?>">
										<input <?php if (array_key_exists($field['uid'], $csv_export['fields_set']) || $field['uid'] == '_ID_') echo 'checked="checked"';?> <?php    if ($field['uid'] == '_ID_') echo ' disabled="disabled" class="field_id" ';?> type="checkbox" id="<?php echo $field['uid']; ?>" name="csv_export[fields_set][<?php echo $field['uid']; ?>]" value="1" />
										<?php echo $fields_set_help[$field['uid']]; ?>
										</label>
									</td>
									<td><span><?php echo $field['uid']; ?></span></td>
								</tr>
								<?php } ?>
							</table>
							<input type="hidden" name="csv_export[fields_set][_ID_]" value="1">
							<a onclick="$(this).parent().find(':checkbox').prop('checked', true);initFieldsSet();"><?php echo $text_select_all; ?></a> / <a onclick="$(this).parent().find(':checkbox').prop('checked', false);initFieldsSet();"><?php echo $text_unselect_all; ?></a>
						</div>
						<!-- end g-5 -->
				</div>
				</form>
				<!-- end g-row -->
				<div class="f-row"></div>
				<div class="f-row f-actions-left"><a onclick="$('#form_product_export').submit();" class="f-bu f-bu-default g-2"><?php echo $button_export;?></a></div>
			</div>
			<!-- end tab_export -->
			<div id="tab_import" class="tab-pane fade">
				<div class="g-row">
					<div id="wrap_profile_import" class="f-wrap">
						<form id="form_profile_import">
							<div class="f-row">
								<label><?php echo $text_profile_load;?></label>
								<div class="f-input">
									<select class="g-3" name="profile_import_select" id="profile_import_select">
										<option value="0">Default</option>
									</select>
									<a onclick="LoadProfile('profile_import');" class="f-bu"><?php echo $button_load;?></a> - <a onclick="UpdateProfile('profile_import');" class="f-bu"><?php echo $button_save;?></a> - <a onclick="DeleteProfile('profile_import');" class="f-bu"><?php echo $button_delete;?></a>
								</div>
							</div>
							<div class="f-row" style="margin-bottom: 0">
								<label><?php echo $text_import_create_profile;?></label>
								<div class="f-input">
									<input type="text" name="profile_import_name" id="profile_import_name" class="g-3" value=""> <a onclick="CreateProfile('profile_import');" class="f-bu"><?php echo $button_insert;?></a>
								</div>
							</div>
						</form>
					</div>
				</div>
				<div class="g-row"></div>
				<form action="<?php echo $action_import; ?>" method="post" id="form_product_import" enctype="multipart/form-data">
					<div class="g-row">
						<div class="g-6 f-form">
							<div class="f-row">
								<label data-prop_id="2"><?php echo $entry_file_encoding; ?></label>
								<div class="f-input">
									<select name="csv_import[file_encoding]" class="g-3">
										<?php if (isset($charsets) && !empty($charsets)) { ?>
											<?php foreach ($charsets as $key => $val) { ?>
												<?php if ( $csv_import['file_encoding'] == $key ) { ?>
													<option value="<?php echo $key;?>" selected="selected"><?php echo $val;?></option>
												<?php } else { ?>
													<option value="<?php echo $key;?>"><?php echo $val;?></option>
												<?php } ?>
											<?php } ?>
										<?php } else { ?>
											<option value="UTF-8" <?php if ( $csv_import['file_encoding'] == 'UTF-8' ) echo 'selected'; ?>>UTF-8</option>
											<option value="WINDOWS-1251" <?php if ( $csv_import['file_encoding'] == 'WINDOWS-1251' ) echo 'selected'; ?>>Windows-1251</option>
										<?php } ?>
									</select>
								</div>
							</div>
							<div class="f-row">
								<label data-prop_id="3"><?php echo $entry_csv_delimiter; ?></label>
								<div class="f-input">
									<select name="csv_import[csv_delimiter]" class="g-1">
										<option value=";" <?php if ( isset($csv_import['csv_delimiter']) && $csv_import['csv_delimiter'] == ';' ) echo 'selected'; ?>> ; </option>
										<option value="," <?php if ( isset($csv_import['csv_delimiter']) && $csv_import['csv_delimiter'] == ',' ) echo 'selected'; ?>> , </option>
									</select>
								</div>
							</div>
							<!-- <div class="f-row">
								<label data-prop_id="31"><?php echo $entry_csv_text_delimiter; ?></label>
								<div class="f-input">
									<input class="g-1" type="text" name="csv_import[csv_text_delimiter]" value='<?php if ( isset($csv_import['csv_text_delimiter']) ) echo $csv_import['csv_text_delimiter'];else echo '"'; ?>' />
								</div>
							</div> -->
							<div class="f-row">
								<label data-prop_id="9"><?php echo $entry_languages; ?></label>
								<div class="f-input">
									<select class="g-3" name="csv_import[language_id]">
										<?php foreach ($languages as $language) { ?>
										<?php if ( $csv_import['language_id'] == $language['language_id'] ) { ?>
										<option value="<?php echo $language['language_id']; ?>" selected="selected"><?php echo $language['name']; ?></option>
										<?php } else { ?>
										<option value="<?php echo $language['language_id']; ?>"><?php echo $language['name']; ?></option>
										<?php } ?>
										<?php } ?>
									</select>
								</div>
							</div>
							<div class="f-row">
								<label data-prop_id="11"><?php echo $entry_import_mode; ?></label>
								<div class="f-input">
									<select class="g-3" name="csv_import[mode]">
										<option value="2" <?php if ( isset($csv_import['mode']) && $csv_import['mode'] == 2 ) echo 'selected'; ?>> <?php echo $text_import_mode_update; ?></option>
										<option value="3" <?php if ( isset($csv_import['mode']) && $csv_import['mode'] == 3 ) echo 'selected'; ?>> <?php echo $text_import_mode_insert; ?></option>
										<option value="1" <?php if ( isset($csv_import['mode']) && $csv_import['mode'] == 1 ) echo 'selected'; ?>> <?php echo $text_import_mode_both; ?></option>
										<option value="4" <?php if ( isset($csv_import['mode']) && $csv_import['mode'] == 4 ) echo 'selected'; ?>> <?php echo $text_import_mode_supplement; ?></option>
										<option value="10"><?php echo $text_import_mode_delete; ?></option>
									</select>
								</div>
							</div>
							<div class="f-row">
								<label data-prop_id="12"><?php echo $entry_key_field; ?></label>
								<div class="f-input">
									<select class="g-3" name="csv_import[key_field]">
										<?php foreach($csv_import_key_fields as $key => $name) { ?>
										<option value="<?php echo $key; ?>"<?php if ($csv_import['key_field'] == $key)echo ' selected="selected"';?>><?php echo $name;?></option>
										<?php } ?>
									</select>
								</div>
							</div>
							<div class="f-row">
								<label data-prop_id="13"><?php echo $entry_import_id; ?></label>
								<div class="f-input">
									<select class="g-2" name="csv_import[import_id]">
										<?php if (isset($csv_import['import_id']) && $csv_import['import_id'] == 1) { ?>
										<option value="1" selected="selected"><?php echo $text_yes; ?></option>
										<option value="0"><?php echo $text_no; ?></option>
										<?php } else { ?>
										<option value="1"><?php echo $text_yes; ?></option>
										<option value="0" selected="selected"><?php echo $text_no; ?></option>
										<?php } ?>
									</select>
								</div>
							</div>
							<div class="f-row">
								<label data-prop_id="29"><?php echo $entry_import_delimiter_category; ?></label>
								<div class="f-input">
									<select class="g-1" name="csv_import[delimiter_category]">
										<option value="|"<?php if(isset($csv_import['delimiter_category']) && $csv_import['delimiter_category'] == '|'){echo ' selected="selected"';}?>> | </option>
										<option value="/"<?php if(isset($csv_import['delimiter_category']) && $csv_import['delimiter_category'] == '/'){echo ' selected="selected"';}?>> / </option>
										<option value=">"<?php if(isset($csv_import['delimiter_category']) && $csv_import['delimiter_category'] == '>'){echo ' selected="selected"';}?>> &gt; </option>
										<option value=","<?php if(isset($csv_import['delimiter_category']) && $csv_import['delimiter_category'] == ','){echo ' selected="selected"';}?>> , </option>
									</select>
								</div>
							</div>
							<div class="f-row">
								<label data-prop_id="14"><?php echo $entry_import_fill_category; ?></label>
								<div class="f-input">
									<select class="g-2" name="csv_import[fill_category]">
										<?php if (isset($csv_import['fill_category']) && $csv_import['fill_category'] == 1) { ?>
										<option value="1" selected="selected"><?php echo $text_yes; ?></option>
										<option value="0"><?php echo $text_no; ?></option>
										<?php } else { ?>
										<option value="1"><?php echo $text_yes; ?></option>
										<option value="0" selected="selected"><?php echo $text_no; ?></option>
										<?php } ?>
									</select>
								</div>
							</div>
							<div class="f-row">
								<label data-prop_id="15"><?php echo $entry_import_category_top; ?></label>
								<div class="f-input">
									<select class="g-2" name="csv_import[top]">
										<?php if (isset($csv_import['top']) && $csv_import['top'] == 1) { ?>
										<option value="1" selected="selected"><?php echo $text_yes; ?></option>
										<option value="0"><?php echo $text_no; ?></option>
										<?php } else { ?>
										<option value="1"><?php echo $text_yes; ?></option>
										<option value="0" selected="selected"><?php echo $text_no; ?></option>
										<?php } ?>
									</select>
								</div>
							</div>
							<div class="f-row">
								<label data-prop_id="16"><?php echo $entry_import_category_column; ?></label>
								<div class="f-input">
									<input class="g-1 f-text-right" type="text" name="csv_import[column]" value="<?php echo $csv_import['column'];?>" />
								</div>
							</div>
							<div class="f-row">
								<label data-prop_id="17"><?php echo $entry_import_img_download; ?></label>
								<div class="f-input">
									<select class="g-2" name="csv_import[image_download]">
										<?php if (isset($csv_import['image_download']) && $csv_import['image_download'] == 1) { ?>
										<option value="1" selected="selected"><?php echo $text_yes; ?></option>
										<option value="0"><?php echo $text_no; ?></option>
										<?php } else { ?>
										<option value="1"><?php echo $text_yes; ?></option>
										<option value="0" selected="selected"><?php echo $text_no; ?></option>
										<?php } ?>
									</select>
								</div>
							</div>
							<div class="f-row">
								<label><?php echo $entry_import_calc_mode; ?></label>
								<div class="f-input">
									<select class="g-3" name="csv_import[calc_mode]">
										<option value="0" <?php if ( $csv_import['calc_mode'] == 0 ) echo 'selected'; ?>><?php echo $text_import_calc_mode_off; ?></option>
										<option value="1" <?php if ( $csv_import['calc_mode'] == 1 ) echo 'selected'; ?>><?php echo $text_import_calc_mode_multiply; ?></option>
										<option value="2" <?php if ( $csv_import['calc_mode'] == 2 ) echo 'selected'; ?>><?php echo $text_import_calc_mode_divide; ?></option>
										<option value="3" <?php if ( $csv_import['calc_mode'] == 3 ) echo 'selected'; ?>><?php echo $text_import_calc_mode_pluse; ?></option>
										<option value="4" <?php if ( $csv_import['calc_mode'] == 4 ) echo 'selected'; ?>><?php echo $text_import_calc_mode_minus; ?></option>
									</select>
								</div>
							</div>
							<div class="f-row">
								<label data-prop_id="18"><?php echo $entry_import_calc_value; ?></label>
								<div class="f-input">
									<input class="g-1 f-text-right" type="text" name="csv_import[calc_value][]" value="<?php if(isset($csv_import['calc_value'][0]))echo $csv_import['calc_value'][0];?>" size="2"/>
									<input class="g-1 f-text-right" type="text" name="csv_import[calc_value][]" value="<?php if(isset($csv_import['calc_value'][1]))echo $csv_import['calc_value'][1];?>" size="2"/>
								</div>
							</div>
							<div class="f-row">
								<label data-prop_id="19"><?php echo $entry_import_empty_field; ?></label>
								<div class="f-input">
									<select class="g-2" name="csv_import[empty_field]">
										<?php if (isset($csv_import['empty_field']) && $csv_import['empty_field'] == 1) { ?>
										<option value="1" selected="selected"><?php echo $text_yes; ?></option>
										<option value="0"><?php echo $text_no; ?></option>
										<?php } else { ?>
										<option value="1"><?php echo $text_yes; ?></option>
										<option value="0" selected="selected"><?php echo $text_no; ?></option>
										<?php } ?>
									</select>
								</div>
							</div>
							<div class="f-row">
								<label><?php echo $entry_import_product_disable; ?></label>
								<div class="f-input">
									<select class="g-2" name="csv_import[product_disable]">
										<?php if (isset($csv_import['product_disable']) && $csv_import['product_disable'] == 1) { ?>
										<option value="1" selected="selected"><?php echo $text_yes; ?></option>
										<option value="0"><?php echo $text_no; ?></option>
										<?php } else { ?>
										<option value="1"><?php echo $text_yes; ?></option>
										<option value="0" selected="selected"><?php echo $text_no; ?></option>
										<?php } ?>
									</select>
								</div>
							</div>
							<div class="f-row">
								<label data-prop_id="30"><?php echo $entry_import_quantity_reset; ?></label>
								<div class="f-input">
									<select class="g-2" name="csv_import[quantity_reset]">
										<?php if (isset($csv_import['quantity_reset']) && $csv_import['quantity_reset'] == 1) { ?>
										<option value="1" selected="selected"><?php echo $text_yes; ?></option>
										<option value="0"><?php echo $text_no; ?></option>
										<?php } else { ?>
										<option value="1"><?php echo $text_yes; ?></option>
										<option value="0" selected="selected"><?php echo $text_no; ?></option>
										<?php } ?>
									</select>
								</div>
							</div>
							<div class="f-row">
								<label data-prop_id="20"><?php echo $entry_import_iter_limit; ?></label>
								<div class="f-input">
									<input class="g-1 f-text-right" type="text" name="csv_import[iter_limit]" value="<?php echo $csv_import['iter_limit'];?>" />
								</div>
							</div>
							<div class="f-row">
								<label><?php echo $entry_import_file; ?></label>
								<div class="f-input">
									<input type="file" name="import" />
								</div>
							</div>
						</div>
						<!-- end g-6 -->
						<div class="g-6 f-horizontal">
							
							<div class="f-row">
								<input type="hidden" name="csv_import[skip_import_store]" value="0">
								<label><?php echo $entry_store; ?></label>
								<div class="f-input">
									<label data-prop_id="21"><input class="im_checkbox_skip" type="checkbox" value="1" name="csv_import[skip_import_store]" <?php if(isset($csv_import['skip_import_store']) && $csv_import['skip_import_store'] == 1 ) {echo ' checked="checked"';}?> /> <?php echo $text_import_skip; ?></label>
									<div>
									<div class="scrollbox">
										<?php $class = 'even'; ?>
										<?php if (!empty($csv_import['to_store']) && in_array(0, $csv_import['to_store'])) { ?>
										<label class="<?php echo $class; ?>"><input type="checkbox" name="csv_import[to_store][]" value="0" class="product_store" checked="checked" /><?php echo $text_default; ?></label>
										<?php } else { ?>
										<label class="<?php echo $class; ?>"><input type="checkbox" name="csv_import[to_store][]" value="0" class="product_store" /><?php echo $text_default; ?></label>
										<?php } ?>

										<?php foreach ($stores as $store) { ?>
										<?php $class = ($class == 'even' ? 'odd' : 'even'); ?>
										<label class="<?php echo $class; ?>"><input type="checkbox" name="csv_import[to_store][]" value="<?php echo $store['store_id']; ?>" <?if(isset($csv_import['to_store']) && in_array($store['store_id'], $csv_import['to_store'])){echo ' checked="checked"';}?> /> <?php echo $store['name']; ?></label>
										<?php } ?>
									</div>
									<a onclick="$(this).parent().find(':checkbox').prop('checked', true);"><?php echo $text_select_all; ?></a> / <a onclick="$(this).parent().find(':checkbox').prop('checked', false);"><?php echo $text_unselect_all; ?></a>
									</div>
								</div>
								<!-- end f-input -->
							</div>
							<!-- end f-row -->
							
							<div class="f-row">
								<input type="hidden" value="0" name="csv_import[skip_manufacturer]" />
								<label><?php echo $entry_import_manufacturer; ?></label>
								<div class="f-input">
									<label data-prop_id="24"><input class="im_checkbox_skip" type="checkbox" value="1" name="csv_import[skip_manufacturer]" <?php if(isset($csv_import['skip_manufacturer']) && $csv_import['skip_manufacturer'] == 1 ) {echo ' checked="checked"';}?> /> <?php echo $text_import_skip; ?></label>
									<br />
									<select class="g-5" name="csv_import[product_manufacturer]">
										<option value="0" selected="selected"><?php echo $text_none; ?></option>
										<?php foreach ($manufacturers as $manufacturer) { ?>
										<option value="<?php echo $manufacturer['manufacturer_id']; ?>" <?php if(isset($csv_import['product_manufacturer']) && $csv_import['product_manufacturer'] == $manufacturer['manufacturer_id'] ){echo ' selected="selected"';}?>><?php echo $manufacturer['name']; ?></option>
										<?php } ?>
									</select>
								</div>
							</div>
							<?php if($core_type['MAIN_CATEGORY']) {?>
							<div class="f-row">
								<input type="hidden" value="0" name="csv_import[skip_main_category]">
								<label><?php echo $entry_import_main_category; ?></label>
								<div class="f-input">
									<label data-prop_id="22"><input class="im_checkbox_skip" type="checkbox" value="1" name="csv_import[skip_main_category]" <?php if(isset($csv_import['skip_main_category']) && $csv_import['skip_main_category'] == 1 ) {echo ' checked="checked"';}?> /> <?php echo $text_import_skip; ?></label>
									<br />
									<select class="g-5" name="csv_import[main_category_id]">
										<option value="0" selected="selected"><?php echo $text_none; ?></option>
										<?php foreach ($categories as $category) { ?>
										<option value="<?php echo $category['category_id']; ?>" <?php if(isset($csv_import['main_category_id']) && $csv_import['main_category_id'] == $category['category_id'] ){echo ' selected="selected"';}?>><?php echo $category['name']; ?></option>
										<?php } ?>
									</select>
								</div>
							</div>
							<?php } ?>
							<div class="f-row">
								<input type="hidden" value="0" name="csv_import[skip_category]">
								<label><?php echo $entry_import_category; ?></label>
								<div class="f-input">
									<label data-prop_id="23"><input class="im_checkbox_skip" type="checkbox" value="1" name="csv_import[skip_category]" <?php if(isset($csv_import['skip_category']) && $csv_import['skip_category'] == 1 ) {echo ' checked="checked"';}?> /> <?php echo $text_import_skip; ?></label>
									<input type="hidden" value="0" name="csv_import[product_category]" />
									<div id="import_product_category">
									<div class="scrollbox">
										<?php $class = 'odd'; ?>
										<?php foreach ($categories as $category) { ?>
										<?php $class = ($class == 'even' ? 'odd' : 'even'); ?>
										<label class="<?php echo $class; ?>">
											<span>
												<input class="in_checkbox_01" type="checkbox" name="csv_import[product_category][]" value="<?php echo $category['category_id']; ?>" <?php if(isset($csv_import['product_category']) && is_array($csv_import['product_category']) && in_array($category['category_id'], $csv_import['product_category']) ) echo ' checked="checked"'; ?> /> <?php echo $category['name']; ?>
											</span>
										</label>
										<?php } ?>
									</div>
									<a onclick="$(this).parent().find(':checkbox').prop('checked', true);"><?php echo $text_select_all; ?></a> / <a onclick="$(this).parent().find(':checkbox').prop('checked', false);"><?php echo $text_unselect_all; ?></a>
									/ <a class="show_scroll"><?php echo $text_select;?></a>
									</div>
								</div>
							</div>
							<div class="f-row">
								<label data-prop_id="25"><?php echo $entry_import_image_path; ?></label>
								<div class="f-input">
									<input class="g-5" type="text" name="csv_import[img_path]" value="<?php if(isset($csv_import['img_path'])) { echo $csv_import['img_path']; } ?>" />
								</div>
							</div>
							<div class="f-row">
								<input type="hidden" value="0" name="csv_import[exclude_filter]" />
								<div class="f-input">
								<label data-prop_id="26"><input type="checkbox" name="csv_import[exclude_filter]" value="1" <?php if(isset($csv_import['exclude_filter']) && $csv_import['exclude_filter'] == 1 ) echo ' checked="checked"'; ?> /><?php echo $entry_import_exclude_filter; ?></label>
								</div>
							</div>
							<div class="f-row">
								<label><?php echo $entry_import_exclude_filter_name; ?></label>
								<div class="f-input">
									<input class="g-5" type="text" name="csv_import[exclude_filter_name]" value="<?php if(isset($csv_import['exclude_filter_name'])) echo $csv_import['exclude_filter_name']; ?>" />
								</div>
							</div>
							<div class="f-row">
								<label><?php echo $entry_import_exclude_filter_desc; ?></label>
								<div class="f-input">
									<input class="g-5" type="text" name="csv_import[exclude_filter_desc]" value="<?php if(isset($csv_import['exclude_filter_desc'])) echo $csv_import['exclude_filter_desc']; ?>" />
								</div>
							</div>
							<div class="f-row">
								<label><?php echo $entry_import_exclude_filter_attr; ?></label>
								<div class="f-input">
									<input class="g-5" type="text" name="csv_import[exclude_filter_attr]" value="<?php if(isset($csv_import['exclude_filter_attr'])) echo $csv_import['exclude_filter_attr']; ?>" />
								</div>
							</div>
						</div>
						<!-- end g-6 -->
					</div>
				</form>
				<div class="g-row">
					<div class="f-row"></div>
					<div class="f-row f-actions-left"><a onclick="$('#form_product_import').submit();" class="f-bu f-bu-default g-2"><?php echo $button_import;?></a></div>
				</div>
			</div>
			<!-- end tab_import -->
			<div id="tab_macros" class="tab-pane fade">
				<div class="f-row">
					<form action="<?php echo $action;?>" method="post" id="form_macros" enctype="multipart/form-data">
						<input type="hidden" name="form_macros_status" value="1" />
						<table id="table-custom-fields" class="f-table-zebra">
							<thead>
								<tr>
									<th><?php echo $entry_table; ?></th>
									<th><?php echo $entry_field_name; ?></th>
									<th><?php echo $entry_csv_name; ?></th>
									<th><?php echo $entry_caption; ?></th>
									<th>&nbsp;</th>
								</tr>
							</thead>
							<?php $field_row = 0; ?>
							<tbody>
								<?php if(!empty($product_macros)) { ?>
								<?php foreach ($product_macros as $fields) { ?>
								<tr id="custom-fields-row<?php echo $field_row; ?>">
									<td class="f-text-left"><input type="hidden" name="product_macros[<?php echo $field_row; ?>][tbl_name]" value="<?php echo $fields['tbl_name']; ?>" size="1" /><?php echo $fields['tbl_name']; ?></td>
									<td class="f-text-left"><input type="hidden" name="product_macros[<?php echo $field_row; ?>][field_name]" value="<?php echo $fields['field_name']; ?>" size="1" /><?php echo $fields['field_name']; ?></td>
									<td class="f-text-left"><input type="hidden" name="product_macros[<?php echo $field_row; ?>][csv_name]" value="<?php echo $fields['csv_name']; ?>" size="1" /><?php echo $fields['csv_name']; ?></td>
									<td class="f-text-left"><input type="hidden" name="product_macros[<?php echo $field_row; ?>][csv_caption]" value="<?php echo $fields['csv_caption']; ?>" size="1" /><?php echo $fields['csv_caption']; ?></td>
									<td class="f-text-center"><a onclick="$('#custom-fields-row<?php echo $field_row; ?>').remove();" class="f-bu"><?php echo $button_remove; ?></a></td>
								</tr>
								<?php $field_row++; ?>
								<?php } ?>
							</tbody>
							<tfoot></tfoot>
							<?php } else { ?>
							<tfoot>
								<tr>
									<td colspan="5"><?php echo $text_no_results; ?></td>
								</tr>
							</tfoot>
							<?php } ?>
						</table>
					</form>
				</div>
				<div class="f-row">
					<label><?php echo $entry_table; ?>:</label>
					<div class="f-input">
						<select id="tbl_name" class="g-3" onchange="loadFields();">
							<?php foreach ($db_table as $table_name) {?>
							<option value="<?php echo DB_PREFIX;?><?php echo $table_name;?>"><?php echo DB_PREFIX;?><?php echo $table_name;?></option>
							<?php } ?>
						</select>
					</div>
				</div>
				<div class="f-row">
					<label><?php echo $entry_field_name; ?>:</label>
					<div class="f-input">
						<select id="custom_fields"  class="g-3"  onchange="selectFieldName();"></select>
					</div>
				</div>
				<div class="f-row">
					<label><?php echo $entry_csv_name; ?>:</label>
					<div class="f-input">
						<input class="g-3" type="text" id="csv_name" value="" />
					</div>
				</div>
				<div class="f-row">
					<label><?php echo $entry_caption; ?>:</label>
					<div class="f-input">
						<input class="g-3" type="text" id="csv_caption" value="" />
					</div>
				</div>
				<div class="f-row">
					<label></label>
					<div class="f-input">
						<a onclick="addFieldRow();" class="f-bu"><?php echo $button_insert; ?></a>
					</div>
				</div>
				<div class="f-row"></div>
				<div class="f-row f-actions-left"><a onclick="$('#form_macros').submit();" class="f-bu f-bu-default g-2"><?php echo $button_save; ?></a></div>
			</div>
			<!-- end tab_macros -->
			</div>
		</div>
	</div>
	<?php echo $app_footer; ?>
	</div>
</div>
<script type="text/javascript"><!--
	var prop_descr=new Array();
	<?php if(isset($prop_descr)){echo $prop_descr;}?>

	function resetFormMacros(){
	    $('#csv_name').val('');
	    $('#csv_caption').val('');
	}
	function loadFields() {
		var table_index = {}
		<?php $i = 0; foreach ($db_table as $table_name) {?>
			table_index['<?php echo DB_PREFIX . $table_name; ?>'] = <?php echo $i;?>;
		<?php $i++; } ?>
		var table = <?php echo $db_table_fields;?>;
		var data = table[table_index[$('#tbl_name option:selected').val()]];
	    
	    $('#custom_fields').get(0).options.length = 0;
	           $('#custom_fields').get(0).options[0] = new Option(" <?php echo $text_none; ?> ", "-1");
	           $.each(data, function(index,text) {
	               $("#custom_fields").get(0).options[$("#custom_fields").get(0).options.length] = new Option(text,text);
	           });
	    resetFormMacros();
	    return false;
	}
	function selectFieldName(){
	   $('#csv_name').val('');
	   $('#csv_caption').val('');
	   
	   var field_name = $('#custom_fields option:selected').val();
	   if( field_name != -1 ) {
	       field_name = '_CUSTOM_' + field_name.toString().toUpperCase() + '_';
	       $('#csv_name').val(field_name);
	       $('#csv_caption').focus();
	   }
	}
	
	var field_row = <?php echo $field_row; ?>;
	
	function deleteFieldRow(obj) {
	   $('#custom-fields-row' + obj).remove();
	}
	
	function addFieldRow() {
	       var tbl_name = $('#tbl_name option:selected').val();
	       var field_name = $('#custom_fields option:selected').val();
	       var csv_name = $('#csv_name').val();
	       var csv_caption = $('#csv_caption').val();
	       
	       if( field_name == -1 || csv_name == '' || csv_caption == '' ) {
	               return;
	       }
	       var html  = '<tr id="custom-fields-row' + field_row + '">';
	       html += '    <td class="left"><input type="hidden" name="product_macros[' + field_row + '][tbl_name]" value="' + tbl_name + '" size="1" />' + tbl_name + '</td>';
	       html += '    <td class="left"><input type="hidden" name="product_macros[' + field_row + '][field_name]" value="' + field_name + '" size="1" />' + field_name + '</td>';
	       html += '    <td class="left"><input type="hidden" name="product_macros[' + field_row + '][csv_name]" value="' + csv_name + '" size="1" />' + csv_name + '</td>';
	       html += '    <td class="left"><input type="hidden" name="product_macros[' + field_row + '][csv_caption]" value="' + csv_caption + '" size="1" />' + csv_caption + '</td>';
	       html += '    <td class="center"><a onclick="deleteFieldRow(' + field_row+ ');" class="f-bu"><?php echo $button_remove; ?></a></td>';
	       html += '  </tr>';
	       $('#table-custom-fields tbody').append(html);
	      if (field_row < 1) {
	           $('#table-custom-fields tfoot').html('');
	      }
	       resetFormMacros();
	       $('#tbl_name option').change();
	       field_row++;
	}
	function setBackgroundColor(o) {
		    var row = '#row_' + o.attr('id') + ' td';
		    if(o.prop('checked')){
		        $(row).addClass('selected');
		    } else {
		        $(row).removeClass('selected');
		    }
		}
	function initFieldsSet() {
		    $('.field_id').prop('checked', true);
		    $('.f-field-set input[type=checkbox]').each(function() {
		        setBackgroundColor($(this));
		    });
		}
	// Document Ready
	jQuery(document).ready(function ($) {
		$('.f-tabs').hide();
		$('ul.f-nav-tabs li').removeClass('active');
		$("#link_<?php echo $tab_selected; ?>").parent().addClass('active');
		$("#<?php echo $tab_selected; ?>").removeClass('fade').addClass('active');
		initFieldsSet();
		$('.f-field-set input[type=checkbox]').change(function(){
		    setBackgroundColor($(this));
		});
		loadFields();
	});
	function f_product_filter() {
		if($('#w_product_filter').val() == 1) {
			$('#wrap_product_filter').show();
		} else {
			$('#wrap_product_filter').hide();
		}
	}
	function GetProfile(key, id) {
		var url = '<?php echo $action_get_profile; ?>' + '&key=' + key;
		url = url.replace( /\&amp;/g, '&' );
		var obj = $('#' + key + '_select');
		$.ajax({
		       type:'POST',
		       url: url,
		       dataType:'json',
		       success:function(json){
		           obj.get(0).options.length = 0;
		           $.each(json, function(i,item) {
		               obj.get(0).options[obj.get(0).options.length] = new Option(item.name, item.id);
		           });
		           if (id) {
		           	$('#' + key + '_select option[value="' + id + '"]').attr("selected", "selected");
		           }
		       },
		       error:function(){
		       	alert("Failed to load profiles!");
		       }
		});
	}
	
	function DeleteProfile(key) {
		if (!confirm('<?php echo $text_confirm_delete;?>')) return false;
		var url = '<?php echo $action_del_profile;?>';
		url = url.replace( /\&amp;/g, '&' );
		var s = '#' + key + '_select';
		if($(s).get(0).options.length == 0) {
			return;
		}
		var id = $( s +' option:selected').val();
		$.ajax({
			type: "POST",
			url: url,
			data: {profile_id: id},
			success: function(data){GetProfile(key);}
		});
		return false;
	}
	function LoadProfile(key) {
		var s = '#' + key + '_select';
		if($(s).get(0).options.length == 0) {
			return;
		}
		var url = '<?php echo $action;?>&profile_id=' + $( '#' + key + '_select' + ' option:selected').val();
		url = url.replace( /\&amp;/g, '&' );
		window.location.href = url;
	
	}

	function CreateProfile(key) {
		var url = '<?php echo $action_add_profile;?>';
		url = url.replace( /\&amp;/g, '&' );
		
		if($('#' + key + '_name').val() == '') return false;
		var data;
		
		if( key == 'profile_import' ){
			data = $("#form_product_import, #form_product_setting, #form_profile_import").serialize();
		} else if( key == 'profile_export' ){
			data = $("#form_product_export, #form_profile_export").serialize();
		} else {
			return false;
		}

		$.ajax({
			type: "POST",
			url: url,
			data: data,
			datatype: 'json',
			success: function(json){
				//alert('<?php echo $text_profile_created; ?> ');
				$('#' + key + '_name').val('');
				var obj = jQuery.parseJSON(json);
				GetProfile(key, obj.id);
			}
		});
		return false;
	}
	function UpdateProfile(key) {
		var url = '<?php echo $action_edit_profile;?>',data;
		url = url.replace( /\&amp;/g, '&' );

		if( key == 'profile_import' ){
			data = $("#form_product_import, #form_product_setting, #form_profile_import").serialize();
		} else if( key == 'profile_export' ){
			data = $("#form_product_export, #form_profile_export").serialize();
		} else {
			return false;
		}

		$.ajax({
			type: "POST",
			url: url,
			data: data,
			datatype: 'json',
			success: function(json){
				$('#' + key + '_name').val('');
				var obj = jQuery.parseJSON(json);
				LoadProfile(key);
			}
		});
		return false;
	}
	jQuery(document).ready(function ($) {
		GetProfile('profile_import', <?php echo isset($profile_id) ? $profile_id: 0;?>);
		GetProfile('profile_export', <?php echo isset($profile_id) ? $profile_id: 0;?>);
		f_product_filter();
	});
//--></script>
<?php echo $footer; ?>