<?php echo $header; ?><?php echo $column_left; ?>
<div id="content">
  <div class="page-header">
    <div class="container-fluid">
	  <div class="pull-right">
		<a href="<?php echo $add; ?>" data-toggle="tooltip" title="<?php echo $button_add; ?>" class="btn btn-primary"><i class="fa fa-plus"></i></a>
		<a onclick="$('#form-category').attr('action', '<?php echo $copy; ?>'); $('#form-category').submit();" data-toggle="tooltip" title="<?php echo $button_copy; ?>" class="btn btn-warning"><i class="fa fa-copy"></i></a>
		<a href="<?php echo $repair; ?>" data-toggle="tooltip" title="<?php echo $button_rebuild; ?>" class="btn btn-default"><i class="fa fa-refresh"></i></a>
        <button type="button" data-toggle="tooltip" title="<?php echo $button_delete; ?>" class="btn btn-danger" onclick="confirm('<?php echo $text_confirm; ?>') ? $('#form-category').submit() : false;"><i class="fa fa-trash-o"></i></button>
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
		<form action="<?php echo $delete; ?>" method="post" enctype="multipart/form-data" id="form-category">
          <div class="table-responsive">
            <table class="table table-bordered table-hover">
              <thead>
                <tr class="table-pagination">
				  <td colspan="6">
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
				  <td class="text-center" style="width: 90px;"><?php if ($sort == 'sort_order') { ?>
                    <a href="<?php echo $sort_sort_order; ?>" class="<?php echo strtolower($order); ?>"><?php echo $column_sort_order; ?></a>
                    <?php } else { ?>
                    <a href="<?php echo $sort_sort_order; ?>"><?php echo $column_sort_order; ?></a>
                    <?php } ?>
				  </td>
				  <td class="text-center" style="width: 90px;"><?php echo $column_status; ?></td>
                  <td class="text-center" style="min-width: 90px; width: 90px;"><?php echo $column_action; ?></td>
                </tr>
              </thead>
              <tbody>
                <?php if ($categories) { ?>
                <?php foreach ($categories as $category) { ?>
                <tr>
                  <td class="text-center"><?php if (in_array($category['category_id'], $selected)) { ?>
                    <input type="checkbox" name="selected[]" value="<?php echo $category['category_id']; ?>" checked="checked" />
                    <?php } else { ?>
                    <input type="checkbox" name="selected[]" value="<?php echo $category['category_id']; ?>" />
                    <?php } ?>
				  </td>
				  <?php if ($category_image) { ?>
				    <td class="text-center"><a data-toggle="popover-maxy" data-target="#category-image-<?php echo $category['category_id']; ?>" data-placement="right right-top" id="category-image<?php echo $category['category_id']; ?>" class="btn-hover-list"><img src="<?php echo $category['image']; ?>" alt="<?php echo $category['name']; ?>" class="img-thumbnail" /></a></td>
				    <?php } else { ?>
				    <td class="text-center"><img src="<?php echo $category['image']; ?>" alt="<?php echo $category['name']; ?>" class="img-thumbnail" /></td>
				  <?php } ?>
                  <?php if ($category_name) { ?>
				    <td class="text-left"><a onclick="getName('<?php echo $category['category_id']; ?>');" data-toggle="popover-maxy" data-target="#category-name-<?php echo $category['category_id']; ?>" data-placement="right right-top" id="category-name<?php echo $category['category_id']; ?>" class="btn-hover-list"><?php echo $category['name']; ?></a></td>
				    <?php } else { ?>
				    <td class="text-left"><?php echo $category['name']; ?></td>
				  <?php } ?>
				  <?php if ($category_sort_order) { ?>
				    <td class="text-center"><a data-toggle="popover-maxy" data-target="#category-sort-<?php echo $category['category_id']; ?>" data-placement="left left-top" id="category-sort<?php echo $category['category_id']; ?>" class="btn btn-default btn-sm"><?php echo $category['sort_order']; ?></a></td>
                    <?php } else { ?>
					<td class="text-center"><?php echo $category['sort_order']; ?></td>
                  <?php } ?>
				  <?php if ($category_status) { ?>
				    <td class="text-center"><a class="ajax-status" id="status-<?php echo $category['category_id']; ?>"><?php echo $category['status']; ?></a></td>
				    <?php } else { ?>
				    <td class="text-center"><?php echo $category['no_status']; ?></td>
				  <?php } ?>
                  <td class="text-center">
				    <?php if ($category_more) { ?><a data-toggle="popover-maxy" data-target="#category-more-<?php echo $category['category_id']; ?>" data-placement="left" class="btn btn-warning btn-sm"><i class="fa fa-star-o fa-fw"></i></a><?php } ?>
					<a href="<?php echo $category['edit']; ?>" data-toggle="tooltip" title="<?php echo $button_edit; ?>" class="btn btn-primary btn-sm"><i class="fa fa-pencil fa-fw"></i></a>
				  </td>
                </tr>
                <?php } ?>
                <?php } else { ?>
                <tr>
                  <td class="text-center" colspan="6"><?php echo $text_no_results; ?></td>
                </tr>
                <?php } ?>
              </tbody>
			  <tfoot>
                <tr>
                  <td style="width: 1px;" class="text-center"><input type="checkbox" onclick="$('input[name*=\'selected\']').prop('checked', this.checked);" /></td>
                  <td class="text-center"><?php echo $column_image; ?></td>
				  <td class="text-left"><?php if ($sort == 'name') { ?>
                    <a href="<?php echo $sort_name; ?>" class="<?php echo strtolower($order); ?>"><?php echo $column_name; ?></a>
                    <?php } else { ?>
                    <a href="<?php echo $sort_name; ?>"><?php echo $column_name; ?></a>
                    <?php } ?>
				  </td>
				  <td class="text-center"><?php if ($sort == 'sort_order') { ?>
                    <a href="<?php echo $sort_sort_order; ?>" class="<?php echo strtolower($order); ?>"><?php echo $column_sort_order; ?></a>
                    <?php } else { ?>
                    <a href="<?php echo $sort_sort_order; ?>"><?php echo $column_sort_order; ?></a>
                    <?php } ?>
				  </td>
				  <td class="text-center"><?php echo $column_status; ?></td>
                  <td class="text-center"><?php echo $column_action; ?></td>
                </tr>
				<tr class="table-pagination">
				  <td colspan="6">
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
<input type="hidden" name="placeholder" value="<?php echo $placeholder; ?>" id="category-placeholder" />
<input type="hidden" name="permission" value="<?php echo $permission; ?>" id="category-permission" />
<input type="hidden" name="error_permission" value="<?php echo $error_permission; ?>" id="category-error-permission" />
<?php foreach ($categories as $category) { ?>
<div id="category-image-<?php echo $category['category_id']; ?>" class="popover popover-primary animate littleFadeInRight">
  <div class="arrow"></div><h3 class="popover-title"><?php echo $column_image; ?>
  <a id="close-image-<?php echo $category['category_id']; ?>" data-dismiss="popover-maxy" class="btn btn-default btn-xs"><i class="fa fa-close"></i></a></h3>
  <div class="popover-content">
	<div class="row">
	  <a onclick="linkImage('<?php echo $category['category_id']; ?>');" class="btn btn-link"><img src="<?php echo $category['thumb']; ?>" class="img-thumbnail" /></a><input type="hidden" name="image" value="" id="category-image" />
    </div>
  </div>
  <div class="popover-footer">
    <a onclick="editImage('<?php echo $category['category_id']; ?>');" class="btn btn-primary btn-sm"><i class="fa fa-save fa-fw"></i></a><a onclick="imageClear('<?php echo $category['category_id']; ?>');" class="btn btn-danger btn-sm"><i class="fa fa-eraser fa-fw"></i></a>
  </div>
</div>
<div id="category-name-<?php echo $category['category_id']; ?>" class="popover popover-md popover-hover-list popover-primary animate littleFadeInRight">
  <div class="arrow"></div>
  <h3 class="popover-title"><?php echo $column_name; ?><a id="close-name-<?php echo $category['category_id']; ?>" class="btn btn-default btn-xs"><i class="fa fa-close"></i></a></h3>
  <div id="category-name-content-<?php echo $category['category_id']; ?>"></div>
</div>
<div id="category-sort-<?php echo $category['category_id']; ?>" class="popover popover-primary animate littleFadeInLeft">
  <div class="arrow"></div>
  <h3 class="popover-title"><?php echo $column_sort_order; ?><a id="close-sort-<?php echo $category['category_id']; ?>" data-dismiss="popover-maxy" class="btn btn-default btn-xs"><i class="fa fa-close"></i></a></h3>
  <div class="popover-content">
    <input type="number" name="sort_order" value="<?php echo $category['sort_order']; ?>" placeholder="<?php echo $column_sort_order; ?>" id="input-sort<?php echo $category['category_id']; ?>" class="form-control" />
  </div>
  <div class="popover-footer">
    <a onclick="editSort('<?php echo $category['category_id']; ?>');" class="btn btn-primary btn-sm"><i class="fa fa-save fa-fw"></i></a><a onclick="sortClear('<?php echo $category['category_id']; ?>');" class="btn btn-danger btn-sm"><i class="fa fa-eraser fa-fw"></i></a>
  </div>
</div>
<div id="category-more-<?php echo $category['category_id']; ?>" class="popover popover-primary popover-more animate littleFadeInLeft">
  <div class="arrow"></div>
  <div class="popover-content">
	<?php if ($category_general) { ?><a onclick="editMore('<?php echo $category['category_id']; ?>', 'general');" class="btn btn-primary btn-sm" data-toggle="tooltip" title="<?php echo $text_general; ?>"><i class="fa fa-reorder"></i></a><?php } ?>
    <?php if ($category_parent) { ?><a onclick="editMore('<?php echo $category['category_id']; ?>', 'parent');" class="btn btn-primary btn-sm" data-toggle="tooltip" title="<?php echo $text_parent; ?>"><i class="fa fa-sitemap"></i></a><?php } ?>
	<?php if ($category_seo) { ?><a onclick="editMore('<?php echo $category['category_id']; ?>', 'seo');" class="btn btn-primary btn-sm" data-toggle="tooltip" title="<?php echo $text_seo; ?>"><i class="fa fa-link"></i></a><?php } ?>
	<?php if ($category_filter) { ?><a onclick="editMore('<?php echo $category['category_id']; ?>', 'filter');" class="btn btn-primary btn-sm" data-toggle="tooltip" title="<?php echo $text_filter; ?>"><i class="fa fa-filter"></i></a><?php } ?>
	<?php if ($category_store) { ?><a onclick="editMore('<?php echo $category['category_id']; ?>', 'stores');" class="btn btn-primary btn-sm" data-toggle="tooltip" title="<?php echo $text_stores; ?>"><i class="fa fa-flag"></i></a><?php } ?>
	<?php if ($category_design) { ?><a onclick="editMore('<?php echo $category['category_id']; ?>', 'design');" class="btn btn-primary btn-sm" data-toggle="tooltip" title="<?php echo $text_design; ?>"><i class="fa fa-paint-brush"></i></a><?php } ?>
	<?php if ($category_top) { ?><a class="ajax-top-menu" id="top-<?php echo $category['category_id']; ?>" data-toggle="tooltip" title="<?php echo $column_top; ?>"><?php echo $category['top']; ?></a><?php } ?>
  </div>
</div>
<?php } ?>
<div id="modal-category-edit" class="modal fade">
  <div class="modal-dialog modal-lg animated zoomIn">
    <div class="modal-content">
	  <div id="modal-category-content"></div>
	</div>
  </div>
</div>
<?php echo $footer; ?>