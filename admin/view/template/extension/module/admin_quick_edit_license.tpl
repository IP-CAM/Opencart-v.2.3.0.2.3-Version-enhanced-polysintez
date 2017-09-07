<?php echo $header; ?><?php echo $column_left; ?>
<div id="content">
  <div class="page-header">
    <div class="container-fluid">
      <div class="pull-right">
        <button type="submit" form="form-license" data-toggle="tooltip" title="<?php echo $button_save; ?>" class="btn btn-primary"><i class="fa fa-save"></i></button>
        <a href="<?php echo $cancel; ?>" data-toggle="tooltip" title="<?php echo $button_cancel; ?>" class="btn btn-default"><i class="fa fa-reply"></i></a></div>
      <h1><?php echo $heading_license; ?></h1>
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
	<?php if ($error_license) { ?>
    <div class="alert alert-danger"><i class="fa fa-exclamation-circle"></i> <?php echo $error_license; ?>
      <button type="button" class="close" data-dismiss="alert">&times;</button>
    </div>
    <?php } ?>
    <div class="panel panel-default">
      <div class="panel-heading">
        <h3 class="panel-title"><i class="fa fa-pencil"></i> <?php echo $text_license_activate; ?></h3>
      </div>
      <div class="panel-body">
        <form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data" id="form-license" class="form-horizontal">
          <ul class="nav nav-tabs">
		    <li class="active"><a href="#tab-license" data-toggle="tab"><div class="text-center"><i class="fa fa-check-square-o fa-3x"></i></div><?php echo $tab_license; ?></a></li>
			<li><a href="#tab-info" data-toggle="tab"><div class="text-center"><i class="fa fa-info-circle fa-3x"></i></div><?php echo $tab_info; ?></a></li>
		  </ul>
		  <div class="tab-content">
			<div class="tab-pane active" id="tab-license">
			  <input type="hidden" name="admin_quick_edit_license_secret_key" value="<?php echo $secret_key; ?>" />
			  <div class="form-group">
		        <div class="col-sm-12">
		          <div class="input-group"><span class="input-group-addon"><i class="fa fa-shopping-cart"></i></span><input type="text" name="admin_quick_edit_license_order_id" value="<?php echo $admin_quick_edit_license_order_id; ?>" placeholder="<?php echo $entry_order_id; ?>" class="form-control" /></div>
                </div>
		      </div>
		      <div class="form-group">
		        <div class="col-sm-12">
		          <div class="input-group"><span class="input-group-addon"><i class="fa fa-superscript"></i></span><input type="text" name="admin_quick_edit_license_product_code" value="<?php echo $admin_quick_edit_license_product_code; ?>" placeholder="<?php echo $entry_product_license_code; ?>" class="form-control" /></div>
                </div>
		      </div>
		      <div class="form-group">
		        <div class="col-sm-12">
		          <div class="input-group"><span class="input-group-addon"><i class="fa fa-key"></i></span><input type="text" name="admin_quick_edit_license_key" value="<?php echo $admin_quick_edit_license_key; ?>" placeholder="<?php echo $entry_license_key; ?>" class="form-control" /></div>
                </div>
		      </div>
			</div>
			<div class="tab-pane" id="tab-info">
			  <div class="form-group">
		        <div class="col-sm-12">
		          <div class="alert alert-info"><?php echo $text_secret_key; ?></div>
                </div>
		      </div>
			  <div class="form-group">
			    <div class="col-sm-9">
				  <h3 class="pull-left" style="margin: 5px 0 0 0;"><b class="text-info"><?php echo $entry_activation_secret_key; ?> - </b><b class="text-danger" id="secret-key"><?php echo $secret_key; ?></b></h3>
				</div>
				<div class="col-sm-3">
				  <button type="button" class="btn btn-primary btn-clipboard pull-right" data-clipboard-target="#secret-key"><?php echo $text_clipboard; ?></button>
				</div>
			  </div>
			  <div class="form-group">
		        <div class="col-sm-12">
				  <div class="alert alert-info"><i class="fa fa-info-circle"></i> <?php echo $text_license_info; ?></div> 
				</div>
			  </div>
			</div>
		  </div>
        </form>
      </div>
    </div>
  </div>
</div>
<script src="view/javascript/clipboard.min.js" type="text/javascript"></script>
<script type="text/javascript"><!--
new Clipboard('.btn-clipboard');
//--></script>
<?php echo $footer; ?>