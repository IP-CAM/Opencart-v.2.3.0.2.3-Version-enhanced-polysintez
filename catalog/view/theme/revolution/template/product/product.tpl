<?php echo $header; ?>
<div class="container">
<div itemscope itemtype="http://schema.org/BreadcrumbList" style="display:none;">
<?php $position = 1; foreach ($breadcrumbs as $breadcrumb) { ?>
<div itemprop="itemListElement" itemscope itemtype="http://schema.org/ListItem">
<link itemprop="item" href="<?php echo $breadcrumb['href']; ?>">
<meta itemprop="name" content="<?php echo $breadcrumb['text']; ?>" />
<meta itemprop="position" content="<?php echo $position; ?>" />
</div>
<?php $position++; } ?>
</div>
<ul class="breadcrumb"><li class="br_ellipses" style="display: none;">...</li>
<?php foreach ($breadcrumbs as $i=> $breadcrumb) { ?>
<?php if($i+1<count($breadcrumbs)) { ?><li><a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a></li><?php } else { ?><?php } ?>
<?php } ?>
<li><h1 class="inbreadcrumb"><?php echo $heading_title; ?></h1></li>
</ul>
  <div class="row"><?php echo $column_left; ?>
    <?php if ($column_left && $column_right) { ?>
    <?php $class = 'col-sm-6'; $columns_dd = true ?>
    <?php } elseif ($column_left || $column_right || ($products && $recpr_rightc)) { ?>
    <?php $class = 'col-sm-9'; $columns_dd = true ?>
    <?php } else { ?>
    <?php $class = 'col-sm-12'; $columns_dd = false ?>
    <?php } ?>
    <div id="content" class="<?php echo $class; ?>"><?php echo $content_top; ?>
      <div class="row" itemscope itemtype="http://schema.org/Product">
		<meta itemprop="name" content="<?php echo $heading_title; ?>" />
		<meta itemprop="category" content="<?php echo $breadcrumbs[count($breadcrumbs)-2]['text']; ?>" />
        <?php if ($column_left || $column_right) { ?>
        <?php $class2 = 'col-sm-9 col-md-6'; ?>
        <?php } else { ?>
        <?php $class2 = 'col-sm-12 col-md-5'; ?>
        <?php } ?>
        <div class="<?php echo $class2; ?> product_informationss">
			<?php if ($thumb || $images) { ?>
				<div class="thumbnails">
				<?php if ($thumb) { ?>
					<div class="main_img_box">
					<?php if ($zoom) { ?>
						<div id="imageWrap" class="image">
							<a class="cloud-zoom main-image" id='zoom1' rel="position:'inside'" href="<?php echo $popup; ?>" title="<?php echo $heading_title; ?>"><img id="mainImage" class="img-responsive" src="<?php echo $thumb; ?>" title="<?php echo $heading_title; ?>" alt="<?php echo $heading_title; ?>" itemprop="image" />
								<?php if ($stikers_status) { ?>
									<div class="stiker_panel">
										<?php if (($quantity < 1 && !$zakaz) || (!$zakaz_price_null && $price_number == 0)) { ?>
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
							</a>
						</div>
					<?php } else { ?>
						<div class="image">
							<a class="main-image" href="<?php echo $popup; ?>" title="<?php echo $heading_title; ?>" data-number="0"><img class="img-responsive" src="<?php echo $thumb; ?>" title="<?php echo $heading_title; ?>" alt="<?php echo $heading_title; ?>" itemprop="image" />
								<?php if ($stikers_status) { ?>
									<div class="stiker_panel">
										<?php if (($quantity < 1 && !$zakaz) || (!$zakaz_price_null && $price_number == 0)) { ?>
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
							</a>
						</div>
					<?php } ?>
					</div>
				<?php } ?>
				<?php if ($images) { ?>
					<?php if ($images_slider) { ?>
						<div id="owl-images" class="owl-carousel owl-theme images-additional">
							<div class="item">
								<a href="<?php echo $popup; ?>" id="<?php echo $thumb; ?>" title="<?php echo $heading_title; ?>"><img src="<?php echo $thumb_small; ?>" title="<?php echo $heading_title; ?>" alt="<?php echo $heading_title; ?>" data-number="0"/></a>
							</div>
							<?php $number = 1 ;?>
							<?php foreach ($images as $image) { ?>
								<div class="item">
									<?php if (!$zoom) { ?>
										<?php if ($image['video']) { ?>
											<a class="mfp-iframe" href="<?php echo $image['video']; ?>" id="<?php echo $image['thumb_big']; ?>"><span></span>
												<img src="<?php echo $image['thumb']; ?>" title="<?php echo $heading_title; ?>" alt="<?php echo $heading_title; ?>" data-number="<?php echo $number; ?>"/>
											</a>
										<?php } else { ?>
											<a href="<?php echo $image['popup']; ?>" id="<?php echo $image['thumb_big']; ?>" title="<?php echo $heading_title; ?>">
												<img src="<?php echo $image['thumb']; ?>" title="<?php echo $heading_title; ?>" alt="<?php echo $heading_title; ?>" data-number="<?php echo $number; ?>"/>
											</a>
										<?php } ?>
									<?php } else { ?>
										<a href="<?php echo $image['popup']; ?>" id="<?php echo $image['thumb_big']; ?>" title="<?php echo $heading_title; ?>">
											<img src="<?php echo $image['thumb']; ?>" title="<?php echo $heading_title; ?>" alt="<?php echo $heading_title; ?>" data-number="<?php echo $number; ?>"/>
										</a>
									<?php } ?>
								</div>
							<?php $number++;?>
							<?php } ?>
						</div>
					<?php } else { ?>
						<div class="images-additional">
								<a class="thumbnail" href="<?php echo $popup; ?>" id="<?php echo $thumb; ?>" title="<?php echo $heading_title; ?>">
									<img src="<?php echo $thumb_small; ?>" title="<?php echo $heading_title; ?>" alt="<?php echo $heading_title; ?>" data-number="0"/>
								</a>
							<?php $number = 1 ;?>
							<?php foreach ($images as $image) { ?>
								<?php if (!$zoom) { ?>
									<?php if ($image['video']) { ?>
										<a class="thumbnail mfp-iframe" href="<?php echo $image['video']; ?>"><span></span>
											<img src="<?php echo $image['thumb']; ?>" title="<?php echo $heading_title; ?>" alt="<?php echo $heading_title; ?>" data-number="<?php echo $number; ?>"/>
										</a>
									<?php } else { ?>
										<a class="thumbnail" href="<?php echo $image['popup']; ?>" id="<?php echo $image['thumb_big']; ?>" title="<?php echo $heading_title; ?>">
											<img src="<?php echo $image['thumb']; ?>" title="<?php echo $heading_title; ?>" alt="<?php echo $heading_title; ?>" data-number="<?php echo $number; ?>"/>
										</a>
									<?php } ?>
								<?php } else { ?>	
									<a class="thumbnail" href="<?php echo $image['popup']; ?>" id="<?php echo $image['thumb_big']; ?>" title="<?php echo $heading_title; ?>">
										<img src="<?php echo $image['thumb']; ?>" title="<?php echo $heading_title; ?>" alt="<?php echo $heading_title; ?>" data-number="<?php echo $number; ?>"/>
									</a>
								<?php } ?>	
							<?php $number++;?>
							<?php } ?>
						</div>
					<?php } ?>
				<?php } ?>
				</div>
			<?php } ?>
        </div>
		<?php if ($column_left || $column_right) { ?>
        <?php $class3 = 'col-sm-12 col-md-6'; ?>
        <?php } else { ?>
        <?php $class3 = 'col-sm-12 col-md-7'; ?>
        <?php } ?>
        <div class="<?php echo $class3; ?> product_informationss">
			<?php if ($review_status) { ?>
				<?php if ($reviews_number > 0) { ?>
					<span itemprop="aggregateRating" itemscope itemtype="http://schema.org/AggregateRating">
					<meta itemprop="worstRating" content = "1">
					<meta itemprop="bestRating" content = "5">
					<meta itemprop="ratingValue" content = "<?php echo $rating; ?>">
					<meta itemprop="reviewCount" content = "<?php echo $reviews_number; ?>">
					</span>
				<?php } ?>
			<?php } ?>
            <ul class="list-unstyled">
			<?php if ($review_status) { ?>
				<li class="rating dotted-line"><div class="dotted-line_left"><span class="dotted-line_title"><?php echo $text_product_rating; ?></span><div class="dotted-line_line"></div></div><div class="dotted-line_right">
				<?php for ($i = 1; $i <= 5; $i++) { ?>
				<?php if ($rating < $i) { ?>
				<span class="fa fa-stack"><i class="fa fa-star-o fa-stack-1x"></i></span>
				<?php } else { ?>
				<span class="fa fa-stack"><i class="fa fa-star fa-stack-1x"></i><i class="fa fa-star-o fa-stack-1x"></i></span>
				<?php } ?>
				<?php } ?>
				<?php if ($revtheme_product_all['pr_tabs']) { ?>
					<sup><a class="adotted" onclick="$('a[href=\'#tab-review\']').trigger('click'); $('html, body').animate({ scrollTop: $('a[href=\'#tab-review\']').offset().top - 2}, 250); return false;"><?php echo $reviews; ?></a></sup>
				<?php } else { ?>
					<sup><a class="adotted" onclick="$('html, body').animate({ scrollTop: $('.tab-review').offset().top - 70}, 250); return false;"><?php echo $reviews; ?></a></sup>
				<?php } ?>
				
				
				</div></li>
			<?php } ?>
			<?php if ($manufacturer_status) { ?>
				<?php if ($manufacturer) { ?>
					<li class="dotted-line"><div class="dotted-line_left"><span class="dotted-line_title"><?php echo $text_manufacturer; ?></span><div class="dotted-line_line"></div></div><div class="dotted-line_right"><a href="<?php echo $manufacturers; ?>"><span itemprop="brand"><?php echo $manufacturer; ?></span></a></div></li>
				<?php } ?>
			<?php } ?>
			<?php if ($model_status) { ?>
				<?php if ($model != '') { ?>
					<li class="dotted-line"><div class="dotted-line_left"><span class="dotted-line_title"><?php echo $text_model; ?></span><div class="dotted-line_line"></div></div><div class="dotted-line_right"><span class="pr_model" itemprop="model"><?php echo $model; ?></span></div></li>
				<?php } ?>
			<?php } ?>
			<?php if ($sku_status) { ?>
				<?php if ($sku != '') { ?>
					<li class="dotted-line"><div class="dotted-line_left"><span class="dotted-line_title"><?php echo $text_product_artikul; ?></span><div class="dotted-line_line"></div></div><div class="dotted-line_right"><span itemprop="sku"><?php echo $sku; ?></span></div></li>
				<?php } ?>
			<?php } ?>
			<?php if ($ostatok_status) { ?>
				<li class="dotted-line"><div class="dotted-line_left"><span class="dotted-line_title"><?php echo $text_product_dostupno; ?></span><div class="dotted-line_line"></div></div><div class="dotted-line_right"><?php echo $stock; ?></div></li>
			<?php } else { ?>
				<li class="hidden pr_quantity"><?php echo $quantity; ?></li>
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
			<?php if (!$atributs) { ?>
				<?php if ($revtheme_product_all_attribute_group) { ?>	  
					<?php foreach ($attribute_groups as $attribute_group) { ?>
						<?php if (in_array($attribute_group['attribute_group_id'], $revtheme_product_all_attribute_group)) { ?>
							<?php foreach ($attribute_group['attribute'] as $attribute) { ?>
								<?php if ($attribute['text'] != '') { ?>	  
									<li class="dotted-line"><div class="dotted-line_left"><span class="dotted-line_title"><?php echo $attribute['name']; ?>:</span><div class="dotted-line_line"></div></div><div class="dotted-line_right"><?php echo $attribute['text']; ?></div></li>
								<?php } ?>
							<?php } ?>
						<?php } ?>
					<?php } ?>
					<?php if ($atributs_ssilka_all && $attribute_groups) { ?>
						<li class="adotted_block">
							<?php if ($revtheme_product_all['pr_tabs']) { ?>
								<a class="adotted" onclick="$('a[href=\'#tab-specification\']').trigger('click'); $('html, body').animate({ scrollTop: $('a[href=\'#tab-specification\']').offset().top - 2}, 250); return false;"><?php echo $text_product_all_attribs; ?></a>
							<?php } else { ?>
								<a class="adotted" onclick="$('html, body').animate({ scrollTop: $('.tab-specification').offset().top - 70}, 250); return false;"><?php echo $text_product_all_attribs; ?></a>
							<?php } ?>
						</li>
					<?php } ?>
				<?php } ?>
			<?php } ?>
			
			<?php if ($atributs) { ?> 
				<?php foreach ($attribute_groups as $attribute_group) { ?>
						<?php foreach ($attribute_group['attribute'] as $attribute) { ?>
							<?php if ($attribute['text'] != '') { ?>	  
								<li class="dotted-line" itemprop="additionalProperty" itemscope itemtype="http://schema.org/PropertyValue"><div class="dotted-line_left"><span class="dotted-line_title" itemprop="name"><?php echo $attribute['name']; ?>:</span><div class="dotted-line_line"></div></div><div class="dotted-line_right" itemprop="value"><?php echo $attribute['text']; ?></div></li>
							<?php } ?>
						<?php } ?>
				<?php } ?>
			<?php } ?>
            </ul>
			<?php if ($zakaz_price_null || $price_number > 0) { ?>
		    <div class="well well-sm product-info product_informationss">
			<?php if ($share_status) { ?>
				<script type="text/javascript" src="//yastatic.net/share2/share.js" charset="utf-8"></script>
				<div class="ya-share2" data-services="vkontakte,facebook,odnoklassniki,moimir,twitter,viber,whatsapp" data-size="s"></div>
			<?php } ?>
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
																<input onchange="update_options_buy(<?php echo $product_id; ?>,<?php echo $option['product_option_id']; ?>,<?php echo $option_value['product_option_value_id']; ?>);" type="radio" name="option_<?php echo $product_id; ?>" value="<?php echo $option_value['product_option_value_id']; ?>" id="optb_<?php echo $product_id; ?>_<?php echo $option_value['product_option_value_id']; ?>" />
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
														<a onclick="get_revpopup_cart_option(<?php echo $option['product_option_id']; ?>,<?php echo $option_value['product_option_value_id']; ?>,get_revpopup_cart_pr_option_quantity('<?php echo $option_value['product_option_value_id']; ?>'),<?php echo $product_id; ?>);return false;"><i class="fa fa-border fa-shopping-basket"><span class="prlistb hidden-xs"><?php echo $button_cart; ?></span></i></a>
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
								input_val = $('.pro_'+product_option_value_id+' .plus-minus');
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
								input_val = $('.pro_'+product_option_value_id+' .plus-minus').val();
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
						  <select onchange="update_prices_product(<?php echo $product_id; ?>,<?php echo $minimum; ?>);" name="option[<?php echo $option['product_option_id']; ?>]" id="input-option<?php echo $option['product_option_id']; ?>" class="form-control">
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
								<input onchange="update_prices_product(<?php echo $product_id; ?>,<?php echo $minimum; ?>);" type="radio" name="option[<?php echo $option['product_option_id']; ?>]" value="<?php echo $option_value['product_option_value_id']; ?>" id="<?php echo $option['product_option_id']; ?>_<?php echo $option_value['product_option_value_id']; ?>" />
								<label <?php if (strstr($option['name'], 'Цвет')) { ?>data-toggle="tooltip" title="<?php echo $option_value['name']; ?>"<?php } ?> class="btn btn-default label-in-img" for="<?php echo $option['product_option_id']; ?>_<?php echo $option_value['product_option_value_id']; ?>">
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
							  <input onchange="update_prices_product(<?php echo $product_id; ?>,<?php echo $minimum; ?>);" type="checkbox" name="option[<?php echo $option['product_option_id']; ?>][]" value="<?php echo $option_value['product_option_value_id']; ?>" id="<?php echo $option['product_option_id']; ?>_<?php echo $option_value['product_option_value_id']; ?>" />
								<label <?php if (strstr($option['name'], 'Цвет')) { ?>data-toggle="tooltip" title="<?php echo $option_value['name']; ?>"<?php } ?> class="btn btn-default label-in-img" for="<?php echo $option['product_option_id']; ?>_<?php echo $option_value['product_option_value_id']; ?>">
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
									<input onchange="update_prices_product(<?php echo $product_id; ?>,<?php echo $minimum; ?>);" type="radio" name="option[<?php echo $option['product_option_id']; ?>]" value="<?php echo $option_value['product_option_value_id']; ?>" id="<?php echo $option['product_option_id']; ?>_<?php echo $option_value['product_option_value_id']; ?>" />
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
				<?php if ($price_number > 0) { ?>
				  <div class="list-unstyled" itemprop="offers" itemscope itemtype="http://schema.org/Offer">
					<span class="prq_title hidden-xs"><?php echo $text_product_all_stoimost; ?></span>
					<?php if (!$special) { ?>
					<span class="update_price"><?php echo $price; ?></span>
					<span class="update_special dnone"></span>
					<meta itemprop="price" content="<?php echo $price_number; ?>">
					<?php } else { ?>
					<span class="update_price oldprice"><?php echo $price; ?></span>
					<span class="update_special"><?php echo $special; ?></span>
					<meta itemprop="price" content="<?php echo $special_number; ?>">
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
					<link itemprop="availability" href="http://schema.org/<?php echo ($quantity > 0)?"InStock":"OutOfStock"; ?>" />
					<meta itemprop="priceCurrency" content="<?php echo $currency_code; ?>">
				  </div>
				<?php } else { ?>
				<div class="list-unstyled"><?php echo $text_catalog_price_na_zakaz; ?></div>
				<?php } ?>
				<?php } ?>
				<div class="nalich">
					<?php if ($bonusbals_status) { ?>
						<?php if ($reward) { ?>
							<div class="reward"><span data-toggle="tooltip" data-placement="top" title="<?php echo $text_product_bonus_tooltip; ?>">+ <?php echo $reward; ?> <?php echo $text_product_bonusov; ?></span></div>
						<?php } ?>
					<?php } ?>	
					<?php if ($sklad_status) { ?>
						<?php if ($quantity > 0) { ?><span class="text-success bg-success"><i class="fa fa-check" aria-hidden="true"></i> <?php echo $stock; ?></span><?php } else { ?><span class="text-danger-inproduct bg-danger"><i class="fa fa-times" aria-hidden="true"></i> <?php echo $stock; ?></span><?php } ?>
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
				<?php if (($price_number > 0 || $zakaz_price_null) && ($zakaz || $quantity > 0)) { ?>
					<div class="pop_left">
						<label class="control-label prq_title hidden-xs"><?php echo $text_product_kolichvo; ?></label>
						<div class="number">
							<div class="frame-change-count">
								<div class="btn-plus">
									<button type="button" onclick="validate_pole(this,<?php echo $product_id; ?>,'+',<?php echo $minimum; ?>,<?php echo $quantity; ?>);">+</button>
								</div>
								<div class="btn-minus">
									<button type="button" onclick="validate_pole(this,<?php echo $product_id; ?>,'-',<?php echo $minimum; ?>,<?php echo $quantity; ?>);">-</button>
								</div>
							</div>
							<input type="text" name="quantity" class="plus-minus" value="<?php echo $minimum; ?>" onchange="validate_pole(this);" onkeyup="validate_pole(this,<?php echo $product_id; ?>,'=',<?php echo $minimum; ?>,<?php echo $quantity; ?>);">
						</div>
						<button type="button" id="button-cart" onclick="get_revpopup_cart(<?php echo $product_id; ?>,'product',get_revpopup_cart_quantity('<?php echo $product_id; ?>')); yaCounter23924353.reachGoal('basket_card');" data-loading-text="<?php echo $text_loading; ?>" class="btn btn-primary btn-lg"><i class="fa fa-shopping-basket"></i><?php echo $button_cart; ?></button>
					</div>
				<?php } else { ?>
						<input type="hidden" name="quantity" class="plus-minus" value="<?php echo $minimum; ?>">
				<?php } ?>
				<?php if ($rev_srav_prod || $rev_wish_prod || $popup_purchase) { ?>
					<div class="pop_right <?php if ($columns_dd) { echo 'columns_dd'; }?>">
					<?php if ($popup_purchase && ($price_number > 0 || $zakaz_price_null) && ($zakaz || $quantity > 0)) { ?>
						<a class="pop_ico" onclick="get_revpopup_purchase('<?php echo $product_id; ?>');"><i class='fa fa-border fa-gavel'></i><span class="hidden-xs hidden-md"><?php echo $text_catalog_revpopup_purchase; ?></span></a>
					<?php } ?>
					<?php if ($rev_wish_prod) { ?>
						<a class="<?php echo $wishlist_class ?> wishlist" data-toggle="tooltip" onclick="wishlist.add('<?php echo $product_id; ?>');" title="<?php echo $button_wishlist; ?>"><i class="fa fa-border fa-heart"></i></a>
					<?php } ?>
					<?php if ($rev_srav_prod) { ?>
						<a class="<?php echo $compare_class ?> compare" data-toggle="tooltip" onclick="compare.add('<?php echo $product_id; ?>', '<?php echo $brand; ?>');" title="<?php echo $button_compare; ?>"><i class="fa fa-border fa-bar-chart-o"></i></a>
					<?php } ?>
					</div>
				<?php } ?>
				<?php if ($text_blocks) { ?>
					<div class="preimushestva">
						<?php if ($text_block_zagolovok) { ?>
							<h4 style="margin-bottom: 0; margin-top: 20px;"><?php echo $text_block_zagolovok; ?></h4>
						<?php } ?>
						<?php foreach ($text_blocks as $block) { ?>
							<div class="home_block <?php echo $text_block_cols; ?>">
								<?php if ($block['link']) { ?>
									<a href="<?php echo $block['link']; ?>" class="popup_html_content">
								<?php } ?>
									<div class="image <?php echo $block['style']; ?>"><?php echo $block['image']; ?></div>
									<?php if ($block['title'] || $block['description']) { ?>
										<div class="text">
											<?php if ($block['title']) { ?>
												<span class="title"><?php echo $block['title']; ?></span>
											<?php } ?>
											<?php if ($block['description']) { ?>
												<p><?php echo $block['description']; ?></p>
											<?php } ?>
										</div>
									<?php } ?>
								<?php if ($block['link']) { ?>
								</a>
								<?php } ?>
							</div>
						<?php } ?>
					</div>
				<?php } ?>
            </div>
			 <?php } ?>
			</div>
		<?php } ?>
        </div>
		<div style="height: 20px; width: 100%; clear: both;"></div>
		<div class="col-sm-12 mb20">
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
				<?php if ($review_status) { ?>
				<li><a href="#tab-review" data-toggle="tab"><?php echo $tab_review; ?></a></li>
				<?php } ?>
				<?php foreach($tab_info as $info){ ?>
				<li><a href="#tab-extratab<?php echo $info['tab_id']; ?>" data-toggle="tab"><?php echo $info['title']; ?></a></li>
				<?php } ?>
				<?php foreach($product_tabs as $key => $tab){ ?>
				<li><a href="#tab-<?php echo $product_id ?>-<?php echo $tab['product_tab_id']; ?>" data-toggle="tab"><?php echo $tab['title']; ?></a></li>
				<?php } ?>
				<?php if ($blogs) { ?>
				<li><a href="#tab-blogs" data-toggle="tab"><?php echo $text_relblogs; ?></a></li>
				<?php } ?>
			</ul>		  
			<div class="tab-content">
				<div class="tab-pane active" id="tab-description" itemprop="description"><?php echo $description; ?></div>
				<?php foreach($tab_info as $info){ ?>
				<div class="tab-pane" id="tab-extratab<?php echo $info['tab_id']; ?>"><?php echo $info['description']; ?></div>
				<?php } ?>
				<?php foreach($product_tabs as $key => $tab){ ?>
				<div class="tab-pane" id="tab-<?php echo $product_id ?>-<?php echo $tab['product_tab_id']; ?>"><?php echo $tab['description']; ?></div>
				<?php } ?>

				<?php if (!$atributs) { ?>
				<?php if ($attribute_groups) { ?>
				<div class="tab-pane" id="tab-specification">         
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
				<?php if ($review_status) { ?>
				<div class="tab-pane" id="tab-review">
				<div id="review"></div>
					<?php if ($review_guest) { ?>
					<div class="form-group required mb0 mt12">
							<div class="well well-sm otz">
								<div class="text-right">
									<a class="btn btn-primary" id="open-review-box"><i class="fa fa-comment-o" aria-hidden="true"></i><?php echo $text_product_wr_review; ?></a>
								</div>						
								<div class="row" id="post-review-box" style="display:none;">
									<div class="col-md-12">
										<form class="form-review form-horizontal">
											<div class="form-group required">
												<label class="col-sm-2 control-label" for="input-name"><?php echo $entry_name; ?></label>
												<div class="col-sm-10">
													<input type="text" name="name" value="" id="input-name" class="form-control" />
												</div>
											</div>
											<div class="form-group required">
												<label class="col-sm-2 control-label" for="input-review"><?php echo $entry_review; ?></label>
												<div class="col-sm-10">
													<textarea name="text" rows="5" id="input-review" class="form-control"></textarea>
												</div>
											</div>
											<div class="form-group required">
												<label class="col-sm-2 control-label"><?php echo $entry_rating; ?></label>
												<div class="col-sm-10">
													<div class="prod-rating">
														<input id="rat1" type="radio" name="rating" value="1" /><label class="rat-star" for="rat1"><i class="fa fa-star"></i></label>
														<input id="rat2" type="radio" name="rating" value="2" /><label class="rat-star" for="rat2"><i class="fa fa-star"></i></label>
														<input id="rat3" type="radio" name="rating" value="3" /><label class="rat-star" for="rat3"><i class="fa fa-star"></i></label>
														<input id="rat4" type="radio" name="rating" value="4" /><label class="rat-star" for="rat4"><i class="fa fa-star"></i></label>
														<input id="rat5" type="radio" name="rating" value="5" /><label class="rat-star" for="rat5"><i class="fa fa-star"></i></label>
													</div>
													<script type="text/javascript"><!--
														$('.rat-star').hover(function () {
															$(this).prevAll('.rat-star').addClass('active');
															$(this).addClass('active');
														},function () {
															$(this).prevAll('.rat-star').removeClass('active');
															$(this).removeClass('active');
														});
														
														$('.rat-star').click(function(){
															$('.rat-star').each(function(){
																$(this).removeClass('checked');
																$(this).prevAll('.rat-star').removeClass('checked');
															});
															
															$(this).addClass('checked');
															$(this).prevAll('.rat-star').addClass('checked');
														});
														
													//--></script>
												</div>
											</div>
											<?php echo $captcha; ?>
											<div class="pull-right text-right">
												<a class="btn btn-default" href="#" id="close-review-box" style="display:none; margin-right: 10px;"><?php echo $text_product_otmena; ?></a>
												<button type="button" id="button-review" data-loading-text="<?php echo $text_loading; ?>" class="btn btn-danger"><?php echo $button_continue; ?></button>
											</div>					
										</form>
									</div>
								</div>
							</div>
							<script type="text/javascript"><!--
							$('#open-review-box').click(function(e) {
							$('#post-review-box').slideDown(400, function() {
							$('#new-review').trigger('autosize.resize');
							$('#new-review').focus();
							});
							$('#open-review-box').fadeOut(100);
							$('#close-review-box').show();
							});

							$('#close-review-box').click(function(e) {
							e.preventDefault();
							$('#post-review-box').slideUp(300, function() {
							$('#new-review').focus();
							$('#open-review-box').fadeIn(200);
							});
							$('#close-review-box').hide();
							});
							//--></script>
					</div>              
					<?php } else { ?>
					<?php echo $text_login; ?>
					<?php } ?>
				</div>
				<?php } ?>			
				<?php if ($blogs) { ?>
				<div class="tab-pane" id="tab-blogs">
					<ul>
					<?php foreach ($blogs as $blog) { ?>
						<li><a href="<?php echo $blog['href']; ?>"><?php echo $blog['title']; ?></a></li>
					<?php } ?>
					</ul>
				</div>
				<?php } ?>
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
						<div class="tab-specification rev_slider">
							<h3><?php echo $tab_attribute; ?></h3>
							<?php foreach ($attribute_groups as $attribute_group) { ?>
								<table class="table attrbutes mb0">
									<?php if ($atributs_group_name) { ?>
										<thead>
											<tr>
												<td colspan="2"><?php echo $attribute_group['name']; ?></td>
											</tr>
										</thead>
									<?php } ?>
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
						</div>
					<?php } ?>
				<?php } ?>
				<?php if ($review_status) { ?>
					<div class="tab-review rev_slider">
						<h3><?php echo $tab_review; ?></h3>
						<div id="review"></div>
						<?php if ($review_guest) { ?>
							<div class="form-group required mb0 mt12">
								<div class="well well-sm otz">
									<div class="text-right">
										<a class="btn btn-primary" id="open-review-box"><i class="fa fa-comment-o" aria-hidden="true"></i><?php echo $text_product_wr_review; ?></a>
									</div>						
									<div class="row" id="post-review-box" style="display:none;">
										<div class="col-md-12">
											<form class="form-review form-horizontal">
												<div class="form-group required">
													<label class="col-sm-2 control-label" for="input-name"><?php echo $entry_name; ?></label>
													<div class="col-sm-10">
														<input type="text" name="name" value="" id="input-name" class="form-control" />
													</div>
												</div>
												<div class="form-group required">
													<label class="col-sm-2 control-label" for="input-review"><?php echo $entry_review; ?></label>
													<div class="col-sm-10">
														<textarea name="text" rows="5" id="input-review" class="form-control"></textarea>
													</div>
												</div>
												<div class="form-group required">
													<label class="col-sm-2 control-label"><?php echo $entry_rating; ?></label>
													<div class="col-sm-10">
														<div class="prod-rating">
															<input id="rat1" type="radio" name="rating" value="1" /><label class="rat-star" for="rat1"><i class="fa fa-star"></i></label>
															<input id="rat2" type="radio" name="rating" value="2" /><label class="rat-star" for="rat2"><i class="fa fa-star"></i></label>
															<input id="rat3" type="radio" name="rating" value="3" /><label class="rat-star" for="rat3"><i class="fa fa-star"></i></label>
															<input id="rat4" type="radio" name="rating" value="4" /><label class="rat-star" for="rat4"><i class="fa fa-star"></i></label>
															<input id="rat5" type="radio" name="rating" value="5" /><label class="rat-star" for="rat5"><i class="fa fa-star"></i></label>
														</div>
														<script type="text/javascript"><!--
															$('.rat-star').hover(function () {
																$(this).prevAll('.rat-star').addClass('active');
																$(this).addClass('active');
															},function () {
																$(this).prevAll('.rat-star').removeClass('active');
																$(this).removeClass('active');
															});
															
															$('.rat-star').click(function(){
																$('.rat-star').each(function(){
																	$(this).removeClass('checked');
																	$(this).prevAll('.rat-star').removeClass('checked');
																});
																
																$(this).addClass('checked');
																$(this).prevAll('.rat-star').addClass('checked');
															});
															
														//--></script>
													</div>
												</div>
												<?php echo $captcha; ?>
												<div class="pull-right text-right">
													<a class="btn btn-default" href="#" id="close-review-box" style="display:none; margin-right: 10px;"><?php echo $text_product_otmena; ?></a>
													<button type="button" id="button-review" data-loading-text="<?php echo $text_loading; ?>" class="btn btn-danger"><?php echo $button_continue; ?></button>
												</div>					
											</form>
										</div>
									</div>
								</div>
								<script type="text/javascript"><!--
								$('#open-review-box').click(function(e) {
								$('#post-review-box').slideDown(400, function() {
								$('#new-review').trigger('autosize.resize');
								$('#new-review').focus();
								});
								$('#open-review-box').fadeOut(100);
								$('#close-review-box').show();
								});

								$('#close-review-box').click(function(e) {
								e.preventDefault();
								$('#post-review-box').slideUp(300, function() {
								$('#new-review').focus();
								$('#open-review-box').fadeIn(200);
								});
								$('#close-review-box').hide();
								});
								//--></script>
							</div>
						<?php } else { ?>
							<?php echo $text_login; ?>
						<?php } ?>
					</div>
				<?php } ?>
				<?php if ($tab_info) { ?>
					<div class="rev_slider">
						<?php foreach($tab_info as $info){ ?>
							<h3><?php echo $info['title']; ?></h3>
							<?php echo $info['description']; ?>
						<?php } ?>
					</div>
				<?php } ?>
				<?php if ($product_tabs) { ?>
					<div class="rev_slider">
						<?php foreach($product_tabs as $key => $tab){ ?>
							<h3><?php echo $tab['title']; ?></h3>
							<?php echo $tab['description']; ?>
						<?php } ?>
					</div>
				<?php } ?>
				<?php if ($blogs) { ?>
					<div class="rev_slider">
						<h3><?php echo $text_relblogs; ?></h3>
						<ul>
							<?php foreach ($blogs as $blog) { ?>
								<li><a href="<?php echo $blog['href']; ?>"><?php echo $blog['title']; ?></a></li>
							<?php } ?>
						</ul>
					</div>
				<?php } ?>
			</div>
		<?php } ?>
		  

		</div>
      </div>  
      <?php if ($products && !$recpr_rightc) { ?>
	  <div id="product_products" class="rev_slider">
      <h3><?php echo $text_related; ?></h3>
      <div class="row">
	  <div class="product_related">
        <?php foreach ($products as $product) { ?>
			<div class="product-layout col-lg-12 item">
			  <div class="product-thumb product_<?php echo $product['product_id']; ?>">
				<div class="image">
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
										<select class="form-control" onchange="get_product_option_id_product_products('<?php echo $product['product_id']; ?>')" name="" id="product_products_soption_<?php echo $product['product_id']; ?>">
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
							$('#product_products select.form-control option:nth-child(1)').attr('selected', 'selected');
							$( document ).ready(function() {
								get_product_option_id_product_products (<?php echo $product['product_id']; ?>);
							});
							function get_product_option_id_product_products (product_id) {
								var sel_option_id = document.getElementById('product_products_soption_'+product_id);
								var option_id = sel_option_id.options[sel_option_id.selectedIndex].getAttribute('product_option_id');
								sel_option_id.setAttribute('name', 'option['+option_id+']');
								update_prices_product_product_products(product_id,1);
							}
							--></script>
						<?php } else if ($product['options']) { ?>
							<div class="well well-sm product-info">
							<div id="option_<?php echo $product['product_id']; ?>" class="options">
							<?php foreach ($product['options'] as $option) { ?>
								<?php if ($option['type'] == 'select') { ?>
								<div class="form-group<?php echo ($option['required'] ? ' required' : ''); ?>">
								  <label class="control-label" for="product_products_input-option<?php echo $option['product_option_id']; ?>"><?php echo $option['name']; ?>:</label>
								  <select onchange="update_prices_product_product_products(<?php echo $product['product_id']; ?>,<?php echo $product['minimum']; ?>);" name="option[<?php echo $option['product_option_id']; ?>]" id="product_products_input-option<?php echo $option['product_option_id']; ?>" class="form-control">
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
										<input onchange="update_prices_product_product_products(<?php echo $product['product_id']; ?>,<?php echo $product['minimum']; ?>);" type="radio" name="option[<?php echo $option['product_option_id']; ?>]" value="<?php echo $option_value['product_option_value_id']; ?>" id="product_products_<?php echo $option['product_option_id']; ?>_<?php echo $option_value['product_option_value_id']; ?>" />
										<label class="btn btn-default" for="product_products_<?php echo $option['product_option_id']; ?>_<?php echo $option_value['product_option_value_id']; ?>">
											<span><?php echo $option_value['name']; ?></span>
											<?php if ($option_value['price']) { ?>
												<span class="option_price"><?php echo $option_value['price_prefix']; ?><?php echo $option_value['price']; ?></span>
											<?php } ?>
										<i class="fa fa-check" aria-hidden="true"></i>	
										</label>
									</div>
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
									  <input onchange="update_prices_product_product_products(<?php echo $product['product_id']; ?>,<?php echo $product['minimum']; ?>);" type="checkbox" name="option[<?php echo $option['product_option_id']; ?>][]" value="<?php echo $option_value['product_option_value_id']; ?>" id="product_products_<?php echo $option['product_option_id']; ?>_<?php echo $option_value['product_option_value_id']; ?>" />
										<label class="btn btn-default" for="product_products_<?php echo $option['product_option_id']; ?>_<?php echo $option_value['product_option_value_id']; ?>">
											<span><?php echo $option_value['name']; ?></span>
											<?php if ($option_value['price']) { ?>
												<span class="option_price"><?php echo $option_value['price_prefix']; ?><?php echo $option_value['price']; ?></span>
											<?php } ?>
										<i class="fa fa-check" aria-hidden="true"></i>
										</label>
									</div>
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
											<input onchange="update_prices_product_product_products(<?php echo $product['product_id']; ?>,<?php echo $product['minimum']; ?>);" type="radio" name="option[<?php echo $option['product_option_id']; ?>]" value="<?php echo $option_value['product_option_value_id']; ?>" id="product_products_<?php echo $option['product_option_id']; ?>_<?php echo $option_value['product_option_value_id']; ?>" />
											<label <?php if (strstr($option['name'], 'Цвет')) { ?>data-toggle="tooltip" title="<?php echo $option_value['name']; ?>"<?php } ?> class="btn btn-default label-in-img" for="product_products_<?php echo $option['product_option_id']; ?>_<?php echo $option_value['product_option_value_id']; ?>">
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
								  <label class="control-label" for="product_products_input-option<?php echo $option['product_option_id']; ?>"><?php echo $option['name']; ?>:</label>
								  <input type="text" name="option[<?php echo $option['product_option_id']; ?>]" value="<?php echo $option['value']; ?>" placeholder="<?php echo $option['name']; ?>" id="product_products_input-option<?php echo $option['product_option_id']; ?>" class="form-control" />
								</div>
								<?php } ?>
								<?php if ($option['type'] == 'textarea') { ?>
								<div class="form-group<?php echo ($option['required'] ? ' required' : ''); ?>">
								  <label class="control-label" for="product_products_input-option<?php echo $option['product_option_id']; ?>"><?php echo $option['name']; ?>:</label>
								  <textarea name="option[<?php echo $option['product_option_id']; ?>]" rows="5" placeholder="<?php echo $option['name']; ?>" id="product_products_input-option<?php echo $option['product_option_id']; ?>" class="form-control"><?php echo $option['value']; ?></textarea>
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
								  <label class="control-label" for="product_products_input-option<?php echo $option['product_option_id']; ?>"><?php echo $option['name']; ?>:</label>
								  <div class="input-group date">
									<input type="text" name="option[<?php echo $option['product_option_id']; ?>]" value="<?php echo $option['value']; ?>" data-date-format="YYYY-MM-DD" id="product_products_input-option<?php echo $option['product_option_id']; ?>" class="form-control" />
									<span class="input-group-btn">
									<button class="btn btn-default" type="button"><i class="fa fa-calendar"></i></button>
									</span></div>
								</div>
								<?php } ?>
								<?php if ($option['type'] == 'datetime') { ?>
								<div class="form-group<?php echo ($option['required'] ? ' required' : ''); ?>">
								  <label class="control-label" for="product_products_input-option<?php echo $option['product_option_id']; ?>"><?php echo $option['name']; ?>:</label>
								  <div class="input-group datetime">
									<input type="text" name="option[<?php echo $option['product_option_id']; ?>]" value="<?php echo $option['value']; ?>" data-date-format="YYYY-MM-DD HH:mm" id="product_products_input-option<?php echo $option['product_option_id']; ?>" class="form-control" />
									<span class="input-group-btn">
									<button type="button" class="btn btn-default"><i class="fa fa-calendar"></i></button>
									</span></div>
								</div>
								<?php } ?>
								<?php if ($option['type'] == 'time') { ?>
								<div class="form-group<?php echo ($option['required'] ? ' required' : ''); ?>">
								  <label class="control-label" for="product_products_input-option<?php echo $option['product_option_id']; ?>"><?php echo $option['name']; ?>:</label>
								  <div class="input-group time">
									<input type="text" name="option[<?php echo $option['product_option_id']; ?>]" value="<?php echo $option['value']; ?>" data-date-format="HH:mm" id="product_products_input-option<?php echo $option['product_option_id']; ?>" class="form-control" />
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
												<button type="button" onclick="validate_pole_product_products(this,<?php echo $product['product_id']; ?>,'+',<?php echo $product['minimum']; ?>,<?php echo $product['quantity']; ?>);">+</button>
											</div>
											<div class="btn-minus">
												<button type="button" onclick="validate_pole_product_products(this,<?php echo $product['product_id']; ?>,'-',<?php echo $product['minimum']; ?>,<?php echo $product['quantity']; ?>);">-</button>
											</div>
										</div>
										<input type="text" name="quantity" class="plus-minus" value='<?php echo $product['minimum']; ?>' onchange="validate_pole_product_products(this);" onkeyup="validate_pole_product_products(this,<?php echo $product['product_id']; ?>,'=',<?php echo $product['minimum']; ?>,<?php echo $product['quantity']; ?>);">
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
									<a onclick="get_revpopup_cart(<?php echo $product['product_id']; ?>,'module_in_product',get_revpopup_cart_quantity_product_products('<?php echo $product['product_id']; ?>'),'product_products');" <?php if ($button_cart_class != 'prlistb active') { ?>data-toggle="tooltip" title="<?php echo $button_cart; ?>"<?php } ?>><i class="fa fa-border fa-shopping-basket"><span class="<?php echo $button_cart_class; ?>"><?php echo $button_cart; ?></span></i></a>
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
		$('.product_related').owlCarousel({
			responsiveBaseWidth: '.product_related',
			<?php if ($chislo_ryad) { ?>
			itemsCustom: [[0, 1], [375, 2], [750, 3], [970, 4], [1170, 4]],
			<?php } else { ?>
			itemsCustom: [[0, 1], [375, 2], [750, 3], [970, 4], [1170, 5]],
			<?php } ?>
			mouseDrag: true,
			navigation: true,
			navigationText: ['<i class="fa fa-chevron-left"></i>', '<i class="fa fa-chevron-right"></i>'],
			pagination: true
		});
		
		<?php foreach ($products as $product) { if ($product['minimum'] > 1 && $recalc_price) { ?>
			update_quantity_product_products(<?php echo $product['product_id']; ?>, <?php echo $product['minimum']; ?>);
		<?php } } ?>
		function get_revpopup_cart_quantity_product_products(product_id) {
			input_val = $('#product_products .product_'+product_id+' .plus-minus').val();
			quantity  = parseInt(input_val);
			return quantity;
		}
		function validate_pole_product_products(val, product_id, znak, minimumvalue, maximumvalue) {
			val.value = val.value.replace(/[^\d,]/g, '');
			if (val.value == '') val.value = minimumvalue;
			maximumvalue = Number($('#product_products .pr_quantity_'+product_id).text());
			if (maximumvalue == 0) maximumvalue = 9999;
			input_val = $('#product_products .product_'+product_id+' .plus-minus');	
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
			update_quantity_product_products(product_id, input_val.val());
		}
		function update_quantity_product_products(product_id, quantity) {
			<?php if ($recalc_price) { ?>
				quantity = quantity;
			<?php } else { ?>
				quantity = 1;
			<?php } ?>
			
			data = $('#product_products .product_'+product_id+' .options input[type=\'text\'], #product_products .product_'+product_id+' .options input[type=\'hidden\'], #product_products .product_'+product_id+' .options input[type=\'radio\']:checked, #product_products .product_'+product_id+' .options input[type=\'checkbox\']:checked, #product_products .product_'+product_id+' .options select');
			$.ajax({
			  url: 'index.php?route=product/product/update_prices',
			  type: 'post',
			  dataType: 'json',
			  data: data.serialize() + '&product_id=' + product_id + '&quantity=' + quantity,
			  success: function(json) {
				<?php if ($recalc_price) { ?>
				
					<?php if ($description_options['zamena_description'] && $description_options['weight']) { ?>
					var start_weight = parseFloat($('#product_products .pr_weight_'+product_id).attr('data-weight'));
					var weight = json['weight'];
					$({val:start_weight}).animate({val:weight}, {
						duration: 500,
						easing: 'swing',
						step: function(val) {
							$('#product_products .pr_weight_'+product_id).html(weight_format(val, product_id));
						}
					});
					$('#product_products .pr_weight_'+product_id).attr('data-weight', json['weight']);
					<?php } ?>

					<?php if ($stikers_status) { ?>
						var start_price = parseFloat($('#product_products .special_no_format'+product_id).html().replace(/\s*/g,''));
						var price = json['price_n'];
						$({val:start_price}).animate({val:price}, {
							duration: 500,
							easing: 'swing',
							step: function(val) {
								$('#product_products .special_no_format'+product_id).html(price_format(val));
							}
						});
					<?php } ?>
					
					var start_special = parseFloat($('#product_products .price_no_format'+product_id).html().replace(/\s*/g,''));
					var special = json['special_n'];
					$({val:start_special}).animate({val:special}, {
						duration: 500,
						easing: 'swing',
						step: function(val) {
							$('#product_products .price_no_format'+product_id).html(price_format(val));
						}
					});
				<?php } ?>
			  }
			});
		}
		function update_prices_product_product_products(product_id, minimumvalue) {
			input_val = $('#product_products .product_'+product_id+' .plus-minus').val();
			if (input_val > minimumvalue) {
				input_val = minimumvalue;
				$('#product_products .product_'+product_id+' .plus-minus').val(minimumvalue);
			}
			<?php if ($recalc_price) { ?>
			quantity = parseInt(input_val);
			<?php } else { ?>
			quantity = 1;
			<?php } ?>
			data = $('#product_products .product_'+product_id+' .options input[type=\'text\'], #product_products .product_'+product_id+' .options input[type=\'hidden\'], #product_products .product_'+product_id+' .options input[type=\'radio\']:checked, #product_products .product_'+product_id+' .options input[type=\'checkbox\']:checked, #product_products .product_'+product_id+' .options select');
			$.ajax({
			  type: 'post',
			  url:  'index.php?route=product/product/update_prices',
			  data: data.serialize() + '&product_id=' + product_id + '&quantity=' + quantity,
			  dataType: 'json',
			  success: function(json) {
			  
				<?php if ($img_slider) { ?>
				$('#product_products .product_'+product_id+' .image .owl-item:first-child img').attr('src', json['opt_image']);
				<?php } else { ?>
				$('#product_products .product_'+product_id+' .image img').attr('src', json['opt_image']);
				<?php } ?>
				
				<?php if ($description_options['zamena_description'] && $description_options['model']) { ?>
				$('#product_products .product_'+product_id+' .pr_model_'+product_id).html(json['opt_model']);
				<?php } ?>
			  
				var start_quantity = parseFloat($('#product_products .pr_quantity_'+product_id).html().replace(/\s*/g,''));
				var end_quantity = json['option_quantity'];
				$({val:start_quantity}).animate({val:end_quantity}, {
					duration: 500,
					easing: 'swing',
					step: function(val) {
						$('#product_products .pr_quantity_'+product_id).html(number_format(val, product_id));
					}
				});
				
				<?php if ($description_options['zamena_description'] && $description_options['weight']) { ?>
				var start_weight = parseFloat($('#product_products .pr_weight_'+product_id).attr('data-weight'));
				var weight = json['weight'];
				$({val:start_weight}).animate({val:weight}, {
					duration: 500,
					easing: 'swing',
					step: function(val) {
						$('#product_products .pr_weight_'+product_id).html(weight_format(val, product_id));
					}
				});
				$('#product_products .pr_weight_'+product_id).attr('data-weight', json['weight']);
				<?php } ?>
			  
				<?php if ($stikers_status) { ?>
				var start_price = parseFloat($('#product_products .special_no_format'+product_id).html().replace(/\s*/g,''));
				var price = json['price_n'];
				$({val:start_price}).animate({val:price}, {
					duration: 500,
					easing: 'swing',
					step: function(val) {
						$('#product_products .special_no_format'+product_id).html(price_format(val));
					}
				});
				<?php } ?>
				
				var start_special = parseFloat($('#product_products .price_no_format'+product_id).html().replace(/\s*/g,''));
				var special = json['special_n'];
				$({val:start_special}).animate({val:special}, {
					duration: 500,
					easing: 'swing',
					step: function(val) {
						$('#product_products .price_no_format'+product_id).html(price_format(val));
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
		max_height_div('#product_products .product-thumb h4');
		$('#product_products .product-thumb .description_options').css('min-height', 'initial');
		max_height_div('#product_products .product-thumb .description');
		max_height_div('#product_products .product-thumb .description_options');
		max_height_div('#product_products .product-thumb .price');
		max_height_div('#product_products .product-thumb .number');	
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
      <?php } ?>
	<?php if ($viewed_products) { ?>
		<div id="product_products2" class="rev_slider">
			<h3><?php echo $viewed_products_zagolovok ?></h3>
			<div class="row">
				<div class="viewed_products">
					<?php foreach ($viewed_products as $product) { ?>
						<div class="product-layout col-lg-12 item">
						  <div class="product-thumb product_<?php echo $product['product_id']; ?>">
							<div class="image">
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
													<select class="form-control" onchange="get_product_option_id_product_products2('<?php echo $product['product_id']; ?>')" name="" id="product_products2_soption_<?php echo $product['product_id']; ?>">
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
										$('#product_products2 select.form-control option:nth-child(1)').attr('selected', 'selected');
										$( document ).ready(function() {
											get_product_option_id_product_products2 (<?php echo $product['product_id']; ?>);
										});
										function get_product_option_id_product_products2 (product_id) {
											var sel_option_id = document.getElementById('product_products2_soption_'+product_id);
											var option_id = sel_option_id.options[sel_option_id.selectedIndex].getAttribute('product_option_id');
											sel_option_id.setAttribute('name', 'option['+option_id+']');
											update_prices_product_product_products2(product_id,1);
										}
										--></script>
									<?php } else if ($product['options']) { ?>
										<div class="well well-sm product-info">
										<div id="option_<?php echo $product['product_id']; ?>" class="options">
										<?php foreach ($product['options'] as $option) { ?>
											<?php if ($option['type'] == 'select') { ?>
											<div class="form-group<?php echo ($option['required'] ? ' required' : ''); ?>">
											  <label class="control-label" for="product_products2_input-option<?php echo $option['product_option_id']; ?>"><?php echo $option['name']; ?>:</label>
											  <select onchange="update_prices_product_product_products2(<?php echo $product['product_id']; ?>,<?php echo $product['minimum']; ?>);" name="option[<?php echo $option['product_option_id']; ?>]" id="product_products2_input-option<?php echo $option['product_option_id']; ?>" class="form-control">
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
													<input onchange="update_prices_product_product_products2(<?php echo $product['product_id']; ?>,<?php echo $product['minimum']; ?>);" type="radio" name="option[<?php echo $option['product_option_id']; ?>]" value="<?php echo $option_value['product_option_value_id']; ?>" id="product_products2_<?php echo $option['product_option_id']; ?>_<?php echo $option_value['product_option_value_id']; ?>" />
													<label class="btn btn-default" for="product_products2_<?php echo $option['product_option_id']; ?>_<?php echo $option_value['product_option_value_id']; ?>">
														<span><?php echo $option_value['name']; ?></span>
														<?php if ($option_value['price']) { ?>
															<span class="option_price"><?php echo $option_value['price_prefix']; ?><?php echo $option_value['price']; ?></span>
														<?php } ?>
													<i class="fa fa-check" aria-hidden="true"></i>	
													</label>
												</div>
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
												  <input onchange="update_prices_product_product_products2(<?php echo $product['product_id']; ?>,<?php echo $product['minimum']; ?>);" type="checkbox" name="option[<?php echo $option['product_option_id']; ?>][]" value="<?php echo $option_value['product_option_value_id']; ?>" id="product_products2_<?php echo $option['product_option_id']; ?>_<?php echo $option_value['product_option_value_id']; ?>" />
													<label class="btn btn-default" for="product_products2_<?php echo $option['product_option_id']; ?>_<?php echo $option_value['product_option_value_id']; ?>">
														<span><?php echo $option_value['name']; ?></span>
														<?php if ($option_value['price']) { ?>
															<span class="option_price"><?php echo $option_value['price_prefix']; ?><?php echo $option_value['price']; ?></span>
														<?php } ?>
													<i class="fa fa-check" aria-hidden="true"></i>
													</label>
												</div>
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
														<input onchange="update_prices_product_product_products2(<?php echo $product['product_id']; ?>,<?php echo $product['minimum']; ?>);" type="radio" name="option[<?php echo $option['product_option_id']; ?>]" value="<?php echo $option_value['product_option_value_id']; ?>" id="product_products2_<?php echo $option['product_option_id']; ?>_<?php echo $option_value['product_option_value_id']; ?>" />
														<label <?php if (strstr($option['name'], 'Цвет')) { ?>data-toggle="tooltip" title="<?php echo $option_value['name']; ?>"<?php } ?> class="btn btn-default label-in-img" for="product_products2_<?php echo $option['product_option_id']; ?>_<?php echo $option_value['product_option_value_id']; ?>">
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
											  <label class="control-label" for="product_products2_input-option<?php echo $option['product_option_id']; ?>"><?php echo $option['name']; ?>:</label>
											  <input type="text" name="option[<?php echo $option['product_option_id']; ?>]" value="<?php echo $option['value']; ?>" placeholder="<?php echo $option['name']; ?>" id="product_products2_input-option<?php echo $option['product_option_id']; ?>" class="form-control" />
											</div>
											<?php } ?>
											<?php if ($option['type'] == 'textarea') { ?>
											<div class="form-group<?php echo ($option['required'] ? ' required' : ''); ?>">
											  <label class="control-label" for="product_products2_input-option<?php echo $option['product_option_id']; ?>"><?php echo $option['name']; ?>:</label>
											  <textarea name="option[<?php echo $option['product_option_id']; ?>]" rows="5" placeholder="<?php echo $option['name']; ?>" id="product_products2_input-option<?php echo $option['product_option_id']; ?>" class="form-control"><?php echo $option['value']; ?></textarea>
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
											  <label class="control-label" for="product_products2_input-option<?php echo $option['product_option_id']; ?>"><?php echo $option['name']; ?>:</label>
											  <div class="input-group date">
												<input type="text" name="option[<?php echo $option['product_option_id']; ?>]" value="<?php echo $option['value']; ?>" data-date-format="YYYY-MM-DD" id="product_products2_input-option<?php echo $option['product_option_id']; ?>" class="form-control" />
												<span class="input-group-btn">
												<button class="btn btn-default" type="button"><i class="fa fa-calendar"></i></button>
												</span></div>
											</div>
											<?php } ?>
											<?php if ($option['type'] == 'datetime') { ?>
											<div class="form-group<?php echo ($option['required'] ? ' required' : ''); ?>">
											  <label class="control-label" for="product_products2_input-option<?php echo $option['product_option_id']; ?>"><?php echo $option['name']; ?>:</label>
											  <div class="input-group datetime">
												<input type="text" name="option[<?php echo $option['product_option_id']; ?>]" value="<?php echo $option['value']; ?>" data-date-format="YYYY-MM-DD HH:mm" id="product_products2_input-option<?php echo $option['product_option_id']; ?>" class="form-control" />
												<span class="input-group-btn">
												<button type="button" class="btn btn-default"><i class="fa fa-calendar"></i></button>
												</span></div>
											</div>
											<?php } ?>
											<?php if ($option['type'] == 'time') { ?>
											<div class="form-group<?php echo ($option['required'] ? ' required' : ''); ?>">
											  <label class="control-label" for="product_products2_input-option<?php echo $option['product_option_id']; ?>"><?php echo $option['name']; ?>:</label>
											  <div class="input-group time">
												<input type="text" name="option[<?php echo $option['product_option_id']; ?>]" value="<?php echo $option['value']; ?>" data-date-format="HH:mm" id="product_products2_input-option<?php echo $option['product_option_id']; ?>" class="form-control" />
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
															<button type="button" onclick="validate_pole_product_products2(this,<?php echo $product['product_id']; ?>,'+',<?php echo $product['minimum']; ?>,<?php echo $product['quantity']; ?>);">+</button>
														</div>
														<div class="btn-minus">
															<button type="button" onclick="validate_pole_product_products2(this,<?php echo $product['product_id']; ?>,'-',<?php echo $product['minimum']; ?>,<?php echo $product['quantity']; ?>);">-</button>
														</div>
													</div>
													<input type="text" name="quantity" class="plus-minus" value='<?php echo $product['minimum']; ?>' onchange="validate_pole_product_products2(this);" onkeyup="validate_pole_product_products2(this,<?php echo $product['product_id']; ?>,'=',<?php echo $product['minimum']; ?>,<?php echo $product['quantity']; ?>);">
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
												<a onclick="get_revpopup_cart(<?php echo $product['product_id']; ?>,'module_in_product',get_revpopup_cart_quantity_product_products2('<?php echo $product['product_id']; ?>'),'product_products2');" <?php if ($button_cart_class != 'prlistb active') { ?>data-toggle="tooltip" title="<?php echo $button_cart; ?>"<?php } ?>><i class="fa fa-border fa-shopping-basket"><span class="<?php echo $button_cart_class; ?>"><?php echo $button_cart; ?></span></i></a>
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
			$('.viewed_products').owlCarousel({
				responsiveBaseWidth: '.viewed_products',
				<?php if ($chislo_ryad) { ?>
				itemsCustom: [[0, 1], [375, 2], [750, 3], [970, 4], [1170, 4]],
				<?php } else { ?>
				itemsCustom: [[0, 1], [375, 2], [750, 3], [970, 4], [1170, 5]],
				<?php } ?>
				mouseDrag: true,
				navigation: true,
				navigationText: ['<i class="fa fa-chevron-left"></i>', '<i class="fa fa-chevron-right"></i>'],
				pagination: true
			});
			
			<?php foreach ($viewed_products as $product) { if ($product['minimum'] > 1 && $recalc_price) { ?>
				update_quantity_product_products2(<?php echo $product['product_id']; ?>, <?php echo $product['minimum']; ?>);
			<?php } } ?>
			function get_revpopup_cart_quantity_product_products2(product_id) {
				input_val = $('#product_products2 .product_'+product_id+' .plus-minus').val();
				quantity  = parseInt(input_val);
				return quantity;
			}
			function validate_pole_product_products2(val, product_id, znak, minimumvalue, maximumvalue) {
				val.value = val.value.replace(/[^\d,]/g, '');
				if (val.value == '') val.value = minimumvalue;
				maximumvalue = Number($('#product_products2 .pr_quantity_'+product_id).text());
				if (maximumvalue == 0) maximumvalue = 9999;
				input_val = $('#product_products2 .product_'+product_id+' .plus-minus');	
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
				update_quantity_product_products2(product_id, input_val.val());
			}
			function update_quantity_product_products2(product_id, quantity) {
				<?php if ($recalc_price) { ?>
					quantity = quantity;
				<?php } else { ?>
					quantity = 1;
				<?php } ?>
				
				data = $('#product_products2 .product_'+product_id+' .options input[type=\'text\'], #product_products2 .product_'+product_id+' .options input[type=\'hidden\'], #product_products2 .product_'+product_id+' .options input[type=\'radio\']:checked, #product_products2 .product_'+product_id+' .options input[type=\'checkbox\']:checked, #product_products2 .product_'+product_id+' .options select');
				$.ajax({
				  url: 'index.php?route=product/product/update_prices',
				  type: 'post',
				  dataType: 'json',
				  data: data.serialize() + '&product_id=' + product_id + '&quantity=' + quantity,
				  success: function(json) {
					<?php if ($recalc_price) { ?>
					
						<?php if ($description_options['zamena_description'] && $description_options['weight']) { ?>
						var start_weight = parseFloat($('#product_products2 .pr_weight_'+product_id).attr('data-weight'));
						var weight = json['weight'];
						$({val:start_weight}).animate({val:weight}, {
							duration: 500,
							easing: 'swing',
							step: function(val) {
								$('#product_products2 .pr_weight_'+product_id).html(weight_format(val, product_id));
							}
						});
						$('#product_products2 .pr_weight_'+product_id).attr('data-weight', json['weight']);
						<?php } ?>

						<?php if ($stikers_status) { ?>
							var start_price = parseFloat($('#product_products2 .special_no_format'+product_id).html().replace(/\s*/g,''));
							var price = json['price_n'];
							$({val:start_price}).animate({val:price}, {
								duration: 500,
								easing: 'swing',
								step: function(val) {
									$('#product_products2 .special_no_format'+product_id).html(price_format(val));
								}
							});
						<?php } ?>
						
						var start_special = parseFloat($('#product_products2 .price_no_format'+product_id).html().replace(/\s*/g,''));
						var special = json['special_n'];
						$({val:start_special}).animate({val:special}, {
							duration: 500,
							easing: 'swing',
							step: function(val) {
								$('#product_products2 .price_no_format'+product_id).html(price_format(val));
							}
						});
					<?php } ?>
				  }
				});
			}
			function update_prices_product_product_products2(product_id, minimumvalue) {
				input_val = $('#product_products2 .product_'+product_id+' .plus-minus').val();
				if (input_val > minimumvalue) {
					input_val = minimumvalue;
					$('#product_products2 .product_'+product_id+' .plus-minus').val(minimumvalue);
				}
				<?php if ($recalc_price) { ?>
				quantity = parseInt(input_val);
				<?php } else { ?>
				quantity = 1;
				<?php } ?>
				data = $('#product_products2 .product_'+product_id+' .options input[type=\'text\'], #product_products2 .product_'+product_id+' .options input[type=\'hidden\'], #product_products2 .product_'+product_id+' .options input[type=\'radio\']:checked, #product_products2 .product_'+product_id+' .options input[type=\'checkbox\']:checked, #product_products2 .product_'+product_id+' .options select');
				$.ajax({
				  type: 'post',
				  url:  'index.php?route=product/product/update_prices',
				  data: data.serialize() + '&product_id=' + product_id + '&quantity=' + quantity,
				  dataType: 'json',
				  success: function(json) {
				  
					<?php if ($img_slider) { ?>
					$('#product_products2 .product_'+product_id+' .image .owl-item:first-child img').attr('src', json['opt_image']);
					<?php } else { ?>
					$('#product_products2 .product_'+product_id+' .image img').attr('src', json['opt_image']);
					<?php } ?>
					
					<?php if ($description_options['zamena_description'] && $description_options['model']) { ?>
					$('#product_products2 .product_'+product_id+' .pr_model_'+product_id).html(json['opt_model']);
					<?php } ?>
				  
					var start_quantity = parseFloat($('#product_products2 .pr_quantity_'+product_id).html().replace(/\s*/g,''));
					var end_quantity = json['option_quantity'];
					$({val:start_quantity}).animate({val:end_quantity}, {
						duration: 500,
						easing: 'swing',
						step: function(val) {
							$('#product_products2 .pr_quantity_'+product_id).html(number_format(val, product_id));
						}
					});
					
					<?php if ($description_options['zamena_description'] && $description_options['weight']) { ?>
					var start_weight = parseFloat($('#product_products2 .pr_weight_'+product_id).attr('data-weight'));
					var weight = json['weight'];
					$({val:start_weight}).animate({val:weight}, {
						duration: 500,
						easing: 'swing',
						step: function(val) {
							$('#product_products2 .pr_weight_'+product_id).html(weight_format(val, product_id));
						}
					});
					$('#product_products2 .pr_weight_'+product_id).attr('data-weight', json['weight']);
					<?php } ?>
				  
					<?php if ($stikers_status) { ?>
					var start_price = parseFloat($('#product_products2 .special_no_format'+product_id).html().replace(/\s*/g,''));
					var price = json['price_n'];
					$({val:start_price}).animate({val:price}, {
						duration: 500,
						easing: 'swing',
						step: function(val) {
							$('#product_products2 .special_no_format'+product_id).html(price_format(val));
						}
					});
					<?php } ?>
					
					var start_special = parseFloat($('#product_products2 .price_no_format'+product_id).html().replace(/\s*/g,''));
					var special = json['special_n'];
					$({val:start_special}).animate({val:special}, {
						duration: 500,
						easing: 'swing',
						step: function(val) {
							$('#product_products2 .price_no_format'+product_id).html(price_format(val));
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
			max_height_div('#product_products2 .product-thumb h4');
			$('#product_products2 .product-thumb .description_options').css('min-height', 'initial');
			max_height_div('#product_products2 .product-thumb .description');
			max_height_div('#product_products2 .product-thumb .description_options');
			max_height_div('#product_products2 .product-thumb .price');
			max_height_div('#product_products2 .product-thumb .number');	
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
	<?php } ?>
      <?php if ($tags) { ?>
      <p><?php echo $text_tags; ?>
        <?php for ($i = 0; $i < count($tags); $i++) { ?>
        <?php if ($i < (count($tags) - 1)) { ?>
        <a href="<?php echo $tags[$i]['href']; ?>"><?php echo $tags[$i]['tag']; ?></a>,
        <?php } else { ?>
        <a href="<?php echo $tags[$i]['href']; ?>"><?php echo $tags[$i]['tag']; ?></a>
        <?php } ?>
        <?php } ?>
      </p>
      <?php } ?>
      <?php echo $content_bottom; ?></div>

	<?php if ($products && $recpr_rightc) { ?>
	<aside id="column-right" class="col-sm-3 hidden-xs <?php if ($columns_dd) { echo 'columns_dd'; }?>">
	<div id="product_products">
	<h3><?php echo $text_related; ?></h3>
	<div class="row">
	<div class="product_related products_category">
	<?php foreach ($products as $product) { ?>
	<div class="col-lg-12 item">
	  <div class="product-thumb product_<?php echo $product['product_id']; ?>">
		<div class="image">
			<a href="<?php echo $product['href']; ?>"><img src="<?php echo $product['thumb']; ?>" alt="<?php echo $product['name']; ?>" title="<?php echo $product['name']; ?>" class="img-responsive <?php if ($product['quantity'] < 1 && !$zakaz) { ?>zatemnenie_img<?php } ?>" /></a>
			<?php if ($stikers_status) { ?>
				<div class="stiker_panel">
					<?php if ($product['quantity'] < 1) { ?>
						<?php if ($product['stiker_stock']) { ?>
							<span class="stiker stiker_netu"><?php echo $text_catalog_stiker_netu; ?></span>
						<?php } ?>
					<?php } ?>
					<?php if ($product['quantity'] > 0 || $zakaz) { ?>
						<?php if ($product['stiker_spec']) { ?>
							<?php if ($product['special']) { ?>
								<span class="stiker stiker_spec"><span class="price-old"><?php echo $product['price']; ?></span></span>
							<?php } ?>
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
		<div class="caption clearfix">
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
			<div class="product_buttons">
				<?php if ($product['price']) { ?>
					<?php if ($product['price_number'] > 0) { ?>
						<?php if ($product['quantity'] > 0 || $zakaz) { ?>
							<div class="price">
							<?php if ($product['price_number'] > 0) { ?>
								<?php if (!$product['special']) { ?>
									<?php echo $product['price']; ?>
								<?php } else { ?>
									<span class="price-new"><?php echo $product['special']; ?></span>
								<?php } ?>
							<?php } ?>
							</div>
						<?php } ?>
						<?php } else { ?>
							<?php if ($zakaz) { ?>
								<p class="price na_zakaz"><?php echo $text_catalog_price_na_zakaz; ?></p>
							<?php } ?>
					<?php } ?>
				<?php } ?>
				<?php if ($rev_srav_prod || $rev_wish_prod) { $button_cart_class = 'prlistb'; } else { $button_cart_class = 'prlistb active'; } ?>
				<?php if ($product['quantity'] > 0 || $zakaz) { ?>
					<?php if ($product['price_number'] > 0) { ?>
						<div class="cart">
							<a onclick="get_revpopup_cart('<?php echo $product['product_id']; ?>', 'catalog_mod', '<?php echo $product['minimum']; ?>');" <?php if ($button_cart_class != 'prlistb active') { ?>data-toggle="tooltip" title="<?php echo $button_cart; ?>"<?php } ?>><i class="fa fa-border fa-shopping-basket"><span class="<?php echo $button_cart_class; ?>"><?php echo $button_cart; ?></span></i></a>
						</div>
					<?php } ?>
				<?php } ?>
				<?php if ($rev_wish_prod) { ?>
					<div class="wishlist">
						<a class="<?php echo $product['wishlist_class'] ?>" data-toggle="tooltip" onclick="wishlist.add('<?php echo $product['product_id']; ?>');" title="<?php echo $product['button_wishlist']; ?>"><i class="fa fa-border fa-heart"></i></a>
					</div>
				<?php } ?>
				<?php if ($rev_srav_prod) { ?>
					<div class="compare">
						<a class="<?php echo $product['compare_class'] ?>" data-toggle="tooltip" onclick="compare.add('<?php echo $product['product_id']; ?>', '<?php echo $product['brand']; ?>');" title="<?php echo $product['button_compare']; ?>"><i class="fa fa-border fa-bar-chart-o"></i></a>
					</div>
				<?php } ?>
			</div>
		</div>
	  </div>
	</div>
	<?php } ?>
	</div>
	</div>
	</div>
	</aside>
	<?php } ?>

    <?php echo $column_right; ?></div>
</div>
<script type="text/javascript"><!--
$(document).ready(function(){ 
	$('.nav.nav-tabs li:first-child a').tab('show');
});

var owl = $("#owl-images");
owl.owlCarousel({
  responsiveBaseWidth: '.container',
  itemsCustom: [[0, 2], [448, 3], [650, 3], [750, 3], [970, 4]],
  navigation : true,
  navigationText: ['<i class="fa fa-chevron-left fa-5x"></i>', '<i class="fa fa-chevron-right fa-5x"></i>'],
  pagination: false
}); 

$('select[name=\'recurring_id\'], input[name="quantity"]').change(function(){
	$.ajax({
		url: 'index.php?route=product/product/getRecurringDescription',
		type: 'post',
		data: $('input[name=\'product_id\'], input[name=\'quantity\'], select[name=\'recurring_id\']'),
		dataType: 'json',
		beforeSend: function() {
			$('#recurring-description').html('');
		},
		success: function(json) {
			$('.alert, .text-danger').remove();

			if (json['success']) {
				$('#recurring-description').html(json['success']);
			}
		}
	});
});

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

$('button[id^=\'button-upload\']').on('click', function() {
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

$('#review').delegate('.pagination a', 'click', function(e) {
    e.preventDefault();

    $('#review').fadeOut('slow');

    $('#review').load(this.href);

    $('#review').fadeIn('slow');
});

$('#review').load('index.php?route=product/product/review&product_id=<?php echo $product_id; ?>');

$('#button-review').on('click', function() {
	$.ajax({
		url: 'index.php?route=product/product/write&product_id=<?php echo $product_id; ?>',
		type: 'post',
		dataType: 'json',
		data: $(".form-review").serialize(),
		beforeSend: function() {
			$('#button-review').button('loading');
		},
		complete: function() {
			$('#button-review').button('reset');
		},
		success: function(json) {
			$('.alert-success, .alert-danger').remove();

			if (json['error']) {
				get_revpopup_notification('alert-danger', '<?php echo $text_product_oshibka; ?>', json['error']);
			}

			if (json['success']) {
				get_revpopup_notification('alert-success', '<?php echo $text_product_spasibo_otz; ?>', json['success']);

				$('input[name=\'name\']').val('');
				$('textarea[name=\'text\']').val('');
				$('input[name=\'rating\']:checked').prop('checked', false);
				
				$('#post-review-box').slideUp(300);
				$('#new-review').focus();
				$('#open-review-box').fadeIn(200);
				$('#close-review-box').hide();
				$('#ratings-hidden').val('');
				$('.stars .glyphicon').removeClass('glyphicon-star').addClass('glyphicon-star-empty');
				
			}
		}
	});
});

$('.thumbnails .main-image').magnificPopup({
	type:'image',
	callbacks: {
	open: function() {
		$('body').addClass('razmiv2');
		$('#pagefader2').fadeIn(70);
		if (document.body.scrollHeight > document.body.offsetHeight) {
			<?php if ($setting_all_settings['all_document_width']) { ?>
				$('#top3').css('right', '8.5px');
			<?php } ?>
		}
	}, 
	close: function() {
		$('body').removeClass('razmiv2');
		$('#pagefader2').fadeOut(70);
		$('#top3').css('right', 'initial');
	}
	}
});
$('.thumbnails .images-additional').magnificPopup({
	type:'image',
	delegate: 'a',
	gallery: {
		enabled:true
	},
	callbacks: {
	open: function() {
		$('body').addClass('razmiv2');
		$('#pagefader2').fadeIn(70);
		if (document.body.scrollHeight > document.body.offsetHeight) {
			<?php if ($setting_all_settings['all_document_width']) { ?>
				$('#top3').css('right', '8.5px');
			<?php } ?>
		}
	}, 
	close: function() {
		$('body').removeClass('razmiv2');
		$('#pagefader2').fadeOut(70);
		$('#top3').css('right', 'initial');
	}
	}
});
<?php if ($zoom) { ?>
$('.images-additional img').click(function(){
	var oldsrc = $(this).attr('src');
	newsrc = $(this).parent().attr('id');
	newhref = $(this).parent().attr('href');
	number = $(this).attr('data-number');
	
	$('#imageWrap img').attr('src', newsrc);
	
	$('.main-image img').attr('src', newsrc);
	$('.main-image').attr('href', newhref);
	$('.main-image').attr('data-number', number);
	$('.cloud-zoom').CloudZoom();
	return false;
});
<?php } ?>
$('.thumbnails .main-image img').click(function(){
	if ($('.images-additional').length > 0) {
		var startnumber = $(this).parent().attr('data-number');
		$('.images-additional').magnificPopup('open', startnumber);
		return false
	} else {
		$(this).magnificPopup('open');
		return false
	}
});
<?php if ($minimum > 1 && $recalc_price) { ?>
	update_quantity(<?php echo $product_id ?>,<?php echo $minimum ?>);
<?php } ?>
function get_revpopup_cart_quantity() {
	input_val = $('.product-info.product_informationss .plus-minus').val();
	quantity  = parseInt(input_val);
	return quantity;
}
function validate_pole(val, product_id, znak, minimumvalue, maximumvalue) {
	val.value = val.value.replace(/[^\d,]/g, '');
	if (val.value == '') val.value = minimumvalue;
	maximumvalue = Number($('.product_informationss .pr_quantity').text());
	if (maximumvalue == 0) maximumvalue = 9999;
	input_val = $('.product-info.product_informationss .plus-minus');
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

	update_quantity(product_id, input_val.val());
}
function update_quantity(product_id, quantity) {
	var minimumvalue = <?php echo $minimum ?>;
	if (quantity == 0 || quantity < minimumvalue) {
		quantity = $('.product-info.product_informationss .plus-minus').val(minimumvalue);
		return;
	} else if (quantity < 1) {
		quantity = 1;
		return;
	}
	
	data = $('.product-info.product_informationss input[type=\'text\'], .product-info.product_informationss input[type=\'hidden\'], .product-info.product_informationss input[type=\'radio\']:checked, .product-info.product_informationss input[type=\'checkbox\']:checked, .product-info.product_informationss select, .product-info.product_informationss textarea'),
	$.ajax({
	  url: 'index.php?route=product/product/update_prices',
	  type: 'post',
	  dataType: 'json',
	  data: data.serialize() + '&product_id=' + product_id + '&quantity=' + quantity,
	  success: function(json) {

		<?php if ($recalc_price) { ?>
		
			<?php if ($points) { ?>
			var start_quantity = parseFloat($('.product_informationss .pr_points').html().replace(/\s*/g,''));
			var end_quantity = json['points'];
			$({val:start_quantity}).animate({val:end_quantity}, {
				duration: 500,
				easing: 'swing',
				step: function(val) {
					$('.product_informationss .pr_points').html(number_format(val, product_id));
				}
			});
			<?php } ?>
		
			<?php if ($weight_status) { ?>
			var start_weight = parseFloat($('.product_informationss .pr_weight').attr('data-weight'));
			var weight = json['weight'];
			$({val:start_weight}).animate({val:weight}, {
				duration: 500,
				easing: 'swing',
				step: function(val) {
					$('.product_informationss .pr_weight').html(weight_format(val));
				}
			});
			$('.product_informationss .pr_weight').attr('data-weight', json['weight']);
			<?php } ?>
		  
			<?php if ($price_number > 0 || $zakaz_price_null) { ?>
			var start_price = parseFloat($('.product_informationss .update_price').html().replace(/\s*/g,''));
			<?php if ($discounts && !$special) { ?>
			var price = json['special_n'];
			<?php } else { ?>
			var price = json['price_n'];
			<?php } ?>
			$({val:start_price}).animate({val:price}, {
				duration: 500,
				easing: 'swing',
				step: function(val) {
					$('.product_informationss .update_price').html(price_format(val));
				}
			});
			
			var start_special = parseFloat($('.product_informationss .update_special').html().replace(/\s*/g,''));
			var special = json['special_n'];
			$({val:start_special}).animate({val:special}, {
				duration: 500,
				easing: 'swing',
				step: function(val) {
					$('.product_informationss .update_special').html(price_format(val));
				}
			});
			<?php } ?>
		
		<?php } ?>
	  } 
	});
}
function update_prices_product(product_id, minimumvalue) {
	input_val = $('.product-info.product_informationss .plus-minus').val();
	if (input_val > minimumvalue) {
		input_val = minimumvalue;
		$('.product-info.product_informationss .plus-minus').val(minimumvalue);
	}
	<?php if ($recalc_price) { ?>
	quantity = parseInt(input_val);
	<?php } else { ?>
	quantity = 1;
	<?php } ?>
	data = $('.product-info.product_informationss input[type=\'text\'], .product-info.product_informationss input[type=\'hidden\'], .product-info.product_informationss input[type=\'radio\']:checked, .product-info.product_informationss input[type=\'checkbox\']:checked, .product-info.product_informationss select, .product-info.product_informationss textarea');
	$.ajax({
	  type: 'post',
	  url:  'index.php?route=product/product/update_prices',
	  data: data.serialize() + '&product_id=' + product_id + '&quantity=' + quantity,
	  dataType: 'json',
	  success: function(json) {

		$('.product_informationss .thumbnails a.main-image').attr('href', json['opt_image_2_big']);
		$('.product_informationss .thumbnails a.main-image img').attr('src', json['opt_image_2']);
		<?php if ($images_slider) { ?>
		$('.product_informationss .thumbnails .images-additional .owl-item:first-child a').attr('href', json['opt_image_2_big']);
		$('.product_informationss .thumbnails .images-additional .owl-item:first-child a img').attr('src', json['opt_image_2']).css('width', <?php echo $config_image_additional_width; ?>).css('height', <?php echo $config_image_additional_height; ?>);
		<?php } else { ?>
		$('.product_informationss .thumbnails .images-additional a:first-child').attr('href', json['opt_image_2_big']);
		$('.product_informationss .thumbnails .images-additional a:first-child img').attr('src', json['opt_image_2']).css('width', <?php echo $config_image_additional_width; ?>).css('height', <?php echo $config_image_additional_height; ?>);
		<?php } ?>
		<?php if ($zoom) { ?>
		<?php if ($images_slider) { ?>
		$('.product_informationss .thumbnails .images-additional .owl-item:first-child a').attr('id', json['opt_image_2']);
		<?php } else { ?>
		$('.product_informationss .thumbnails .images-additional a:first-child').attr('id', json['opt_image_2']);
		<?php } ?>
		$('.product_informationss .cloud-zoom').CloudZoom();
		<?php } ?>
		
		var start_quantity = parseFloat($('.product_informationss .pr_quantity').html().replace(/\s*/g,''));
		var end_quantity = json['option_quantity'];
		$({val:start_quantity}).animate({val:end_quantity}, {
			duration: 500,
			easing: 'swing',
			step: function(val) {
				$('.product_informationss .pr_quantity').html(number_format(val, product_id));
			}
		});
		
		<?php if ($points) { ?>
		var start_quantity = parseFloat($('.product_informationss .pr_points').html().replace(/\s*/g,''));
		var end_quantity = json['points'];
		$({val:start_quantity}).animate({val:end_quantity}, {
			duration: 500,
			easing: 'swing',
			step: function(val) {
				$('.product_informationss .pr_points').html(number_format(val, product_id));
			}
		});
		<?php } ?>
		
		<?php if ($model_status) { ?>
			$('.product_informationss .pr_model').html(json['opt_model']);
		<?php } ?>
		
		<?php if ($weight_status) { ?>
		var start_weight = parseFloat($('.product_informationss .pr_weight').attr('data-weight'));
		var weight = json['weight'];
		$({val:start_weight}).animate({val:weight}, {
			duration: 500,
			easing: 'swing',
			step: function(val) {
				$('.product_informationss .pr_weight').html(weight_format(val));
			}
		});
		$('.product_informationss .pr_weight').attr('data-weight', json['weight']);
		<?php } ?>
	  
		<?php if (($options && !$revtheme_product_all['options_buy']) || !$options_buy) { ?>
		<?php if ($price_number > 0 || $zakaz_price_null) { ?>
		var start_price = parseFloat($('.product_informationss .update_price').html().replace(/\s*/g,''));
		<?php if ($discounts && !$special) { ?>
		var price = json['special_n'];
		<?php } else { ?>
		var price = json['price_n'];
		<?php } ?>
		$({val:start_price}).animate({val:price}, {
			duration: 500,
			easing: 'swing',
			step: function(val) {
				$('.product_informationss .update_price').html(price_format(val));
			}
		});
		
		var start_special = parseFloat($('.product_informationss .update_special').html().replace(/\s*/g,''));
		var special = json['special_n'];
		$({val:start_special}).animate({val:special}, {
			duration: 500,
			easing: 'swing',
			step: function(val) {
				$('.product_informationss .update_special').html(price_format(val));
			}
		});
		<?php } ?>
		<?php } ?>
	  }
	});
}
<?php if ($revtheme_product_all['options_buy_click']) { ?>
	function update_options_buy(product_id, opt_id, option) {
		$('.product-info.product_informationss .options_buy .pro_'+option+' input[name=\'option['+opt_id+']\']').val(option);
		data = $('.product-info.product_informationss .options_buy .pro_'+option+' input[type=\'text\'], .product-info.product_informationss .options_buy .pro_'+option+' input[type=\'hidden\'], .product-info.product_informationss .options_buy .pro_'+option+' input[type=\'radio\']:checked, .product-info.product_informationss .options_buy .pro_'+option+' input[type=\'checkbox\']:checked, .product-info.product_informationss .options_buy .pro_'+option+' select, .product-info.product_informationss .options_buy .pro_'+option+' textarea');
		$.ajax({
		  type: 'post',
		  url:  'index.php?route=product/product/update_prices',
		  data: data.serialize() + '&product_id=' + product_id,
		  dataType: 'json',
		  success: function(json) {
			
			$('.product_informationss .thumbnails a.main-image').attr('href', json['opt_image_2_big']);
			$('.product_informationss .thumbnails a.main-image img').attr('src', json['opt_image_2']);
			<?php if ($images_slider) { ?>
			$('.product_informationss .thumbnails .images-additional .owl-item:first-child a').attr('href', json['opt_image_2_big']);
			$('.product_informationss .thumbnails .images-additional .owl-item:first-child a img').attr('src', json['opt_image_2']).css('width', <?php echo $config_image_additional_width; ?>).css('height', <?php echo $config_image_additional_height; ?>);
			<?php } else { ?>
			$('.product_informationss .thumbnails .images-additional a:first-child').attr('href', json['opt_image_2_big']);
			$('.product_informationss .thumbnails .images-additional a:first-child img').attr('src', json['opt_image_2']).css('width', <?php echo $config_image_additional_width; ?>).css('height', <?php echo $config_image_additional_height; ?>);
			<?php } ?>
			<?php if ($zoom) { ?>
			<?php if ($images_slider) { ?>
			$('.product_informationss .thumbnails .images-additional .owl-item:first-child a').attr('id', json['opt_image_2']);
			<?php } else { ?>
			$('.product_informationss .thumbnails .images-additional a:first-child').attr('id', json['opt_image_2']);
			<?php } ?>
			$('.product_informationss .cloud-zoom').CloudZoom();
			<?php } ?>
			  
			var start_quantity = parseFloat($('.product_informationss .pr_quantity').html().replace(/\s*/g,''));
			var end_quantity = json['option_quantity'];
			$({val:start_quantity}).animate({val:end_quantity}, {
				duration: 500,
				easing: 'swing',
				step: function(val) {
					$('.product_informationss .pr_quantity').html(number_format(val, product_id));
				}
			});
			
			<?php if ($points) { ?>
			var start_quantity = parseFloat($('.product_informationss .pr_points').html().replace(/\s*/g,''));
			var end_quantity = json['points'];
			$({val:start_quantity}).animate({val:end_quantity}, {
				duration: 500,
				easing: 'swing',
				step: function(val) {
					$('.product_informationss .pr_points').html(number_format(val, product_id));
				}
			});
			<?php } ?>
			
			<?php if ($model_status) { ?>
				$('.product_informationss .pr_model').html(json['opt_model']);
			<?php } ?>
			
			<?php if ($weight_status) { ?>
			var start_weight = parseFloat($('.product_informationss .pr_weight').attr('data-weight'));
			var weight = json['weight'];
			$({val:start_weight}).animate({val:weight}, {
				duration: 500,
				easing: 'swing',
				step: function(val) {
					$('.product_informationss .pr_weight').html(weight_format(val));
				}
			});
			$('.product_informationss .pr_weight').attr('data-weight', json['weight']);
			<?php } ?>
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
<?php if ($img_slider) { ?>
	$('.product_related .owlproduct').owlCarousel({
		items: 1,
		singleItem: true,
		mouseDrag: false,
		touchDrag: false,
		autoPlay: false,
		navigation: true,
		navigationText: ['<i class="fa fa-chevron-left fa-3x"></i>', '<i class="fa fa-chevron-right fa-3x"></i>'],
		pagination: false
	});
	$('.viewed_products .owlproduct').owlCarousel({
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
--></script>
<?php echo $footer; ?>