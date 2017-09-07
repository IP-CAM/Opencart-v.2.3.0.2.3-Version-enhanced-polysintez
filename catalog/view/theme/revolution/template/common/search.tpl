<?php if ($in_category) { ?>
	<div class="search input-group">	
		<div class="change_category input-group-btn">
			<button type="button" class="change_category_button btn btn-default btn-lg dropdown-toggle" data-toggle="dropdown">
				<?php foreach ($search_categories as $search_category) {if ($search_category['category_id'] == $category_id) {$search_in_category = $search_category['name'];}}?>
				<span class="category-name"><?php echo $search_in_category; ?></span><i class="fa fa-chevron-down"></i>
			</button>
			<ul class="dropdown-menu catsearch">
				<li><a href="#" onclick="return false;" class="0"><?php echo $search_in_category_text_all; ?></a></li>
				<?php foreach ($search_categories as $search_category) { ?>
				<li><a href="#" onclick="return false;" class="<?php echo $search_category['category_id']; ?>"><?php echo $search_category['name']; ?></a></li>
				<?php } ?>
			</ul>
			<input class="selected_category" type="hidden" name="category_id" value="0" />
		</div>
		<input type="text" name="search" value="<?php echo $search; ?>" placeholder="<?php echo $text_search; ?>" class="form-control input-lg" />
		<span class="search_button input-group-btn">
			<button type="button" class="search-button btn btn-default btn-lg search_button">
				<i class="fa fa-search"></i>
			</button>
		</span>
	</div>
	<script type="text/javascript">
	$('.search a').click(function(){
		$(".selected_category").val($(this).attr('class'));
		$('.change_category_button').html('<span class="category-name">' + $(this).html() + '</span><i class="fa fa-chevron-down"></i>');
	});
	</script>
<?php } else { ?>
	<div class="search input-group">
		<input type="text" name="search" value="<?php echo $search; ?>" placeholder="<?php echo $text_search; ?>" class="form-control input-lg" />
		<input class="selected_category" type="hidden" name="category_id" value="0" />
		<span class="input-group-btn">
			<button type="button" class="search-button btn btn-default btn-lg search_button"><i class="fa fa-search"></i></button>
		</span>
	</div>
<?php } ?>