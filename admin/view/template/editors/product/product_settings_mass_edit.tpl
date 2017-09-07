<div class="modal-header">
  <button type="button" class="pull-right btn btn-danger btn-sm" data-dismiss="modal" aria-hidden="true"><i class="fa fa-close"></i></button>
  <h4 class="modal-title"><?php echo $text_mass_edit; ?></h4>
</div>
<div class="modal-body" id="body-product-setting-edit-mass">
  <form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data" id="form-product-setting-edit-mass" class="form-horizontal">	
	<div class="form-group">
	  <div class="alert alert-info"><i class="fa fa-info-circle"></i> <?php echo $text_edit_mass_info; ?></div>
	</div>
	<div class="table-responsive">
	  <table class="table table-striped table-hover table-bordered">
		<thead>
		  <tr>
			<td class="text-left"><?php echo $text_setting_data; ?></td>
			<td class="text-center" width="1%"><?php echo $entry_status; ?></td>
		  </tr>
		</thead>
	    <tbody>
  		  <tr>
			<td class="text-left"><?php echo $entry_name; ?></td>
			<td class="text-center">
			  <div class="input-checkbox">
				<input type="checkbox" class="checkbox" name="admin_quick_edit_product_mass_name"<?php echo $admin_quick_edit_product_mass_name ? ' checked="checked"' : '' ?> id="admin_quick_edit_product_mass_name" />
				<label for="admin_quick_edit_product_mass_name"></label>
			  </div>
			</td>
		  </tr>
		  <tr>
			<td class="text-left"><?php echo $entry_description; ?></td>
			<td class="text-center">
			  <div class="input-checkbox">
				<input type="checkbox" class="checkbox" name="admin_quick_edit_product_mass_description"<?php echo $admin_quick_edit_product_mass_description ? ' checked="checked"' : '' ?> id="admin_quick_edit_product_mass_description" />
				<label for="admin_quick_edit_product_mass_description"></label>
			  </div>
			</td>
		  </tr>
		  <tr>
			<td class="text-left"><?php echo $entry_meta_title; ?></td>
			<td class="text-center">
			  <div class="input-checkbox">
				<input type="checkbox" class="checkbox" name="admin_quick_edit_product_mass_meta_title"<?php echo $admin_quick_edit_product_mass_meta_title ? ' checked="checked"' : '' ?> id="admin_quick_edit_product_mass_meta_title" />
				<label for="admin_quick_edit_product_mass_meta_title"></label>
			  </div>
			</td>
		  </tr>
		  <tr>
			<td class="text-left"><?php echo $entry_meta_h1; ?></td>
			<td class="text-center">
			  <div class="input-checkbox">
				<input type="checkbox" class="checkbox" name="admin_quick_edit_product_mass_meta_h1"<?php echo $admin_quick_edit_product_mass_meta_h1 ? ' checked="checked"' : '' ?> id="admin_quick_edit_product_mass_meta_h1" />
				<label for="admin_quick_edit_product_mass_meta_h1"></label>
			  </div>
			</td>
		  </tr>
		  <tr>
			<td class="text-left"><?php echo $entry_meta_description; ?></td>
			<td class="text-center">
			  <div class="input-checkbox">
				<input type="checkbox" class="checkbox" name="admin_quick_edit_product_mass_meta_description"<?php echo $admin_quick_edit_product_mass_meta_description ? ' checked="checked"' : '' ?> id="admin_quick_edit_product_mass_meta_description" />
				<label for="admin_quick_edit_product_mass_meta_description"></label>
			  </div>
			</td>
		  </tr>
		  <tr>
			<td class="text-left"><?php echo $entry_meta_keyword; ?></td>
			<td class="text-center">
			  <div class="input-checkbox">
				<input type="checkbox" class="checkbox" name="admin_quick_edit_product_mass_meta_keyword"<?php echo $admin_quick_edit_product_mass_meta_keyword ? ' checked="checked"' : '' ?> id="admin_quick_edit_product_mass_meta_keyword" />
				<label for="admin_quick_edit_product_mass_meta_keyword"></label>
			  </div>
			</td>
		  </tr>
		  <tr>
			<td class="text-left"><?php echo $entry_tag; ?></td>
			<td class="text-center">
			  <div class="input-checkbox">
				<input type="checkbox" class="checkbox" name="admin_quick_edit_product_mass_tag"<?php echo $admin_quick_edit_product_mass_tag ? ' checked="checked"' : '' ?> id="admin_quick_edit_product_mass_tag" />
				<label for="admin_quick_edit_product_mass_tag"></label>
			  </div>
			</td>
		  </tr>
		  <tr>
			<td class="text-left"><?php echo $column_image; ?></td>
			<td class="text-center">
			  <div class="input-checkbox">
				<input type="checkbox" class="checkbox" name="admin_quick_edit_product_mass_image"<?php echo $admin_quick_edit_product_mass_image ? ' checked="checked"' : '' ?> id="admin_quick_edit_product_mass_image" />
				<label for="admin_quick_edit_product_mass_image"></label>
			  </div>
			</td>
		  </tr>
		  <tr>
			<td class="text-left"><?php echo $column_price; ?></td>
			<td class="text-center">
			  <div class="input-checkbox">
				<input type="checkbox" class="checkbox" name="admin_quick_edit_product_mass_price"<?php echo $admin_quick_edit_product_mass_price ? ' checked="checked"' : '' ?> id="admin_quick_edit_product_mass_price" />
				<label for="admin_quick_edit_product_mass_price"></label>
			  </div>
			</td>
		  </tr>
		  <tr>
			<td class="text-left"><?php echo $column_quantity; ?></td>
			<td class="text-center">
			  <div class="input-checkbox">
				<input type="checkbox" class="checkbox" name="admin_quick_edit_product_mass_quantity"<?php echo $admin_quick_edit_product_mass_quantity ? ' checked="checked"' : '' ?> id="admin_quick_edit_product_mass_quantity" />
				<label for="admin_quick_edit_product_mass_quantity"></label>
			  </div>
			</td>
		  </tr>
		  <tr>
			<td class="text-left"><?php echo $entry_minimum; ?></td>
			<td class="text-center">
			  <div class="input-checkbox">
				<input type="checkbox" class="checkbox" name="admin_quick_edit_product_mass_minimum"<?php echo $admin_quick_edit_product_mass_minimum ? ' checked="checked"' : '' ?> id="admin_quick_edit_product_mass_minimum" />
				<label for="admin_quick_edit_product_mass_minimum"></label>
			  </div>
			</td>
		  </tr>
		  <tr>
			<td class="text-left"><?php echo $text_model; ?></td>
			<td class="text-center">
			  <div class="input-checkbox">
				<input type="checkbox" class="checkbox" name="admin_quick_edit_product_mass_model"<?php echo $admin_quick_edit_product_mass_model ? ' checked="checked"' : '' ?> id="admin_quick_edit_product_mass_model" />
				<label for="admin_quick_edit_product_mass_model"></label>
			  </div>
			</td>
		  </tr>
		  <tr>
			<td class="text-left"><?php echo $text_seo; ?></td>
			<td class="text-center">
			  <div class="input-checkbox">
				<input type="checkbox" class="checkbox" name="admin_quick_edit_product_mass_seo_url"<?php echo $admin_quick_edit_product_mass_seo_url ? ' checked="checked"' : '' ?> id="admin_quick_edit_product_mass_seo_url" />
				<label for="admin_quick_edit_product_mass_seo_url"></label>
			  </div>
			</td>
		  </tr>
		  <tr>
			<td class="text-left"><?php echo $text_code; ?></td>
			<td class="text-center">
			  <div class="input-checkbox">
				<input type="checkbox" class="checkbox" name="admin_quick_edit_product_mass_code"<?php echo $admin_quick_edit_product_mass_code ? ' checked="checked"' : '' ?> id="admin_quick_edit_product_mass_code" />
				<label for="admin_quick_edit_product_mass_code"></label>
			  </div>
			</td>
		  </tr>
		  <tr>
			<td class="text-left"><?php echo $text_date_available; ?></td>
			<td class="text-center">
			  <div class="input-checkbox">
				<input type="checkbox" class="checkbox" name="admin_quick_edit_product_mass_date_available"<?php echo $admin_quick_edit_product_mass_date_available ? ' checked="checked"' : '' ?> id="admin_quick_edit_product_mass_date_available" />
				<label for="admin_quick_edit_product_mass_date_available"></label>
			  </div>
			</td>
		  </tr>
		  <tr>
			<td class="text-left"><?php echo $text_shipping; ?></td>
			<td class="text-center">
			  <div class="input-checkbox">
				<input type="checkbox" class="checkbox" name="admin_quick_edit_product_mass_shipping"<?php echo $admin_quick_edit_product_mass_shipping ? ' checked="checked"' : '' ?> id="admin_quick_edit_product_mass_shipping" />
				<label for="admin_quick_edit_product_mass_shipping"></label>
			  </div>
			</td>
		  </tr>
		  <tr>
			<td class="text-left"><?php echo $text_size; ?></td>
			<td class="text-center">
			  <div class="input-checkbox">
				<input type="checkbox" class="checkbox" name="admin_quick_edit_product_mass_size"<?php echo $admin_quick_edit_product_mass_size ? ' checked="checked"' : '' ?> id="admin_quick_edit_product_mass_size" />
				<label for="admin_quick_edit_product_mass_size"></label>
			  </div>
			</td>
		  </tr>
		  <tr>
			<td class="text-left"><?php echo $entry_sort_order; ?></td>
			<td class="text-center">
			  <div class="input-checkbox">
				<input type="checkbox" class="checkbox" name="admin_quick_edit_product_mass_sort_order"<?php echo $admin_quick_edit_product_mass_sort_order ? ' checked="checked"' : '' ?> id="admin_quick_edit_product_mass_sort_order" />
				<label for="admin_quick_edit_product_mass_sort_order"></label>
			  </div>
			</td>
		  </tr>
		  <tr>
			<td class="text-left"><?php echo $column_manufacturer; ?></td>
			<td class="text-center">
			  <div class="input-checkbox">
				<input type="checkbox" class="checkbox" name="admin_quick_edit_product_mass_manufacturer"<?php echo $admin_quick_edit_product_mass_manufacturer ? ' checked="checked"' : '' ?> id="admin_quick_edit_product_mass_manufacturer" />
				<label for="admin_quick_edit_product_mass_manufacturer"></label>
			  </div>
			</td>
		  </tr>
		  <tr>
			<td class="text-left"><?php echo $column_category; ?></td>
			<td class="text-center">
			  <div class="input-checkbox">
				<input type="checkbox" class="checkbox" name="admin_quick_edit_product_mass_category"<?php echo $admin_quick_edit_product_mass_category ? ' checked="checked"' : '' ?> id="admin_quick_edit_product_mass_category" />
				<label for="admin_quick_edit_product_mass_category"></label>
			  </div>
			</td>
		  </tr>
		  <tr>
			<td class="text-left"><?php echo $entry_filter; ?></td>
			<td class="text-center">
			  <div class="input-checkbox">
				<input type="checkbox" class="checkbox" name="admin_quick_edit_product_mass_filter"<?php echo $admin_quick_edit_product_mass_filter ? ' checked="checked"' : '' ?> id="admin_quick_edit_product_mass_filter" />
				<label for="admin_quick_edit_product_mass_filter"></label>
			  </div>
			</td>
		  </tr>
		  <tr>
			<td class="text-left"><?php echo $entry_store; ?></td>
			<td class="text-center">
			  <div class="input-checkbox">
				<input type="checkbox" class="checkbox" name="admin_quick_edit_product_mass_store"<?php echo $admin_quick_edit_product_mass_store ? ' checked="checked"' : '' ?> id="admin_quick_edit_product_mass_store" />
				<label for="admin_quick_edit_product_mass_store"></label>
			  </div>
			</td>
		  </tr>
		  <tr>
			<td class="text-left"><?php echo $entry_download; ?></td>
			<td class="text-center">
			  <div class="input-checkbox">
				<input type="checkbox" class="checkbox" name="admin_quick_edit_product_mass_download"<?php echo $admin_quick_edit_product_mass_download ? ' checked="checked"' : '' ?> id="admin_quick_edit_product_mass_download" />
				<label for="admin_quick_edit_product_mass_download"></label>
			  </div>
			</td>
		  </tr>
		  <tr>
			<td class="text-left"><?php echo $entry_related; ?></td>
			<td class="text-center">
			  <div class="input-checkbox">
				<input type="checkbox" class="checkbox" name="admin_quick_edit_product_mass_related"<?php echo $admin_quick_edit_product_mass_related ? ' checked="checked"' : '' ?> id="admin_quick_edit_product_mass_related" />
				<label for="admin_quick_edit_product_mass_related"></label>
			  </div>
			</td>
		  </tr>
		  <tr>
			<td class="text-left"><?php echo $text_add_discount; ?></td>
			<td class="text-center">
			  <div class="input-checkbox">
				<input type="checkbox" class="checkbox" name="admin_quick_edit_product_mass_add_discount"<?php echo $admin_quick_edit_product_mass_add_discount ? ' checked="checked"' : '' ?> id="admin_quick_edit_product_mass_add_discount" />
				<label for="admin_quick_edit_product_mass_add_discount"></label>
			  </div>
			</td>
		  </tr>
		  <tr>
			<td class="text-left"><?php echo $text_edit_discount; ?></td>
			<td class="text-center">
			  <div class="input-checkbox">
				<input type="checkbox" class="checkbox" name="admin_quick_edit_product_mass_edit_discount"<?php echo $admin_quick_edit_product_mass_edit_discount ? ' checked="checked"' : '' ?> id="admin_quick_edit_product_mass_edit_discount" />
				<label for="admin_quick_edit_product_mass_edit_discount"></label>
			  </div>
			</td>
		  </tr>
		  <tr>
			<td class="text-left"><?php echo $text_add_special; ?></td>
			<td class="text-center">
			  <div class="input-checkbox">
				<input type="checkbox" class="checkbox" name="admin_quick_edit_product_mass_add_special"<?php echo $admin_quick_edit_product_mass_add_special ? ' checked="checked"' : '' ?> id="admin_quick_edit_product_mass_add_special" />
				<label for="admin_quick_edit_product_mass_add_special"></label>
			  </div>
			</td>
		  </tr>
		  <tr>
			<td class="text-left"><?php echo $text_edit_special; ?></td>
			<td class="text-center">
			  <div class="input-checkbox">
				<input type="checkbox" class="checkbox" name="admin_quick_edit_product_mass_edit_special"<?php echo $admin_quick_edit_product_mass_edit_special ? ' checked="checked"' : '' ?> id="admin_quick_edit_product_mass_edit_special" />
				<label for="admin_quick_edit_product_mass_edit_special"></label>
			  </div>
			</td>
		  </tr>
		  <tr>
			<td class="text-left"><?php echo $tab_attribute; ?></td>
			<td class="text-center">
			  <div class="input-checkbox">
				<input type="checkbox" class="checkbox" name="admin_quick_edit_product_mass_attribute"<?php echo $admin_quick_edit_product_mass_attribute ? ' checked="checked"' : '' ?> id="admin_quick_edit_product_mass_attribute" />
				<label for="admin_quick_edit_product_mass_attribute"></label>
			  </div>
			</td>
		  </tr>
		  <tr>
			<td class="text-left"><?php echo $tab_option; ?></td>
			<td class="text-center">
			  <div class="input-checkbox">
				<input type="checkbox" class="checkbox" name="admin_quick_edit_product_mass_option"<?php echo $admin_quick_edit_product_mass_option ? ' checked="checked"' : '' ?> id="admin_quick_edit_product_mass_option" />
				<label for="admin_quick_edit_product_mass_option"></label>
			  </div>
			</td>
		  </tr>
		  <tr>
			<td class="text-left"><?php echo $text_images; ?></td>
			<td class="text-center">
			  <div class="input-checkbox">
				<input type="checkbox" class="checkbox" name="admin_quick_edit_product_mass_images"<?php echo $admin_quick_edit_product_mass_images ? ' checked="checked"' : '' ?> id="admin_quick_edit_product_mass_images" />
				<label for="admin_quick_edit_product_mass_images"></label>
			  </div>
			</td>
		  </tr>
		  <tr>
			<td class="text-left"><?php echo $entry_reward; ?></td>
			<td class="text-center">
			  <div class="input-checkbox">
				<input type="checkbox" class="checkbox" name="admin_quick_edit_product_mass_reward"<?php echo $admin_quick_edit_product_mass_reward ? ' checked="checked"' : '' ?> id="admin_quick_edit_product_mass_reward" />
				<label for="admin_quick_edit_product_mass_reward"></label>
			  </div>
			</td>
		  </tr>
		  <tr>
			<td class="text-left"><?php echo $tab_design; ?></td>
			<td class="text-center">
			  <div class="input-checkbox">
				<input type="checkbox" class="checkbox" name="admin_quick_edit_product_mass_design"<?php echo $admin_quick_edit_product_mass_design ? ' checked="checked"' : '' ?> id="admin_quick_edit_product_mass_design" />
				<label for="admin_quick_edit_product_mass_design"></label>
			  </div>
			</td>
		  </tr>
		</tbody>
	  </table>
	</div>
  </form>
</div>
<div class="modal-footer">
  <div class="text-center"><a data-form="form-product-setting-edit-mass" class="button-save btn btn-info btn-lg"><?php echo $button_save; ?></a></div>
</div>
<script src="view/javascript/admin_quick_edit/custom-scrollbar/slimscroll.min.js" type="text/javascript"></script>
<script type="text/javascript"><!--
$(function(){
    $('#body-product-setting-edit-mass').slimScroll({
        height: '500px',
		borderRadius: '0',
		opacity: .2,
    });
});
//--></script>
<script type="text/javascript"><!--
$(".button-save").on('click', function(){		
	$.ajax({
		url: $('#' + $(this).data('form')).attr('action'),
		type: 'post',
		dataType: 'json',
		data: $('#product-list input[type=\'checkbox\']:checked, #' + $(this).data('form') + ' input[type=\'text\'], #' + $(this).data('form') + ' input[type=\'checkbox\']:checked, #' + $(this).data('form') + ' select'),
		success: function(json) {				
			if (json['error']) {
				$('#form-product-setting-edit-mass').before('<div class="alert alert-danger"><i class="fa fa-exclamation-circle"></i> ' + json['error'] + '</div>');
				
				$('.alert-danger').delay(1500).fadeOut(500);
			}
								
			if (json['success']) {
				$('#form-product-setting-edit-mass').before('<div class="alert alert-success"><i class="fa fa-check-circle"></i> ' + json['success'] + '</div>');	
				
				setTimeout(function(){
					location.reload(true);
				}, 1000)
			}
		}
	});
});  
//--></script>