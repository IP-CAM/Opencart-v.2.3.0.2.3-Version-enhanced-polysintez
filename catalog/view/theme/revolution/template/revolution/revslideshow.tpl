<div id="revslideshow" class="owl-carousel banners" style="opacity: 1;">
  <?php foreach ($banners as $banner) { ?>
  <div class="item">
    <?php if ($banner['link']) { ?>
    <a href="<?php echo $banner['link']; ?>"><img src="<?php echo $banner['image']; ?>" alt="<?php echo $banner['title']; ?>" class="img-responsive" /></a>
    <?php } else { ?>
    <img src="<?php echo $banner['image']; ?>" alt="<?php echo $banner['title']; ?>" class="img-responsive" />
    <?php } ?>
  </div>
  <?php } ?>
</div>
<?php if ($slides > 1) { ?>
<style>
#revslideshow.owl-carousel .owl-item:hover .img-responsive {
opacity: 0.9;
}
</style>
<?php } ?>
<script type="text/javascript"><!--
$('#revslideshow').owlCarousel({
	itemsCustom: [[0, 1], [375, 1], [750, <?php echo $slides; ?>], [970, <?php echo $slides; ?>], [1170, <?php echo $slides; ?>]],
	responsiveBaseWidth: '#revslideshow',
    stopOnHover : true,
	navigation: true,
	navigationText: ['<i class="fa fa-chevron-left fa-5x"></i>', '<i class="fa fa-chevron-right fa-5x"></i>'],
	pagination: false,
	<?php if ($autoscroll) { ?>
		autoPlay: <?php echo $autoscroll; ?>*1000,
	<?php } ?>
});
--></script>