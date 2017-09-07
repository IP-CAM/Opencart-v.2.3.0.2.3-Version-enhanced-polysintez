 <?php if ($openmodal) { ?>
 <div class="modal fade" id="form<?php echo $code; ?>Modal" tabindex="-1" role="dialog" aria-labelledby="form<?php echo $code; ?>ModalLabel">
    <?php if ($window_size != 0) { ?>
        <div class="modal-dialog <?php echo $window_size == 1 ? 'modal-lg' : 'modal-sm'; ?>" role="document">
     <?php } else { ?>
        <div class="modal-dialog" role="document">
      <?php } ?>
      <div class="modal-content">
       <?php } ?>
        <div class="modal-header">
         <?php if ($openmodal) { ?>
            <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
         <?php } ?>
          <h4 class="modal-title" id="form<?php echo $code; ?>ModalLabel"><?php echo $title; ?></h4>
        </div>
        <div class="modal-body">
          <form style="position: relative;" class="form-horizontal" id="form<?php echo $code; ?>Form">
          <?php foreach ($custom_fields as $key=>$custom_field) { ?>
          <?php if ($columns) { ?>
            <?php if ($key == 0) { ?>
                <div class="row">
                <div class="col-sm-<?php echo round(12/$columns); ?>">
            <?php } ?>
          <?php } ?>
           <?php 
                $label_style = "";
                if ($custom_field['titleview'] == 7) {
                  $label_class = "hide control-label";
                  $input_class = "col-sm-12";
                }
                elseif ($custom_field['titleview'] == 1) {
                  $label_class = "col-sm-1 control-label";
                  $input_class = "col-sm-11";
                }
                elseif ($custom_field['titleview'] == 2) {
                  $label_class = "col-sm-2 control-label";
                  $input_class = "col-sm-10";
                }
                elseif ($custom_field['titleview'] == 3) {
                  $label_class = "col-sm-3 control-label";
                  $input_class = "col-sm-9";
                }
                elseif ($custom_field['titleview'] == 4) {
                  $label_class = "col-sm-4 control-label";
                  $input_class = "col-sm-8";
                }
                elseif ($custom_field['titleview'] == 5) {
                  $label_class = "col-sm-5 control-label";
                  $input_class = "col-sm-7";
                }
                elseif ($custom_field['titleview'] == 6) {
                  $label_class = "col-sm-6 control-label";
                  $input_class = "col-sm-6";
                }
                elseif ($custom_field['titleview'] == 0) {
                  $label_class = "control-label";
                  $input_class = "col-sm-12";
                  $label_style = "margin-left:15px";
                }
              ?>
          <?php if ($custom_field['type'] == 'select') { ?>
            <div id="custom-field<?php echo $custom_field['custom_field_id']; ?>" class="form-group custom-field<?php echo $custom_field['required'] ? ' required' : ''; ?>" data-sort="<?php echo $custom_field['sort_order']; ?>">
             
              <label class="<?php echo $label_class; ?>" <?php echo $label_style == '' ? '' : 'style="' . $label_style . '"'; ?> for="input-custom-field<?php echo $custom_field['custom_field_id']; ?>"><?php echo $custom_field['name']; ?></label>
              <div class="<?php echo $input_class; ?>">
                <select name="custom_field[<?php echo $code; ?>][<?php echo $custom_field['custom_field_id']; ?>]" id="input-custom-field<?php echo $custom_field['custom_field_id']; ?>" class="form-control">
                  <option value=""><?php echo $text_select; ?></option>
                  <?php foreach ($custom_field['custom_field_value'] as $custom_field_value) { ?>
                  <option value="<?php echo $custom_field_value['custom_field_value_id']; ?>"><?php echo $custom_field_value['name']; ?></option>
                  <?php } ?>
                </select>
              </div>
            </div>
          <?php } ?>
          <?php if ($custom_field['type'] == 'radio') { ?>
          <div id="custom-field<?php echo $custom_field['custom_field_id']; ?>" class="form-group custom-field<?php echo $custom_field['required'] ? ' required' : ''; ?>" data-sort="<?php echo $custom_field['sort_order']; ?>">
            <label class="<?php echo $label_class; ?>" <?php echo $label_style == '' ? '' : 'style="' . $label_style . '"'; ?>><?php echo $custom_field['name']; ?></label>
            <div class="<?php echo $input_class; ?>">
              <div id="input-custom-field<?php echo $custom_field['custom_field_id']; ?>">
                <?php foreach ($custom_field['custom_field_value'] as $custom_field_value) { ?>
                <div class="<?php echo $custom_field['inline'] ? "radio-inline" : "radio" ?>">
                  <label>
                    <input type="radio" name="custom_field[<?php echo $code; ?>][<?php echo $custom_field['custom_field_id']; ?>]" value="<?php echo $custom_field_value['custom_field_value_id']; ?>" />
                    <?php echo $custom_field_value['name']; ?></label>
                </div>
                <?php } ?>
              </div>
            </div>
          </div>
          <?php } ?>
          <?php if ($custom_field['type'] == 'checkbox') { ?>
          <div id="custom-field<?php echo $custom_field['custom_field_id']; ?>" class="form-group custom-field<?php echo $custom_field['required'] ? ' required' : ''; ?>" data-sort="<?php echo $custom_field['sort_order']; ?>">
            <label class="<?php echo $label_class; ?>" <?php echo $label_style == '' ? '' : 'style="' . $label_style . '"'; ?>><?php echo $custom_field['name']; ?></label>
            <div class="<?php echo $input_class; ?>">
              <div id="input-custom-field<?php echo $custom_field['custom_field_id']; ?>">
                <?php foreach ($custom_field['custom_field_value'] as $custom_field_value) { ?>
                <div class="<?php echo $custom_field['inline'] ? "checkbox-inline" : "checkbox" ?>">
                  <label>
                    <input type="checkbox" name="custom_field[<?php echo $code; ?>][<?php echo $custom_field['custom_field_id']; ?>][]" value="<?php echo $custom_field_value['custom_field_value_id']; ?>" />
                    <?php echo $custom_field_value['name']; ?></label>
                </div>
                <?php } ?>
              </div>
            </div>
          </div>
          <?php } ?>
          <?php if ($custom_field['type'] == 'text') { ?>
          <div id="custom-field<?php echo $custom_field['custom_field_id']; ?>" class="form-group custom-field<?php echo $custom_field['required'] ? ' required' : ''; ?>" data-sort="<?php echo $custom_field['sort_order']; ?>">
            <label class="<?php echo $label_class; ?>" <?php echo $label_style == '' ? '' : 'style="' . $label_style . '"'; ?> for="input-custom-field<?php echo $custom_field['custom_field_id']; ?>"><?php echo $custom_field['name']; ?></label>
            <div class="<?php echo $input_class; ?>">
              <input type="text" name="custom_field[<?php echo $code; ?>][<?php echo $custom_field['custom_field_id']; ?>]" value="<?php echo $custom_field['value']; ?>" placeholder="<?php echo $custom_field['placeholder']; ?>" id="input-custom-field<?php echo $custom_field['custom_field_id']; ?>" class="form-control" />
            </div>
          </div>
          <?php } ?>
          <?php if ($custom_field['type'] == 'textarea') { ?>
          <div id="custom-field<?php echo $custom_field['custom_field_id']; ?>" class="form-group custom-field<?php echo $custom_field['required'] ? ' required' : ''; ?>" data-sort="<?php echo $custom_field['sort_order']; ?>">
            <label class="<?php echo $label_class; ?>" <?php echo $label_style == '' ? '' : 'style="' . $label_style . '"'; ?> for="input-custom-field<?php echo $custom_field['custom_field_id']; ?>"><?php echo $custom_field['name']; ?></label>
            <div class="<?php echo $input_class; ?>">
              <textarea name="custom_field[<?php echo $code; ?>][<?php echo $custom_field['custom_field_id']; ?>]" rows="5" placeholder="<?php echo $custom_field['placeholder']; ?>" id="input-custom-field<?php echo $custom_field['custom_field_id']; ?>" class="form-control"><?php echo $custom_field['value']; ?></textarea>
            </div>
          </div>
          <?php } ?>
          <?php if ($custom_field['type'] == 'file') { ?>
          <div id="custom-field<?php echo $custom_field['custom_field_id']; ?>" class="form-group custom-field<?php echo $custom_field['required'] ? ' required' : ''; ?>" data-sort="<?php echo $custom_field['sort_order']; ?>">
            <label class="<?php echo $label_class; ?>" <?php echo $label_style == '' ? '' : 'style="' . $label_style . '"'; ?>><?php echo $custom_field['name']; ?></label>
            <div class="<?php echo $input_class; ?>">
              <div id="input-custom-field<?php echo $custom_field['custom_field_id']; ?>">
                <button type="button" id="form-<?php echo $code; ?>-button-custom-field<?php echo $custom_field['custom_field_id']; ?>" data-loading-text="<?php echo $text_loading; ?>" class="btn btn-default"><i class="fa fa-upload"></i> <?php echo $button_upload; ?></button>
                <input type="hidden" name="custom_field[<?php echo $code; ?>][<?php echo $custom_field['custom_field_id']; ?>]" value="" />
              </div>
            </div>
          </div>
          <?php } ?>
          <?php if ($custom_field['type'] == 'date') { ?>
          <div id="custom-field<?php echo $custom_field['custom_field_id']; ?>" class="form-group custom-field<?php echo $custom_field['required'] ? ' required' : ''; ?>" data-sort="<?php echo $custom_field['sort_order']; ?>">
            <label class="<?php echo $label_class; ?>" <?php echo $label_style == '' ? '' : 'style="' . $label_style . '"'; ?> for="input-custom-field<?php echo $custom_field['custom_field_id']; ?>"><?php echo $custom_field['name']; ?></label>
            <div class="<?php echo $input_class; ?>">
              <div class="input-group date">
                <input type="text" name="custom_field[<?php echo $code; ?>][<?php echo $custom_field['custom_field_id']; ?>]" value="<?php echo $custom_field['value']; ?>" placeholder="<?php echo $custom_field['placeholder']; ?>" data-date-format="YYYY-MM-DD" id="input-custom-field<?php echo $custom_field['custom_field_id']; ?>" class="form-control" />
                <span class="input-group-btn">
                <button type="button" class="btn btn-default"><i class="fa fa-calendar"></i></button>
                </span></div>
            </div>
          </div>
          <?php } ?>
          <?php if ($custom_field['type'] == 'time') { ?>
          <div id="custom-field<?php echo $custom_field['custom_field_id']; ?>" class="form-group custom-field<?php echo $custom_field['required'] ? ' required' : ''; ?>" data-sort="<?php echo $custom_field['sort_order']; ?>">
            <label class="<?php echo $label_class; ?>" <?php echo $label_style == '' ? '' : 'style="' . $label_style . '"'; ?> for="input-custom-field<?php echo $custom_field['custom_field_id']; ?>"><?php echo $custom_field['name']; ?></label>
            <div class="<?php echo $input_class; ?>">
              <div class="input-group time">
                <input type="text" name="custom_field[<?php echo $code; ?>][<?php echo $custom_field['custom_field_id']; ?>]" value="<?php echo $custom_field['value']; ?>" placeholder="<?php echo $custom_field['placeholder']; ?>" data-date-format="HH:mm" id="input-custom-field<?php echo $custom_field['custom_field_id']; ?>" class="form-control" />
                <span class="input-group-btn">
                <button type="button" class="btn btn-default"><i class="fa fa-calendar"></i></button>
                </span></div>
            </div>
          </div>
          <?php } ?>
          <?php if ($custom_field['type'] == 'datetime') { ?>
          <div id="custom-field<?php echo $custom_field['custom_field_id']; ?>" class="form-group custom-field<?php echo $custom_field['required'] ? ' required' : ''; ?>" data-sort="<?php echo $custom_field['sort_order']; ?>">
            <label class="<?php echo $label_class; ?>" <?php echo $label_style == '' ? '' : 'style="' . $label_style . '"'; ?> for="input-custom-field<?php echo $custom_field['custom_field_id']; ?>"><?php echo $custom_field['name']; ?></label>
            <div class="<?php echo $input_class; ?>">
              <div class="input-group datetime">
                <input type="text" name="custom_field[<?php echo $code; ?>][<?php echo $custom_field['custom_field_id']; ?>]" value="<?php echo $custom_field['value']; ?>" placeholder="<?php echo $custom_field['placeholder']; ?>" data-date-format="YYYY-MM-DD HH:mm" id="input-custom-field<?php echo $custom_field['custom_field_id']; ?>" class="form-control" />
                <span class="input-group-btn">
                <button type="button" class="btn btn-default"><i class="fa fa-calendar"></i></button>
                </span></div>
            </div>
          </div>
          <?php } ?>
          <?php if ($custom_field['type'] == 'google_captcha') { ?>
          <script src="//www.google.com/recaptcha/api.js" type="text/javascript"></script>
          <style>
          .g-recaptcha{
            transform:scale(0.77) !important;
            -webkit-transform:scale(0.77) !important;
            transform-origin:0 0 !important;
            -webkit-transform-origin:0 0 !important;
          }
          </style>
          <div id="custom-field<?php echo $custom_field['custom_field_id']; ?>" class="form-group custom-field required" data-sort="<?php echo $custom_field['sort_order']; ?>">
            <label class="<?php echo $label_class; ?>" <?php echo $label_style == '' ? '' : 'style="' . $label_style . '"'; ?>><?php echo $custom_field['name']; ?></label>
            <div class="<?php echo $input_class; ?>">
            <div class="input-group">
              <div class="g-recaptcha" data-sitekey="<?php echo $site_key; ?>" id="input-custom-field<?php echo $custom_field['custom_field_id']; ?>"></div>
            </div>
            </div>
          </div>
          <?php } ?>
          <?php if ($columns) { ?>
            <?php if (($key+1) % round(count($custom_fields)/$columns) == 0) { ?>
                </div>
                <div class="col-sm-<?php echo round(12/$columns); ?>">
            <?php } ?>  
          <?php } ?>
          <?php } ?>
          <?php if ($columns) { ?>
            </div>
            </div>
          <?php } ?>
          <input type="hidden" name="code" value="<?php echo $code; ?>"/>
          <input type="hidden" id="postpage" name="post_page" value=""/>
          </form>

        </div>
        <div class="modal-footer">
          <button id="form<?php echo $code; ?>Button" type="button"  data-loading-text="<?php echo $title_button; ?>" class="btn btn-primary"><?php echo $title_button; ?></button>
        </div>
         <?php if ($openmodal) { ?>
      </div>
    </div>
  </div>
  <?php } ?>
  <script type="text/javascript"><!--
	$('.date').datetimepicker({
		pickTime: false,
		direction: 'bottom'
	});

	$('.datetime').datetimepicker({
		pickDate: true,
		pickTime: true,
		direction: 'bottom'
	});

	$('.time').datetimepicker({
		pickDate: false,
		direction: 'bottom'
	});
	//--></script>

  <script type="text/javascript"><!--
  $('button[id^=\'form-<?php echo $code; ?>-button-custom-field\']').on('click', function() {
    var node = this;

    $('#form-upload').remove();

    $('body').prepend('<form enctype="multipart/form-data" id="form-upload" style="display: none;"><input type="file" name="file" /></form>');

    $('#form-upload input[name=\'file\']').trigger('click');

    if (typeof timer != 'undefined') {
        clearInterval(timer);
    }

    timer = setInterval(function() {
      if ($('#form-upload input[name=\'file\']').val() != '') {
        clearInterval(timer);

        $.ajax({
          url: 'index.php?route=tool/upload',
          type: 'post',
          dataType: 'json',
          data: new FormData($('#form-upload')[0]),
          cache: false,
          contentType: false,
          processData: false,
          beforeSend: function() {
            $(node).button('loading');
          },
          complete: function() {
            $(node).button('reset');
          },
          success: function(json) {
            $(node).parent().find('.text-danger').remove();

            if (json['error']) {
              $(node).parent().find('input').after('<div class="text-danger">' + json['error'] + '</div>');
            }

            if (json['success']) {
              alert(json['success']);

              $(node).parent().find('input').val(json['code']);
            }
          },
          error: function(xhr, ajaxOptions, thrownError) {
            alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
          }
        });
      }
    }, 500);
  });
  //--></script>
  <script type="text/javascript"><!--
  $('#form<?php echo $code; ?>Button').on('click', function() {
    $('#postpage').val(document.location);
    $.ajax({
      url: 'index.php?route=extension/module/form2304/mail',
      type: 'post',
      data: $('#form<?php echo $code; ?>Form').serialize(),
      dataType: 'json',
      beforeSend: function() {
        $('#form<?php echo $code; ?>Button').button('loading');
      },
      complete: function() {
        $('#form<?php echo $code; ?>Button').button('reset');
      },
      success: function(json) {
        $('#form<?php echo $code; ?>Form .alert, .text-danger').remove();
        $('.form-group').removeClass('has-error');

        if (json['success']) {
            var modalfooter = $('#form<?php echo $code; ?>Button').parent();
            <?php if (isset($timeout) && $timeout>0) { ?>
              var sec = <?php echo ($timeout); ?>-1;
              $(modalfooter).html('<div class="alert alert-success pull-right" style="margin-bottom:0; padding:6px 14px 6px 14px;"><i class="fa fa-check-circle"></i> ' + json['success']['message'][<?php echo $language_code; ?>]['name'] + '<?php echo ($timeout > 0 ? '. ' . $form_close . ' ' . $timeout . ' ' . $sec : ''); ?></div>');
              <?php if ($timeout>0) { ?>
                var intervalID = setInterval(function(){
                  $(modalfooter).html('<div class="alert alert-success pull-right" style="margin-bottom:0; padding:6px 14px 6px 14px;"><i class="fa fa-check-circle"></i> ' + json['success']['message'][<?php echo $language_code; ?>]['name'] + '<?php echo '. ' . $form_close . ' '; ?>' + sec + '<?php echo ' ' . $sec; ?></div>');
                  sec = sec - 1;
                  if (sec <= 0) {
                  window.clearInterval(intervalID);
                  }
                }, 1000);
                setTimeout(function(){
                  $('#form<?php echo $code; ?>Modal').modal('hide');
                  $(modalfooter).html('<div class="alert alert-success pull-right" style="margin-bottom:0; padding:6px 14px 6px 14px;"><i class="fa fa-check-circle"></i> ' + json['success']['message'][<?php echo $language_code; ?>]['name'] + '</div>');
                  if (json['success']['redirect']) {
                    window.location.href = json['success']['redirect'];
                  }
                }, 3000);
              <?php } ?>
            <?php } else { ?>
              $(modalfooter).html('<div class="alert alert-success pull-right" style="margin-bottom:0; padding:6px 14px 6px 14px;"><i class="fa fa-check-circle"></i> ' + json['success']['message'][<?php echo $language_code; ?>]['name'] + '</div>');
            <?php } ?>
        } else if (json['error']) {
          for (i in json['error']) {
            var element = $('#input-' + i.replace('_', '-'));

            if ($(element).parent().hasClass('input-group')) {
              $(element).parent().after('<div class="text-danger">' + json['error'][i] + '</div>');
            } else {
              $(element).after('<div class="text-danger">' + json['error'][i] + '</div>');
            }
          }
          $('.text-danger').parent().parent().addClass('has-error');
        }
      },
      error: function(xhr, ajaxOptions, thrownError) {
        alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
      }
    });
  });

  //--></script>