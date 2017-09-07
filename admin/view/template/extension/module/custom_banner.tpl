<?php echo $header; ?><?php echo $column_left; ?>
<div id="content">
  <div class="page-header">
    <div class="container-fluid">
      <div class="pull-right">
        <button type="submit" form="form-custom-banner" data-toggle="tooltip" title="<?php echo $button_save; ?>" class="btn btn-primary"><i class="fa fa-save"></i></button>
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
    <div class="panel panel-default">
      <div class="panel-heading">
        <h3 class="panel-title"><i class="fa fa-pencil"></i> <?php echo $text_edit; ?></h3>
      </div>
      <div class="panel-body">
        <form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data" id="form-custom-banner" class="form-horizontal">
		  <div class="form-group">
                <label class="col-sm-1 control-label" for="input-block_1"><span data-toggle="tooltip" data-html="true" data-trigger="click" title="<?php echo htmlspecialchars($help_fontawesome); ?>"><?php echo $entry_block_1; ?></span></label>
                <div class="col-sm-3">
                  <input type="text" name="custom_banner_ico_block_1" value="<?php echo $custom_banner_ico_block_1; ?>" placeholder="<?php echo $text_ico; ?>" id="input-ico_block_1" class="form-control" />
                </div>
				<div class="col-sm-3">
                  <input type="text" name="custom_banner_text_block_1" value="<?php echo $custom_banner_text_block_1; ?>" placeholder="<?php echo $text_block; ?>" id="input-text_block_1" class="form-control" />
                </div>
				<div class="col-sm-3">
                  <input type="text" name="custom_banner_link_block_1" value="<?php echo $custom_banner_link_block_1; ?>" placeholder="<?php echo $text_link; ?>" id="input-link_block_1" class="form-control" />
                </div>
				<label class="col-sm-1 control-label" for="input-block_1"><span data-toggle="tooltip" data-html="true" data-trigger="click" title="<?php echo htmlspecialchars($help_target_blank); ?>"><?php echo $text_target_blank; ?></span></label>
				<div class="col-sm-1">
              <select name="custom_banner_target_block_1" id="input-status" class="form-control">
                <?php if ($custom_banner_target_block_1) { ?>
                <option value="1" selected="selected"><?php echo $text_yes; ?></option>
                <option value="0"><?php echo $text_no; ?></option>
                <?php } else { ?>
                <option value="1"><?php echo $text_yes; ?></option>
                <option value="0" selected="selected"><?php echo $text_no; ?></option>
                <?php } ?>
              </select>
            </div>
              </div>
		  <div class="form-group">
                <label class="col-sm-1 control-label" for="input-block_2"><span data-toggle="tooltip" data-html="true" data-trigger="click" title="<?php echo htmlspecialchars($help_fontawesome); ?>"><?php echo $entry_block_2; ?></span></label>
                <div class="col-sm-3">
                  <input type="text" name="custom_banner_ico_block_2" value="<?php echo $custom_banner_ico_block_2; ?>" placeholder="<?php echo $text_ico; ?>" id="input-ico_block_2" class="form-control" />
                </div>
				<div class="col-sm-3">
                  <input type="text" name="custom_banner_text_block_2" value="<?php echo $custom_banner_text_block_2; ?>" placeholder="<?php echo $text_block; ?>" id="input-text_block_2" class="form-control" />
                </div>
				<div class="col-sm-3">
                  <input type="text" name="custom_banner_link_block_2" value="<?php echo $custom_banner_link_block_2; ?>" placeholder="<?php echo $text_link; ?>" id="input-link_block_2" class="form-control" />
                </div>
				<label class="col-sm-1 control-label" for="input-block_2"><span data-toggle="tooltip" data-html="true" data-trigger="click" title="<?php echo htmlspecialchars($help_target_blank); ?>"><?php echo $text_target_blank; ?></span></label>
				<div class="col-sm-1">
              <select name="custom_banner_target_block_2" id="input-status" class="form-control">
                <?php if ($custom_banner_target_block_2) { ?>
                <option value="1" selected="selected"><?php echo $text_yes; ?></option>
                <option value="0"><?php echo $text_no; ?></option>
                <?php } else { ?>
                <option value="1"><?php echo $text_yes; ?></option>
                <option value="0" selected="selected"><?php echo $text_no; ?></option>
                <?php } ?>
              </select>
            </div>
              </div>
		   <div class="form-group">
                <label class="col-sm-1 control-label" for="input-block_3"><span data-toggle="tooltip" data-html="true" data-trigger="click" title="<?php echo htmlspecialchars($help_fontawesome); ?>"><?php echo $entry_block_3; ?></span></label>
                <div class="col-sm-3">
                  <input type="text" name="custom_banner_ico_block_3" value="<?php echo $custom_banner_ico_block_3; ?>" placeholder="<?php echo $text_ico; ?>" id="input-ico_block_3" class="form-control" />
                </div>
				<div class="col-sm-3">
                  <input type="text" name="custom_banner_text_block_3" value="<?php echo $custom_banner_text_block_3; ?>" placeholder="<?php echo $text_block; ?>" id="input-text_block_3" class="form-control" />
                </div>
				<div class="col-sm-3">
                  <input type="text" name="custom_banner_link_block_3" value="<?php echo $custom_banner_link_block_3; ?>" placeholder="<?php echo $text_link; ?>" id="input-link_block_3" class="form-control" />
                </div>
				<label class="col-sm-1 control-label" for="input-block_3"><span data-toggle="tooltip" data-html="true" data-trigger="click" title="<?php echo htmlspecialchars($help_target_blank); ?>"><?php echo $text_target_blank; ?></span></label>
				<div class="col-sm-1">
              <select name="custom_banner_target_block_3" id="input-status" class="form-control">
                <?php if ($custom_banner_target_block_3) { ?>
                <option value="1" selected="selected"><?php echo $text_yes; ?></option>
                <option value="0"><?php echo $text_no; ?></option>
                <?php } else { ?>
                <option value="1"><?php echo $text_yes; ?></option>
                <option value="0" selected="selected"><?php echo $text_no; ?></option>
                <?php } ?>
              </select>
            </div>
              </div>
		  <div class="form-group">
                <label class="col-sm-1 control-label" for="input-text_block_4"><span data-toggle="tooltip" data-html="true" data-trigger="click" title="<?php echo htmlspecialchars($help_fontawesome); ?>"><?php echo $entry_block_4; ?></span></label>
                <div class="col-sm-3">
                  <input type="text" name="custom_banner_ico_block_4" value="<?php echo $custom_banner_ico_block_4; ?>" placeholder="<?php echo $text_ico; ?>" id="input-ico_block_4" class="form-control" />
                </div>
				<div class="col-sm-3">
                  <input type="text" name="custom_banner_text_block_4" value="<?php echo $custom_banner_text_block_4; ?>" placeholder="<?php echo $text_block; ?>" id="input-text_block_4" class="form-control" />
                </div>
				<div class="col-sm-3">
                  <input type="text" name="custom_banner_link_block_4" value="<?php echo $custom_banner_link_block_4; ?>" placeholder="<?php echo $text_link; ?>" id="input-link_block_4" class="form-control" />
                </div>
				<label class="col-sm-1 control-label" for="input-block_4"><span data-toggle="tooltip" data-html="true" data-trigger="click" title="<?php echo htmlspecialchars($help_target_blank); ?>"><?php echo $text_target_blank; ?></span></label>
				<div class="col-sm-1">
              <select name="custom_banner_target_block_4" id="input-status" class="form-control">
                <?php if ($custom_banner_target_block_4) { ?>
                <option value="1" selected="selected"><?php echo $text_yes; ?></option>
                <option value="0"><?php echo $text_no; ?></option>
                <?php } else { ?>
                <option value="1"><?php echo $text_yes; ?></option>
                <option value="0" selected="selected"><?php echo $text_no; ?></option>
                <?php } ?>
              </select>
            </div>
              </div>
          <div class="form-group">
            <label class="col-sm-1 control-label" for="input-status"><?php echo $entry_status; ?></label>
            <div class="col-sm-11">
              <select name="custom_banner_status" id="input-status" class="form-control">
                <?php if ($custom_banner_status) { ?>
                <option value="1" selected="selected"><?php echo $text_enabled; ?></option>
                <option value="0"><?php echo $text_disabled; ?></option>
                <?php } else { ?>
                <option value="1"><?php echo $text_enabled; ?></option>
                <option value="0" selected="selected"><?php echo $text_disabled; ?></option>
                <?php } ?>
              </select>
            </div>
          </div>
        </form>
      </div>
    </div>
  </div>
</div>
<?php echo $footer; ?>