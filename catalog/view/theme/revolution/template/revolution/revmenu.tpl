<div id="menu2_button" <?php if ($module_class) { ?>class="page-fader <?php echo $module_class; ?>"<?php } ?>>
<div class="box-heading hidden-md hidden-lg" data-toggle="offcanvas" data-target=".navmenu.mobcats" data-canvas="body"><?php echo $heading_title; ?><span class="icorightmenu"><i class="fa fa-chevron-down"></i></span></div>
<div class="box-heading hidden-xs hidden-sm"><?php echo $heading_title; ?><span class="icorightmenu"><i class="fa fa-chevron-down"></i></span></div>
<div class="box-content am hidden-xs hidden-sm">
<div id="menu2" <?php if ($module_class) { ?>class="<?php echo $module_class; ?>"<?php } ?>>
<div class="podmenu2"></div>
<div class="catalog_list catalog_list_popup catalog_as_popup">
<?php if ($cats_status) { ?>
	<?php foreach ($categories as $category) { ?>  
		<div class="revlevel_1 hasChildren closed">
			<?php if ($category['children']) { ?>
				<div class="title with-child">
				<a href="<?php echo $category['href']; ?>">
				<?php if ($category['category_image']) { echo $category['category_image']; } ?><?php echo $category['name']; ?>
				<span class="arrow-btn"><i class="fa fa-angle-right"></i></span>
				</a>
				</div>
			<?php } else { ?>
				<div class="title">
				<a href="<?php echo $category['href']; ?>"><?php if ($category['category_image']) { echo $category['category_image']; } ?><?php echo $category['name']; ?></a>
				</div>
			<?php } ?>
			<?php if ($category['children']) { ?>	
			<div class="childrenList">
				<?php if ($category['column'] == 1) {
					$box_class = 'box-col-1'; $col_class = 'col-1'; $image_in_ico_class = 'col-sm-12 col-lg-6';
				} else if ($category['column'] == 2) {
					$box_class = 'box-col-2'; $col_class = 'col-2'; $image_in_ico_class = 'col-sm-4 col-lg-3';
				} else if ($category['column'] == 3) {
					$box_class = 'box-col-3'; $col_class = 'col-3'; $image_in_ico_class = 'col-sm-3 col-lg-2';
				} else {
					$box_class = 'box-col-4'; $col_class = 'col-4'; $image_in_ico_class = 'col-sm-12 col-lg-6';
				} ?>
				<div class="child-box <?php echo $box_class; ?>">
				<?php if ($image_in_ico) { ?>
					<div class="image_in_ico_<?php echo $category['category_id']; ?> refine_categories clearfix">
						<?php foreach ($category['children'] as $child) { ?>
							<a class="<?php echo $image_in_ico_class; ?>" href="<?php echo $child['href']; ?>">
								<img src="<?php echo $child['thumb']; ?>" title="<?php echo $child['name']; ?>" alt="<?php echo $child['name']; ?>" /><span><?php echo $child['name']; ?></span>
							</a>
						<?php } ?>
					</div>
				<?php } else { ?>	
					<ul class="ul_block<?php echo $category['category_id']; ?> <?php echo $col_class; ?>">
					<?php foreach ($category['children'] as $child) { ?>
						<li class="glavli"><a href="<?php echo $child['href']; ?>"><?php if ($child['category_image']) { echo $child['category_image']; } ?><?php echo $child['name']; ?></a>
							<?php if ($tri_level && $child['children']) { ?>
							<ul class="lastul">
								<?php foreach ($child['children'] as $child2) { ?>
								  <?php if ($child2['category_id'] == $child2_id) { ?>
								  <li class="category-<?php echo $child2['category_id']; ?> active"><a href="<?php echo $child2['href']; ?>" class="active"><i class="fa fa-minus"></i><?php echo $child2['name']; ?></a></li>
								  <?php } else { ?>
								  <li class="category-<?php echo $child2['category_id']; ?>"><a href="<?php echo $child2['href']; ?>"><i class="fa fa-minus"></i><?php echo $child2['name']; ?></a></li>
								  <?php } ?>
								<?php } ?>
							</ul>
							<?php } ?>
						</li>
						<?php } ?>
					</ul>
				<?php } ?>
				<?php if ($category['thumb2']) { ?>
					<img class="img_sub" src="<?php echo $category['thumb2']; ?>" alt="<?php echo $category['name']; ?>" />	
				<?php } ?>
				</div>		
			</div>
			<?php } ?>
		</div>		
	<?php } ?>
<?php } ?>
<?php if ($manuf_status) { ?>
	<?php if ($categories_m) { ?>
	<div class="revlevel_1 hasChildren closed">
		<div class="title with-child">
		<a href="<?php echo $url_revmenu_manufs; ?>"><?php if ($manuf_image) { echo $manuf_image; } ?><?php echo $text_revmenu_manufs; ?><span class="arrow-btn"><i class="fa fa-angle-right"></i></span></a>
		</div>
		<div class="childrenList">
			<?php if ($n_column == 1) {
				$box_class_m = 'box-col-1'; $col_class_m = 'col-1'; $image_in_ico_class = 'col-sm-12 col-lg-6';
			} else if ($n_column == 2) {
				$box_class_m = 'box-col-2'; $col_class_m = 'col-2'; $image_in_ico_class = 'col-sm-4 col-lg-3';
			} else if ($n_column == 3) {
				$box_class_m = 'box-col-3'; $col_class_m = 'col-3'; $image_in_ico_class = 'col-sm-3 col-lg-2';
			} else {
				$box_class_m = 'box-col-4'; $col_class_m = 'col-4'; $image_in_ico_class = 'col-sm-12 col-lg-6';
			} ?>
			<div class="child-box <?php echo $box_class_m; ?>">
				<?php if ($image_in_ico_m) { ?>
					<div class="image_in_ico_manufacturers refine_categories clearfix">
						<?php foreach (array_chunk($categories_m, ceil(count($categories_m) / $n_column)) as $categorys) { ?>
							<?php foreach ($categorys as $category) { ?>
								<?php if ($category['manufacturer']) { ?>
									<?php foreach ($category['manufacturer'] as $manufacturers) { ?>
										<a class="<?php echo $image_in_ico_class; ?>" href="<?php echo $manufacturers['href']; ?>">
											<img src="<?php echo $manufacturers['thumb']; ?>" title="<?php echo $manufacturers['name']; ?>" alt="<?php echo $manufacturers['name']; ?>" /><span><?php echo $manufacturers['name']; ?></span>
										</a>
									<?php } ?>
								<?php } ?>
							<?php } ?>
						<?php } ?>
					</div>
				<?php } else { ?>	
					<ul class="ul_block cat_m <?php echo $col_class_m; ?>">
						<?php foreach ($categories_m as $category) { ?>
							<li class="glavli"><?php echo $category['name']; ?>
								<ul class="lastul">
									<?php foreach ($category['manufacturer'] as $manufacturers) { ?>
									  <li class="category"><a href="<?php echo $manufacturers['href']; ?>"><i class="fa fa-minus"></i><?php echo $manufacturers['name']; ?></a></li>
									<?php } ?>	
								</ul>
							</li>
						<?php } ?>
					</ul>
				<?php } ?>
			</div>		
		</div>
	</div>
	<?php } ?>
<?php } ?>
<?php if ($revtheme_header_menu_links) { ?>
	<?php foreach ($revtheme_header_menu_links as $revtheme_header_menu_link) { ?>
		<div class="revlevel_1 hasChildren closed">
			<div class="title">
				<a href="<?php echo $revtheme_header_menu_link['link']; ?>"><?php if ($revtheme_header_menu_link['image']) { echo $revtheme_header_menu_link['image']; } ?><?php echo $revtheme_header_menu_link['title']; ?></a>
			</div>
		</div>	
	<?php } ?>
<?php } ?>
</div>
</div>
</div>
</div>
<script type="text/javascript"><!--
function autocol_cats(cat_id, cat_col) {
	$('.ul_block'+cat_id).autocolumnlist({  
		columns: cat_col,
		min: 1
	});
}
<?php foreach ($categories as $category) { ?>
	autocol_cats(<?php echo $category['category_id']; ?>, <?php echo $category['column']; ?>);
<?php } ?>
<?php if ($manuf_status) { ?>
	<?php if ($categories_m) { ?>
		$('.ul_block.cat_m').autocolumnlist({  
			columns: <?php echo $n_column; ?>,
			min: 1
		});
	<?php } ?>
<?php } ?>		
<?php if ($image_in_ico) { ?>
	$('#menu2').css('display', 'block');
	<?php foreach ($categories as $category) { ?>
		<?php if ($category['children']) { ?>	
			var div = '.childrenList .image_in_ico_<?php echo $category['category_id']; ?>.refine_categories span';
			var maxheight = 0;
			$(div).each(function(){
				$(this).removeAttr('style');
				if($(this).height() > maxheight) {
					maxheight = $(this).height();
				}
			});
			$(div).height(maxheight);
		<?php } ?>
	<?php } ?>
	<?php if ($manuf_status) { ?>
		var div = '.image_in_ico_manufacturers.refine_categories > a > span';
		var maxheight = 0;
		$(div).each(function(){
			$(this).removeAttr('style');
			if($(this).height() > maxheight) {
				maxheight = $(this).height();
			}
		});
		$(div).height(maxheight);
	<?php } ?>
	$('#menu2').css('display', '');
<?php } ?>
//--></script>