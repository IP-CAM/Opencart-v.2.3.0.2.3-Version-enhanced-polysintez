<div class="modal-header">
  <button type="button" class="pull-right btn btn-danger btn-sm" data-dismiss="modal" aria-hidden="true"><i class="fa fa-close"></i></button>
  <h4 class="modal-title"><?php echo $text_edit_discount; ?></h4>
</div>
<div class="modal-body" id="body-mass-product-editdiscount">
  <form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data" id="form-mass-product-editdiscount" class="form-horizontal">	
	<div class="alert alert-info"><i class="fa fa-info-circle"></i> <?php echo $text_title_sale; ?> <div id="info-discount" class="btn btn-primary scr-box pull-right btn-sale"><i class="fa fa-chevron-down"></i></div> <?php echo $text_info_discount; ?></div>
	<table class="table table-bordered">
	  <thead>
		<tr>
		  <td class="text-left" style="width: 15%;"><?php echo $entry_customer_group; ?></td>
		  <td class="text-left" style="width: 12%;"><?php echo $entry_quantity; ?></td>
		  <td class="text-left" style="width: 12%;"><?php echo $entry_priority; ?></td>
		  <td class="text-left" style="width: 25%;"><?php echo $entry_price; ?></td>
		  <td class="text-left" style="width: 18%;"><?php echo $entry_date_start; ?></td>
		  <td class="text-left" style="width: 18%;"><?php echo $entry_date_end; ?></td>
		</tr>
	  </thead>
	  <tbody>
		<tr>
		  <td class="text-left">
		    <select name="discount_customer_group_id" class="form-control">
			  <option value="" selected="selected"></option>
			  <?php foreach ($customer_groups as $customer_group) { ?>
				<option value="<?php echo $customer_group['customer_group_id']; ?>"><?php echo $customer_group['name']; ?></option>
			  <?php } ?>
			</select>
		  </td>	
		  <td class="text-left">
			<div class="input-group">
			  <input type="text" name="discount_quantity" value="" class="form-control" />
			  <div class="input-group-btn">
				<button data-toggle="dropdown" class="btn btn-default dropdown-toggle" type="button" id="ds-quantity"><span class="caret"></span></button>
				<ul class="dropdown-menu pull-right maxy-dropdown">
				  <li id="ds-quantity-plus"><a class="btn btn-link"><?php echo $text_plus; ?></a></li>
				  <li id="ds-quantity-minus"><a class="btn btn-link"><?php echo $text_minus; ?></a></li>
				  <li id="ds-quantity-multiply"><a class="btn btn-link"><?php echo $text_multiply; ?></a></li>
				  <li id="ds-quantity-divide"><a class="btn btn-link"><?php echo $text_divide; ?></a></li>
				  <li id="ds-quantity-equality"><a class="btn btn-link"><?php echo $text_equality; ?></a></li>
				  <input id="ds-quantity-type" type="hidden" name="ds_quantity_method" value="" />
				</ul>
			  </div>
			</div>
			<div id="rm-discount-quantity"><span id="ds-discount-quantity"></span></div>
		  </td>
		  <td class="text-left">
			<div class="input-group">
			  <input type="text" name="discount_priority" value="" class="form-control" />
			  <div class="input-group-btn">
				<button data-toggle="dropdown" class="btn btn-default dropdown-toggle" type="button" id="ds-priority"><span class="caret"></span></button>
				<ul class="dropdown-menu pull-right maxy-dropdown">
				  <li id="ds-priority-plus"><a class="btn btn-link"><?php echo $text_plus; ?></a></li>
				  <li id="ds-priority-minus"><a class="btn btn-link"><?php echo $text_minus; ?></a></li>
				  <li id="ds-priority-equality"><a class="btn btn-link"><?php echo $text_equality; ?></a></li>
				  <input id="ds-priority-type" type="hidden" name="ds_priority_method" value="" />
				</ul>
			  </div>
			</div>
			<div id="rm-discount-priority"><span id="ds-discount-priority"></span></div>
		  </td>
		  <td class="text-left">
		    <div class="input-group">
			  <span class="input-group-btn">
				<button data-toggle="dropdown" class="btn btn-default dropdown-toggle" type="button" id="ds-price"><span class="caret"></span></button>
				<ul class="dropdown-menu pull-left maxy-dropdown">
				  <li id="ds-price-plus"><a class="btn btn-link"><?php echo $text_plus; ?></a></li>
				  <li id="ds-price-minus"><a class="btn btn-link"><?php echo $text_minus; ?></a></li>
				  <li id="ds-price-multiply"><a class="btn btn-link"><?php echo $text_multiply; ?></a></li>
				  <li id="ds-price-divide"><a class="btn btn-link"><?php echo $text_divide; ?></a></li>
				  <li id="ds-price-equality"><a class="btn btn-link"><?php echo $text_equality; ?></a></li>
				  <input id="ds-method-type" type="hidden" name="ds_price_method" value="" />
				</ul>
			  </span>
			  <input type="text" name="discount_price_value" value="" class="form-control" />
			  <span class="input-group-btn">
				<button data-toggle="dropdown" class="btn btn-default dropdown-toggle" type="button" id="ds-price-type"><span class="caret"></span></button>
				<ul class="dropdown-menu pull-right maxy-dropdown">
				  <li id="ds-price-fixed"><a class="btn btn-link"><?php echo $text_amount; ?></a></li>
				  <li id="ds-price-percent"><a class="btn btn-link"><?php echo $text_percent; ?></a></li>
				  <input id="ds-price-type-val" type="hidden" name="ds_price_type" value="" />
				</ul>
			  </span>
			</div>
			<div id="rm-price-value"><span id="ds-price-value"></span></div>
			<div id="rm-price-info"><span id="ds-price-info"></span></div>
		  </td>
		  <td class="text-left">
			<div class="input-group date">
			  <input type="text" name="discount_date_start" value="" data-date-format="YYYY-MM-DD" class="form-control" />
			  <span class="input-group-btn"><button class="btn btn-default" type="button"><i class="fa fa-calendar"></i></button></span>
			</div>
		  </td>
		  <td class="text-left">
			<div class="input-group date">
			  <input type="text" name="discount_date_end" value=""  data-date-format="YYYY-MM-DD" class="form-control" />
			  <span class="input-group-btn"><button class="btn btn-default" type="button"><i class="fa fa-calendar"></i></button></span>
			</div>
		  </td>
		</tr>				  
	  </tbody>
	</table>
  </form>
</div>
<div class="modal-footer">
  <div class="text-center"><a data-form="form-mass-product-editdiscount" class="button-save btn btn-info btn-lg"><?php echo $button_save; ?></a></div>
</div>
<script type="text/javascript"><!--
$(".button-save").on('click', function(){		
	$.ajax({
		url: $('#' + $(this).data('form')).attr('action'),
		type: 'post',
		dataType: 'json',
		data: $('#product-list input[type=\'checkbox\']:checked, #' + $(this).data('form') + ' input[type=\'text\'], #' + $(this).data('form') + ' input[type=\'hidden\'], #' + $(this).data('form') + ' select'),
		success: function(json) {				
			$('#form-mass-product-editdiscount .text-danger').remove();
			
			if (json['error']) {
				if (json['error']['warning']) {
					$('#form-mass-product-editdiscount').before('<div class="alert alert-danger"><i class="fa fa-exclamation-circle"></i> ' + json['error']['warning'] + '</div>');
				
					$('.alert-danger').delay(1500).fadeOut(500);
				}
				
				for (i in json['error']) {
					var element = $('#ds-' + i.replace('_', '-'));
						
					if ($(element).parent().hasClass('input-group')) {
						$(element).parent().after('<div class="text-danger">' + json['error'][i] + '</div>');
					} else {
						$(element).after('<div class="text-danger">' + json['error'][i] + '</div>');
					}				
				}
				
				if (json['error']['discount_quantity']) {
					$('#ds-quantity').removeClass('btn-default').addClass('btn-danger');
				}
				
				if (json['error']['discount_priority']) {
					$('#ds-priority').removeClass('btn-default').addClass('btn-danger');
				}
			
				if (json['error']['price_value']) {
					$('#ds-price').removeClass('btn-default').addClass('btn-danger');
				}
				
				if (json['error']['price_info']) {
					$('#ds-price-type').removeClass('btn-default').addClass('btn-danger');
				}
			}
								
			if (json['success']) {
				$('#form-mass-product-editdiscount').before('<div class="alert alert-success"><i class="fa fa-check-circle"></i> ' + json['success'] + '</div>');	
				
				setTimeout(function(){
					$('#modal-product-edit').modal('hide');
				}, 1000)
			}
		}
	});
});  
//--></script>
<script type="text/javascript"><!--
$(document).ready(function() {	
	$('#info-discount').on('click', function() {	
		$(this).next('.text-info-discount').slideToggle(300);
		$(this).toggleClass('show');                                  
		if ($(this).hasClass('show')) {
			$(this).find('i').replaceWith('<i class="fa fa-chevron-up"></i>');
		} else {
			$(this).find('i').replaceWith('<i class="fa fa-chevron-down"></i>');
		}
	});
	$('#ds-price-fixed').on('click', function() {	
		$('#ds-price-type').html('<?php echo $text_amount_short; ?>').removeClass('btn-danger').addClass('btn-default');
		$('#ds-price-type-val').val('amount');
		$('#rm-price-info').remove();
	});
	$('#ds-price-percent').on('click', function() {	
		$('#ds-price-type').html('<?php echo $text_percent; ?>').removeClass('btn-danger').addClass('btn-default');
		$('#ds-price-type-val').val('percent');
		$('#rm-price-info').remove();
	});
	$('#ds-quantity-plus').on('click', function() {	
		$('#ds-quantity').html('<i class="fa fa-plus"></i>').removeClass('btn-danger').addClass('btn-default');
		$('#ds-quantity-type').val('plus');
		$('#rm-discount-quantity').remove();
	});
	$('#ds-quantity-minus').on('click', function() {	
		$('#ds-quantity').html('<i class="fa fa-minus"></i>').removeClass('btn-danger').addClass('btn-default');
		$('#ds-quantity-type').val('minus');
		$('#rm-discount-quantity').remove();
	});
	$('#ds-quantity-multiply').on('click', function() {	
		$('#ds-quantity').html('<div class="item-multiply">*</div>').removeClass('btn-danger').addClass('btn-default');
		$('#ds-quantity-type').val('multiply');
		$('#rm-discount-quantity').remove();
	});
	$('#ds-quantity-divide').on('click', function() {	
		$('#ds-quantity').html('<div class="item-divide">/</div>').removeClass('btn-danger').addClass('btn-default');
		$('#ds-quantity-type').val('divide');
		$('#rm-discount-quantity').remove();
	});
	$('#ds-quantity-equality').on('click', function() {	
		$('#ds-quantity').html('<div class="item-equality">=</div>').removeClass('btn-danger').addClass('btn-default');
		$('#ds-quantity-type').val('equality');
		$('#rm-discount-quantity').remove();
	});
	$('#ds-priority-plus').on('click', function() {	
		$('#ds-priority').html('<i class="fa fa-plus"></i>').removeClass('btn-danger').addClass('btn-default');
		$('#ds-priority-type').val('plus');
		$('#rm-discount-priority').remove();
	});
	$('#ds-priority-minus').on('click', function() {	
		$('#ds-priority').html('<i class="fa fa-minus"></i>').removeClass('btn-danger').addClass('btn-default');
		$('#ds-priority-type').val('minus');
		$('#rm-discount-priority').remove();
	});
	$('#ds-priority-equality').on('click', function() {	
		$('#ds-priority').html('<div class="item-equality">=</div>').removeClass('btn-danger').addClass('btn-default');
		$('#ds-priority-type').val('equality');
		$('#rm-discount-priority').remove();
	});
	$('#ds-price-plus').on('click', function() {	
		$('#ds-price').html('<i class="fa fa-plus"></i>').removeClass('btn-danger').addClass('btn-default');
		$('#ds-method-type').val('plus');
		$('#rm-price-value').remove();
	});
	$('#ds-price-minus').on('click', function() {	
		$('#ds-price').html('<i class="fa fa-minus"></i>').removeClass('btn-danger').addClass('btn-default');
		$('#ds-method-type').val('minus');
		$('#rm-price-value').remove();
	});
	$('#ds-price-multiply').on('click', function() {	
		$('#ds-price').html('<div class="item-multiply">*</div>').removeClass('btn-danger').addClass('btn-default');
		$('#ds-method-type').val('multiply');
		$('#rm-price-value').remove();
	});
	$('#ds-price-divide').on('click', function() {	
		$('#ds-price').html('<div class="item-divide">/</div>').removeClass('btn-danger').addClass('btn-default');
		$('#ds-method-type').val('divide');
		$('#rm-price-value').remove();
	});
	$('#ds-price-equality').on('click', function() {	
		$('#ds-price').html('<div class="item-equality">=</div>').removeClass('btn-danger').addClass('btn-default');
		$('#ds-method-type').val('equality');
		$('#rm-price-value').remove();
	});
});
//--></script>
<script type="text/javascript"><!--
$('.date').datetimepicker({
	pickTime: false
});
//--></script> 