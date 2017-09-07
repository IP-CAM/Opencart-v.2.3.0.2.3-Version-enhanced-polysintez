<div id="cart" class="btn-group show-on-hover w100">
	<?php if ($setting_header_cart['type'] == 'standart') { ?>
		<button type="button" class="cart dropdown-toggle hidden-xs hidden-sm" data-toggle="dropdown">
			<span id="cart-total"><?php echo $text_items; ?></span>
			<span class="icorightmenu"><i class="fa fa-chevron-down"></i></span>
		</button>
		<button class="cart hidden-md hidden-lg" onclick="get_revpopup_cart('', 'show_cart', '');">
			<span id="cart-total-popup"><?php echo $text_items; ?></span>
		</button>
	<?php } else if ($setting_header_cart['type'] == 'redirect') { ?>
		<button class="cart" onclick="get_revpopup_cart('', 'redirect_cart', '');">
			<span id="cart-total"><?php echo $text_items; ?></span>
		</button>
	<?php } else { ?>
		<button class="cart" onclick="get_revpopup_cart('', 'show_cart', '');">
			<span id="cart-total"><?php echo $text_items; ?></span>
		</button>
	<?php } ?>
	<?php if ($setting_header_cart['type'] == 'standart') { ?>
	<ul class="dropdown-menu pull-right hidden-xs hidden-sm">
    <?php if ($products || $vouchers) { ?>
    <li>
      <table class="table display-products-cart porder">
        <?php foreach ($products as $product) { ?>
        <tr>
          <td class="image"><?php if ($product['thumb']) { ?>
            <a href="<?php echo $product['href']; ?>"><img src="<?php echo $product['thumb']; ?>" alt="<?php echo $product['name']; ?>" title="<?php echo $product['name']; ?>" /></a>
            <?php } ?></td>
          <td class="name"><a href="<?php echo $product['href']; ?>"><?php echo $product['name']; ?></a>
            <?php if ($product['option']) { ?>
            <?php foreach ($product['option'] as $option) { ?>
            <br />
            - <small><?php echo $option['name']; ?> <?php echo $option['value']; ?></small>
            <?php } ?>
            <?php } ?>
            <?php if ($product['recurring']) { ?>
            <br />
            - <small><?php echo $text_recurring; ?> <?php echo $product['recurring']; ?></small>
            <?php } ?></td>
			<td class="qt">
				<div class="number">
					<div class="frame-change-count">
						<div class="btn-plus">
							<button type="button" onclick="cart.update('<?php echo $product['cart_id']; ?>', parseFloat($(this).parent().parent().next().val())+1);">+</button>
						</div>
						<div class="btn-minus">
							<button type="button" onclick="cart.update('<?php echo $product['cart_id']; ?>', parseFloat($(this).parent().parent().next().val())-1);">-</button>
						</div>
					</div>
					<input type="text" name="quantity[<?php echo $product['cart_id']; ?>]" value="<?php echo $product['quantity']; ?>" onchange="cart.update('<?php echo $product['cart_id']; ?>', $(this).val());" size="1" class="plus-minus" /> 
				</div>
			</td>
          <td class="totals"><?php echo $product['total']; ?></td>
          <td class="remove"><button type="button" onclick="cart.remove('<?php echo $product['cart_id']; ?>');" title="<?php echo $button_remove; ?>"><i class="fa fa-trash-o"></i></button></td>
        </tr>
        <?php } ?>
        <?php foreach ($vouchers as $voucher) { ?>
        <tr>
          <td class="text-center"></td>
          <td class="text-left"><?php echo $voucher['description']; ?></td>
          <td class="text-right">x&nbsp;1</td>
          <td class="text-right"><?php echo $voucher['amount']; ?></td>
          <td class="text-center remove"><button type="button" onclick="voucher.remove('<?php echo $voucher['key']; ?>');" title="<?php echo $button_remove; ?>"><i class="fa fa-trash-o"></i></button></td>
        </tr>
        <?php } ?>
      </table>
    </li>
    <li>
        <div class="all-total">
		  <?php foreach ($totals as $total) { ?>
			<div class="clear-total">
			<div class="totals-right"><?php echo $total['text']; ?></div>
			<div class="totals-left"><?php echo $total['title']; ?>:</div>     
			</div>
		  <?php } ?>
		</div>
		<div class="cartfooter">
			<!--<a class="btn btn-default" href="<?php echo $cart; ?>"><?php echo $text_cart; ?></a>-->
			<a class="btn btn-danger" href="<?php echo $checkout; ?>"><?php echo $text_checkout; ?></a>
		</div>
    </li>
    <?php } else { ?>
    <li>
      <p class="text-center"><?php echo $text_empty; ?></p>
    </li>
    <?php } ?>
  </ul>
  <?php } ?>
</div>