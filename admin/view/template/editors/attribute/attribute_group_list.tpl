<?php echo $header; ?><?php echo $column_left; ?>
<div id="content">
  <div class="page-header">
    <div class="container-fluid">
	  <div class="pull-right">
	    <a href="<?php echo $add; ?>" data-toggle="tooltip" title="<?php echo $button_add; ?>" class="btn btn-primary"><i class="fa fa-plus"></i></a>
		<a onclick="$('#form-attribute-group').attr('action', '<?php echo $copy; ?>'); $('#form-attribute-group').submit();" data-toggle="tooltip" title="<?php echo $button_copy; ?>" class="btn btn-warning"><i class="fa fa-copy"></i></a>
        <button type="button" data-toggle="tooltip" title="<?php echo $button_delete; ?>" class="btn btn-danger" onclick="confirm('<?php echo $text_confirm; ?>') ? $('#form-attribute-group').submit() : false;"><i class="fa fa-trash-o"></i></button>
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
		<form action="<?php echo $delete; ?>" method="post" enctype="multipart/form-data" id="form-attribute-group">
          <div class="table-responsive">
            <table class="table table-bordered table-hover">
              <thead>
                <tr class="table-pagination">
				  <td colspan="4">
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
                  <td class="text-left"><?php if ($sort == 'agd.name') { ?>
                    <a href="<?php echo $sort_name; ?>" class="<?php echo strtolower($order); ?>"><?php echo $column_name; ?></a>
                    <?php } else { ?>
                    <a href="<?php echo $sort_name; ?>"><?php echo $column_name; ?></a>
                    <?php } ?></td>
                  <td class="text-right"><?php if ($sort == 'ag.sort_order') { ?>
                    <a href="<?php echo $sort_sort_order; ?>" class="<?php echo strtolower($order); ?>"><?php echo $column_sort_order; ?></a>
                    <?php } else { ?>
                    <a href="<?php echo $sort_sort_order; ?>"><?php echo $column_sort_order; ?></a>
                    <?php } ?></td>
                  <td class="text-center" style="min-width: 60px; width: 60px;"><?php echo $column_action; ?></td>
                </tr>
              </thead>
              <tbody>
                <?php if ($attribute_groups) { ?>
                <?php foreach ($attribute_groups as $attribute_group) { ?>
                <tr>
                  <td class="text-center"><?php if (in_array($attribute_group['attribute_group_id'], $selected)) { ?>
                    <input type="checkbox" name="selected[]" value="<?php echo $attribute_group['attribute_group_id']; ?>" checked="checked" />
                    <?php } else { ?>
                    <input type="checkbox" name="selected[]" value="<?php echo $attribute_group['attribute_group_id']; ?>" />
                    <?php } ?>
				  </td>
				  <?php if ($attribute_group_name) { ?>
				    <td class="text-left"><a onclick="getGroupName('<?php echo $attribute_group['attribute_group_id']; ?>');" data-toggle="popover-maxy" data-target="#attribute-group-name-<?php echo $attribute_group['attribute_group_id']; ?>" data-placement="right right-top" id="attribute-group-name<?php echo $attribute_group['attribute_group_id']; ?>" class="btn btn-link btn-sm"><?php echo $attribute_group['name']; ?></a></td>
				    <?php } else { ?>
				    <td class="text-left"><?php echo $attribute_group['name']; ?></td>
				  <?php } ?>
                  <?php if ($attribute_group_sort_order) { ?>
				    <td class="text-right"><a data-toggle="popover-maxy" data-target="#attribute-group-sort-<?php echo $attribute_group['attribute_group_id']; ?>" data-placement="left left-top" id="attribute-group-sort<?php echo $attribute_group['attribute_group_id']; ?>" class="btn btn-default btn-sm"><?php echo $attribute_group['sort_order']; ?></a></td>
                    <?php } else { ?>
					<td class="text-right"><?php echo $attribute_group['sort_order']; ?></td>
                  <?php } ?>
                  <td class="text-center"><a href="<?php echo $attribute_group['edit']; ?>" data-toggle="tooltip" title="<?php echo $button_edit; ?>" class="btn btn-primary btn-sm"><i class="fa fa-pencil"></i></a></td>
                </tr>
                <?php } ?>
                <?php } else { ?>
                <tr>
                  <td class="text-center" colspan="4"><?php echo $text_no_results; ?></td>
                </tr>
                <?php } ?>
              </tbody>
			  <tfoot>
			    <tr>
                  <td style="width: 1px;" class="text-center"><input type="checkbox" onclick="$('input[name*=\'selected\']').prop('checked', this.checked);" /></td>
                  <td class="text-left"><?php if ($sort == 'agd.name') { ?>
                    <a href="<?php echo $sort_name; ?>" class="<?php echo strtolower($order); ?>"><?php echo $column_name; ?></a>
                    <?php } else { ?>
                    <a href="<?php echo $sort_name; ?>"><?php echo $column_name; ?></a>
                    <?php } ?></td>
                  <td class="text-right"><?php if ($sort == 'ag.sort_order') { ?>
                    <a href="<?php echo $sort_sort_order; ?>" class="<?php echo strtolower($order); ?>"><?php echo $column_sort_order; ?></a>
                    <?php } else { ?>
                    <a href="<?php echo $sort_sort_order; ?>"><?php echo $column_sort_order; ?></a>
                    <?php } ?></td>
                  <td class="text-center"><?php echo $column_action; ?></td>
                </tr>
				<tr class="table-pagination">
				  <td colspan="4">
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
<?php foreach ($attribute_groups as $attribute_group) { ?>
  <div id="attribute-group-name-<?php echo $attribute_group['attribute_group_id']; ?>" class="popover popover-md popover-primary animate littleFadeInRight">
    <div class="arrow"></div>
	<h3 class="popover-title"><?php echo $column_name; ?><a id="close-group-name-<?php echo $attribute_group['attribute_group_id']; ?>" class="btn btn-default btn-xs"><i class="fa fa-close"></i></a></h3>
    <div id="attribute-group-name-content-<?php echo $attribute_group['attribute_group_id']; ?>"></div>
  </div>
  <div id="attribute-group-sort-<?php echo $attribute_group['attribute_group_id']; ?>" class="popover popover-primary animate littleFadeInLeft">
    <div class="arrow"></div>
	<h3 class="popover-title"><?php echo $column_sort_order; ?><a id="close-group-sort-<?php echo $attribute_group['attribute_group_id']; ?>" data-dismiss="popover-maxy" class="btn btn-default btn-xs"><i class="fa fa-close"></i></a></h3>
    <div class="popover-content">
      <input type="number" name="sort_order" value="<?php echo $attribute_group['sort_order']; ?>" placeholder="<?php echo $column_sort_order; ?>" id="input-sort-group<?php echo $attribute_group['attribute_group_id']; ?>" class="form-control" />
    </div>
    <div class="popover-footer">
      <a onclick="editGroupSort('<?php echo $attribute_group['attribute_group_id']; ?>');" class="btn btn-primary btn-sm"><i class="fa fa-save fa-fw"></i></a><a onclick="sortGroupClear('<?php echo $attribute_group['attribute_group_id']; ?>');" class="btn btn-danger btn-sm"><i class="fa fa-eraser fa-fw"></i></a>
    </div>
  </div> 
<?php } ?>
<?php echo $footer; ?>