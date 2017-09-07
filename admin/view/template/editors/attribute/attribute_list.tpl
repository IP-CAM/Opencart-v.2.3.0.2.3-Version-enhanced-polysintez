<?php echo $header; ?><?php echo $column_left; ?>
<div id="content">
  <div class="page-header">
    <div class="container-fluid">
	  <div class="pull-right">
	    <a href="<?php echo $add; ?>" data-toggle="tooltip" title="<?php echo $button_add; ?>" class="btn btn-primary"><i class="fa fa-plus"></i></a>
		<a onclick="$('#form-attribute').attr('action', '<?php echo $copy; ?>'); $('#form-attribute').submit();" data-toggle="tooltip" title="<?php echo $button_copy; ?>" class="btn btn-warning"><i class="fa fa-copy"></i></a>
        <button type="button" data-toggle="tooltip" title="<?php echo $button_delete; ?>" class="btn btn-danger" onclick="confirm('<?php echo $text_confirm; ?>') ? $('#form-attribute').submit() : false;"><i class="fa fa-trash-o"></i></button>
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
		<form action="<?php echo $delete; ?>" method="post" enctype="multipart/form-data" id="form-attribute">
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
                  <td class="text-left"><?php if ($sort == 'ad.name') { ?>
                    <a href="<?php echo $sort_name; ?>" class="<?php echo strtolower($order); ?>"><?php echo $column_name; ?></a>
                    <?php } else { ?>
                    <a href="<?php echo $sort_name; ?>"><?php echo $column_name; ?></a>
                    <?php } ?></td>
                  <td class="text-left"><?php if ($sort == 'attribute_group') { ?>
                    <a href="<?php echo $sort_attribute_group; ?>" class="<?php echo strtolower($order); ?>"><?php echo $column_attribute_group; ?></a>
                    <?php } else { ?>
                    <a href="<?php echo $sort_attribute_group; ?>"><?php echo $column_attribute_group; ?></a>
                    <?php } ?></td>
                  <td class="text-right"><?php if ($sort == 'a.sort_order') { ?>
                    <a href="<?php echo $sort_sort_order; ?>" class="<?php echo strtolower($order); ?>"><?php echo $column_sort_order; ?></a>
                    <?php } else { ?>
                    <a href="<?php echo $sort_sort_order; ?>"><?php echo $column_sort_order; ?></a>
                    <?php } ?></td>
                  <td class="text-center" style="min-width: 60px; width: 60px;"><?php echo $column_action; ?></td>
                </tr>
              </thead>
              <tbody>
                <?php if ($attributes) { ?>
                <?php foreach ($attributes as $attribute) { ?>
                <tr>
                  <td class="text-center"><?php if (in_array($attribute['attribute_id'], $selected)) { ?>
                    <input type="checkbox" name="selected[]" value="<?php echo $attribute['attribute_id']; ?>" checked="checked" />
                    <?php } else { ?>
                    <input type="checkbox" name="selected[]" value="<?php echo $attribute['attribute_id']; ?>" />
                    <?php } ?>
				  </td>
				  <?php if ($admin_quick_edit_attribute_name) { ?>
				    <td class="text-left"><a onclick="getName('<?php echo $attribute['attribute_id']; ?>');" data-toggle="popover-maxy" data-target="#attribute-name-<?php echo $attribute['attribute_id']; ?>" data-placement="right right-top" id="attribute-name<?php echo $attribute['attribute_id']; ?>" class="btn btn-link btn-sm"><?php echo $attribute['name']; ?></a></td>
				    <?php } else { ?>
				    <td class="text-left"><?php echo $attribute['name']; ?></td>
				  <?php } ?>
				  <?php if ($attribute_attribute_group) { ?>
				    <td class="text-left"><a data-toggle="popover-maxy" data-target="#attribute-group-<?php echo $attribute['attribute_id']; ?>" data-placement="right right-top" id="attribute-group<?php echo $attribute['attribute_id']; ?>" class="btn btn-link btn-sm"><?php echo $attribute['attribute_group']; ?></a></td>
				    <?php } else { ?>
					<td class="text-left"><?php echo $attribute['attribute_group']; ?></td>
				  <?php } ?>
				  <?php if ($attribute_sortorder) { ?>
				    <td class="text-right"><a data-toggle="popover-maxy" data-target="#attribute-sort-<?php echo $attribute['attribute_id']; ?>" data-placement="left left-top" id="attribute-sort<?php echo $attribute['attribute_id']; ?>" class="btn btn-default btn-sm"><?php echo $attribute['sort_order']; ?></a></td>
                    <?php } else { ?>
					<td class="text-right"><?php echo $attribute['sort_order']; ?></td>
                  <?php } ?>
				  <td class="text-right"><a href="<?php echo $attribute['edit']; ?>" data-toggle="tooltip" title="<?php echo $button_edit; ?>" class="btn btn-primary btn-sm"><i class="fa fa-pencil"></i></a></td>
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
                  <td class="text-left"><?php if ($sort == 'ad.name') { ?>
                    <a href="<?php echo $sort_name; ?>" class="<?php echo strtolower($order); ?>"><?php echo $column_name; ?></a>
                    <?php } else { ?>
                    <a href="<?php echo $sort_name; ?>"><?php echo $column_name; ?></a>
                    <?php } ?></td>
                  <td class="text-left"><?php if ($sort == 'attribute_group') { ?>
                    <a href="<?php echo $sort_attribute_group; ?>" class="<?php echo strtolower($order); ?>"><?php echo $column_attribute_group; ?></a>
                    <?php } else { ?>
                    <a href="<?php echo $sort_attribute_group; ?>"><?php echo $column_attribute_group; ?></a>
                    <?php } ?></td>
                  <td class="text-right"><?php if ($sort == 'a.sort_order') { ?>
                    <a href="<?php echo $sort_sort_order; ?>" class="<?php echo strtolower($order); ?>"><?php echo $column_sort_order; ?></a>
                    <?php } else { ?>
                    <a href="<?php echo $sort_sort_order; ?>"><?php echo $column_sort_order; ?></a>
                    <?php } ?></td>
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
<?php foreach ($attributes as $attribute) { ?>
  <div id="attribute-name-<?php echo $attribute['attribute_id']; ?>" class="popover popover-md popover-primary animate littleFadeInRight">
    <div class="arrow"></div>
	<h3 class="popover-title"><?php echo $column_name; ?><a id="close-name-<?php echo $attribute['attribute_id']; ?>" class="btn btn-default btn-xs"><i class="fa fa-close"></i></a></h3>
    <div id="attribute-name-content-<?php echo $attribute['attribute_id']; ?>"></div>
  </div>
  <div id="attribute-group-<?php echo $attribute['attribute_id']; ?>" class="popover popover-xs popover-primary animate littleFadeInRight">
    <div class="arrow"></div>
	<h3 class="popover-title"><?php echo $column_attribute_group; ?><a id="close-attribute-group-<?php echo $attribute['attribute_id']; ?>" data-dismiss="popover-maxy" class="btn btn-default btn-xs"><i class="fa fa-close"></i></a></h3>
    <div class="popover-content">
      <select name="attribute_group_id" class="form-control" id="input-attribute-group<?php echo $attribute['attribute_id']; ?>">
		<?php foreach ($attribute['attribute_groups'] as $attribute_group) { ?>
		  <?php if ($attribute_group['attribute_group_id'] == $attribute['attribute_group_id']) { ?>
			<option value="<?php echo $attribute_group['attribute_group_id']; ?>" selected="selected"><?php echo $attribute_group['name']; ?></option>
			<?php } else { ?>
			<option value="<?php echo $attribute_group['attribute_group_id']; ?>"><?php echo $attribute_group['name']; ?></option>
		  <?php } ?>
		<?php } ?>
	  </select>
    </div>
    <div class="popover-footer">
      <a onclick="editAttributeGroup('<?php echo $attribute['attribute_id']; ?>');" class="btn btn-primary btn-sm"><i class="fa fa-save fa-fw"></i></a>
    </div>
  </div> 
  <div id="attribute-sort-<?php echo $attribute['attribute_id']; ?>" class="popover popover-primary animate littleFadeInLeft">
    <div class="arrow"></div><h3 class="popover-title"><?php echo $column_sort_order; ?>
    <a id="close-sort-<?php echo $attribute['attribute_id']; ?>" data-dismiss="popover-maxy" class="btn btn-default btn-xs"><i class="fa fa-close"></i></a></h3>
    <div class="popover-content">
      <input type="number" name="sort_order" value="<?php echo $attribute['sort_order']; ?>" placeholder="<?php echo $column_sort_order; ?>" id="input-sort<?php echo $attribute['attribute_id']; ?>" class="form-control" />
    </div>
    <div class="popover-footer">
      <a onclick="editSort('<?php echo $attribute['attribute_id']; ?>');" class="btn btn-primary btn-sm"><i class="fa fa-save fa-fw"></i></a><a onclick="sortClear('<?php echo $attribute['attribute_id']; ?>');" class="btn btn-danger btn-sm"><i class="fa fa-eraser fa-fw"></i></a>
    </div>
  </div> 
<?php } ?>
<?php echo $footer; ?>