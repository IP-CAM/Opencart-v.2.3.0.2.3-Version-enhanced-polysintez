<?php echo $header; ?><?php echo $column_left; ?>
<div id="content">
  <div class="page-header">
    <div class="container-fluid">
      <div class="pull-right">
        <button type="submit" form="form-tabs" data-toggle="tooltip" title="<?php echo $button_save; ?>" class="btn btn-primary"><i class="fa fa-save"></i></button>
        <a href="<?php echo $cancel; ?>" data-toggle="tooltip" title="<?php echo $button_cancel; ?>" class="btn btn-default"><i class="fa fa-reply"></i></a></div>
      <h1><?php echo $revtabs_heading_title; ?></h1>
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
        <h3 class="panel-title"><i class="fa fa-pencil"></i> <?php echo $text_form; ?></h3>
      </div>
      <div class="panel-body">
        <form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data" id="form-tabs" class="form-horizontal">
		  <ul class="nav nav-tabs">
            <li class="active"><a href="#tab-general" data-toggle="tab"><?php echo $tab_general; ?></a></li>
            <li><a href="#tab-data" data-toggle="tab"><?php echo $tab_data; ?></a></li>
          </ul>
		  <div class="tab-content">
			<div class="tab-pane active" id="tab-general">
              <ul class="nav nav-tabs" id="language">
                <?php foreach ($languages as $language) { ?>
                <li><a href="#language<?php echo $language['language_id']; ?>" data-toggle="tab"><img src="<?php echo (VERSION >= 2.2) ? 'language/'.$language['code'].'/'.$language['code'].'.png' : 'view/image/flags/'.$language['image']; ?>" title="<?php echo $language['name']; ?>" /> <?php echo $language['name']; ?></a></li>
                <?php } ?>
              </ul>
              <div class="tab-content">
                <?php foreach ($languages as $language) { ?>
                <div class="tab-pane" id="language<?php echo $language['language_id']; ?>">
                  <div class="form-group required">
                    <label class="col-sm-2 control-label" for="input-name<?php echo $language['language_id']; ?>"><?php echo $entry_name; ?></label>
                    <div class="col-sm-10">
                      <input type="text" name="tabs_description[<?php echo $language['language_id']; ?>][name]" value="<?php echo isset($tabs_description[$language['language_id']]) ? $tabs_description[$language['language_id']]['name'] : ''; ?>" placeholder="<?php echo $entry_name; ?>" id="input-name<?php echo $language['language_id']; ?>" class="form-control" />
                      <?php if (isset($error_name[$language['language_id']])) { ?>
                      <div class="text-danger"><?php echo $error_name[$language['language_id']]; ?></div>
                      <?php } ?>
                    </div>
                  </div>
                  <div class="form-group">
                    <label class="col-sm-2 control-label" for="input-description<?php echo $language['language_id']; ?>"><?php echo $entry_description; ?></label>
                    <div class="col-sm-10">
                      <textarea name="tabs_description[<?php echo $language['language_id']; ?>][description]" placeholder="<?php echo $entry_description; ?>" id="input-description<?php echo $language['language_id']; ?>" class="form-control"><?php echo isset($tabs_description[$language['language_id']]) ? $tabs_description[$language['language_id']]['description'] : ''; ?></textarea>
                    </div>
                  </div>
                </div>
                <?php } ?>
              </div>
            </div>
		<div class="tab-pane" id="tab-data">
			<div class="form-group">
			   <label class="col-sm-2 control-label" for="input-product"><span data-toggle="tooltip" title="<?php echo $help_assign_product; ?>"><?php echo $entry_assign; ?></span></label>
			    <div class="col-sm-10">
					<input <?php if($allproducts){ echo 'checked=checked'; } ?> type="checkbox" name="allproducts" style="margin-top:12px;" value="1"/>
				</div>
			</div>
			<div class="form-group">
			<label class="col-sm-2 control-label" for="input-product"><span data-toggle="tooltip" title="<?php echo $help_category; ?>"><?php echo $entry_product; ?></span></label>
			<div class="col-sm-10">
			  <input type="text" name="product" value="" placeholder="<?php echo $entry_product; ?>" id="input-product" class="form-control" />
			  <div id="tabs-product" class="well well-sm" style="height: 150px; overflow: auto;">
				<?php foreach ($tabs_products as $tabs_product){ ?>
				<div id="tabs-product<?php echo $tabs_product['product_id']; ?>"><i class="fa fa-minus-circle"></i> <?php echo $tabs_product['name']; ?>
				  <input type="hidden" name="tabs_product[]" value="<?php echo $tabs_product['product_id']; ?>" />
				</div>
				<?php } ?>
			  </div>
			</div>
          </div>
		  <div class="form-group">
			<label class="col-sm-2 control-label" for="input-category"><span data-toggle="tooltip" title="<?php echo $help_category; ?>"><?php echo $entry_category; ?></span></label>
			<div class="col-sm-10">
			  <input type="text" name="category" value="" placeholder="<?php echo $entry_category; ?>" id="input-category" class="form-control" />
			  <div id="tabs-category" class="well well-sm" style="height: 150px; overflow: auto;">
				<?php foreach ($tabs_categories as $tabs_category) { ?>
				<div id="tabs-category<?php echo $tabs_category['category_id']; ?>"><i class="fa fa-minus-circle"></i> <?php echo $tabs_category['name']; ?>
				  <input type="hidden" name="tabs_category[]" value="<?php echo $tabs_category['category_id']; ?>" />
				</div>
				<?php } ?>
			  </div>
			</div>
          </div>
		  <div class="form-group">
			<label class="col-sm-2 control-label" for="input-manufacturer"><span data-toggle="tooltip" title="<?php echo $help_category; ?>"><?php echo $entry_manufacturer; ?></span></label>
			<div class="col-sm-10">
			  <input type="text" name="manufacturer" value="" placeholder="<?php echo $entry_manufacturer; ?>" id="input-manufacturer" class="form-control" />
			  <div id="tabs-manufacturer" class="well well-sm" style="height: 150px; overflow: auto;">
				<?php foreach ($tabs_manufacturers as $tabs_manufacturer){ ?>
				<div id="tabs-manufacturer<?php echo $tabs_manufacturer['manufacturer_id']; ?>"><i class="fa fa-minus-circle"></i> <?php echo $tabs_manufacturer['name']; ?>
				  <input type="hidden" name="tabs_manufacturer[]" value="<?php echo $tabs_manufacturer['manufacturer_id']; ?>" />
				</div>
				<?php } ?>
			  </div>
			</div>
          </div>
		  <div class="form-group">
			<label class="col-sm-2 control-label" for="input-ingore_product"><span data-toggle="tooltip" title="<?php echo $help_category; ?>"><?php echo $entry_ingore_product; ?></span></label>
			<div class="col-sm-10">
			  <input type="text" name="ingore_product" value="" placeholder="<?php echo $entry_ingore_product; ?>" id="input-ingore_product" class="form-control" />
			  <div id="tabs-ingore_product" class="well well-sm" style="height: 150px; overflow: auto;">
				<?php foreach ($tabs_ingore_products as $tabs_ingore_product){ ?>
				<div id="tabs-ingore_product<?php echo $tabs_ingore_product['product_id']; ?>"><i class="fa fa-minus-circle"></i> <?php echo $tabs_ingore_product['name']; ?>
				  <input type="hidden" name="tabs_ingore_product[]" value="<?php echo $tabs_ingore_product['product_id']; ?>" />
				</div>
				<?php } ?>
			  </div>
			</div>
          </div>
		  <div class="form-group">
            <label class="col-sm-2 control-label"><?php echo $entry_store; ?></label>
            <div class="col-sm-10">
              <div class="well well-sm" style="height: 150px; overflow: auto;">
                <div class="checkbox">
                  <label>
                    <?php if (in_array(0, $tabs_store)) { ?>
                    <input type="checkbox" name="tabs_store[]" value="0" checked="checked" />
                    <?php echo $text_default; ?>
                    <?php } else { ?>
                    <input type="checkbox" name="tabs_store[]" value="0" />
                    <?php echo $text_default; ?>
                    <?php } ?>
                  </label>
                </div>
                <?php foreach ($stores as $store) { ?>
                <div class="checkbox">
                  <label>
                    <?php if (in_array($store['store_id'], $tabs_store)) { ?>
                    <input type="checkbox" name="tabs_store[]" value="<?php echo $store['store_id']; ?>" checked="checked" />
                    <?php echo $store['name']; ?>
                    <?php } else { ?>
                    <input type="checkbox" name="tabs_store[]" value="<?php echo $store['store_id']; ?>" />
                    <?php echo $store['name']; ?>
                    <?php } ?>
                  </label>
                </div>
                <?php } ?>
              </div>
            </div>
          </div>
          <div class="form-group">
            <label class="col-sm-2 control-label" for="input-sort-order"><?php echo $entry_sort_order; ?></label>
            <div class="col-sm-10">
              <input type="text" name="sort_order" value="<?php echo $sort_order; ?>" placeholder="<?php echo $entry_sort_order; ?>" id="input-sort-order" class="form-control" />
            </div>
          </div>
		  <div class="form-group">
                <label class="col-sm-2 control-label" for="input-status"><?php echo $entry_status; ?></label>
                <div class="col-sm-10">
                  <select name="status" id="input-status" class="form-control">
                    <?php if ($status) { ?>
                    <option value="1" selected="selected"><?php echo $text_enabled; ?></option>
                    <option value="0"><?php echo $text_disabled; ?></option>
                    <?php } else { ?>
                    <option value="1"><?php echo $text_enabled; ?></option>
                    <option value="0" selected="selected"><?php echo $text_disabled; ?></option>
                    <?php } ?>
                  </select>
                </div>
          </div>
			</div>
		 </div>
		</form>
      </div>
    </div>
  </div>
</div>
<script type="text/javascript"><!--
<?php foreach ($languages as $language) { ?>
$('#input-description<?php echo $language['language_id']; ?>').summernote({
	height: 300
});
<?php } ?>
//--></script>
<script type="text/javascript"><!--
// Category
$('input[name=\'category\']').autocomplete({
	'source': function(request, response) {
		$.ajax({
			url: 'index.php?route=catalog/category/autocomplete&token=<?php echo $token; ?>&filter_name=' +  encodeURIComponent(request),
			dataType: 'json',
			success: function(json) {
				response($.map(json, function(item) {
					return {
						label: item['name'],
						value: item['category_id']
					}
				}));
			}
		});
	},
	'select': function(item) {
		$('input[name=\'category\']').val('');

		$('#tabs-category' + item['value']).remove();

		$('#tabs-category').append('<div id="tabs-category' + item['value'] + '"><i class="fa fa-minus-circle"></i> ' + item['label'] + '<input type="hidden" name="tabs_category[]" value="' + item['value'] + '" /></div>');
	}
});

$('#tabs-category').delegate('.fa-minus-circle', 'click', function() {
	$(this).parent().remove();
});
//--></script>
<script type="text/javascript"><!--
// Product
$('input[name=\'product\']').autocomplete({
	'source': function(request, response) {
		$.ajax({
			url: 'index.php?route=catalog/product/autocomplete&token=<?php echo $token; ?>&filter_name=' +  encodeURIComponent(request),
			dataType: 'json',
			success: function(json) {
				response($.map(json, function(item) {
					return {
						label: item['name'],
						value: item['product_id']
					}
				}));
			}
		});
	},
	'select': function(item) {
		$('input[name=\'product\']').val('');

		$('#tabs-product' + item['value']).remove();

		$('#tabs-product').append('<div id="tabs-product' + item['value'] + '"><i class="fa fa-minus-circle"></i> ' + item['label'] + '<input type="hidden" name="tabs_product[]" value="' + item['value'] + '" /></div>');
	}
});

$('#tabs-product').delegate('.fa-minus-circle', 'click', function() {
	$(this).parent().remove();
});

// Ingore product
$('input[name=\'ingore_product\']').autocomplete({
	'source': function(request, response) {
		$.ajax({
			url: 'index.php?route=catalog/product/autocomplete&token=<?php echo $token; ?>&filter_name=' +  encodeURIComponent(request),
			dataType: 'json',
			success: function(json) {
				response($.map(json, function(item) {
					return {
						label: item['name'],
						value: item['product_id']
					}
				}));
			}
		});
	},
	'select': function(item) {
		$('input[name=\'ingore_product\']').val('');

		$('#tabs-ingore_product' + item['value']).remove();

		$('#tabs-ingore_product').append('<div id="tabs-ingore_product' + item['value'] + '"><i class="fa fa-minus-circle"></i> ' + item['label'] + '<input type="hidden" name="tabs_ingore_product[]" value="' + item['value'] + '" /></div>');
	}
});

$('#tabs-ingore_product').delegate('.fa-minus-circle', 'click', function() {
	$(this).parent().remove();
});
//--></script>
<script type="text/javascript"><!--
//manufacturer
$('input[name=\'manufacturer\']').autocomplete({
	'source': function(request, response) {
		$.ajax({
			url: 'index.php?route=catalog/manufacturer/autocomplete&token=<?php echo $token; ?>&filter_name=' +  encodeURIComponent(request),
			dataType: 'json',
			success: function(json) {
				response($.map(json, function(item) {
					return {
						label: item['name'],
						value: item['manufacturer_id']
					}
				}));
			}
		});
	},
	'select': function(item) {
		$('input[name=\'manufacturer\']').val('');

		$('#tabs-manufacturer' + item['value']).remove();

		$('#tabs-manufacturer').append('<div id="tabs-manufacturer' + item['value'] + '"><i class="fa fa-minus-circle"></i> ' + item['label'] + '<input type="hidden" name="tabs_manufacturer[]" value="' + item['value'] + '" /></div>');
	}
});

$('#tabs-manufacturer').delegate('.fa-minus-circle', 'click', function() {
	$(this).parent().remove();
});
//--></script>
 <script type="text/javascript"><!--
$('#language a:first').tab('show');
//--></script>
<?php echo $footer; ?>