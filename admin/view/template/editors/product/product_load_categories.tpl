<?php if ($product_categories) { ?>
  <?php foreach ($product_categories as $product_category) { ?>
    <div class="text-left"><?php echo $product_category['name']; ?></div>
  <?php } ?>
  <?php } else { ?>
  <div class="text-left"><?php echo $text_without; ?></div>
<?php } ?>