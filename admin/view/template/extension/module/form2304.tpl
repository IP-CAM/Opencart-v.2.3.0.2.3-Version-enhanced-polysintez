<?php echo $header; ?><?php echo $column_left; ?>
<div id="content">
  <div class="page-header">
    <div class="container-fluid">
      <div class="pull-right">
        <button type="submit" form="form-form2304" data-toggle="tooltip" title="<?php echo $button_save; ?>" class="btn btn-primary"><i class="fa fa-save"></i></button>
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
        <ul class="nav nav-tabs" role="tablist">
          <li class="active">
            <a href="#settings" data-toggle="tab"><?php echo $entry_settings; ?></a>
          </li>
          <li<?php echo isset($module_id) ? '' : ' class="disabled"'; ?>>
            <a href="#layouts" data-toggle="tab"><?php echo $entry_layouts; ?></a>
          </li>
            <?php $mainLang = 1; 
            foreach ($languages as $language) { 
              $mainLang = $language['language_id'];
            } ?>
            
           <?php foreach ($formfields as $key=>$formfield) { ?>
            <li id = "li<?php echo $key; ?>"><a href="#field_<?php echo $key; ?>" data-toggle="tab"><?php echo ($formfield['custom_field_description'][$mainLang]['name'] != '') ? $formfield['custom_field_description'][$mainLang]['name'] : $entry_field . ' ' . $key; ?><button style="margin-left:10px" type="button" class="close" aria-label="Close"><span>×</span></button></a></li>
          <?php } ?>
          <li><a href="#" class="add-field"><?php echo $entry_add_field; ?></a>
        </ul>
        <form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data" id="form-form2304" class="form-horizontal">
          
        <div class="tab-content">
          <div class="tab-pane active" id="settings">
            <div class="form-group">
                <label class="col-sm-2 control-label" for="input-name"><?php echo $entry_name; ?></label>
                <div class="col-sm-10">
                  <input type="text" name="name" value="<?php echo $name; ?>" placeholder="<?php echo $entry_name; ?>" id="input-name" class="form-control" />
                  <?php if ($error_name) { ?>
                  <div class="text-danger"><?php echo $error_name; ?></div>
                  <?php } ?>
                </div>
              </div>
              <div class="form-group">
                <label class="col-sm-2 control-label" for="input-title"><?php echo $entry_title; ?></label>
                <div class="col-sm-10">
                <?php foreach ($languages as $language) { ?>
                  <div class="input-group"><span class="input-group-addon"><img src="language/<?php echo $language['code']; ?>/<?php echo $language['code']; ?>.png" title="<?php echo $language['name']; ?>" /></span>
                    <input type="text" name="title[<?php echo $language['language_id']; ?>][name]" value="<?php echo isset($title[$language['language_id']]) ? $title[$language['language_id']]['name'] : ''; ?>" placeholder="<?php echo $entry_title; ?>" class="form-control" />
                  </div>
                  <?php if (isset($error_title[$language['language_id']])) { ?>
                  <div class="text-danger"><?php echo $error_title[$language['language_id']]; ?></div>
                  <?php } ?>
                  <?php } ?>
                </div>
              </div>
              <div class="form-group">
                <label class="col-sm-2 control-label" for="input-title-button"><?php echo $entry_title_button; ?></label>
                <div class="col-sm-10">
                <?php foreach ($languages as $language) { ?>
                  <div class="input-group"><span class="input-group-addon"><img src="language/<?php echo $language['code']; ?>/<?php echo $language['code']; ?>.png" title="<?php echo $language['name']; ?>" /></span>
                    <input type="text" name="title_button[<?php echo $language['language_id']; ?>][name]" value="<?php echo isset($title_button[$language['language_id']]) ? $title_button[$language['language_id']]['name'] : ''; ?>" placeholder="<?php echo $entry_title_button; ?>" class="form-control" />
                  </div>
                  <?php if (isset($error_title_button[$language['language_id']])) { ?>
                  <div class="text-danger"><?php echo $error_title_button[$language['language_id']]; ?></div>
                  <?php } ?>
                  <?php } ?>
                </div>
              </div>
              <div class="form-group">
                <label class="col-sm-2 control-label" for="input-message"><?php echo $entry_message; ?></label>
                <div class="col-sm-10">
                <?php foreach ($languages as $language) { ?>
                  <div class="input-group"><span class="input-group-addon"><img src="language/<?php echo $language['code']; ?>/<?php echo $language['code']; ?>.png" title="<?php echo $language['name']; ?>" /></span>
                    <input type="text" name="message[<?php echo $language['language_id']; ?>][name]" value="<?php echo isset($message[$language['language_id']]) ? $message[$language['language_id']]['name'] : ''; ?>" placeholder="<?php echo $entry_message; ?>" class="form-control" />
                  </div>
                  <?php if (isset($error_message[$language['language_id']])) { ?>
                  <div class="text-danger"><?php echo $error_message[$language['language_id']]; ?></div>
                  <?php } ?>
                  <?php } ?>
                </div>
              </div>
              <div class="form-group">
                <label class="col-sm-2 control-label" for="input-timeout"><?php echo $entry_openmodal; ?></label>
                <div class="col-sm-10">
                  <div class="checkbox">
                    <label>
                      <input type="checkbox" name="openmodal" value="" <?php echo ($openmodal ? 'checked="checked"' : ''); ?>/>
                    </label>
                  </div>
                </div>
              </div>
              <div class="form-group" id="window_size">
                <label class="col-sm-2 control-label" for="input-window-size"><?php echo $entry_window_size; ?></label>
                <div class="col-sm-10">
                  <select name="window_size" id="input-window-size" class="form-control">

                    <option value="0"<?php echo $window_size == 0 ? ' selected="selected"' : ''; ?>><?php echo $text_normal; ?></option>
                    <option value="1"<?php echo $window_size == 1 ? ' selected="selected"' : ''; ?>><?php echo $text_large; ?></option>
                    <option value="2"<?php echo $window_size == 2 ? ' selected="selected"' : ''; ?>><?php echo $text_small; ?></option>
                   
                  </select>
                </div>
              </div>
              <div class="form-group" id="buttons_code">
                <label class="col-sm-2 control-label"><?php echo $entry_buttons_code; ?></label>
                <div class="col-sm-10">
                  <label class="form-control"><?php echo $buttons_code; ?></label>
                </div>
              </div>
              <div class="form-group" id="a_code">
                <label class="col-sm-2 control-label"><?php echo $entry_a_code; ?></label>
                <div class="col-sm-10">
                  <label class="form-control"><?php echo $a_code; ?></label>
                </div>
              </div>
              <div class="form-group">
                <label class="col-sm-2 control-label" for="input-recivers"><span data-toggle="tooltip" title="<?php echo $help_recivers; ?>"><?php echo $entry_recivers; ?></span></label>
                <div class="col-sm-10">
                  <input type="text" name="recivers" value="<?php echo $recivers; ?>" placeholder="<?php echo $entry_recivers; ?>" id="input-recivers" class="form-control" />
                </div>
              </div>
              
              <div class="form-group">
                <label class="col-sm-2 control-label" for="input-redirect"><span data-toggle="tooltip" title="<?php echo $help_redirect; ?>"><?php echo $entry_redirect; ?></span></label>
                <div class="col-sm-10">
                  <input type="text" name="redirect" value="<?php echo $redirect; ?>" placeholder="<?php echo $entry_redirect; ?>" id="input-redirect" class="form-control" />
                </div>
              </div>
              <div class="form-group">
                <label class="col-sm-2 control-label" for="input-timeout"><?php echo $entry_timeout; ?></label>
                <div class="col-sm-10">
                  <input type="text" name="timeout" value="<?php echo $timeout; ?>" placeholder="<?php echo $entry_timeout; ?>" id="input-timeout" class="form-control" />
                </div>
              </div>
              <div class="form-group">
                <label class="col-sm-2 control-label" for="input-columns"><?php echo $entry_columns; ?></label>
                <div class="col-sm-10">
                  <input type="text" name="columns" value="<?php echo $columns; ?>" placeholder="<?php echo $entry_columns; ?>" id="input-columns" class="form-control" />
                </div>
              </div>
              
              <div class="form-group">
                <label class="col-sm-2 control-label" for="input-status"><?php echo $entry_status; ?></label>
                <div class="col-sm-10">
                  <select name="status" id="input-status" class="form-control">
                    <?php if ($status) { ?>
                    <option value="1" selected="selected"><?php echo $text_enabled; ?></option>
                    <option value="0"><?php echo $text_disabled; ?></option>
                    <?php } else { ?>
                    <option value="1"><?php echo $text_enabled; ?></option>
                    <option value="0" selected="selected"><?php echo $text_disabled; ?></option>
                    <?php } ?>
                  </select>
                </div>
              </div>
            </div>
            <div class="tab-pane" id="layouts">
              <?php foreach ($layouts as $poskey=>$position) { ?>
                <div class="form-group">
                  <?php if ($poskey=='column_left') { ?>
                    <label class="col-sm-2 control-label"><?php echo $text_column_left ; ?></label>
                  <?php } ?>
                  <?php if ($poskey=='content_top') { ?>
                    <label class="col-sm-2 control-label"><?php echo $text_content_top ; ?></label>
                  <?php } ?>
                  <?php if ($poskey=='content_bottom') { ?>
                    <label class="col-sm-2 control-label"><?php echo $text_content_bottom ; ?></label>
                  <?php } ?>
                  <?php if ($poskey=='column_right') { ?>
                    <label class="col-sm-2 control-label"><?php echo $text_column_right ; ?></label>
                  <?php } ?>
                    <div class="col-sm-10">
                      <div class="well well-sm" style="height: 150px; overflow: auto;">
                        <?php foreach ($position as $layout) { ?>
                        <div class="checkbox">
                          <label>
                            <?php if (in_array($layout['layout_id'], $layout_modules[$poskey])) { ?>
                            <input type="checkbox" name="layout[<?php echo $poskey; ?>][]" value="<?php echo $layout['layout_id']; ?>" checked="checked" />
                            <?php echo $layout['name']; ?>
                            <?php } else { ?>
                            <input type="checkbox" name="layout[<?php echo $poskey; ?>][]" value="<?php echo $layout['layout_id']; ?>" />
                            <?php echo $layout['name']; ?>
                            <?php } ?>
                          </label>
                        </div>
                        <?php } ?>
                      </div>
                      <a href="#" onclick="$(this).parent().find(':checkbox').prop('checked', true);return false;"><?php echo $text_select_all; ?></a> / <a href="#" onclick="$(this).parent().find(':checkbox').prop('checked', false);return false;"><?php echo $text_unselect_all; ?></a></div>
                  </div>
              <?php } ?>
            </div>
          <?php foreach ($formfields as $key=>$formfield) { ?>
            <div class="tab-pane" id="field_<?php echo $key; ?>">
            <div class="form-group required">
                <label class="col-sm-2 control-label"><?php echo $entry_field_name; ?></label>
                <div class="col-sm-10">
                <?php foreach ($languages as $language) { ?>
                  <div class="input-group"><span class="input-group-addon"><img src="language/<?php echo $language['code']; ?>/<?php echo $language['code']; ?>.png" title="<?php echo $language['name']; ?>" /></span>
                    <input type="text" name="formfields[<?php echo $key; ?>][custom_field_description][<?php echo $language['language_id']; ?>][name]" value="<?php echo isset($formfield['custom_field_description'][$language['language_id']]) ? $formfield['custom_field_description'][$language['language_id']]['name'] : ''; ?>" placeholder="<?php echo $entry_field_name; ?>" class="form-control" />
                  </div>
                  <?php if (isset($error_name[$language['language_id']])) { ?>
                  <div class="text-danger"><?php echo $error_name[$language['language_id']]; ?></div>
                  <?php } ?>
                  <?php } ?>
                </div>
              </div>
              <div class="form-group">
                <label class="col-sm-2 control-label" for="input-titleview' + id + '"><?php echo $entry_titleview; ?></label>
                <div class="col-sm-10">
                  <select name="formfields[<?php echo $key; ?>][titleview]" id="input-titleview' + id + '" class="form-control">
                    <option value="0"<?php echo ($formfield['titleview']==0 ? ' selected="selected"':''); ?>><?php echo $titleview_up; ?></option>
                    <option value="1"<?php echo ($formfield['titleview']==1 ? ' selected="selected"':''); ?>><?php echo $titleview_1; ?></option>
                    <option value="2"<?php echo ($formfield['titleview']==2 ? ' selected="selected"':''); ?>><?php echo $titleview_2; ?></option>
                    <option value="3"<?php echo ($formfield['titleview']==3 ? ' selected="selected"':''); ?>><?php echo $titleview_3; ?></option>
                    <option value="4"<?php echo ($formfield['titleview']==4 ? ' selected="selected"':''); ?>><?php echo $titleview_4; ?></option>
                    <option value="6"<?php echo ($formfield['titleview']==6 ? ' selected="selected"':''); ?>><?php echo $titleview_6; ?></option>
                    <option value="7"<?php echo ($formfield['titleview']==7 ? ' selected="selected"':''); ?>><?php echo $titleview_no; ?></option>
                  </select>
                </div>
              </div>
              <div class="form-group">
                <label class="col-sm-2 control-label" for="input-type"><?php echo $entry_type; ?></label>
                <div class="col-sm-10">
                  <select name="formfields[<?php echo $key; ?>][type]" id="input-type<?php echo $key; ?>" class="form-control">
                    <optgroup label="<?php echo $text_choose; ?>">
                    <option value="select"<?php echo ($formfield['type']=='select' ? ' selected="selected"':''); ?>><?php echo $text_select; ?></option>
                    <option value="radio"<?php echo ($formfield['type']=='radio' ? ' selected="selected"':''); ?>><?php echo $text_radio; ?></option>
                    <option value="checkbox"<?php echo ($formfield['type']=='checkbox' ? ' selected="selected"':''); ?>><?php echo $text_checkbox; ?></option>
                    </optgroup>
                    <optgroup label="<?php echo $text_input; ?>">
                    <option value="text"<?php echo ($formfield['type']=='text' ? ' selected="selected"':''); ?>><?php echo $text_text; ?></option>
                    <option value="textarea"<?php echo ($formfield['type']=='textarea' ? ' selected="selected"':''); ?>><?php echo $text_textarea; ?></option>
                    </optgroup>
                    <optgroup label="<?php echo $text_file; ?>">
                    <option value="file"<?php echo ($formfield['type']=='file' ? ' selected="selected"':''); ?>><?php echo $text_file; ?></option>
                    </optgroup>
                    <optgroup label="<?php echo $text_date; ?>">
                    <option value="date"<?php echo ($formfield['type']=='date' ? ' selected="selected"':''); ?>><?php echo $text_date; ?></option>
                    <option value="time"<?php echo ($formfield['type']=='time' ? ' selected="selected"':''); ?>><?php echo $text_time; ?></option>
                    <option value="datetime"<?php echo ($formfield['type']=='datetime' ? ' selected="selected"':''); ?>><?php echo $text_datetime; ?></option>
                    </optgroup>
                    <optgroup label="<?php echo $entry_captcha; ?>">
                      <?php foreach ($captchas as $captcha) { ?>
                      <?php if ($captcha['value'] != 'google_captcha') continue; ?>
                      <?php if ($captcha['value'] == $formfield['type']) { ?>
                      <option value="<?php echo $captcha['value']; ?>" selected="selected"><?php echo $captcha['text']; ?></option>
                      <?php } else { ?>
                      <option value="<?php echo $captcha['value']; ?>"><?php echo $captcha['text']; ?></option>
                      <?php } ?>
                      <?php } ?>
                    </optgroup>
                  </select>
                </div>
              </div>
              <div class="form-group" id="display-value<?php echo $key; ?>">
                <label class="col-sm-2 control-label" for="input-value"><?php echo $entry_value; ?></label>
                <div class="col-sm-10">
                  <input type="text" name="formfields[<?php echo $key; ?>][value]" value="<?php echo isset($formfield['value']) ? $formfield['value'] : ''; ?>" placeholder="<?php echo $entry_value; ?>" id="input-value<?php echo $key; ?>" class="form-control" />
                </div>
              </div>
              <div class="form-group" id="placeholder<?php echo $key; ?>">
                <label class="col-sm-2 control-label" for="input-placeholder"><?php echo $entry_placeholder; ?></label>
                <div class="col-sm-10">
                  <?php foreach ($languages as $language) { ?>
                  <div class="input-group"><span class="input-group-addon"><img src="language/<?php echo $language['code']; ?>/<?php echo $language['code']; ?>.png" title="<?php echo $language['name']; ?>" /></span>
                    <input type="text" name="formfields[<?php echo $key; ?>][placeholder][<?php echo $language['language_id']; ?>][name]" value="<?php echo isset($formfield['placeholder'][$language['language_id']]) ? $formfield['placeholder'][$language['language_id']]['name'] : ''; ?>" placeholder="<?php echo $entry_placeholder; ?>" class="form-control" />
                  </div>
                  <?php if (isset($error_name[$language['language_id']])) { ?>
                  <div class="text-danger"><?php echo $error_name[$language['language_id']]; ?></div>
                  <?php } ?>
                  <?php } ?>
                </div>
              </div>
              <div class="form-group" id="display-validation<?php echo $key; ?>">
                <label class="col-sm-2 control-label" for="input-validation"><span data-toggle="tooltip" title="<?php echo $help_regex; ?>"><?php echo $entry_validation; ?></span></label>
                <div class="col-sm-10">
                  <input type="text" name="formfields[<?php echo $key; ?>][validation]" id="input-validation<?php echo $key; ?>" value="<?php echo isset($formfield['validation']) ? $formfield['validation'] : ''; ?>" placeholder="<?php echo $text_regex; ?>"  class="form-control"/>
                </div>
              </div>
              <div class="form-group" id="display-inline<?php echo $key; ?>">
                <label class="col-sm-2 control-label"><?php echo $entry_inline; ?></label>
                <div class="col-sm-10">
                  <div class="checkbox">
                    <label>
                      <input type="checkbox" name="formfields[<?php echo $key; ?>][inline]" value="" <?php echo (isset($formfield['inline']) ? 'checked="checked"' : ''); ?>/>
                    </label>
                  </div>
                </div>
              </div>
              <div class="form-group" id="required-field<?php echo $key; ?>">
                <label class="col-sm-2 control-label"><?php echo $entry_required; ?></label>
                <div class="col-sm-10">
                  <div class="checkbox">
                    <label>
                      <input type="checkbox" name="formfields[<?php echo $key; ?>][required]" value="" <?php echo (isset($formfield['required']) ? 'checked="checked"' : ''); ?>/>
                    </label>
                  </div>
                </div>
              </div>
              <div class="form-group">
                <label class="col-sm-2 control-label" for="input-status<?php echo $key; ?>"><?php echo $entry_status; ?></label>
                <div class="col-sm-10">
                  <select name="formfields[<?php echo $key; ?>][status]" id="input-status<?php echo $key; ?>" class="form-control">
                    <?php if ($formfield['status']) { ?>
                    <option value="1" selected="selected"><?php echo $text_enabled; ?></option>
                    <option value="0"><?php echo $text_disabled; ?></option>
                    <?php } else { ?>
                    <option value="1"><?php echo $text_enabled; ?></option>
                    <option value="0" selected="selected"><?php echo $text_disabled; ?></option>
                    <?php } ?>
                  </select>
                </div>
              </div>
              <div class="form-group">
                <label class="col-sm-2 control-label" for="input-sort-order<?php echo $key; ?>"><span data-toggle="tooltip" title="<?php echo $help_sort_order; ?>"><?php echo $entry_sort_order; ?></span></label>
                <div class="col-sm-10">
                  <input type="text" name="formfields[<?php echo $key; ?>][sort_order]" value="<?php echo isset($formfield['sort_order']) ? $formfield['sort_order'] : ''; ?>" placeholder="<?php echo $entry_sort_order; ?>" id="input-sort-order<?php echo $key; ?>" class="form-control" />
                </div>
              </div>
              <table id="custom-field-value<?php echo $key; ?>" class="table table-striped table-bordered table-hover">
                <thead>
                  <tr>
                    <td class="text-left required"><?php echo $entry_custom_value; ?></td>
                    <td class="text-right"><?php echo $entry_sort_order; ?></td>
                    <td></td>
                  </tr>
                </thead>
                <tbody>
                <?php $custom_field_value_row = 0; ?>
                <?php if (isset($formfield['custom_field_value'])) { ?>
                <?php foreach ($formfield['custom_field_value'] as $custom_field_val) { ?>
                <tr id="custom-field-value-row<?php echo $custom_field_value_row; ?>">
                  <td class="text-left" style="width: 70%;"><input type="hidden" name="formfields[<?php echo $key; ?>][custom_field_value][<?php echo $custom_field_value_row; ?>][custom_field_value_id]" value="<?php echo $custom_field_val['custom_field_value_id']; ?>" />
                    <?php foreach ($languages as $language) { ?>
                    <div class="input-group"> <span class="input-group-addon"><img src="language/<?php echo $language['code']; ?>/<?php echo $language['code']; ?>.png" title="<?php echo $language['name']; ?>" /></span>
                      <input type="text" name="formfields[<?php echo $key; ?>][custom_field_value][<?php echo $custom_field_value_row; ?>][custom_field_value_description][<?php echo $language['language_id']; ?>][name]" value="<?php echo isset($custom_field_val['custom_field_value_description'][$language['language_id']]) ? $custom_field_val['custom_field_value_description'][$language['language_id']]['name'] : ''; ?>" placeholder="<?php echo $entry_custom_value; ?>" class="form-control" />
                    </div>
                    <?php if (isset($error_custom_field_value[$custom_field_value_row][$language['language_id']])) { ?>
                    <div class="text-danger"><?php echo $error_custom_field_value[$custom_field_value_row][$language['language_id']]; ?></div>
                    <?php } ?>
                    <?php } ?></td>
                  <td class="text-right"><input type="text" name="formfields[<?php echo $key; ?>][custom_field_value][<?php echo $custom_field_value_row; ?>][sort_order]" value="<?php echo $custom_field_val['sort_order']; ?>" placeholder="<?php echo $entry_sort_order; ?>" class="form-control" /></td>
                  <td class="text-left"><button onclick="$('#custom-field-value-row<?php echo $custom_field_value_row; ?>').remove();" data-toggle="tooltip" title="<?php echo $button_remove; ?>" class="btn btn-danger"><i class="fa fa-minus-circle"></i></button></td>
                </tr>
                <?php $custom_field_value_row++; ?>
                <?php } ?>
                <?php } ?>
                </tbody>
                <tfoot>
                  <tr>
                    <td colspan="2"></td>
                    <td class="text-left"><button type="button" onclick="addCustomFieldValue(<?php echo $key; ?>);" data-toggle="tooltip" title="<?php echo $button_custom_field_value_add; ?>" class="btn btn-primary"><i class="fa fa-plus-circle"></i></button></td>
                  </tr>
                </tfoot>
              </table>
              </div>
          <?php } ?>
        </div>
        </form>
      </div>
    </div>
  </div>
</div>
<script type="text/javascript"><!--
$(".nav-tabs").on("click", "a", function (e) {
        e.preventDefault();
        if (!$(this).hasClass('add-field')) {
            $(this).tab('show');
        }
    })
    .on("click", "button.close", function () {
        var id = $(this).parent().attr('href').substring(1);
        var active = $(this).parent().parent().hasClass('active');
        $(this).parent().remove();
        $('#' + id).remove();
        if (active) {
          $(".nav-tabs li").children('a').first().click();
        }
    });

$('.add-field').click(function (e) {
    e.preventDefault();
    var id = 0;
    $(".nav-tabs li a").each(function() {
      var thisid = parseInt($(this).attr('href').substring(7));
      if (thisid>id) {
        id = thisid;
      }
      
    });
    id++;
    var tabId = 'field_' + id;
    $(this).closest('li').before('<li id = "li' + id + '"><a href="#field_' + id + '" data-toggle="tab"><?php echo $entry_field; ?> ' + id + '<button style="margin-left:10px" type="button" class="close" aria-label="Close"><span>×</span></button></a></li>');
    $('.tab-content').append('<div class="tab-pane" id="' + tabId + '">\
        <div class="form-group required">\
            <label class="col-sm-2 control-label"><?php echo $entry_field_name; ?></label>\
            <div class="col-sm-10">\
              <?php foreach ($languages as $language) { ?>\
              <div class="input-group"><span class="input-group-addon"><img src="language/<?php echo $language['code']; ?>/<?php echo $language['code']; ?>.png" title="<?php echo $language['name']; ?>" /></span>\
                <input type="text" name="formfields[' + id + '][custom_field_description][<?php echo $language['language_id']; ?>][name]" value="<?php echo isset($custom_field_description[$language['language_id']]) ? $custom_field_description[$language['language_id']]['name'] : ''; ?>" placeholder="<?php echo $entry_field_name; ?>" class="form-control" />\
              </div>\
              <?php if (isset($error_name[$language['language_id']])) { ?>\
              <div class="text-danger"><?php echo $error_name[$language['language_id']]; ?></div>\
              <?php } ?>\
              <?php } ?>\
            </div>\
          </div>\
          <div class="form-group">\
            <label class="col-sm-2 control-label" for="input-titleview' + id + '"><?php echo $entry_titleview; ?></label>\
            <div class="col-sm-10">\
              <select name="formfields[' + id + '][titleview]" id="input-titleview' + id + '" class="form-control">\
                <option value="0"><?php echo $titleview_up; ?></option>\
                <option value="1"><?php echo $titleview_1; ?></option>\
                <option value="2"><?php echo $titleview_2; ?></option>\
                <option value="3" selected="selected"><?php echo $titleview_3; ?></option>\
                <option value="4"><?php echo $titleview_4; ?></option>\
                <option value="6"><?php echo $titleview_6; ?></option>\
                <option value="7"><?php echo $titleview_no; ?></option>\
              </select>\
            </div>\
          </div>\
          <div class="form-group">\
            <label class="col-sm-2 control-label" for="input-type"><?php echo $entry_type; ?></label>\
            <div class="col-sm-10">\
              <select name="formfields[' + id + '][type]" id="input-type' + id + '" class="form-control">\
                <optgroup label="<?php echo $text_choose; ?>">\
                <option value="select"><?php echo $text_select; ?></option>\
                <option value="radio"><?php echo $text_radio; ?></option>\
                <option value="checkbox"><?php echo $text_checkbox; ?></option>\
                </optgroup>\
                <optgroup label="<?php echo $text_input; ?>">\
                <option value="text"><?php echo $text_text; ?></option>\
                <option value="textarea"><?php echo $text_textarea; ?></option>\
                </optgroup>\
                <optgroup label="<?php echo $text_file; ?>">\
                <option value="file"><?php echo $text_file; ?></option>\
                </optgroup>\
                <optgroup label="<?php echo $text_date; ?>">\
                <option value="date"><?php echo $text_date; ?></option>\
                <option value="time"><?php echo $text_time; ?></option>\
                <option value="datetime"><?php echo $text_datetime; ?></option>\
                </optgroup>\
                <optgroup label="<?php echo $entry_captcha; ?>">\
                  <?php foreach ($captchas as $captcha) { ?>\
                  <?php if ($captcha['value'] != 'google_captcha') continue; ?>\
                  <option value="<?php echo $captcha['value']; ?>"><?php echo $captcha['text']; ?></option>\
                  <?php } ?>\
                </optgroup>\
              </select>\
            </div>\
          </div>\
          <div class="form-group" style="display:none;" id="display-value' + id + '">\
            <label class="col-sm-2 control-label" for="input-value"><?php echo $entry_value; ?></label>\
            <div class="col-sm-10">\
              <input type="text" name="formfields[' + id + '][value]" value="" placeholder="<?php echo $entry_value; ?>" id="input-value' + id + '" class="form-control" />\
            </div>\
          </div>\
          <div class="form-group" style="display:none;" id="placeholder' + id + '">\
                <label class="col-sm-2 control-label" for="input-placeholder"><?php echo $entry_placeholder; ?></label>\
                <div class="col-sm-10">\
                  <?php foreach ($languages as $language) { ?>\
                  <div class="input-group"><span class="input-group-addon"><img src="language/<?php echo $language['code']; ?>/<?php echo $language['code']; ?>.png" title="<?php echo $language['name']; ?>" /></span>\
                    <input type="text" name="formfields[' + id + '][placeholder][<?php echo $language['language_id']; ?>][name]" value="" placeholder="<?php echo $entry_placeholder; ?>" class="form-control" />\
                  </div>\
                  <?php if (isset($error_name[$language['language_id']])) { ?>\
                  <div class="text-danger"><?php echo $error_name[$language['language_id']]; ?></div>\
                  <?php } ?>\
                  <?php } ?>\
                </div>\
              </div>\
          <div class="form-group" style="display:none;" id="display-validation' + id + '">\
            <label class="col-sm-2 control-label" for="input-validation"><span data-toggle="tooltip" title="<?php echo $help_regex; ?>"><?php echo $entry_validation; ?></span></label>\
            <div class="col-sm-10">\
              <input type="text" name="formfields[' + id + '][validation]" id="input-validation' + id + '" value="" placeholder="<?php echo $text_regex; ?>"  class="form-control"/>\
            </div>\
          </div>\
          <div class="form-group" style="display:none;" id="display-inline' + id + '">\
            <label class="col-sm-2 control-label"><?php echo $entry_inline; ?></label>\
            <div class="col-sm-10">\
              <div class="checkbox">\
                <label>\
                  <input type="checkbox" name="formfields[' + id + '][inline]" value="" />\
                </label>\
              </div>\
            </div>\
          </div>\
          <div class="form-group" id="required-field' + id + '">\
            <label class="col-sm-2 control-label"><?php echo $entry_required; ?></label>\
            <div class="col-sm-10">\
              <div class="checkbox">\
                <label>\
                  <input type="checkbox" name="formfields[' + id + '][required]" value="" />\
                </label>\
              </div>\
            </div>\
          </div>\
          <div class="form-group">\
            <label class="col-sm-2 control-label" for="input-status' + id + '"><?php echo $entry_status; ?></label>\
            <div class="col-sm-10">\
              <select name="formfields[' + id + '][status]" id="input-status' + id + '" class="form-control">\
                <option value="1" selected="selected"><?php echo $text_enabled; ?></option>\
                <option value="0"><?php echo $text_disabled; ?></option>\
              </select>\
            </div>\
          </div>\
          <div class="form-group">\
            <label class="col-sm-2 control-label" for="input-sort-order' + id + '"><span data-toggle="tooltip" title="<?php echo $help_sort_order; ?>"><?php echo $entry_sort_order; ?></span></label>\
            <div class="col-sm-10">\
              <input type="text" name="formfields[' + id + '][sort_order]" value="' + id + '" placeholder="<?php echo $entry_sort_order; ?>" id="input-sort-order" class="form-control" />\
            </div>\
          </div>\
          <table id="custom-field-value' + id + '" class="table table-striped table-bordered table-hover">\
            <thead>\
              <tr>\
                <td class="text-left required"><?php echo $entry_custom_value; ?></td>\
                <td class="text-right"><?php echo $entry_sort_order; ?></td>\
                <td></td>\
              </tr>\
            </thead>\
            <tbody>\
            </tbody>\
            <tfoot>\
              <tr>\
                <td colspan="2"></td>\
                <td class="text-left"><button type="button" onclick="addCustomFieldValue(' + id + ');" data-toggle="tooltip" title="<?php echo $button_custom_field_value_add; ?>" class="btn btn-primary"><i class="fa fa-plus-circle"></i></button></td>\
              </tr>\
            </tfoot>\
          </table>\
          </div>');
      $('#li' + id + ' a').click();
          
});

$(document).on('keyup', 'input[name*=\'custom_field_description\']', function() {
  var id = $(this).parents('.tab-pane')[0].id.substring(6);
  if ($(this).val().length>0) {
    $('#li' + id + ' a').html($(this).val() + '<button style="margin-left:10px" type="button" class="close" aria-label="Close"><span>×</span></button>');
  }
  else {
    $('#li' + id + ' a').html('<?php echo $entry_field; ?>' + id + '<button style="margin-left:10px" type="button" class="close" aria-label="Close"><span>×</span></button>');
  }
});
      
$(document).on('change', 'select[id^=\'input-type\']', function() {
  var id = this.id.substring(10);
	if (this.value == 'select' || this.value == 'radio' || this.value == 'checkbox') {
		$('#custom-field-value' + id).show();
    $('#required-field' + id).show();
		$('#display-value' + id + ', #display-validation' + id + ', #placeholder' + id).hide();
    if (this.value == 'select') {
      $('#display-inline' + id).hide();
    }
    else {
      $('#display-inline' + id).show();
    }
	} else if (this.value == 'google_captcha') {
    $('#display-value' + id + ', #display-validation' + id + ', #placeholder' + id).hide();
    $('#custom-field-value' + id + ', #display-inline' + id + ', #placeholder' + id).hide();
    $('#required-field' + id).hide();
  } else {
		$('#custom-field-value' + id + ', #display-inline' + id).hide();
		$('#display-value' + id + ', #display-validation' + id + ', #placeholder' + id).show();
    $('#required-field' + id).show();
	}
	
	if (this.value == 'date') {
		$('#display-value' + id + ' > div').html('<div class="input-group date"><input type="text" name="formfields[' + id + '][value]" value="' + $('#input-value' + id).val() + '" placeholder="<?php echo $entry_value; ?>" data-date-format="YYYY-MM-DD" id="input-value' + id + '" class="form-control" /><span class="input-group-btn"><button type="button" class="btn btn-default"><i class="fa fa-calendar"></i></button></span></div>');
    $('#display-value' + id + ' > div input').val('');
    $('#display-value' + id + ' > div .date').datetimepicker({
        pickTime: false
      });
	} else if (this.value == 'time') {
		$('#display-value' + id + ' > div').html('<div class="input-group time"><input type="text" name="formfields[' + id + '][value]" value="' + $('#input-value' + id).val() + '" placeholder="<?php echo $entry_value; ?>" data-date-format="HH:mm" id="input-value' + id + '" class="form-control" /><span class="input-group-btn"><button type="button" class="btn btn-default"><i class="fa fa-calendar"></i></button></span></div>');
    $('#display-value' + id + ' > div input').val('');
    $('#display-value' + id + ' > div .time').datetimepicker({
        pickDate: false
      });
  } else if (this.value == 'datetime') {
		$('#display-value' + id + ' > div').html('<div class="input-group datetime"><input type="text" name="formfields[' + id + '][value]" value="' + $('#input-value').val() + '" placeholder="<?php echo $entry_value; ?>" data-date-format="YYYY-MM-DD HH:mm" id="input-value" class="form-control" /><span class="input-group-btn"><button type="button" class="btn btn-default"><i class="fa fa-calendar"></i></button></span></div>');
    $('#display-value' + id + ' > div input').val('');
    $('#display-value' + id + ' > div .datetime').datetimepicker({
        pickDate: true,
        pickTime: true
      });
  } else if (this.value == 'textarea') {
		$('#display-value' + id + ' > div').html('<textarea name="formfields[' + id + '][value]" placeholder="<?php echo $entry_value; ?>" id="input-value' + id + '" class="form-control">' + $('#input-value' + id).val() + '</textarea>');
	} else {
		$('#display-value' + id + ' > div').html('<input type="text" name="formfields[' + id + '][value]" value="' + $('#input-value' + id).val() + '" placeholder="<?php echo $entry_value; ?>" id="input-value' + id + '" class="form-control" />');
	}
});

$('select[id^=\'input-type\']').trigger('change');

function addCustomFieldValue(id) {
  var custom_field_value_row = $('#custom-field-value' + id + ' tbody tr').length;
	html  = '<tr id="custom-field-value' + id + '-row' + custom_field_value_row + '">';	
    html += '  <td class="text-left" style="width: 70%;"><input type="hidden" name="formfields[' + id + '][custom_field_value][' + custom_field_value_row + '][custom_field_value_id]" value="" />';
	<?php foreach ($languages as $language) { ?>
	html += '    <div class="input-group">';
	html += '      <span class="input-group-addon"><img src="language/<?php echo $language['code']; ?>/<?php echo $language['code']; ?>.png" title="<?php echo $language['name']; ?>" /></span><input type="text" name="formfields[' + id + '][custom_field_value][' + custom_field_value_row + '][custom_field_value_description][<?php echo $language['language_id']; ?>][name]" value="" placeholder="<?php echo $entry_custom_value; ?>" class="form-control" />';
    html += '    </div>';
	<?php } ?>
	html += '  </td>';
	html += '  <td class="text-right"><input type="text" name="formfields[' + id + '][custom_field_value][' + custom_field_value_row + '][sort_order]" value="" placeholder="<?php echo $entry_sort_order; ?>" class="form-control" /></td>';
	html += '  <td class="text-left"><button type="button" onclick="$(\'#custom-field-value' + id + '-row' + custom_field_value_row + '\').remove();" data-toggle="tooltip" title="<?php echo $button_remove; ?>" class="btn btn-danger"><i class="fa fa-minus-circle"></i></button></td>';
	html += '</tr>';	
	
	$('#custom-field-value' + id + ' tbody').append(html);
	
	custom_field_value_row++;
}
$(document).on('change', 'input[name=\'openmodal\']', function() {
  if ($(this).is(':checked')) {
    $('#buttons_code,#a_code,#window_size').show();
  }
  else {
    $('#buttons_code,#a_code,#window_size').hide();
  }
});
$('input[name=\'openmodal\']').trigger('change');
//--></script>
<?php echo $footer; ?>
