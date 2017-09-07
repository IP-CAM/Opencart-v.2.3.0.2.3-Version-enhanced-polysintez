<?php echo $header; ?><?php echo $column_left; ?>
<div id="content">
  <div class="page-header">
    <div class="container-fluid">
	  <div class="pull-right"><a href="<?php echo $add; ?>" data-toggle="tooltip" title="<?php echo $button_add; ?>" class="btn btn-primary"><i class="fa fa-plus"></i></a>
        <button type="button" data-toggle="tooltip" title="<?php echo $button_delete; ?>" class="btn btn-danger" onclick="confirm('<?php echo $text_confirm; ?>') ? $('#form-customer').submit() : false;"><i class="fa fa-trash-o"></i></button>
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
        <form action="<?php echo $delete; ?>" method="post" enctype="multipart/form-data" id="form-customer">
          <div class="table-responsive">
            <table class="table table-bordered table-hover">
              <thead>
                <tr class="table-pagination">
				  <td colspan="10">
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
                  <td class="text-left"><?php if ($sort == 'name') { ?>
                    <a href="<?php echo $sort_name; ?>" class="<?php echo strtolower($order); ?>"><?php echo $column_name; ?></a>
                    <?php } else { ?>
                    <a href="<?php echo $sort_name; ?>"><?php echo $column_name; ?></a>
                    <?php } ?>
				  </td>
                  <td class="text-left"><?php if ($sort == 'c.email') { ?>
                    <a href="<?php echo $sort_email; ?>" class="<?php echo strtolower($order); ?>"><?php echo $column_email; ?></a>
                    <?php } else { ?>
                    <a href="<?php echo $sort_email; ?>"><?php echo $column_email; ?></a>
                    <?php } ?>
				  </td>
                  <td class="text-center"><?php if ($sort == 'customer_group') { ?>
                    <a href="<?php echo $sort_customer_group; ?>" class="<?php echo strtolower($order); ?>"><?php echo $column_customer_group; ?></a>
                    <?php } else { ?>
                    <a href="<?php echo $sort_customer_group; ?>"><?php echo $column_customer_group; ?></a>
                    <?php } ?>
				  </td>
                  <td class="text-center" style="width: 80px;"><?php if ($sort == 'c.status') { ?>
                    <a href="<?php echo $sort_status; ?>" class="<?php echo strtolower($order); ?>"><?php echo $column_status; ?></a>
                    <?php } else { ?>
                    <a href="<?php echo $sort_status; ?>"><?php echo $column_status; ?></a>
                    <?php } ?>
				  </td>
				  <td class="text-center" style="width: 80px;"><?php if ($sort == 'c.newsletter') { ?>
                    <a href="<?php echo $sort_newsletter; ?>" class="<?php echo strtolower($order); ?>"><?php echo $column_newsletter; ?></a>
                    <?php } else { ?>
                    <a href="<?php echo $sort_newsletter; ?>"><?php echo $column_newsletter; ?></a>
                    <?php } ?>
				  </td>
				  <td class="text-center" style="width: 80px;"><?php if ($sort == 'c.approved') { ?>
                    <a href="<?php echo $sort_approved; ?>" class="<?php echo strtolower($order); ?>"><?php echo $column_approved; ?></a>
                    <?php } else { ?>
                    <a href="<?php echo $sort_approved; ?>"><?php echo $column_approved; ?></a>
                    <?php } ?>
				  </td>
                  <td class="text-center" style="width: 80px;"><?php if ($sort == 'c.ip') { ?>
                    <a href="<?php echo $sort_ip; ?>" class="<?php echo strtolower($order); ?>"><?php echo $column_ip; ?></a>
                    <?php } else { ?>
                    <a href="<?php echo $sort_ip; ?>"><?php echo $column_ip; ?></a>
                    <?php } ?>
				  </td>
                  <td class="text-center" style="width: 140px; min-width: 140px;"><?php if ($sort == 'c.date_added') { ?>
                    <a href="<?php echo $sort_date_added; ?>" class="<?php echo strtolower($order); ?>"><?php echo $column_date_added; ?></a>
                    <?php } else { ?>
                    <a href="<?php echo $sort_date_added; ?>"><?php echo $column_date_added; ?></a>
                    <?php } ?>
				  </td>
                  <td class="text-center" style="width: 170px; min-width: 170px;"><?php echo $column_action; ?></td>
                </tr>
              </thead>
              <tbody>
                <tr class="table-filter">
				  <td></td>
				  <td class="text-left"><input type="text" name="filter_name" value="<?php echo $filter_name; ?>" class="form-control" /></td>
				  <td class="text-left"><input type="text" name="filter_email" value="<?php echo $filter_email; ?>" class="form-control" /></td>
				  <td class="text-center">
				    <select name="filter_customer_group_id" onchange="filter();" class="form-control">
					  <option value="*"></option>
					  <?php foreach ($customer_groups as $customer_group) { ?>
					    <?php if ($customer_group['customer_group_id'] == $filter_customer_group_id) { ?>
						  <option value="<?php echo $customer_group['customer_group_id']; ?>" selected="selected"><?php echo $customer_group['name']; ?></option>
						  <?php } else { ?>
						  <option value="<?php echo $customer_group['customer_group_id']; ?>"><?php echo $customer_group['name']; ?></option>
					    <?php } ?>
					  <?php } ?>
				    </select>
				  </td>
				  <td class="text-center">
				    <select name="filter_status" onchange="filter();" class="form-control">
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
				  <td class="text-center">
				    <select name="filter_newsletter" onchange="filter();" class="form-control">
					  <option value="*"></option>
					  <?php if ($filter_newsletter) { ?>
						<option value="1" selected="selected"><?php echo $text_yes; ?></option>
						<?php } else { ?>
						<option value="1"><?php echo $text_yes; ?></option>
					  <?php } ?>
					  <?php if (!$filter_newsletter && !is_null($filter_newsletter)) { ?>
						<option value="0" selected="selected"><?php echo $text_no; ?></option>
						<?php } else { ?>
						<option value="0"><?php echo $text_no; ?></option>
					  <?php } ?>
					</select>
				  </td>
				  <td class="text-center">
				    <select name="filter_approved" onchange="filter();" class="form-control">
					  <option value="*"></option>
					  <?php if ($filter_approved) { ?>
					    <option value="1" selected="selected"><?php echo $text_yes; ?></option>
					    <?php } else { ?>
					    <option value="1"><?php echo $text_yes; ?></option>
					  <?php } ?>
					  <?php if (!$filter_approved && !is_null($filter_approved)) { ?>
					    <option value="0" selected="selected"><?php echo $text_no; ?></option>
					    <?php } else { ?>
					    <option value="0"><?php echo $text_no; ?></option>
					  <?php } ?>
				    </select>
				  </td>
				  <td class="text-center"><input type="text" name="filter_ip" value="<?php echo $filter_ip; ?>" class="form-control" /></td>
				  <td class="text-center">
				    <div class="input-group date">
					  <input type="text" name="filter_date_added" value="<?php echo $filter_date_added; ?>" data-date-format="YYYY-MM-DD" class="form-control" />
					  <span class="input-group-btn"><button type="button" class="btn btn-default"><i class="fa fa-calendar"></i></button></span>
				    </div>
				  </td>
				  <td class="text-center"><button type="button" onclick="filter();" class="btn btn-info btn-sm"><i class="fa fa-filter"></i> <?php echo $button_filter; ?></button></td>
				</tr>
				<?php if ($customers) { ?>
                  <?php foreach ($customers as $customer) { ?>
					<tr>
					  <td class="text-center"><?php if (in_array($customer['customer_id'], $selected)) { ?>
						<input type="checkbox" name="selected[]" value="<?php echo $customer['customer_id']; ?>" checked="checked" />
						<?php } else { ?>
						<input type="checkbox" name="selected[]" value="<?php echo $customer['customer_id']; ?>" />
						<?php } ?>
					  </td>
					  <td class="text-left">
					    <?php if ($customer_name) { ?>
						  <a data-toggle="popover-maxy" data-target="#customer-name-<?php echo $customer['customer_id']; ?>" data-placement="right right-top" id="customer-name<?php echo $customer['customer_id']; ?>" class="btn btn-link btn-sm"><?php echo $customer['name']; ?></a>
						  <?php } else { ?>
						  <?php echo $customer['name']; ?>
					    <?php } ?>
					  </td>
					  <td class="text-left">
					    <?php if ($customer_email) { ?>
						  <a data-toggle="popover-maxy" data-target="#customer-email-<?php echo $customer['customer_id']; ?>" data-placement="right right-top" id="customer-email<?php echo $customer['customer_id']; ?>" class="btn btn-link btn-sm"><?php echo $customer['email']; ?></a>
						  <?php } else { ?>
						  <?php echo $customer['email']; ?>
					    <?php } ?>
					  </td>
					  <td class="text-center">
					    <?php if ($customer_edit_group) { ?>
						  <a data-toggle="popover-maxy" data-target="#customer-group-<?php echo $customer['customer_id']; ?>" data-placement="right right-top" id="customer-group<?php echo $customer['customer_id']; ?>" class="btn btn-link btn-sm"><?php echo $customer['customer_group']; ?></a>
						  <?php } else { ?>
						  <?php echo $customer['email']; ?>
					    <?php } ?>
					  </td>
					  <td class="text-center">
					    <?php if ($customer_status) { ?>
						  <a class="ajax-status" id="status-<?php echo $customer['customer_id']; ?>"><?php echo $customer['status']; ?></a>
						  <?php } else { ?>
					      <?php echo $customer['no_status']; ?>
						<?php } ?>
					  </td>
					  <td class="text-center">
					    <?php if ($customer_newsletter) { ?>
						  <a class="ajax-newsletter" id="newsletter-<?php echo $customer['customer_id']; ?>"><?php echo $customer['newsletter']; ?></a>
						  <?php } else { ?>
					      <?php echo $customer['no_newsletter']; ?>
						<?php } ?>
					  </td>
					  <td class="text-center">
					    <?php if ($customer_approved) { ?>
						  <a class="ajax-approved" id="approved-<?php echo $customer['customer_id']; ?>"><?php echo $customer['approved']; ?></a>
						  <?php } else { ?>
					      <?php echo $customer['no_approved']; ?>
						<?php } ?>
					  </td>
					  <td class="text-center"><?php echo $customer['ip']; ?></td>
					  <td class="text-center"><?php echo $customer['date_added']; ?></td>
					  <td class="text-center">
						<?php if ($customer_more) { ?><a data-toggle="popover-maxy" data-target="#customer-more-<?php echo $customer['customer_id']; ?>" data-placement="left" class="btn btn-warning btn-sm"><i class="fa fa-star-o fa-fw"></i></a><?php } ?>
						<div class="btn-group" data-toggle="tooltip" title="<?php echo $button_login; ?>">
						  <button type="button" data-toggle="dropdown" class="btn btn-info btn-sm dropdown-toggle"><i class="fa fa-lock fa-fw"></i></button>
						  <ul class="dropdown-menu pull-right">
							<li><a href="index.php?route=customer/customer/login&token=<?php echo $token; ?>&customer_id=<?php echo $customer['customer_id']; ?>&store_id=0" target="_blank"><?php echo $text_default; ?></a></li>
							<?php foreach ($stores as $store) { ?>
							  <li><a href="index.php?route=customer/customer/login&token=<?php echo $token; ?>&customer_id=<?php echo $customer['customer_id']; ?>&store_id=<?php echo $store['store_id']; ?>" target="_blank"><?php echo $store['name']; ?></a></li>
							<?php } ?>
						  </ul>
						</div>
						<?php if ($customer['unlock']) { ?>
						  <a href="<?php echo $customer['unlock']; ?>" data-toggle="tooltip" title="<?php echo $button_unlock; ?>" class="btn btn-warning btn-sm"><i class="fa fa-unlock fa-fw"></i></a>
						  <?php } else { ?>
						  <button type="button" class="btn btn-warning btn-sm" disabled><i class="fa fa-unlock fa-fw"></i></button>
						<?php } ?>
						<a href="<?php echo $customer['edit']; ?>" data-toggle="tooltip" title="<?php echo $button_edit; ?>" class="btn btn-primary btn-sm"><i class="fa fa-pencil fa-fw"></i></a>
					  </td>
					</tr>
                  <?php } ?>
                  <?php } else { ?>
                  <tr>
                    <td class="text-center" colspan="10"><?php echo $text_no_results; ?></td>
                  </tr>
                <?php } ?>
              </tbody>
			  <tfoot>
			    <tr>
                  <td style="width: 1px;" class="text-center"><input type="checkbox" onclick="$('input[name*=\'selected\']').prop('checked', this.checked);" /></td>
                  <td class="text-left"><?php if ($sort == 'name') { ?>
                    <a href="<?php echo $sort_name; ?>" class="<?php echo strtolower($order); ?>"><?php echo $column_name; ?></a>
                    <?php } else { ?>
                    <a href="<?php echo $sort_name; ?>"><?php echo $column_name; ?></a>
                    <?php } ?>
				  </td>
                  <td class="text-left"><?php if ($sort == 'c.email') { ?>
                    <a href="<?php echo $sort_email; ?>" class="<?php echo strtolower($order); ?>"><?php echo $column_email; ?></a>
                    <?php } else { ?>
                    <a href="<?php echo $sort_email; ?>"><?php echo $column_email; ?></a>
                    <?php } ?>
				  </td>
                  <td class="text-center"><?php if ($sort == 'customer_group') { ?>
                    <a href="<?php echo $sort_customer_group; ?>" class="<?php echo strtolower($order); ?>"><?php echo $column_customer_group; ?></a>
                    <?php } else { ?>
                    <a href="<?php echo $sort_customer_group; ?>"><?php echo $column_customer_group; ?></a>
                    <?php } ?>
				  </td>
                  <td class="text-center"><?php if ($sort == 'c.status') { ?>
                    <a href="<?php echo $sort_status; ?>" class="<?php echo strtolower($order); ?>"><?php echo $column_status; ?></a>
                    <?php } else { ?>
                    <a href="<?php echo $sort_status; ?>"><?php echo $column_status; ?></a>
                    <?php } ?>
				  </td>
				  <td class="text-center"><?php if ($sort == 'c.newsletter') { ?>
                    <a href="<?php echo $sort_newsletter; ?>" class="<?php echo strtolower($order); ?>"><?php echo $column_newsletter; ?></a>
                    <?php } else { ?>
                    <a href="<?php echo $sort_newsletter; ?>"><?php echo $column_newsletter; ?></a>
                    <?php } ?>
				  </td>
				  <td class="text-center" style="width: 80px;"><?php if ($sort == 'c.approved') { ?>
                    <a href="<?php echo $sort_approved; ?>" class="<?php echo strtolower($order); ?>"><?php echo $column_approved; ?></a>
                    <?php } else { ?>
                    <a href="<?php echo $sort_approved; ?>"><?php echo $column_approved; ?></a>
                    <?php } ?>
				  </td>
                  <td class="text-center"><?php if ($sort == 'c.ip') { ?>
                    <a href="<?php echo $sort_ip; ?>" class="<?php echo strtolower($order); ?>"><?php echo $column_ip; ?></a>
                    <?php } else { ?>
                    <a href="<?php echo $sort_ip; ?>"><?php echo $column_ip; ?></a>
                    <?php } ?>
				  </td>
                  <td class="text-center"><?php if ($sort == 'c.date_added') { ?>
                    <a href="<?php echo $sort_date_added; ?>" class="<?php echo strtolower($order); ?>"><?php echo $column_date_added; ?></a>
                    <?php } else { ?>
                    <a href="<?php echo $sort_date_added; ?>"><?php echo $column_date_added; ?></a>
                    <?php } ?>
				  </td>
                  <td class="text-center"><?php echo $column_action; ?></td>
                </tr>
				<tr class="table-pagination">
				  <td colspan="10">
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
<input type="hidden" name="permission" value="<?php echo $permission; ?>" id="customer-permission" />
<input type="hidden" name="error_permission" value="<?php echo $error_permission; ?>" id="customer-error-permission" />
<?php foreach ($customers as $customer) { ?>
<?php if ($customer_name) { ?>
<div id="customer-name-<?php echo $customer['customer_id']; ?>" class="popover popover-lg popover-primary animate littleFadeInRight">
  <div class="arrow"></div><h3 class="popover-title"><?php echo $entry_name; ?>
  <a id="close-name-<?php echo $customer['customer_id']; ?>" data-dismiss="popover-maxy" class="btn btn-default btn-xs"><i class="fa fa-close"></i></a></h3>
  <div class="popover-content">
	<div class="row">
	  <div class="form-group">
        <div class="col-sm-6">
	      <label class="control-label" for="input-firstname<?php echo $customer['customer_id']; ?>"><?php echo $entry_firstname; ?></label>
	      <input type="text" name="firstname" value="<?php echo $customer['firstname']; ?>" placeholder="<?php echo $entry_firstname; ?>" id="input-firstname<?php echo $customer['customer_id']; ?>" class="form-control" />
        </div>
	    <div class="col-sm-6">
          <label class="control-label" for="input-lastname<?php echo $customer['customer_id']; ?>"><?php echo $entry_lastname; ?></label>
	      <input type="text" name="lastname" value="<?php echo $customer['lastname']; ?>" placeholder="<?php echo $entry_lastname; ?>" id="input-lastname<?php echo $customer['customer_id']; ?>" class="form-control" />
        </div>
	  </div>
	</div>
  </div>
  <div class="popover-footer">
    <a onclick="editName('<?php echo $customer['customer_id']; ?>');" class="btn btn-primary btn-sm"><i class="fa fa-save fa-fw"></i></a><a onclick="nameClear('<?php echo $customer['customer_id']; ?>');" class="btn btn-danger btn-sm"><i class="fa fa-eraser fa-fw"></i></a>
  </div>
</div>
<?php } ?>
<?php if ($customer_email) { ?>
<div id="customer-email-<?php echo $customer['customer_id']; ?>" class="popover popover-sm popover-primary animate littleFadeInRight">
  <div class="arrow"></div><h3 class="popover-title"><?php echo $entry_email; ?>
  <a id="close-email-<?php echo $customer['customer_id']; ?>" data-dismiss="popover-maxy" class="btn btn-default btn-xs"><i class="fa fa-close"></i></a></h3>
  <div class="popover-content">
	<input type="email" name="email" value="<?php echo $customer['email']; ?>" placeholder="<?php echo $entry_email; ?>" id="input-email<?php echo $customer['customer_id']; ?>" class="form-control" />
  </div>
  <div class="popover-footer">
    <a onclick="editEmail('<?php echo $customer['customer_id']; ?>');" class="btn btn-primary btn-sm"><i class="fa fa-save fa-fw"></i></a><a onclick="emailClear('<?php echo $customer['customer_id']; ?>');" class="btn btn-danger btn-sm"><i class="fa fa-eraser fa-fw"></i></a>
  </div>
</div>
<?php } ?>
<?php if ($customer_edit_group) { ?>
<div id="customer-group-<?php echo $customer['customer_id']; ?>" class="popover popover-sm popover-primary animate littleFadeInRight">
  <div class="arrow"></div><h3 class="popover-title"><?php echo $entry_customer_group; ?>
  <a id="close-group-<?php echo $customer['customer_id']; ?>" data-dismiss="popover-maxy" class="btn btn-default btn-xs"><i class="fa fa-close"></i></a></h3>
  <div class="popover-content">
	<select name="customer_group_id" id="input-customer-group-<?php echo $customer['customer_id']; ?>" class="form-control">
      <?php foreach ($customer_groups as $customer_group) { ?>
        <?php if ($customer_group['customer_group_id'] == $customer['customer_group_id']) { ?>
          <option value="<?php echo $customer_group['customer_group_id']; ?>" selected="selected"><?php echo $customer_group['name']; ?></option>
          <?php } else { ?>
          <option value="<?php echo $customer_group['customer_group_id']; ?>"><?php echo $customer_group['name']; ?></option>
        <?php } ?>
      <?php } ?>
    </select>
  </div>
  <div class="popover-footer">
    <a onclick="editCustomerGroup('<?php echo $customer['customer_id']; ?>');" class="btn btn-primary btn-sm"><i class="fa fa-save fa-fw"></i></a>
  </div>
</div>
<?php } ?>
<?php if ($customer_more) { ?>
<div id="customer-more-<?php echo $customer['customer_id']; ?>" class="popover popover-xxl popover-primary popover-more animate littleFadeInLeft">
  <div class="arrow"></div>
  <div class="popover-content">
	<?php if ($customer_telephone) { ?><a onclick="editMore('<?php echo $customer['customer_id']; ?>', 'telephone');" class="btn btn-primary btn-sm" data-toggle="tooltip" title="<?php echo $text_telephone; ?>"><i class="fa fa-phone fa-fw"></i></a><?php } ?>
	<?php if ($customer_password) { ?><a onclick="editMore('<?php echo $customer['customer_id']; ?>', 'password');" class="btn btn-primary btn-sm" data-toggle="tooltip" title="<?php echo $entry_password; ?>"><i class="fa fa-key fa-fw"></i></a><?php } ?>
	<?php if ($customer_field) { ?><a onclick="editMore('<?php echo $customer['customer_id']; ?>', 'custom_field');" class="btn btn-primary btn-sm" data-toggle="tooltip" title="<?php echo $text_custom_field; ?>"><i class="fa fa-list-ul fa-fw"></i></a><?php } ?>
	<?php if ($customer_address) { ?><a onclick="editMore('<?php echo $customer['customer_id']; ?>', 'address');" class="btn btn-primary btn-sm" data-toggle="tooltip" title="<?php echo $tab_address; ?>"><i class="fa fa-home fa-fw"></i></a><?php } ?>
	<?php if ($customer_history) { ?><a onclick="editMore('<?php echo $customer['customer_id']; ?>', 'history');" class="btn btn-primary btn-sm" data-toggle="tooltip" title="<?php echo $tab_history; ?>"><i class="fa fa-book fa-fw"></i></a><?php } ?>
	<?php if ($customer_transaction) { ?><a onclick="editMore('<?php echo $customer['customer_id']; ?>', 'transaction');" class="btn btn-primary btn-sm" data-toggle="tooltip" title="<?php echo $tab_transaction; ?>"><i class="fa fa-rouble fa-fw"></i></a><?php } ?>
	<?php if ($customer_reward) { ?><a onclick="editMore('<?php echo $customer['customer_id']; ?>', 'reward');" class="btn btn-primary btn-sm" data-toggle="tooltip" title="<?php echo $tab_reward; ?>"><i class="fa fa-star fa-fw"></i></a><?php } ?>
  </div>
</div>
<?php } ?>
<?php } ?>
<div id="modal-customer-edit" class="modal fade">
  <div class="modal-dialog modal-lg animated zoomIn">
    <div class="modal-content">
	  <div id="modal-customer-content"></div>
	</div>
  </div>
</div>
<?php echo $footer; ?>