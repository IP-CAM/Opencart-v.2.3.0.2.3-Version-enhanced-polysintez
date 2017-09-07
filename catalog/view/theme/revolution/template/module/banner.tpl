<div id="banner<?php echo $module; ?>" class="owl-carousel">
  <?php foreach ($banners as $banner) { ?>
  <div class="item" style="text-align: center;">
    <?php if ($banner['link']) { ?>
    <a class="banner_name_hide banner_name_hide_<?php echo $module; ?>" href="<?php echo $banner['link']; ?>">
	<span style="display:block;padding-bottom:10px;"><?php echo $banner['title']; ?></span>
	<img src="<?php echo $banner['image']; ?>" alt="<?php echo $banner['title']; ?>" class="img-responsive" />
	</a>
    <?php } else { ?>
	<span class="banner_name_hide banner_name_hide_<?php echo $module; ?>" style="display:block;padding-bottom:10px;"><?php echo $banner['title']; ?></span>
    <img src="<?php echo $banner['image']; ?>" alt="<?php echo $banner['title']; ?>" class="img-responsive" />
    <?php } ?>
  </div>
  <?php } ?>
</div>
<script type="text/javascript"><!--
$('#banner<?php echo $module; ?>').owlCarousel({
	items: 6,
	<?php if (count($banners) > 1) { ?>
	autoPlay: true,
	<?php } ?>
	singleItem: true,
	navigation: false,
	pagination: false,
	transitionStyle: 'fade'
});
--></script>
