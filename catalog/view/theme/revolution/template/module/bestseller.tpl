<div class="rev_slider">
    <h3><?php echo $heading_title; ?></h3>
    <div class="row product-layout">
        <div id="slider_m_best" class="owl-carousel">
        <?php foreach ($products as $product) { ?>
			<div class="product-layout col-lg-12 item">
			  <div class="product-thumb product_<?php echo $product['product_id']; ?>">
				<div class="image" style="max-width:<?php echo $setting_img_width; ?>px;margin:0 auto;">
					<?php if ($img_slider) { ?>		
						<div class="image owl-carousel owlproduct">
							<div class="item text-center">
								<a href="<?php echo $product['href']; ?>"><img src="<?php echo $product['thumb']; ?>" alt="<?php echo $product['name']; ?>" title="<?php echo $product['name']; ?>" class="img-responsive <?php if (($product['quantity'] < 1 && !$zakaz) || ($product['price_number'] == 0 && !$zakaz_price_null)) { ?>zatemnenie_img<?php } ?>" /></a>
							</div>			
							<?php if ($product['images']) { ?>
								<?php foreach ($product['images'] as $image) { ?>
									<!--noindex-->
									<div class="item text-center">
										<a href="<?php echo $product['href']; ?>"><img src="<?php echo $image['thumb']; ?>" alt="<?php echo $product['name']; ?>" title="<?php echo $product['name']; ?>" class="img-responsive <?php if (($product['quantity'] < 1 && !$zakaz) || ($product['price_number'] == 0 && !$zakaz_price_null)) { ?>zatemnenie_img<?php } ?>" rel="nofollow" /></a>
									</div>
									<!--/noindex-->
								<?php } ?>
							<?php } ?>
						</div>
					<?php } else { ?>
						<a href="<?php echo $product['href']; ?>"><img src="<?php echo $product['thumb']; ?>" alt="<?php echo $product['name']; ?>" title="<?php echo $product['name']; ?>" class="img-responsive <?php if (($product['quantity'] < 1 && !$zakaz) || ($product['price_number'] == 0 && !$zakaz_price_null)) { ?>zatemnenie_img<?php } ?>" /></a>
					<?php } ?>
					<?php if ($stikers_status) { ?>
						<div class="stiker_panel">
							<?php if ($product['stiker_stock']) { ?>
								<?php if ($product['price_number'] == 0 && !$zakaz_price_null) { ?>
									<span class="stiker stiker_netu"><?php echo $text_catalog_stiker_netu_2; ?></span>
								<?php } elseif ($product['quantity'] < 1 && $product['price_number'] > 0 && !$zakaz) { ?>
									<span class="stiker stiker_netu"><?php echo $product['text_catalog_stiker_netu']; ?></span>
								<?php } elseif ($product['quantity'] < 1 && !$zakaz && $zakaz_price_null) { ?>
									<span class="stiker stiker_netu"><?php echo $product['text_catalog_stiker_netu']; ?></span>
								<?php } elseif ($product['quantity'] < 1 && $zakaz && !$zakaz_price_null) { ?>
									<span class="stiker stiker_netu"><?php echo $product['text_catalog_stiker_netu']; ?></span>
								<?php } elseif ($product['quantity'] < 1 && $zakaz && $zakaz_price_null) { ?>
									<span class="stiker stiker_netu"><?php echo $product['text_catalog_stiker_netu']; ?></span>
								<?php } ?>
							<?php } ?>
							<?php if ($product['quantity'] > 0 && $product['price_number'] != 0) { ?>
								<?php if ($product['stiker_spec']) { ?>
									<?php if ($product['special']) { ?>
										<span class="stiker stiker_spec"><span class="price-old special_no_format<?php echo $product['product_id']; ?>"><?php echo $product['price']; ?></span></span>
									<?php } else { ?>
										<span class="hidden special_no_format<?php echo $product['product_id']; ?>"></span>
									<?php } ?>
								<?php } else { ?>
									<span class="hidden special_no_format<?php echo $product['product_id']; ?>"></span>
								<?php } ?>
								<?php if ($product['stiker_last']) { ?>
									<span class="stiker stiker_last"><?php echo $text_catalog_stiker_last; ?></span>
								<?php } ?>
								<?php if ($product['stiker_best']) { ?>
									<span class="stiker stiker_best"><?php echo $text_catalog_stiker_best; ?></span>
								<?php } ?>
								<?php if ($product['stiker_upc']) { ?>
									<span class="stiker stiker_user"><?php echo $product['stiker_upc']; ?></span>
								<?php } ?>
								<?php if ($product['stiker_ean']) { ?>
									<span class="stiker stiker_user"><?php echo $product['stiker_ean']; ?></span>
								<?php } ?>
								<?php if ($product['stiker_jan']) { ?>
									<span class="stiker stiker_user"><?php echo $product['stiker_jan']; ?></span>
								<?php } ?>
								<?php if ($product['stiker_isbn']) { ?>
									<span class="stiker stiker_user"><?php echo $product['stiker_isbn']; ?></span>
								<?php } ?>
								<?php if ($product['stiker_mpn']) { ?>
									<span class="stiker stiker_user"><?php echo $product['stiker_mpn']; ?></span>
								<?php } ?>
							<?php } else { ?>
								<span class="hidden special_no_format<?php echo $product['product_id']; ?>"></span>
							<?php } ?>
						</div>
					<?php } ?>
					<?php if ($revpopuporder || $popup_view) { ?>
						<div class="fapanel">
							<?php if ($product['quantity'] > 0 || $zakaz) { ?>
								<?php if ($revpopuporder) { ?>
									<?php if ($product['price_number'] > 0) { ?>
										<div class="zakaz">
											<a onclick="get_revpopup_purchase('<?php echo $product['product_id']; ?>');"><i data-toggle="tooltip" data-placement="left" title="<?php echo $text_catalog_revpopup_purchase; ?>" class='fa fa-border fa-gavel'></i></a>
										</div>
									<?php } ?>
								<?php } ?>
							<?php } ?>
							<?php if ($popup_view) { ?>
								<div class="lupa">
									<a onclick="get_revpopup_view('<?php echo $product['product_id']; ?>');"><i data-toggle="tooltip" data-placement="left" title="<?php echo $text_catalog_revpopup_view; ?>" class='fa fa-border fa-eye'></i></a>
								</div>
							<?php } ?>
						</div>
					<?php } ?>
				</div>
				<div class="caption product-info clearfix">
					<h4><a href="<?php echo $product['href']; ?>"><?php echo $product['name']; ?></a></h4>
					<?php if ($product['rating']) { ?>
					<div class="rating">
					  <?php for ($i = 1; $i <= 5; $i++) { ?>
					  <?php if ($product['rating'] < $i) { ?>
					  <span class="fa fa-stack"><i class="fa fa-star-o fa-stack-2x"></i></span>
					  <?php } else { ?>
					  <span class="fa fa-stack"><i class="fa fa-star fa-stack-2x"></i><i class="fa fa-star-o fa-stack-2x"></i></span>
					  <?php } ?>
					  <?php } ?>
					</div>
					<?php } ?>
					
					<div class="description_options">
						<div class="description <?php echo (($product['options'] && $product['options_buy']) ? 'description_options_buy_price' : ''); ?>">
							<?php echo $product['description']; ?>
							<?php if (!$description_options['zamena_description']) { ?><span class="hidden pr_quantity_<?php echo $product['product_id']; ?>"></span><?php } ?>
						</div>
						<?php if ($product['options'] && $product['options_buy']) { ?>
							<div class="well well-sm product-info options_buy">
								<div id="option_<?php echo $product['product_id']; ?>" class="options">
									<div class="form-group">
										<?php if ($revtheme_product_all['options_buy_optionname_one']) { ?>
											<label class="control-label options_buy_label"><?php foreach ($product['options'] as $option) { ?><?php echo $option['name']; ?>:<?php } ?></label>
										<?php } else { ?>
											<label class="control-label options_buy_label"><?php echo $text_option_option; ?>:</label>
										<?php } ?>
										<select class="form-control" onchange="get_product_option_id_slider_m_best('<?php echo $product['product_id']; ?>')" name="" id="slider_m_best_soption_<?php echo $product['product_id']; ?>">
												<?php foreach ($product['options'] as $option) { ?>
													<?php if ($revtheme_product_all['options_buy_optionname']) { ?>
														<optgroup label="<?php echo $option['name']; ?>:" >
													<?php } ?>
													<?php foreach ($option['product_option_value'] as $option_value) { ?>
														<?php if ($option_value['price_prefix'] == '' && $option_value['price'] > 0 && $option_value['quantity'] > 0) { ?>
															<option product_option_id="<?php echo $option['product_option_id']; ?>" value="<?php echo $option_value['product_option_value_id']; ?>"><?php echo $option_value['name']; ?>
															<?php if ($opt_price) { ?>
																<?php if ($option_value['price']) { ?>
																<span class="option_price">(<?php echo $option_value['price_prefix']; ?><?php echo $option_value['price']; ?>)</span>
																<?php } ?>
															<?php } ?>
															</option>
														<?php } ?>
													<?php } ?>
													<?php if ($revtheme_product_all['options_buy_optionname']) { ?>
														</optgroup>
													<?php } ?>
												<?php } ?>
										</select>
									</div>
								</div>
							</div>
							<script type="text/javascript"><!--
							$('#slider_m_best select.form-control option:nth-child(1)').attr('selected', 'selected');
							$( document ).ready(function() {
								get_product_option_id_slider_m_best (<?php echo $product['product_id']; ?>);
							});
							function get_product_option_id_slider_m_best (product_id) {
								var sel_option_id = document.getElementById('slider_m_best_soption_'+product_id);
								var option_id = sel_option_id.options[sel_option_id.selectedIndex].getAttribute('product_option_id');
								sel_option_id.setAttribute('name', 'option['+option_id+']');
								update_prices_product_slider_m_best (product_id,1);
							}
							--></script>
						<?php } else if ($product['options']) { ?>
							<div class="well well-sm product-info">
							<div id="option_<?php echo $product['product_id']; ?>" class="options">
							<?php foreach ($product['options'] as $option) { ?>
								<?php if ($option['type'] == 'select') { ?>
								<div class="form-group<?php echo ($option['required'] ? ' required' : ''); ?>">
								  <label class="control-label" for="slider_m_best_input-option<?php echo $option['product_option_id']; ?>"><?php echo $option['name']; ?>:</label>
								  <select onchange="update_prices_product_slider_m_best(<?php echo $product['product_id']; ?>,<?php echo $product['minimum']; ?>);" name="option[<?php echo $option['product_option_id']; ?>]" id="slider_m_best_input-option<?php echo $option['product_option_id']; ?>" class="form-control">
									<option value=""><?php echo $text_select; ?></option>
									<?php foreach ($option['product_option_value'] as $option_value) { ?>
									<option value="<?php echo $option_value['product_option_value_id']; ?>"><?php echo $option_value['name']; ?>
									<?php if ($opt_price) { ?>
										<?php if ($option_value['price']) { ?>
										<span class="option_price">(<?php echo $option_value['price_prefix']; ?><?php echo $option_value['price']; ?>)</span>
										<?php } ?>
									<?php } ?>
									</option>
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
										<input onchange="update_prices_product_slider_m_best(<?php echo $product['product_id']; ?>,<?php echo $product['minimum']; ?>);" type="radio" name="option[<?php echo $option['product_option_id']; ?>]" value="<?php echo $option_value['product_option_value_id']; ?>" id="slider_m_best_<?php echo $option['product_option_id']; ?>_<?php echo $option_value['product_option_value_id']; ?>" />
										<label class="btn btn-default <?php if ($option_value['image']) { ?>label-in-img<?php } ?>" for="slider_m_best_<?php echo $option['product_option_id']; ?>_<?php echo $option_value['product_option_value_id']; ?>">
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
									  <input onchange="update_prices_product_slider_m_best(<?php echo $product['product_id']; ?>,<?php echo $product['minimum']; ?>);" type="checkbox" name="option[<?php echo $option['product_option_id']; ?>][]" value="<?php echo $option_value['product_option_value_id']; ?>" id="slider_m_best_<?php echo $option['product_option_id']; ?>_<?php echo $option_value['product_option_value_id']; ?>" />
										<label class="btn btn-default <?php if ($option_value['image']) { ?>label-in-img<?php } ?>" for="slider_m_best_<?php echo $option['product_option_id']; ?>_<?php echo $option_value['product_option_value_id']; ?>">
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
											<input onchange="update_prices_product_slider_m_best(<?php echo $product['product_id']; ?>,<?php echo $product['minimum']; ?>);" type="radio" name="option[<?php echo $option['product_option_id']; ?>]" value="<?php echo $option_value['product_option_value_id']; ?>" id="slider_m_best_<?php echo $option['product_option_id']; ?>_<?php echo $option_value['product_option_value_id']; ?>" />
											<label <?php if (strstr($option['name'], 'Цвет')) { ?>data-toggle="tooltip" title="<?php echo $option_value['name']; ?>"<?php } ?> class="btn btn-default label-in-img" for="slider_m_best_<?php echo $option['product_option_id']; ?>_<?php echo $option_value['product_option_value_id']; ?>">
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
								  <label class="control-label" for="slider_m_best_input-option<?php echo $option['product_option_id']; ?>"><?php echo $option['name']; ?>:</label>
								  <input type="text" name="option[<?php echo $option['product_option_id']; ?>]" value="<?php echo $option['value']; ?>" placeholder="<?php echo $option['name']; ?>" id="slider_m_best_input-option<?php echo $option['product_option_id']; ?>" class="form-control" />
								</div>
								<?php } ?>
								<?php if ($option['type'] == 'textarea') { ?>
								<div class="form-group<?php echo ($option['required'] ? ' required' : ''); ?>">
								  <label class="control-label" for="slider_m_best_input-option<?php echo $option['product_option_id']; ?>"><?php echo $option['name']; ?>:</label>
								  <textarea name="option[<?php echo $option['product_option_id']; ?>]" rows="5" placeholder="<?php echo $option['name']; ?>" id="slider_m_best_input-option<?php echo $option['product_option_id']; ?>" class="form-control"><?php echo $option['value']; ?></textarea>
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
								  <label class="control-label" for="slider_m_best_input-option<?php echo $option['product_option_id']; ?>"><?php echo $option['name']; ?>:</label>
								  <div class="input-group date">
									<input type="text" name="option[<?php echo $option['product_option_id']; ?>]" value="<?php echo $option['value']; ?>" data-date-format="YYYY-MM-DD" id="slider_m_best_input-option<?php echo $option['product_option_id']; ?>" class="form-control" />
									<span class="input-group-btn">
									<button class="btn btn-default" type="button"><i class="fa fa-calendar"></i></button>
									</span></div>
								</div>
								<?php } ?>
								<?php if ($option['type'] == 'datetime') { ?>
								<div class="form-group<?php echo ($option['required'] ? ' required' : ''); ?>">
								  <label class="control-label" for="slider_m_best_input-option<?php echo $option['product_option_id']; ?>"><?php echo $option['name']; ?>:</label>
								  <div class="input-group datetime">
									<input type="text" name="option[<?php echo $option['product_option_id']; ?>]" value="<?php echo $option['value']; ?>" data-date-format="YYYY-MM-DD HH:mm" id="slider_m_best_input-option<?php echo $option['product_option_id']; ?>" class="form-control" />
									<span class="input-group-btn">
									<button type="button" class="btn btn-default"><i class="fa fa-calendar"></i></button>
									</span></div>
								</div>
								<?php } ?>
								<?php if ($option['type'] == 'time') { ?>
								<div class="form-group<?php echo ($option['required'] ? ' required' : ''); ?>">
								  <label class="control-label" for="slider_m_best_input-option<?php echo $option['product_option_id']; ?>"><?php echo $option['name']; ?>:</label>
								  <div class="input-group time">
									<input type="text" name="option[<?php echo $option['product_option_id']; ?>]" value="<?php echo $option['value']; ?>" data-date-format="HH:mm" id="slider_m_best_input-option<?php echo $option['product_option_id']; ?>" class="form-control" />
									<span class="input-group-btn">
									<button type="button" class="btn btn-default"><i class="fa fa-calendar"></i></button>
									</span></div>
								</div>
								<?php } ?>
							<?php } ?>
							</div>
							</div>
						<?php } ?>
					</div>
					<div class="product_buttons">
						<?php if ($product['price']) { ?>
							<?php if ($product['price_number'] > 0) { ?>
								<?php if ($product['quantity'] > 0 || $zakaz) { ?>
									<div class="price">
									<?php if ($product['price_number'] > 0 || $zakaz_price_null) { ?>
										<?php if (!$product['special']) { ?>
											<span class="price_no_format<?php echo $product['product_id']; ?>"><?php echo $product['price']; ?></span>
										<?php } else { ?>
											<span class="price-new"><span class="price_no_format<?php echo $product['product_id']; ?>"><?php echo $product['special']; ?></span></span>
										<?php } ?>
									<?php } ?>
									</div>
								<?php } else { ?>
									<div class="price"><span class="hidden price_no_format<?php echo $product['product_id']; ?>"></span></div>
								<?php } ?>
								<?php if ($ch_quantity && ($product['price_number'] > 0 || $zakaz_price_null) && ($product['quantity'] > 0 || $zakaz)) { ?>
									<div class="number">
										<div class="frame-change-count">
											<div class="btn-plus">
												<button type="button" onclick="validate_pole_slider_m_best(this,<?php echo $product['product_id']; ?>,'+',<?php echo $product['minimum']; ?>,<?php echo $product['quantity']; ?>);">+</button>
											</div>
											<div class="btn-minus">
												<button type="button" onclick="validate_pole_slider_m_best(this,<?php echo $product['product_id']; ?>,'-',<?php echo $product['minimum']; ?>,<?php echo $product['quantity']; ?>);">-</button>
											</div>
										</div>
										<input type="text" name="quantity" class="plus-minus" value='<?php echo $product['minimum']; ?>' onchange="validate_pole_slider_m_best(this);" onkeyup="validate_pole_slider_m_best(this,<?php echo $product['product_id']; ?>,'=',<?php echo $product['minimum']; ?>,<?php echo $product['quantity']; ?>);">
									</div>
								<?php } else { ?>
									<div class="number bordnone"></div>
									<input type="hidden" name="quantity" class="plus-minus" value='<?php echo $product['minimum']; ?>'>
								<?php } ?>
								<div class="clearfix"></div>
							<?php } else { ?>
								<?php if ($zakaz || $zakaz_price_null) { ?>
									<div class="price"><span class="hidden price_no_format<?php echo $product['product_id']; ?>"></span></div>
									<?php if ($product['price_number'] == 0 && !$zakaz_price_null) { ?>
									<?php } else if ($product['quantity'] > 0 || $zakaz) { ?>
										<div class="price_na_zakaz"><?php echo $text_catalog_price_na_zakaz; ?></div>
									<?php } ?>
								<?php } else { ?>
									<div class="price"><span class="hidden price_no_format<?php echo $product['product_id']; ?>"></span></div>
								<?php } ?>
							<?php } ?>
						<?php } ?>
						<?php if ($rev_srav_prod || $rev_wish_prod) { ?>
							<?php if ($rev_srav_prod) { ?>
								<div class="compare">
									<a class="<?php echo $product['compare_class'] ?>" data-toggle="tooltip" onclick="compare.add('<?php echo $product['product_id']; ?>', '<?php echo $product['brand']; ?>');" title="<?php echo $product['button_compare']; ?>"><i class="fa fa-border fa-bar-chart-o"></i></a>
								</div>
							<?php } ?>
							<?php if ($rev_wish_prod) { ?>
								<div class="wishlist">
									<a class="<?php echo $product['wishlist_class'] ?>" data-toggle="tooltip" onclick="wishlist.add('<?php echo $product['product_id']; ?>');" title="<?php echo $product['button_wishlist']; ?>"><i class="fa fa-border fa-heart"></i></a>
								</div>
						<?php } ?>
						<?php $button_cart_class = 'prlistb'; } else { $button_cart_class = 'prlistb active'; }?>
						<?php if ($product['quantity'] > 0 || $zakaz) { ?>
							<?php if ($product['price_number'] > 0 || $zakaz_price_null) { ?>
								<div class="cart">
									<a onclick="get_revpopup_cart(<?php echo $product['product_id']; ?>,'module',get_revpopup_cart_quantity_slider_m_best('<?php echo $product['product_id']; ?>'),'slider_m_best');" <?php if ($button_cart_class != 'prlistb active') { ?>data-toggle="tooltip" title="<?php echo $button_cart; ?>"<?php } ?>><i class="fa fa-border fa-shopping-basket"><span class="<?php echo $button_cart_class; ?>"><?php echo $button_cart; ?></span></i></a>
								</div>
							<?php } ?>
						<?php } ?>
					</div>
				</div>
					
			  </div>
			</div>
        <?php } ?>
        </div>
    </div>

<script type="text/javascript"><!--
$("#slider_m_best").owlCarousel({
	responsiveBaseWidth: '#slider_m_best',
	<?php if ($chislo_ryad) { ?>
	itemsCustom: [[0, 1], [375, 2], [750, 3], [970, 4], [1170, 4]],
	<?php } else { ?>
	itemsCustom: [[0, 1], [375, 2], [750, 3], [970, 4], [1170, 5]],
	<?php } ?>
	mouseDrag: true,
	touchDrag: true,
	navigation: true,
	navigationText: ['<i class="fa fa-chevron-left"></i>', '<i class="fa fa-chevron-right"></i>'],
	pagination: true,
});

<?php if ($img_slider) { ?>
	$('#slider_m_best .owlproduct').owlCarousel({
		items: 1,
		singleItem: true,
		mouseDrag: false,
		touchDrag: false,
		autoPlay: false,
		navigation: true,
		navigationText: ['<i class="fa fa-chevron-left fa-3x"></i>', '<i class="fa fa-chevron-right fa-3x"></i>'],
		pagination: false
	});
<?php } else { ?>
	$('.owl-carousel.owlproduct').remove();
<?php } ?>

<?php foreach ($products as $product) { if ($product['minimum'] > 1 && $recalc_price) { ?>
	update_quantity_slider_m_best(<?php echo $product['product_id']; ?>, <?php echo $product['minimum']; ?>);
<?php } } ?>
function get_revpopup_cart_quantity_slider_m_best(product_id) {
	input_val = $('#slider_m_best .product_'+product_id+' .plus-minus').val();
	quantity  = parseInt(input_val);
	return quantity;
}
function validate_pole_slider_m_best(val, product_id, znak, minimumvalue, maximumvalue) {
	val.value = val.value.replace(/[^\d,]/g, '');
	if (val.value == '') val.value = minimumvalue;
	maximumvalue = Number($('#slider_m_best .pr_quantity_'+product_id).text());
	if (maximumvalue == 0) maximumvalue = 9999;
	input_val = $('#slider_m_best .product_'+product_id+' .plus-minus');	
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
	update_quantity_slider_m_best(product_id, input_val.val());
}
function update_quantity_slider_m_best(product_id, quantity) {
	<?php if ($recalc_price) { ?>
		quantity = quantity;
	<?php } else { ?>
		quantity = 1;
	<?php } ?>
	
	data = $('#slider_m_best .product_'+product_id+' .options input[type=\'text\'], #slider_m_best .product_'+product_id+' .options input[type=\'hidden\'], #slider_m_best .product_'+product_id+' .options input[type=\'radio\']:checked, #slider_m_best .product_'+product_id+' .options input[type=\'checkbox\']:checked, #slider_m_best .product_'+product_id+' .options select');
	$.ajax({
	  url: 'index.php?route=product/product/update_prices',
	  type: 'post',
	  dataType: 'json',
	  data: data.serialize() + '&product_id=' + product_id + '&quantity=' + quantity,
	  success: function(json) {
		<?php if ($recalc_price) { ?>
		
			<?php if ($description_options['zamena_description'] && $description_options['weight']) { ?>
			var start_weight = parseFloat($('#slider_m_best .pr_weight_'+product_id).attr('data-weight'));
			var weight = json['weight'];
			$({val:start_weight}).animate({val:weight}, {
				duration: 500,
				easing: 'swing',
				step: function(val) {
					$('#slider_m_best .pr_weight_'+product_id).html(weight_format(val, product_id));
				}
			});
			$('#slider_m_best .pr_weight_'+product_id).attr('data-weight', json['weight']);
			<?php } ?>

			<?php if ($stikers_status) { ?>
				var start_price = parseFloat($('#slider_m_best .special_no_format'+product_id).html().replace(/\s*/g,''));
				var price = json['price_n'];
				$({val:start_price}).animate({val:price}, {
					duration: 500,
					easing: 'swing',
					step: function(val) {
						$('#slider_m_best .special_no_format'+product_id).html(price_format(val));
					}
				});
			<?php } ?>
			
			var start_special = parseFloat($('#slider_m_best .price_no_format'+product_id).html().replace(/\s*/g,''));
			var special = json['special_n'];
			$({val:start_special}).animate({val:special}, {
				duration: 500,
				easing: 'swing',
				step: function(val) {
					$('#slider_m_best .price_no_format'+product_id).html(price_format(val));
				}
			});
		<?php } ?>
	  }
	});
}
function update_prices_product_slider_m_best(product_id, minimumvalue) {
	input_val = $('#slider_m_best .product_'+product_id+' .plus-minus').val();
	if (input_val > minimumvalue) {
		input_val = minimumvalue;
		$('#slider_m_best .product_'+product_id+' .plus-minus').val(minimumvalue);
	}
	<?php if ($recalc_price) { ?>
	quantity = parseInt(input_val);
	<?php } else { ?>
	quantity = 1;
	<?php } ?>
	data = $('#slider_m_best .product_'+product_id+' .options input[type=\'text\'], #slider_m_best .product_'+product_id+' .options input[type=\'hidden\'], #slider_m_best .product_'+product_id+' .options input[type=\'radio\']:checked, #slider_m_best .product_'+product_id+' .options input[type=\'checkbox\']:checked, #slider_m_best .product_'+product_id+' .options select');
	$.ajax({
	  type: 'post',
	  url:  'index.php?route=product/product/update_prices',
	  data: data.serialize() + '&product_id=' + product_id + '&quantity=' + quantity,
	  dataType: 'json',
	  success: function(json) {
	  
		<?php if ($img_slider) { ?>
		$('#slider_m_best .product_'+product_id+' .image .owl-item:first-child img').attr('src', json['opt_image']);
		<?php } else { ?>
		$('#slider_m_best .product_'+product_id+' .image img').attr('src', json['opt_image']);
		<?php } ?>
		
		<?php if ($description_options['zamena_description'] && $description_options['model']) { ?>
		$('#slider_m_best .product_'+product_id+' .pr_model_'+product_id).html(json['opt_model']);
		<?php } ?>
	  
		var start_quantity = parseFloat($('#slider_m_best .pr_quantity_'+product_id).html().replace(/\s*/g,''));
		var end_quantity = json['option_quantity'];
		$({val:start_quantity}).animate({val:end_quantity}, {
			duration: 500,
			easing: 'swing',
			step: function(val) {
				$('#slider_m_best .pr_quantity_'+product_id).html(number_format(val, product_id));
			}
		});
		
		<?php if ($description_options['zamena_description'] && $description_options['weight']) { ?>
		var start_weight = parseFloat($('#slider_m_best .pr_weight_'+product_id).attr('data-weight'));
		var weight = json['weight'];
		$({val:start_weight}).animate({val:weight}, {
			duration: 500,
			easing: 'swing',
			step: function(val) {
				$('#slider_m_best .pr_weight_'+product_id).html(weight_format(val, product_id));
			}
		});
		$('#slider_m_best .pr_weight_'+product_id).attr('data-weight', json['weight']);
		<?php } ?>
	  
		<?php if ($stikers_status) { ?>
		var start_price = parseFloat($('#slider_m_best .special_no_format'+product_id).html().replace(/\s*/g,''));
		var price = json['price_n'];
		$({val:start_price}).animate({val:price}, {
			duration: 500,
			easing: 'swing',
			step: function(val) {
				$('#slider_m_best .special_no_format'+product_id).html(price_format(val));
			}
		});
		<?php } ?>
		
		var start_special = parseFloat($('#slider_m_best .price_no_format'+product_id).html().replace(/\s*/g,''));
		var special = json['special_n'];
		$({val:start_special}).animate({val:special}, {
			duration: 500,
			easing: 'swing',
			step: function(val) {
				$('#slider_m_best .price_no_format'+product_id).html(price_format(val));
			}
		});

	  }
	});
}
var product_grid_width = $('.product-layout .product-thumb').outerWidth();
if (product_grid_width < 240) {
	$('.product-layout').addClass('new_line');
} else {
	$('.product-layout').removeClass('new_line');
}
max_height_div('#slider_m_best .product-thumb h4');
$('#slider_m_best .product-thumb .description_options').css('min-height', 'initial');
max_height_div('#slider_m_best .product-thumb .description');
max_height_div('#slider_m_best .product-thumb .description_options');
max_height_div('#slider_m_best .product-thumb .price');
max_height_div('#slider_m_best .product-thumb .number');	
function max_height_div(div) {
	var maxheight = 0;
	$(div).each(function(){
		$(this).removeAttr('style');
		if($(this).height() > maxheight) {
			maxheight = $(this).height();
		}
	});
	$(div).height(maxheight);
}
//--></script>	
</div>