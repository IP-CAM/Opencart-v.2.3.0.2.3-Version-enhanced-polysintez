<div class="rev_slider rev_blog_mod_n_<?php echo $module; ?>">
	<?php if ($heading_title) { ?>
		<h3><?php echo $heading_title; ?></h3>
	<?php } ?>
	<div class="row">
		<div id="blog_mod">
			<?php foreach ($blogs as $blog) { ?>
			<div class="col-lg-12">
				<div class="blog-list vertical-sreview transition">
					<div class="caption review-caption">
						<?php if ($image_status) { ?>
						<div class="image">
							<a href="<?php echo $blog['href']; ?>"><img class="img-responsive" src="<?php echo $blog['thumb']; ?>" alt="<?php echo $blog['title']; ?>" title="<?php echo $blog['title']; ?>" /></a>
						</div>
						<?php } ?>
						<div class="opisb">
						<h4><a href="<?php echo $blog['href']; ?>"><?php echo $blog['title']; ?></a></h4>
						<?php if ($data_status) { ?><p><i class="fa fa-clock-o"></i><?php echo $blog['data_added']; ?></p><?php } ?>
						</div>
						<div class="description"><?php echo $blog['description']; ?></div>
					</div>
				</div>
			</div>
			<?php } ?>
		</div>
	</div>
	<?php if ($slider) { ?>
	<script type="text/javascript"><!--
		$(".n_<?php echo $module; ?> #blog_mod").owlCarousel({
			responsiveBaseWidth: '.n_<?php echo $module; ?> #blog_mod',
			itemsCustom: [[0, 1], [750, 2], [970, 3], [1170, 3]],
			mouseDrag: true,
			touchDrag: true,
			navigation: true,
			navigationText: ['<i class="fa fa-chevron-left"></i>', '<i class="fa fa-chevron-right"></i>'],
			<?php if ($heading_title) { ?>
			pagination: true
			<?php } else { ?>
			pagination: false
			<?php } ?>
		});
	//--></script>
	<?php } ?>
	<style>
	<?php if (!$image_status) { ?>
	.rev_blog_mod_n_<?php echo $module; ?> #blog_mod .blog-list .opisb {margin-left: 0; min-height: initial;}
	<?php } ?>
	<?php if (!$heading_title) { ?>
	.rev_slider.rev_blog_mod_n_<?php echo $module; ?> {border-top: none; padding-top: 0; margin-top: 0;}
	#content .rev_slider.rev_blog_mod_n_<?php echo $module; ?> {margin-top: 0; margin-bottom: 12px;}
	<?php } else { ?>
	.rev_slider.rev_blog_mod_n_<?php echo $module; ?> {margin-top: 12px; padding-top: 10px;}
	<?php } ?>
	<?php if (!$slider) { ?>
	.rev_blog_mod_n_<?php echo $module; ?> .vertical-sreview {border: none; margin-bottom: 0; overflow: auto; border-radius: 0;}
	.rev_blog_mod_n_<?php echo $module; ?> #blog_mod .product-layout + .product-layout .vertical-sreview {border-top: 1px solid #dddddd;}
	<?php } else if ($slider && !$heading_title) { ?>
	.rev_slider.rev_blog_mod_n_<?php echo $module; ?> {margin-top: 0px; padding-top: 0px;}
	<?php } else { ?>
	.rev_slider.rev_blog_mod_n_<?php echo $module; ?> {margin-top: 25px; padding-top: 25px;}
	#content .rev_slider.rev_blog_mod_n_<?php echo $module; ?> {margin-top: 12px; margin-bottom: 12px;}
	<?php } ?>
	</style>
</div>