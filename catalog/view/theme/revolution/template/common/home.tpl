<?php echo $header; ?>
<div id="top5" class="clearfix">
<?php if ($slideshow) { ?>
<div id="top4" class="clearfix">
	<?php if (($setting_home_slideshow['allwide'] && !$amazon) || ($setting_home_slideshow['allwide'] && $amazon && !$allwide)) { ?>
	<?php } else { ?>
	<div class="container">
		<div class="row">
		<?php } ?>
			<?php if ($allwide && $amazon) { ?>
				<?php if ($h1_home) { ?>
					<div class="col-md-offset-3"><h1 class="home_h1"><?php echo $h1_home; ?></h1></div>
				<?php } ?>
				<div class="hidden-xs hidden-sm col-md-3"></div>
				<div class="col-sm-12 col-md-9"><?php echo $slideshow; ?></div>
			<?php } else { ?>
				<?php if ($h1_home) { ?>
					<h1 class="home_h1"><?php echo $h1_home; ?></h1>
				<?php } ?>	
				<div class="col-sm-12 col-md-12"><?php echo $slideshow; ?></div>
			<?php } ?>
		<?php if (($setting_home_slideshow['allwide'] && !$amazon) || ($setting_home_slideshow['allwide'] && $amazon && !$allwide)) { ?>
		<?php } else { ?>
		</div>
	</div>
	<?php } ?>
</div>
<?php } else { ?>
	<?php if ($h1_home) { ?>
		<div class="container">
			<div class="row">
				<?php if ($allwide && $amazon) { ?>
				<div class="hidden-xs hidden-sm col-md-offset-3"><h1 class="home2_h1"><?php echo $h1_home; ?></h1></div>
				<?php } else { ?>
				<div class="hidden-xs hidden-sm"><h1 class="home2_h1"><?php echo $h1_home; ?></h1></div>
				<?php } ?>
			</div>
		</div>
	<?php } ?>
<?php } ?>
<?php if ($blocks) { ?>
<div id="top6" class="clearfix">
	<div class="container">
		<div class="row">
			<?php echo $blocks; ?>
		</div>
	</div>
</div>	
<?php } else { ?>
<?php if ($allwide && $amazon) { ?>
<div style="height:70px; width:100%; clear:both"></div>
<?php } else { ?>
<div style="height:30px; width:100%; clear:both"></div>
<?php } ?>
<?php } ?>
</div>

<div class="container">
	<div class="row">
	<?php echo $column_left; ?>
	
	<?php if ($column_left && $column_right) { ?>
	<?php $class = 'col-sm-6'; ?>
	<?php } elseif ($column_left || $column_right) { ?>
	<?php $class = 'col-sm-9'; ?>
	<?php } else { ?>
	<?php $class = 'col-sm-12'; ?>
	<?php } ?>
	
	<div id="content" class="<?php echo $class; ?>">
	
	<?php echo $content_top; ?>
	
	<?php echo $revcategorywall; ?>
	<?php echo $ptabs; ?>
	<?php echo $pbest; ?>
	<?php echo $pspec; ?>
	<?php echo $plast; ?>
	<?php echo $slider_1; ?>
	<?php echo $slider_2; ?>
	<?php echo $slider_3; ?>
	<?php echo $slider_4; ?>
	<?php echo $slider_5; ?>
	
	<?php if ($blog) { ?>
	</div>
	</div>
	</div>
	<div id="top7" class="clearfix">
	<div class="container">
	<?php echo $blog; ?>
	</div>
	</div>
	<div class="container">
	<div class="row">
	<div class="col-sm-12">
	<?php } ?>

	<?php if ($aboutstore) { ?>
	<?php if ($socv || ($socvinsta && $right_insta)) {$aboutclass1="col-sm-12 col-md-8 col-lg-9 aboutstore";$aboutclass2="col-sm-12 col-md-4 col-lg-3";} else {$aboutclass1="col-sm-12 aboutstore2";$aboutclass2="";} ?>
	<div class="row">
	<div class="<?php echo $aboutclass1; ?>">
	<?php echo $aboutstore; ?>
	<?php if (!$right_insta) { ?>
	<?php echo $socvinsta; ?>
	<?php } ?>
	</div>
	<div class="<?php echo $aboutclass2; ?>">
	<?php echo $socv; ?>
	<?php if ($right_insta) { ?>
	<?php echo $socvinsta; ?>
	<?php } ?>
	</div>
	</div>
	<?php } ?>
	
	<?php echo $storereview; ?>
	<?php echo $viewed_products; ?>
	
	<?php echo $content_bottom; ?>
	
	</div>
	<?php echo $column_right; ?>
	</div>
</div>

<?php echo $footer; ?>