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
					<li class="active"><a href="#tab_export" data-toggle="tab" id="link_tab_export"><?php echo $tab_export; ?></a></li>
					<li><a href="#tab_import" data-toggle="tab" id="link_tab_import"><?php echo $tab_import; ?></a></li>
					<li><a href="#tab_macros" data-toggle="tab" id="link_tab_macros"><?php echo $tab_macros; ?></a></li>
				</ul>
				<div class="tab-content">
					<div id="tab_export" class="tab-pane fade">
						<form action="<?php echo $action_export; ?>" method="post" id="form_category_export" enctype="multipart/form-data">
							<div class="g-row">
								<div class="g-7">
									<div class="f-row">
										<label data-prop_id="0"><?php echo $entry_file_encoding; ?></label>
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
										<label data-prop_id="1"><?php echo $entry_csv_delimiter; ?></label>
										<div class="f-input">
											<select name="csv_export[csv_delimiter]" class="g-1">
												<option value=";" <?php if ( isset($csv_export['csv_delimiter']) && $csv_export['csv_delimiter'] == ';' ) echo 'selected'; ?>> ; </option>
												<option value="," <?php if ( isset($csv_export['csv_delimiter']) && $csv_export['csv_delimiter'] == ',' ) echo 'selected'; ?>> , </option>
											</select>
										</div>
									</div>
									<!-- <div class="f-row">
										<label data-prop_id="11"><?php echo $entry_csv_text_delimiter; ?></label>
										<div class="f-input">
											<input class="g-1" type="text" name="csv_export[csv_text_delimiter]" value='<?php if ( isset($csv_export['csv_text_delimiter']) ) echo $csv_export['csv_text_delimiter'];else echo '"'; ?>' />
										</div>
									</div> -->
									<div class="f-row">
										<label data-prop_id="2"><?php echo $entry_languages; ?></label>
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
										<label><?php echo $entry_store; ?></label>
										<div class="f-input">
											<div class="scrollbox">
												<?php $class = 'even'; ?>
												<div>
													<?php if (!empty($csv_export['from_store']) && in_array(0, $csv_export['from_store'])) { ?>
													<label><input type="checkbox" name="csv_export[from_store][]" value="0" checked="checked" />
													<?php echo $text_default; ?></label>
													<?php } else { ?>
													<label><input type="checkbox" name="csv_export[from_store][]" value="0" />
													<?php echo $text_default; ?></label>
													<?php } ?>
												</div>
												<?php foreach ($stores as $store) { ?>
												<?php $class = ($class == 'even' ? 'odd' : 'even'); ?>
												<div class="<?php echo $class; ?>">
													<?php if (is_array($csv_export['from_store']) && in_array($store['store_id'], $csv_export['from_store'])) { ?>
													<label><input type="checkbox" name="csv_export[from_store][]" value="<?php echo $store['store_id']; ?>" checked="checked" />
													<?php echo $store['name']; ?></label>
													<?php } else { ?>
													<label><input type="checkbox" name="csv_export[from_store][]" value="<?php echo $store['store_id']; ?>" />
													<?php echo $store['name']; ?></label>
													<?php } ?>
												</div>
												<?php } ?>
											</div>
											<a onclick="$(this).parent().find(':checkbox').prop('checked', true);"><?php echo $text_select_all; ?></a> / <a onclick="$(this).parent().find(':checkbox').prop('checked', false);"><?php echo $text_unselect_all; ?></a>
										</div>
										<!-- end f-input -->
									</div>
									<!-- end f-row -->
									<div class="f-row">
										<label data-prop_id="3"><?php echo $entry_category; ?></label>
										<div class="f-input">
											<input type="hidden" name="csv_export[from_category]" value="0" />
											<div id="export_from_category">
											<div class="scrollbox">
												<?php $class = 'odd'; ?>
												<?php foreach ($categories as $category) { ?>
												<?php $class = ($class == 'even' ? 'odd' : 'even'); ?>
												<label class="<?php echo $class; ?>">
													<span>
														<input type="checkbox" name="csv_export[from_category][]" <?php if ( isset($csv_export['from_category']) && is_array($csv_export['from_category']) && in_array($category['category_id'], $csv_export['from_category'])) { echo ' checked="checked"';} ?> value="<?php echo $category['category_id']; ?>" />
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
									<div class="clearfix"></div>
									<div class="f-row">
										<label data-prop_id="4"><?php echo $entry_category_delimiter; ?></label>
										<div class="f-input">
											<select class="g-1" name="csv_export[delimiter_category]">
												<option value="|"<?php if(isset($csv_export['delimiter_category']) && $csv_export['delimiter_category'] == '|'){echo ' selected="selected"';}?>> | </option>
												<option value="/"<?php if(isset($csv_export['delimiter_category']) && $csv_export['delimiter_category'] == '/'){echo ' selected="selected"';}?>> / </option>
												<option value=","<?php if(isset($csv_export['delimiter_category']) && $csv_export['delimiter_category'] == ','){echo ' selected="selected"';}?>> , </option>
											</select>
										</div>
									</div>
									<div class="clearfix"></div>
									<div class="f-row">
										<label data-prop_id="5"><?php echo $entry_category_parent; ?></label>
										<div class="f-input">
											<select class="g-2" name="csv_export[category_parent]">
												<option value="0"<?php if (!isset($csv_export['category_parent']) || $csv_export['category_parent'] == 0) { echo '  selected="selected"'; }?>><?php echo $text_disabled; ?></option>
												<option value="1"<?php if ( isset($csv_export['category_parent']) && $csv_export['category_parent'] == 1 ) { echo '  selected="selected"'; }?>><?php echo $text_enabled; ?></option>
											</select>
										</div>
									</div>
									<div class="clearfix"></div>
									<div class="f-row">
										<label data-prop_id="32"><?php echo $entry_image_url; ?></label>
										<div class="f-input">
											<select class="g-2" name="csv_export[image_url]">
												<option value="1"<?php if ( isset($csv_export['image_url']) && $csv_export['image_url'] == 1 ) { echo '  selected="selected"'; }?>><?php echo $text_enabled; ?></option>
												<option value="0"<?php if ( !isset($csv_export['image_url']) || $csv_export['image_url'] == 0 ) { echo '  selected="selected"'; }?>><?php echo $text_disabled; ?></option>
											</select>
										</div>
									</div>
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
						<div class="f-row f-actions-left"><a onclick="$('#form_category_export').submit();" class="f-bu f-bu-default g-2"><?php echo $button_export;?></a></div>
					</div>
					<!-- end tab_export -->
					<div id="tab_import" class="tab-pane fade">
						<form action="<?php echo $action_import; ?>" method="post" id="form_category_import" enctype="multipart/form-data">
							<div class="g-row">
								<div class="g-12 f-form">
									<div class="f-row">
										<label data-prop_id="0"><?php echo $entry_file_encoding; ?></label>
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
										<label data-prop_id="1"><?php echo $entry_csv_delimiter; ?></label>
										<div class="f-input">
											<select name="csv_import[csv_delimiter]" class="g-1">
												<option value=";" <?php if ( isset($csv_import['csv_delimiter']) && $csv_import['csv_delimiter'] == ';' ) echo 'selected'; ?>> ; </option>
												<option value="," <?php if ( isset($csv_import['csv_delimiter']) && $csv_import['csv_delimiter'] == ',' ) echo 'selected'; ?>> , </option>
											</select>
										</div>
									</div>
									<!-- <div class="f-row">
										<label data-prop_id="11"><?php echo $entry_csv_text_delimiter; ?></label>
										<div class="f-input">
											<input class="g-1" type="text" name="csv_import[csv_text_delimiter]" value='<?php if ( isset($csv_import['csv_text_delimiter']) ) echo $csv_import['csv_text_delimiter'];else echo '"'; ?>' />
										</div>
									</div> -->
									<div class="f-row">
										<label data-prop_id="6"><?php echo $entry_languages; ?></label>
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
										<label data-prop_id="7"><?php echo $entry_import_mode; ?></label>
										<div class="f-input">
											<select class="g-3" name="csv_import[mode]">
												<option value="2" <?php if ( $csv_import['mode'] == 2 ) echo 'selected'; ?>><?php echo $text_import_mode_update; ?></option>
												<option value="3" <?php if ( $csv_import['mode'] == 3 ) echo 'selected'; ?>><?php echo $text_import_mode_insert; ?></option>
												<option value="1" <?php if ( $csv_import['mode'] == 1 ) echo 'selected'; ?>><?php echo $text_import_mode_both; ?></option>
											</select>
										</div>
									</div>
									<div class="f-row">
										<label data-prop_id="8"><?php echo $entry_key_field; ?></label>
										<div class="f-input">
											<select class="g-2" name="csv_import[key_field]">
												<?php foreach($csv_import_key_fields as $key => $name) { ?>
												<option value="<?php echo $key; ?>"<?php if ($csv_import['key_field'] == $key)echo ' selected="selected"';?>><?php echo $name;?></option>
												<?php } ?>
											</select>
										</div>
									</div>
									<div class="f-row">
										<label data-prop_id="9"><?php echo $entry_category_delimiter; ?></label>
										<div class="f-input">
											<select class="g-1" name="csv_import[delimiter_category]">
												<option value="|"<?php if(isset($csv_import['delimiter_category']) && $csv_import['delimiter_category'] == '|'){echo ' selected="selected"';}?>> | </option>
												<option value="/"<?php if(isset($csv_import['delimiter_category']) && $csv_import['delimiter_category'] == '/'){echo ' selected="selected"';}?>> / </option>
												<option value=","<?php if(isset($csv_import['delimiter_category']) && $csv_import['delimiter_category'] == ','){echo ' selected="selected"';}?>> , </option>
											</select>
										</div>
									</div>
									<div class="f-row">
										<label><?php echo $entry_store; ?></label>
										<div class="f-input">
											<div class="scrollbox" style="width: 320px;">
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
									<div class="f-row">
										<label><?php echo $entry_sort_order; ?></label>
										<div class="f-input">
											<input class="g-1 f-text-right" type="text" name="csv_import[sort_order]" value="<?php if(isset($csv_import['sort_order']))echo $csv_import['sort_order'];?>" />
										</div>
									</div>
									<div class="f-row">
										<label><?php echo $entry_status; ?></label>
										<div class="f-input">
											<select class="g-2" name="csv_import[status]">
												<?php if ($csv_import['status']) { ?>
												<option value="1" selected="selected"><?php echo $text_enabled; ?></option>
												<option value="0"><?php echo $text_disabled; ?></option>
												<?php } else { ?>
												<option value="1"><?php echo $text_enabled; ?></option>
												<option value="0" selected="selected"><?php echo $text_disabled; ?></option>
												<?php } ?>
											</select>
										</div>
									</div>
									<div class="f-row">
										<label><?php echo $entry_import_category_disable; ?></label>
										<div class="f-input">
											<select class="g-2" name="csv_import[category_disable]">
												<?php if (isset($csv_import['catgeory_disable']) && $csv_import['category_disable'] == 1) { ?>
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
										<label data-prop_id="10"><?php echo $entry_import_img_download; ?></label>
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
									<div class="f-row"></div>
									<div class="f-row">
										<label><?php echo $entry_import_file; ?></label>
										<div class="f-input">
											<input  type="file" name="import" />
										</div>
									</div>
								</div>
								<!-- end g-12 -->
							</div>
						</form>
						<div class="g-row"></div>
						<div class="g-row">
							<div class="f-row f-actions-left"><a onclick="$('#form_category_import').submit();" class="f-bu f-bu-default g-2"><?php echo $button_import;?></a></div>
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
										<?php if(!empty($category_macros)) { ?>
										<?php foreach ($category_macros as $fields) { ?>
										<tr id="custom-fields-row<?php echo $field_row; ?>">
											<td class="f-text-left"><input type="hidden" name="category_macros[<?php echo $field_row; ?>][tbl_name]" value="<?php echo $fields['tbl_name']; ?>" size="1" /><?php echo $fields['tbl_name']; ?></td>
											<td class="f-text-left"><input type="hidden" name="category_macros[<?php echo $field_row; ?>][field_name]" value="<?php echo $fields['field_name']; ?>" size="1" /><?php echo $fields['field_name']; ?></td>
											<td class="f-text-left"><input type="hidden" name="category_macros[<?php echo $field_row; ?>][csv_name]" value="<?php echo $fields['csv_name']; ?>" size="1" /><?php echo $fields['csv_name']; ?></td>
											<td class="f-text-left"><input type="hidden" name="category_macros[<?php echo $field_row; ?>][csv_caption]" value="<?php echo $fields['csv_caption']; ?>" size="1" /><?php echo $fields['csv_caption']; ?></td>
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
						<div class="f-row f-actions-left"><a onclick="$('#form_macros').submit();" class="f-bu f-bu-default g-2"><?php echo $button_save; ?></a></div>
					</div>
					<!-- end tab_macros -->
				</div>
			</div>
		</div>
	</div>
	<?php echo $app_footer; ?>
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
	       html += '    <td class="left"><input type="hidden" name="category_macros[' + field_row + '][tbl_name]" value="' + tbl_name + '" size="1" />' + tbl_name + '</td>';
	       html += '    <td class="left"><input type="hidden" name="category_macros[' + field_row + '][field_name]" value="' + field_name + '" size="1" />' + field_name + '</td>';
	       html += '    <td class="left"><input type="hidden" name="category_macros[' + field_row + '][csv_name]" value="' + csv_name + '" size="1" />' + csv_name + '</td>';
	       html += '    <td class="left"><input type="hidden" name="category_macros[' + field_row + '][csv_caption]" value="' + csv_caption + '" size="1" />' + csv_caption + '</td>';
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
	function setBackgroundColor(obj) {
		    var row = '#row_' + $(obj).attr('id') + ' td';
		    if($(obj).prop('checked')){
		        $(row).addClass('selected');
		    } else {
		        $(row).removeClass('selected');
		    }
		}
	function initFieldsSet() {
		    $('.field_id').prop('checked', true);
		    $('.f-field-set input[type=checkbox]').each(function() {
		        setBackgroundColor(this);
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
		    setBackgroundColor(this);
		});
		loadFields();
	});
	//--></script>
<?php echo $footer; ?>