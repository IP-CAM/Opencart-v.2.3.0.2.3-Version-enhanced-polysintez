<?php echo $header; ?><?php echo $column_left; ?>
<div id="content">
  <div class="page-header">
    <div class="container-fluid">
      <div class="pull-right">
        <button type="submit" form="form-moscow" data-toggle="tooltip" title="<?php echo $button_save; ?>" class="btn btn-primary"><i class="fa fa-save"></i></button>
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

      <form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data" id="form-moscow" class="form-horizontal">

          <div class="form-group">
            <label class="col-sm-6 control-label" for="moscow-tax-class"><?php echo $entry_tax_class; ?></label>
            <div class="col-sm-6">
            <select name="moscow_tax_class_id" id="moscow-tax-class" class="form-control">
                  <option value="0"><?php echo $text_none; ?></option>
                  <?php foreach ($tax_classes as $tax_class) { ?>
                  <?php if ($tax_class['tax_class_id'] == $moscow_tax_class_id) { ?>
                  <option value="<?php echo $tax_class['tax_class_id']; ?>" selected="selected"><?php echo $tax_class['title']; ?></option>
                  <?php } else { ?>
                  <option value="<?php echo $tax_class['tax_class_id']; ?>"><?php echo $tax_class['title']; ?></option>
                  <?php } ?>
                  <?php } ?>
                </select>
            </div>
          </div>

          <div class="form-group">
            <label class="col-sm-6 control-label" for="moscow-geo-zone"><?php echo $entry_geo_zone; ?></label>
            <div class="col-sm-6">
            <select name="moscow_geo_zone_id" id="moscow-geo-zone" class="form-control">
        <option value="0"><?php echo $text_all_zones; ?></option>
        <?php foreach ($geo_zones as $geo_zone) { ?>
        <?php if ($geo_zone['geo_zone_id'] == $moscow_geo_zone_id) { ?>
        <option value="<?php echo $geo_zone['geo_zone_id']; ?>" selected="selected"><?php echo $geo_zone['name']; ?></option>
        <?php } else { ?>
        <option value="<?php echo $geo_zone['geo_zone_id']; ?>"><?php echo $geo_zone['name']; ?></option>
        <?php } ?>
        <?php } ?>
        </select>
            </div>
          </div>

          <div class="form-group">
            <label class="col-sm-6 control-label" for="moscow-moscow-rate"><?php echo $entry_moscow_rate; ?></label>
            <div class="col-sm-6">
              <input type="text" name="moscow_moscow_rate" id="moscow-moscow-rate" value="<?php echo ${'moscow_moscow_rate'}; ?>"  class="form-control" />
            </div>
          </div>


          <div class="form-group">
            <label class="col-sm-6 control-label" for="moscow-zamkad-rate"><?php echo $entry_zamkad_rate; ?></label>
            <div class="col-sm-6">
              <input type="text" name="moscow_zamkad_rate" id="moscow-zamkad-rate" value="<?php echo ${'moscow_zamkad_rate'}; ?>" class="form-control" />
            </div>
          </div>

          <div class="form-group">
            <label class="col-sm-6 control-label" for="moscow-max-distance"><?php echo $entry_max_distance; ?></label>
            <div class="col-sm-6">
              <input type="text" name="moscow_max_distance" id="moscow-max-distance" value="<?php echo $moscow_max_distance; ?>" size="4" class="form-control" />
            </div>
          </div>

          <div class="form-group">
            <label class="col-sm-6 control-label" for="moscow-sort-order"><?php echo $entry_sort_order; ?></label>
            <div class="col-sm-6">
              <input type="text" name="moscow_sort_order" id="moscow-sort-order" value="<?php echo $moscow_sort_order; ?>" size="1" class="form-control" />
            </div>
          </div>

          <div class="form-group">
            <label class="col-sm-6 control-label" for="moscow-status"><?php echo $entry_status; ?></label>
            <div class="col-sm-6">
            <select name="moscow_status" id="moscow-status" class="form-control">
                  <?php if (${'moscow_status'}) { ?>
                  <option value="1" selected="selected"><?php echo $text_enabled; ?></option>
                  <option value="0"><?php echo $text_disabled; ?></option>
                  <?php } else { ?>
                  <option value="1"><?php echo $text_enabled; ?></option>
                  <option value="0" selected="selected"><?php echo $text_disabled; ?></option>
                  <?php } ?>
                </select>

            </div>
          </div>
      </form>
    </div>
  </div>
</div>
</div>

<?php echo $footer; ?> 
