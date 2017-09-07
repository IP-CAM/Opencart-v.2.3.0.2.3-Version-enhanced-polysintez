<div class="modal-header">
  <button type="button" class="pull-right btn btn-danger btn-sm" data-dismiss="modal" aria-hidden="true"><i class="fa fa-close"></i></button>
  <h4 class="modal-title"><?php echo $heading_generator_manufacturers; ?></h4>
</div>
<div class="modal-body">
  <form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data" id="form-generator" class="form-horizontal">
	<div class="hidden">
      <select name="source_language_code" id="source-language-code">
        <?php foreach ($languages as $language) { ?>
		  <?php if ($language['code'] == $source_language_code) { ?>
			<option value="<?php echo $language['code']; ?>" selected="selected"><?php echo $language['name']; ?></option>   
            <?php } else { ?>
            <option value="<?php echo $language['code']; ?>"><?php echo $language['name']; ?></option>
          <?php } ?>
        <?php } ?>
      </select>
	</div>
	<div class="form-group">
	  <div class="col-sm-5">
        <label class="control-label" for="template-url-alias"><?php echo $heading_seo_url; ?></label>
        <div class="input-group">
		  <span class="input-group-addon" data-toggle="tooltip" title="<?php echo $help_template_seo_url; ?>"><i class="fa fa-exclamation-circle"></i> <?php echo $column_template; ?></span>
		  <input type="text" id="template-url-alias" name="maxy_seo_manufacturers_template_url_alias" value="<?php echo $maxy_seo_manufacturers_template_url_alias; ?>" class="form-control" />
        </div>
		<?php echo $text_manufacturers_tags; ?>
      </div>
	  <div class="col-sm-4">
        <label class="control-label" for="input-overwrite"><span data-toggle="tooltip" title="<?php echo $help_warning_overwrite; ?>"><?php echo $column_overwrite; ?></span></label>
		<select name="overwrite_manufacturers" id="input-overwrite" class="form-control">
          <option value="dont_overwrite"><?php echo $text_no_overwrite; ?></option>
		  <option value="overwrite"><?php echo $text_overwrite; ?></option>
        </select>
      </div>
	  <div class="col-sm-3">
	    <label class="control-label" for="input-suffix"><span data-toggle="tooltip" title="<?php echo $help_template_suffix; ?>"><?php echo $column_suffix; ?></span></label>
        <div class="input-group">
		  <input type="text" id="input-suffix" name="manufacturers_suffix" value="" class="form-control" />
		  <span class="input-group-btn">
		    <a onclick="generator('Manufacturers', 'seo_keyword');" data-toggle="tooltip" title="<?php echo $button_generate; ?>" class="btn btn-primary"><i class="fa fa-random"></i></a>
		  </span>
		</div>
	  </div>
	</div>
	<div class="form-group">
	  <div class="col-sm-12">
        <label class="control-label" for="template-meta-title"><?php echo $heading_meta_title; ?></label>
        <div class="input-group">
		  <span class="input-group-addon" data-toggle="tooltip" title="<?php echo $help_template_meta_title; ?>"><i class="fa fa-exclamation-circle"></i> <?php echo $column_template; ?></span>
		  <input type="text" id="template-meta-title" name="maxy_seo_manufacturers_template_meta_title" value="<?php echo $maxy_seo_manufacturers_template_meta_title; ?>" class="form-control" />
		   <span class="input-group-btn">
		    <a onclick="generator('Manufacturers', 'meta_title');" data-toggle="tooltip" title="<?php echo $button_generate; ?>" class="btn btn-primary"><i class="fa fa-random"></i></a>
			<a onclick="deleteSeo('Manufacturers', 'meta_title');" data-toggle="tooltip" title="<?php echo $button_del_meta_title; ?>" class="btn btn-danger"><i class="fa fa-trash-o"></i></a>
		   </span>
        </div>
		<?php echo $text_meta_title_manufacturers_tags; ?>
      </div>
	</div>
	<div class="form-group">
	  <div class="col-sm-12">
        <label class="control-label" for="template-meta-title"><?php echo $heading_meta_h1; ?></label>
        <div class="input-group">
		  <span class="input-group-addon" data-toggle="tooltip" title="<?php echo $help_template_meta_h1; ?>"><i class="fa fa-exclamation-circle"></i> <?php echo $column_template; ?></span>
		  <input type="text" id="template-meta-h1" name="maxy_seo_manufacturers_template_meta_h1" value="<?php echo $maxy_seo_manufacturers_template_meta_h1; ?>" class="form-control" />
		   <span class="input-group-btn">
		    <a onclick="generator('Manufacturers', 'meta_h1');" data-toggle="tooltip" title="<?php echo $button_generate; ?>" class="btn btn-primary"><i class="fa fa-random"></i></a>
			<a onclick="deleteSeo('Manufacturers', 'meta_h1');" data-toggle="tooltip" title="<?php echo $button_del_meta_h1; ?>" class="btn btn-danger"><i class="fa fa-trash-o"></i></a>
		   </span>
        </div>
		<?php echo $text_meta_h1_manufacturers_tags; ?>
      </div>
	</div>
	<div class="form-group">
	  <div class="col-sm-12">
        <label class="control-label" for="template-meta-description"><?php echo $heading_meta_description; ?></label>
        <div class="input-group">
		  <span class="input-group-addon" data-toggle="tooltip" title="<?php echo $help_template_meta_description; ?>"><i class="fa fa-exclamation-circle"></i> <?php echo $column_template; ?></span>
		  <input type="text" id="template-meta-description" name="maxy_seo_manufacturers_template_meta_description" value="<?php echo $maxy_seo_manufacturers_template_meta_description; ?>" class="form-control" />
		   <span class="input-group-btn">
		    <a onclick="generator('Manufacturers', 'meta_description');" data-toggle="tooltip" title="<?php echo $button_generate; ?>" class="btn btn-primary"><i class="fa fa-random"></i></a>
			<a onclick="deleteSeo('Manufacturers', 'meta_description');" data-toggle="tooltip" title="<?php echo $button_del_meta_description; ?>" class="btn btn-danger"><i class="fa fa-trash-o"></i></a>
		   </span>
        </div>
		<?php echo $text_manufacturers_meta_description; ?>
      </div>
	</div>
	<div class="form-group">
	  <div class="col-sm-12">
        <label class="control-label" for="template-meta-keywords"><?php echo $heading_meta_keywords; ?></label>
        <div class="input-group">
		  <span class="input-group-addon" data-toggle="tooltip" title="<?php echo $help_template_meta_keywords; ?>"><i class="fa fa-exclamation-circle"></i> <?php echo $column_template; ?></span>
		  <input type="text" id="template-meta-keywords" name="maxy_seo_manufacturers_template_meta_keywords" value="<?php echo $maxy_seo_manufacturers_template_meta_keywords; ?>" class="form-control" />
		   <span class="input-group-btn">
		    <a onclick="generator('Manufacturers', 'meta_keywords');" data-toggle="tooltip" title="<?php echo $button_generate; ?>" class="btn btn-primary"><i class="fa fa-random"></i></a>
			<a onclick="deleteSeo('Manufacturers', 'meta_keywords');" data-toggle="tooltip" title="<?php echo $button_del_meta_keywords; ?>" class="btn btn-danger"><i class="fa fa-trash-o"></i></a>
		   </span>
        </div>
		<?php echo $text_meta_keywords_manufacturers_tag; ?>
      </div>
	</div>
  </form>
</div>
<div class="modal-footer">
  <div class="text-center"><a data-form="form-generator" class="button-save btn btn-info btn-lg"><?php echo $button_save_templates; ?></a></div>
</div>
<script type="text/javascript"><!--
$(".button-save").on('click', function(){
	$.ajax({
		url: $('#' + $(this).data('form')).attr('action'),
		type: 'post',
		dataType: 'json',
		data: $('#' + $(this).data('form') + ' input[type=\'text\']'),
		success: function(json) {
			if (json['error']) {
				$('#form-generator').before('<div class="alert alert-danger"><i class="fa fa-exclamation-circle"></i> ' + json['error'] + '</div>');
				
				$('.alert-danger').delay(1500).fadeOut(500);
			}
			
			if (json['success']) {
				$('#form-generator').before('<div class="alert alert-success"><i class="fa fa-exclamation-circle"></i> ' + json['success'] + '</div>');	
				
				$('.alert-success').delay(1500).fadeOut(500);
			}
		}
	});
});   
//--></script>