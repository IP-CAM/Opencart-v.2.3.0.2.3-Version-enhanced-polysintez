</div>
</div>
</div>
<div class="custom_footer">
<div class="container">
<div class="row">
<div class="col-sm-3">
  <?php if ($logo) { ?><img src="<?php echo $logo; ?>" title="<?php echo $name; ?>" alt="<?php echo $name; ?>" class="logo img-responsive" /><?php } ?>
  <?php if ($welcome) { ?><?php echo $welcome; ?><?php } ?>
</div>
<div class="col-sm-3">
  <ul class="list-unstyled">
  <?php if ($telephone) { ?><li><i class="fa fa-phone"></i> <?php echo $telephone; ?></li><?php } ?>
  <?php if ($telephone2) { ?><li><i class="fa fa-phone"></i> <?php echo $telephone2; ?></li><?php } ?>
  <?php if ($telephone3) { ?><li><i class="fa fa-phone"></i> <?php echo $telephone3; ?></li><?php } ?>
  <?php if ($email) { ?><li><i class="fa fa-envelope"></i> <?php echo $email; ?></li><?php } ?>
  <?php if ($address) { ?><li><i class="fa fa-home"></i> <?php echo $address; ?></li><?php } ?>
  <?php if ($time) { ?>
  <li class="footer-time"><i class="fa fa-clock-o fa-lg"></i> </li>
  <li><?php echo $time; ?></li>
  <?php } ?>
  <li class="social">
	   <?php if ($vk) { ?><a target="_blank" href="<?php echo $vk; ?>"><i class="fa fa-vk"></i></a><?php } ?>
	   <?php if ($fb) { ?><a target="_blank" href="<?php echo $fb; ?>"><i class="fa fa-facebook"></i></a><?php } ?>
	   <?php if ($googleplus) { ?><a target="_blank" href="<?php echo $googleplus; ?>"><i class="fa fa-google-plus"></i></a><?php } ?>
	   <?php if ($youtube) { ?><a target="_blank" href="<?php echo $youtube; ?>"><i class="fa fa-youtube"></i></a><?php } ?>
	   <?php if ($twitter) { ?><a target="_blank" href="<?php echo $twitter; ?>"><i class="fa fa-twitter"></i></a><?php } ?>
  </li>
  </ul>
</div>
<div class="col-sm-6">
  <?php if ($maps) { ?>
  <ul class="list-unstyled">
  <li class="maps">
  <?php echo $maps; ?>
  </li>
  </ul>
  <?php } ?>
</div>
</div>
</div>
</div>
