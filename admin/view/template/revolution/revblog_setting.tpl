<?php echo $header; ?><?php echo $column_left; ?>
<div id="content">
  <div class="page-header">
    <div class="container-fluid">
      <div class="pull-right">
		<a onclick="apply()" class="btn btn-success" data-toggle="tooltip" data-placement="bottom" title="Применить"><i class="fa fa-check"></i></a>
        <button type="submit" form="form-blog" data-toggle="tooltip" title="<?php echo $button_save; ?>" class="btn btn-primary"><i class="fa fa-save"></i></button>
        <a href="<?php echo $cancel; ?>" data-toggle="tooltip" title="<?php echo $button_cancel; ?>" class="btn btn-default"><i class="fa fa-reply"></i></a></div>
      <h1><?php echo $heading_title; ?></h1>
      <ul class="breadcrumb">
        <?php foreach ($breadcrumbs as $breadcrumb) { ?>
        <li><a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a></li>
        <?php } ?>
      </ul>
    </div>
  </div>
  <div class="container-fluid">
    <?php if ($error_warning) { ?>
    <div class="alert alert-danger"><i class="fa fa-exclamation-circle"></i> <?php echo $error_warning; ?>
      <button type="button" class="close" data-dismiss="alert">&times;</button>
    </div>
    <?php } ?>
	<?php if ($success) { ?>
    <div class="alert alert-success"><i class="fa fa-check-circle"></i> <?php echo $success; ?>
      <button type="button" class="close" data-dismiss="alert">&times;</button>
    </div>
    <?php } ?>
    <div class="panel panel-default alert-helper">
      <div class="panel-heading">
        <h3 class="panel-title"><i class="fa fa-pencil"></i> <?php echo $text_edit; ?></h3>
      </div>
      <div class="panel-body">
        <form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data" id="form-revblog" class="form-horizontal">
          <ul class="nav nav-tabs">
			<li class="active"><a href="#tab-list" data-toggle="tab"><?php echo $tab_list; ?></a></li>
			<li><a href="#tab-form" data-toggle="tab"><?php echo $tab_form; ?></a></li>
          </ul>
          <div class="tab-content">
			<div class="tab-pane active" id="tab-list">
				<div class="form-group">
					<label class="col-sm-2 control-label">Размер картинки категории, px:</label>
					<div class="col-sm-9">
						<div class="row">
						  <div class="col-sm-2">
							<input data-toggle="tooltip" data-placement="top" title="<?php echo $entry_width; ?>" type="text" name="revblog_settings[category_image_width]" value="<?php echo (isset($revblog['category_image_width'])) ? $revblog['category_image_width'] : ''; ?>" placeholder="<?php echo $entry_width; ?>" class="form-control width_initial" />
							<?php if ($error_list_image_width) { ?>
							<div class="text-danger"><?php echo $error_list_image_width; ?></div>
							<?php } ?>
						  </div>
						  <div class="col-sm-2">
							<input data-toggle="tooltip" data-placement="top" title="<?php echo $entry_height; ?>" type="text" name="revblog_settings[category_image_height]" value="<?php echo (isset($revblog['category_image_height'])) ? $revblog['category_image_height'] : ''; ?>" placeholder="<?php echo $entry_height; ?>" class="form-control width_initial" />
							<?php if ($error_list_image_height) { ?>
							<div class="text-danger"><?php echo $error_list_image_height; ?></div>
							<?php } ?>
						  </div>
						</div>
					</div>
				</div>
				<div class="form-group">
				  <label class="col-sm-2 control-label"><?php echo $entry_desc_limit; ?></label>
				  <div class="col-sm-3">
					<input type="text" name="revblog_settings[list_desc_limit]" value="<?php echo (isset($revblog['list_desc_limit'])) ? $revblog['list_desc_limit'] : ''; ?>" placeholder="<?php echo $entry_limit; ?>" class="form-control" />
					<?php if ($error_list_desc_limit) { ?>
					<div class="text-danger"><?php echo $error_list_desc_limit; ?></div>
					<?php } ?>
				  </div>
				</div>
				<div class="form-group">
					<label class="col-sm-2 control-label">Размер картинки новости, px:</label>
					<div class="col-sm-9">
						<div class="row">
						  <div class="col-sm-2">
							<input data-toggle="tooltip" data-placement="top" title="<?php echo $entry_width; ?>" type="text" name="revblog_settings[list_image_width]" value="<?php echo (isset($revblog['list_image_width'])) ? $revblog['list_image_width'] : ''; ?>" placeholder="<?php echo $entry_width; ?>" class="form-control width_initial" />
							<?php if ($error_list_image_width) { ?>
							<div class="text-danger"><?php echo $error_list_image_width; ?></div>
							<?php } ?>
						  </div>
						  <div class="col-sm-2">
							<input data-toggle="tooltip" data-placement="top" title="<?php echo $entry_height; ?>" type="text" name="revblog_settings[list_image_height]" value="<?php echo (isset($revblog['list_image_height'])) ? $revblog['list_image_height'] : ''; ?>" placeholder="<?php echo $entry_height; ?>" class="form-control width_initial" />
							<?php if ($error_list_image_height) { ?>
							<div class="text-danger"><?php echo $error_list_image_height; ?></div>
							<?php } ?>
						  </div>
						</div>
					</div>
				</div>
            </div>
			<div class="tab-pane" id="tab-form">			
				<div class="form-group">
					<label class="col-sm-2 control-label"><?php echo $entry_image_thumb; ?></label>
					<div class="col-sm-9">
						<div class="row">
						  <div class="col-sm-2">
							<input data-toggle="tooltip" data-placement="top" title="<?php echo $entry_width; ?>" type="text" name="revblog_settings[form_image_width]" value="<?php echo (isset($revblog['form_image_width'])) ? $revblog['form_image_width'] : ''; ?>" placeholder="<?php echo $entry_width; ?>" class="form-control width_initial" />
							<?php if ($error_form_image_width) { ?>
							<div class="text-danger"><?php echo $error_form_image_width; ?></div>
							<?php } ?>
						  </div>
						  <div class="col-sm-2">
							<input data-toggle="tooltip" data-placement="top" title="<?php echo $entry_height; ?>" type="text" name="revblog_settings[form_image_height]" value="<?php echo (isset($revblog['form_image_height'])) ? $revblog['form_image_height'] : ''; ?>" placeholder="<?php echo $entry_height; ?>" class="form-control width_initial" />
							<?php if ($error_form_image_height) { ?>
							<div class="text-danger"><?php echo $error_form_image_height; ?></div>
							<?php } ?>
						  </div>
						</div>
					</div>
				</div>
				<div class="form-group">
					<label class="col-sm-2 control-label">Размер картинки в галлерее, px:</label>
					<div class="col-sm-9">
						<div class="row">
						  <div class="col-sm-2">
							<input data-toggle="tooltip" data-placement="top" title="<?php echo $entry_width; ?>" type="text" name="revblog_settings[images_image_width]" value="<?php echo (isset($revblog['images_image_width'])) ? $revblog['images_image_width'] : ''; ?>" placeholder="<?php echo $entry_width; ?>" class="form-control width_initial" />
							<?php if ($error_images_image_width) { ?>
							<div class="text-danger"><?php echo $error_images_image_width; ?></div>
							<?php } ?>
						  </div>
						  <div class="col-sm-2">
							<input data-toggle="tooltip" data-placement="top" title="<?php echo $entry_height; ?>" type="text" name="revblog_settings[images_image_height]" value="<?php echo (isset($revblog['images_image_height'])) ? $revblog['images_image_height'] : ''; ?>" placeholder="<?php echo $entry_height; ?>" class="form-control width_initial" />
							<?php if ($error_images_image_height) { ?>
							<div class="text-danger"><?php echo $error_images_image_height; ?></div>
							<?php } ?>
						  </div>
						</div>
					</div>
				</div>
				<div class="form-group">
					<label class="col-sm-2 control-label"><?php echo $entry_share_status; ?></label>
					<div class="col-sm-3">
						<label class="radio-inline">
							<input type="radio" name="revblog_settings[share_status]" value="1" <?php if ($revblog['share_status']) { echo 'checked'; } ?> /> <?php echo $text_enable; ?>
						</label>
						<label class="radio-inline">
							<input type="radio" name="revblog_settings[share_status]" value="0" <?php if (!$revblog['share_status']) { echo 'checked';} ?> /> <?php echo $text_disable; ?>
						</label>
					</div>
				</div>
				<div class="form-group">
					<label class="col-sm-2 control-label"><span data-toggle="tooltip" title="Если отключена возможность заказа товаров при 0 количестве или цене.">Не выводить товары<br>с кол-вом или ценой = 0:</span></label>
					<div class="col-sm-2">
						<label class="radio-inline">
							<input type="radio" name="revblog_settings[not_view_null]" value="1" <?php if ($revblog['not_view_null']) { echo 'checked'; } ?> /> Вкл.
						</label>
						<label class="radio-inline">
							<input type="radio" name="revblog_settings[not_view_null]" value="0" <?php if (!$revblog['not_view_null']) { echo 'checked';} ?> /> Выкл.
						</label>
					</div>
				</div>
            </div>
          </div>
        </form>
      </div>
    </div>
  </div>
</div>
<script type="text/javascript"><!--
	function apply(){
		$(".alert").remove();
		$.post($("#form-revblog").attr('action'), $("#form-revblog").serialize(), function(html) {
			var $success = $(html).find(".alert-success, .alert-danger");
			if ($success.length > 0) {
				$(".alert-helper").before($success);
			}
		});
	}
//--></script>
<?php echo $footer; ?>