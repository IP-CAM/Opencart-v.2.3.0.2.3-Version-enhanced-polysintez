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
			<?php if( $Template == 'form' ) { ?>
			<div class="g-row">
				<div class="g-9 f-sub-header">
					<h3><?php echo $heading_title; ?></h3>
				</div>
				<div class="g-3 f-text-right">
					<a onclick="$('#form').submit();" class="f-bu f-bu-default"><?php echo $button_save; ?></a>
					<a onclick="location.replace('<?php echo $cancel;?>')" class="f-bu"><?php echo $button_cancel; ?></a>
				</div>
			</div>
			<div class="f-row">&nbsp;</div>
			<div class="f-row">
				<form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data" id="form">
					<input type="hidden" name="job_id" value="<?php if(isset($job_id)){echo $job_id;}else{echo '0';}?>" />
					<input type="hidden" name="job_key" value="<?php if(isset($job_key)){echo $job_key;}else{echo time();}?>" />
					<div class="f-row">
						<label><?php echo $entry_status; ?>:</label>
						<div class="f-input">
							<select class="g-2" name="status">
								<?php if ($job['status']) { ?>
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
						<label><?php echo $entry_job_type; ?>:</label>
						<div class="f-input">
							<select id="job_type" name="job_type" class="g-2">
								<option value="import"<?php if(isset($job['job_type']) && $job['job_type'] == 'import'){echo ' selected="selected"';}?>><?php echo $text_job_type_import;?></option>
								<option value="export"<?php if(isset($job['job_type']) && $job['job_type'] == 'export'){echo ' selected="selected"';}?>><?php echo $text_job_type_export;?></option>
							</select>
						</div>
					</div>
					<div class="f-row">
						<label><?php echo $entry_profile; ?>:</label>
						<div class="f-input">
							<select id="profile_id" name="profile_id" class="g-4">
								<?php if( $job['job_type'] == 'import' ) {$options = $profile_import;}else{$options = $profile_export;}?>
								<?php foreach($options as $profile) {?>
								<option value="<?php echo $profile['profile_id'];?>"<?php if(isset($job['profile_id']) && $job['profile_id'] == $profile['profile_id']){echo ' selected="selected"';}?>><?php echo $profile['name'];?></option>
								<?php } ?>
							</select>
						</div>
					</div>
					<div class="f-row">
						<label><?php echo $entry_job_offline; ?>:</label>
						<div class="f-input">
							<select class="g-2" name="job_offline">
								<?php if ($job['job_offline']) { ?>
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
						<label><?php echo $entry_time_start; ?>:</label>
						<div class="f-input">
							<select id="job_time_start_h" name="job_time_start[H]" class="g-1 f-text-right">
								<?php foreach($datetime['H'] as $H) {?>
								<?php if( isset($job['job_time_start']) && $job['job_time_start']['H'] == $H) { ?>
								<option value="<?php echo $H;?>" selected="selected"><?php echo $H;?></option>
								<?php } else { ?>
								<option value="<?php echo $H;?>"><?php echo $H;?></option>
								<?php } ?>
								<?php } ?>
							</select>
							<select id="job_time_start_i" name="job_time_start[i]" class="g-1 f-text-right">
								<?php foreach($datetime['i'] as $i) {?>
								<?php if( isset($job['job_time_start']) && $job['job_time_start']['i'] == $i) { ?>
								<option value="<?php echo $i;?>" selected="selected"><?php echo $i;?></option>
								<?php } else { ?>
								<option value="<?php echo $i;?>"><?php echo $i;?></option>
								<?php } ?>
								<?php } ?>
							</select>
						</div>
					</div>
					<div class="f-row">
						<label><?php echo $entry_file_location; ?>:</label>
						<div class="f-input">
							<select id="job_file_location" class="g-2" name="job_file_location">
								<option value="dir"<?php if (isset($job['job_file_location']) && $job['job_file_location'] == 'dir') {echo ' selected="selected"';} ?>>Directory</option>
								<option value="web"<?php if (isset($job['job_file_location']) && $job['job_file_location'] == 'web') {echo ' selected="selected"';} ?>>Web</option>
								<option value="ftp"<?php if (isset($job['job_file_location']) && $job['job_file_location'] == 'ftp') {echo ' selected="selected"';} ?>>FTP</option>
							</select>
						</div>
					</div>
					<div class="f-row f-ftp_data">
						<label><?php echo $entry_ftp_host; ?>:</label>
						<div class="f-input">
							<input class="g-3" type="text" name="ftp_host" value="<?php echo $job['ftp_host']; ?>" />
						</div>
					</div>
					<div class="f-row f-ftp_data">
						<label><?php echo $entry_ftp_user; ?>:</label>
						<div class="f-input">
							<input class="g-3" type="text" name="ftp_user" value="<?php echo $job['ftp_user']; ?>" />
						</div>
					</div>
					<div class="f-row f-ftp_data">
						<label><?php echo $entry_ftp_passwd; ?>:</label>
						<div class="f-input">
							<input class="g-3" type="text" name="ftp_passwd" value="<?php echo $job['ftp_passwd']; ?>" />
						</div>
					</div>
					<div class="f-row">
						<label><?php echo $entry_file_path; ?>:</label>
						<div class="f-input">
							<input class="g-8" type="text" name="file_path" value="<?php echo $job['file_path']; ?>" />
						</div>
					</div>
					<script type="text/javascript"><!--
						jQuery(document).ready(function ($) {
							var s=0,i='',e='',
							profile_export='<?php foreach($profile_export as $profile) {?><option value="<?php echo $profile['profile_id'];?>"><?php echo $profile['name'];?></option><?php } ?>',
							profile_import='<?php foreach($profile_import as $profile) {?><option value="<?php echo $profile['profile_id'];?>"><?php echo $profile['name'];?></option><?php } ?>';
							$("#job_type").change(function(){
								if( $("#job_type").val()=='import' ) {
									$("#profile_id").html(profile_import);
								} else {
									$("#profile_id").html(profile_export);
								}
							});
							f_file_location();
							$("#job_file_location").change(f_file_location);
						});
						function f_file_location(){
							if( $("#job_file_location").val()=='ftp' ) {
								$(".f-ftp_data").show();
							} else {
								$(".f-ftp_data").hide();
							}
						}
						//--></script>
					<div style="clear: both"></div>
				</form>
			</div>
			<?php } else { ?>
			<div class="g-row">
				<div class="g-6 f-sub-header">
					<h3><?php echo $heading_title; ?></h3>
				</div>
				<div class="g-6 f-text-right">
					<a onclick="location = '<?php echo $insert; ?>'" class="f-bu f-bu-default"><?php echo $button_insert; ?></a>
					<a onclick="confirm('<?php echo $text_confirm_delete;?>') ? $('form').submit() : false;" class="f-bu"><?php echo $button_delete; ?></a>
				</div>
			</div>
			<div class="g-row">
				<form action="<?php echo $delete; ?>" method="post" enctype="multipart/form-data" id="form">
					<table class="f-table-zebra" style="margin-top: 10px">
						<thead>
							<tr>
								<th width="1" style="text-align: center;"><input type="checkbox" onclick="$('input[name*=\'selected\']').attr('checked', this.checked);" /></th>
								<th class="f-text-left"><?php echo $column_profile_name; ?></th>
								<th class="f-text-left"><?php echo $column_job_type; ?></th>
								<th class="f-text-left"><?php echo $column_job_time_start; ?></th>
								<th class="f-text-left"><?php echo $column_job_file_location; ?></th>
								<th class="f-text-left">cron_key</th>
								<th class="f-text-left"><?php echo $column_status; ?></th>
							</tr>
						</thead>
						<tbody>
							<?php if ($jobs) { ?>
							<?php foreach ($jobs as $job) { $action = $job['action']; ?>
							<tr id="row_job_<?php echo $job['job_id']; ?>">
								<td style="text-align: center;">
									<?php if ( isset($job['selected']) && $job['selected'] ) { ?>
									<input type="checkbox" name="selected[]" value="<?php echo $job['job_id']; ?>" checked="checked" />
									<?php } else { ?>
									<input type="checkbox" name="selected[]" value="<?php echo $job['job_id']; ?>" />
									<?php } ?>
								</td>
								<td class="left">
									<?php echo $job['profile_name']; ?>
									<div class="row-actions">
										<span><a href="<?php echo $action['edit']['href']; ?>"><?php echo $action['edit']['text']; ?></a> | </span>
										<span><a class="delete" href="<?php echo $action['delete']['href']; ?>"><?php echo $action['delete']['text']; ?></a> | </span>
										<span><a class="f-button_view" data-row_id="<?php echo $job['job_id']; ?>"><?php echo $button_view; ?></a></span>
										<div id="job-view_<?php echo $job['job_id']; ?>" style="display: none">
											<?php if($job['cron_cli']) { ?>
											<p><b>cli cron job command:</b></p>
											<p><?php echo $job['cron_cli'];?></p>
											<?php } ?>
											<?php if($job['cron_wget']) { ?>
											<p><b>wget cron job command:</b></p>
											<p><?php echo $job['cron_wget'];?></p>
											<?php } ?>
											<?php if($job['cron_curl']) { ?>
											<p><b>curl cron job command:</b></p>
											<p><?php echo $job['cron_curl'];?></p>
											<?php } ?>
										</div>
									</div>
									<div class="hidden" id="inline_<?php echo $job['job_id']; ?>"></div>
								</td>
								<td class="f-text-left"><?php echo $job['job_type']; ?></td>
								<td class="f-text-left"><?php echo $job['job_time_start']; ?></td>
								<td class="f-text-left"><?php echo $job['job_file_location']; ?></td>
								<td class="f-text-left"><?php echo $job['job_key']; ?></td>
								<td class="f-text-left"><?php echo $job['status']; ?></td>
								<!-- <td class="f-text-center"><a href="<?php echo $action['edit']['href']; ?>"><?php echo $action['edit']['text']; ?></a></td> -->
							</tr>
							<?php } ?>
							<?php } else { ?>
							<tr>
								<td class="center" colspan="7"><?php echo $text_no_results; ?></td>
							</tr>
							<?php } ?>
						</tbody>
					</table>
				</form>
			</div>
			<?php } ?>
		</div>
		<?php echo $app_footer; ?>
	</div>
</div>
<script type="text/javascript"><!--
	$(".f-button_view").click(function(e) {
		e.preventDefault();
		var i=$('#job-view_' + $(this).attr('data-row_id')),m=$('#oc2-dialog-job');
		m.on('show.bs.modal', function (e) {
			$('#oc2-modal-body-job').html(i.html());
		});
		m.on('hidden.bs.modal', function (e) {
			$('#oc2-modal-body-job').html('');
		});
		m.modal('show');
	});
	//--></script>
<div class="modal fade" id="oc2-dialog-job">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-body" id="oc2-modal-body-job"></div>
			<div class="modal-footer">
				<a href="#" class="f-bu f-bu-default g-1" data-dismiss="modal"> &nbsp;OK&nbsp; </a>
			</div>
		</div>
	</div>
</div>
<?php echo $footer; ?>