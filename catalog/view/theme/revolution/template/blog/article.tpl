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
<ul class="breadcrumb">
<?php foreach ($breadcrumbs as $i=> $breadcrumb) { ?>
<?php if($i+1<count($breadcrumbs)) { ?><li><a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a></li><?php } else { ?><?php } ?>
<?php } ?>
<li><h1 class="inbreadcrumb"><?php echo $heading_title; ?></h1></li>
</ul>
  <div class="row"><?php echo $column_left; ?>
    <?php if ($column_left && $column_right) { ?>
    <?php $class = 'col-sm-6'; ?>
    <?php } elseif ($column_left || $column_right) { ?>
    <?php $class = 'col-sm-9'; ?>
    <?php } else { ?>
    <?php $class = 'col-sm-12'; ?>
    <?php } ?>
    <div id="content" class="<?php echo $class; ?> product-info"><?php echo $content_top; ?>
      <div class="row">
        <?php if ($column_left && $column_right) { ?>
        <?php $class = 'col-sm-12'; ?>
        <?php } elseif ($column_left || $column_right) { ?>
        <?php $class = 'col-sm-12'; ?>
        <?php } else { ?>
        <?php $class = 'col-sm-6'; ?>
        <?php } ?>
        <div class="col-sm-12">
          <div class="tab-content">
            <div id="description"><?php echo $description; ?></div>
			
			<?php if ($review_status) { ?>
          <div class="rating">
            <p>
              <?php for ($i = 1; $i <= 5; $i++) { ?>
              <?php if ($rating < $i) { ?>
              <span class="fa fa-stack"><i class="fa fa-star-o fa-stack-1x"></i></span>
              <?php } else { ?>
              <span class="fa fa-stack"><i class="fa fa-star fa-stack-1x"></i><i class="fa fa-star-o fa-stack-1x"></i></span>
              <?php } ?>
              <?php } ?>
              <a href="" onclick="gotoReview(); return false;"><?php echo $reviews; ?></a> / <a href="" onclick="gotoReview(); return false;"><?php echo $text_write; ?></a></p>
            <hr>
            <!-- AddThis Button BEGIN -->
            <div class="addthis_toolbox addthis_default_style"><a class="addthis_button_facebook_like" fb:like:layout="button_count"></a> <a class="addthis_button_tweet"></a> <a class="addthis_button_pinterest_pinit"></a> <a class="addthis_counter addthis_pill_style"></a></div>
            <script type="text/javascript" src="//s7.addthis.com/js/300/addthis_widget.js#pubid=ra-515eeaf54693130e"></script> 
            <!-- AddThis Button END --> 
          </div><br />
          <?php } ?>
		  
		  <?php if ($download_status) { ?>
			<div class="blog-info">
			<?php if($downloads){ ?>
			<br />
			<?php foreach($downloads as $download){ ?>
			<a href="<?php echo $download['href']; ?>" title=""><i class="fa fa-floppy-o"></i> <?php echo $download['name']; ?> <?php echo " (". $download['size'] .")";?></a><br>
			<?php } ?>
			<br />
			<?php } ?> 
			</div>
		  <?php } ?>
		  
          </div>
        </div>
      </div>
      <?php if ($products) { ?>
	  <div id="product_products" class="rev_slider">
      <h3><?php echo $text_related_product; ?></h3>
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
								<a onclick="get_revpopup_cart(<?php echo $product['product_id']; ?>,'module',get_revpopup_cart_quantity_product_products('<?php echo $product['product_id']; ?>'),'product_products');" <?php if ($button_cart_class != 'prlistb active') { ?>data-toggle="tooltip" title="<?php echo $button_cart; ?>"<?php } ?>><i class="fa fa-border fa-shopping-basket"><span class="<?php echo $button_cart_class; ?>"><?php echo $button_cart; ?></span></i></a>
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
	  
	  <?php if ($articles) { ?>
	  <div id="product_products">
      <h3><?php echo $text_related; ?></h3>
      <div class="row module">
        <?php $i = 0; ?>
        <?php foreach ($articles as $article) { ?>
        
        <?php if ($column_left && $column_right) { ?>
        <?php $class = 'col-lg-6 col-md-6 col-sm-12 col-xs-12'; ?>
        <?php } elseif ($column_left || $column_right) { ?>
        <?php $class = 'col-lg-4 col-md-4 col-sm-6 col-xs-12'; ?>
        <?php } else { ?>
        <?php $class = 'col-lg-3 col-md-3 col-sm-6 col-xs-12'; ?>
        <?php } ?>
        <div class="<?php echo $class; ?>">
          <div class="product-thumb transition">
            <div class="image"><a href="<?php echo $article['href']; ?>"><img src="<?php echo $article['thumb']; ?>" alt="<?php echo $article['name']; ?>" title="<?php echo $article['name']; ?>" class="img-responsive" /></a></div>
            <div class="caption" style="min-height: 90px;">
              <h4><a href="<?php echo $article['href']; ?>"><?php echo $article['name']; ?></a></h4>
              <p><?php echo $article['description']; ?></p>
              <?php if ($review_status) { ?>
              <div class="rating">
                <?php for ($i = 1; $i <= 5; $i++) { ?>
                <?php if ($article['rating'] < $i) { ?>
                <span class="fa fa-stack"><i class="fa fa-star-o fa-stack-1x"></i></span>
                <?php } else { ?>
                <span class="fa fa-stack"><i class="fa fa-star fa-stack-1x"></i><i class="fa fa-star-o fa-stack-1x"></i></span>
                <?php } ?>
                <?php } ?>
              </div>
              <?php } ?>
            </div>
            <div class="button-group">
				<button type="button" onclick="location.href = ('<?php echo $article['href']; ?>');"><i class="fa fa-share"></i> <span class="hidden-xs hidden-sm hidden-md"><?php echo $button_more; ?></span></button>
				<button type="button" data-toggle="tooltip" title="<?php echo $article["date_added"];?>" "><i class="fa fa-clock-o"></i></button>
				<button type="button" data-toggle="tooltip" title="<?php echo $text_views; ?> <?php echo $article["viewed"];?>" "><i class="fa fa-eye"></i></button>
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
        <?php $i++; ?>
        
        
        <?php } ?>
      </div>
	  </div>
      <?php } ?>
	  
	  <?php if ($review_status) { ?>
	  <div id="product_products" class="rrrating">
            <div class="tab-pane" id="tab-review">
              <form class="form-horizontal" id="form-review">
                <div id="review"></div>
                <h3><?php echo $text_write; ?></h3>
                <?php if ($review_guest) { ?>
                <div class="form-group required">
                    <label class="control-label" for="input-name"><?php echo $entry_name; ?></label>
                    <input type="text" name="name" value="" id="input-name" class="form-control" />
                </div>
                <div class="form-group required">
                    <label class="control-label" for="input-review"><?php echo $entry_review; ?></label>
                    <textarea name="text" rows="5" id="input-review" class="form-control"></textarea>
                    <div class="help-block"><?php echo $text_note; ?></div>
                </div>
                <div class="form-group required">
                    <label class="control-label"><?php echo $entry_rating; ?></label>
                    &nbsp;&nbsp;&nbsp; <?php echo $entry_bad; ?>&nbsp;
                    <input type="radio" name="rating" value="1" />
                    &nbsp;
                    <input type="radio" name="rating" value="2" />
                    &nbsp;
                    <input type="radio" name="rating" value="3" />
                    &nbsp;
                    <input type="radio" name="rating" value="4" />
                    &nbsp;
                    <input type="radio" name="rating" value="5" />
                    &nbsp;<?php echo $entry_good; ?>
                </div>
                <?php if (VERSION >= 2.2) { ?>
					<?php echo $captcha; ?>
				<?php } else { ?>
					<?php if ($site_key) { ?>
					  <div class="form-group">
						  <div class="g-recaptcha" data-sitekey="<?php echo $site_key; ?>"></div>
					  </div>
					<?php } ?>
				<?php } ?>
                <div class="buttons clearfix">
                  <div class="pull-right">
                    <button type="button" id="button-review" data-loading-text="<?php echo $text_loading; ?>" class="btn btn-primary"><?php echo $button_continue; ?></button>
                  </div>
                </div>
                <?php } else { ?>
                <?php echo $text_login; ?>
                <?php } ?>
              </form>
            </div>
			</div>
			
            <?php } ?>
	  
      <?php echo $content_bottom; ?></div>
    <?php echo $column_right; ?></div>
</div>
<script type="text/javascript"><!--

$('#button-cart').ready(function() {
$('#button-cart').click(function() {
    $.ajax({
        url: 'index.php?route=checkout/cart/add',
        type: 'post',
        data: $('#product input[type=\'text\'], #product input[type=\'date\'], #product input[type=\'datetime-local\'], #product input[type=\'time\'], #product input[type=\'hidden\'], #product input[type=\'radio\']:checked, #product input[type=\'checkbox\']:checked, #product select, #product textarea'),
        dataType: 'json',
        
        success: function(json) {
            $('.alert, .text-danger').remove();
            
            if (json['error']) {
                if (json['error']['option']) {
                    for (i in json['error']['option']) {
                        $('#input-option' + i).after('<div class="text-danger">' + json['error']['option'][i] + '</div>');
                    }
                }
            } 
            
            if (json['success']) {
                $('.breadcrumb').after('<div class="alert alert-success">' + json['success'] + '<button type="button" class="close" data-dismiss="alert">&times;</button></div>');
                $('#cart').load('index.php?route=module/cart' + ' #cart > *');    
                //$('#cart-total').html(json['total']);
                
                $('html, body').animate({ scrollTop: 0 }, 'slow'); 
            }   
        }
    });
});
});
//--></script> 
<script type="text/javascript"><!--
$('button[id^=\'button-upload\']').on('click', function() {
	var node = this;
	
	$('#form-upload').remove();
	
	$('body').prepend('<form enctype="multipart/form-data" id="form-upload" style="display: none;"><input type="file" name="file" /></form>');

	$('#form-upload input[name=\'file\']').trigger('click');

	$('#form-upload input[name=\'file\']').on('change', function() {
		$.ajax({
			url: 'index.php?route=product/product/upload',
			type: 'post',		
			dataType: 'json',
			data: new FormData($(this).parent()[0]),
			cache: false,
			contentType: false,
			processData: false,		
			beforeSend: function() {
				$(node).find('i').replaceWith('<i class="fa fa-spinner fa-spin"></i>');
				$(node).prop('disabled', true);
			},
			complete: function() {
				$(node).find('i').replaceWith('<i class="fa fa-upload"></i>');
				$(node).prop('disabled', false);			
			},		
			success: function(json) {
				if (json['error']) {
					$(node).parent().find('input[name^=\'option\']').after('<div class="text-danger">' + json['error'] + '</div>');
				}
							
				if (json['success']) {
					alert(json['success']);
					
					$(node).parent().find('input[name^=\'option\']').attr('value', json['file']);
				}
			},			
			error: function(xhr, ajaxOptions, thrownError) {
				alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
			}
		});
	});
});
//--></script> 
<script type="text/javascript"><!--
$('#review').delegate('.pagination a', 'click', function(e) {
	e.preventDefault();
	
    $('#review').fadeOut('slow');
        
    $('#review').load(this.href);
    
    $('#review').fadeIn('slow');
});         

$('#review').load('index.php?route=blog/article/review&article_id=<?php echo $article_id; ?>');

$('#button-review').on('click', function() {

    $.ajax({
        url: 'index.php?route=blog/article/write&article_id=<?php echo $article_id; ?>',
        type: 'post',
        dataType: 'json',
        data: 'name=' + encodeURIComponent($('input[name=\'name\']').val()) + '&text=' + encodeURIComponent($('textarea[name=\'text\']').val()) + '&rating=' + encodeURIComponent($('input[name=\'rating\']:checked').val() ? $('input[name=\'rating\']:checked').val() : '') + '&captcha=' + encodeURIComponent($('input[name=\'captcha\']').val()),

        success: function(json) {
			$('.alert-success, .alert-danger').remove();
            
			if (json['error']) {
                $('#review').after('<div class="alert alert-danger"><i class="fa fa-exclamation-circle"></i> ' + json['error'] + '</div>');
            }
            
            if (json['success']) {
                $('#review').after('<div class="alert alert-success"><i class="fa fa-check-circle"></i> ' + json['success'] + '</div>');
                                
                $('input[name=\'name\']').val('');
                $('textarea[name=\'text\']').val('');
                $('input[name=\'rating\']:checked').prop('checked', false);
                $('input[name=\'captcha\']').val('');
            }
        }
    });
});
//--></script>
<script type="text/javascript"><!--
$(document).ready(function() {
  $('#description').find('a>img').each(function(){
    $(this).parent().addClass('gallery');
  });
  $('#description').magnificPopup({
    delegate: 'a.gallery',
    type: 'image',
    gallery: {
        enabled: true
    }
  });

  gotoReview = function() {
    offset = $('#form-review').offset();
    $('html, body').animate({ scrollTop: offset.top-20 }, 'slow');
  }
  gotoReviewWrite = function() {
    offset = $('#form-review h2').offset();
    $('html, body').animate({ scrollTop: offset.top-20 }, 'slow');
  }
  
});
--></script> 
<script type="text/javascript"><!--
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