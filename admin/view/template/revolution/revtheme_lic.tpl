<?php echo $header; ?><?php echo $column_left; ?>
<div id="content">
  <div class="page-header">
    <div class="container-fluid">
      <div class="pull-right">
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
        <h3 class="panel-title"><i class="fa fa-pencil"></i> Лицензия для шаблона Revolution (<?php echo $_SERVER['HTTP_HOST'] ?>)</h3>
      </div>
      <div class="panel-body">
        <form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data" id="form-revtheme_license" class="form-horizontal">
			<div class="form-group">
			  <label class="col-sm-2 control-label">Введите лицензионный ключ:</label>
			  <div class="col-sm-3">
				<input type="text" name="revtheme_license" value="<?php echo (isset($revtheme_license)) ? $revtheme_license : ''; ?>" class="form-control" />
			  </div>
			</div>
			<div class="form-group">
			  <div class="col-sm-12">Ключ можно запросить по почте info@oc-mod.ru сообщив домен на который приобретался шаблон.</div>
			</div>
        </form>
      </div>
    </div>
	<div class="panel-footer clearfix">
		<div class="pull-left">
		<span style="vertical-align: middle;margin-right: 10px;">2016 © Revolution v.<?php echo $theme_version; ?></span>
		</div>
    </div>
  </div>
</div>
<script type="text/javascript"><!--
	function apply(){
		$(".alert").remove();
		$.post($("#form-revtheme_license").attr('action'), $("#form-revtheme_license").serialize(), function(html) {
			var $success = $(html).find(".alert-success, .alert-danger");
			if ($success.length > 0) {
				$(".alert-helper").before($success);
			}
		});
	}
//--></script>
<?php echo $footer; ?>