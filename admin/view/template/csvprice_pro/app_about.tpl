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
			<?php if(isset($entry_license_key)) { ?>
			<div class="g-row f-title">
				<div class="g-12">
					<form action="<?php echo $action; ?>" method="post" id="form_license" enctype="multipart/form-data" class="ocl-ui-form-horizontal">
						<label><?php echo $entry_license_key;?>&nbsp;&nbsp;&nbsp;&nbsp; <input type="text" class="g-6" name="license_key"></label>  <button class="f-bu"><?php echo $button_save;?></button>	
					</form>
				</div>
			</div>
			<?php } ?>
			<div class="g-row">
				<table style="margin:0;border-bottom: 1px solid #EEEEEE;">
					<tbody>
						<?php if(isset($entry_license_key)) { ?>
						<tr>
							<td><?php echo $text_license_key;?></td>
							<td><?php echo $license_key;?></td>
						</tr>
						<?php } else {?>
						<tr>
							<td><?php echo $text_license_key;?></td>
							<td><a onclick="prompt('<?php echo $text_license_key;?>','<?php echo $license_key;?>'); return false;"><?php echo $text_show;?></a></td>
						</tr>
						<?php } ?>
						<tr>
							<td><?php echo $text_app_name;?></td>
							<td><?php echo $app_name;?></td>
						</tr>
						<tr>
							<td><?php echo $text_app_version;?></td>
							<td><?php echo $app_version;?></td>
						</tr>
						<tr>
							<td><?php echo $text_home_page;?></td>
							<td><a href="http://<?php echo $home_page;?>" target="_blank"><?php echo $home_page;?></a></td>
						</tr>
						<tr>
							<td><?php echo $text_support_email;?></td>
							<td><a href="mailto:<?php echo $support_email;?>"><?php echo $support_email;?></a></td>
						</tr>
					</tbody>
				</table>
			</div>
			<div class="g-row">&nbsp;</div>
		</div>
		<?php echo $app_footer; ?>
	</div>
</div>
<?php echo $footer; ?>