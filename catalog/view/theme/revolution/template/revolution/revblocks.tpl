<?php if ($blocks) { ?>
	<?php foreach ($blocks as $block) { ?>
		<div class="home_block hidden-xs col-sm-4 col-md-3 col-lg-3">
			<?php if ($block['link']) { ?>
			<a href="<?php echo $block['link']; ?>" <?php if ($block['checkbox']) { ?>class="popup_html_content"<?php } ?>>
			<?php } ?>
				<div class="image <?php echo $block['style']; ?>"><?php echo $block['image']; ?></div>
				<div class="text">
					<?php if ($block['title']) { ?>
						<span class="title"><?php echo $block['title']; ?></span>
					<?php } ?>
					<?php if ($block['description']) { ?>
						<p><?php echo $block['description']; ?></p>
					<?php } ?>
				</div>
			<?php if ($block['link']) { ?>
			</a>
			<?php } ?>
		</div>
	<?php } ?>
	<?php if ($amazon && $module_class) { ?>
	<script><!--
	$('.home_block').filter(function(i){if (!(i%3)) $(this).removeClass().addClass('home_block hidden-xs col-sm-4 col-md-3 col-lg-3 col-md-offset-3 col-lg-offset-3')})
	--></script>
	<?php } ?>
<?php } ?>