<?php echo $header; ?><?php echo $column_left; ?>
<div id="content">
  <div class="page-header">
    <div class="container-fluid">
      <div class="pull-right">
	    <a onclick="urlAlias();" data-toggle="tooltip" title="<?php echo $button_add; ?>" class="btn btn-primary"><i class="fa fa-plus fa-fw"></i></a>
		<a onclick="generatorUrlAlias('categories');" data-toggle="tooltip" title="<?php echo $button_generator_categories; ?>" class="btn btn-success"><i class="fa fa-sitemap fa-fw"></i></a>
		<a onclick="generatorUrlAlias('products');" data-toggle="tooltip" title="<?php echo $button_generator_products; ?>" class="btn btn-success"><i class="fa fa-gift fa-fw"></i></a>
		<a onclick="generatorUrlAlias('manufacturers');" data-toggle="tooltip" title="<?php echo $button_generator_manufacturers; ?>" class="btn btn-success"><i class="fa fa-wrench fa-fw"></i></a>
		<a onclick="generatorUrlAlias('informations');" data-toggle="tooltip" title="<?php echo $button_generator_information; ?>" class="btn btn-success"><i class="fa fa-info fa-fw"></i></a>
		<a data-toggle="tooltip" title="<?php echo $button_delete; ?>" class="btn btn-danger" onclick="confirm('<?php echo $text_confirm; ?>') ? $('#form-seo-manager').submit() : false;"><i class="fa fa-trash-o fa-fw"></i></a>
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
		<div class="well">
          <div class="row">
			<div class="col-sm-6">
              <input type="text" name="filter_query" value="<?php echo $filter_query; ?>" placeholder="<?php echo $entry_query; ?>" id="input-query" class="form-control" />
            </div>
			<div class="col-sm-6">
              <div class="input-group">
                <input type="text" name="filter_keyword" value="<?php echo $filter_keyword; ?>" placeholder="<?php echo $entry_keyword; ?>" id="input-keyword" class="form-control" />
				<span class="input-group-btn"><button type="button" id="button-filter" class="btn btn-primary pull-right"><i class="fa fa-search"></i> <?php echo $button_filter; ?></button></span>
              </div>
			</div>
          </div>
        </div>		
		<form action="<?php echo $delete; ?>" method="post" enctype="multipart/form-data" id="form-seo-manager">
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
				  <td class="text-left"><?php if ($sort == 'query') { ?>
					<a href="<?php echo $sort_query; ?>" class="<?php echo strtolower($order); ?>"><?php echo $column_query; ?></a>
					<?php } else { ?>
					<a href="<?php echo $sort_query; ?>"><?php echo $column_query; ?></a>
					<?php } ?>
				  </td>
				  <td class="text-left"><?php if ($sort == 'keyword') { ?>
					<a href="<?php echo $sort_keyword; ?>" class="<?php echo strtolower($order); ?>"><?php echo $column_keyword; ?></a>
					<?php } else { ?>
					<a href="<?php echo $sort_keyword; ?>"><?php echo $column_keyword; ?></a>
					<?php } ?>
				  </td>
				  <td class="text-center" style="width: 80px;"><?php echo $column_action; ?></td>
				</tr>
			  </thead>
			  <tbody>
				<?php if ($url_aliases) { ?>
				  <?php foreach ($url_aliases as $url_alias) { ?>
					<tr>
					  <td class="text-center"><?php if (in_array($url_alias['url_alias_id'], $selected)) { ?>
						<input type="checkbox" name="selected[]" value="<?php echo $url_alias['url_alias_id']; ?>" checked="checked" />
						<?php } else { ?>
						<input type="checkbox" name="selected[]" value="<?php echo $url_alias['url_alias_id']; ?>" />
						<?php } ?>
					  </td>
					  <td class="text-left"><a data-toggle="popover-maxy" data-target="#url-query-<?php echo $url_alias['url_alias_id']; ?>" data-placement="right right-top" id="url-query<?php echo $url_alias['url_alias_id']; ?>" class="btn btn-link btn-sm"><?php echo $url_alias['query']; ?></a></td>
					  <?php if ($url_alias['keyword']) { ?>
					    <td class="text-left"><a data-toggle="popover-maxy" data-target="#url-keyword-<?php echo $url_alias['url_alias_id']; ?>" data-placement="left left-top" id="url-keyword<?php echo $url_alias['url_alias_id']; ?>" class="btn btn-link btn-sm"><?php echo $url_alias['keyword']; ?></a></td>
					    <?php } else { ?>
						<td class="text-left"><a data-toggle="popover-maxy" data-target="#url-keyword-<?php echo $url_alias['url_alias_id']; ?>" data-placement="left left-top" id="url-keyword<?php echo $url_alias['url_alias_id']; ?>" class="btn btn-link btn-sm"><?php echo $text_keyword_none; ?></a></td>
					  <?php } ?>
					  <td class="text-center"><a onclick="urlAlias('<?php echo $url_alias['url_alias_id']; ?>');" data-toggle="tooltip" title="<?php echo $button_edit; ?>" class="btn btn-primary btn-sm"><i class="fa fa-pencil"></i></a></td>
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
				  <td class="text-left"><?php if ($sort == 'query') { ?>
					<a href="<?php echo $sort_query; ?>" class="<?php echo strtolower($order); ?>"><?php echo $column_query; ?></a>
					<?php } else { ?>
					<a href="<?php echo $sort_query; ?>"><?php echo $column_query; ?></a>
					<?php } ?>
				  </td>
				  <td class="text-left"><?php if ($sort == 'keyword') { ?>
					<a href="<?php echo $sort_keyword; ?>" class="<?php echo strtolower($order); ?>"><?php echo $column_keyword; ?></a>
					<?php } else { ?>
					<a href="<?php echo $sort_keyword; ?>"><?php echo $column_keyword; ?></a>
					<?php } ?>
				  </td>
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
<input type="hidden" name="text_keyword_none" value="<?php echo $text_keyword_none; ?>" id="keyword-none" />
<input type="hidden" name="text_confirm" value="<?php echo $text_confirm; ?>" id="delete-seo-confirm" />
<?php foreach ($url_aliases as $url_alias) { ?>
<div id="url-query-<?php echo $url_alias['url_alias_id']; ?>" class="popover popover-primary animate littleFadeInRight">
  <div class="arrow"></div><h3 class="popover-title"><?php echo $column_query; ?>
  <a id="close-url-query-<?php echo $url_alias['url_alias_id']; ?>" data-dismiss="popover-maxy" class="btn btn-default btn-xs"><i class="fa fa-close"></i></a></h3>
  <div class="popover-content">
    <input type="text" name="query" value="<?php echo $url_alias['query']; ?>" placeholder="<?php echo $column_query; ?>" id="input-url-query<?php echo $url_alias['url_alias_id']; ?>" class="form-control" />
  </div>
  <div class="popover-footer">
    <a onclick="editQuery('<?php echo $url_alias['url_alias_id']; ?>');" class="btn btn-primary btn-sm"><i class="fa fa-save fa-fw"></i></a><a onclick="clearQuery('<?php echo $url_alias['url_alias_id']; ?>');" class="btn btn-danger btn-sm"><i class="fa fa-eraser fa-fw"></i></a>
  </div>
</div>
<div id="url-keyword-<?php echo $url_alias['url_alias_id']; ?>" class="popover popover-primary animate littleFadeInLeft">
  <div class="arrow"></div><h3 class="popover-title"><?php echo $column_keyword; ?>
  <a id="close-url-keyword-<?php echo $url_alias['url_alias_id']; ?>" data-dismiss="popover-maxy" class="btn btn-default btn-xs"><i class="fa fa-close"></i></a></h3>
  <div class="popover-content">
    <input type="text" name="keyword" value="<?php echo $url_alias['keyword']; ?>" placeholder="<?php echo $column_keyword; ?>" id="input-url-keyword<?php echo $url_alias['url_alias_id']; ?>" class="form-control" />
  </div>
  <div class="popover-footer">
    <a onclick="editKeyword('<?php echo $url_alias['url_alias_id']; ?>');" class="btn btn-primary btn-sm"><i class="fa fa-save fa-fw"></i></a><a onclick="clearKeyword('<?php echo $url_alias['url_alias_id']; ?>');" class="btn btn-danger btn-sm"><i class="fa fa-eraser fa-fw"></i></a>
  </div>
</div>
<?php } ?>
<div id="modal-url-alias" class="modal fade">
  <div class="modal-dialog modal-lg animated zoomIn">
    <div class="modal-content">
	  <div id="modal-url-alias-content"></div>
	</div>
  </div>
</div>
<?php echo $footer; ?>