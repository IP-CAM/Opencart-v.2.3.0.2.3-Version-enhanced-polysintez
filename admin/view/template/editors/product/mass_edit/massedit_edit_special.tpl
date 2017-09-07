<div class="modal-header">
  <button type="button" class="pull-right btn btn-danger btn-sm" data-dismiss="modal" aria-hidden="true"><i class="fa fa-close"></i></button>
  <h4 class="modal-title"><?php echo $text_edit_special; ?></h4>
</div>
<div class="modal-body" id="body-mass-product-editspecial">
  <form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data" id="form-mass-product-editspecial" class="form-horizontal">	
	<div class="alert alert-info"><i class="fa fa-info-circle"></i> <?php echo $text_title_sale; ?> <div id="info-special" class="btn btn-primary scr-box pull-right btn-sale"><i class="fa fa-chevron-down"></i></div> <?php echo $text_info_special; ?></div>
	<table class="table table-bordered">
	  <thead>
		<tr>
		  <td class="text-left" style="width: 15%;"><?php echo $entry_customer_group; ?></td>
		  <td class="text-left" style="width: 15%;"><?php echo $entry_priority; ?></td>
		  <td class="text-left" style="width: 30%;"><?php echo $entry_price; ?></td>
		  <td class="text-left" style="width: 20%;"><?php echo $entry_date_start; ?></td>
		  <td class="text-left" style="width: 20%;"><?php echo $entry_date_end; ?></td>
		</tr>
	  </thead>
	  <tbody>
		<tr>
		  <td class="text-left">
			<select name="special_customer_group_id" class="form-control">
			  <option value="" selected="selected"></option>
			  <?php foreach ($customer_groups as $customer_group) { ?>
				<option value="<?php echo $customer_group['customer_group_id']; ?>"><?php echo $customer_group['name']; ?></option>
			  <?php } ?>
			</select>
		  </td>	
		  <td class="text-left">
			<div class="input-group">
			  <input type="text" name="special_priority" value="" class="form-control" />
			  <div class="input-group-btn">
				<button data-toggle="dropdown" class="btn btn-default dropdown-toggle" type="button" id="sp-priority"><span class="caret"></span></button>
				<ul class="dropdown-menu pull-right maxy-dropdown">
				  <li id="sp-priority-plus"><a class="btn btn-link"><?php echo $text_plus; ?></a></li>
				  <li id="sp-priority-minus"><a class="btn btn-link"><?php echo $text_minus; ?></a></li>
				  <li id="sp-priority-equality"><a class="btn btn-link"><?php echo $text_equality; ?></a></li>
				  <input id="sp-priority-type" type="hidden" name="sp_priority_method" value="" />
				</ul>
			  </div>
			</div>
			<div id="rms-special-priority"><span id="sp-special-priority"></span></div>
		  </td>
		  <td class="text-left">
			<div class="input-group">
			  <span class="input-group-btn">
				<button data-toggle="dropdown" class="btn btn-default dropdown-toggle" type="button" id="sp-price"><span class="caret"></span></button>
				<ul class="dropdown-menu pull-left maxy-dropdown">
				  <li id="sp-price-plus"><a class="btn btn-link"><?php echo $text_plus; ?></a></li>
				  <li id="sp-price-minus"><a class="btn btn-link"><?php echo $text_minus; ?></a></li>
				  <li id="sp-price-multiply"><a class="btn btn-link"><?php echo $text_multiply; ?></a></li>
				  <li id="sp-price-divide"><a class="btn btn-link"><?php echo $text_divide; ?></a></li>
				  <li id="sp-price-equality"><a class="btn btn-link"><?php echo $text_equality; ?></a></li>
				  <input id="sp-method-type" type="hidden" name="sp_price_method" value="" />
				</ul>
			  </span>
			  <input type="text" name="special_price_value" value="" class="form-control" />
			  <span class="input-group-btn">
				<button data-toggle="dropdown" class="btn btn-default dropdown-toggle" type="button" id="sp-price-type"><span class="caret"></span></button>
				<ul class="dropdown-menu pull-right maxy-dropdown">
				  <li id="sp-price-fixed"><a class="btn btn-link"><?php echo $text_amount; ?></a></li>
				  <li id="sp-price-percent"><a class="btn btn-link"><?php echo $text_percent; ?></a></li>
				  <input id="sp-price-type-val" type="hidden" name="sp_price_type" value="" />
				</ul>
			  </span>
			</div>
			<div id="rms-price-value"><span id="sp-price-value"></span></div>
			<div id="rms-price-info"><span id="sp-price-info"></span></div>
		  </td>
		  <td class="text-left">
			<div class="input-group date">
			  <input type="text" name="special_date_start" value="" data-date-format="YYYY-MM-DD" class="form-control" />
			  <span class="input-group-btn"><button class="btn btn-default" type="button"><i class="fa fa-calendar"></i></button></span>
			</div>
		  </td>
		  <td class="text-left">
			<div class="input-group date">
			  <input type="text" name="special_date_end" value=""  data-date-format="YYYY-MM-DD" class="form-control" />
			  <span class="input-group-btn"><button class="btn btn-default" type="button"><i class="fa fa-calendar"></i></button></span>
			</div>
		  </td>
		</tr>				  
	  </tbody>
	</table>	
  </form>
</div>
<div class="modal-footer">
  <div class="text-center"><a data-form="form-mass-product-editspecial" class="button-save btn btn-info btn-lg"><?php echo $button_save; ?></a></div>
</div>
<script type="text/javascript"><!--
$(".button-save").on('click', function(){		
	$.ajax({
		url: $('#' + $(this).data('form')).attr('action'),
		type: 'post',
		dataType: 'json',
		data: $('#product-list input[type=\'checkbox\']:checked, #' + $(this).data('form') + ' input[type=\'text\'], #' + $(this).data('form') + ' input[type=\'hidden\'], #' + $(this).data('form') + ' select'),
		success: function(json) {				
			$('#form-mass-product-editspecial .text-danger').remove();
			
			if (json['error']) {
				if (json['error']['warning']) {
					$('#form-mass-product-editspecial').before('<div class="alert alert-danger"><i class="fa fa-exclamation-circle"></i> ' + json['error']['warning'] + '</div>');
				
					$('.alert-danger').delay(1500).fadeOut(500);
				}
				
				for (i in json['error']) {
					var element = $('#sp-' + i.replace('_', '-'));
						
					if ($(element).parent().hasClass('input-group')) {
						$(element).parent().after('<div class="text-danger">' + json['error'][i] + '</div>');
					} else {
						$(element).after('<div class="text-danger">' + json['error'][i] + '</div>');
					}				
				}
				
				if (json['error']['special_priority']) {
					$('#sp-priority').removeClass('btn-default').addClass('btn-danger');
				}
			
				if (json['error']['price_value']) {
					$('#sp-price').removeClass('btn-default').addClass('btn-danger');
				}
				
				if (json['error']['price_info']) {
					$('#sp-price-type').removeClass('btn-default').addClass('btn-danger');
				}
			}
								
			if (json['success']) {
				$('#form-mass-product-editspecial').before('<div class="alert alert-success"><i class="fa fa-check-circle"></i> ' + json['success'] + '</div>');
				
				setTimeout(function(){
					location.reload(true);
				}, 100)
			}
		}
	});
});  
//--></script>
<script type="text/javascript"><!--
$(document).ready(function() {	
	$('#info-special').on('click', function() {	
		$(this).next('.text-info-special').slideToggle(300);
		$(this).toggleClass('show');                                  
		if ($(this).hasClass('show')) {
			$(this).find('i').replaceWith('<i class="fa fa-chevron-up"></i>');
		} else {
			$(this).find('i').replaceWith('<i class="fa fa-chevron-down"></i>');
		}
	});
	$('#sp-price-fixed').on('click', function() {	
		$('#sp-price-type').html('<?php echo $text_amount_short; ?>').removeClass('btn-danger').addClass('btn-default');
		$('#sp-price-type-val').val('amount');
		$('#rms-price-info').remove();
	});
	$('#sp-price-percent').on('click', function() {	
		$('#sp-price-type').html('<?php echo $text_percent; ?>').removeClass('btn-danger').addClass('btn-default');
		$('#sp-price-type-val').val('percent');
		$('#rms-price-info').remove();
	});
	$('#sp-priority-plus').on('click', function() {	
		$('#sp-priority').html('<i class="fa fa-plus"></i>').removeClass('btn-danger').addClass('btn-default');
		$('#sp-priority-type').val('plus');
		$('#rms-special-priority').remove();
	});
	$('#sp-priority-minus').on('click', function() {	
		$('#sp-priority').html('<i class="fa fa-minus"></i>').removeClass('btn-danger').addClass('btn-default');
		$('#sp-priority-type').val('minus');
		$('#rms-special-priority').remove();
	});
	$('#sp-priority-equality').on('click', function() {	
		$('#sp-priority').html('<div class="item-equality">=</div>').removeClass('btn-danger').addClass('btn-default');
		$('#sp-priority-type').val('equality');
		$('#rms-special-priority').remove();
	});
	$('#sp-price-plus').on('click', function() {	
		$('#sp-price').html('<i class="fa fa-plus"></i>').removeClass('btn-danger').addClass('btn-default');
		$('#sp-method-type').val('plus');
		$('#rms-price-value').remove();
	});
	$('#sp-price-minus').on('click', function() {	
		$('#sp-price').html('<i class="fa fa-minus"></i>').removeClass('btn-danger').addClass('btn-default');
		$('#sp-method-type').val('minus');
		$('#rms-price-value').remove();
	});
	$('#sp-price-multiply').on('click', function() {	
		$('#sp-price').html('<div class="item-multiply">*</div>').removeClass('btn-danger').addClass('btn-default');
		$('#sp-method-type').val('multiply');
		$('#rms-price-value').remove();
	});
	$('#sp-price-divide').on('click', function() {	
		$('#sp-price').html('<div class="item-divide">/</div>').removeClass('btn-danger').addClass('btn-default');
		$('#sp-method-type').val('divide');
		$('#rms-price-value').remove();
	});
	$('#sp-price-equality').on('click', function() {	
		$('#sp-price').html('<div class="item-equality">=</div>').removeClass('btn-danger').addClass('btn-default');
		$('#sp-method-type').val('equality');
		$('#rms-price-value').remove();
	});
});
//--></script>
<script type="text/javascript"><!--
$('.date').datetimepicker({
	pickTime: false
});
//--></script> 