<?php foreach ($products as $product) { ?>
  <tr>
    <?php if ($order_product) { ?><td class="text-center"><a onclick="deleteProduct('<?php echo $product['order_product_id']; ?>', '<?php echo $order_id; ?>');" class="btn btn-danger" data-toggle="tooltip" title="<?php echo $button_delete; ?>"><i class="fa fa-trash-o"></i></a></td><?php } ?>
	<td class="text-center"><img src="<?php echo $product['thumb']; ?>" alt="<?php echo $product['name']; ?>" class="img-thumbnail" /></td>
	<td class="text-left">
	<?php if ($order_product_name) { ?>
	  <a data-toggle="popover-maxy" data-target="#order-product-name-<?php echo $product['order_product_id']; ?>" data-placement="right right-top" class="btn btn-link btn-sm"><?php echo $product['name']; ?></a>
	  <div id="order-product-name-<?php echo $product['order_product_id']; ?>" class="popover popover-md popover-primary animate littleFadeInRight">
		<div class="arrow"></div><h3 class="popover-title"><?php echo $column_product; ?>
		<a id="close-name-<?php echo $product['order_product_id']; ?>" data-dismiss="popover-maxy" class="btn btn-default btn-xs"><i class="fa fa-close"></i></a></h3>
		<div class="popover-content">
		  <input type="text" name="name" value="<?php echo $product['name']; ?>" placeholder="<?php echo $column_product; ?>" class="form-control" />
		</div>
		<div class="popover-footer">
		  <a onclick="updateOrderProductTitle('<?php echo $product['order_product_id']; ?>', '<?php echo $order_id; ?>', 'name');" class="btn btn-primary btn-sm"><i class="fa fa-save fa-fw"></i></a><a onclick="orderClear('<?php echo $product['order_product_id']; ?>', 'name');" class="btn btn-danger btn-sm"><i class="fa fa-eraser fa-fw"></i></a>
		</div>
	  </div>
	  <?php } else { ?>
	  <?php echo $product['name']; ?>
	<?php } ?>
      <?php foreach ($product['option'] as $option) { ?>
        <br />
        <?php if ($option['type'] != 'file') { ?>
          &nbsp;<small> - <?php echo $option['name']; ?>: <?php echo $option['value']; ?></small>
          <?php } else { ?>
          &nbsp;<small> - <?php echo $option['name']; ?>: <a href="<?php echo $option['href']; ?>"><?php echo $option['value']; ?></a></small>
        <?php } ?>
      <?php } ?>
	</td>
    <td class="text-left">
	<?php if ($order_product_model) { ?>
	  <a data-toggle="popover-maxy" data-target="#order-product-model-<?php echo $product['order_product_id']; ?>" data-placement="right right-top" class="btn btn-link btn-sm"><?php echo $product['model_format']; ?></a>
	  <div id="order-product-model-<?php echo $product['order_product_id']; ?>" class="popover popover-primary animate littleFadeInRight">
		<div class="arrow"></div><h3 class="popover-title"><?php echo $column_product; ?>
		<a id="close-model-<?php echo $product['order_product_id']; ?>" data-dismiss="popover-maxy" class="btn btn-default btn-xs"><i class="fa fa-close"></i></a></h3>
		<div class="popover-content">
		  <input type="text" name="model" value="<?php echo $product['model']; ?>" placeholder="<?php echo $column_product; ?>" class="form-control" />
		</div>
		<div class="popover-footer">
		  <a onclick="updateOrderProductTitle('<?php echo $product['order_product_id']; ?>', '<?php echo $order_id; ?>', 'model');" class="btn btn-primary btn-sm"><i class="fa fa-save fa-fw"></i></a><a onclick="orderClear('<?php echo $product['order_product_id']; ?>', 'model');" class="btn btn-danger btn-sm"><i class="fa fa-eraser fa-fw"></i></a>
		</div>
	  </div>
	  <?php } else { ?>
	  <?php echo $product['model_format']; ?>
	<?php } ?>
	</td>
    <td class="text-right">
	<?php if ($order_product_quantity) { ?>
	  <a data-toggle="popover-maxy" data-target="#order-product-quantity-<?php echo $product['order_product_id']; ?>" data-placement="left left-top" class="btn btn-default btn-sm"><?php echo $product['quantity']; ?></a>
	  <div id="order-product-quantity-<?php echo $product['order_product_id']; ?>" class="popover popover-primary animate littleFadeInLeft">
		<div class="arrow"></div><h3 class="popover-title"><?php echo $column_quantity; ?>
		<a id="close-quantity-<?php echo $product['order_product_id']; ?>" data-dismiss="popover-maxy" class="btn btn-default btn-xs"><i class="fa fa-close"></i></a></h3>
		<div class="popover-content">
		  <input type="number" name="quantity" value="<?php echo $product['quantity']; ?>" placeholder="<?php echo $column_quantity; ?>" class="form-control" />
		</div>
		<div class="popover-footer">
		  <a onclick="updateOrderProduct('<?php echo $product['order_product_id']; ?>', '<?php echo $order_id; ?>', 'quantity');" class="btn btn-primary btn-sm"><i class="fa fa-save fa-fw"></i></a><a onclick="orderClear('<?php echo $product['order_product_id']; ?>', 'quantity');" class="btn btn-danger btn-sm"><i class="fa fa-eraser fa-fw"></i></a>
		</div>
	  </div>
	  <?php } else { ?>
	  <?php echo $product['quantity']; ?>
	<?php } ?>
	</td>
    <td class="text-right">
	<?php if ($order_product_price) { ?>
	  <a data-toggle="popover-maxy" data-target="#order-product-price-<?php echo $product['order_product_id']; ?>" data-placement="left left-top" class="btn btn-default btn-sm"><?php echo $product['price']; ?></a>
	  <div id="order-product-price-<?php echo $product['order_product_id']; ?>" class="popover popover-primary animate littleFadeInLeft">
		<div class="arrow"></div><h3 class="popover-title"><?php echo $column_price; ?>
		<a id="close-price-<?php echo $product['order_product_id']; ?>" data-dismiss="popover-maxy" class="btn btn-default btn-xs"><i class="fa fa-close"></i></a></h3>
		<div class="popover-content">
		  <input type="number" name="price" value="<?php echo $product['price_format']; ?>" placeholder="<?php echo $column_price; ?>" class="form-control" />
		</div>
		<div class="popover-footer">
		  <a onclick="updateOrderProduct('<?php echo $product['order_product_id']; ?>', '<?php echo $order_id; ?>', 'price');" class="btn btn-primary btn-sm"><i class="fa fa-save fa-fw"></i></a><a onclick="orderClear('<?php echo $product['order_product_id']; ?>', 'price');" class="btn btn-danger btn-sm"><i class="fa fa-eraser fa-fw"></i></a>
		</div>
	  </div>
	  <?php } else { ?>
	  <?php echo $product['price']; ?>
	<?php } ?>
	</td>
    <td class="text-right">
	<?php if ($order_product_total) { ?>
	  <a data-toggle="popover-maxy" data-target="#order-product-total-<?php echo $product['order_product_id']; ?>" data-placement="left left-top" class="btn btn-default btn-sm"><?php echo $product['total']; ?></a>
	  <div id="order-product-total-<?php echo $product['order_product_id']; ?>" class="popover popover-primary animate littleFadeInLeft">
		<div class="arrow"></div><h3 class="popover-title"><?php echo $column_total; ?>
		<a id="close-total-<?php echo $product['order_product_id']; ?>" data-dismiss="popover-maxy" class="btn btn-default btn-xs"><i class="fa fa-close"></i></a></h3>
		<div class="popover-content">
		  <input type="number" name="total" value="<?php echo $product['total_format']; ?>" placeholder="<?php echo $column_total; ?>" class="form-control" />
		</div>
		<div class="popover-footer">
		  <a onclick="updateOrderProduct('<?php echo $product['order_product_id']; ?>', '<?php echo $order_id; ?>', 'total');" class="btn btn-primary btn-sm"><i class="fa fa-save fa-fw"></i></a><a onclick="orderClear('<?php echo $product['order_product_id']; ?>', 'total');" class="btn btn-danger btn-sm"><i class="fa fa-eraser fa-fw"></i></a>
		</div>
	  </div>
	  <?php } else { ?>
	  <?php echo $product['total']; ?>
	<?php } ?>
	</td>
  </tr>
<?php } ?>
<?php foreach ($vouchers as $voucher) { ?>
  <tr>
    <?php if ($order_product) { ?><td></td><?php } ?>
	<td class="text-left" colspan="2"><a href="<?php echo $voucher['href']; ?>"><?php echo $voucher['description']; ?></a></td>
    <td></td>
    <td class="text-right">1</td>
    <td class="text-right"><?php echo $voucher['amount']; ?></td>
    <td class="text-right"><?php echo $voucher['amount']; ?></td>
  </tr>
<?php } ?>
<?php foreach ($totals as $total) { ?>
  <tr>
    <td colspan="<?php if ($order_product) { ?>6<?php } else { ?>5<?php } ?>" class="text-right"><?php echo $total['title']; ?></td>
    <td class="text-right"><?php echo $total['text']; ?></td>
  </tr>
<?php } ?>