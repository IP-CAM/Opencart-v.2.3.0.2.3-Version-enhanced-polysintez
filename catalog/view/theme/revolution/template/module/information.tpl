<div class="list-group">
	<?php foreach ($informations as $information) { ?>
		<a class="list-group-item" href="<?php echo $information['href']; ?>"><?php echo $information['title']; ?></a>
	<?php } ?>
	<a class="list-group-item" href="<?php echo $contact; ?>"><?php echo $text_contact; ?></a>
	<a class="list-group-item" href="<?php echo $sitemap; ?>"><?php echo $text_sitemap; ?></a>
</div>