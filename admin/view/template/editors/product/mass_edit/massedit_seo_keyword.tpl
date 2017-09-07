<div class="modal-header">
  <button type="button" class="pull-right btn btn-danger btn-sm" data-dismiss="modal" aria-hidden="true"><i class="fa fa-close"></i></button>
  <h4 class="modal-title"><?php echo $entry_keyword; ?></h4>
</div>
<div class="modal-body" id="body-mass-product-seourl">
  <form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data" id="form-mass-product-seourl" class="form-horizontal">	
	<div class="alert alert-info"><?php echo $text_seo_url_info; ?></div>
	<div class="form-group">
	  <label class="col-sm-2 control-label" for="input-seo-url"><?php echo $entry_generator; ?></label>
	  <div class="col-sm-10">
		<select name="seo_url_generator" id="input-seo-url" class="form-control">
		  <option value="generator"><?php echo $text_seo_name; ?></option>
		  <option value="custom"><?php echo $text_seo_custom; ?></option>
		</select>
	  </div>
	</div>
	<div class="form-group hidden" id="seo-url-custom">	
	  <label class="col-sm-2 control-label" for="input-seo-url-custom"><?php echo $entry_keyword; ?></label>
	  <div class="col-sm-10">
		<input type="text" name="seo_url" value="" placeholder="<?php echo $entry_keyword; ?>" id="input-seo-url-custom" class="form-control" />
	  </div>
	</div>
	<div class="form-group">
	  <label class="col-sm-2 control-label" for="input-type-seo-url"><span data-toggle="tooltip" title="<?php echo $help_type_seo_url; ?>"><?php echo $entry_type_seo_url; ?></span></label>
	  <div class="col-sm-6">
		<select name="type_seo_url" id="input-type-seo-url" class="form-control">
		  <option value="none"><?php echo $text_no_overwrite; ?></option>
		  <option value="yes"><?php echo $text_overwrite; ?></option>
		</select>
	  </div>
	  <label class="col-sm-2 control-label" for="input-seo-url-suffix"><span data-toggle="tooltip" title="<?php echo $help_seo_suffix; ?>"><?php echo $entry_seo_url_suffix; ?></span></label>
	  <div class="col-sm-2">
		<input type="text" name="seo_url_suffix" value="" placeholder="<?php echo $entry_seo_url_suffix; ?>" id="input-seo-url-suffix" class="form-control" />
	  </div>
	</div>
  </form>
</div>
<div class="modal-footer">
  <div class="text-center"><a data-form="form-mass-product-seourl" class="button-save btn btn-info btn-lg"><?php echo $button_save; ?></a></div>
</div>
<script type="text/javascript"><!--
$(".button-save").on('click', function(){		
	$.ajax({
		url: $('#' + $(this).data('form')).attr('action'),
		type: 'post',
		dataType: 'json',
		data: $('#product-list input[type=\'checkbox\']:checked, #' + $(this).data('form') + ' input[type=\'text\'], #' + $(this).data('form') + ' select'),
		success: function(json) {				
			if (json['error']) {
				$('#form-mass-product-seourl').before('<div class="alert alert-danger"><i class="fa fa-exclamation-circle"></i> ' + json['error'] + '</div>');
				
				$('.alert-danger').delay(1500).fadeOut(500);	
			}
								
			if (json['success']) {
				$('#form-mass-product-seourl').before('<div class="alert alert-success"><i class="fa fa-check-circle"></i> ' + json['success'] + '</div>');	
				
				setTimeout(function(){
					$('#modal-product-edit').modal('hide');
				}, 1000)
			}
		}
	});
});  
//--></script>
<script type="text/javascript"><!--
$('#form-mass-product-seourl select[name=\'seo_url_generator\']').on('change', function() {
	if ($('#form-mass-product-seourl select[name=\'seo_url_generator\']').val() == 'custom') {
		$('#seo-url-custom').removeClass('hidden');
	} else {
		$('#seo-url-custom').addClass('hidden');
	}
});
//--></script>