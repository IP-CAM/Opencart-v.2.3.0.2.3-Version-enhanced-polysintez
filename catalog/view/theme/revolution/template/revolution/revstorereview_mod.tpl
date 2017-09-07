<?php if($heading_title) { ?>
<div class="rev_slider">
<?php } else { ?>
<div class="rev_slider_2">
<?php } ?>
	<h3><?php echo $heading_title; ?></h3>
	<div class="row">
		<div id="reviews_mod">
			<?php foreach ($reviews as $review) { ?>
			<div class="product-layout col-lg-12">
				<div class="review-list vertical-sreview transition">
					<div class="caption review-caption">
						<div class="author"><?php echo $review['author']; ?><span> / <?php echo $review['date_added']; ?></span></div>
						<div class="rating">
							<?php for ($i = 1; $i <= 5; $i++) { ?>
								<?php if ($review['rating'] < $i) { ?>
									<span class="fa fa-stack"><i class="fa fa-star-o fa-stack-2x"></i></span>
								<?php } else { ?>
									<span class="fa fa-stack"><i class="fa fa-star fa-stack-2x"></i></span>
								<?php } ?>
							<?php } ?>
						</div>
						<div class="text2"><?php echo $review['text']; ?></div>
					</div>
				</div>
			</div>
			<?php } ?>
		</div>
	</div>
	<?php if($button_all){ ?>
		<div class="vertical-sreview-all"><a href="<?php echo $keyword; ?>"><?php echo $button_all_text; ?></a></div>
	<?php } ?>
	<script type="text/javascript"><!--
		$("#reviews_mod").owlCarousel({
			responsiveBaseWidth: '#reviews_mod',
			itemsCustom: [[0, 1], [750, 2], [970, 3], [1170, 3]],
			mouseDrag: true,
			touchDrag: true,
			navigation: true,
			navigationText: ['<i class="fa fa-chevron-left"></i>', '<i class="fa fa-chevron-right"></i>'],
			<?php if (!$heading_title) { ?>
			pagination: false
			<?php } ?>
		});
	//--></script>
</div>
