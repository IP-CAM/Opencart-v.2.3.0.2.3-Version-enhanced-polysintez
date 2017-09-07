<div class="modal-header">
  <button type="button" class="pull-right btn btn-danger btn-sm" data-dismiss="modal" aria-hidden="true"><i class="fa fa-close"></i></button>
  <h4 class="modal-title"><?php echo $product_name; ?> - <?php echo $tab_special; ?></h4>
</div>
<div class="modal-body">
  <form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data" id="form-product-price-special" class="form-horizontal">
	<table id="special-modal" class="table table-striped table-bordered table-hover">
      <thead>
        <tr>
          <td class="text-center" style="width: 20%;"><?php echo $entry_customer_group; ?></td>
          <td class="text-right" style="width: 10%;"><?php echo $entry_priority; ?></td>
          <td class="text-right" style="width: 20%;"><?php echo $entry_price; ?></td>
          <td class="text-left" style="width: 25%;"><?php echo $entry_date_start; ?></td>
          <td class="text-left" style="width: 25%;"><?php echo $entry_date_end; ?></td>
          <td></td>
        </tr>
      </thead>
      <tbody>
        <?php $special_row = 0; ?>
        <?php foreach ($product_specials as $product_special) { ?>
          <tr id="special-modal-row<?php echo $special_row; ?>">
            <td class="text-left">
			  <select name="product_special[<?php echo $special_row; ?>][customer_group_id]" class="form-control">
                <?php foreach ($customer_groups as $customer_group) { ?>
                  <?php if ($customer_group['customer_group_id'] == $product_special['customer_group_id']) { ?>
                    <option value="<?php echo $customer_group['customer_group_id']; ?>" selected="selected"><?php echo $customer_group['name']; ?></option>
                    <?php } else { ?>
                    <option value="<?php echo $customer_group['customer_group_id']; ?>"><?php echo $customer_group['name']; ?></option>
                  <?php } ?>
                <?php } ?>
              </select>
			</td>
            <td class="text-right"><input type="text" name="product_special[<?php echo $special_row; ?>][priority]" value="<?php echo $product_special['priority']; ?>" placeholder="<?php echo $entry_priority; ?>" class="form-control" /></td>
            <td class="text-right"><input type="text" name="product_special[<?php echo $special_row; ?>][price]" value="<?php echo $product_special['price']; ?>" placeholder="<?php echo $entry_price; ?>" class="form-control" /></td>
            <td class="text-left">
			  <div class="input-group date">
                <input type="text" name="product_special[<?php echo $special_row; ?>][date_start]" value="<?php echo $product_special['date_start']; ?>" placeholder="<?php echo $entry_date_start; ?>" data-date-format="YYYY-MM-DD" class="form-control" />
                <span class="input-group-btn"><button class="btn btn-default" type="button"><i class="fa fa-calendar"></i></button></span>
			  </div>
			</td>
            <td class="text-left">
			  <div class="input-group date">
                <input type="text" name="product_special[<?php echo $special_row; ?>][date_end]" value="<?php echo $product_special['date_end']; ?>" placeholder="<?php echo $entry_date_end; ?>" data-date-format="YYYY-MM-DD" class="form-control" />
                <span class="input-group-btn"><button class="btn btn-default" type="button"><i class="fa fa-calendar"></i></button></span>
			  </div>
			</td>
            <td class="text-left"><button type="button" onclick="$('#special-modal-row<?php echo $special_row; ?>').remove();" class="btn btn-danger"><i class="fa fa-minus-circle"></i></button></td>
          </tr>
          <?php $special_row++; ?>
        <?php } ?>
      </tbody>
      <tfoot>
        <tr>
          <td colspan="5"></td>
          <td class="text-left"><button type="button" onclick="addSpecial();" class="btn btn-primary"><i class="fa fa-plus-circle"></i></button></td>
        </tr>
      </tfoot>
    </table>
  </form>
</div>
<div class="modal-footer">
  <div class="text-center"><a data-form="form-product-price-special" class="button-save btn btn-info btn-lg"><?php echo $button_save; ?></a></div>
</div>
<script type="text/javascript"><!--
$(".button-save").on('click', function() { 	
	$.ajax({
		url: $('#' + $(this).data('form')).attr('action'),
		type: 'post',
		dataType: 'json',
		data: $('#' + $(this).data('form') + ' input[type=\'text\'], #' + $(this).data('form') + ' select'),
		success: function(json) {
			if (json['error']) {
				$('#form-product-price-special').before('<div class="alert alert-danger"><i class="fa fa-exclamation-circle"></i> ' + json['error'] + '</div>');
				
				$('.alert-danger').delay(1500).fadeOut(500);	
			}
								
			if (json['success']) {
				$('#form-product-price-special').before('<div class="alert alert-success"><i class="fa fa-check-circle"></i> ' + json['success'] + '</div>');			
				
				setTimeout(function(){
					$('#modal-product-edit').modal('hide');
					$('#product-price<?php echo $product_id; ?>').load('index.php?route=editors/product_edit/loadPrice&token=<?php echo $token; ?>&product_id=<?php echo $product_id; ?>');	
					$('#product-price-special<?php echo $product_id; ?>').load('index.php?route=editors/product_edit/loadPriceSpecial&token=<?php echo $token; ?>&product_id=<?php echo $product_id; ?>');
				}, 1000)
			}
		}
	});
});  
//--></script>
<script type="text/javascript"><!--
var special_row = <?php echo $special_row; ?>;

function addSpecial() {
	html  = '<tr id="special-modal-row' + special_row + '">'; 
    html += '  <td class="text-left"><select name="product_special[' + special_row + '][customer_group_id]" class="form-control">';
    <?php foreach ($customer_groups as $customer_group) { ?>
    html += '      <option value="<?php echo $customer_group['customer_group_id']; ?>"><?php echo addslashes($customer_group['name']); ?></option>';
    <?php } ?>
    html += '  </select></td>';		
    html += '  <td class="text-right"><input type="text" name="product_special[' + special_row + '][priority]" value="" placeholder="<?php echo $entry_priority; ?>" class="form-control" /></td>';
	html += '  <td class="text-right"><input type="text" name="product_special[' + special_row + '][price]" value="" placeholder="<?php echo $entry_price; ?>" class="form-control" /></td>';
    html += '  <td class="text-left"><div class="input-group date"><input type="text" name="product_special[' + special_row + '][date_start]" value="" placeholder="<?php echo $entry_date_start; ?>" data-date-format="YYYY-MM-DD" class="form-control" /><span class="input-group-btn"><button type="button" class="btn btn-default"><i class="fa fa-calendar"></i></button></span></div></td>';
	html += '  <td class="text-left"><div class="input-group date"><input type="text" name="product_special[' + special_row + '][date_end]" value="" placeholder="<?php echo $entry_date_end; ?>" data-date-format="YYYY-MM-DD" class="form-control" /><span class="input-group-btn"><button type="button" class="btn btn-default"><i class="fa fa-calendar"></i></button></span></div></td>';
	html += '  <td class="text-left"><button type="button" onclick="$(\'#special-modal-row' + special_row + '\').remove();" class="btn btn-danger"><i class="fa fa-minus-circle"></i></button></td>';
	html += '</tr>';
	
	$('#special-modal tbody').append(html);

	$('.date').datetimepicker({
		pickTime: false
	});
		
	special_row++;
}
//--></script>
<script type="text/javascript"><!--
$('.date').datetimepicker({
	pickTime: false
});
//--></script> 