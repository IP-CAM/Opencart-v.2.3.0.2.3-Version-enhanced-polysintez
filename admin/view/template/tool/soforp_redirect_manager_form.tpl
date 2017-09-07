<?php echo $header; ?><?php echo $column_left; ?>
<div id="content">
    <div class="page-header">
        <div class="container-fluid">
            <div class="pull-right">
                <button type="submit" form="form-attribute" data-toggle="tooltip" title="<?php echo $button_save; ?>" class="btn btn-primary"><i class="fa fa-save"></i></button>
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
                <h3 class="panel-title"><i class="fa fa-pencil"></i> <?php echo $text_form; ?></h3>
            </div>
            <div class="panel-body">
                <form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data" id="form-attribute" class="form-horizontal">
                    <div class="form-group">
                        <label class="col-sm-2 control-label"><?php echo $entry_active; ?></label>
                        <div class="col-sm-10">

                            <div class="input-group">
                                <select id="active" name="item[active]" class="form-control">
                                    <option value="0" <?php if( !$item['active'] ) echo 'selected="selected"';?> ><?php echo $text_disabled; ?></option>
                                    <option value="1" <?php if( $item['active'] ) echo 'selected="selected"';?> ><?php echo $text_enabled; ?></option>
                                </select>
                            </div>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label" ><?php echo $entry_response_code; ?></label>
                        <div class="col-sm-10">
                            <select id="response_code" name="item[response_code]" class="form-control">
                                <option value="301"<?php if( $item['response_code'] == 301 ) echo 'selected="selected"';?> ><?php echo $text_response_code_301; ?></option>
                                <option value="302"<?php if( $item['response_code'] == 302 ) echo 'selected="selected"';?> ><?php echo $text_response_code_302; ?></option>
                                <option value="307"<?php if( $item['response_code'] == 307 ) echo 'selected="selected"';?> ><?php echo $text_response_code_307; ?></option>
                            </select>
                        </div>
                    </div>
                    <div class="form-group required" >
                        <label class="col-sm-2 control-label" ><?php echo $entry_from_url; ?></label>
                        <div class="col-sm-10">
                            <textarea id="from_url" rows="3" style="width:100%" name="item[from_url]" class="form-control"><?php echo $item['from_url']; ?></textarea>
                            <?php if ($error_url_group) { ?>
                            <div class="text-danger"><?php echo $error_url_group; ?></div>
                            <?php } ?>
                        </div>
                    </div>

                    <div class="form-group required" >
                        <label class="col-sm-2 control-label" ><?php echo $entry_to_url; ?></label>
                        <div class="col-sm-10">
                            <textarea id="to_url" rows="3" style="width:100%"  name="item[to_url]" class="form-control"><?php echo $item['to_url']; ?></textarea>
                            <?php if ($error_url_group) { ?>
                            <div class="text-danger"><?php echo $error_url_group; ?></div>
                            <?php } ?>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label" for="input-date-available"><?php echo $entry_date_start; ?></label>
                        <div class="col-sm-3">
                            <div class="input-group date">
                                <input type="text" name="item[date_start]" value="<?php echo $item['date_start']; ?>" data-date-format="YYYY-MM-DD" id="input-date-available" class="form-control" />
                                <span class="input-group-btn">
                                    <button class="btn btn-default" type="button"><i class="fa fa-calendar"></i></button>
                                </span></div>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label" for="input-date-available"><?php echo $entry_date_end; ?></label>
                        <div class="col-sm-3">
                            <div class="input-group date">
                                <input type="text" name="item[date_end]" value="<?php echo $item['date_end']; ?>" data-date-format="YYYY-MM-DD" id="input-date-available" class="form-control" />
                                <span class="input-group-btn">
                                    <button class="btn btn-default" type="button"><i class="fa fa-calendar"></i></button>
                                </span></div>
                        </div>
                    </div>

                </form>
            </div>
        </div>
    </div>
</div>
<script>$('.date').datetimepicker({
        pickTime: false
    });</script>
<?php echo $footer; ?>
