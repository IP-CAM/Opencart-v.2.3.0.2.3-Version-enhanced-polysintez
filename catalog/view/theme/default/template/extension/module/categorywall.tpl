<?php if (count($categories)) { ?>
	<?php if ($cover_status) { ?>
		<div class="row categorywall <?php if ($cover_status) echo 'covers'; ?>">
		  <?php foreach ($categories as $category) { ?>
				<div class="col-lg-3 col-md-3 col-sm-6 col-xs-12">
					<div class="categorywall_thumbnail">
							<?php if ($category['children']) { ?>
							<div class="caption">
								<ul>
								<?php foreach ($category['children'] as $child) { ?>
								<li>
								<a href="<?php echo $child['href']; ?>"><?php echo $child['name']; ?></a>
								</li>
								<?php } ?>
								</ul>
							 </div>	
							<?php } ?>
						
					   
						<!--noindex--><a rel="nofollow" href="<?php echo $category['href']; ?>"><img class="img-responsive" src="<?php echo $category['image']; ?>"></a><!--/noindex-->
						<a class="category_name<?php if ($category['children']) echo ' parent'; ?>" href="<?php echo $category['href']; ?>"><?php echo $category['name']; ?></a>
					</div>
			  </div>  
		 <?php } ?>

		</div>
		<script>
		$( document ).ready(function() {

			$('.categorywall_thumbnail').hover(
				function(){
					$(this).find('.caption').slideDown(200); //.fadeIn(250)
				},
				function(){
					$(this).find('.caption').slideUp(200); //.fadeOut(205)
				}
			); 
		});
		</script>
	<?php }  else { ?>	
		<div class="row categorywall wide">
			  <?php foreach ($categories as $category) { ?>
					<div class="col-lg-3 col-md-3 col-sm-6 col-xs-12">
					<div class="product-thumb transition">
						<div class="categorywall_thumbnail <?php if ($category['children']) echo ' half'; ?>">
							<a class="category_name" href="<?php echo $category['href']; ?>"><?php echo $category['name']; ?></a>
							<div class="clearfix"></div>
							<!--noindex--><a rel="nofollow" href="<?php echo $category['href']; ?>"><img class="img-responsive" src="<?php echo $category['image']; ?>"></a><!--/noindex-->
							<?php if ($category['children']) { ?>
							<div class="children">
									<ul>
									<?php foreach ($category['children'] as $child) { ?>
									<li>
									<a href="<?php echo $child['href']; ?>"><?php echo $child['name']; ?><span class="sub"><i class="fa fa-angle-right"></i></span></a>
									</li>
									<?php } ?>
									</ul>
							</div>	
						<?php } ?>
						</div>
				  </div>  
				  </div>  
			 <?php } ?>
		</div>
	<?php } ?> 
<?php } ?> 

<script>
$( document ).ready(function() {
	cols = $('#column-right, #column-left').length;
	
	if (cols == 2) {
		$('.categorywall > ').attr('class', 'col-lg-6 col-md-6 col-sm-12 col-xs-12');
	} else if (cols == 1) {
		$('.categorywall > div').attr('class', 'col-lg-4 col-md-4 col-sm-6 col-xs-6');
	};
			
});
</script>