<?php echo $header; ?><?php echo $column_left; ?>
<div id="content">
  <div class="page-header">
    <div class="container-fluid">
      <div class="pull-right">
        <button type="submit" form="form-custom-footer" data-toggle="tooltip" title="<?php echo $button_save; ?>" class="btn btn-primary"><i class="fa fa-save"></i></button>
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
        <form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data" id="form-custom-footer" class="form-horizontal">
		  <div class="form-group">
            <label class="col-sm-2 control-label" for="input-welcome"><?php echo $entry_welcome; ?></label>
            <div class="col-sm-10">
              <textarea name="custom_footer_welcome" rows="5" id="input-welcome" class="form-control"><?php echo $custom_footer_welcome; ?></textarea>
            </div>
          </div>
		  <div class="form-group">
            <label class="col-sm-2 control-label" for="input-address"><?php echo $entry_address; ?></label>
            <div class="col-sm-10">
              <textarea name="custom_footer_address" rows="5" id="input-address" class="form-control"><?php echo $custom_footer_address; ?></textarea>
            </div>
          </div>
		  <div class="form-group">
            <label class="col-sm-2 control-label" for="input-maps"><span data-toggle="tooltip" data-html="true" data-trigger="click" title="<?php echo htmlspecialchars($help_maps); ?>"><?php echo $entry_maps; ?></span></label>
            <div class="col-sm-10">
              <textarea name="custom_footer_maps" rows="5" id="input-maps" class="form-control"><?php echo $custom_footer_maps; ?></textarea>
            </div>
          </div>
		  <div class="form-group">
                <label class="col-sm-2 control-label" for="input-email"><?php echo $entry_email; ?></label>
                <div class="col-sm-10">
                  <input type="text" name="custom_footer_email" value="<?php echo $custom_footer_email; ?>" placeholder="<?php echo $entry_email; ?>" id="input-email" class="form-control" />
                </div>
              </div>
		  <div class="form-group">
                <label class="col-sm-2 control-label" for="input-telephone"><?php echo $entry_telephone; ?></label>
                <div class="col-sm-10">
                  <input type="text" name="custom_footer_telephone" value="<?php echo $custom_footer_telephone; ?>" placeholder="<?php echo $entry_telephone; ?>" id="input-telephone" class="form-control" />
                </div>
              </div>
		  <div class="form-group">
                <label class="col-sm-2 control-label" for="input-telephone2"><?php echo $entry_telephone2; ?></label>
                <div class="col-sm-10">
                  <input type="text" name="custom_footer_telephone2" value="<?php echo $custom_footer_telephone2; ?>" placeholder="<?php echo $entry_telephone2; ?>" id="input-telephone2" class="form-control" />
                </div>
              </div>
		  <div class="form-group">
                <label class="col-sm-2 control-label" for="input-telephone3"><?php echo $entry_telephone3; ?></label>
                <div class="col-sm-10">
                  <input type="text" name="custom_footer_telephone3" value="<?php echo $custom_footer_telephone3; ?>" placeholder="<?php echo $entry_telephone3; ?>" id="input-telephone3" class="form-control" />
                </div>
              </div>
		  <div class="form-group">
                <label class="col-sm-2 control-label" for="input-time"><?php echo $entry_time; ?></label>
                <div class="col-sm-10">
                  <input type="text" name="custom_footer_time" value="<?php echo $custom_footer_time; ?>" placeholder="<?php echo $entry_time; ?>" id="input-time" class="form-control" />
                </div>
              </div>
		  <div class="form-group">
                <label class="col-sm-2 control-label" for="input-vk"><?php echo $entry_vk; ?></label>
                <div class="col-sm-10">
                  <input type="text" name="custom_footer_vk" value="<?php echo $custom_footer_vk; ?>" placeholder="<?php echo $entry_vk; ?>" id="input-vk" class="form-control" />
                </div>
              </div>
		  <div class="form-group">
                <label class="col-sm-2 control-label" for="input-fb"><?php echo $entry_fb; ?></label>
                <div class="col-sm-10">
                  <input type="text" name="custom_footer_fb" value="<?php echo $custom_footer_fb; ?>" placeholder="<?php echo $entry_fb; ?>" id="input-fb" class="form-control" />
                </div>
              </div>
		  <div class="form-group">
                <label class="col-sm-2 control-label" for="input-googleplus"><?php echo $entry_googleplus; ?></label>
                <div class="col-sm-10">
                  <input type="text" name="custom_footer_googleplus" value="<?php echo $custom_footer_googleplus; ?>" placeholder="<?php echo $entry_googleplus; ?>" id="input-googleplus" class="form-control" />
                </div>
              </div>
		   <div class="form-group">
                <label class="col-sm-2 control-label" for="input-youtube"><?php echo $entry_youtube; ?></label>
                <div class="col-sm-10">
                  <input type="text" name="custom_footer_youtube" value="<?php echo $custom_footer_youtube; ?>" placeholder="<?php echo $entry_youtube; ?>" id="input-youtube" class="form-control" />
                </div>
              </div>
		  <div class="form-group">
                <label class="col-sm-2 control-label" for="input-twitter"><?php echo $entry_twitter; ?></label>
                <div class="col-sm-10">
                  <input type="text" name="custom_footer_twitter" value="<?php echo $custom_footer_twitter; ?>" placeholder="<?php echo $entry_twitter; ?>" id="input-twitter" class="form-control" />
                </div>
              </div>
          <div class="form-group">
            <label class="col-sm-2 control-label" for="input-status"><?php echo $entry_status; ?></label>
            <div class="col-sm-10">
              <select name="custom_footer_status" id="input-status" class="form-control">
                <?php if ($custom_footer_status) { ?>
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