<?php echo $header; ?><?php echo $column_left; ?>
<div id="content">
  <div class="page-header">
    <div class="container-fluid">
	  <div class="pull-right">
	    <a href="<?php echo $add; ?>" data-toggle="tooltip" title="<?php echo $button_add; ?>" class="btn btn-primary"><i class="fa fa-plus"></i></a>
		<a onclick="$('#form-information').attr('action', '<?php echo $copy; ?>'); $('#form-information').submit();" data-toggle="tooltip" title="<?php echo $button_copy; ?>" class="btn btn-warning"><i class="fa fa-copy"></i></a>
        <button type="button" data-toggle="tooltip" title="<?php echo $button_delete; ?>" class="btn btn-danger" onclick="confirm('<?php echo $text_confirm; ?>') ? $('#form-information').submit() : false;"><i class="fa fa-trash-o"></i></button>
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
		<form action="<?php echo $delete; ?>" method="post" enctype="multipart/form-data" id="form-information">
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
                  <td class="text-left"><?php if ($sort == 'id.title') { ?>
                    <a href="<?php echo $sort_title; ?>" class="<?php echo strtolower($order); ?>"><?php echo $column_title; ?></a>
                    <?php } else { ?>
                    <a href="<?php echo $sort_title; ?>"><?php echo $column_title; ?></a>
                    <?php } ?>
				  </td>
                  <td class="text-right"><?php if ($sort == 'i.sort_order') { ?>
                    <a href="<?php echo $sort_sort_order; ?>" class="<?php echo strtolower($order); ?>"><?php echo $column_sort_order; ?></a>
                    <?php } else { ?>
                    <a href="<?php echo $sort_sort_order; ?>"><?php echo $column_sort_order; ?></a>
                    <?php } ?>
				  </td>
				  <td class="text-center" style="width: 90px;"><?php echo $column_bottom; ?></td>
				  <td class="text-center" style="width: 90px;"><?php echo $column_status; ?></td>
                  <td class="text-center" style="min-width: 90px; width: 90px;"><?php echo $column_action; ?></td>
                </tr>
              </thead>
              <tbody>
                <?php if ($informations) { ?>
                <?php foreach ($informations as $information) { ?>
                <tr>
                  <td class="text-center"><?php if (in_array($information['information_id'], $selected)) { ?>
                    <input type="checkbox" name="selected[]" value="<?php echo $information['information_id']; ?>" checked="checked" />
                    <?php } else { ?>
                    <input type="checkbox" name="selected[]" value="<?php echo $information['information_id']; ?>" />
                    <?php } ?>
				  </td>
				  <?php if ($information_title) { ?>
				    <td class="text-left"><a onclick="getTitle('<?php echo $information['information_id']; ?>');" data-toggle="popover-maxy" data-target="#information-title-<?php echo $information['information_id']; ?>" data-placement="right right-top" id="information-title<?php echo $information['information_id']; ?>" class="btn btn-link btn-sm"><?php echo $information['title']; ?></a></td>
				    <?php } else { ?>
				    <td class="text-left"><?php echo $information['title']; ?></td>
				  <?php } ?>
                  <?php if ($information_sort_order) { ?>
				    <td class="text-right"><a data-toggle="popover-maxy" data-target="#information-sort-<?php echo $information['information_id']; ?>" data-placement="left left-top" id="information-sort<?php echo $information['information_id']; ?>" class="btn btn-default btn-sm"><?php echo $information['sort_order']; ?></a></td>
                    <?php } else { ?>
					<td class="text-right"><?php echo $information['sort_order']; ?></td>
                  <?php } ?>
				  <?php if ($information_bottom) { ?>
				    <td class="text-center"><a class="ajax-bottom" id="bottom-<?php echo $information['information_id']; ?>"><?php echo $information['bottom']; ?></a></td>
				    <?php } else { ?>
				    <td class="text-center"><?php echo $information['no_bottom']; ?></td>
				  <?php } ?>
				  <?php if ($information_status) { ?>
				    <td class="text-center"><a class="ajax-status" id="status-<?php echo $information['information_id']; ?>"><?php echo $information['status']; ?></a></td>
				    <?php } else { ?>
				    <td class="text-center"><?php echo $information['no_status']; ?></td>
				  <?php } ?>
                  <td class="text-center">
				    <?php if ($information_more) { ?><a data-toggle="popover-maxy" data-target="#information-more-<?php echo $information['information_id']; ?>" data-placement="left" class="btn btn-warning btn-sm"><i class="fa fa-star-o fa-fw"></i></a><?php } ?>
					<a href="<?php echo $information['edit']; ?>" data-toggle="tooltip" title="<?php echo $button_edit; ?>" class="btn btn-primary btn-sm"><i class="fa fa-pencil fa-fw"></i></a>
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
                  <td class="text-left"><?php if ($sort == 'id.title') { ?>
                    <a href="<?php echo $sort_title; ?>" class="<?php echo strtolower($order); ?>"><?php echo $column_title; ?></a>
                    <?php } else { ?>
                    <a href="<?php echo $sort_title; ?>"><?php echo $column_title; ?></a>
                    <?php } ?>
				  </td>
                  <td class="text-right"><?php if ($sort == 'i.sort_order') { ?>
                    <a href="<?php echo $sort_sort_order; ?>" class="<?php echo strtolower($order); ?>"><?php echo $column_sort_order; ?></a>
                    <?php } else { ?>
                    <a href="<?php echo $sort_sort_order; ?>"><?php echo $column_sort_order; ?></a>
                    <?php } ?>
				  </td>
				  <td class="text-center"><?php echo $column_bottom; ?></td>
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
<input type="hidden" name="permission" value="<?php echo $permission; ?>" id="information-permission" />
<input type="hidden" name="error_permission" value="<?php echo $error_permission; ?>" id="information-error-permission" />
<?php foreach ($informations as $information) { ?>
<div id="information-title-<?php echo $information['information_id']; ?>" class="popover popover-md popover-primary animate littleFadeInRight">
  <div class="arrow"></div>
  <h3 class="popover-title"><?php echo $column_title; ?><a id="close-title-<?php echo $information['information_id']; ?>" class="btn btn-default btn-xs"><i class="fa fa-close"></i></a></h3>
  <div id="information-title-content-<?php echo $information['information_id']; ?>"></div>
</div>
<div id="information-sort-<?php echo $information['information_id']; ?>" class="popover popover-primary animate littleFadeInLeft">
  <div class="arrow"></div><h3 class="popover-title"><?php echo $column_sort_order; ?>
  <a id="close-sort-<?php echo $information['information_id']; ?>" data-dismiss="popover-maxy" class="btn btn-default btn-xs"><i class="fa fa-close"></i></a></h3>
  <div class="popover-content">
    <input type="number" name="sort_order" value="<?php echo $information['sort_order']; ?>" placeholder="<?php echo $column_sort_order; ?>" id="input-sort<?php echo $information['information_id']; ?>" class="form-control" />
  </div>
  <div class="popover-footer">
    <a onclick="editSort('<?php echo $information['information_id']; ?>');" class="btn btn-primary btn-sm"><i class="fa fa-save fa-fw"></i></a><a onclick="sortClear('<?php echo $information['information_id']; ?>');" class="btn btn-danger btn-sm"><i class="fa fa-eraser fa-fw"></i></a>
  </div>
</div>
<div id="information-more-<?php echo $information['information_id']; ?>" class="popover popover-primary popover-more animate littleFadeInLeft">
  <div class="arrow"></div>
  <div class="popover-content">
	<?php if ($information_general) { ?><a onclick="editMore('<?php echo $information['information_id']; ?>', 'general');" class="btn btn-primary btn-sm" data-toggle="tooltip" title="<?php echo $text_general_data; ?>"><i class="fa fa-reorder"></i></a><?php } ?>
    <?php if ($information_seo) { ?><a onclick="editMore('<?php echo $information['information_id']; ?>', 'seo');" class="btn btn-primary btn-sm" data-toggle="tooltip" title="<?php echo $text_seo_keyword; ?>"><i class="fa fa-link"></i></a><?php } ?>
	<?php if ($information_store) { ?><a onclick="editMore('<?php echo $information['information_id']; ?>', 'stores');" class="btn btn-primary btn-sm" data-toggle="tooltip" title="<?php echo $text_store; ?>"><i class="fa fa-flag"></i></a><?php } ?>
	<?php if ($information_design) { ?><a onclick="editMore('<?php echo $information['information_id']; ?>', 'design');" class="btn btn-primary btn-sm" data-toggle="tooltip" title="<?php echo $text_design; ?>"><i class="fa fa-paint-brush"></i></a><?php } ?>
	<?php if ($information_view) { ?><a href="<?php echo HTTP_CATALOG;?>?route=information/information&information_id=<?php echo $information['information_id'];?>" class="btn btn-default btn-sm" data-toggle="tooltip" target="_blank" title="<?php echo $button_view; ?>"><i class="fa fa-eye"></i></a><?php } ?>
  </div>
</div>
<?php } ?>
<div id="modal-information-edit" class="modal fade">
  <div class="modal-dialog modal-lg animated zoomIn">
    <div class="modal-content">
	  <div id="modal-information-content"></div>
	</div>
  </div>
</div>
<?php echo $footer; ?>