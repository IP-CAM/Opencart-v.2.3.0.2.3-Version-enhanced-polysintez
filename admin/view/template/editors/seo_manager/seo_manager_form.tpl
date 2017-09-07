<div class="modal-header">
  <button type="button" class="pull-right btn btn-danger btn-sm" data-dismiss="modal" aria-hidden="true"><i class="fa fa-close"></i></button>
  <h4 class="modal-title"><?php echo $text_form; ?></h4>
</div>
<div class="modal-body">
  <form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data" id="form-url-alias" class="form-horizontal">
	<div class="form-group required">
      <label class="col-sm-2 control-label" for="input-query"><span data-toggle="tooltip" title="<?php echo $help_query; ?>"><?php echo $entry_query; ?></span></label>
      <div class="col-sm-10">
        <input type="text" name="query" value="<?php echo $query; ?>" placeholder="<?php echo $entry_query; ?>" id="input-query" class="form-control" />
      </div>
    </div>
	<div class="form-group">
      <label class="col-sm-2 control-label" for="input-keyword"><span data-toggle="tooltip" title="<?php echo $help_keyword; ?>"><?php echo $entry_keyword; ?></span></label>
      <div class="col-sm-10">
        <input type="text" name="keyword" value="<?php echo $keyword; ?>" placeholder="<?php echo $entry_keyword; ?>" id="input-keyword" class="form-control" />
      </div>
    </div>
  </form>
</div>
<div class="modal-footer">
  <div class="text-center"><a data-form="form-url-alias" class="button-save btn btn-info btn-lg"><?php echo $button_save; ?></a></div>
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
				$('#form-url-alias').before('<div class="alert alert-danger"><i class="fa fa-exclamation-circle"></i> ' + json['error'] + '</div>');
				
				$('.alert-danger').delay(1500).fadeOut(500);
			}
			
			if (json['success']) {
				$('#form-url-alias').before('<div class="alert alert-success"><i class="fa fa-exclamation-circle"></i> ' + json['success'] + '</div>');			
									
				setTimeout(function(){			
					location.reload(true);
				}, 500);
			}
		}
	});
});   
//--></script>