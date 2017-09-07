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
				</ul>
				<div class="tab-content">
					<div id="tab_setting" class="tab-pane fade">
						<form action="<?php echo $action; ?>" method="post" id="form_settingt" enctype="multipart/form-data" class="ocl-ui-form-horizontal">
							<div class="g-row">
								<div class="f-row">
									<label><?php echo $entry_file_encoding; ?></label>
									<div class="f-input">
										<select name="csv_setting[file_encoding]" class="g-3">
											<?php if (isset($charsets) && !empty($charsets)) { ?>
											<?php foreach ($charsets as $key => $val) { ?>
											<?php if ( $csv_setting['file_encoding'] == $key ) { ?>
											<option value="<?php echo $key;?>" selected="selected"><?php echo $val;?></option>
											<?php } else { ?>
											<option value="<?php echo $key;?>"><?php echo $val;?></option>
											<?php } ?>
											<?php } ?>
											<?php } else { ?>
											<option value="UTF-8" <?php if ( $csv_setting['file_encoding'] == 'UTF-8' ) echo 'selected'; ?>>UTF-8</option>
											<option value="WINDOWS-1251" <?php if ( $csv_setting['file_encoding'] == 'WINDOWS-1251' ) echo 'selected'; ?>>Windows-1251</option>
											<?php } ?>
										</select>
									</div>
									<!-- end f-input -->
								</div>
								<!-- end f-row -->
								<div class="f-row">
									<label><?php echo $entry_csv_delimiter; ?></label>
									<div class="f-input">
										<select class="g-1" name="csv_setting[delimiter]">
											<option value=";"<?php if($csv_setting['delimiter'] == ';'){echo ' selected="selected"';}?>> ; </option>
											<option value=","<?php if($csv_setting['delimiter'] == ','){echo ' selected="selected"';}?>> , </option>
											<option value="|"<?php if($csv_setting['delimiter'] == '|'){echo ' selected="selected"';}?>> | </option>
										</select>
									</div>
									<!-- end f-input -->
								</div>
								<!-- end f-row -->
								<div class="f-row">
									<label><?php echo $entry_include_csv_title; ?></label>
									<div class="f-input">
										<select class="g-2" name="csv_setting[csv_title]">
											<?php if (isset($csv_setting['csv_title']) && $csv_setting['csv_title'] == 1) { ?>
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
								<div style="margin-top: 20px;margin-bottom: 10px;"><a onclick="$('.f-field-set').find(':checkbox:not(:checked)').parent().parent().parent().hide();"><?php echo $text_hide_all; ?></a> / <a onclick="$('.f-field-set').find('tr').show();"><?php echo $text_show_all; ?></a></div>
								<table class="f-field-set g-7">
									<tbody class="f-ui-sortable">
										<?php $id = 1; foreach( $csv_setting['fields_set'] as $key => $value ) { ?>
										<tr id="row_<?php echo $id; ?>">
											<td><span class="ui-icon ui-icon-arrowthick-2-n-s"></span></td>
											<td>
												<input type="hidden" name="csv_setting[fields_set][<?php echo $key; ?>][status]" value="0">
												<label><input id="<?php echo $id++;?>" <?php if ($value['status']) echo 'checked="checked"';?> type="checkbox" name="csv_setting[fields_set][<?php echo $key; ?>][status]" value="1"> <?php echo $fields_set_help[$key]; ?></label>
											</td>
											<td><input class="g-3" type="text" name="csv_setting[fields_set][<?php echo $key; ?>][caption]" value="<?php echo $csv_setting['fields_set'][$key]['caption']; ?>"></td>
										</tr>
										<?php } ?>
									</tbody>
								</table>
								<div style="margin-bottom: 20px;">
									<a onclick="$('.f-field-set').find(':checkbox').prop('checked', true);initFieldsSet();"><?php echo $text_select_all; ?></a> / <a onclick="$('.f-field-set').find(':checkbox').prop('checked', false);initFieldsSet();"><?php echo $text_unselect_all; ?></a>
								</div>
							</div>
						</form>
						<!-- end g-row -->
						<div class="f-row"></div>
						<div class="f-row f-actions-left"><a onclick="$('#form_settingt').submit();" class="f-bu f-bu-default g-2"><?php echo $button_save;?></a></div>
					</div>
					<div id="tab_export" class="tab-pane fade">
						<form action="<?php echo $action_export; ?>" method="post" id="form_export" enctype="multipart/form-data" class="ocl-ui-form-horizontal">
							<div class="g-row">
								<div class="f-row">
									<label><?php echo $entry_order_id; ?></label>
									<div class="f-input">
										<input class="g-2" type="text" name="filter_order_id" value="<?php echo $filter_order_id; ?>" size="4" style="text-align: right;" />
									</div>
									<!-- end f-input -->
								</div>
								<!-- end f-row -->
								<div class="f-row">
									<label><?php echo $entry_customer; ?></label>
									<div class="f-input">
										<input class="g-3" type="text" name="filter_customer" value="" />
									</div>
									<!-- end f-input -->
								</div>
								<!-- end f-row -->
								<div class="f-row">
									<label><?php echo $entry_order_status; ?></label>
									<div class="f-input">
										<select  class="g-3" name="filter_order_status_id">
											<option value="*"></option>
											<?php if ($filter_order_status_id == '0') { ?>
											<option value="0" selected="selected"><?php echo $text_missing; ?></option>
											<?php } else { ?>
											<option value="0"><?php echo $text_missing; ?></option>
											<?php } ?>
											<?php foreach ($order_statuses as $order_status) { ?>
											<?php if ($order_status['order_status_id'] == $filter_order_status_id) { ?>
											<option value="<?php echo $order_status['order_status_id']; ?>" selected="selected"><?php echo $order_status['name']; ?></option>
											<?php } else { ?>
											<option value="<?php echo $order_status['order_status_id']; ?>"><?php echo $order_status['name']; ?></option>
											<?php } ?>
											<?php } ?>
										</select>
									</div>
									<!-- end f-input -->
								</div>
								<!-- end f-row -->
								<div class="f-row">
									<label><?php echo $entry_date_added; ?></label>
									<div class="f-input">
										<input type="text" name="filter_date_added_start" value="<?php echo $filter_date_added_start; ?>" class="datetime g-2" />
										-
										<input type="text" name="filter_date_added_end" value="<?php echo $filter_date_added_end; ?>" class="datetime g-2" />
									</div>
									<!-- end f-input -->
								</div>
								<!-- end f-row -->
								<div class="f-row">
									<label><?php echo $entry_date_modified; ?></label>
									<div class="f-input">
										<input type="text" name="filter_date_modified_start" value="<?php echo $filter_date_modified_start; ?>" class="datetime g-2" />
										-
										<input type="text" name="filter_date_modified_end" value="<?php echo $filter_date_modified_end; ?>" class="datetime g-2" />
									</div>
									<!-- end f-input -->
								</div>
								<!-- end f-row -->
								<div class="f-row">
									<label><?php echo $entry_total_sum; ?></label>
									<div class="f-input">
										<select class="g-1" name="filter_total_prefix">
											<option value="1"> = </option>
											<option value="2"> >= </option>
											<option value="3"> <= </option>
											<option value="4"> <> </option>
										</select>
										<input class="g-2" type="text" name="filter_total_sum" value="<?php echo $filter_total_sum; ?>" style="text-align: right;" />
									</div>
									<!-- end f-input -->
								</div>
								<!-- end f-row -->
							</div>
						</form>
						<!-- end g-row -->
						<div class="f-row"></div>
						<div class="f-row f-actions-left"><a onclick="$('#form_export').submit();" class="f-bu f-bu-default g-2"><?php echo $button_export;?></a></div>
					</div>
					<!-- end tab_export -->
				</div>
			</div>
		</div>
		<?php echo $app_footer; ?>
	</div>
</div>
<script type="text/javascript"><!--
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
		$('.datetime').datetimepicker({
			pickDate: true,
			pickTime: true,
			format: 'YYYY-MM-DD HH:mm'
		});
	});
	function setBackgroundColor(obj) {
		    var row = '#row_' + $(obj).attr('id') + ' td';
		    if($(obj).prop('checked')){
		        $(row).addClass('selected');
		    } else {
		        $(row).removeClass('selected');
		    }
		}
	function initFieldsSet() {
		    $('.f-field-set input[type=checkbox]').each(function() {
		        setBackgroundColor(this);
		    });
		}
	//--></script>
<script type="text/javascript"><!--
	$('input[name=\'filter_customer\']').autocomplete({
		'source': function(request, response) {
			$.ajax({
				url: 'index.php?route=sale/customer/autocomplete&token=<?php echo $token; ?>&filter_name=' +  encodeURIComponent(request),
				dataType: 'json',
				success: function(json) {
					response($.map(json, function(item) {
						return {
							category: item['customer_group'],
							label: item['name'],
							value: item['product_id']
						}
					}));
				}
			});
		},
		'select': function(item) {
			$('input[name=\'filter_customer\']').val(item['label']);
		},
		'focus': function(event, ui) {
			return false;
	   	}
	});
	//--></script> 
<?php echo $footer; ?>

