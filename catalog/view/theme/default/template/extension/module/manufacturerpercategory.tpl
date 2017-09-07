<?php if (isset($manufactureres) && count($manufactureres)) { ?>
<h3><?php echo $heading_title; ?></h3>
<div class="row">
	<?php foreach ($manufactureres as $manufacturer) { ?>
		<div class="col-md-2 col-sm-3 col-xs-6">
	<div class="product-thumb transition">
<div class="image"><a data-toggle="tooltip" title="<?php echo $manufacturer['name']; ?>" href="<?php echo $manufacturer['href']; ?>"><img src="<?php echo $manufacturer['thumb']; ?>" title="<?php echo $manufacturer['name']; ?>" alt="<?php echo $manufacturer['name']; ?>" /></a></div>
		</div>
	</div>
    <?php } ?>
</div>
<?php } ?>
