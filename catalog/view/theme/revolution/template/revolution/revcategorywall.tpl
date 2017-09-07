<?php if ($heading_title) { ?>
<div class="rev_slider">
<?php } else { ?>
<div class="rev_slider_2">
<?php } ?>
    <h3><?php echo $heading_title; ?></h3>
	<div class="row">
		<?php foreach ($categories as $category) { ?>
			<div class="product-layout col-lg-3 col-md-3 col-sm-4 col-xs-12">
				<div class="product-thumb transition">
					<div class="image"><a href="<?php echo $category['href']; ?>"><img src="<?php echo $category['image']; ?>" alt="<?php echo $category['name']; ?>" title="<?php echo $category['name']; ?>" class="img-responsive" /></a></div>
					<div class="caption clearfix">
						<h4><a style="text-decoration: none" href="<?php echo $category['href']; ?>"><?php echo $category['name']; ?></a></h4>
					</div> 
				</div>
			</div>
		<?php } ?>
	</div>
</div>