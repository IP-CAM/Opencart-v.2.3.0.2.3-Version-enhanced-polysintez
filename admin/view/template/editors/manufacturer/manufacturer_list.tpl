<?php echo $header; ?><?php echo $column_left; ?>
<div id="content">
  <div class="page-header">
    <div class="container-fluid">
	  <div class="pull-right">
	    <a href="<?php echo $add; ?>" data-toggle="tooltip" title="<?php echo $button_add; ?>" class="btn btn-primary"><i class="fa fa-plus"></i></a>
		<a onclick="$('#form-manufacturer').attr('action', '<?php echo $copy; ?>'); $('#form-manufacturer').submit();" data-toggle="tooltip" title="<?php echo $button_copy; ?>" class="btn btn-warning"><i class="fa fa-copy"></i></a>
        <button type="button" data-toggle="tooltip" title="<?php echo $button_delete; ?>" class="btn btn-danger" onclick="confirm('<?php echo $text_confirm; ?>') ? $('#form-manufacturer').submit() : false;"><i class="fa fa-trash-o"></i></button>
      </div>
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
    <?php if ($success) { ?>
    <div class="alert alert-success"><i class="fa fa-check-circle"></i> <?php echo $success; ?>
      <button type="button" class="close" data-dismiss="alert">&times;</button>
    </div>
    <?php } ?>
    <div class="panel panel-default">
      <div class="panel-heading">
        <h3 class="panel-title"><i class="fa fa-list"></i> <?php echo $text_list; ?></h3>
      </div>
      <div class="panel-body">
        <div class="maxy-backdrop"></div>
	    <div class="messages-body"></div>
		<form action="<?php echo $delete; ?>" method="post" enctype="multipart/form-data" id="form-manufacturer">
          <div class="table-responsive">
            <table class="table table-bordered table-hover">
              <thead>
			    <tr class="table-pagination">
				  <td colspan="5">
					<div class="pull-left"><?php echo $pagination; ?></div>
					<?php if ($pagination) { ?>
					  <div class="pull-right pagination-text"><?php echo $results; ?></div>
					  <?php } else { ?>
					  <div class="pull-right"><?php echo $results; ?></div>
					<?php } ?>
				  </td>
				</tr>
				<tr>
                  <td style="width: 1px;" class="text-center"><input type="checkbox" onclick="$('input[name*=\'selected\']').prop('checked', this.checked);" /></td>
                  <td class="text-center" style="width: 90px;"><?php echo $column_image; ?></td>
				  <td class="text-left"><?php if ($sort == 'name') { ?>
                    <a href="<?php echo $sort_name; ?>" class="<?php echo strtolower($order); ?>"><?php echo $column_name; ?></a>
                    <?php } else { ?>
                    <a href="<?php echo $sort_name; ?>"><?php echo $column_name; ?></a>
                    <?php } ?>
				  </td>
                  <td class="text-right"><?php if ($sort == 'sort_order') { ?>
                    <a href="<?php echo $sort_sort_order; ?>" class="<?php echo strtolower($order); ?>"><?php echo $column_sort_order; ?></a>
                    <?php } else { ?>
                    <a href="<?php echo $sort_sort_order; ?>"><?php echo $column_sort_order; ?></a>
                    <?php } ?>
				  </td>
                  <td class="text-center" style="min-width: 90px; width: 90px;"><?php echo $column_action; ?></td>
                </tr>
              </thead>
              <tbody>
                <?php if ($manufacturers) { ?>
                <?php foreach ($manufacturers as $manufacturer) { ?>
                <tr>
                  <td class="text-center"><?php if (in_array($manufacturer['manufacturer_id'], $selected)) { ?>
                    <input type="checkbox" name="selected[]" value="<?php echo $manufacturer['manufacturer_id']; ?>" checked="checked" />
                    <?php } else { ?>
                    <input type="checkbox" name="selected[]" value="<?php echo $manufacturer['manufacturer_id']; ?>" />
                    <?php } ?>
				  </td>
				  <?php if ($manufacturer_image) { ?>
				    <td class="text-center"><a data-toggle="popover-maxy" data-target="#manufacturer-image-<?php echo $manufacturer['manufacturer_id']; ?>" data-placement="right right-top" id="manufacturer-image<?php echo $manufacturer['manufacturer_id']; ?>" class="btn-hover-list"><img src="<?php echo $manufacturer['image']; ?>" alt="<?php echo $manufacturer['name']; ?>" class="img-thumbnail" /></a></td>
				    <?php } else { ?>
				    <td class="text-center"><img src="<?php echo $manufacturer['image']; ?>" alt="<?php echo $manufacturer['name']; ?>" class="img-thumbnail" /></td>
				  <?php } ?>
                  <?php if ($manufacturer_name) { ?>
				    <td class="text-left"><a data-toggle="popover-maxy" data-target="#manufacturer-name-<?php echo $manufacturer['manufacturer_id']; ?>" data-placement="right right-top" id="manufacturer-name<?php echo $manufacturer['manufacturer_id']; ?>" class="btn btn-link btn-sm"><?php echo $manufacturer['name']; ?></a></td>
                    <?php } else { ?>
					<td class="text-left"><?php echo $manufacturer['name']; ?></td>
                  <?php } ?>
                  <?php if ($manufacturer_sort_order) { ?>
				    <td class="text-right"><a data-toggle="popover-maxy" data-target="#manufacturer-sort-<?php echo $manufacturer['manufacturer_id']; ?>" data-placement="left left-top" id="manufacturer-sort<?php echo $manufacturer['manufacturer_id']; ?>" class="btn btn-default btn-sm"><?php echo $manufacturer['sort_order']; ?></a></td>
                    <?php } else { ?>
					<td class="text-right"><?php echo $manufacturer['sort_order']; ?></td>
                  <?php } ?>
                  <td class="text-center">
				    <?php if ($manufacturer_more) { ?><a data-toggle="popover-maxy" data-target="#manufacturer-more-<?php echo $manufacturer['manufacturer_id']; ?>" data-placement="left" class="btn btn-warning btn-sm"><i class="fa fa-star-o fa-fw"></i></a><?php } ?>
					<a href="<?php echo $manufacturer['edit']; ?>" data-toggle="tooltip" title="<?php echo $button_edit; ?>" class="btn btn-primary btn-sm"><i class="fa fa-pencil fa-fw"></i></a>
				  </td>
                </tr>
                <?php } ?>
                <?php } else { ?>
                <tr>
                  <td class="text-center" colspan="5"><?php echo $text_no_results; ?></td>
                </tr>
                <?php } ?>
              </tbody>
			  <tfoot>
			    <tr>
                  <td style="width: 1px;" class="text-center"><input type="checkbox" onclick="$('input[name*=\'selected\']').prop('checked', this.checked);" /></td>
                  <td class="text-center" style="width: 90px;"><?php echo $column_image; ?></td>
				  <td class="text-left"><?php if ($sort == 'name') { ?>
                    <a href="<?php echo $sort_name; ?>" class="<?php echo strtolower($order); ?>"><?php echo $column_name; ?></a>
                    <?php } else { ?>
                    <a href="<?php echo $sort_name; ?>"><?php echo $column_name; ?></a>
                    <?php } ?>
				  </td>
                  <td class="text-right"><?php if ($sort == 'sort_order') { ?>
                    <a href="<?php echo $sort_sort_order; ?>" class="<?php echo strtolower($order); ?>"><?php echo $column_sort_order; ?></a>
                    <?php } else { ?>
                    <a href="<?php echo $sort_sort_order; ?>"><?php echo $column_sort_order; ?></a>
                    <?php } ?>
				  </td>
                  <td class="text-center"><?php echo $column_action; ?></td>
                </tr>
				<tr class="table-pagination">
				  <td colspan="5">
					<div class="pull-left"><?php echo $pagination; ?></div>
					<?php if ($pagination) { ?>
					  <div class="pull-right pagination-text"><?php echo $results; ?></div>
					  <?php } else { ?>
					  <div class="pull-right"><?php echo $results; ?></div>
					<?php } ?>
				  </td>
				</tr>
			  </tfoot>
            </table>
          </div>
        </form>
      </div>
    </div>
  </div>
</div>
<input type="hidden" name="placeholder" value="<?php echo $placeholder; ?>" id="manufacturer-placeholder" />
<?php foreach ($manufacturers as $manufacturer) { ?>
<div id="manufacturer-image-<?php echo $manufacturer['manufacturer_id']; ?>" class="popover popover-primary animate littleFadeInRight">
  <div class="arrow"></div><h3 class="popover-title"><?php echo $column_image; ?>
  <a id="close-image-<?php echo $manufacturer['manufacturer_id']; ?>" data-dismiss="popover-maxy" class="btn btn-default btn-xs"><i class="fa fa-close"></i></a></h3>
  <div class="popover-content">
    <div class="row">
	  <a onclick="linkImage('<?php echo $manufacturer['manufacturer_id']; ?>');" class="btn btn-link"><img src="<?php echo $manufacturer['thumb']; ?>" class="img-thumbnail" /></a><input type="hidden" name="image" value="" id="manufacturer-image" />
	</div>
  </div>
  <div class="popover-footer">
    <a onclick="editImage('<?php echo $manufacturer['manufacturer_id']; ?>');" class="btn btn-primary btn-sm"><i class="fa fa-save fa-fw"></i></a><a onclick="imageClear('<?php echo $manufacturer['manufacturer_id']; ?>');" class="btn btn-danger btn-sm"><i class="fa fa-eraser fa-fw"></i></a>
  </div>
</div>
<div id="manufacturer-name-<?php echo $manufacturer['manufacturer_id']; ?>" class="popover popover-primary animate littleFadeInRight">
  <div class="arrow"></div><h3 class="popover-title"><?php echo $column_name; ?>
  <a id="close-name-<?php echo $manufacturer['manufacturer_id']; ?>" data-dismiss="popover-maxy" class="btn btn-default btn-xs"><i class="fa fa-close"></i></a></h3>
  <div class="popover-content">
    <input type="text" name="name" value="<?php echo $manufacturer['name']; ?>" placeholder="<?php echo $column_name; ?>" id="input-name<?php echo $manufacturer['manufacturer_id']; ?>" class="form-control" />
  </div>
  <div class="popover-footer">
    <a onclick="editName('<?php echo $manufacturer['manufacturer_id']; ?>');" class="btn btn-primary btn-sm"><i class="fa fa-save fa-fw"></i></a><a onclick="nameClear('<?php echo $manufacturer['manufacturer_id']; ?>');" class="btn btn-danger btn-sm"><i class="fa fa-eraser fa-fw"></i></a>
  </div>
</div>
<div id="manufacturer-sort-<?php echo $manufacturer['manufacturer_id']; ?>" class="popover popover-primary animate littleFadeInLeft">
  <div class="arrow"></div><h3 class="popover-title"><?php echo $column_sort_order; ?>
  <a id="close-sort-<?php echo $manufacturer['manufacturer_id']; ?>" data-dismiss="popover-maxy" class="btn btn-default btn-xs"><i class="fa fa-close"></i></a></h3>
  <div class="popover-content">
    <input type="number" name="sort_order" value="<?php echo $manufacturer['sort_order']; ?>" placeholder="<?php echo $column_sort_order; ?>" id="input-sort<?php echo $manufacturer['manufacturer_id']; ?>" class="form-control" />
  </div>
  <div class="popover-footer">
    <a onclick="editSort('<?php echo $manufacturer['manufacturer_id']; ?>');" class="btn btn-primary btn-sm"><i class="fa fa-save fa-fw"></i></a><a onclick="sortClear('<?php echo $manufacturer['manufacturer_id']; ?>');" class="btn btn-danger btn-sm"><i class="fa fa-eraser fa-fw"></i></a>
  </div>
</div>
<div id="manufacturer-more-<?php echo $manufacturer['manufacturer_id']; ?>" class="popover popover-primary popover-more animate littleFadeInLeft">
  <div class="arrow"></div>
  <div class="popover-content">
	<?php if ($manufacturer_general) { ?><a onclick="editMore('<?php echo $manufacturer['manufacturer_id']; ?>', 'general');" class="btn btn-primary btn-sm" data-toggle="tooltip" title="<?php echo $text_general; ?>"><i class="fa fa-reorder"></i></a><?php } ?>
	<?php if ($manufacturer_seo) { ?><a onclick="editMore('<?php echo $manufacturer['manufacturer_id']; ?>', 'seo');" class="btn btn-primary btn-sm" data-toggle="tooltip" title="<?php echo $text_seo_keyword; ?>"><i class="fa fa-link"></i></a><?php } ?>
	<?php if ($manufacturer_store) { ?><a onclick="editMore('<?php echo $manufacturer['manufacturer_id']; ?>', 'stores');" class="btn btn-primary btn-sm" data-toggle="tooltip" title="<?php echo $text_store; ?>"><i class="fa fa-flag"></i></a><?php } ?>
  </div>
</div>
<?php } ?>
<div id="modal-manufacturer-edit" class="modal fade">
  <div class="modal-dialog modal-lg animated zoomIn">
    <div class="modal-content">
	  <div id="modal-manufacturer-content"></div>
	</div>
  </div>
</div>
<?php echo $footer; ?>