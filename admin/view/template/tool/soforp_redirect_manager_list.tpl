<?php echo $header; ?><?php echo $column_left; ?>
<div id="content">
    <div class="page-header">
        <div class="container-fluid">
            <div class="pull-right">
                <a href="<?php echo $add; ?>" data-toggle="tooltip" title="<?php echo $button_add; ?>" class="btn btn-primary"><i class="fa fa-plus"></i></a>
                <button type="button" data-toggle="tooltip" title="<?php echo $button_delete; ?>" class="btn btn-danger" onclick="confirm('<?php echo $text_confirm; ?>') ? $('#form-attribute').submit() : false;"><i class="fa fa-trash-o"></i></button>
            </div>
            <img width="36" height="36" style="float:left" src="view/image/neoseo.png" alt=""/>
            <h1><?php echo $heading_title . " " . $text_module_version; ?></h1>
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
        <div class="panel panel-default">
            <div class="panel-heading" style=" height: 58px;">
                <h3 class="panel-title"><i class="fa fa-list"></i> <?php echo $text_list; ?></h3>
                <div class="pull-right">
                    <form id="import" action="<?php echo $import; ?>"  method="post" enctype="multipart/form-data" class="form-inline">
                        <div class="form-group">
                            <input type="file" name="filename" />   
                        </div>
                        <a onclick="if (confirm('<?php echo $text_import_warning; ?>')) {
                                    $('#import').submit()
                                }" class="btn btn-primary"><i class="fa fa-file-excel-o"></i> <span><?php echo $button_import; ?></span></a>
                        <a href="<?php echo $export; ?>" class="btn btn-primary"><i class="fa fa-file-excel-o"></i><span> <?php echo $button_export; ?></span></a> 
                    </form>
                </div>   </div>
            <div class="panel-body">
                <div class="well">
                    <div class="row">
                        <div class="col-sm-4">
                            <div class="form-group">
                                <label class="control-label" for="input-status"><?php echo $column_active;  ?></label>
                                <select name="filter_active" id="input-status" class="form-control">
                                    <option value="*"></option>
                                    <?php if ($filter_active) { ?>
                                    <option value="1" selected="selected"><?php echo $text_enabled; ?></option>
                                    <?php } else { ?>
                                    <option value="1"><?php echo $text_enabled; ?></option>
                                    <?php } ?>
                                    <?php if (!$filter_active && !is_null($filter_active)) { ?>
                                    <option value="0" selected="selected"><?php echo $text_disabled; ?></option>
                                    <?php } else { ?>
                                    <option value="0"><?php echo $text_disabled; ?></option>
                                    <?php } ?>
                                </select>
                            </div>

                            <div class="form-group">
                                <label class="control-label" for="input-response_code"><?php echo $entry_response_code; ?></label>

                                <select name="filter_response_code"  class="form-control">

                                    <option value="*"></option>

                                    <?php if ($filter_response_code=='301') { ?>
                                    <option value="301" selected="selected"><?php echo $text_response_code_301; ?></option>
                                    <?php } else { ?>
                                    <option value="301"><?php echo $text_response_code_301; ?></option>
                                    <?php } ?>
                                    <?php if ($filter_response_code=='302') { ?>
                                    <option value="302" selected="selected"><?php echo $text_response_code_302; ?></option>
                                    <?php } else { ?>
                                    <option value="302"><?php echo $text_response_code_302; ?></option>
                                    <?php } ?>
                                    <?php if ($filter_response_code=='307') { ?>
                                    <option value="307" selected="selected"><?php echo $text_response_code_307; ?></option>
                                    <?php } else { ?>
                                    <option value="307"><?php echo $text_response_code_307; ?></option>
                                    <?php } ?>
                                </select>


                            </div>    </div>
                        <div class="col-sm-4">
                            <div class="form-group">
                                <label class="control-label" for="input-model"><?php echo $column_from_url; ?></label>
                                <input type="text" name="filter_from_url" value="<?php echo $filter_from_url; ?>" placeholder="<?php echo $column_from_url; ?>" id="input-model" class="form-control" />
                            </div>


                            <div class="form-group">
                                <label class="control-label" for="input-price"><?php echo $column_to_url; ?></label>
                                <input type="text" name="filter_to_url" value="<?php echo $filter_to_url; ?>"  placeholder="<?php echo $column_to_url; ?>" id="input-price" class="form-control" />
                            </div>   </div>
                        <div class="col-sm-4">
                        </div>
                        <div class="col-sm-4">
                            <div class="form-group">
                                <label class=" control-label" for="input-date-available"><?php echo $entry_date_start; ?></label>

                                <div class="input-group date">
                                    <input type="text" name="filter_date_start" value="<?php echo $filter_date_start; ?>"  placeholder="<?php echo $entry_date_start; ?>" data-date-format="YYYY-MM-DD" id="input-date-available" class="form-control" />
                                    <span class="input-group-btn">
                                        <button class="btn btn-default" type="button"><i class="fa fa-calendar"></i></button>
                                    </span></div>

                            </div>

                            <div class="form-group">
                                <label class=" control-label" for="input-date-available"><?php echo $entry_date_end; ?></label>

                                <div class="input-group date">
                                    <input type="text" name="filter_date_end" value="<?php echo $filter_date_end; ?>" placeholder="<?php echo $entry_date_end; ?>" data-date-format="YYYY-MM-DD" id="input-date-available" class="form-control" />
                                    <span class="input-group-btn">
                                        <button class="btn btn-default" type="button"><i class="fa fa-calendar"></i></button>
                                    </span></div>

                            </div>
                            <button type="button" id="button-filter" class="btn btn-primary pull-right"><i class="fa fa-search"></i> <?php echo $button_filter; ?></button>
                        </div>
                    </div>
                </div>

                <form action="<?php echo $delete; ?>" method="post" enctype="multipart/form-data" id="form-attribute">
                    <div class="table-responsive">
                        <table class="table table-bordered table-hover">
                            <thead>
                                <tr>
                                    <td style="width: 1px;" class="text-center"><input type="checkbox" onclick="$('input[name*=\'selected\']').prop('checked', this.checked);" /></td>
                                    <td class="text-center">
                                        <?php if ($sort == 'active') { ?>
                                        <a href="<?php echo $sort_active; ?>" class="<?php echo strtolower($order); ?>"><?php echo $column_active; ?></a>
                                        <?php } else { ?>
                                        <a href="<?php echo $sort_active; ?>"><?php echo $column_active; ?></a>
                                        <?php } ?></td>
                                    <td class="text-center"><?php if ($sort == 'from_url') { ?>
                                        <a href="<?php echo $sort_from_url; ?>" class="<?php echo strtolower($order); ?>"><?php echo $column_from_url; ?></a>
                                        <?php } else { ?>
                                        <a href="<?php echo $sort_from_url; ?>"><?php echo $column_from_url; ?></a>
                                        <?php } ?></td>
                                    <td class="text-center"><?php if ($sort == 'to_url') { ?>
                                        <a href="<?php echo $sort_to_url; ?>" class="<?php echo strtolower($order); ?>"><?php echo $column_to_url; ?></a>
                                        <?php } else { ?>
                                        <a href="<?php echo $sort_to_url; ?>"><?php echo $column_to_url; ?></a>
                                        <?php } ?></td>
                                    <td class="text-center"><?php if ($sort == 'response_code') { ?>
                                        <a href="<?php echo $sort_response_code; ?>" class="<?php echo strtolower($order); ?>"><?php echo $column_response_code; ?></a>
                                        <?php } else { ?>
                                        <a href="<?php echo $sort_response_code; ?>"><?php echo $column_response_code; ?></a>
                                        <?php } ?></td>
                                    <td class="text-center"><?php if ($sort == 'date_start') { ?>
                                        <a href="<?php echo $sort_date_start; ?>" class="<?php echo strtolower($order); ?>"><?php echo $column_date_start; ?></a>
                                        <?php } else { ?>
                                        <a href="<?php echo $sort_date_start; ?>"><?php echo $column_date_start; ?></a>
                                        <?php } ?></td>
                                    <td class="text-center"><?php if ($sort == 'date_end') { ?>
                                        <a href="<?php echo $sort_date_end; ?>" class="<?php echo strtolower($order); ?>"><?php echo $column_date_end; ?></a>
                                        <?php } else { ?>
                                        <a href="<?php echo $sort_date_end; ?>"><?php echo $column_date_end; ?></a>
                                        <?php } ?></td>
                                    <td class="text-center"><?php if ($sort == 'times_used') { ?>
                                        <a href="<?php echo $sort_times_used; ?>" class="<?php echo strtolower($order); ?>"><?php echo $column_times_used; ?></a>
                                        <?php } else { ?>
                                        <a href="<?php echo $sort_times_used; ?>"><?php echo $column_times_used; ?></a>
                                        <?php } ?></td>
                                    <td class="text-center"><?php echo $column_action; ?></td>
                                </tr>
                            </thead>
                            <tbody>
                                <?php if ($redirects) { ?>
                                <?php foreach ($redirects as $redirect) { ?>
                                <tr>
                                    <td class="text-center"><?php if (in_array($redirect['redirect_id'], $selected)) { ?>
                                        <input type="checkbox" name="selected[]" value="<?php echo $redirect['redirect_id']; ?>" checked="checked" />
                                        <?php } else { ?>
                                        <input type="checkbox" name="selected[]" value="<?php echo $redirect['redirect_id']; ?>" />
                                        <?php } ?></td>
                                    <?php if($redirect['active']==1){$active_redirect='Включено';}else{$active_redirect='Отключено';}?>
                                    <?php if($redirect['response_code']==301){$response_code_redirect='301 Перемещено навсегда';}elseif($redirect['response_code']==302){$response_code_redirect='302 Временное перемещение';}elseif($redirect['response_code']==307){$response_code_redirect='307 Перемещено временно';}?>
                                    <td class="text-left"><?php echo $active_redirect; ?></td>
                                    <td class="text-left"><?php echo $redirect['from_url']; ?></td>
                                    <td class="text-left"><?php echo $redirect['to_url']; ?></td>
                                    <td class="text-left"><?php echo $response_code_redirect; ?></td>
                                    <td class="text-left"><?php echo $redirect['date_start']; ?></td>
                                    <td class="text-left"><?php echo $redirect['date_end']; ?></td>
                                    <td class="text-left"><?php echo $redirect['times_used']; ?></td>
                                    <td class="text-right">
                                         <a href="<?php echo rtrim(HTTP_CATALOG,'/').'/'.ltrim($redirect['from_url'],'/'); ?>" data-toggle="tooltip" title="<?php echo $button_view; ?>" class="btn btn-success" target='_blank'><i class="fa fa-eye"></i></a>
                                         <a href="<?php echo $redirect['edit']; ?>" data-toggle="tooltip" title="<?php echo $button_edit; ?>" class="btn btn-primary"><i class="fa fa-pencil"></i></a>
                                    </td>
                                </tr>
                                <?php } ?>
                                <?php } else { ?>
                                <tr>
                                    <td class="text-center" colspan="9"><?php echo $text_no_results; ?></td>
                                </tr>
                                <?php } ?>
                            </tbody>
                        </table>
                    </div>
                </form>
                <div class="row">
                    <div class="col-sm-6 text-left"><?php echo $pagination; ?></div>
                    <div class="col-sm-6 text-right"><?php echo $results; ?></div>
                </div>
            </div>
        </div>
    </div>
</div>
<script type="text/javascript">
    $(function () {
        var filter_response_code = $('input[name=\'filter_response_code\']').val();
        //  console.log(filter_response_code);
    });
    $('#button-filter').on('click', function () {
        var url = 'index.php?route=tool/soforp_redirect_manager&token=<?php echo $token; ?>';

        var filter_active = $('select[name=\'filter_active\']').val();
//console.log(filter_active);
        if (filter_active != '*') {
            url += '&filter_active=' + encodeURIComponent(filter_active);
        }

        var filter_response_code = $('select[name=\'filter_response_code\']').val();
//console.log(filter_response_code);
        if (filter_response_code != '*') {
            url += '&filter_response_code=' + encodeURIComponent(filter_response_code);
        }

        var filter_from_url = $('input[name=\'filter_from_url\']').val();

        if (filter_from_url) {
            url += '&filter_from_url=' + encodeURIComponent(filter_from_url);
        }
        var filter_to_url = $('input[name=\'filter_to_url\']').val();

        if (filter_to_url) {
            url += '&filter_to_url=' + encodeURIComponent(filter_to_url);
        }

        var filter_date_start = $('input[name=\'filter_date_start\']').val();
        // console.log(filter_date_start);
        if (filter_date_start) {
            url += '&filter_date_start=' + encodeURIComponent(filter_date_start);
        }
        var filter_date_end = $('input[name=\'filter_date_end\']').val();
        if (filter_date_end) {
            url += '&filter_date_end=' + encodeURIComponent(filter_date_end);
        }

        location = url;
    });
</script>
<script>$('.date').datetimepicker({
        pickTime: false
    });</script>
<?php echo $footer; ?>
