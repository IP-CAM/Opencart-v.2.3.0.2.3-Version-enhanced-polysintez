<div id="popup-view-wrapper">
  <div class="popup-heading"><?php echo $product_name; ?></div>
  <div class="popup-center">
    <div class="row">
	<div class="col-sm-12 col-md-6">
		<?php if ($thumb || $images) { ?>
			<ul class="thumbnails main_img_box">
				<div class="image">
					<div style="display: inline-block; position: relative;">
						<img src="<?php echo $thumb; ?>" title="<?php echo $heading_title; ?>" alt="<?php echo $product_name; ?>" class="img-responsive main-image"/>
						<?php if ($stikers_status) { ?>
							<div class="stiker_panel">
								<?php if ($quantity < 1 && !$zakaz) { ?>
									<?php if ($stiker_stock) { ?>
										<span class="stiker stiker_netu"><?php echo $text_catalog_stiker_netu; ?></span>
									<?php } ?>
								<?php } ?>
								<?php if ($quantity > 0 || $zakaz) { ?>
									<?php if ($stiker_spec) { ?>
										<?php if ($special) { ?>
											<span class="stiker stiker_spec"><?php echo '- ' . round(($price_number-$special_number)/$price_number*100) . '%' ?></span>
										<?php } ?>
									<?php } ?>
									<?php if ($stiker_last) { ?>
										<span class="stiker stiker_last"><?php echo $text_catalog_stiker_last; ?></span>
									<?php } ?>
									<?php if ($stiker_best) { ?>
										<span class="stiker stiker_best"><?php echo $text_catalog_stiker_best; ?></span>
									<?php } ?>
									<?php if ($stiker_upc) { ?>
										<span class="stiker stiker_user"><?php echo $stiker_upc; ?></span>
									<?php } ?>
									<?php if ($stiker_ean) { ?>
										<span class="stiker stiker_user"><?php echo $stiker_ean; ?></span>
									<?php } ?>
									<?php if ($stiker_jan) { ?>
										<span class="stiker stiker_user"><?php echo $stiker_jan; ?></span>
									<?php } ?>
									<?php if ($stiker_isbn) { ?>
										<span class="stiker stiker_user"><?php echo $stiker_isbn; ?></span>
									<?php } ?>
									<?php if ($stiker_mpn) { ?>
										<span class="stiker stiker_user"><?php echo $stiker_mpn; ?></span>
									<?php } ?>
								<?php } ?>
							</div>
						<?php } ?>
					</div>
				</div>
				<?php if ($images) { ?>
					<?php if ($images_slider) { ?>
					<div id="owl-images-popup" class="owl-carousel owl-theme images-additional">
						<div class="item">
						<a img_src="<?php echo $thumb; ?>" title="<?php echo $heading_title; ?>"><img class="lazyOwl" data-src="<?php echo $thumb_small; ?>" title="<?php echo $heading_title; ?>" alt="<?php echo $heading_title; ?>" data-number="0"/></a>
						</div>
						<?php $number = 1 ;?>
						<?php foreach ($images as $image) { ?>
						<div class="item">
						<a img_src="<?php echo $image['popup']; ?>" title="<?php echo $heading_title; ?>"><img class="lazyOwl" data-src="<?php echo $image['thumb']; ?>" title="<?php echo $heading_title; ?>" alt="<?php echo $heading_title; ?>" data-number="<?php echo $number; ?>"/></a>
						</div>
						<?php $number++;?>
						<?php } ?>
					</div>
					<?php } else { ?>
					<div class="images-additional">
						<a class="thumbnail" img_src="<?php echo $thumb; ?>" title="<?php echo $heading_title; ?>">
							<img src="<?php echo $thumb_small; ?>" title="<?php echo $heading_title; ?>" alt="<?php echo $heading_title; ?>" data-number="0"/>
						</a>
						<?php $number = 1 ;?>
						<?php foreach ($images as $image) { ?>
							<a class="thumbnail" img_src="<?php echo $image['popup']; ?>" title="<?php echo $heading_title; ?>">
								<img src="<?php echo $image['thumb']; ?>" title="<?php echo $heading_title; ?>" alt="<?php echo $heading_title; ?>" data-number="<?php echo $number; ?>"/>
							</a>
						<?php $number++;?>
						<?php } ?>
					</div>
					<?php } ?>
					<script type="text/javascript"><!--
					$('.images-additional img').click(function(){
						newsrc = $(this).parent().attr('img_src');
						$('.main-image').attr('src', newsrc);
						return false;
					});
					var owl = $("#owl-images-popup");
						owl.owlCarousel({
						responsiveBaseWidth: '.container',
						itemsCustom: [[0, 2], [448, 2], [650, 3], [750, 3], [1000, 4]],
						navigation : true,
						navigationText: ['<i class="fa fa-chevron-left fa-5x"></i>', '<i class="fa fa-chevron-right fa-5x"></i>'],
						pagination: false,
						lazyLoad: true
					}); 
					//--></script>
				<?php } ?>
			</ul>
		<?php } ?>
	</div>
<div class="col-sm-12 col-md-6">
            <ul class="list-unstyled">
			<?php if ($review_status) { ?>
				<div class="rating">
					<li class="dotted-line"><div class="dotted-line_left"><span class="dotted-line_title"><?php echo $text_product_rating; ?></span><div class="dotted-line_line"></div></div><div class="dotted-line_right">
					<?php for ($i = 1; $i <= 5; $i++) { ?>
					<?php if ($rating < $i) { ?>
					<span class="fa fa-stack"><i class="fa fa-star-o fa-stack-1x"></i></span>
					<?php } else { ?>
					<span class="fa fa-stack"><i class="fa fa-star fa-stack-1x"></i><i class="fa fa-star-o fa-stack-1x"></i></span>
					<?php } ?>
					<?php } ?>
					<sup><?php echo $reviews; ?></sup>
					</div></li>
				</div>
			<?php } ?>
			<?php if ($manufacturer_status) { ?>
				<?php if ($manufacturer) { ?>
					<li class="dotted-line"><div class="dotted-line_left"><span class="dotted-line_title"><?php echo $text_manufacturer; ?></span><div class="dotted-line_line"></div></div><div class="dotted-line_right"><a href="<?php echo $manufacturers; ?>"><?php echo $manufacturer; ?></a></div></li>
				<?php } ?>
			<?php } ?>
			<?php if ($model_status) { ?>
				<?php if ($model != '') { ?>
					<li class="dotted-line"><div class="dotted-line_left"><span class="dotted-line_title"><?php echo $text_model; ?></span><div class="dotted-line_line"></div></div><div class="dotted-line_right"><span class="pr_model"><?php echo $model; ?></span></div></li>
				<?php } ?>
			<?php } ?>
			<?php if ($sku_status) { ?>
				<?php if ($sku != '') { ?>
					<li class="dotted-line"><div class="dotted-line_left"><span class="dotted-line_title"><?php echo $text_product_artikul; ?></span><div class="dotted-line_line"></div></div><div class="dotted-line_right"><?php echo $sku; ?></div></li>
				<?php } ?>
			<?php } ?>
			<?php if ($ostatok_status) { ?>
				<li class="dotted-line"><div class="dotted-line_left"><span class="dotted-line_title"><?php echo $text_product_dostupno; ?></span><div class="dotted-line_line"></div></div><div class="dotted-line_right"><?php echo $stock; ?></div></li>
			<?php } else { ?>
				<span class="hidden pr_quantity"><?php echo $quantity; ?></span>
			<?php } ?>
			<?php if ($weight_status) { ?>
				<?php if ($weight > 0) { ?>
					<li class="dotted-line"><div class="dotted-line_left"><span class="dotted-line_title"><?php echo $text_product_ves; ?></span><div class="dotted-line_line"></div></div><div class="dotted-line_right"><span class="pr_weight" data-weight="<?php echo $weight_value; ?>" data-weight-unit="<?php echo $weight_unit; ?>"><?php echo $weight; ?></span> <?php echo $weight_format; ?></div></li>
				<?php } ?>
			<?php } ?>
			<?php if ($razmers) { ?>
				<?php if ($length > 0 || $width > 0 || $height > 0) { ?>
					<li class="dotted-line"><div class="dotted-line_left"><span class="dotted-line_title"><?php echo $text_product_razmers; ?></span><div class="dotted-line_line"></div></div><div class="dotted-line_right"><?php if ($length > 0) { ?><?php echo $length; ?><?php } else { ?> - <?php } ?> x <?php if ($width > 0) { ?><?php echo $width; ?><?php } else { ?> - <?php } ?> x <?php if ($height > 0) { ?><?php echo $height; ?><?php } else { ?> - <?php } ?> <?php echo $length_format; ?></div></li>
				<?php } ?>
			<?php } ?>			
			<?php if ($atributs) { ?> 
				<?php foreach ($attribute_groups as $attribute_group) { ?>
						<?php foreach ($attribute_group['attribute'] as $attribute) { ?>
							<?php if ($attribute['text'] != '') { ?>	  
								<li class="dotted-line"><div class="dotted-line_left"><span class="dotted-line_title"><?php echo $attribute['name']; ?>:</span><div class="dotted-line_line"></div></div><div class="dotted-line_right"><?php echo $attribute['text']; ?></div></li>
							<?php } ?>
						<?php } ?>
				<?php } ?>
			<?php } ?>
            </ul>
		  
		<?php if ($zakaz || $quantity > 0) { ?>
		    <div class="well well-sm product-info">
				<?php if ($options) { ?>
					<?php if ($revtheme_product_all['options_buy'] && $options_buy) { ?>
						<div class="options_buy">
							<table class="table">
								<thead>
									<tr>
										<td class="text-left">
										<?php if ($revtheme_product_all['options_buy_optionname'] && $revtheme_product_all['options_buy_optionname_one']) { ?>
											<?php foreach ($options as $option) { ?>
											<?php echo $option['name']; ?>
											<?php } ?>
										<?php } else { ?>
											<?php echo $text_option_option; ?>
										<?php } ?>
										</td>
										<?php if ($revtheme_product_all['options_buy_model']) { ?>
											<td class="text-center options_buy_model"><?php echo $text_model_option; ?></td>
										<?php } ?>
										<td class="text-center options_buy_price"><?php echo $text_price_option; ?></td>
										<?php if ($revtheme_product_all['options_buy_quantity']) { ?>
											<td class="text-center options_buy_dostupno"><?php echo $text_dostupno_option; ?></td>
										<?php } ?>
										<td class="text-center options_buy_quantity"><?php echo $text_quantity_option; ?></td>
										<td class="text-center"></td>
									</tr>
								</thead>
								<tbody>
									<?php foreach ($options as $option) { ?>
										<?php if ($revtheme_product_all['options_buy_optionname'] && !$revtheme_product_all['options_buy_optionname_one']) { ?>
											<tr>
											<?php if (!$revtheme_product_all['options_buy_quantity']) { ?>
												<?php $colspan_option_name = 5 ?>
											<?php } else if (!$revtheme_product_all['options_buy_quantity'] && !$revtheme_product_all['options_buy_quantity']) { ?>
												<?php $colspan_option_name = 4 ?>
											<?php } else { ?>
												<?php $colspan_option_name = 6 ?>
											<?php } ?>
												<td colspan="<?php echo $colspan_option_name; ?>" class="text-left">
													<b style="font-size:13px"><?php echo $option['name']; ?>:</b>
												</td>
											</tr>
										<?php } ?>
										<?php foreach ($option['product_option_value'] as $option_value) { ?>
											<?php if ($option_value['price_prefix'] == '' && $option_value['price'] > 0 && $option_value['quantity'] > 0) { ?>
												<tr class="pro_<?php echo $option_value['product_option_value_id']; ?>">
												<input type="hidden" name="option[<?php echo $option['product_option_id']; ?>]" value="" />
													<td class="text-left">
														<?php if ($revtheme_product_all['options_buy_click']) { ?>
															<div class="radio">
																<label for="optb_<?php echo $product_id; ?>_<?php echo $option_value['product_option_value_id']; ?>">
																	<input onchange="update_options_buy(<?php echo $product_id; ?>,<?php echo $option_value['product_option_value_id']; ?>);" type="radio" name="option[<?php echo $option['product_option_id']; ?>]" value="<?php echo $option_value['product_option_value_id']; ?>" id="optb_<?php echo $product_id; ?>_<?php echo $option_value['product_option_value_id']; ?>" />
																	<?php if ($option['type'] == 'image') { ?>
																	<img src="<?php echo $option_value['image']; ?>" alt="<?php echo $option_value['name'] . ($option_value['price'] ? ' ' . $option_value['price_prefix'] . $option_value['price'] : ''); ?>" class="img-thumbnail img-responsive hidden-xs" />
																	<?php } ?>
																	<span class="options_buy_image_title"><?php echo $option_value['name']; ?></span>					
																</label>
															</div>
														<?php } else { ?>	
															<?php echo $option_value['name']; ?>
														<?php } ?>
													</td>
													<?php if ($revtheme_product_all['options_buy_model']) { ?>
														<td class="text-center options_buy_model">
															<?php if ($option_value['model']) { ?><?php echo $option_value['model']; ?><?php } else { ?><?php echo $model; ?><?php } ?>
														</td>
													<?php } ?>
													<td class="text-center options_buy_price">
														<?php echo $option_value['price']; ?>
													</td>
													<?php if ($revtheme_product_all['options_buy_quantity']) { ?>
														<td class="text-center options_buy_dostupno">
															<?php echo $option_value['quantity']; ?> <?php echo $shtuki; ?>
															<input type="hidden" class="option_value_quantity" value='<?php echo $minimum; ?>'>
														</td>
													<?php } ?>
													<td class="text-center options_buy_quantity">
														<div class="number">
															<div class="frame-change-count">
																<div class="btn-plus">
																	<button type="button" onclick="validate_pole_product_options(this,<?php echo $option_value['product_option_value_id']; ?>,'+',<?php echo $minimum; ?>,<?php echo $option_value['quantity']; ?>);">+</button>
																</div>
																<div class="btn-minus">
																	<button type="button" onclick="validate_pole_product_options(this,<?php echo $option_value['product_option_value_id']; ?>,'-',<?php echo $minimum; ?>,<?php echo $option_value['quantity']; ?>);">-</button>
																</div>
															</div>
															<input type="text" name="quantity" class="plus-minus" value='<?php echo $minimum; ?>' onchange="validate_pole_product_options(this,<?php echo $option_value['product_option_value_id']; ?>,'=',<?php echo $minimum; ?>,<?php echo $option_value['quantity']; ?>);" onkeyup="validate_pole_product_options(this,<?php echo $option_value['product_option_value_id']; ?>,'=',<?php echo $minimum; ?>,<?php echo $option_value['quantity']; ?>);">
														</div>
													</td>
													<td class="text-center">
														<div class="cart">
															<a onclick="get_revpopup_cart_option(<?php echo $option['product_option_id']; ?>,<?php echo $option_value['product_option_value_id']; ?>,get_revpopup_cart_pr_option_quantity('<?php echo $option_value['product_option_value_id']; ?>'),<?php echo $product_id; ?>);return false;"><i class="fa fa-border fa-shopping-basket"></i></a>
														</div>
													</td>
												</tr>
											<?php } ?>
										<?php } ?>
									<?php } ?>
								</tbody>
							</table>
							<script type="text/javascript"><!--
								function validate_pole_product_options (val, product_option_value_id, znak, minimumvalue, maximumvalue) {
									val.value = val.value.replace(/[^\d,]/g, '');
									if (val.value == '') val.value = minimumvalue;
									if (maximumvalue == 0) maximumvalue = 9999;
									input_val = $('#popup-view-wrapper .pro_'+product_option_value_id+' .plus-minus');
									quantity = parseInt(input_val.val());
									<?php if ($q_zavisimost) { ?>
									if(znak=='+' && input_val.val() < maximumvalue) input_val.val(quantity+1);
									else if(znak=='-' && input_val.val() > minimumvalue) input_val.val(quantity-1);
									else if(znak=='=' && input_val.val() < maximumvalue && input_val.val() < maximumvalue) input_val.val(input_val.val());
									if (quantity < 1 || quantity < minimumvalue) {
										input_val.val(minimumvalue);
										val.value = minimumvalue;
									} else if (quantity > maximumvalue) {
										input_val.val(maximumvalue);
										val.value = maximumvalue;
									}
									<?php } else { ?>
									if(znak=='+') input_val.val(quantity+1);
									else if(znak=='-' && input_val.val() > minimumvalue) input_val.val(quantity-1);
									else if(znak=='=' && input_val.val() > minimumvalue) input_val.val(input_val.val());
									if (quantity < 1 || quantity < minimumvalue) {
										input_val.val(minimumvalue);
										val.value = minimumvalue;
									}
									<?php } ?>
								}
								function get_revpopup_cart_pr_option_quantity (product_option_value_id) {
									input_val = $('#popup-view-wrapper .pro_'+product_option_value_id+' .plus-minus').val();
									quantity  = parseInt(input_val);
									return quantity;
								}
							//--></script>
						</div>
					<?php } else { ?>
						<?php foreach ($options as $option) { ?>
							<?php if ($option['type'] == 'select') { ?>
							<div class="form-group<?php echo ($option['required'] ? ' required' : ''); ?>">
							  <label class="control-label" for="input-option<?php echo $option['product_option_id']; ?>"><?php echo $option['name']; ?>:</label>
							  <select onchange="update_prices_product_popup(<?php echo $product_id; ?>,<?php echo $minimum; ?>);" name="option[<?php echo $option['product_option_id']; ?>]" id="input-option<?php echo $option['product_option_id']; ?>" class="form-control">
								<option value=""><?php echo $text_select; ?></option>
								<?php foreach ($option['product_option_value'] as $option_value) { ?>
								<option value="<?php echo $option_value['product_option_value_id']; ?>"><?php echo $option_value['name']; ?>
								<?php if ($opt_price) { ?>
									<?php if ($option_value['price']) { ?>
										<span class="option_price">(<?php echo $option_value['price_prefix']; ?><?php echo $option_value['price']; ?>)</span>
									<?php } ?>
								<?php } ?>
								<?php } ?>
							  </select>
							</div>
							<?php } ?>
							<?php if ($option['type'] == 'radio') { ?>
							<div class="form-group<?php echo ($option['required'] ? ' required' : ''); ?>">
							  <label class="control-label"><?php echo $option['name']; ?>:</label>
							  <div id="input-option<?php echo $option['product_option_id']; ?>">
								<?php foreach ($option['product_option_value'] as $option_value) { ?>
								<div class="radio">
									<input onchange="update_prices_product_popup(<?php echo $product_id; ?>,<?php echo $minimum; ?>);" type="radio" name="option[<?php echo $option['product_option_id']; ?>]" value="<?php echo $option_value['product_option_value_id']; ?>" id="<?php echo $option['product_option_id']; ?>_<?php echo $option_value['product_option_value_id']; ?>" />
									<label class="btn btn-default label-in-img" for="<?php echo $option['product_option_id']; ?>_<?php echo $option_value['product_option_value_id']; ?>">
										<?php if ($option_value['image']) { ?>
											<img src="<?php echo $option_value['image']; ?>" alt="<?php echo $option_value['name'] . ($option_value['price'] ? ' ' . $option_value['price_prefix'] . $option_value['price'] : ''); ?>" class="img-thumbnail" /> <?php if (!strstr($option['name'], 'Цвет')) { ?><?php echo $option_value['name']; ?><?php } ?>
										<?php } else { ?>
											<span><?php echo $option_value['name']; ?></span>
										<?php } ?>
										<?php if ($option_value['price']) { ?>
											<span class="option_price"><?php echo $option_value['price_prefix']; ?><?php echo $option_value['price']; ?></span>
										<?php } ?>
									<i class="fa fa-check" aria-hidden="true"></i>	
									</label>
								</div>
								<?php if (strstr($option['name'], 'Цвет') && $option_value['image']) { ?>
								<style>
								.product-info .radio input[type='radio'] + .label-in-img {padding: 2px;}
								.product-info .radio .img-thumbnail {margin: 0; width: 30px;}
								.product-info .radio input[type='radio']:checked + .label-in-img .fa {color: #fff; left: 21px; right: inherit; bottom: 3px;}
								</style>
								<?php } ?>
								<?php } ?>
							  </div>
							</div>
							<?php } ?>
							<?php if ($option['type'] == 'checkbox') { ?>
							<div class="form-group<?php echo ($option['required'] ? ' required' : ''); ?>">
							  <label class="control-label"><?php echo $option['name']; ?>:</label>
							  <div id="input-option<?php echo $option['product_option_id']; ?>">
								<?php foreach ($option['product_option_value'] as $option_value) { ?>
								<div class="checkbox radio">
								  <input onchange="update_prices_product_popup(<?php echo $product_id; ?>,<?php echo $minimum; ?>);" type="checkbox" name="option[<?php echo $option['product_option_id']; ?>][]" value="<?php echo $option_value['product_option_value_id']; ?>" id="<?php echo $option['product_option_id']; ?>_<?php echo $option_value['product_option_value_id']; ?>" />
									<label class="btn btn-default label-in-img" for="<?php echo $option['product_option_id']; ?>_<?php echo $option_value['product_option_value_id']; ?>">
										<?php if ($option_value['image']) { ?>
											<img src="<?php echo $option_value['image']; ?>" alt="<?php echo $option_value['name'] . ($option_value['price'] ? ' ' . $option_value['price_prefix'] . $option_value['price'] : ''); ?>" class="img-thumbnail" /> <?php if (!strstr($option['name'], 'Цвет')) { ?><?php echo $option_value['name']; ?><?php } ?>
										<?php } else { ?>
											<span><?php echo $option_value['name']; ?></span>
										<?php } ?>
										<?php if ($option_value['price']) { ?>
											<span class="option_price"><?php echo $option_value['price_prefix']; ?><?php echo $option_value['price']; ?></span>
										<?php } ?>
									<i class="fa fa-check" aria-hidden="true"></i>
									</label>
								</div>
								<?php if (strstr($option['name'], 'Цвет') && $option_value['image']) { ?>
								<style>
								.product-info .radio input[type='checkbox'] + .label-in-img {padding: 2px;}
								.product-info .radio .img-thumbnail {margin: 0; width: 30px;}
								.product-info .radio input[type='checkbox']:checked + .label-in-img .fa {color: #fff; left: 21px; right: inherit; bottom: 3px;}
								</style>
								<?php } ?>
								<?php } ?>
							  </div>
							</div>
							<?php } ?>
							<?php if ($option['type'] == 'image') { ?>
								<div class="form-group<?php echo ($option['required'] ? ' required' : ''); ?>">
								  <label class="control-label"><?php echo $option['name']; ?>:</label>
								  <div id="input-option<?php echo $option['product_option_id']; ?>">
									<?php foreach ($option['product_option_value'] as $option_value) { ?>
									<div class="radio">
										<input onchange="update_prices_product_popup(<?php echo $product_id; ?>,<?php echo $minimum; ?>);" type="radio" name="option[<?php echo $option['product_option_id']; ?>]" value="<?php echo $option_value['product_option_value_id']; ?>" id="<?php echo $option['product_option_id']; ?>_<?php echo $option_value['product_option_value_id']; ?>" />
										<label <?php if (strstr($option['name'], 'Цвет')) { ?>data-toggle="tooltip" title="<?php echo $option_value['name']; ?>"<?php } ?> class="btn btn-default label-in-img" for="<?php echo $option['product_option_id']; ?>_<?php echo $option_value['product_option_value_id']; ?>">
										<img src="<?php echo $option_value['image']; ?>" alt="<?php echo $option_value['name'] . ($option_value['price'] ? ' ' . $option_value['price_prefix'] . $option_value['price'] : ''); ?>" class="img-thumbnail" /> <?php if (!strstr($option['name'], 'Цвет')) { ?><?php echo $option_value['name']; ?><?php } ?>
										<?php if ($option_value['price']) { ?>
										<span class="option_price"><?php echo $option_value['price_prefix']; ?><?php echo $option_value['price']; ?></span>
										<?php } ?>
										<i class="fa fa-check" aria-hidden="true"></i>
										</label>
									</div>
									<?php } ?>
								  </div>
								</div>
								<?php if (strstr($option['name'], 'Цвет')) { ?>
								<style>
								.product-info .radio input[type='radio'] + .label-in-img {padding: 2px;}
								.product-info .radio .img-thumbnail {margin: 0; width: 30px;}
								.product-info .radio input[type='radio']:checked + .label-in-img .fa {color: #fff; left: 21px; right: inherit; bottom: 3px;}
								</style>
								<?php } ?>
							<?php } ?>
							<?php if ($option['type'] == 'text') { ?>
							<div class="form-group<?php echo ($option['required'] ? ' required' : ''); ?>">
							  <label class="control-label" for="input-option<?php echo $option['product_option_id']; ?>"><?php echo $option['name']; ?>:</label>
							  <input type="text" name="option[<?php echo $option['product_option_id']; ?>]" value="<?php echo $option['value']; ?>" placeholder="<?php echo $option['name']; ?>" id="input-option<?php echo $option['product_option_id']; ?>" class="form-control" />
							</div>
							<?php } ?>
							<?php if ($option['type'] == 'textarea') { ?>
							<div class="form-group<?php echo ($option['required'] ? ' required' : ''); ?>">
							  <label class="control-label" for="input-option<?php echo $option['product_option_id']; ?>"><?php echo $option['name']; ?>:</label>
							  <textarea name="option[<?php echo $option['product_option_id']; ?>]" rows="5" placeholder="<?php echo $option['name']; ?>" id="input-option<?php echo $option['product_option_id']; ?>" class="form-control"><?php echo $option['value']; ?></textarea>
							</div>
							<?php } ?>
							<?php if ($option['type'] == 'file') { ?>
							<div class="form-group<?php echo ($option['required'] ? ' required' : ''); ?>">
							  <label class="control-label"><?php echo $option['name']; ?>:</label>
							  <button type="button" id="button-upload<?php echo $option['product_option_id']; ?>" data-loading-text="<?php echo $text_loading; ?>" class="btn btn-default btn-block"><i class="fa fa-upload"></i> <?php echo $button_upload; ?></button>
							  <input type="hidden" name="option[<?php echo $option['product_option_id']; ?>]" value="" id="input-option<?php echo $option['product_option_id']; ?>" />
							</div>
							<?php } ?>
							<?php if ($option['type'] == 'date') { ?>
							<div class="form-group<?php echo ($option['required'] ? ' required' : ''); ?>">
							  <label class="control-label" for="input-option<?php echo $option['product_option_id']; ?>"><?php echo $option['name']; ?>:</label>
							  <div class="input-group date">
								<input type="text" name="option[<?php echo $option['product_option_id']; ?>]" value="<?php echo $option['value']; ?>" data-date-format="YYYY-MM-DD" id="input-option<?php echo $option['product_option_id']; ?>" class="form-control" />
								<span class="input-group-btn">
								<button class="btn btn-default" type="button"><i class="fa fa-calendar"></i></button>
								</span></div>
							</div>
							<?php } ?>
							<?php if ($option['type'] == 'datetime') { ?>
							<div class="form-group<?php echo ($option['required'] ? ' required' : ''); ?>">
							  <label class="control-label" for="input-option<?php echo $option['product_option_id']; ?>"><?php echo $option['name']; ?>:</label>
							  <div class="input-group datetime">
								<input type="text" name="option[<?php echo $option['product_option_id']; ?>]" value="<?php echo $option['value']; ?>" data-date-format="YYYY-MM-DD HH:mm" id="input-option<?php echo $option['product_option_id']; ?>" class="form-control" />
								<span class="input-group-btn">
								<button type="button" class="btn btn-default"><i class="fa fa-calendar"></i></button>
								</span></div>
							</div>
							<?php } ?>
							<?php if ($option['type'] == 'time') { ?>
							<div class="form-group<?php echo ($option['required'] ? ' required' : ''); ?>">
							  <label class="control-label" for="input-option<?php echo $option['product_option_id']; ?>"><?php echo $option['name']; ?>:</label>
							  <div class="input-group time">
								<input type="text" name="option[<?php echo $option['product_option_id']; ?>]" value="<?php echo $option['value']; ?>" data-date-format="HH:mm" id="input-option<?php echo $option['product_option_id']; ?>" class="form-control" />
								<span class="input-group-btn">
								<button type="button" class="btn btn-default"><i class="fa fa-calendar"></i></button>
								</span></div>
							</div>
							<?php } ?>
						<?php } ?>
						<hr>
					<?php } ?>
				<?php } ?>
				<?php if (($options && !$revtheme_product_all['options_buy']) || !$options_buy) { ?>
				<?php if ($recurrings) { ?>
				<hr>
				<h3><?php echo $text_payment_recurring ?></h3>
				<div class="form-group required">
				  <select name="recurring_id" class="form-control">
					<option value=""><?php echo $text_select; ?></option>
					<?php foreach ($recurrings as $recurring) { ?>
					<option value="<?php echo $recurring['recurring_id'] ?>"><?php echo $recurring['name'] ?></option>
					<?php } ?>
				  </select>
				  <div class="help-block" id="recurring-description"></div>
				</div>
				<?php } ?>
				<div class="form-group">
					<?php if ($price) { ?>
					<?php if ($price_number > 0 || $zakaz_price_null) { ?>
					  <div class="list-unstyled">
						<span class="prq_title hidden-xs"><?php echo $text_product_all_stoimost; ?></span>
						<?php if (!$special) { ?>
						<span class="update_price"><?php echo $price; ?></span>
						<span class="update_special dnone"></span>
						<?php } else { ?>
						<span class="update_price oldprice"><?php echo $price; ?></span>
						<span class="update_special"><?php echo $special; ?></span>
						<?php if ($special_end) { ?>
							<div class="countdown"><?php echo $text_countdown; ?> <span id="countdown"></span></div>
							<script type="text/javascript"><!--
								var names = {
								days:      JSON.parse(JSON.stringify({1:" день ", 2:" дня ", 3: " дней "})),
								hours:     JSON.parse(JSON.stringify({1:" час ", 2: " часа ", 3: " часов "})),
								minutes:   JSON.parse(JSON.stringify({1:" минута ", 2: " минуты ", 3: " минут "})),
								seconds:   JSON.parse(JSON.stringify({1:" секунда ", 2: " секунды ", 3: " секунд "})),
								};
								var day_name = names['days'][3];
								var hur_name = names['hours'][3];
								var min_name = names['minutes'][3];
								var sec_name = names['seconds'][3];
								var today = new Date();
								function parseDate(input) {
								var parts = input.match(/(\d+)/g);
								return new Date(parts[0], parts[1]-1, parts[2]);
								}
								var BigDay = parseDate('<?php echo $special_end;  ?>');
								var timeLeft = (BigDay.getTime() - today.getTime());
								var e_daysLeft = timeLeft / 86400000;
								var daysLeft = Math.floor(e_daysLeft);
								var slice_day = String(daysLeft).slice(-1);
								if(parseInt(slice_day) == 1 && (parseInt(daysLeft) < 10 || parseInt(daysLeft) > 20)){
									day_name = names['days'][1];
								}else if((parseInt(slice_day) == 2 || parseInt(slice_day) == 3 || parseInt(slice_day) == 4) && (parseInt(daysLeft) < 10 || parseInt(daysLeft) > 20)){
									day_name = names['days'][2];
								}else{
									day_name = names['days'][3];
								}
								var e_hrsLeft = (e_daysLeft - daysLeft)*24;
								var hrsLeft = Math.floor(e_hrsLeft);
								var slice_hours = String(hrsLeft).slice(-1);
								if(parseInt(slice_hours) == 1 && (parseInt(hrsLeft) < 10 || parseInt(hrsLeft) > 20)){
									hur_name = names['hours'][1];
								}else if((parseInt(slice_hours) == 2 || parseInt(slice_hours) == 3 || parseInt(slice_hours) == 4)  && (parseInt(hrsLeft) < 10 || parseInt(hrsLeft) > 20)){
									hur_name = names['hours'][2];
								}else{
									hur_name = names['hours'][3];
								}
								var e_minsLeft = (e_hrsLeft - hrsLeft)*60;
								var minsLeft = Math.floor(e_minsLeft);
								var slice_min = String(minsLeft).slice(-1);
								if(parseInt(slice_min) == 1 && (parseInt(minsLeft) < 10 || parseInt(minsLeft) > 20)){
									min_name = names['minutes'][1];
								}else if((parseInt(slice_min) == 2 || parseInt(slice_min) == 3 || parseInt(slice_min) == 4) && (parseInt(minsLeft) < 10 || parseInt(minsLeft) > 20)){
									min_name = names['minutes'][2];
								}else{
									min_name = names['minutes'][3];
								}
								if (BigDay.getTime() > today.getTime() ){
									if (daysLeft <= 0) {
										document.getElementById("countdown").innerHTML = hrsLeft+hur_name+minsLeft+min_name;
									} else {
										document.getElementById("countdown").innerHTML = daysLeft+day_name+hrsLeft+hur_name+minsLeft+min_name;
									}
									if (daysLeft <= 0 && hrsLeft <= 0) {
										document.getElementById("countdown").innerHTML = minsLeft+min_name;
									} else {
										document.getElementById("countdown").innerHTML = daysLeft+day_name+hrsLeft+hur_name+minsLeft+min_name;
									}
								}
							//--></script>
						<?php } ?>
						<?php } ?>
						<?php if ($points) { ?>
						<div class="reward-product"><?php echo $text_points; ?> <span class="pr_points"><?php echo $points; ?></span></div>
						<?php } ?>
					  </div>
					<?php } else { ?>
					<?php if ($zakaz) { ?>
					<div class="list-unstyled"><?php echo $text_catalog_price_na_zakaz; ?></div>
					<?php } ?>
					<?php } ?>  
					<?php } ?>
					<div class="nalich">
						<?php if ($bonusbals_status) { ?>
							<?php if ($reward) { ?>
								<div class="reward"><span data-toggle="tooltip" data-placement="top" title="<?php echo $text_product_bonus_tooltip; ?>">+ <?php echo $reward; ?> <?php echo $text_product_bonusov; ?></span></div>
							<?php } ?>
						<?php } ?>	
						<?php if ($sklad_status) { ?>
							<?php if ($quantity > 0) { ?><span class="text-success bg-success"><i class="fa fa-check" aria-hidden="true"></i> <?php echo $text_product_instock; ?></span><?php } else { ?><span class="text-danger bg-danger"><i class="fa fa-times" aria-hidden="true"></i> <?php echo $stock; ?></span><?php } ?>
						<?php } ?>
					</div>
				</div>
				<?php } ?>
				<?php if ($discounts && !$special) { ?>
				<div class="discounts">
				<hr>
				<?php foreach ($discounts as $discount) { ?>
				<span><?php echo $discount['quantity']; ?><?php echo $text_discount; ?><?php echo $discount['price']; ?></span><br/>
				<?php } ?>
				</div>
				<?php } ?>
				<?php if ($minimum > 1) { ?>
				<div class="clearfix"></div>
				<div class="alert alert-info"><i class="fa fa-info-circle"></i> <?php echo $text_minimum; ?><input type="hidden" class="minimumvalue" value="<?php echo $minimum; ?>"></div>
				<?php } ?>
				<?php if (($options && !$revtheme_product_all['options_buy']) || !$options_buy) { ?>
				<div class="form-group pokupka">
					<?php if ($price_number > 0 || $zakaz_price_null) { ?>
					<div class="pop_left">
						<label class="control-label prq_title hidden-xs"><?php echo $text_product_kolichvo; ?></label>
						<div class="number">
							<div class="frame-change-count">
								<div class="btn-plus">
									<button type="button" onclick="validate_pole_popup(this,<?php echo $product_id; ?>,'+',<?php echo $minimum; ?>,<?php echo $quantity; ?>);">+</button>
								</div>
								<div class="btn-minus">
									<button type="button" onclick="validate_pole_popup(this,<?php echo $product_id; ?>,'-',<?php echo $minimum; ?>,<?php echo $quantity; ?>);">-</button>
								</div>
							</div>
							<input type="text" name="quantity" class="plus-minus" value='<?php echo $minimum; ?>' onchange="validate_pole_popup(this);" onkeyup="validate_pole_popup(this,<?php echo $product_id; ?>,'=',<?php echo $minimum; ?>,<?php echo $quantity; ?>);">
						</div>
					<?php if ($rev_srav_prod || $rev_wish_prod) { $button_cart_class = 'prlistb hidden-xs hidden-sm hidden-md hidden-lg'; } else { $button_cart_class = 'prlistb hidden-xs'; }?>
					<button type="button" id="button-cart" data-toggle="tooltip" title="<?php echo $button_cart; ?>" onclick="get_revpopup_cart(<?php echo $product_id; ?>, 'popup_product',get_revpopup_cart_quantity_popup('<?php echo $product_id; ?>')); yaCounter23924353.reachGoal('quick_view_cart');" data-loading-text="<?php echo $text_loading; ?>" class="btn btn-primary btn-lg"><i class="fa fa-shopping-basket"><span class="<?php echo $button_cart_class; ?>"><?php echo $button_cart; ?></span></i></button>
					</div>
					<?php } ?>
					<?php if ($rev_srav_prod || $rev_wish_prod) { ?>
						<div class="pop_right">
						<?php if ($rev_wish_prod) { ?>
							<a class="<?php echo $wishlist_class ?> wishlist" data-toggle="tooltip" onclick="wishlist.add('<?php echo $product_id; ?>');" title="<?php echo $button_wishlist; ?>"><i class="fa fa-border fa-heart"></i></a>
						<?php } ?>
						<?php if ($rev_srav_prod) { ?>
							<a class="<?php echo $compare_class ?> compare" data-toggle="tooltip" onclick="compare.add('<?php echo $product_id; ?>', '<?php echo $brand; ?>');" title="<?php echo $button_compare; ?>"><i class="fa fa-border fa-bar-chart-o"></i></a>
						<?php } ?>
						</div>
					<?php } ?>
				</div>
				<?php } ?>
			</div>
		  <?php } ?>
        </div>

	<div class="col-sm-12">
	<?php if ($revtheme_product_all['pr_tabs']) { ?>
        <ul class="nav nav-tabs">
			<?php if ($description) { ?>
			<li class="active"><a href="#tab-description" data-toggle="tab"><?php echo $tab_description; ?></a></li>
			<?php } ?>
			<?php if (!$atributs) { ?>
			<?php if ($attribute_groups) { ?>
			<li><a href="#tab-specification" data-toggle="tab"><?php echo $tab_attribute; ?></a></li>
			<?php } ?>
			<?php } ?>
			<!--
			<li><a href="#tab-review" data-toggle="tab"><?php echo $tab_review; ?></a></li>
			-->
        </ul>
        <div class="tab-content">
		  <?php if ($description) { ?>
          <div class="tab-pane active" id="tab-description"><?php echo $description; ?></div>
		  <?php } ?>
          <div class="tab-pane" id="tab-specification">
            <?php if (!$atributs) { ?>
            <?php if ($attribute_groups) { ?>
            <div class="tab-pane" id="tab-specification">
              <table class="table attrbutes mb0">
				<?php if ($atributs_group_name) { ?>
					<?php foreach ($attribute_groups as $attribute_group) { ?>
					<thead>
						<tr>
						<td colspan="2"><?php echo $attribute_group['name']; ?></td>
						</tr>
					</thead>		
						<tbody>
						<?php foreach ($attribute_group['attribute'] as $attribute) { ?>
						<tr>
						<td><?php echo $attribute['name']; ?></td>
						<td><?php echo $attribute['text']; ?></td>
						</tr>
						<?php } ?>
					</tbody>
					<?php } ?>
				<?php } else { ?>	
					<tbody>
					<?php foreach ($attribute_groups as $attribute_group) { ?>
					<?php foreach ($attribute_group['attribute'] as $attribute) { ?>
					<tr>
					<td><?php echo $attribute['name']; ?></td>
					<td><?php echo $attribute['text']; ?></td>
					</tr>
					<?php } ?>
					<?php } ?>
					</tbody>
				<?php } ?>
              </table>
            </div>
            <?php } ?>
			<?php } ?>
          </div>
		  <!--
		  <div class="tab-pane" id="tab-review">   
              <div id="review"></div>           
          </div>
		  -->
        </div>
	<?php } else { ?>
		<div class="alt_pt_descript">
			<?php if ($description) { ?>
				<div class="rev_slider">
					<h3><?php echo $tab_description; ?></h3>
					<?php echo $description; ?>
				</div>
			<?php } ?>
			<?php if (!$atributs) { ?>
				<?php if ($attribute_groups) { ?>
					<div class="rev_slider">
						<h3><?php echo $tab_attribute; ?></h3>
						<?php if ($atributs_group_name) { ?>
						<?php foreach ($attribute_groups as $attribute_group) { ?>
							<table class="table attrbutes mb0">
							<thead>
								<tr>
								<td colspan="2"><?php echo $attribute_group['name']; ?></td>
								</tr>
							</thead>		
								<tbody>
								<?php foreach ($attribute_group['attribute'] as $attribute) { ?>
								<tr itemprop="additionalProperty" itemscope itemtype="http://schema.org/PropertyValue">
								<td itemprop="name"><?php echo $attribute['name']; ?></td>
								<td itemprop="value"><?php echo $attribute['text']; ?></td>
								</tr>
								<?php } ?>
							</tbody>
							</table>
							<?php } ?>
						<?php } else { ?>	
							<table class="table attrbutes mb0">
							<tbody>
							<?php foreach ($attribute_groups as $attribute_group) { ?>
							<?php foreach ($attribute_group['attribute'] as $attribute) { ?>
							<tr itemprop="additionalProperty" itemscope itemtype="http://schema.org/PropertyValue">
							<td itemprop="name"><?php echo $attribute['name']; ?></td>
							<td itemprop="value"><?php echo $attribute['text']; ?></td>
							</tr>
							<?php } ?>
							<?php } ?>
							</tbody>
							</table>
						<?php } ?>
					</div>
				<?php } ?>
			<?php } ?>
			<!--
			<?php if ($review_status) { ?>
				<div class="rev_slider">
					<h3><?php echo $tab_review; ?></h3>
					<div id="review"></div>
				</div>
			<?php } ?>
			-->
		</div>
	<?php } ?>
	</div>
    </div>    
  </div>
  <div class="popup-footer">
    <button onclick="$.magnificPopup.close();"><?php echo $button_shopping; ?></button>
    <a id="popup-view-button" href="<?php echo $view_product_link; ?>"><?php echo $button_view; ?></a>
  </div>

<script src="catalog/view/javascript/jquery/datetimepicker/moment.js" type="text/javascript"></script>
<script src="catalog/view/javascript/jquery/datetimepicker/bootstrap-datetimepicker.min.js" type="text/javascript"></script>
<link href="catalog/view/javascript/jquery/datetimepicker/bootstrap-datetimepicker.min.css" rel="stylesheet" type="text/css" />
<script type="text/javascript"><!--
$(document).ready(function(){ 
	$('#popup-view-wrapper .nav.nav-tabs li:first-child a').tab('show');
});

$('.date').datetimepicker({
  pickTime: false,
});

$('.datetime').datetimepicker({
  pickDate: true,
  pickTime: true
});

$('.time').datetimepicker({
  pickDate: false,
});

$(document).on('click', 'button[id^=\'button-upload\']', function() {
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
        url: 'index.php?route=tool/upload',
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
          $('.text-danger').remove();

          if (json['error']) {
            $(node).parent().find('input').after('<div class="text-danger">' + json['error'] + '</div>');
          }

          if (json['success']) {
            alert(json['success']);

            $(node).parent().find('input').attr('value', json['code']);
          }
        },
        error: function(xhr, ajaxOptions, thrownError) {
          alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
        }
      });
    }
  }, 500);
});
$('#button-cart').on('click', function() {
	$('.tooltip').hide();
});

<?php if ($minimum > 1 && $recalc_price) { ?>
	update_quantity_popup(<?php echo $product_id ?>,<?php echo $minimum ?>);
<?php } ?>
function get_revpopup_cart_quantity_popup() {
	input_val = $('#popup-view-wrapper .plus-minus').val();
	quantity  = parseInt(input_val);
	return quantity;
}
function validate_pole_popup(val, product_id, znak, minimumvalue, maximumvalue) {
	val.value = val.value.replace(/[^\d,]/g, '');
	if (val.value == '') val.value = minimumvalue;
	maximumvalue = Number($('#popup-view-wrapper .pr_quantity').text());
	input_val = $('#popup-view-wrapper .plus-minus');
	quantity = parseInt(input_val.val());
	<?php if ($q_zavisimost) { ?>
	if(znak=='+' && input_val.val() < maximumvalue) input_val.val(quantity+1);
	else if(znak=='-' && input_val.val() > minimumvalue) input_val.val(quantity-1);
	else if(znak=='=' && input_val.val() < maximumvalue && input_val.val() < maximumvalue) input_val.val(input_val.val());
	if (quantity < 1 || quantity < minimumvalue) {
		input_val.val(minimumvalue);
		val.value = minimumvalue;
	} else if (quantity > maximumvalue) {
		input_val.val(maximumvalue);
		val.value = maximumvalue;
	}
	<?php } else { ?>
	if(znak=='+') input_val.val(quantity+1);
	else if(znak=='-' && input_val.val() > minimumvalue) input_val.val(quantity-1);
	else if(znak=='=' && input_val.val() > minimumvalue) input_val.val(input_val.val());
	if (quantity < 1 || quantity < minimumvalue) {
		input_val.val(minimumvalue);
		val.value = minimumvalue;
	}
	<?php } ?>

	update_quantity_popup(product_id, input_val.val());
}
function update_quantity_popup(product_id, quantity) {
	var minimumvalue = <?php echo $minimum ?>;
	if (quantity == 0 || quantity < minimumvalue) {
		quantity = $('#popup-view-wrapper .plus-minus').val(minimumvalue);
		return;
	} else if (quantity < 1) {
		quantity = 1;
		return;
	}
	
	data = $('#popup-view-wrapper input[type=\'text\'], #popup-view-wrapper input[type=\'hidden\'], #popup-view-wrapper input[type=\'radio\']:checked, #popup-view-wrapper input[type=\'checkbox\']:checked, #popup-view-wrapper select, #popup-view-wrapper textarea'),
	$.ajax({
	  url: 'index.php?route=product/product/update_prices',
	  type: 'post',
	  dataType: 'json',
	  data: data.serialize() + '&product_id=' + product_id + '&quantity=' + quantity,
	  success: function(json) {
		
		<?php if ($recalc_price) { ?>
		
			<?php if ($points) { ?>
			var start_quantity = parseFloat($('#popup-view-wrapper .pr_points').html().replace(/\s*/g,''));
			var end_quantity = json['points'];
			$({val:start_quantity}).animate({val:end_quantity}, {
				duration: 500,
				easing: 'swing',
				step: function(val) {
					$('#popup-view-wrapper .pr_points').html(number_format(val, product_id));
				}
			});
			<?php } ?>
		
			<?php if ($weight_status) { ?>
			var start_weight = parseFloat($('#popup-view-wrapper .pr_weight').attr('data-weight'));
			var weight = json['weight'];
			$({val:start_weight}).animate({val:weight}, {
				duration: 500,
				easing: 'swing',
				step: function(val) {
					$('#popup-view-wrapper .pr_weight').html(weight_format(val));
				}
			});
			$('#popup-view-wrapper .pr_weight').attr('data-weight', json['weight']);
			<?php } ?>
		  
			<?php if ($price_number > 0 || $zakaz_price_null) { ?>
			var start_price = parseFloat($('#popup-view-wrapper .update_price').html().replace(/\s*/g,''));
			<?php if ($discounts && !$special) { ?>
			var price = json['special_n'];
			<?php } else { ?>
			var price = json['price_n'];
			<?php } ?>
			$({val:start_price}).animate({val:price}, {
				duration: 500,
				easing: 'swing',
				step: function(val) {
					$('#popup-view-wrapper .update_price').html(price_format(val));
				}
			});
			
			var start_special = parseFloat($('#popup-view-wrapper .update_special').html().replace(/\s*/g,''));
			var special = json['special_n'];
			$({val:start_special}).animate({val:special}, {
				duration: 500,
				easing: 'swing',
				step: function(val) {
					$('#popup-view-wrapper .update_special').html(price_format(val));
				}
			});
			<?php } ?>
		
		<?php } ?>
	  } 
	});
}
function update_prices_product_popup(product_id, minimumvalue) {
	input_val = $('#popup-view-wrapper .plus-minus').val();
	if (input_val > minimumvalue) {
		input_val = minimumvalue;
		$('#popup-view-wrapper .plus-minus').val(minimumvalue);
	}
	<?php if ($recalc_price) { ?>
	quantity = parseInt(input_val);
	<?php } else { ?>
	quantity = 1;
	<?php } ?>
	data = $('#popup-view-wrapper input[type=\'text\'], #popup-view-wrapper input[type=\'hidden\'], #popup-view-wrapper input[type=\'radio\']:checked, #popup-view-wrapper input[type=\'checkbox\']:checked, #popup-view-wrapper select, #popup-view-wrapper textarea');
	$.ajax({
	  type: 'post',
	  url:  'index.php?route=product/product/update_prices',
	  data: data.serialize() + '&product_id=' + product_id + '&quantity=' + quantity,
	  dataType: 'json',
	  success: function(json) {
	  
		$('#popup-view-wrapper .thumbnails img.main-image').attr('src', json['opt_image_2']);
		<?php if ($images_slider) { ?>
		$('#popup-view-wrapper .thumbnails .images-additional .owl-item:first-child a').attr('img_src', json['opt_image_2']);
		$('#popup-view-wrapper .thumbnails .images-additional .owl-item:first-child a img').attr('src', json['opt_image_2']).css('width', <?php echo $config_image_additional_width; ?>).css('height', <?php echo $config_image_additional_height; ?>);
		<?php } else { ?>
		$('#popup-view-wrapper .thumbnails .images-additional a:first-child').attr('img_src', json['opt_image_2']);
		$('#popup-view-wrapper .thumbnails .images-additional a:first-child img').attr('src', json['opt_image_2']).css('width', <?php echo $config_image_additional_width; ?>).css('height', <?php echo $config_image_additional_height; ?>);
		<?php } ?>

		var start_quantity = parseFloat($('#popup-view-wrapper .pr_quantity').html().replace(/\s*/g,''));
		var end_quantity = json['option_quantity'];
		$({val:start_quantity}).animate({val:end_quantity}, {
			duration: 500,
			easing: 'swing',
			step: function(val) {
				$('#popup-view-wrapper .pr_quantity').html(number_format(val, product_id));
			}
		});
		
		<?php if ($points) { ?>
		var start_quantity = parseFloat($('#popup-view-wrapper .pr_points').html().replace(/\s*/g,''));
		var end_quantity = json['points'];
		$({val:start_quantity}).animate({val:end_quantity}, {
			duration: 500,
			easing: 'swing',
			step: function(val) {
				$('#popup-view-wrapper .pr_points').html(number_format(val, product_id));
			}
		});
		<?php } ?>
		
		<?php if ($model_status) { ?>
			$('#popup-view-wrapper .pr_model').html(json['opt_model']);
		<?php } ?>

		<?php if ($weight_status) { ?>
		var start_weight = parseFloat($('#popup-view-wrapper .pr_weight').attr('data-weight'));
		var weight = json['weight'];
		$({val:start_weight}).animate({val:weight}, {
			duration: 500,
			easing: 'swing',
			step: function(val) {
				$('#popup-view-wrapper .pr_weight').html(weight_format(val));
			}
		});
		$('#popup-view-wrapper .pr_weight').attr('data-weight', json['weight']);
		<?php } ?>
	  
		<?php if ($price_number > 0 || $zakaz_price_null) { ?>
		var start_price = parseFloat($('#popup-view-wrapper .update_price').html().replace(/\s*/g,''));
		<?php if ($discounts && !$special) { ?>
		var price = json['special_n'];
		<?php } else { ?>
		var price = json['price_n'];
		<?php } ?>
		$({val:start_price}).animate({val:price}, {
			duration: 500,
			easing: 'swing',
			step: function(val) {
				$('#popup-view-wrapper .update_price').html(price_format(val));
			}
		});
		
		var start_special = parseFloat($('#popup-view-wrapper .update_special').html().replace(/\s*/g,''));
		var special = json['special_n'];
		$({val:start_special}).animate({val:special}, {
			duration: 500,
			easing: 'swing',
			step: function(val) {
				$('#popup-view-wrapper .update_special').html(price_format(val));
			}
		});
		<?php } ?>
	  }
	});
}
<?php if ($revtheme_product_all['options_buy_click']) { ?>
	function update_options_buy(product_id, option) {
		data = $('#popup-view-wrapper .options_buy .pro_'+option+' input[type=\'text\'], #popup-view-wrapper .options_buy .pro_'+option+' input[type=\'hidden\'], #popup-view-wrapper .options_buy .pro_'+option+' input[type=\'radio\']:checked, #popup-view-wrapper .options_buy .pro_'+option+' input[type=\'checkbox\']:checked, #popup-view-wrapper .options_buy .pro_'+option+' select, #popup-view-wrapper .options_buy .pro_'+option+' textarea');
		$.ajax({
		  type: 'post',
		  url:  'index.php?route=product/product/update_prices',
		  data: data.serialize() + '&product_id=' + product_id,
		  dataType: 'json',
		  success: function(json) {
			  
			$('#popup-view-wrapper .thumbnails img.main-image').attr('src', json['opt_image_2']);
			<?php if ($images_slider) { ?>
			$('#popup-view-wrapper .thumbnails .images-additional .owl-item:first-child a').attr('img_src', json['opt_image_2']);
			$('#popup-view-wrapper .thumbnails .images-additional .owl-item:first-child a img').attr('src', json['opt_image_2']).css('width', <?php echo $config_image_additional_width; ?>).css('height', <?php echo $config_image_additional_height; ?>);
			<?php } else { ?>
			$('#popup-view-wrapper .thumbnails .images-additional a:first-child').attr('img_src', json['opt_image_2']);
			$('#popup-view-wrapper .thumbnails .images-additional a:first-child img').attr('src', json['opt_image_2']).css('width', <?php echo $config_image_additional_width; ?>).css('height', <?php echo $config_image_additional_height; ?>);
			<?php } ?>
			  
			var start_quantity = parseFloat($('#popup-view-wrapper .pr_quantity').html().replace(/\s*/g,''));
			var end_quantity = json['option_quantity'];
			$({val:start_quantity}).animate({val:end_quantity}, {
				duration: 500,
				easing: 'swing',
				step: function(val) {
					$('#popup-view-wrapper .pr_quantity').html(number_format(val, product_id));
				}
			});
			
			<?php if ($points) { ?>
			var start_quantity = parseFloat($('#popup-view-wrapper .pr_points').html().replace(/\s*/g,''));
			var end_quantity = json['points'];
			$({val:start_quantity}).animate({val:end_quantity}, {
				duration: 500,
				easing: 'swing',
				step: function(val) {
					$('#popup-view-wrapper .pr_points').html(number_format(val, product_id));
				}
			});
			<?php } ?>
			
			<?php if ($model_status) { ?>
				$('#popup-view-wrapper .pr_model').html(json['opt_model']);
			<?php } ?>
			
			<?php if ($weight_status) { ?>
			var start_weight = parseFloat($('#popup-view-wrapper .pr_weight').attr('data-weight'));
			var weight = json['weight'];
			$({val:start_weight}).animate({val:weight}, {
				duration: 500,
				easing: 'swing',
				step: function(val) {
					$('#popup-view-wrapper .pr_weight').html(weight_format(val));
				}
			});
			$('#popup-view-wrapper .pr_weight').attr('data-weight', json['weight']);
			<?php } ?>
		  }
		});
	}
	function get_revpopup_cart_option (opt_id, option, quantity, product_id) {
		$('#popup-view-wrapper .options_buy .pro_'+option+' input[name=\'option['+opt_id+']\']').val(option);
		data = $('#popup-view-wrapper .product-info .options_buy .pro_'+option+' input[type=\'text\'], #popup-view-wrapper .product-info .options_buy .pro_'+option+' input[type=\'hidden\'], #popup-view-wrapper .product-info .options_buy .pro_'+option+' input[type=\'radio\']:checked, #popup-view-wrapper .product-info .options_buy .pro_'+option+' input[type=\'checkbox\']:checked, #popup-view-wrapper .product-info .options_buy .pro_'+option+' select, #popup-view-wrapper .product-info .options_buy .pro_'+option+' textarea');
		$.ajax({
			url: 'index.php?route=checkout/cart/add',
			type: 'post',
			data: data.serialize() + '&product_id=' + product_id + '&quantity=' + quantity,
			dataType: 'json',
			<?php if ($revtheme_header_cart['cart_vspl']) { ?>
				beforeSend: function(){
					$('body').addClass('razmiv2');
					$('#pagefader2').fadeIn(70);
				},
			<?php } ?>
			success: function( json ) {
				$('.alert, .text-danger').remove();
				$('.form-group').removeClass('has-error');
				$('.success, .warning, .attention, information, .error').remove();
				if (json['error']) {
					$('body').removeClass('razmiv2');
					$('#pagefader2').fadeOut(70);
				}
				if ( json['success'] ) {
					<?php if ($revtheme_header_cart['cart_vspl']) { ?>
						if (document.body.scrollHeight > document.body.offsetHeight) {
							$('#top3.absolutpo').css('right', '8.5px');
						}
						$.magnificPopup.open({
							removalDelay: 300,
							callbacks: {
								beforeOpen: function() {
								   this.st.mainClass = 'mfp-zoom-in';
								},
								close: function() {
									$('body').removeClass('razmiv2');
									$('#pagefader2').fadeOut(70);
									$('#top3.absolutpo').css('right', 'initial');
								}
							},
							tLoading: '',
							items: {
								src: 'index.php?route=revolution/revpopupcart',
								type: 'ajax'
							}
						});
					<?php } else { ?>
						tmp_img = $('#popup-view-wrapper img.main-image')
						$(tmp_img)
							.clone()
							.css({'position' : 'absolute', 'z-index' : '2000', top: $('#popup-view-wrapper img.main-image').offset().top, left: $('#popup-view-wrapper img.main-image').offset().left})
							.appendTo("body")
							.animate({opacity: 0.3,
								left: $("#cart #cart-total").offset()['left'],
								top: $("#cart #cart-total").offset()['top']+15,
								width: 10}, 800, function() {
								$(this).remove();
							});
					<?php } ?>
					$('#cart-total' ).html(json['total']);
					$('#cart-total-popup').html(json['total']);
					$('#cart > ul').load('index.php?route=common/cart/info ul li');
				}
			}
		});
	}
<?php } ?>
function price_format(n) {
	c = <?php echo (empty($currency['decimals']) ? "0" : $currency['decimals'] ); ?>;
    d = '<?php echo $currency['decimal_point']; ?>';
    t = '<?php echo $currency['thousand_point']; ?>';
    s_left = '<?php echo $currency['symbol_left']; ?>';
    s_right = '<?php echo $currency['symbol_right']; ?>';
    n = n * <?php echo $currency['value']; ?>;
    i = parseInt(n = Math.abs(n).toFixed(c)) + ''; 
    j = ((j = i.length) > 3) ? j % 3 : 0; 
    return s_left + (j ? i.substr(0, j) + t : '') + i.substr(j).replace(/(\d{3})(?=\d)/g, "$1" + t) + (c ? d + Math.abs(n - i).toFixed(c).slice(2) : '') + s_right; 
}
function weight_format(n, product_id) {
    c = 2;
    d = '.';
    t = ',';
	n = n * <?php echo $currency['value']; ?>;
    i = parseInt(n = Math.abs(n).toFixed(c)) + ''; 
    j = ((j = i.length) > 3) ? j % 3 : 0; 
    return (j ? i.substr(0, j) + t : '') + i.substr(j).replace(/(\d{3})(?=\d)/g, "$1" + t) + (c ? d + Math.abs(n - i).toFixed(c).slice(2) : '');
}
function number_format(n, product_id) {
    i = parseInt(n = Math.abs(n).toFixed(0)) + ''; 
    return i;
}

$('#review').delegate('.pagination a', 'click', function(e) {
e.preventDefault();
$('#review').fadeOut('slow');
$('#review').load(this.href);
$('#review').fadeIn('slow');
});
$('#review').load('index.php?route=product/product/review&product_id=<?php echo $product_id; ?>');
//--></script>
</div>