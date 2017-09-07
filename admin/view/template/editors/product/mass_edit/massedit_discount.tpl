<div class="modal-header">
  <button type="button" class="pull-right btn btn-danger btn-sm" data-dismiss="modal" aria-hidden="true"><i class="fa fa-close"></i></button>
  <h4 class="modal-title"><?php echo $text_add_discount; ?></h4>
</div>
<div class="modal-body" id="body-mass-product-discounts">
  <form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data" id="form-mass-product-add-discounts" class="form-horizontal">	
	<div class="form-group">
 	  <div class="col-sm-12">
		<table id="discount" class="table table-striped table-bordered table-hover">
		  <thead>
			<tr>
			  <td class="text-left" style="width: 15%;" rowspan="2"><?php echo $entry_customer_group; ?></td>
			  <td class="text-left" style="width: 5%;" rowspan="2"><?php echo $entry_quantity; ?></td>
			  <td class="text-left" style="width: 5%;" rowspan="2"><?php echo $entry_priority; ?></td>
			  <td class="text-center" style="width: 35%;" colspan="2"><?php echo $entry_price; ?></td>
			  <td class="text-left" style="width: 20%;" rowspan="2"><?php echo $entry_date_start; ?></td>
			  <td class="text-left" style="width: 20%;" rowspan="2"><?php echo $entry_date_end; ?></td>
			  <td rowspan="2"></td>
			</tr>
		    <tr>
			  <td class="text-left"><?php echo $entry_value_edit; ?></td>
			  <td class="text-left"><?php echo $entry_type_edit; ?></td>
			</tr>
		  </thead>
		  <tbody>
			<?php $discount_row = 0; ?>
			<tr id="discount-row<?php echo $discount_row; ?>"></tr>
			<?php $discount_row++; ?>					
		  </tbody>
		  <tfoot>
			<tr>
			  <td colspan="7"></td>
			  <td class="text-left"><button type="button" onclick="addDiscount();" class="btn btn-primary"><i class="fa fa-plus-circle"></i></button></td>
			</tr>
		  </tfoot>
		</table>
	  </div>
	</div>
	<div class="form-group">	
	  <label class="col-md-3 control-label" for="input-discount-method"><?php echo $entry_method_edit; ?></label>
	  <div class="col-md-9">
		<select name="discount_method_edit" id="input-discount-method" class="form-control">
		  <option value="all_new"><?php echo $text_all_new; ?></option>
		  <option value="add_selected"><?php echo $text_add_selected; ?></option>
		  <option value="customer_group"><?php echo $text_del_customer_group; ?></option>
		  <option value="quantity"><?php echo $text_del_quantity; ?></option>
		  <option value="priority"><?php echo $text_del_priority; ?></option>
		  <option value="price"><?php echo $text_del_price; ?></option>
		  <option value="date_start"><?php echo $text_del_date_start; ?></option>
		  <option value="date_end"><?php echo $text_del_date_end; ?></option>
		</select>
	  </div>
	</div>
  </form>
</div>
<div class="modal-footer">
  <div class="text-center"><a data-form="form-mass-product-add-discounts" class="button-save btn btn-info btn-lg"><?php echo $button_save; ?></a></div>
</div>
<script type="text/javascript"><!--
$(".button-save").on('click', function(){		
	$.ajax({
		url: $('#' + $(this).data('form')).attr('action'),
		type: 'post',
		dataType: 'json',
		data: $('#product-list input[type=\'checkbox\']:checked, #' + $(this).data('form') + ' input[type=\'text\'], #' + $(this).data('form') + ' input[type=\'hidden\'], #' + $(this).data('form') + ' select'),
		success: function(json) {				
			if (json['error']) {
				$('#form-mass-product-add-discounts').before('<div class="alert alert-danger"><i class="fa fa-exclamation-circle"></i> ' + json['error'] + '</div>');
				
				$('.alert-danger').delay(1500).fadeOut(500);
			}
								
			if (json['success']) {
				$('#form-mass-product-add-discounts').before('<div class="alert alert-success"><i class="fa fa-check-circle"></i> ' + json['success'] + '</div>');	
				
				setTimeout(function(){
					$('#modal-product-edit').modal('hide');
				}, 1000)
			}
		}
	});
});  
//--></script>
<script type="text/javascript"><!--
var discount_row = <?php echo $discount_row; ?>;

function addDiscount() {
	html  = '<tr id="discount-row' + discount_row + '">'; 
    html += '  <td class="text-left"><select name="product_discount[' + discount_row + '][customer_group_id]" class="form-control">';
    <?php foreach ($customer_groups as $customer_group) { ?>
    html += '    <option value="<?php echo $customer_group['customer_group_id']; ?>"><?php echo addslashes($customer_group['name']); ?></option>';
    <?php } ?>
    html += '  </select></td>';		
    html += '  <td class="text-right"><input type="text" name="product_discount[' + discount_row + '][quantity]" class="form-control" /></td>';
    html += '  <td class="text-right"><input type="text" name="product_discount[' + discount_row + '][priority]" class="form-control" /></td>';
	html += '  <td class="text-right"><input type="text" name="product_discount[' + discount_row + '][price]" class="form-control" /></td>';
	html += '  <td class="text-left"><select name="product_discount[' + discount_row + '][add_type]" class="form-control">';
	html += '    <option value="amount"><?php echo $text_special_amount; ?></option>';
	html += '    <option value="amount_plus_price"><?php echo $text_price_plus_amount; ?></option>';
	html += '    <option value="amount_minus_price"><?php echo $text_price_minus_amount; ?></option>';
	html += '    <option value="amount_plus_percent"><?php echo $text_price_plus_percent; ?></option>';
	html += '    <option value="amount_minus_percent"><?php echo $text_price_minus_percent; ?></option>';
	html += '  </select></td>';
    html += '  <td class="text-left"><div class="input-group date"><input type="text" name="product_discount[' + discount_row + '][date_start]" data-date-format="YYYY-MM-DD" class="form-control" /><span class="input-group-btn"><button type="button" class="btn btn-default"><i class="fa fa-calendar"></i></button></span></div></td>';
	html += '  <td class="text-left"><div class="input-group date"><input type="text" name="product_discount[' + discount_row + '][date_end]" data-date-format="YYYY-MM-DD" class="form-control" /><span class="input-group-btn"><button type="button" class="btn btn-default"><i class="fa fa-calendar"></i></button></span></div></td>';
	html += '  <td class="text-left"><button type="button" onclick="$(\'#discount-row' + discount_row + '\').remove();" class="btn btn-danger"><i class="fa fa-minus-circle"></i></button></td>';
	html += '</tr>';	
	
	$('#discount tbody').append(html);

	$('.date').datetimepicker({
		pickTime: false
	});
	
	discount_row++;
}
//--></script>