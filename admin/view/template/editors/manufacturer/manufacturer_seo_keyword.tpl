<div class="modal-header">
  <button type="button" class="pull-right btn btn-danger btn-sm" data-dismiss="modal" aria-hidden="true"><i class="fa fa-close"></i></button>
  <h4 class="modal-title"><?php echo $manufacturer_name; ?> - <?php echo $text_seo_keyword; ?></h4>
</div>
<div class="modal-body">
  <form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data" id="form-seo-keyword-manufacturer" class="form-horizontal">	
	<?php if (!$keyword) { ?>
	  <div class="form-group">
		<label class="col-sm-2 control-label"><span data-toggle="tooltip" title="<?php echo $help_auto_keyword; ?>"><?php echo $entry_auto_keyword; ?></span></label>
		<div class="col-sm-10">
		  <select name="auto_keyword_manufacturer" class="form-control" id="auto-keyword-manufacturer">
			<option value="1" selected="selected"><?php echo $text_yes; ?></option>
            <option value="0"><?php echo $text_no; ?></option>
		  </select>
		</div>
	  </div>
	  <?php } else { ?>
	  <div class="hide">
		<select name="auto_keyword_manufacturer" class="form-control">
		  <option value="0" selected="selected"><?php echo $text_no; ?></option>
          <option value="1"><?php echo $text_yes; ?></option>
		</select>
	  </div>
	<?php } ?>
	<div class="form-group" id="seo-url-customs">
      <label class="col-sm-2 control-label" for="input-keyword"><span data-toggle="tooltip" title="<?php echo $help_keyword; ?>"><?php echo $entry_keyword; ?></span></label>
      <div class="col-sm-10">
        <input type="text" name="keyword" value="<?php echo $keyword; ?>" placeholder="<?php echo $entry_keyword; ?>" id="input-keyword" class="form-control" />
      </div>
    </div>
  </form>
</div>
<div class="modal-footer">
  <div class="text-center"><a data-form="form-seo-keyword-manufacturer" class="button-save btn btn-info btn-lg"><?php echo $button_save; ?></a></div>
</div>
<script type="text/javascript"><!--
$(".button-save").on('click', function(){
	$.ajax({
		url: $('#' + $(this).data('form')).attr('action'),
		type: 'post',
		dataType: 'json',
		data: $('#' + $(this).data('form') + ' input[type=\'text\'], #' + $(this).data('form') + ' select'),
		success: function(json) {
			if (json['error']) {
				$('#form-seo-keyword-manufacturer').before('<div class="alert alert-danger"><i class="fa fa-exclamation-circle"></i> ' + json['error'] + '</div>');
				
				$('.alert-danger').delay(1500).fadeOut(500);
			}
									
			if (json['success']) {
				$('#form-seo-keyword-manufacturer').before('<div class="alert alert-success"><i class="fa fa-exclamation-circle"></i> ' + json['success'] + '</div>');			
									
				setTimeout(function(){
					$('#modal-manufacturer-edit').modal('hide');
				}, 1000)
			}
		}
	});
}); 

var selectAutoSeo = $('#auto-keyword-manufacturer');
	
function selectAutoSeoStatus(){
	if (selectAutoSeo.val() == '1') {
		$('#seo-url-customs').addClass('hide');
	} else {
		$('#seo-url-customs').removeClass('hide');
	}
}	
selectAutoSeoStatus();
		
selectAutoSeo.on('change', function() {
	if (selectAutoSeo.val() == '1') {
		$('#seo-url-customs').addClass('hide');
	} else {
		$('#seo-url-customs').removeClass('hide');
	}
});  
//--></script>