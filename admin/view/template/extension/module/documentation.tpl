<?php echo $header; ?><?php echo $column_left; ?>
<div id="content">
  <div class="page-header">
    <div class="container-fluid">
      <div class="pull-right">
        <span class="editBtnTooltip" data-toggle="tooltip" title="<?php echo $text_new_doc; ?>"><button type="button" data-new-document="true" data-toggle="modal" data-target="#editDataModal" class="btn btn-success editDataButton"><i class="fa fa-plus"></i></button></span>
        <button type="button" form="form-documentation" data-toggle="tooltip" title="<?php echo $button_apply; ?>" class="btn btn-primary save"><i class="fa fa-check"></i></button>
        <a href="<?php echo $cancel; ?>" data-toggle="tooltip" title="<?php echo $button_return; ?>" class="btn btn-default"><i class="fa fa-reply"></i></a></div>
      <h1><?php echo $heading_title; ?></h1>
      <ul class="breadcrumb">
        <?php foreach ($breadcrumbs as $breadcrumb) { ?>
        <li><a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a></li>
        <?php } ?>
      </ul>
    </div>
  </div>
  <div id="content-wrapper" class="container-fluid">
    <?php if ($error_warning) { ?>
    <div class="alert alert-danger"><i class="fa fa-exclamation-circle"></i> <?php echo $error_warning; ?>
      <button type="button" class="close" data-dismiss="alert">&times;</button>
    </div>
    <?php } ?>
    <?php if ($success_message) { ?>
    <div class="alert alert-success"><i class="fa fa-check-circle"></i> <?php echo $success_message; ?>
      <button type="button" class="close" data-dismiss="alert">&times;</button>
    </div>
    <?php } ?>
    <div class="panel panel-default">
      <div class="panel-heading">
        <h3 class="panel-title"><i class="fa fa-pencil"></i> <?php echo $text_edit; ?></h3>
      </div>
      <div class="panel-body">
        <form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data" id="form-documentation">
          <input type="hidden" name="sort" value="<?php echo $getDataParams['sort']; ?>" id="safe-sort" class="form-control" />
          <input type="hidden" name="order" value="<?php echo $getDataParams['order']; ?>" id="safe-order" class="form-control" />
          <input type="hidden" name="page" value="<?php echo $getDataParams['page']; ?>" id="safe-page" class="form-control" />
          <ul class="nav nav-tabs" id="tabs">
            <li class="active"><a href="#tab-list" data-toggle="tab"><?php echo $tab_list; ?></a></li>
            <li><a href="#tab-settings" data-toggle="tab"><?php echo $tab_settings; ?></a></li>
            <li><a href="#tab-service" data-toggle="tab"><?php echo $tab_service; ?></a></li>
          </ul>
          <div class="tab-content">
            <div class="tab-pane active" id="tab-list">
              <div class="well">
                <div class="row">
                  <div class="col-sm-3">
                    <div class="form-group">
                      <label class="control-label" for="product-search-input"><span data-toggle="tooltip" title="<?php echo $help_product_filter; ?>"><?php echo $entry_product_search; ?></span></label>
                      <div class="input-group">
                        <input id="product-search-input" type="text" class="form-control" placeholder="<?php echo $text_product_search; ?>" value="<?php echo $getDataParams['product_name']; ?>" />
                        <div class="input-group-btn">
                          <button type="button" id="button-clear-product" class="btn btn-default"><i class="fa fa-times"></i></button>
                        </div>
                      </div>
                      <input type="hidden" name="product_search" value="<?php echo $getDataParams['product_search']; ?>" id="input-product" class="form-control" />
                    </div>
                  </div>
                  <div class="col-sm-3">
                    <div class="form-group">
                      <label class="control-label" for="file-filter-input"><?php echo $entry_file_filter; ?></label>
                      <div class="input-group">
                        <input id="file-filter-input" type="text" class="form-control" placeholder="<?php echo $text_file_filter; ?>" value="<?php echo $getDataParams['file_filter']; ?>" name="file_filter" />
                        <div class="input-group-btn">
                          <button type="button" id="button-clear-file" class="btn btn-default"><i class="fa fa-times"></i></button>
                        </div>
                      </div>
                    </div>
                  </div>
                  <div class="col-sm-2">
                    <div class="form-group">
                      <label class="control-label" for="input-linked"><?php echo $entry_filter_linked; ?></label>
                      <select name="filter_linked" id="input-linked" class="form-control">
                        <?php if ($getDataParams['filter_linked']===1) { ?>
                        <option value="-1"><?php echo $text_all; ?></option>
                        <option value="1" selected="selected"><?php echo $text_yes; ?></option>
                        <option value="0"><?php echo $text_no; ?></option>
                        <?php } elseif ($getDataParams['filter_linked']===0) { ?>
                        <option value="-1"><?php echo $text_all; ?></option>
                        <option value="1"><?php echo $text_yes; ?></option>
                        <option value="0" selected="selected"><?php echo $text_no; ?></option>
                        <?php } else { ?>
                        <option value="-1" selected="selected"><?php echo $text_all; ?></option>
                        <option value="1"><?php echo $text_yes; ?></option>
                        <option value="0"><?php echo $text_no; ?></option>
                        <?php } ?>
                      </select>
                    </div>
                  </div>
                  <div class="col-sm-2">
                    <div class="form-group">
                      <label class="control-label" for="input-folder-id"><?php echo $column_folders; ?></label>
                      <select name="folder_id" id="input-folder-id" class="form-control">
                        <option <?php echo ($getDataParams['folder_id']===false)?' selected="selected"':''; ?> value="-1"><?php echo $text_all; ?></option>
                        <option <?php echo ($getDataParams['folder_id']===0)?' selected="selected"':''; ?> value="0"><?php echo $documentation_default_folder_titles[$config_language_id]; ?></option>
                      <?php foreach ($folders as $folder) { ?>
                        <?php $selected = ($folder['folder_id']==$getDataParams['folder_id'])?' selected="selected"':''; ?>
                        <option value="<?php echo $folder['folder_id']; ?>" <?php echo $selected; ?>><?php echo $folder['titles'][$config_language_id]; ?></option>
                      <?php } ?>
                      </select>
                    </div>
                  </div>
                  <div class="col-sm-2">
                    <div class="form-group">
                      <label class="control-label" for="input-customer-group"><?php echo $column_customer_group; ?></label>
                      <select name="customer_group" id="input-customer-group" class="form-control">
                        <option <?php echo ($getDataParams['customer_group']===false)?' selected="selected"':''; ?> value="-1"><?php echo $text_all; ?></option>
                        <option <?php echo ($getDataParams['customer_group']===0)?' selected="selected"':''; ?> value="0"><?php echo $text_not_logged; ?></option>
                      <?php foreach ($customer_groups as $customer_group) { ?>
                        <?php $selected = ($customer_group['customer_group_id']==$getDataParams['customer_group'])?' selected="selected"':''; ?>
                        <option value="<?php echo $customer_group['customer_group_id']; ?>" <?php echo $selected; ?>><?php echo $customer_group['name']; ?></option>
                      <?php } ?>
                      </select>
                    </div>
                  </div>
                </div>
                <div class="row">
                  <div class="col-xs-6" style="white-space: nowrap;">
                  <?php if (isset($getDataParams['product_search']) && (int)$getDataParams['product_search']>0) {
                      $visible = ' btn-lnk-show';
                    } else {
                      $visible = '';
                    }
                  ?>
                    <button type="button" id="button-link" data-toggle="tooltip" title="<?php echo $button_link; ?>" class="btn btn-success btn-lnk <?php echo $visible; ?>"><i class="fa fa-link"></i></button>
                    <button type="button" id="button-unlink" data-toggle="tooltip" title="<?php echo $button_unlink; ?>" class="btn btn-warning btn-lnk <?php echo $visible; ?>"><i class="fa fa-unlink"></i></button>
                    <button type="button" id="button-delete" data-toggle="tooltip" title="<?php echo $button_delete; ?>" class="btn btn-danger"><i class="fa fa-trash-o"></i></button>
                  </div>
                  <div class="col-xs-6 pull-right text-right">
                    <button type="button" id="button-filter" class="btn btn-primary"><i class="fa fa-search"></i><span class="hidden-xs"> <?php echo $button_filter; ?></span></button>
                    <button type="button" id="button-clear-filter" class="btn btn-default"><i class="fa fa-times"></i><span class="hidden-xs"> <?php echo $button_clear_filter; ?></span></button>
                  </div>
                </div>
              </div>
              <div class="table-responsive">
                <table class="table table-bordered table-hover documentation-list">
                  <thead>
                    <tr>
                      <td style="width: 1px;" class="text-center"><input type="checkbox" onclick="$('input[name*=\'rows_selected\']').prop('checked', this.checked);" /></td>
                      <td class="text-left"><?php if ($getDataParams['sort'] == 'dd.name') { ?>
                        <a href="<?php echo $sort_name; ?>" class="<?php echo strtolower($getDataParams['order']); ?>"><?php echo $column_name; ?></a>
                        <?php } else { ?>
                        <a href="<?php echo $sort_name; ?>"><?php echo $column_name; ?></a>
                        <?php } ?></td>
                      <td class="text-left"><?php if ($getDataParams['sort'] == 'd.mask') { ?>
                        <a href="<?php echo $sort_mask; ?>" class="<?php echo strtolower($getDataParams['order']); ?>"><?php echo $column_mask; ?></a>
                        <?php } else { ?>
                        <a href="<?php echo $sort_mask; ?>"><?php echo $column_mask; ?></a>
                        <?php } ?></td>
                      <td class="text-left"><?php echo $column_folders; ?></td>
                      <td class="text-left"><?php echo $column_customer_group; ?></td>
                      <td class="text-right"><?php if ($getDataParams['sort'] == 'd.date_modified') { ?>
                        <a href="<?php echo $sort_date_modified; ?>" class="<?php echo strtolower($getDataParams['order']); ?>"><?php echo $column_date_added; ?></a>
                        <?php } else { ?>
                        <a href="<?php echo $sort_date_modified; ?>"><?php echo $column_date_added; ?></a>
                        <?php } ?></td>
                      <td class="text-right"><?php echo $column_action; ?></td>
                    </tr>
                  </thead>
                  <tbody>
                    <?php if ($documentation) { ?>
                    <?php foreach ($documentation as $documentation_data) { ?>
                    <tr class="<?php echo ($documentation_data['filestatus'])?(($documentation_data['linked'])?' success':''):' danger'; ?>" data-documentation-id="<?php echo $documentation_data['documentation_id']; ?>">
                      <td class="text-center">
                        <input type="checkbox" name="rows_selected[]" value="<?php echo $documentation_data['documentation_id']; ?>" />
                      </td>
                      <td class="text-left"><span class="doc_name"><?php echo $documentation_data['name']; ?></span><br/><small><span class="doc_links"><?php echo $documentation_data['links']; ?></span></small></td>
                      <td class="text-left"><span class="doc_mask"><?php echo $documentation_data['mask']; ?></span><br/><small><span class="doc_filename"><?php echo $documentation_data['filename']; ?><?php echo ($documentation_data['filestatus'])?$text_file_exists.' ['.$documentation_data['filesize'].']':$text_no_file; ?></span></small></td>
                      <td class="text-left"><span class="doc_folders"><?php
                        if (!empty($documentation_data['link_folders'])) {
                          foreach ($folders as $folder) {
                            if (in_array($folder['folder_id'], $documentation_data['link_folders'])) {
                              echo $folder['titles'][$config_language_id].'<br/>';
                            }
                          }
                        } else {
                          echo '<div class="text-right">'.$documentation_default_folder_titles[$config_language_id].'</div>';
                        }
                      ?></span></td>
                      <td class="text-left"><span class="doc_cgroup"><?php
                        if (!empty($documentation_data['customer_groups'])) {
                          foreach ($customer_groups_names as $customer_group_id => $group_name) {
                            if (in_array($customer_group_id, $documentation_data['customer_groups'])) {
                              echo $group_name.'<br/>';
                            }
                          }
                        } else {
                          echo '<div class="text-right">'.$text_all.'</div>';
                        }
                      ?></span></td>
                      <td class="text-right text-nowrap"><span class="doc_date"><?php echo $documentation_data['date_modified']; ?></span></td>
                      <td class="text-right text-nowrap">
                      <button data-toggle="tooltip" title="<?php echo $button_download_link; ?>" type="button" class="btn btn-success documentation-download"><i class="fa fa-cloud-download"></i></button>
                      <span class="editBtnTooltip" data-toggle="tooltip" title="<?php echo $button_edit; ?>"><button type="button" data-toggle="modal" data-target="#editDataModal" class="btn btn-primary editDataButton"><i class="fa fa-pencil"></i></button></span></td>
                    </tr>
                    <?php } ?>
                    <?php } else { ?>
                    <tr>
                      <td class="text-center" colspan="7"><?php echo $text_no_results; ?></td>
                    </tr>
                    <?php } ?>
                  </tbody>
                </table>
              </div>
              <div class="row">
                <div class="col-sm-6 text-left"><?php echo $pagination; ?></div>
                <div class="col-sm-6 text-right"><?php echo $results; ?></div>
              </div>
            </div>
            <div class="tab-pane form-horizontal" id="tab-settings">
              <div class="form-group">
                <label class="col-sm-2 control-label" for="input-status"><?php echo $entry_status; ?></label>
                <div class="col-sm-10">
                  <select name="documentation_status" id="input-status" class="form-control">
                    <?php if ($documentation_status) { ?>
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
                <label class="col-sm-2 control-label"><?php echo $entry_tab_name; ?></label>
                <div class="col-sm-10">
                  <?php foreach ($languages as $language) { ?>
                  <div class="input-group"><span class="input-group-addon"><img src="language/<?php echo $language['code']; ?>/<?php echo $language['code']; ?>.png" title="<?php echo $language['name']; ?>" /></span>
                    <input type="text" name="documentation_tab_name[<?php echo $language['language_id']; ?>]" value="<?php echo $documentation_tab_name[$language['language_id']]; ?>" placeholder="<?php echo $entry_tab_name; ?>" class="form-control" />
                  </div>
                  <div class="results"></div>
                  <?php } ?>
                </div>
              </div>
              <div class="form-group">
                <label class="col-sm-2 control-label"><?php echo $entry_folders; ?></label>
                <div class="col-sm-10 table-responsive">
                  <table class="table table-bordered table-hover documentation-folder-list">
                    <thead>
                      <tr>
                        <td class="text-left" style="width: 50%; min-width: 300px;"><?php echo $column_folder_name; ?></td>
                        <td class="text-left"><?php echo $column_folder_class; ?></td>
                        <td class="text-left"><span data-toggle="tooltip" data-trigger="click" data-html="true" title="<?php echo htmlspecialchars($help_folder_icon); ?>"><?php echo $column_folder_icon; ?></span></td>
                        <td class="text-left"><?php echo $column_folder_order; ?></td>
                        <td class="text-left"><?php echo $column_folder_status; ?></td>
                        <td class="text-right"><?php echo $column_action; ?></td>
                      </tr>
                    </thead>
                    <tbody>
                      <tr class="active" data-folder-default="true">
                        <td class="text-left">
                          <?php foreach ($languages as $language) { ?>
                          <div class="input-group"><span class="input-group-addon"><img src="language/<?php echo $language['code']; ?>/<?php echo $language['code']; ?>.png" title="<?php echo $language['name']; ?>" /></span>
                            <input type="text" name="documentation_default_folder_titles[<?php echo $language['language_id']; ?>]" value="<?php echo $documentation_default_folder_titles[$language['language_id']]; ?>" placeholder="<?php echo $entry_default_folder; ?>" class="form-control" />
                          </div>
                          <?php } ?>
                        </td>
                        <td class="text-left">
                          <input type="text" name="documentation_default_folder_class" value="<?php echo $documentation_default_folder_class; ?>" placeholder="<?php echo $entry_default_fclass; ?>" class="form-control folder-class" />
                        </td>
                        <td class="text-left form-inline">
                          <div class="input-group">
                            <div class="input-group-addon folder-icon-preview"><i></i></div>
                            <input type="text" name="documentation_default_folder_icon" value="<?php echo $documentation_default_folder_icon; ?>" placeholder="<?php echo $entry_default_ficon; ?>" class="form-control folder-icon" />
                          </div>
                        </td>
                        <td class="text-left">
                          <select name="documentation_default_folder_order" class="form-control">
                            <?php if ($documentation_default_folder_order) { ?>
                            <option value="1" selected="selected"><?php echo $text_on_top; ?></option>
                            <option value="0"><?php echo $text_on_bot; ?></option>
                            <?php } else { ?>
                            <option value="1"><?php echo $text_on_top; ?></option>
                            <option value="0" selected="selected"><?php echo $text_on_bot; ?></option>
                            <?php } ?>
                          </select>
                        </td>
                        <td class="text-left">
                          <select name="documentation_default_folder_status" class="form-control">
                            <?php if ($documentation_default_folder_status) { ?>
                            <option value="1" selected="selected"><?php echo $text_yes; ?></option>
                            <option value="0"><?php echo $text_no; ?></option>
                            <?php } else { ?>
                            <option value="1"><?php echo $text_yes; ?></option>
                            <option value="0" selected="selected"><?php echo $text_no; ?></option>
                            <?php } ?>
                          </select>
                        </td>
                        <td class="text-right"><button type="button" class="btn btn-default" disabled="disabled"><i class="fa fa-minus-circle"></i></button></td>
                      </tr>
                      <?php $folder_row = 1; ?>
                      <?php if ($folders) { ?>
                      <?php foreach ($folders as $folder) { ?>
                      <tr data-folder-row="<?php echo $folder_row; ?>">
                        <td class="text-left">
                          <input type="hidden" name="folders[<?php echo $folder_row; ?>][folder_id]" value="<?php echo $folder['folder_id']; ?>" />
                          <?php foreach ($languages as $language) { ?>
                          <div class="input-group"><span class="input-group-addon"><img src="language/<?php echo $language['code']; ?>/<?php echo $language['code']; ?>.png" title="<?php echo $language['name']; ?>" /></span>
                            <input type="text" name="folders[<?php echo $folder_row; ?>][titles][<?php echo $language['language_id']; ?>]" value="<?php echo $folder['titles'][$language['language_id']]; ?>" placeholder="<?php echo $entry_folder_title; ?>" class="form-control" />
                          </div>
                          <?php } ?>
                        </td>
                        <td class="text-left">
                          <input type="text" name="folders[<?php echo $folder_row; ?>][class]" value="<?php echo $folder['class']; ?>" placeholder="<?php echo $entry_folder_class; ?>" class="form-control folder-class" />
                        </td>
                        <td class="text-left form-inline">
                          <div class="input-group">
                            <div class="input-group-addon folder-icon-preview"><i></i></div>
                            <input type="text" name="folders[<?php echo $folder_row; ?>][icon]" value="<?php echo $folder['icon']; ?>" placeholder="<?php echo $entry_folder_icon; ?>" class="form-control folder-icon" />
                          </div>
                        </td>
                        <td class="text-left">
                          <input type="text" name="folders[<?php echo $folder_row; ?>][sort_order]" value="<?php echo $folder['sort_order']; ?>" placeholder="<?php echo $entry_folder_order; ?>" class="form-control" />
                        </td>
                        <td class="text-left">
                          <select name="folders[<?php echo $folder_row; ?>][status]" class="form-control">
                            <?php if ($folder['status']) { ?>
                            <option value="1" selected="selected"><?php echo $text_yes; ?></option>
                            <option value="0"><?php echo $text_no; ?></option>
                            <?php } else { ?>
                            <option value="1"><?php echo $text_yes; ?></option>
                            <option value="0" selected="selected"><?php echo $text_no; ?></option>
                            <?php } ?>
                          </select>
                        </td>
                        <td class="text-right text-nowrap"><button type="button" onclick="removeFolder(<?php echo $folder_row; ?>);" data-toggle="tooltip" title="<?php echo $button_folder_remove; ?>" class="btn btn-danger"><i class="fa fa-minus-circle"></i></button></td>
                      </tr>
                      <?php $folder_row++; ?>
                      <?php } ?>
                      <?php } ?>
                    </tbody>
                    <tfoot>
                      <tr>
                        <td colspan="5"></td>
                        <td class="text-right"><button type="button" onclick="addFolder();" data-toggle="tooltip" title="<?php echo $button_folder_add; ?>" class="btn btn-primary"><i class="fa fa-plus-circle"></i></button></td>
                      </tr>
                    </tfoot>
                  </table>
                </div>
              </div>
              <div class="form-group">
                <label class="col-sm-2 control-label" for="input-check-mime"><?php echo $entry_check_mime; ?></label>
                <div class="col-sm-10">
                  <select name="documentation_check_mime_type" id="input-check-mime" class="form-control">
                    <?php if ($documentation_check_mime_type) { ?>
                    <option value="1" selected="selected"><?php echo $text_yes; ?></option>
                    <option value="0"><?php echo $text_no; ?></option>
                    <?php } else { ?>
                    <option value="1"><?php echo $text_yes; ?></option>
                    <option value="0" selected="selected"><?php echo $text_no; ?></option>
                    <?php } ?>
                  </select>
                </div>
              </div>
              <div class="form-group">
                <label class="col-sm-2 control-label" for="input-delete-files"><?php echo $entry_delete_files; ?></label>
                <div class="col-sm-10">
                  <select name="documentation_auto_delete_files" id="input-delete-files" class="form-control">
                    <?php if ($documentation_auto_delete_files) { ?>
                    <option value="1" selected="selected"><?php echo $text_yes; ?></option>
                    <option value="0"><?php echo $text_no; ?></option>
                    <?php } else { ?>
                    <option value="1"><?php echo $text_yes; ?></option>
                    <option value="0" selected="selected"><?php echo $text_no; ?></option>
                    <?php } ?>
                  </select>
                </div>
              </div>
              <div class="form-group">
                <label class="col-sm-2 control-label" for="input-show-tab"><?php echo $entry_show_tab; ?></label>
                <div class="col-sm-10">
                  <select name="documentation_show_tab_always" id="input-show-tab" class="form-control">
                    <?php if ($documentation_show_tab_always) { ?>
                    <option value="1" selected="selected"><?php echo $text_yes; ?></option>
                    <option value="0"><?php echo $text_no; ?></option>
                    <?php } else { ?>
                    <option value="1"><?php echo $text_yes; ?></option>
                    <option value="0" selected="selected"><?php echo $text_no; ?></option>
                    <?php } ?>
                  </select>
                </div>
              </div>
              <?php /*
              <div class="form-group">
                <label class="col-sm-2 control-label" for="input-public-link"><?php echo $entry_public_link; ?></label>
                <div class="col-sm-10">
                  <select name="documentation_public_link" id="input-public-link" class="form-control">
                    <?php if ($documentation_public_link) { ?>
                    <option value="1" selected="selected"><?php echo $text_yes; ?></option>
                    <option value="0"><?php echo $text_no; ?></option>
                    <?php } else { ?>
                    <option value="1"><?php echo $text_yes; ?></option>
                    <option value="0" selected="selected"><?php echo $text_no; ?></option>
                    <?php } ?>
                  </select>
                </div>
              </div>
              */ ?>
              <input type="hidden" name="documentation_public_link" value="0" />
              <div class="form-group">
                <label class="col-sm-2 control-label" for="input-show-tab-icon"><?php echo $entry_show_tab_icon; ?></label>
                <div class="col-sm-10">
                  <select name="documentation_show_tab_icon" id="input-show-tab-icon" class="form-control">
                    <?php if ($documentation_show_tab_icon) { ?>
                    <option value="1" selected="selected"><?php echo $text_yes; ?></option>
                    <option value="0"><?php echo $text_no; ?></option>
                    <?php } else { ?>
                    <option value="1"><?php echo $text_yes; ?></option>
                    <option value="0" selected="selected"><?php echo $text_no; ?></option>
                    <?php } ?>
                  </select>
                </div>
              </div>
              <div class="form-group">
                <label class="col-sm-2 control-label" for="input-tab-fa-icon"><span data-toggle="tooltip" data-trigger="click" data-html="true" title="<?php echo htmlspecialchars($help_folder_icon); ?>"><?php echo $entry_tab_fa_icon; ?></span></label>
                <div class="col-sm-10">
                  <div class="input-group">
                    <div class="input-group-addon tab-fa-icon-preview"><i></i></div>
                    <input id="input-tab-fa-icon" type="text" name="documentation_tab_fa_icon" value="<?php echo $documentation_tab_fa_icon; ?>" placeholder="<?php echo $entry_folder_icon; ?>" class="form-control tab-fa-icon" />
                  </div>
                </div>
              </div>
              <div class="form-group">
                <label class="col-sm-2 control-label"><?php echo $entry_restricts; ?></label>
                <div class="col-sm-10">
                  <div class="checkbox">
                    <label>
                      <input type="checkbox" name="documentation_customer_group_restrict[0]" value="0" <?php echo (isset($documentation_customer_group_restrict) && in_array(0,$documentation_customer_group_restrict))?' checked="checked"':''; ?> />
                      <?php echo $text_not_logged; ?>
                    </label>
                  </div>
                  <?php $customer_group_row = 1; ?>
                  <?php foreach ($customer_groups as $customer_group) { ?>
                  <?php $checked = (isset($documentation_customer_group_restrict) && in_array($customer_group['customer_group_id'],$documentation_customer_group_restrict))?' checked="checked"':''; ?>
                  <div class="checkbox">
                    <label>
                      <input type="checkbox" name="documentation_customer_group_restrict[<?php echo $customer_group_row; ?>]" value="<?php echo $customer_group['customer_group_id']; ?>" <?php echo $checked; ?> />
                      <?php echo $customer_group['name']; ?>
                    </label>
                  </div>
                  <?php $customer_group_row++; ?>
                  <?php } ?>
                </div>
              </div>
              <div class="form-group <?php echo (!$storage_error)?'has-success':'has-error'; ?> has-feedback">
                <label class="col-sm-2 control-label" for="input-tmp-dir"><span data-toggle="tooltip" title="<?php echo htmlentities(((!$storage_error)?$help_storage_folder:$storage_error), ENT_QUOTES, 'UTF-8'); ?>"><?php echo $entry_storage_dir; ?></span></label>
                <div class="col-sm-10">
                  <div class="input-group">
                    <div class="input-group-addon">DIR_SYSTEM</div>
                    <input id="input-tmp-dir" type="text" value="<?php echo $storage; ?>" class="form-control" readonly />
                  </div>
                  <span class="form-control-feedback"><?php echo (!$storage_error)?'<i class="fa fa-check"></i>':'<i class="fa fa-exclamation-triangle"></i>'; ?></span>
                </div>
              </div>
              <div class="form-group <?php echo (!$tmpdir_error)?'has-success':'has-error'; ?> has-feedback">
                <label class="col-sm-2 control-label" for="input-tmp-dir"><span data-toggle="tooltip" title="<?php echo htmlentities(((!$tmpdir_error)?$help_manuad_upload:$tmpdir_error), ENT_QUOTES, 'UTF-8'); ?>"><?php echo $entry_tmp_dir; ?></span></label>
                <div class="col-sm-10">
                  <div class="input-group">
                    <div class="input-group-addon">DIR_SYSTEM</div>
                    <input id="input-tmp-dir" type="text" value="<?php echo $tmpdir; ?>" class="form-control" readonly />
                  </div>
                  <span class="form-control-feedback"><?php echo (!$tmpdir_error)?'<i class="fa fa-check"></i>':'<i class="fa fa-exclamation-triangle"></i>'; ?></span>
                </div>
              </div>
            </div>
            <div class="tab-pane form-horizontal" id="tab-service">
              <div class="form-group">
                <div class="col-sm-12">
                  <button type="button" id="button-upload-local" data-loading-text="<i class='fa fa-cog fa-spin'></i> <?php echo $button_upload_local; ?>" class="service-button btn btn-success service"><i class="fa fa-cogs"></i> <?php echo $button_upload_local; ?></button>
                  <button type="button" id="button-remove-links" data-loading-text="<i class='fa fa-refresh fa-spin'></i> <?php echo $button_remove_links; ?>" class="service-button btn btn-info service"><i class="fa fa-refresh"></i> <?php echo $button_remove_links; ?></button>
                  <button type="button" id="button-remove-files" data-loading-text="<i class='fa fa-circle-o-notch fa-spin'></i> <?php echo $button_remove_files; ?>" class="service-button btn btn-warning service"><i class="fa fa-trash"></i> <?php echo $button_remove_files; ?></button>
                </div>
                <div class="col-sm-12">
                  <div id="service-result"></div>
                </div>
              </div>
            </div>
          </div>
        </form>
      </div>
    </div>
  </div>
</div>
<div class="modal fade" id="editDataModal" tabindex="-1" role="dialog" aria-labelledby="editDataModalLabel">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title" id="editDataModalLabel"></h4>
      </div>
      <div class="modal-body">
        <div id="permission-error-progress" class="progress">
          <div class="progress-bar progress-bar-striped active" role="progressbar" aria-valuenow="100" aria-valuemin="0" aria-valuemax="100" style="width: 100%"></div>
        </div>
        <div class="result-placement"></div>
        <form id="modalForm" style="display:none;" class="form-horizontal">
          <div class="form-group required">
            <label class="col-sm-2 control-label"><span data-toggle="tooltip" title="<?php echo $help_name; ?>"><?php echo $entry_name; ?></span></label>
            <div class="col-sm-10 input-description-fields">
              <?php foreach ($languages as $language) { ?>
              <div class="input-group"><span class="input-group-addon"><img src="language/<?php echo $language['code']; ?>/<?php echo $language['code']; ?>.png" title="<?php echo $language['name']; ?>" /></span>
                <input type="text" name="description[<?php echo $language['language_id']; ?>]" value="" placeholder="<?php echo $entry_name; ?>" class="form-control" />
              </div>
              <div class="results"></div>
              <?php } ?>
            </div>
          </div>
          <div class="form-group required">
            <label class="col-sm-2 control-label" for="input-filename"><span data-toggle="tooltip" title="<?php echo $help_filename; ?>"><?php echo $entry_filename; ?></span></label>
            <div class="col-sm-10 input-filename-fields">
              <div class="input-group">
                <span class="input-group-btn">
                  <button type="button" class="btn btn-warning file-input-locker"><i class="fa fa-lock"></i></button>
                </span>
                <input type="text" name="filename" value="" placeholder="<?php echo $entry_filename; ?>" id="input-filename" class="form-control" readonly />
                <span class="input-group-btn">
                  <button type="button" id="button-upload" data-loading-text="<?php echo $text_loading; ?>" class="btn btn-primary" data-toggle="tooltip" title="<?php echo $button_upload; ?>"><i class="fa fa-upload"></i></button>
                </span>
              </div>
              <div id="file-upload-progress" class="progress">
                <div class="progress-bar progress-bar-success" role="progressbar" aria-valuenow="0" aria-valuemin="0" aria-valuemax="100">0.00%</div>
              </div>
              <div class="results"></div>
            </div>
          </div>
          <div class="form-group required">
            <label class="col-sm-2 control-label" for="input-mask"><span data-toggle="tooltip" title="<?php echo $help_mask; ?>"><?php echo $entry_mask; ?></span></label>
            <div class="col-sm-10 input-mask-fields">
              <input type="text" name="mask" value="" placeholder="<?php echo $entry_mask; ?>" id="input-mask" class="form-control" />
              <div class="results"></div>
            </div>
          </div>
          <div class="form-group">
            <label class="col-sm-2 control-label" for="input-products"><span data-toggle="tooltip" title="<?php echo $help_products; ?>"><?php echo $entry_products; ?></span></label>
            <div class="col-sm-10">
              <input type="text" placeholder="<?php echo $entry_products; ?>" id="input-products" class="form-control" />
              <div id="link-products" class="well well-sm" style="height: 150px; overflow: auto;">
              </div>
            </div>
          </div>
          <div class="form-group">
            <label class="col-sm-2 control-label"><span data-toggle="tooltip" title="<?php echo $help_link_folders; ?>"><?php echo $entry_link_folders; ?></span></label>
            <div class="col-sm-10">
              <?php foreach ($folders as $folder) { ?>
              <div class="checkbox">
                <label>
                  <input type="checkbox" name="link_folders[<?php echo $folder['folder_id']; ?>]" value="<?php echo $folder['folder_id']; ?>" />
                  <?php echo $folder['titles'][$config_language_id]; ?>
                </label>
              </div>
              <?php } ?>
            </div>
          </div>
          <div class="form-group">
            <label class="col-sm-2 control-label"><span data-toggle="tooltip" title="<?php echo $help_customer_group; ?>"><?php echo $entry_customer_group; ?></span></label>
            <div class="col-sm-10">
              <?php foreach ($customer_groups as $customer_group) { ?>
              <div class="checkbox">
                <label>
                  <input type="checkbox" name="document_customer_group[<?php echo $customer_group['customer_group_id']; ?>]" value="<?php echo $customer_group['customer_group_id']; ?>" />
                  <?php echo $customer_group['name']; ?>
                </label>
              </div>
              <?php } ?>
            </div>
          </div>
        </form>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-default" data-dismiss="modal"><?php echo $button_cancel; ?></button>
        <button type="button" id="saveDocumentBtn" data-loading-text="<?php echo $text_loading; ?> <?php echo $button_save; ?>" class="btn btn-primary" style="display:none;"><i class="fa fa-save"></i> <?php echo $button_save; ?></button>
      </div>
    </div>
  </div>
</div>
<style type="text/css">
  .btn-lnk {
    display: none;
  }
  .btn-lnk-show {
    display: inline-block;
  }
  span.editBtnTooltip {
    display: inline-block;
  }
  tr.editing {
    opacity: 0.5;
  }
  tr[data-documentation-id] small {
    opacity: 0.5;
  }
  .btn.service {
    margin-bottom: 3px;
  }
  #service-result {
    margin-top: 15px;
  }
  #modalForm div.required .control-label:not(span):before {
    position: absolute;
    margin-left: -9px;
  }
  #file-upload-progress {
    display: none;
    height: auto;
    border: 1px solid #dfebd5;
    background-color: #fff;
  }
  #file-upload-progress>div {
    transition: initial;
    padding: 10px 0;
    height: 38px;
    color: #8fbb6c;
    background-color: #ecf3e6;
  }
  .input-group-addon.folder-icon-preview {
    background: #fff;
  }
  .input-group-addon.tab-fa-icon-preview {
    background: #fff;
  }
</style>
<script type="text/javascript">
$(document).ready(function() {
  var getActualFormActionWithData = function() {
    var url = $("#form-documentation").attr('action');

    var sort = $('input[name=\'sort\']').val();

    if (sort) {
      url += '&sort=' + encodeURIComponent(sort);
    }

    var order = $('input[name=\'order\']').val();

    if (order) {
      url += '&order=' + encodeURIComponent(order);
    }

    var page = $('input[name=\'page\']').val();

    if (page) {
      url += '&page=' + encodeURIComponent(page);
    }

    var product_search = $('input[name=\'product_search\']').val();

    if (product_search>0) {
      url += '&product_search=' + encodeURIComponent(product_search);
    }

    var file_filter = $('input[name=\'file_filter\']').val();

    if (file_filter) {
      url += '&file_filter=' + encodeURIComponent(file_filter);
    }

    var filter_linked = $('select[name=\'filter_linked\']').val();

    if (filter_linked>=0) {
      url += '&filter_linked=' + encodeURIComponent(filter_linked);
    }

    var customer_group = $('select[name=\'customer_group\']').val();

    if (customer_group>=0) {
      url += '&customer_group=' + encodeURIComponent(customer_group);
    }

    var folder_id = $('select[name=\'folder_id\']').val();

    if (folder_id>=0) {
      url += '&folder_id=' + encodeURIComponent(folder_id);
    }

    return url;
  }

  $('button.save').on('click', function() {
    $("#form-documentation").attr('action',getActualFormActionWithData()).submit();
  });

  $('#button-filter').on('click', function() {
    location = getActualFormActionWithData();
  });

  $('#button-clear-filter').on('click', function() {
    location = $("#form-documentation").attr('action');
  });

  $('#button-link').on('click', function() {
    var input = $("<input>").attr("type", "hidden").attr("name", "act").val("link");
    $("#form-documentation").attr("action", getActualFormActionWithData()).append($(input)).submit();
  });

  $('#button-unlink').on('click', function() {
    var input = $("<input>").attr("type", "hidden").attr("name", "act").val("unlink");
    $("#form-documentation").attr("action", getActualFormActionWithData()).append($(input)).submit();
  });

  $('#button-delete').on('click', function() {
    if (confirm('<?php echo $text_confirm; ?>')) {
      var input = $("<input>").attr("type", "hidden").attr("name", "act").val("delete");
      $("#form-documentation").attr("action", getActualFormActionWithData()).append($(input)).submit();
    } else {
      return false;
    }
  });

  $('#product-search-input').autocomplete({
    'source': function(request, response) {
      if ($('#product-search-input').val().length==0) {
        $('#input-product').val(0);
        $('.btn-lnk').removeClass('btn-lnk-show');
      } else if ($('#product-search-input').val().length<3) {
        return false;
      }
      $.ajax({
        url: 'index.php?route=extension/module/documentation/getProducts&token=<?php echo $token; ?>&filter_name=' +  encodeURIComponent(request),
        dataType: 'json',
        success: function(json) {
          response($.map(json, function(item) {
            return {
              label: item['name'],
              value: item['product_id']
            }
          }));
        }
      });
    },
    'select': function(item) {
      $('#input-product').val(item['value']);
      $('#product-search-input').val(item['label']);
      $('#button-filter').trigger('click');
      /*$('.btn-lnk').addClass('btn-lnk-show');
      $('[data-documentation-id]').each(function() {
        reloadDocumentation($(this).data('documentation-id'));
      });*/
    }
  }).on('blur',function(){
    if ($('#input-product').val()<=0) {
      $(this).val('');
      $('.btn-lnk').removeClass('btn-lnk-show');
    }
  });

  $('#button-clear-product').on('click', function() {
    $('#product-search-input').val('');
    $('#input-product').val(0);
    $('#button-filter').trigger('click');
  });

  $('#file-filter-input').keypress(function (e) {
    if (e.which == 13) {
      $('#button-filter').trigger('click');
      return false;
    }
  });

  $('#button-clear-file').on('click', function() {
    $('#file-filter-input').val('');
    $('#button-filter').trigger('click');
  });

  $('#button-upload-local').on('click', function() {
    $.ajax({
      url: 'index.php?route=extension/module/documentation/uploadLocal&token=<?php echo $token; ?>',
      dataType: 'json',
      beforeSend: function() {
        $('.service-button').prop('disabled', true);
        $('#button-upload-local').button('loading');
      },
      complete: function() {
        $('.service-button').button('reset').prop('disabled', false);
      },
      success: function(json) {
        errors = $("<div>").addClass('alert').hide();
        success = $("<div>").addClass('alert').hide();
        if (json.error) {
          errors.addClass('alert-danger').html(json.error).prepend('<i class="fa fa-exclamation-circle"></i> ').prepend('<button type="button" class="close" data-dismiss="alert">&times;</button>').show();
        } 
        if (json.success) {
          success.addClass('alert-success').html(json.success).prepend('<i class="fa fa-check-circle"></i> ').prepend('<button type="button" class="close" data-dismiss="alert">&times;</button>').show();
        }
        $('#service-result').prepend($(errors)).prepend($(success));
      }
    });
  });

  $('#button-remove-links').on('click',function(){
    $.ajax({
      url: 'index.php?route=extension/module/documentation/linksActualization&token=<?php echo $token; ?>',
      dataType: 'json',
      beforeSend: function() {
        $('.service-button').prop('disabled', true);
        $('#button-remove-links').button('loading');
      },
      complete: function() {
        $('.service-button').button('reset').prop('disabled', false);
      },
      success: function(json) {
        errors = $("<div>").addClass('alert').hide();
        success = $("<div>").addClass('alert').hide();
        if (json.error) {
          errors.addClass('alert-danger').html(json.error).prepend('<i class="fa fa-exclamation-circle"></i> ').prepend('<button type="button" class="close" data-dismiss="alert">&times;</button>').show();
        } else if (json.success) {
          success.addClass('alert-info').html(json.success).prepend('<i class="fa fa-check-circle"></i> ').prepend('<button type="button" class="close" data-dismiss="alert">&times;</button>').show();
        }
        $('#service-result').prepend($(errors)).prepend($(success));
      }
    });
  });

  $('#button-remove-files').on('click',function(){
    var removing = 0;
    $.ajax({
      url: 'index.php?route=extension/module/documentation/removeOldDocumentationFiles&token=<?php echo $token; ?>',
      dataType: 'json',
      beforeSend: function() {
        $('.service-button').prop('disabled', true);
        $('#button-remove-files').button('loading');
      },
      complete: function() {
        removing++;
        if (removing==2) {
          $('.service-button').button('reset').prop('disabled', false);
        }
      },
      success: function(json) {
        errors = $("<div>").addClass('alert').hide();
        success = $("<div>").addClass('alert').hide();
        if (json.error) {
          errors.addClass('alert-danger').html(json.error).prepend('<i class="fa fa-exclamation-circle"></i> ').prepend('<button type="button" class="close" data-dismiss="alert">&times;</button>').show();
        } else if (json.success) {
          success.addClass('alert-warning').html(json.success).prepend('<i class="fa fa-check-circle"></i> ').prepend('<button type="button" class="close" data-dismiss="alert">&times;</button>').show();
        }
        $('#service-result').prepend($(errors)).prepend($(success));
      }
    });
    $.ajax({
      url: 'index.php?route=extension/module/documentation/removeTemporaryFiles&token=<?php echo $token; ?>',
      dataType: 'json',
      beforeSend: function() {
        $('.service-button').prop('disabled', true);
        $('#button-remove-files').button('loading');
      },
      complete: function() {
        removing++;
        if (removing==2) {
          $('.service-button').button('reset').prop('disabled', false);
        }
      },
      success: function(json) {
        errors = $("<div>").addClass('alert').hide();
        success = $("<div>").addClass('alert').hide();
        if (json.error) {
          errors.addClass('alert-danger').html(json.error).prepend('<i class="fa fa-exclamation-circle"></i> ').prepend('<button type="button" class="close" data-dismiss="alert">&times;</button>').show();
        } else if (json.success) {
          success.addClass('alert-warning').html(json.success).prepend('<i class="fa fa-check-circle"></i> ').prepend('<button type="button" class="close" data-dismiss="alert">&times;</button>').show();
        }
        $('#service-result').prepend($(errors)).prepend($(success));
      }
    });
  });

  var fileInputLock = function() {
    $('.file-input-locker').removeClass('btn-info').addClass('btn-warning').closest('#modalForm').find('#input-filename').prop('readonly',true);
    $('.file-input-locker').find('i').removeClass('fa-unlock-alt').addClass('fa-lock');
  }

  var fileInputUnLock = function() {
    $('.file-input-locker').removeClass('btn-warning').addClass('btn-info').closest('#modalForm').find('#input-filename').prop('readonly',false);
    $('.file-input-locker').find('i').removeClass('fa-lock').addClass('fa-unlock-alt');
  }

  $('.file-input-locker').on('click',function(){
    if ($(this).closest('#modalForm').find('#input-filename').prop('readonly')) {
      fileInputUnLock();
    } else {
      fileInputLock();
    }
  });

  $('#editDataModal').on('show.bs.modal', function (event) {
    var modal = $(this);
    var button = $(event.relatedTarget);
    $('#content-wrapper>.alert').remove();
    button.one('focus', function(e){$(this).blur();});
    modal.find('#modalForm input[type=text]').val('');
    modal.find('#modalForm input[type=checkbox]').prop('checked',false);
    modal.find('#link-products').empty();
    modal.find('.alert').remove();
    modal.find('.result-placement').hide().empty();
    fileInputLock();
    if (button.data('new-document')) {
      modal.find('#permission-error-progress').hide();
      modal.find('#modalForm').show();
      modal.find('#saveDocumentBtn').show();
      modal.find('.modal-title').text('<?php echo $text_new_doc; ?>');
    } else {
      var documentation_id = button.closest('tr').attr('data-documentation-id');
      modal.attr('data-related-documentation-id',documentation_id);
      $('tr[data-documentation-id=' + documentation_id + ']').addClass('editing');
      $.ajax({
        url: 'index.php?route=extension/module/documentation/getDocumentationData&token=<?php echo $token; ?>&documentation_id='+documentation_id,
        dataType: 'json',
        beforeSend: function() {
          modal.find('#permission-error-progress').show();
          modal.find('.result-placement').hide().empty();
          modal.find('#modalForm').hide();
          modal.find('#saveDocumentBtn').hide();
        },
        complete: function() {
          $('#permission-error-progress').hide();
        },
        success: function(json) {
          if (json.error) {
            modal.find('.result-placement').html(json.error).show();
          } else {
            $.map(json.description, function(name, language_id) {
              modal.find('[name=description\\['+language_id+'\\]]').val(name);
            });
            modal.find('[name=filename]').val(json.filedata.filename);
            modal.find('[name=mask]').val(json.filedata.mask);
            html = '';
            $.map(json.products, function(item) {
              html += '<div id="link-product' + item['pid'] + '">';
              html += '  <i class="fa fa-minus-circle"></i> ' + item['name'] + '';
              html += '  <input type="hidden" name="link_product[]" value="' + item['pid'] + '" />';
              html += '</div>';
            });
            modal.find('#link-products').append(html);
            $.map(json.link_folders, function(item) {
              modal.find('[name=link_folders\\[' + item['fid'] + '\\]]').prop('checked',true);
            });
            $.map(json.customer_groups, function(item) {
              modal.find('[name=document_customer_group\\[' + item['gid'] + '\\]]').prop('checked',true);
            });
            modal.find('#modalForm').show();
            modal.find('#saveDocumentBtn').show();
          }
        }
      });
      modal.find('.modal-title').text('<?php echo $text_edit_doc; ?>');
    }
  });

  $('#editDataModal').on('hide.bs.modal', function (event) {
    if ($(this).data('related-documentation-id')) {
      $('tr[data-documentation-id=' + $(this).attr('data-related-documentation-id') + ']').removeClass('editing');
      $(this).removeAttr('data-related-documentation-id');
      $(this).removeData('related-documentation-id');
    }
  });

  $('#button-upload').on('click', function(e) {
    var modalform = $(this).closest('#modalForm');
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
          url: 'index.php?route=extension/module/documentation/upload&token=<?php echo $token; ?>',
          type: 'post',
          dataType: 'json',
          data: new FormData($('#form-upload')[0]),
          cache: false,
          contentType: false,
          processData: false,
          xhr: function() {
            var xhr = new window.XMLHttpRequest();
            xhr.upload.addEventListener('progress', function(event){
              if (event.lengthComputable) {
                var percentComplete = (event.loaded / event.total)*100;
                $('#file-upload-progress>div').css('width', percentComplete+'%').attr('aria-valuenow', percentComplete).text(percentComplete.toFixed(2)+'%');
              }
            }, false);
            return xhr;
          },
          beforeSend: function() {
            $('#button-upload').button('loading');
            modalform.find('.input-filename-fields .alert').remove();
            $('#file-upload-progress').slideDown();
          },
          complete: function() {
            $('#button-upload').button('reset');
            fileInputLock();
          },
          success: function(json) {
            $('#file-upload-progress').fadeOut('fast',function(){
              if (json.error) {
                error = $("<div>").addClass('alert alert-danger').html(json.error).prepend('<i class="fa fa-exclamation-circle"></i> ').prepend('<button type="button" class="close" data-dismiss="alert">&times;</button>');
                modalform.find('.input-filename-fields .results').prepend(error);
              } else {
                success = $("<div>").addClass('alert alert-success').html(json.success).prepend('<i class="fa fa-check-circle"></i> ').prepend('<button type="button" class="close" data-dismiss="alert">&times;</button>');
                modalform.find('.input-filename-fields .results').prepend(success);

                modalform.find('input[name=\'filename\']').val(json['filename']);
                if (modalform.find('input[name=\'mask\']').val().length===0) {
                  modalform.find('input[name=\'mask\']').val(json['mask']);
                }
                $.map(json['documentation_description'], function(item,language_id) {
                  if (modalform.find('input[name=description\\[' + language_id + '\\]]').val().length===0) {
                    modalform.find('input[name=description\\[' + language_id + '\\]]').val(item.name);
                  }
                });
              }
            });
          },
          error: function(xhr, ajaxOptions, thrownError) {
            $('#file-upload-progress').hide();
            console.log(thrownError);
            error = $("<div>").addClass('alert alert-danger').html("<?php echo $error_upload_size; ?>").prepend('<i class="fa fa-exclamation-circle"></i> ').prepend('<button type="button" class="close" data-dismiss="alert">&times;</button>');
              modalform.find('.input-filename-fields .results').prepend(error);
          }
        });
      }
    }, 500);
  });

  $('#input-products').autocomplete({
    'source': function(request, response) {
      if ($('#input-products').val().length<3) {
        return false;
      }
      $.ajax({
        url: 'index.php?route=extension/module/documentation/getProducts&token=<?php echo $token; ?>&filter_name=' +  encodeURIComponent(request),
        dataType: 'json',
        success: function(json) {
          response($.map(json, function(item) {
            return {
              label: item['name'],
              value: item['product_id']
            }
          }));
        }
      });
    },
    'select': function(item) {
      $('#input-products').val('');
      $('#link-product' + item['value']).remove();

      html = '';
      html += '<div id="link-product' + item['value'] + '">';
      html += '  <i class="fa fa-minus-circle"></i> ' + item['label'] + '';
      html += '  <input type="hidden" name="link_product[]" value="' + item['value'] + '" />';
      html += '</div>';

      $('#link-products').append(html);
    }
  });

  $('#link-products').delegate('.fa-minus-circle', 'click', function() {
    $(this).parent().remove();
  });

  var reloadDocumentation = function(documentation_id) {
    var target = $('[data-documentation-id=' + documentation_id + ']');
    if (target.length!==0) {
      $.ajax({
        url: 'index.php?route=extension/module/documentation/reloadDocumentationData&token=<?php echo $token; ?>&documentation_id='+documentation_id,
        dataType: 'json',
        beforeSend: function() {
          target.removeClass('danger success');
        },
        complete: function() {
          target.removeClass('editing');
        },
        success: function(json) {
          if (json.data) {
            target.find('span.doc_name').html(json.data.name);
            target.find('span.doc_links').html(json.data.links_text);
            target.find('span.doc_mask').html(json.data.mask);
            filestatus_text = json.data.filestatus_text;
            if (json.data.filesize) {
              filestatus_text += ' ['+json.data.filesize+']';
            }
            target.find('span.doc_filename').html(json.data.filename+filestatus_text);
            target.find('span.doc_date').html(json.data.date);
            cghtml = '';
            if (json.data.cgroup.length===0) {
              cghtml += '<div class="text-right"><?php echo $text_all; ?></div>';
            } else {
              $.map(json.data.cgroup, function(item) {
                cghtml += item.name+'<br/>';
              });
            }
            target.find('span.doc_cgroup').html(cghtml);

            lfhtml = '';
            if (json.data.folders.length===0) {
              lfhtml += '<div class="text-right"><?php echo $documentation_default_folder_titles[$config_language_id]; ?></div>';
            } else {
              $.map(json.data.folders, function(item) {
                lfhtml += item.name+'<br/>';
              });
            }
            target.find('span.doc_folders').html(lfhtml);

            if (json.data.filestatus==1) {
              if ($('#input-product').val()==0 && json.data.links_count>0) {
                target.addClass('success');
              } else if ($('#input-product').val()>0 && json.data.links_count>0) {
                $.map(json.data.links, function(item) {
                  if (item.pid == $('#input-product').val()){
                    target.addClass('success');
                  }
                });
              }
            } else {
              target.addClass('danger');
            }
          }
        }
      });
    }
  }

  $('#saveDocumentBtn').on('click', function(e) {
    var modal = $(this).closest('#editDataModal');
    var modalform = modal.find('#modalForm');
    var documentation_id = 0;
    if (modal.data('related-documentation-id')) {
      documentation_id = modal.data('related-documentation-id');
    }
    $.ajax({
      url: 'index.php?route=extension/module/documentation/saveDocumentation&token=<?php echo $token; ?>&documentation_id='+documentation_id,
      type: 'post',
      dataType: 'json',
      data: modalform.serialize(),
      beforeSend: function() {
        $('#saveDocumentBtn').button('loading');
        modalform.find('.alert').remove();
      },
      complete: function() {
        $('#saveDocumentBtn').button('reset');
      },
      success: function(json) {
        if (json.error) {
          if (json.error.permission) {
            modal.find('.result-placement').html(json.error.permission).show();
            modal.find('#modalForm').hide();
            modal.find('#saveDocumentBtn').hide();
          } else {
            if (json.error.filename) {
              error = $("<div>").addClass('alert alert-danger').html(json.error.filename).prepend('<i class="fa fa-exclamation-circle"></i> ').prepend('<button type="button" class="close" data-dismiss="alert">&times;</button>');
              modalform.find('.input-filename-fields .results').prepend(error);
            }
            if (json.error.mask) {
              error = $("<div>").addClass('alert alert-danger').html(json.error.mask).prepend('<i class="fa fa-exclamation-circle"></i> ').prepend('<button type="button" class="close" data-dismiss="alert">&times;</button>');
              modalform.find('.input-mask-fields .results').prepend(error);
            }
            if (json.error.description) {
              $.map(json.error.description, function(error_text, language_id) {
                error = $("<div>").addClass('alert alert-danger').html(error_text).prepend('<i class="fa fa-exclamation-circle"></i> ').prepend('<button type="button" class="close" data-dismiss="alert">&times;</button>');
                modal.find('input[name=description\\[' + language_id + '\\]]').parent().next('.results').prepend(error);
              });
            }
          }
        } else {
          if (documentation_id>0) {
            modal.modal('hide');
            reloadDocumentation(documentation_id);
            success = $("<div>").addClass('alert alert-success').html(json.success).prepend('<i class="fa fa-check-circle"></i> ').prepend('<button type="button" class="close" data-dismiss="alert">&times;</button>');
            $('#content-wrapper').prepend(success);
          } else {
            location = getActualFormActionWithData();
          }
        }
      },
      error: function(xhr, ajaxOptions, thrownError) {
        alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
      }
    });
  });

  $('#input-filename').autocomplete({
    'source': function(request, response) {
      if ($('#input-filename').val().length<3 || $('#input-filename').prop('readonly')) {
        return false;
      }
      $.ajax({
        url: 'index.php?route=extension/module/documentation/getFilesList&token=<?php echo $token; ?>&filter_name=' +  encodeURIComponent(request),
        dataType: 'json',
        success: function(json) {
          response($.map(json, function(item) {
            return {
              label: item['name'],
              value: item['name']
            }
          }));
        }
      });
    },
    'select': function(item) {
      $('#input-filename').val(item['value']);
    }
  });

  $('table.documentation-list').find('tbody>tr').each(function(){
    $(this).find('td:first').on('click',function(e){
      el = $(this).find('input[name*=\'rows_selected\']');
      if (!el.is(e.target)) {
        if (el.prop('checked')) {
          el.prop('checked',false);
        } else {
          el.prop('checked',true);
        }
      }
    });
  });

  $('.documentation-download').on('click',function(){
    var documentation_id = $(this).closest('tr').data('documentation-id');
    $('<form>')
    .attr('id','documentation-download-form')
    .attr('method','POST')
    .attr('target','_blank')
    .attr('action','<?php echo str_replace('&amp;', '&', $download_url); ?>')
    .append($("<input>")
      .attr("type", "hidden")
      .attr("name", "documentation_id")
      .val(documentation_id)
    )
    .appendTo('body').submit().remove();
  });

  var updateIconPreview = function(el) {
    icon = el.val();
    if (icon.length===0) {
      icon = 'bars';
      el.val(icon);
    }
    el.closest('td').find('.folder-icon-preview i').attr('class','').addClass('fa fa-fw fa-'+icon);
  }

  $('.folder-icon').each(function(){
    updateIconPreview($(this));
  });

  var updateTabIconPreview = function() {
    el = $('#input-tab-fa-icon');
    icon = el.val();
    if (icon.length===0) {
      icon = 'download';
      el.val(icon);
    }
    el.closest('.input-group').find('.tab-fa-icon-preview i').attr('class','').addClass('fa fa-fw fa-'+icon);
  }
  updateTabIconPreview();

  $(document).delegate('.folder-class','input',function(){
    s = $(this).val();
    $(this).val(s.replace(/^[^a-z]/gi, "").replace(/[^a-z0-9\-_ ]/gi, "").replace(/ +/gi, " ").replace(/_+/gi, "_").replace(/\-+/gi, "-").toLowerCase());
  });

  $(document).delegate('.folder-class','blur',function(){
    s = $(this).val();
    $(this).val(s.replace(/[^a-z0-9]$/gi, ""));
  });

  $(document).delegate('.folder-icon','input',function(){
    s = $(this).val();
    $(this).val(s.replace(/^[^a-z]/gi, "").replace(/[^a-z0-9\-]/gi, "").replace(/\-+/gi, "-").toLowerCase());
  });

  $(document).delegate('.folder-icon','blur',function(){
    s = $(this).val();
    $(this).val(s.replace(/[^a-z0-9]$/gi, ""));
    updateIconPreview($(this));
  });

  $(document).delegate('.tab-fa-icon','blur',function(){
    el = $('#input-tab-fa-icon');
    s = el.val();
    el.val(s.replace(/[^a-z0-9]$/gi, ""));
    updateTabIconPreview();
  });

});

var folder_row = <?php echo $folder_row; ?>;
function addFolder() {
  html  =  '<tr data-folder-row="'+folder_row+'">'; 
  html +=  '  <td class="text-left">';
  html +=  '    <input type="hidden" name="folders['+folder_row+'][folder_id]" value="0" />';
  <?php foreach ($languages as $language) { ?>
  html +=  '    <div class="input-group">';
  html +=  '      <span class="input-group-addon"><img src="language/<?php echo $language['code']; ?>/<?php echo $language['code']; ?>.png" title="<?php echo $language['name']; ?>" /></span>';
  html +=  '      <input type="text" name="folders['+folder_row+'][titles][<?php echo $language['language_id']; ?>]" value="" placeholder="<?php echo $entry_folder_title; ?>" class="form-control" />';
  html +=  '    </div>';
  <?php } ?>
  html +=  '  </td>';
  html +=  '  <td class="text-left">';
  html +=  '    <input type="text" name="folders['+folder_row+'][class]" value="" placeholder="<?php echo $entry_folder_class; ?>" class="form-control folder-class" />';
  html +=  '  </td>';
  html +=  '  <td class="text-left form-inline">';
  html +=  '    <div class="input-group">';
  html +=  '      <div class="input-group-addon folder-icon-preview"><i class="fa fa-fw fa-bars"></i></div>';
  html +=  '      <input type="text" name="folders['+folder_row+'][icon]" value="bars" placeholder="<?php echo $entry_folder_icon; ?>" class="form-control folder-icon" />';
  html +=  '    </div>';
  html +=  '  </td>';
  html +=  '  <td class="text-left">';
  html +=  '    <input type="text" name="folders['+folder_row+'][sort_order]" value="" placeholder="<?php echo $entry_folder_order; ?>" class="form-control" />';
  html +=  '  </td>';
  html +=  '  <td class="text-left">';
  html +=  '    <select name="folders['+folder_row+'][status]" class="form-control">';
  html +=  '      <option value="1" selected="selected"><?php echo $text_yes; ?></option>';
  html +=  '      <option value="0"><?php echo $text_no; ?></option>';
  html +=  '    </select>';
  html +=  '  </td>';
  html +=  '  <td class="text-right text-nowrap">';
  html +=  '    <button type="button" onclick="removeFolder('+folder_row+');" data-toggle="tooltip" title="<?php echo $button_folder_remove; ?>" class="btn btn-danger"><i class="fa fa-minus-circle"></i></button>';
  html +=  '  </td>';
  html +=  '</tr>';
  $('.documentation-folder-list tbody').append(html);
  folder_row++;
}

function removeFolder(folder_row_ptr) {
  return confirm('<?php echo $confirm_folder_del; ?>') ? $('tr[data-folder-row="'+folder_row_ptr+'"]').remove() : false;
}

</script>
<?php echo $footer; ?>