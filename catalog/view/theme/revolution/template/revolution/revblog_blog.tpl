<?php echo $header; ?>
<div class="container" itemscope itemtype="http://schema.org/NewsArticle">
<meta itemscope itemprop="mainEntityOfPage"  itemType="https://schema.org/WebPage" itemid="<?php echo $microdata_url_info; ?>"/>
<div itemprop="author" itemscope itemtype="https://schema.org/Person"><meta itemprop="name" content="<?php echo $microdata_author; ?>" /></div>
<div itemprop="image" itemscope itemtype="https://schema.org/ImageObject">
<link itemprop="contentUrl" href="<?php echo $logo; ?>" />
<link itemprop="url" href="<?php echo $logo; ?>">
<meta itemprop="width" content="<?php echo $logo_width; ?>">
<meta itemprop="height" content="<?php echo $logo_height; ?>">
</div>
<div itemprop="publisher" itemscope itemtype="https://schema.org/Organization">		  
<div itemprop="logo" itemscope itemtype="https://schema.org/ImageObject">
<link itemprop="url" href="<?php echo $logo; ?>">
<link itemprop="contentUrl" href="<?php echo $logo; ?>" />
</div>
<meta itemprop="name" content="<?php echo $microdata_name; ?>" />
</div>
<meta itemprop="datePublished" content="<?php echo $microdata_date_info; ?>" />
<meta itemprop="dateModified" content="<?php echo $microdata_date_info; ?>" />
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
<li><h1 class="inbreadcrumb" itemprop="headline"><?php echo $heading_title; ?></h1></li>
</ul>
  <div class="row"><?php echo $column_left; ?>
    <?php if ($column_left && $column_right) { ?>
    <?php $class = 'col-sm-6'; ?>
    <?php } elseif ($column_left || $column_right) { ?>
    <?php $class = 'col-sm-9'; ?>
    <?php } else { ?>
    <?php $class = 'col-sm-12'; ?>
    <?php } ?>
    <div id="content" class="<?php echo $class; ?>"><?php echo $content_top; ?>
      <div class="row">
      <div class="col-md-12">
        <?php if ( $image ) { ?><img style="float: left; margin: 0 15px 15px 0;" src="<?php echo $image; ?>" alt="<?php echo $heading_title; ?>" /><?php } ?>
        <div>
        <div itemprop="description"><?php echo $description; ?></div>
		<p style="margin-top: 10px; text-align: right;"><i class="fa fa-clock-o" style="padding-right:3px;"></i><?php echo $data_added; ?></p>
        </div> 
        <?php if ($share_status) { ?>
			<script type="text/javascript" src="//yastatic.net/share2/share.js" charset="utf-8"></script>
			<div class="ya-share2" style="text-align:right;" data-services="vkontakte,facebook,odnoklassniki,moimir,twitter,viber,whatsapp" data-size="s"></div>
		<?php } ?>
		<?php if ($images) { ?>
		<hr>
		<div class="thumbnails">
			<div class="revblog_imgs images-additional">
				<?php foreach ($images as $image) { ?>
				<a class="thumbnail" href="<?php echo $image['popup']; ?>" title="<?php echo $heading_title; ?>"> <img src="<?php echo $image['thumb']; ?>" title="<?php echo $heading_title; ?>" alt="<?php echo $heading_title; ?>" /></a>
				<?php } ?>
			</div>
		</div>
		<?php } ?>
      </div>   
      </div>
<?php if ($products) { ?>
	  <div id="product_products" class="rev_slider">
      <h3><?php echo $heading_products_title; ?></h3>
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
										<label class="btn btn-default <?php if ($option_value['image']) { ?>label-in-img<?php } ?>" for="product_products_<?php echo $option['product_option_id']; ?>_<?php echo $option_value['product_option_value_id']; ?>">
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
									  <input onchange="update_prices_product_product_products(<?php echo $product['product_id']; ?>,<?php echo $product['minimum']; ?>);" type="checkbox" name="option[<?php echo $option['product_option_id']; ?>][]" value="<?php echo $option_value['product_option_value_id']; ?>" id="product_products_<?php echo $option['product_option_id']; ?>_<?php echo $option_value['product_option_value_id']; ?>" />
										<label class="btn btn-default <?php if ($option_value['image']) { ?>label-in-img<?php } ?>" for="product_products_<?php echo $option['product_option_id']; ?>_<?php echo $option_value['product_option_value_id']; ?>">
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
        <?php if (($column_left && $column_right) && ($i % 2 == 0)) { ?>
        <div class="clearfix visible-md visible-sm"></div>
        <?php } elseif (($column_left || $column_right) && ($i % 3 == 0)) { ?>
        <div class="clearfix visible-md"></div>
        <?php } elseif ($i % 4 == 0) { ?>
        <div class="clearfix visible-md"></div>
        <?php } ?>
        <?php } ?>
      </div>
	  </div>
	<script type="text/javascript">
		$('.product_related').owlCarousel({
			responsiveBaseWidth: '.product_related',
			<?php if ($chislo_ryad) { ?>
			itemsCustom: [[0, 1], [375, 2], [750, 3], [970, 4], [1170, 4]],
			<?php } else { ?>
			itemsCustom: [[0, 1], [375, 2], [750, 3], [970, 4], [1170, 5]],
			<?php } ?>
			mouseDrag: true,
			touchDrag: true,
			navigation: true,
			navigationText: ['<i class="fa fa-chevron-left"></i>', '<i class="fa fa-chevron-right"></i>'],
			pagination: true
		});
	</script>
	</div>
<?php } ?>
      <?php echo $content_bottom; ?></div>
    <?php echo $column_right; ?></div>
</div>
<script type="text/javascript"><!--
$(document).ready(function() {
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
				$('#top3').css('right', '8.5px');
			}
		}, 
		close: function() {
			$('body').removeClass('razmiv2');
			$('#pagefader2').fadeOut(70);
			$('#top3').css('right', 'initial');
		}
		}
	});
});
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
<?php } else { ?>
	$('.owl-carousel.owlproduct').remove();
<?php } ?>

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
--></script>
<?php echo $footer; ?>