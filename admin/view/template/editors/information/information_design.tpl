<div class="modal-header">
  <button type="button" class="pull-right btn btn-danger btn-sm" data-dismiss="modal" aria-hidden="true"><i class="fa fa-close"></i></button>
  <h4 class="modal-title"><?php echo $information_title; ?> - <?php echo $text_design; ?></h4>
</div>
<div class="modal-body">
  <form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data" id="form-design-information" class="form-horizontal">
	<div class="table-responsive">
	  <table class="table table-bordered table-hover">
        <thead>
          <tr>
            <td class="text-left"><?php echo $entry_store; ?></td>
            <td class="text-left"><?php echo $entry_layout; ?></td>
          </tr>
        </thead>
        <tbody>
          <tr>
            <td class="text-left"><?php echo $text_default; ?></td>
            <td class="text-left">
			  <select name="information_layout[0]" class="form-control">
                <option value=""></option>
                <?php foreach ($layouts as $layout) { ?>
                  <?php if (isset($information_layout[0]) && $information_layout[0] == $layout['layout_id']) { ?>
                    <option value="<?php echo $layout['layout_id']; ?>" selected="selected"><?php echo $layout['name']; ?></option>
                    <?php } else { ?>
                    <option value="<?php echo $layout['layout_id']; ?>"><?php echo $layout['name']; ?></option>
                  <?php } ?>
                <?php } ?>
              </select>
			</td>
          </tr>
          <?php foreach ($stores as $store) { ?>
            <tr>
              <td class="text-left"><?php echo $store['name']; ?></td>
              <td class="text-left">
			    <select name="information_layout[<?php echo $store['store_id']; ?>]" class="form-control">
                  <option value=""></option>
                  <?php foreach ($layouts as $layout) { ?>
                    <?php if (isset($information_layout[$store['store_id']]) && $information_layout[$store['store_id']] == $layout['layout_id']) { ?>
                      <option value="<?php echo $layout['layout_id']; ?>" selected="selected"><?php echo $layout['name']; ?></option>
                      <?php } else { ?>
                      <option value="<?php echo $layout['layout_id']; ?>"><?php echo $layout['name']; ?></option>
                    <?php } ?>
                  <?php } ?>
                </select>
			  </td>
            </tr>
          <?php } ?>
         </tbody>
      </table>
    </div>
  </form>
</div>
<div class="modal-footer">
  <div class="text-center"><a data-form="form-design-information" class="button-save btn btn-info btn-lg"><?php echo $button_save; ?></a></div>
</div>
<script type="text/javascript"><!--
$(".button-save").on('click', function(){
	$.ajax({
		url: $('#' + $(this).data('form')).attr('action'),
		type: 'post',
		dataType: 'json',
		data: $('#' + $(this).data('form') + ' select'),
		success: function(json) {
			if (json['error']) {
				$('#form-design-information').before('<div class="alert alert-danger"><i class="fa fa-exclamation-circle"></i> ' + json['error'] + '</div>');
				
				$('.alert-danger').delay(1500).fadeOut(500);
			}
									
			if (json['success']) {
				$('#form-design-information').before('<div class="alert alert-success"><i class="fa fa-check-circle"></i> ' + json['success'] + '</div>');				
									
				setTimeout(function(){
					$('#modal-information-edit').modal('hide');
				}, 1000)
			}
		}
	});
});   
//--></script>