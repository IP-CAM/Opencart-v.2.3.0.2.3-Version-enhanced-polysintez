<?php echo $header; ?><?php echo $column_left; ?>
<div id="content">
  <div class="page-header">
    <div class="container-fluid">
      <div class="pull-right"><a href="<?php echo $invoice; ?>" target="_blank" data-toggle="tooltip" title="<?php echo $button_invoice_print; ?>" class="btn btn-info"><i class="fa fa-print"></i></a> <a href="<?php echo $shipping; ?>" target="_blank" data-toggle="tooltip" title="<?php echo $button_shipping_print; ?>" class="btn btn-info"><i class="fa fa-truck"></i></a> <a href="<?php echo $edit; ?>" data-toggle="tooltip" title="<?php echo $button_edit; ?>" class="btn btn-primary"><i class="fa fa-pencil"></i></a> <a href="<?php echo $cancel; ?>" data-toggle="tooltip" title="<?php echo $button_cancel; ?>" class="btn btn-default"><i class="fa fa-reply"></i></a></div>
      <h1><?php echo $heading_title; ?></h1>
      <ul class="breadcrumb">
        <?php foreach ($breadcrumbs as $breadcrumb) { ?>
        <li><a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a></li>
        <?php } ?>
      </ul>
    </div>
  </div>
  <div class="container-fluid">
    <div class="maxy-backdrop"></div>
	<div class="messages-body"></div>
	<div class="row">
      <div class="col-md-4">
        <div class="panel panel-default">
          <div class="panel-heading">
            <?php if ($order_payment_method || $order_shipping_method) { ?>
			<div class="pull-right"><a href="#" class="dropdown-toggle" data-toggle="dropdown"><i class="fa fa-cog"></i> <i class="caret"></i></a>
			  <ul class="dropdown-menu dropdown-menu-header with-arrow dropdown-menu-right dropdown-menu-right-arrow header-top alerts-dropdown animate littleFadeInUp">
				<li class="dropdown-header-arrow"><i class="fa fa-edit fa-fw"></i> <?php echo $button_edit; ?></li>
				<li class="dropdown-header parent-menu">
				  <ul class="child-menu">
					<?php if ($order_payment_method) { ?><li><a onclick="updateOrderMethod('<?php echo $order_id; ?>', 'payment');" class="btn-order"><?php echo $text_payment_method; ?></a></li><?php } ?>
					<?php if ($shipping_method && $order_shipping_method) { ?><li><a onclick="updateOrderMethod('<?php echo $order_id; ?>', 'shipping');" class="btn-order"><?php echo $text_shipping_method; ?></a></li><?php } ?>
				  </ul>
				</li>
			  </ul>
			</div>
			<?php } ?>
			<h3 class="panel-title"><i class="fa fa-shopping-cart"></i> <?php echo $text_order_detail; ?></h3>
          </div>
          <table class="table">
            <tbody>
              <tr>
                <td style="width: 1%;"><button data-toggle="tooltip" title="<?php echo $text_store; ?>" class="btn btn-info btn-xs"><i class="fa fa-shopping-cart fa-fw"></i></button></td>
                <td><a href="<?php echo $store_url; ?>" target="_blank"><?php echo $store_name; ?></a></td>
              </tr>
              <tr>
                <td><button data-toggle="tooltip" title="<?php echo $text_date_added; ?>" class="btn btn-info btn-xs"><i class="fa fa-calendar fa-fw"></i></button></td>
                <td><?php echo $date_added; ?></td>
              </tr>
              <tr>
                <td><button data-toggle="tooltip" title="<?php echo $text_payment_method; ?>" class="btn btn-info btn-xs"><i class="fa fa-credit-card fa-fw"></i></button></td>
                <td id="payment-method"><?php echo $payment_method; ?></td>
              </tr>
              <?php if ($shipping_method) { ?>
              <tr>
                <td><button data-toggle="tooltip" title="<?php echo $text_shipping_method; ?>" class="btn btn-info btn-xs"><i class="fa fa-truck fa-fw"></i></button></td>
                <td id="shipping-method"><?php echo $shipping_method; ?></td>
              </tr>
              <?php } ?>
            </tbody>
          </table>
        </div>
      </div>
      <div class="col-md-4">
        <div class="panel panel-default">
          <div class="panel-heading">
            <?php if ($order_customer_detail) { ?>
			<div class="pull-right"><a href="#" class="dropdown-toggle" data-toggle="dropdown"><i class="fa fa-cog"></i> <i class="caret"></i></a>
			  <ul class="dropdown-menu dropdown-menu-header with-arrow dropdown-menu-right dropdown-menu-right-arrow header-top alerts-dropdown animate littleFadeInUp">
				<li class="dropdown-header-arrow"><i class="fa fa-cog fa-fw"></i> <?php echo $text_option; ?></li>
				<li class="dropdown-header parent-menu"><span class="parent-menu-header"><i class="fa fa-edit fa-fw"></i> <?php echo $button_edit; ?></span>
				  <ul class="child-menu">
				    <?php if ($customer) { ?><li><a href="<?php echo $customer; ?>" target="_blank"><?php echo $text_customer_detail; ?></a></li><?php } ?>
					<?php if ($order_customer_detail) { ?><li><a onclick="updateOrderData('<?php echo $order_id; ?>', 'customer');" class="btn-order"><?php echo $text_customer_order; ?></a></li><?php } ?>
				  </ul>
				</li>
				<li class="divider"></li>
				<li class="dropdown-header parent-menu"><span class="parent-menu-header"><i class="fa fa-star-o fa-fw"></i> <?php echo $text_additional; ?></span>
				  <ul class="child-menu">
					<li><a href="<?php echo $customer_order; ?>" target="_blank"><?php echo $text_customer_orders; ?></a></li>
					<li><a href="mailto:<?php echo $email; ?>"><?php echo $text_customer_mail; ?></a></li>
				  </ul>
				</li>
			  </ul>
			</div>
			<?php } ?>
			<h3 class="panel-title"><i class="fa fa-user"></i> <?php echo $text_customer_detail; ?></h3>
          </div>
          <table class="table" id="order-customer-detail">
            <tr>
              <td style="width: 1%;"><button data-toggle="tooltip" title="<?php echo $text_customer; ?>" class="btn btn-info btn-xs"><i class="fa fa-user fa-fw"></i></button></td>
              <td><?php if ($customer) { ?>
			    <?php echo $firstname; ?> <?php echo $lastname; ?>
                <?php } else { ?>
                <?php echo $firstname; ?> <?php echo $lastname; ?>
                <?php } ?>
			  </td>
            </tr>
            <tr>
              <td><button data-toggle="tooltip" title="<?php echo $text_customer_group; ?>" class="btn btn-info btn-xs"><i class="fa fa-group fa-fw"></i></button></td>
              <td><?php echo $customer_group; ?></td>
            </tr>
            <tr>
              <td><button data-toggle="tooltip" title="<?php echo $text_email; ?>" class="btn btn-info btn-xs"><i class="fa fa-envelope-o fa-fw"></i></button></td>
              <td><?php echo $email; ?></td>
            </tr>
            <?php if ($telephone) { ?>
			<tr>
              <td><button data-toggle="tooltip" title="<?php echo $text_telephone; ?>" class="btn btn-info btn-xs"><i class="fa fa-phone fa-fw"></i></button></td>
              <td><?php echo $telephone; ?></td>
            </tr>
			<?php } ?>
          </table>
        </div>
      </div>
      <div class="col-md-4">
        <div class="panel panel-default">
          <div class="panel-heading">
            <?php if (!$invoice_no || ($customer && $reward) || $affiliate) { ?>
			<div class="pull-right" id="action-order-option"><a href="#" class="dropdown-toggle" data-toggle="dropdown"><i class="fa fa-cog"></i> <i class="caret"></i></a>
			  <ul class="dropdown-menu dropdown-menu-header with-arrow dropdown-menu-right dropdown-menu-right-arrow header-top alerts-dropdown animate littleFadeInUp">
				<li class="dropdown-header-arrow"><i class="fa fa-cog fa-fw"></i> <?php echo $text_option; ?></li>
				<li class="dropdown-header parent-menu">
				  <ul class="child-menu">
				    <?php if (!$invoice_no) { ?><li id="generate-invoice"><a id="button-invoice" class="btn-order"><?php echo $text_generate_invoice_no; ?></a></li><?php } ?>
					<li><?php if ($customer && $reward) { ?>
					  <?php if (!$reward_total) { ?>
						<a id="button-reward-add" class="btn-order"><?php echo $button_reward_add; ?></a>
						<?php } else { ?>
						<a id="button-reward-remove" class="btn-order"><?php echo $button_reward_remove; ?></a>
					  <?php } ?>
					<?php } ?></li>
					<li><?php if ($affiliate) { ?>
					  <?php if (!$commission_total) { ?>
					    <a id="button-commission-add" class="btn-order"><?php echo $button_commission_add; ?></a>
						<?php } else { ?>
						<a id="button-commission-remove" class="btn-order"><?php echo $button_commission_remove; ?></a>
					  <?php } ?>
					<?php } ?></li>
				  </ul>
				</li>
			  </ul>
			</div>
			<?php } ?>
			<h3 class="panel-title"><i class="fa fa-cog"></i> <?php echo $text_option; ?></h3>
          </div>
          <table class="table">
            <tbody>
              <tr>
                <td><?php echo $text_invoice; ?></td>
                <td id="invoice" class="text-right"><?php echo $invoice_no; ?></td>
              </tr>
              <?php if ($customer && $reward) { ?>
			  <tr>
                <td><?php echo $text_reward; ?></td>
                <td class="text-right">
				  <?php if (!$reward_total) { ?>
					<span id="reward-data" class="text-success"><?php echo $reward; ?></span>
					<?php } else { ?>
					<span id="reward-data" class="text-danger"><?php echo $reward; ?></span>
				  <?php } ?>
				</td>
              </tr>
			  <?php } ?>
              <?php if ($affiliate) { ?>
			  <tr>
                <td><?php echo $text_affiliate; ?><?php if ($affiliate) { ?>: <a href="<?php echo $affiliate; ?>"><?php echo $affiliate_firstname; ?> <?php echo $affiliate_lastname; ?></a><?php } ?></td>
                <td class="text-right">
				  <?php if (!$commission_total) { ?>
				    <span id="commission-data" class="text-success"><?php echo $commission; ?></span>
					<?php } else { ?>
					<span id="commission-data" class="text-danger"><?php echo $commission; ?></span>
				  <?php } ?>
				</td>
              </tr>
			  <?php } ?>
            </tbody>
          </table>
        </div>
      </div>
    </div>
    <div class="table-responsive">
      <table class="table table-bordered" id="product">
        <thead>
          <tr>
            <?php if ($order_product) { ?><td class="text-center" style="width: 1%;"><?php echo $column_action; ?></td><?php } ?>
			<td class="text-center" style="width: 1%;"><?php echo $column_image; ?></td>
			<td class="text-left"><?php echo $column_product; ?></td>
            <td class="text-left"><?php echo $column_model; ?></td>
            <td class="text-center"><?php echo $column_quantity; ?></td>
            <td class="text-right"><?php echo $column_price; ?></td>
            <td class="text-right"><?php echo $column_total; ?></td>
          </tr>
        </thead>
        <tbody id="order-products"></tbody>
		<?php if ($order_product) { ?>
		  <tbody id="product-row-add" class="hidden form-horizontal">
			<tr>
			  <td colspan="7"><div id="option" class="col-sm-12"></div></td>
			</tr>
			<tr>
			  <td class="text-center"><a id="product-add-cancel" data-toggle="tooltip" title="<?php echo $button_cancel; ?>" class="btn btn-warning"><i class="fa fa-reply"></i></a></td>
			  <td></td>
			  <td class="text-left"><input type="text" name="product" id="add_product_name" value=""  class="form-control" /><input type="hidden" id="add_product_id" name="product_id" value="" /></td>
			  <td></td>
			  <td class="text-right"><input type="text" id="quantity" name="quantity" value="1"  class="form-control" /></td>
			  <td></td>
			  <td class="text-right"><a onclick="addOrderProduct('<?php echo $order_id; ?>');" id="button-add-product" data-loading-text="<?php echo $text_loading; ?>" class="btn btn-success"><i class="fa fa-plus-circle"></i> <?php echo $button_product_add; ?></a></td>
			</tr>
		  </tbody>
		  <tfoot id="button-add">
			<tr>
			  <td colspan="7" class="text-right"><a class="btn btn-primary" id="show-add-product"><i class="fa fa-plus-circle"></i> <?php echo $button_product_add; ?></a></td>
			</tr>
		  </tfoot>
		<?php } ?>
      </table>
	</div>
	<div class="row">
	  <div class="col-md-<?php if ($shipping_method) { ?>6<?php } else { ?>12<?php } ?>">
        <div class="panel panel-default panel-margin">
          <div class="panel-heading">
            <?php if ($order_payment_detail) { ?>
			<div class="pull-right"><a href="#" class="dropdown-toggle" data-toggle="dropdown"><i class="fa fa-cog"></i> <i class="caret"></i></a>
			  <ul class="dropdown-menu dropdown-menu-header with-arrow dropdown-menu-right dropdown-menu-right-arrow header-top alerts-dropdown animate littleFadeInUp">
				<li class="dropdown-header-arrow"><i class="fa fa-edit fa-fw"></i> <?php echo $button_edit; ?></li>
				<li class="dropdown-header parent-menu">
				  <ul class="child-menu">
					<li><a onclick="updateOrderData('<?php echo $order_id; ?>', 'payment_address');" class="btn-order"><?php echo $text_payment_address; ?></a></li>
				  </ul>
				</li>
			  </ul>
			</div>
			<?php } ?>
			<h3 class="panel-title"><i class="fa fa-credit-card"></i> <?php echo $text_payment_address; ?></h3>
          </div>
          <table class="table table-bordered">
            <tr>
              <td class="text-left" id="order-payment-address"><?php echo $payment_address; ?></td>
            </tr>
          </table>
        </div>
      </div>
	  <?php if ($shipping_method) { ?>
	  <div class="col-md-6">
        <div class="panel panel-default panel-margin">
          <div class="panel-heading">
            <?php if ($order_shipping_detail) { ?>
			<div class="pull-right"><a href="#" class="dropdown-toggle" data-toggle="dropdown"><i class="fa fa-cog"></i> <i class="caret"></i></a>
			  <ul class="dropdown-menu dropdown-menu-header with-arrow dropdown-menu-right dropdown-menu-right-arrow header-top alerts-dropdown animate littleFadeInUp">
				<li class="dropdown-header-arrow"><i class="fa fa-edit fa-fw"></i> <?php echo $button_edit; ?></li>
				<li class="dropdown-header parent-menu">
				  <ul class="child-menu">
					<li><a onclick="updateOrderData('<?php echo $order_id; ?>', 'shipping_address');" class="btn-order"><?php echo $text_shipping_address; ?></a></li>
				  </ul>
				</li>
			  </ul>
			</div>
			<?php } ?>
			<h3 class="panel-title"><i class="fa fa-truck"></i> <?php echo $text_shipping_address; ?></h3>
          </div>
          <table class="table table-bordered">
            <tr>
              <td class="text-left" id="order-shipping-address"><?php echo $shipping_address; ?></td>
            </tr>
          </table>
        </div>
      </div>
	  <?php } ?>
	</div>
    <?php if ($comment) { ?>
	  <div class="table-responsive">
        <table class="table table-bordered">
          <thead>
            <tr>
              <td><?php echo $text_comment; ?></td>
            </tr>
          </thead>
          <tbody>
            <tr>
              <td><?php echo $comment; ?></td>
            </tr>
          </tbody>
        </table>
	  </div>
    <?php } ?>
    <div class="panel panel-default panel-margin">
      <div class="panel-heading">
        <h3 class="panel-title"><i class="fa fa-comment-o"></i> <?php echo $text_history; ?></h3>
      </div>
      <div class="panel-body">
        <ul class="nav nav-tabs">
          <li class="active"><a href="#tab-history" data-toggle="tab"><?php echo $tab_history; ?></a></li>
          <li><a href="#tab-additional" data-toggle="tab"><?php echo $tab_additional; ?></a></li>
          <?php foreach ($tabs as $tab) { ?>
          <li><a href="#tab-<?php echo $tab['code']; ?>" data-toggle="tab"><?php echo $tab['title']; ?></a></li>
          <?php } ?>
        </ul>
        <div class="tab-content">
          <div class="tab-pane active" id="tab-history">
            <div id="history"></div>
            <br />
            <fieldset>
              <legend><?php echo $text_history_add; ?></legend>
              <form class="form-horizontal">
                <div class="form-group">
                  <label class="col-sm-2 control-label" for="input-order-status"><?php echo $entry_order_status; ?></label>
                  <div class="col-sm-10">
                    <select name="order_status_id" id="input-order-status" class="form-control">
                      <?php foreach ($order_statuses as $order_statuses) { ?>
                      <?php if ($order_statuses['order_status_id'] == $order_status_id) { ?>
                      <option value="<?php echo $order_statuses['order_status_id']; ?>" selected="selected"><?php echo $order_statuses['name']; ?></option>
                      <?php } else { ?>
                      <option value="<?php echo $order_statuses['order_status_id']; ?>"><?php echo $order_statuses['name']; ?></option>
                      <?php } ?>
                      <?php } ?>
                    </select>
                  </div>
                </div>
                <div class="form-group">
                  <label class="col-sm-2 control-label" for="input-override"><span data-toggle="tooltip" title="<?php echo $help_override; ?>"><?php echo $entry_override; ?></span></label>
                  <div class="col-sm-10">
                    <input type="checkbox" name="override" value="1" id="input-override" />
                  </div>
                </div>
                <div class="form-group">
                  <label class="col-sm-2 control-label" for="input-notify"><?php echo $entry_notify; ?></label>
                  <div class="col-sm-10">
                    <input type="checkbox" name="notify" value="1" id="input-notify" />
                  </div>
                </div>
                <div class="form-group">
                  <label class="col-sm-2 control-label" for="input-comment"><?php echo $entry_comment; ?></label>
                  <div class="col-sm-10">
                    <textarea name="comment" rows="8" id="input-comment" class="form-control"></textarea>
                  </div>
                </div>
              </form>
            </fieldset>
            <div class="text-right">
              <button id="button-history" data-loading-text="<?php echo $text_loading; ?>" class="btn btn-primary"><i class="fa fa-plus-circle"></i> <?php echo $button_history_add; ?></button>
            </div>
          </div>
          <div class="tab-pane" id="tab-additional">
            <?php if ($account_custom_fields) { ?>
            <div class="table-responsive">
              <table class="table table-bordered">
                <thead>
                  <tr>
                    <td colspan="2"><?php echo $text_account_custom_field; ?></td>
                  </tr>
                </thead>
                <tbody>
                  <?php foreach ($account_custom_fields as $custom_field) { ?>
                  <tr>
                    <td><?php echo $custom_field['name']; ?></td>
                    <td><?php echo $custom_field['value']; ?></td>
                  </tr>
                  <?php } ?>
                </tbody>
              </table>
            </div>
            <?php } ?>
            <?php if ($payment_custom_fields) { ?>
            <div class="table-responsive">
              <table class="table table-bordered">
                <thead>
                  <tr>
                    <td colspan="2"><?php echo $text_payment_custom_field; ?></td>
                  </tr>
                </thead>
                <tbody>
                  <?php foreach ($payment_custom_fields as $custom_field) { ?>
                  <tr>
                    <td><?php echo $custom_field['name']; ?></td>
                    <td><?php echo $custom_field['value']; ?></td>
                  </tr>
                  <?php } ?>
                </tbody>
              </table>
            </div>
            <?php } ?>
            <?php if ($shipping_method && $shipping_custom_fields) { ?>
            <div class="table-responsive">
              <table class="table table-bordered">
                <thead>
                  <tr>
                    <td colspan="2"><?php echo $text_shipping_custom_field; ?></td>
                  </tr>
                </thead>
                <tbody>
                  <?php foreach ($shipping_custom_fields as $custom_field) { ?>
                  <tr>
                    <td><?php echo $custom_field['name']; ?></td>
                    <td><?php echo $custom_field['value']; ?></td>
                  </tr>
                  <?php } ?>
                </tbody>
              </table>
            </div>
            <?php } ?>
            <div class="table-responsive">
              <table class="table table-bordered">
                <thead>
                  <tr>
                    <td colspan="2"><?php echo $text_browser; ?></td>
                  </tr>
                </thead>
                <tbody>
                  <tr>
                    <td><?php echo $text_ip; ?></td>
                    <td><?php echo $ip; ?></td>
                  </tr>
                  <?php if ($forwarded_ip) { ?>
                  <tr>
                    <td><?php echo $text_forwarded_ip; ?></td>
                    <td><?php echo $forwarded_ip; ?></td>
                  </tr>
                  <?php } ?>
                  <tr>
                    <td><?php echo $text_user_agent; ?></td>
                    <td><?php echo $user_agent; ?></td>
                  </tr>
                  <tr>
                    <td><?php echo $text_accept_language; ?></td>
                    <td><?php echo $accept_language; ?></td>
                  </tr>
                </tbody>
              </table>
            </div>
          </div>
          <?php foreach ($tabs as $tab) { ?>
          <div class="tab-pane" id="tab-<?php echo $tab['code']; ?>"><?php echo $tab['content']; ?></div>
          <?php } ?>
        </div>
      </div>
    </div>
  </div>
<div id="modal-order" class="modal fade">
  <div class="modal-dialog modal-lg animated zoomIn">
    <div class="modal-content">
	  <div id="content-order"></div>
	</div>
  </div>
</div>
<input type="hidden" name="permission" value="<?php echo $permission; ?>" id="order-permission" />
<input type="hidden" name="error_permission" value="<?php echo $error_permission; ?>" id="order-error-permission" />
<input type="hidden" name="text_confirm" value="<?php echo $text_confirm; ?>" id="text-confirm" />
<script type="text/javascript"><!--
$('#order-products').load('index.php?route=editors/catalog_edit/order_products&token=<?php echo $token; ?>&order_id=<?php echo $order_id; ?>');
//--></script>
<script type="text/javascript"><!--
$(document).delegate('#button-ip-add', 'click', function() {
	$.ajax({
		url: 'index.php?route=user/api/addip&token=<?php echo $token; ?>&api_id=<?php echo $api_id; ?>',
		type: 'post',
		data: 'ip=<?php echo $api_ip; ?>',
		dataType: 'json',
		beforeSend: function() {
			$('#button-ip-add').button('loading');
		},
		complete: function() {
			$('#button-ip-add').button('reset');
		},
		success: function(json) {
			$('.alert').remove();

			if (json['error']) {
				$('#content > .container-fluid').prepend('<div class="alert alert-danger"><i class="fa fa-exclamation-circle"></i> ' + json['error'] + ' <button type="button" class="close" data-dismiss="alert">&times;</button></div>');
			}

			if (json['success']) {
				$('#content > .container-fluid').prepend('<div class="alert alert-success"><i class="fa fa-check-circle"></i> ' + json['success'] + ' <button type="button" class="close" data-dismiss="alert">&times;</button></div>');
			}
		},
		error: function(xhr, ajaxOptions, thrownError) {
			alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
		}
	});
});

$('#product-row-add input[name=\'product\']').autocomplete({
	'source': function(request, response) {
		$.ajax({
			url: 'index.php?route=editors/product/autocomplete&token=<?php echo $token; ?>&filter_name=' +  encodeURIComponent(request),
			dataType: 'json',			
			success: function(json) {
				response($.map(json, function(item) {
					return {
						label: item['name'],
						value: item['product_id'],
						model: item['model'],
						option: item['option'],
						price: item['price']	
					}
				}));
			}
		});
	},
	'select': function(item) {
		$('input[name=\'product\']').val(item['label']);
		$('input[name=\'product_id\']').val(item['value']);	

		if (item['option'] != '') {
 			html  = '<fieldset>';
            html += '  <legend><?php echo $entry_option; ?></legend>';
			  
			for (i = 0; i < item['option'].length; i++) {
				option = item['option'][i];
				
				if (option['type'] == 'select') {
					html += '<div class="form-group' + (option['required'] ? ' required' : '') + '">';
					html += '  <label class="col-sm-2 control-label" for="input-option' + option['product_option_id'] + '">' + option['name'] + '</label>';
					html += '  <div class="col-sm-10">';
					html += '    <select name="option[' + option['product_option_id'] + ']" id="input-option' + option['product_option_id'] + '" class="form-control">';
					html += '      <option value=""><?php echo $text_select; ?></option>';

					for (j = 0; j < option['product_option_value'].length; j++) {
						option_value = option['product_option_value'][j];

						html += '<option value="' + option_value['product_option_value_id'] + '">' + option_value['name'];

						if (option_value['price']) {
							html += ' (' + option_value['price_prefix'] + option_value['price'] + ')';
						}

						html += '</option>';
					}

					html += '    </select>';
					html += '  </div>';
					html += '</div>';
				}
				
				if (option['type'] == 'radio') {
					html += '<div class="form-group' + (option['required'] ? ' required' : '') + '">';
					html += '  <label class="col-sm-2 control-label" for="input-option' + option['product_option_id'] + '">' + option['name'] + '</label>';
					html += '  <div class="col-sm-10">';
					html += '    <div id="input-option' + option['product_option_id'] + '">';
					
					for (j = 0; j < option['product_option_value'].length; j++) {
						option_value = option['product_option_value'][j];
						
						html += '<div class="radio">';
						
						html += '  <label><input type="radio" name="option[' + option['product_option_id'] + '][]" value="' + option_value['product_option_value_id'] + '" /> ' + option_value['name'];
						
						if (option_value['price']) {
							html += ' (' + option_value['price_prefix'] + option_value['price'] + ')';
						}
						
						html += '  </label>';
						html += '</div>';
					}
										
					html += '    </div>';
					html += '  </div>';
					html += '</div>';
				}
					
				if (option['type'] == 'checkbox') {
					html += '<div class="form-group' + (option['required'] ? ' required' : '') + '">';
					html += '  <label class="col-sm-2 control-label">' + option['name'] + '</label>';
					html += '  <div class="col-sm-10">';
					html += '    <div id="input-option' + option['product_option_id'] + '">';

					for (j = 0; j < option['product_option_value'].length; j++) {
						option_value = option['product_option_value'][j];

						html += '<div>';

						html += '  <label><input type="checkbox" name="option[' + option['product_option_id'] + '][]" value="' + option_value['product_option_value_id'] + '" /> ' + option_value['name'];

						if (option_value['price']) {
							html += ' (' + option_value['price_prefix'] + option_value['price'] + ')';
						}

						html += '  </label>';
						html += '</div>';
					}

					html += '    </div>';
					html += '  </div>';
					html += '</div>';
				}
			
				if (option['type'] == 'image') {
					html += '<div class="form-group' + (option['required'] ? ' required' : '') + '">';
					html += '  <label class="col-sm-2 control-label" for="input-option' + option['product_option_id'] + '">' + option['name'] + '</label>';
					html += '  <div class="col-sm-10">';
					html += '    <select name="option[' + option['product_option_id'] + ']" id="input-option' + option['product_option_id'] + '" class="form-control">';
					html += '      <option value=""><?php echo $text_select; ?></option>';

					for (j = 0; j < option['product_option_value'].length; j++) {
						option_value = option['product_option_value'][j];

						html += '<option value="' + option_value['product_option_value_id'] + '">' + option_value['name'];

						if (option_value['price']) {
							html += ' (' + option_value['price_prefix'] + option_value['price'] + ')';
						}

						html += '</option>';
					}

					html += '    </select>';
					html += '  </div>';
					html += '</div>';
				}
						
				if (option['type'] == 'text') {
					html += '<div class="form-group' + (option['required'] ? ' required' : '') + '">';
					html += '  <label class="col-sm-2 control-label" for="input-option' + option['product_option_id'] + '">' + option['name'] + '</label>';
					html += '  <div class="col-sm-10"><input type="text" name="option[' + option['product_option_id'] + ']" value="' + option['value'] + '" id="input-option' + option['product_option_id'] + '" class="form-control" /></div>';
					html += '</div>';
				}

				if (option['type'] == 'textarea') {
					html += '<div class="form-group' + (option['required'] ? ' required' : '') + '">';
					html += '  <label class="col-sm-2 control-label" for="input-option' + option['product_option_id'] + '">' + option['name'] + '</label>';
					html += '  <div class="col-sm-10"><textarea name="option[' + option['product_option_id'] + ']" rows="5" id="input-option' + option['product_option_id'] + '" class="form-control">' + option['value'] + '</textarea></div>';
					html += '</div>';
				}

				if (option['type'] == 'file') {
					html += '<div class="form-group' + (option['required'] ? ' required' : '') + '">';
					html += '  <label class="col-sm-2 control-label">' + option['name'] + '</label>';
					html += '  <div class="col-sm-10">';
					html += '    <button type="button" id="button-upload' + option['product_option_id'] + '" data-loading-text="<?php echo $text_loading; ?>" class="btn btn-default"><i class="fa fa-upload"></i> <?php echo $button_upload; ?></button>';
					html += '    <input type="hidden" name="option[' + option['product_option_id'] + ']" value="' + option['value'] + '" id="input-option' + option['product_option_id'] + '" />';
					html += '  </div>';
					html += '</div>';
				}
				
				if (option['type'] == 'date') {
					html += '<div class="form-group' + (option['required'] ? ' required' : '') + '">';
					html += '  <label class="col-sm-2 control-label" for="input-option' + option['product_option_id'] + '">' + option['name'] + '</label>';
					html += '  <div class="col-sm-3"><div class="input-group date"><input type="text" name="option[' + option['product_option_id'] + ']" value="' + option['value'] + '" placeholder="' + option['name'] + '" data-date-format="YYYY-MM-DD" id="input-option' + option['product_option_id'] + '" class="form-control" /><span class="input-group-btn"><button type="button" class="btn btn-default"><i class="fa fa-calendar"></i></button></span></div></div>';
					html += '</div>';
				}

				if (option['type'] == 'datetime') {
					html += '<div class="form-group' + (option['required'] ? ' required' : '') + '">';
					html += '  <label class="col-sm-2 control-label" for="input-option' + option['product_option_id'] + '">' + option['name'] + '</label>';
					html += '  <div class="col-sm-3"><div class="input-group datetime"><input type="text" name="option[' + option['product_option_id'] + ']" value="' + option['value'] + '" placeholder="' + option['name'] + '" data-date-format="YYYY-MM-DD HH:mm" id="input-option' + option['product_option_id'] + '" class="form-control" /><span class="input-group-btn"><button type="button" class="btn btn-default"><i class="fa fa-calendar"></i></button></span></div></div>';
					html += '</div>';
				}

				if (option['type'] == 'time') {
					html += '<div class="form-group' + (option['required'] ? ' required' : '') + '">';
					html += '  <label class="col-sm-2 control-label" for="input-option' + option['product_option_id'] + '">' + option['name'] + '</label>';
					html += '  <div class="col-sm-3"><div class="input-group time"><input type="text" name="option[' + option['product_option_id'] + ']" value="' + option['value'] + '" placeholder="' + option['name'] + '" data-date-format="HH:mm" id="input-option' + option['product_option_id'] + '" class="form-control" /><span class="input-group-btn"><button type="button" class="btn btn-default"><i class="fa fa-calendar"></i></button></span></div></div>';
					html += '</div>';
				}
			}
			
			html += '</fieldset>';
			
			$('#option').html(html);
			
			$('.date').datetimepicker({
				pickTime: false
			});
			
			$('.datetime').datetimepicker({
				pickDate: true,
				pickTime: true
			});
			
			$('.time').datetimepicker({
				pickDate: false
			});
		} else {
			$('#option').html('');
		}									
	}	
});

$(document).delegate('#button-invoice', 'click', function() {
	$.ajax({
		url: 'index.php?route=sale/order/createinvoiceno&token=<?php echo $token; ?>&order_id=<?php echo $order_id; ?>',
		dataType: 'json',
		success: function(json) {
			$('.alert').remove();

			if (json['error']) {
				$('#content > .container-fluid').prepend('<div class="alert alert-danger"><i class="fa fa-exclamation-circle"></i> ' + json['error'] + '</div>');
			}

			if (json['invoice_no']) {
				$('#invoice').html(json['invoice_no']);
				
				$('#generate-invoice').remove();
				
				<?php if ((!$customer && !$reward) || !$affiliate) { ?>
				$('#action-order-option').remove();
				<?php } ?>
			}
		},
		error: function(xhr, ajaxOptions, thrownError) {
			alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
		}
	});
});

$(document).delegate('#button-reward-add', 'click', function() {
	$.ajax({
		url: 'index.php?route=sale/order/addreward&token=<?php echo $token; ?>&order_id=<?php echo $order_id; ?>',
		type: 'post',
		dataType: 'json',
		success: function(json) {
			$('.alert').remove();

			if (json['error']) {
				$('#content > .container-fluid').prepend('<div class="alert alert-danger"><i class="fa fa-exclamation-circle"></i> ' + json['error'] + '</div>');
			}

			if (json['success']) {
                $('#content > .container-fluid').prepend('<div class="alert alert-success"><i class="fa fa-check-circle"></i> ' + json['success'] + '</div>');

				$('#button-reward-add').replaceWith('<a id="button-reward-remove" class="btn-order"><?php echo $button_reward_remove; ?></a>');
				$('#reward-data').replaceWith('<span id="reward-data" class="text-danger"><?php echo $reward; ?></span>');
			}
		},
		error: function(xhr, ajaxOptions, thrownError) {
			alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
		}
	});
});

$(document).delegate('#button-reward-remove', 'click', function() {
	$.ajax({
		url: 'index.php?route=sale/order/removereward&token=<?php echo $token; ?>&order_id=<?php echo $order_id; ?>',
		type: 'post',
		dataType: 'json',
		success: function(json) {
			$('.alert').remove();

			if (json['error']) {
				$('#content > .container-fluid').prepend('<div class="alert alert-danger"><i class="fa fa-exclamation-circle"></i> ' + json['error'] + '</div>');
			}

			if (json['success']) {
                $('#content > .container-fluid').prepend('<div class="alert alert-success"><i class="fa fa-check-circle"></i> ' + json['success'] + '</div>');

				$('#button-reward-remove').replaceWith('<a id="button-reward-add" class="btn-order"><?php echo $button_reward_add; ?></a>');
				$('#reward-data').replaceWith('<span id="reward-data" class="text-success"><?php echo $reward; ?></span>');
			}
		},
		error: function(xhr, ajaxOptions, thrownError) {
			alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
		}
	});
});

$(document).delegate('#button-commission-add', 'click', function() {
	$.ajax({
		url: 'index.php?route=sale/order/addcommission&token=<?php echo $token; ?>&order_id=<?php echo $order_id; ?>',
		type: 'post',
		dataType: 'json',
		success: function(json) {
			$('.alert').remove();

			if (json['error']) {
				$('#content > .container-fluid').prepend('<div class="alert alert-danger"><i class="fa fa-exclamation-circle"></i> ' + json['error'] + '</div>');
			}

			if (json['success']) {
                $('#content > .container-fluid').prepend('<div class="alert alert-success"><i class="fa fa-check-circle"></i> ' + json['success'] + '</div>');

				$('#button-commission-add').replaceWith('<a id="button-commission-remove" class="btn-order"><?php echo $button_commission_remove; ?></a>');
				$('#commission-data').replaceWith('<span id="commission-data" class="text-danger"><?php echo $commission; ?></span>');
			}
		},
		error: function(xhr, ajaxOptions, thrownError) {
			alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
		}
	});
});

$(document).delegate('#button-commission-remove', 'click', function() {
	$.ajax({
		url: 'index.php?route=sale/order/removecommission&token=<?php echo $token; ?>&order_id=<?php echo $order_id; ?>',
		type: 'post',
		dataType: 'json',
		success: function(json) {
			$('.alert').remove();

			if (json['error']) {
				$('#content > .container-fluid').prepend('<div class="alert alert-danger"><i class="fa fa-exclamation-circle"></i> ' + json['error'] + '</div>');
			}

			if (json['success']) {
                $('#content > .container-fluid').prepend('<div class="alert alert-success"><i class="fa fa-check-circle"></i> ' + json['success'] + '</div>');

				$('#button-commission-remove').replaceWith('<a id="button-commission-add" class="btn-order"><?php echo $button_commission_add; ?></a>');
				$('#commission-data').replaceWith('<span id="commission-data" class="text-success"><?php echo $commission; ?></span>');
			}
		},
		error: function(xhr, ajaxOptions, thrownError) {
			alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
		}
	});
});

var token = '';

// Login to the API
$.ajax({
	url: '<?php echo $catalog; ?>index.php?route=api/login',
	type: 'post',
	dataType: 'json',
	data: 'key=<?php echo $api_key; ?>',
	crossDomain: true,
	success: function(json) {
		$('.alert').remove();

        if (json['error']) {
    		if (json['error']['key']) {
    			$('#content > .container-fluid').prepend('<div class="alert alert-danger"><i class="fa fa-exclamation-circle"></i> ' + json['error']['key'] + ' <button type="button" class="close" data-dismiss="alert">&times;</button></div>');
    		}

            if (json['error']['ip']) {
    			$('#content > .container-fluid').prepend('<div class="alert alert-danger"><i class="fa fa-exclamation-circle"></i> ' + json['error']['ip'] + ' <button type="button" id="button-ip-add" data-loading-text="<?php echo $text_loading; ?>" class="btn btn-danger btn-xs pull-right"><i class="fa fa-plus"></i> <?php echo $button_ip_add; ?></button></div>');
    		}
        }

        if (json['token']) {
			token = json['token'];
		}
	},
	error: function(xhr, ajaxOptions, thrownError) {
		alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
	}
});

$('#history').delegate('.pagination a', 'click', function(e) {
	e.preventDefault();

	$('#history').load(this.href);
});

$('#history').load('index.php?route=sale/order/history&token=<?php echo $token; ?>&order_id=<?php echo $order_id; ?>');

$('#button-history').on('click', function() {
	/*
	if (typeof verifyStatusChange == 'function'){
		if (verifyStatusChange() == false){
			return false;
		} else{
			addOrderInfo();
		}
	} else{
		addOrderInfo();
	}*/

	$.ajax({
		url: '<?php echo $catalog; ?>index.php?route=api/order/history&token=' + token + '&store_id=<?php echo $store_id; ?>&order_id=<?php echo $order_id; ?>',
		type: 'post',
		dataType: 'json',
		data: 'order_status_id=' + encodeURIComponent($('select[name=\'order_status_id\']').val()) + '&notify=' + ($('input[name=\'notify\']').prop('checked') ? 1 : 0) + '&override=' + ($('input[name=\'override\']').prop('checked') ? 1 : 0) + '&append=' + ($('input[name=\'append\']').prop('checked') ? 1 : 0) + '&comment=' + encodeURIComponent($('textarea[name=\'comment\']').val()),
		beforeSend: function() {
			$('#button-history').button('loading');
		},
		complete: function() {
			$('#button-history').button('reset');
		},
		success: function(json) {
			$('.alert').remove();

			if (json['error']) {
				$('#history').before('<div class="alert alert-danger"><i class="fa fa-exclamation-circle"></i> ' + json['error'] + ' <button type="button" class="close" data-dismiss="alert">&times;</button></div>');
			}

			if (json['success']) {
				$('#history').load('index.php?route=sale/order/history&token=<?php echo $token; ?>&order_id=<?php echo $order_id; ?>');

				$('#history').before('<div class="alert alert-success"><i class="fa fa-check-circle"></i> ' + json['success'] + ' <button type="button" class="close" data-dismiss="alert">&times;</button></div>');

				$('textarea[name=\'comment\']').val('');
			}
		},
		error: function(xhr, ajaxOptions, thrownError) {
			alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
		}
	});
});

function changeStatus(){
	var status_id = $('select[name="order_status_id"]').val();

	$('#openbay-info').remove();

	$.ajax({
		url: 'index.php?route=extension/openbay/getorderinfo&token=<?php echo $token; ?>&order_id=<?php echo $order_id; ?>&status_id=' + status_id,
		dataType: 'html',
		success: function(html) {
			$('#history').after(html);
		}
	});
}

function addOrderInfo(){
	var status_id = $('select[name="order_status_id"]').val();

	$.ajax({
		url: 'index.php?route=extension/openbay/addorderinfo&token=<?php echo $token; ?>&order_id=<?php echo $order_id; ?>&status_id=' + status_id,
		type: 'post',
		dataType: 'html',
		data: $(".openbay-data").serialize()
	});
}

$(document).ready(function() {
	changeStatus();
});

$('select[name="order_status_id"]').change(function(){
	changeStatus();
});

$('#content').delegate('button[id^=\'button-upload\'], button[id^=\'button-custom-field\'], button[id^=\'button-payment-custom-field\'], button[id^=\'button-shipping-custom-field\']', 'click', function() {
	var node = this;

	$('#form-upload').remove();

	$('body').prepend('<form enctype="multipart/form-data" id="form-upload" style="display: none;"><input type="file" name="file" /></form>');

	$('#form-upload input[name=\'file\']').trigger('click');

	if (typeof timer != 'undefined') {
    	clearInterval(timer);
	}

	timer = setInterval(function() {
		if ($('#form-upload input[name=\'file\']').val() != '') {
			clearInterval(timer);

			$.ajax({
				url: 'index.php?route=tool/upload/upload&token=<?php echo $token; ?>',
				type: 'post',
				dataType: 'json',
				data: new FormData($('#form-upload')[0]),
				cache: false,
				contentType: false,
				processData: false,
				beforeSend: function() {
					$(node).button('loading');
				},
				complete: function() {
					$(node).button('reset');
				},
				success: function(json) {
					$(node).parent().find('.text-danger').remove();

					if (json['error']) {
						$(node).parent().find('input[type=\'hidden\']').after('<div class="text-danger">' + json['error'] + '</div>');
					}

					if (json['success']) {
						alert(json['success']);
					}

					if (json['code']) {
						$(node).parent().find('input[type=\'hidden\']').val(json['code']);
					}
				},
				error: function(xhr, ajaxOptions, thrownError) {
					alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
				}
			});
		}
	}, 500);
});
//--></script> 
</div>
<?php echo $footer; ?> 
