<?php echo $header; ?><?php echo $column_left; ?>
<div id="content">
  <div class="page-header">
    <div class="container-fluid">
	  <div class="pull-right"><a href="<?php echo $add; ?>" data-toggle="tooltip" title="<?php echo $button_add; ?>" class="btn btn-primary"><i class="fa fa-plus"></i></a>
        <button type="button" data-toggle="tooltip" title="<?php echo $button_delete; ?>" class="btn btn-danger" onclick="confirm('<?php echo $text_confirm; ?>') ? $('#form-review').submit() : false;"><i class="fa fa-trash-o"></i></button>
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
        <form action="<?php echo $delete; ?>" method="post" enctype="multipart/form-data" id="form-review">
          <div class="table-responsive">
            <table class="table table-bordered table-hover">
              <thead>
                <tr class="table-pagination">
				  <td colspan="8">
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
                  <td class="text-left"><?php if ($sort == 'pd.name') { ?>
                    <a href="<?php echo $sort_product; ?>" class="<?php echo strtolower($order); ?>"><?php echo $column_product; ?></a>
                    <?php } else { ?>
                    <a href="<?php echo $sort_product; ?>"><?php echo $column_product; ?></a>
                    <?php } ?>
				  </td>
                  <td class="text-left"><?php if ($sort == 'r.author') { ?>
                    <a href="<?php echo $sort_author; ?>" class="<?php echo strtolower($order); ?>"><?php echo $column_author; ?></a>
                    <?php } else { ?>
                    <a href="<?php echo $sort_author; ?>"><?php echo $column_author; ?></a>
                    <?php } ?>
				  </td>
                  <td class="text-center"><?php if ($sort == 'r.rating') { ?>
                    <a href="<?php echo $sort_rating; ?>" class="<?php echo strtolower($order); ?>"><?php echo $column_rating; ?></a>
                    <?php } else { ?>
                    <a href="<?php echo $sort_rating; ?>"><?php echo $column_rating; ?></a>
                    <?php } ?>
				  </td>
				  <td class="text-center" style="width: 80px; min-width: 80px;"><?php echo $column_text; ?></td>
                  <td class="text-center" style="width: 150px; min-width: 150px;"><?php if ($sort == 'r.date_added') { ?>
                    <a href="<?php echo $sort_date_added; ?>" class="<?php echo strtolower($order); ?>"><?php echo $column_date_added; ?></a>
                    <?php } else { ?>
                    <a href="<?php echo $sort_date_added; ?>"><?php echo $column_date_added; ?></a>
                    <?php } ?>
				  </td>
				  <td class="text-center" style="width: 80px; min-width: 80px;"><?php if ($sort == 'r.status') { ?>
                    <a href="<?php echo $sort_status; ?>" class="<?php echo strtolower($order); ?>"><?php echo $column_status; ?></a>
                    <?php } else { ?>
                    <a href="<?php echo $sort_status; ?>"><?php echo $column_status; ?></a>
                    <?php } ?>
				  </td>
                  <td class="text-center" style="width: 80px; min-width: 80px;"><?php echo $column_action; ?></td>
                </tr>
                <tr class="table-filter">
				  <td></td>
				  <td class="text-left"><input type="text" name="filter_product" value="<?php echo $filter_product; ?>" class="form-control" /></td>	
				  <td class="text-left"><input type="text" name="filter_author" value="<?php echo $filter_author; ?>" class="form-control" /></td>
				  <td class="text-center">
				    <select onchange="filter();" name="filter_rating" class="form-control">
					  <?php foreach ($select_rating as $key => $value) { ?>
					    <?php if ($key == $filter_rating) { ?>
						  <option value="<?php echo $key; ?>" selected="selected"><?php echo $value; ?></option>
						  <?php } else { ?>
						  <option value="<?php echo $key; ?>"><?php echo $value; ?></option>
					    <?php } ?>
					  <?php } ?>
				    </select>
				  </td>
				  <td></td>
				  <td class="text-center">
				    <div class="input-group date">
					  <input type="text" name="filter_date_added" value="<?php echo $filter_date_added; ?>" data-date-format="YYYY-MM-DD" class="form-control" />
					  <span class="input-group-btn"><button type="button" class="btn btn-default"><i class="fa fa-calendar"></i></button></span>
					</div>
				  </td>
				  <td class="text-center">
				    <select onchange="filter();" name="filter_status" class="form-control">
					  <option value="*"></option>
					  <?php if ($filter_status) { ?>
						<option value="1" selected="selected"><?php echo $text_enabled; ?></option>
						<?php } else { ?>
						<option value="1"><?php echo $text_enabled; ?></option>
						<?php } ?>
						<?php if (!$filter_status && !is_null($filter_status)) { ?>
						<option value="0" selected="selected"><?php echo $text_disabled; ?></option>
						<?php } else { ?>
						<option value="0"><?php echo $text_disabled; ?></option>
					  <?php } ?>
					</select>
				  </td>
				  <td class="text-center"><button type="button" onclick="filter();" data-toggle="tooltip" title="<?php echo $button_filter; ?>" class="btn btn-info btn-sm"><i class="fa fa-search"></i></button></td>
				</tr>
			  </thead>
			  <tbody>
				<?php if ($reviews) { ?>
                <?php foreach ($reviews as $review) { ?>
                <tr>
                  <td class="text-center"><?php if (in_array($review['review_id'], $selected)) { ?>
                    <input type="checkbox" name="selected[]" value="<?php echo $review['review_id']; ?>" checked="checked" />
                    <?php } else { ?>
                    <input type="checkbox" name="selected[]" value="<?php echo $review['review_id']; ?>" />
                    <?php } ?>
				  </td>
                  <?php if ($review_product) { ?>
				    <td class="text-left"><a data-toggle="popover-maxy" data-target="#review-name-<?php echo $review['review_id']; ?>" data-placement="right right-top" id="review-name<?php echo $review['review_id']; ?>" class="btn btn-link btn-sm"><?php echo $review['name']; ?></a></td>
                    <?php } else { ?>
					<td class="text-left"><?php echo $review['name']; ?></td>
                  <?php } ?>
				  <?php if ($review_author) { ?>
				    <td class="text-left"><a data-toggle="popover-maxy" data-target="#review-author-<?php echo $review['review_id']; ?>" data-placement="right right-top" id="review-author<?php echo $review['review_id']; ?>" class="btn btn-link btn-sm"><?php echo $review['author']; ?></a></td>
                    <?php } else { ?>
					<td class="text-left"><?php echo $review['author']; ?></td>
                  <?php } ?>
				  <?php if ($review_rating) { ?>
				    <td class="text-center">
					  <a data-toggle="popover-maxy" data-target="#review-rating-<?php echo $review['review_id']; ?>" data-placement="right right-top" id="review-rating<?php echo $review['review_id']; ?>" class="btn btn-link btn-sm">
						<span class="rating">
						  <?php for ($i = 1; $i <= 5; $i++) { ?>
						    <?php if ($review['rating'] < $i) { ?>
							  <span class="fa fa-stack"><i class="fa fa-star-o fa-stack-2x"></i></span>
							  <?php } else { ?>
							  <span class="fa fa-stack"><i class="fa fa-star fa-stack-2x"></i><i class="fa fa-star-o fa-stack-2x"></i></span>
						    <?php } ?>
						  <?php } ?>
						</span>
					  </a>
					</td>
                    <?php } else { ?>
					<td class="text-center">
					  <span class="rating">
						<?php for ($i = 1; $i <= 5; $i++) { ?>
						  <?php if ($review['rating'] < $i) { ?>
							<span class="fa fa-stack"><i class="fa fa-star-o fa-stack-2x"></i></span>
							<?php } else { ?>
							<span class="fa fa-stack"><i class="fa fa-star fa-stack-2x"></i><i class="fa fa-star-o fa-stack-2x"></i></span>
						  <?php } ?>
						<?php } ?>
					  </span>
					</td>
                  <?php } ?>
				  <?php if ($review_text) { ?>
				    <td class="text-center"><a data-toggle="popover-maxy" data-target="#review-text-<?php echo $review['review_id']; ?>" data-placement="left left-top" class="btn btn-primary btn-sm"><i class="fa fa-edit"></i></a></td>
                    <?php } else { ?>
					<td class="text-center"><span class="btn btn-link btn-sm" data-toggle="tooltip" title="<?php echo $review['text']; ?>"><i class="fa fa-eye"></i></td>
                  <?php } ?>
                  <td class="text-center"><?php echo $review['date_added']; ?></td>
				  <?php if ($review_status) { ?>
				    <td class="text-center"><a class="ajax-status" id="status-<?php echo $review['review_id']; ?>"><?php echo $review['status']; ?></a></td>
				    <?php } else { ?>
				    <td class="text-center"><?php echo $review['no_status']; ?></td>
				  <?php } ?>
                  <td class="text-center"><a href="<?php echo $review['edit']; ?>" data-toggle="tooltip" title="<?php echo $button_edit; ?>" class="btn btn-primary btn-sm"><i class="fa fa-pencil"></i></a></td>
                </tr>
                <?php } ?>
                <?php } else { ?>
                <tr>
                  <td class="text-center" colspan="8"><?php echo $text_no_results; ?></td>
                </tr>
                <?php } ?>
              </tbody>
			  <tfoot>
			    <tr>
                  <td style="width: 1px;" class="text-center"><input type="checkbox" onclick="$('input[name*=\'selected\']').prop('checked', this.checked);" /></td>
                  <td class="text-left"><?php if ($sort == 'pd.name') { ?>
                    <a href="<?php echo $sort_product; ?>" class="<?php echo strtolower($order); ?>"><?php echo $column_product; ?></a>
                    <?php } else { ?>
                    <a href="<?php echo $sort_product; ?>"><?php echo $column_product; ?></a>
                    <?php } ?>
				  </td>
                  <td class="text-left"><?php if ($sort == 'r.author') { ?>
                    <a href="<?php echo $sort_author; ?>" class="<?php echo strtolower($order); ?>"><?php echo $column_author; ?></a>
                    <?php } else { ?>
                    <a href="<?php echo $sort_author; ?>"><?php echo $column_author; ?></a>
                    <?php } ?>
				  </td>
                  <td class="text-center"><?php if ($sort == 'r.rating') { ?>
                    <a href="<?php echo $sort_rating; ?>" class="<?php echo strtolower($order); ?>"><?php echo $column_rating; ?></a>
                    <?php } else { ?>
                    <a href="<?php echo $sort_rating; ?>"><?php echo $column_rating; ?></a>
                    <?php } ?>
				  </td>
				  <td class="text-center" style="width: 90px;"><?php echo $column_text; ?></td>
                  <td class="text-center"><?php if ($sort == 'r.date_added') { ?>
                    <a href="<?php echo $sort_date_added; ?>" class="<?php echo strtolower($order); ?>"><?php echo $column_date_added; ?></a>
                    <?php } else { ?>
                    <a href="<?php echo $sort_date_added; ?>"><?php echo $column_date_added; ?></a>
                    <?php } ?>
				  </td>
				  <td class="text-center"><?php if ($sort == 'r.status') { ?>
                    <a href="<?php echo $sort_status; ?>" class="<?php echo strtolower($order); ?>"><?php echo $column_status; ?></a>
                    <?php } else { ?>
                    <a href="<?php echo $sort_status; ?>"><?php echo $column_status; ?></a>
                    <?php } ?>
				  </td>
                  <td class="text-center" style="width: 90px;"><?php echo $column_action; ?></td>
                </tr>
				<tr class="table-pagination">
				  <td colspan="8">
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
<input type="hidden" name="permission" value="<?php echo $permission; ?>" id="review-permission" />
<input type="hidden" name="error_permission" value="<?php echo $error_permission; ?>" id="review-error-permission" />
<?php foreach ($reviews as $review) { ?>
<div id="review-name-<?php echo $review['review_id']; ?>" class="popover popover-primary popover-md animate littleFadeInRight">
  <div class="arrow"></div><h3 class="popover-title"><?php echo $column_product; ?>
  <a id="close-name-<?php echo $review['review_id']; ?>" data-dismiss="popover-maxy" class="btn btn-default btn-xs"><i class="fa fa-close"></i></a></h3>
  <div class="popover-content">
    <input type="text" name="product" value="<?php echo $review['name']; ?>" placeholder="<?php echo $column_product; ?>" id="input-name<?php echo $review['review_id']; ?>" class="form-control" /><input id="input-product<?php echo $review['review_id']; ?>" type="hidden" name="product_id" value="<?php echo $review['product_id']; ?>" />
  </div>
  <div class="popover-footer">
    <a onclick="editReviewProduct('<?php echo $review['review_id']; ?>');" class="btn btn-primary btn-sm"><i class="fa fa-save fa-fw"></i></a><a onclick="nameClear('<?php echo $review['review_id']; ?>');" class="btn btn-danger btn-sm"><i class="fa fa-eraser fa-fw"></i></a>
  </div>
</div>
<div id="review-author-<?php echo $review['review_id']; ?>" class="popover popover-primary popover-sm animate littleFadeInRight">
  <div class="arrow"></div><h3 class="popover-title"><?php echo $column_author; ?>
  <a id="close-author-<?php echo $review['review_id']; ?>" data-dismiss="popover-maxy" class="btn btn-default btn-xs"><i class="fa fa-close"></i></a></h3>
  <div class="popover-content">
    <input type="text" name="author" value="<?php echo $review['author']; ?>" placeholder="<?php echo $column_author; ?>" id="input-author<?php echo $review['review_id']; ?>" class="form-control" />
  </div>
  <div class="popover-footer">
    <a onclick="editReviewAuthor('<?php echo $review['review_id']; ?>');" class="btn btn-primary btn-sm"><i class="fa fa-save fa-fw"></i></a><a onclick="authorClear('<?php echo $review['review_id']; ?>');" class="btn btn-danger btn-sm"><i class="fa fa-eraser fa-fw"></i></a>
  </div>
</div>
<div id="review-text-<?php echo $review['review_id']; ?>" class="popover popover-primary popover-lg animate littleFadeInLeft">
  <div class="arrow"></div><h3 class="popover-title"><?php echo $column_text; ?>
  <a id="close-text-<?php echo $review['review_id']; ?>" data-dismiss="popover-maxy" class="btn btn-default btn-xs"><i class="fa fa-close"></i></a></h3>
  <div class="popover-content">
    <textarea name="text" rows="8" placeholder="<?php echo $column_text; ?>" id="input-text<?php echo $review['review_id']; ?>" class="form-control"><?php echo $review['text']; ?></textarea>
  </div>
  <div class="popover-footer">
    <a onclick="editReviewText('<?php echo $review['review_id']; ?>');" class="btn btn-primary btn-sm"><i class="fa fa-save fa-fw"></i></a><a onclick="textClear('<?php echo $review['review_id']; ?>');" class="btn btn-danger btn-sm"><i class="fa fa-eraser fa-fw"></i></a>
  </div>
</div>
<div id="review-rating-<?php echo $review['review_id']; ?>" class="popover popover-primary animate littleFadeInRight">
  <div class="arrow"></div><h3 class="popover-title"><?php echo $column_rating; ?>
  <a id="close-rating-<?php echo $review['review_id']; ?>" data-dismiss="popover-maxy" class="btn btn-default btn-xs"><i class="fa fa-close"></i></a></h3>
  <div class="popover-content text-center">
    <input value="<?php echo $review['rating']; ?>" type="number" class="rating" id="input-rating<?php echo $review['review_id']; ?>" min="0" max=5 step="1" data-size="lg" data-language="<?php echo $language; ?>">
  </div>
  <div class="popover-footer">
    <a onclick="editReviewRating('<?php echo $review['review_id']; ?>');" class="btn btn-primary btn-sm"><i class="fa fa-save fa-fw"></i></a>
  </div>
</div>
<?php } ?>
<?php echo $footer; ?>