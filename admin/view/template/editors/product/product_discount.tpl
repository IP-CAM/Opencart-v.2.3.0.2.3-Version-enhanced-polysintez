<div class="modal-header">
  <button type="button" class="pull-right btn btn-danger btn-sm" data-dismiss="modal" aria-hidden="true"><i class="fa fa-close"></i></button>
  <h4 class="modal-title"><?php echo $product_name; ?> - <?php echo $tab_discount; ?></h4>
</div>
<div class="modal-body">
  <form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data" id="form-product-discount" class="form-horizontal">
	<div class="table-responsive">
      <table id="discount" class="table table-striped table-bordered table-hover">
        <thead>
          <tr>
            <td class="text-center" style="width: 20%;"><?php echo $entry_customer_group; ?></td>
            <td class="text-right" style="width: 8%;"><?php echo $entry_quantity; ?></td>
            <td class="text-right" style="width: 8%;"><?php echo $entry_priority; ?></td>
            <td class="text-right" style="width: 18%;"><?php echo $entry_price; ?></td>
            <td class="text-left" style="width: 23%;"><?php echo $entry_date_start; ?></td>
            <td class="text-left" style="width: 23%;"><?php echo $entry_date_end; ?></td>
            <td></td>
          </tr>
        </thead>
        <tbody>
          <?php $discount_row = 0; ?>
          <?php foreach ($product_discounts as $product_discount) { ?>
            <tr id="discount-row<?php echo $discount_row; ?>">
              <td class="text-left">
			    <select name="product_discount[<?php echo $discount_row; ?>][customer_group_id]" class="form-control">
                  <?php foreach ($customer_groups as $customer_group) { ?>
                    <?php if ($customer_group['customer_group_id'] == $product_discount['customer_group_id']) { ?>
                      <option value="<?php echo $customer_group['customer_group_id']; ?>" selected="selected"><?php echo $customer_group['name']; ?></option>
                      <?php } else { ?>
                      <option value="<?php echo $customer_group['customer_group_id']; ?>"><?php echo $customer_group['name']; ?></option>
                    <?php } ?>
                  <?php } ?>
                </select>
			  </td>
              <td class="text-right"><input type="text" name="product_discount[<?php echo $discount_row; ?>][quantity]" value="<?php echo $product_discount['quantity']; ?>" placeholder="<?php echo $entry_quantity; ?>" class="form-control" /></td>
              <td class="text-right"><input type="text" name="product_discount[<?php echo $discount_row; ?>][priority]" value="<?php echo $product_discount['priority']; ?>" placeholder="<?php echo $entry_priority; ?>" class="form-control" /></td>
              <td class="text-right"><input type="text" name="product_discount[<?php echo $discount_row; ?>][price]" value="<?php echo $product_discount['price']; ?>" placeholder="<?php echo $entry_price; ?>" class="form-control text-right" /></td>
              <td class="text-left">
			    <div class="input-group date">
                  <input type="text" name="product_discount[<?php echo $discount_row; ?>][date_start]" value="<?php echo $product_discount['date_start']; ?>" placeholder="<?php echo $entry_date_start; ?>" data-date-format="YYYY-MM-DD" class="form-control" />
                  <span class="input-group-btn"><button class="btn btn-default" type="button"><i class="fa fa-calendar"></i></button></span>
			    </div>
			  </td>
              <td class="text-left">
			    <div class="input-group date">
                  <input type="text" name="product_discount[<?php echo $discount_row; ?>][date_end]" value="<?php echo $product_discount['date_end']; ?>" placeholder="<?php echo $entry_date_end; ?>" data-date-format="YYYY-MM-DD" class="form-control" />
                  <span class="input-group-btn"><button class="btn btn-default" type="button"><i class="fa fa-calendar"></i></button></span>
			    </div>
			  </td>
              <td class="text-left"><button type="button" onclick="$('#discount-row<?php echo $discount_row; ?>').remove();" class="btn btn-danger"><i class="fa fa-minus-circle"></i></button></td>
            </tr>
            <?php $discount_row++; ?>
          <?php } ?>
        </tbody>
        <tfoot>
          <tr>
            <td colspan="6"></td>
            <td class="text-left"><button type="button" onclick="addDiscount();" class="btn btn-primary"><i class="fa fa-plus-circle"></i></button></td>
          </tr>
        </tfoot>
      </table>
    </div>
  </form>
</div>
<div class="modal-footer">
  <div class="text-center"><a data-form="form-product-discount" class="button-save btn btn-info btn-lg"><?php echo $button_save; ?></a></div>
</div>
<script type="text/javascript"><!--
$(".button-save").on('click', function(){
	$.ajax({
		url: $('#' + $(this).data('form')).attr('action'),
		type: 'post',
		dataType: 'json',
		data: $('#' + $(this).data('form') + ' input[type=\'text\'], #' + $(this).data('form') + ' select'),
		success: function(json) {
			if (json['error']) {
				$('#form-product-discount').before('<div class="alert alert-danger"><i class="fa fa-exclamation-circle"></i> ' + json['error'] + '</div>');
				
				$('.alert-danger').delay(1500).fadeOut(500);
			}
			
			if (json['success']) {
				$('#form-product-discount').before('<div class="alert alert-success"><i class="fa fa-exclamation-circle"></i> ' + json['success'] + '</div>');			
									
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
    html += '  <td class="text-right"><input type="text" name="product_discount[' + discount_row + '][quantity]" value="" placeholder="<?php echo $entry_quantity; ?>" class="form-control" /></td>';
    html += '  <td class="text-right"><input type="text" name="product_discount[' + discount_row + '][priority]" value="" placeholder="<?php echo $entry_priority; ?>" class="form-control" /></td>';
	html += '  <td class="text-right"><input type="text" name="product_discount[' + discount_row + '][price]" value="" placeholder="<?php echo $entry_price; ?>" class="form-control text-right" /></td>';
    html += '  <td class="text-left"><div class="input-group date"><input type="text" name="product_discount[' + discount_row + '][date_start]" value="" placeholder="<?php echo $entry_date_start; ?>" data-date-format="YYYY-MM-DD" class="form-control" /><span class="input-group-btn"><button type="button" class="btn btn-default"><i class="fa fa-calendar"></i></button></span></div></td>';
	html += '  <td class="text-left"><div class="input-group date"><input type="text" name="product_discount[' + discount_row + '][date_end]" value="" placeholder="<?php echo $entry_date_end; ?>" data-date-format="YYYY-MM-DD" class="form-control" /><span class="input-group-btn"><button type="button" class="btn btn-default"><i class="fa fa-calendar"></i></button></span></div></td>';
	html += '  <td class="text-left"><button type="button" onclick="$(\'#discount-row' + discount_row + '\').remove();" class="btn btn-danger"><i class="fa fa-minus-circle"></i></button></td>';
	html += '</tr>';	
	
	$('#discount tbody').append(html);

	$('.date').datetimepicker({
		pickTime: false
	});
	
	discount_row++;
}
//--></script>
  <script type="text/javascript"><!--
$('.date').datetimepicker({
	pickTime: false
});
//--></script> 