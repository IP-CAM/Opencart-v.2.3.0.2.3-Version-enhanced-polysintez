<div id="popup-okno">
<div id="popup-okno-inner">
<?php if ($products) { ?>
  <div class="popup-heading"><?php echo $heading_cartpopup_title; ?></div>
  <div class="popup-center">
    <?php if ($attention) { ?>
    <div class="alert alert-info"><i class="fa fa-info-circle"></i> <?php echo $attention; ?>
      <button type="button" class="close" data-dismiss="alert">&times;</button>
    </div>
    <?php } ?>
    <?php if ($success) { ?>
    <div class="alert alert-success"><i class="fa fa-check-circle"></i> <?php echo $success; ?>
      <button type="button" class="close" data-dismiss="alert">&times;</button>
    </div>
    <?php } else { ?>
    <div id="success-message"></div>
    <?php } ?>
    <?php if ($error_warning) { ?>
    <div class="alert alert-danger"><i class="fa fa-exclamation-circle"></i> <?php echo $error_warning; ?>
      <button type="button" class="close" data-dismiss="alert">&times;</button>
    </div>
    <?php } ?>
    <table class="display-products-cart">
      <tbody>
        <?php foreach ($products as $product) { ?>
        <tr>
          <td class="image">
            <?php if ($product['thumb']) { ?>
            <a href="<?php echo $product['href']; ?>"><img src="<?php echo $product['thumb']; ?>" alt="<?php echo $product['name']; ?>" title="<?php echo $product['name']; ?>" class="img-thumbnail" /></a>
            <?php } ?>
          </td>
          <td class="name">
            <a href="<?php echo $product['href']; ?>"><?php echo $product['name']; ?></a>
            <?php if (!$product['stock']) { ?>
            <span class="text-danger">***</span>
            <?php } ?>
            <?php if ($product['option']) { ?>
            <?php foreach ($product['option'] as $option) { ?>
            <br />
            <?php echo $option['name']; ?>: <?php echo $option['value']; ?>
            <?php } ?>
            <?php } ?>
            <?php if ($product['reward']) { ?>
            <br />
            <?php echo $product['reward']; ?>
            <?php } ?>
          </td>
          <td class="qt">
            <div class="number">
              <input name="product_id" value="<?php echo $product['key']; ?>" style="display: none;" type="hidden" />
              <div class="frame-change-count">
                <div class="btn-plus">
                  <button type="button" onclick="$(this).parent().parent().next().val(~~$(this).parent().parent().next().val()+1); update( this, 'update' );">
                    +
                  </button>
                </div>
                <div class="btn-minus">
                  <button type="button" onclick="$(this).parent().parent().next().val(~~$(this).parent().parent().next().val()-1); update( this, 'update' );">
                    -
                  </button>
                </div>
              </div>
              <input type="text" name="quantity" value="<?php echo $product['quantity']; ?>" class="plus-minus" onchange="update_manual( this, '<?php echo $product['key']; ?>' ); return validate(this);" onkeyup="update_manual( this, '<?php echo $product['key']; ?>' ); return validate(this);" />
            </div>
          </td>
          <td class="totals"><?php echo $product['total']; ?></td>
		  <td class="remove">
            <button type="button" onclick="update( this, 'remove' );"><i class="fa fa-trash-o"></i></button>
            <input name="product_key" value="<?php echo $product['key']; ?>" style="display: none;" hidden />           
          </td>
        </tr>
        <?php } ?>
      </tbody>
    </table>
    <div class="mobile-products-cart">
    <?php foreach ($products as $product) { ?>
      <div>
        <div class="image">
          <?php if ($product['thumb']) { ?>
          <a href="<?php echo $product['href']; ?>"><img src="<?php echo $product['thumb']; ?>" alt="<?php echo $product['name']; ?>" title="<?php echo $product['name']; ?>" class="img-thumbnail" /></a>
          <?php } ?>
        </div>
        <div class="name">
          <a href="<?php echo $product['href']; ?>"><?php echo $product['name']; ?></a>
          <?php if (!$product['stock']) { ?>
          <span class="text-danger">***</span>
          <?php } ?>
          <?php if ($product['option']) { ?>
          <?php foreach ($product['option'] as $option) { ?>
          <br />
          <?php echo $option['name']; ?>: <?php echo $option['value']; ?>
          <?php } ?>
          <?php } ?>
          <?php if ($product['reward']) { ?>
          <br />
          <?php echo $product['reward']; ?>
          <?php } ?>
        </div>
        <div class="qt">
          <div class="number">
              <input name="product_id" value="<?php echo $product['key']; ?>" style="display: none;" type="hidden" />
              <div class="frame-change-count">
                <div class="btn-plus">
                  <button type="button" onclick="$(this).parent().parent().next().val(~~$(this).parent().parent().next().val()+1); update( this, 'update' );">
                    +
                  </button>
                </div>
                <div class="btn-minus">
                  <button type="button" onclick="$(this).parent().parent().next().val(~~$(this).parent().parent().next().val()-1); update( this, 'update' );">
                    -
                  </button>
                </div>
              </div>
              <input type="text" name="quantity" value="<?php echo $product['quantity']; ?>" class="plus-minus" onchange="update_manual( this, '<?php echo $product['key']; ?>' ); return validate(this);" onkeyup="update_manual( this, '<?php echo $product['key']; ?>' ); return validate(this);" />
            </div>
			<span class="remove">
			  <button type="button" onclick="update( this, 'remove' );"><i class="fa fa-trash-o"></i></button>
			  <input name="product_key" value="<?php echo $product['key']; ?>" style="display: none;" hidden />
			</span>
        </div>
        <div class="totals">
          <?php echo $product['total']; ?>
        </div>		
        </div>
      <?php } ?>
    </div>
    <div class="all-total">
      <?php foreach ($totals as $total) { ?>
		<div class="clear-total">
		<div class="totals-right"><?php echo $total['text']; ?></div>
        <div class="totals-left"><?php echo $total['title']; ?>:</div>     
        </div>
      <?php } ?>
    </div>    
  </div>
  <div class="popup-footer">
    <button onclick="$.magnificPopup.close();"><?php echo $button_shopping; ?></button>
    <a href="<?php echo $checkout_link; ?>"><?php echo $button_checkout; ?></a>
  </div>
<?php } else { ?>
  <div class="popup-heading"><?php echo $heading_cartpopup_title_empty; ?></div>
  <div class="popup-center empty-cart"><?php echo $text_cartpopup_empty; ?></div>
  <div class="popup-footer">
    <button onclick="$.magnificPopup.close();"><?php echo $button_shopping; ?></button>
  </div>
<?php } ?>
</div>
<script type="text/javascript"><!--
function masked(element, status) {
  if (status == true) {
    $('<div/>')
    .attr({ 'class':'masked' })
    .prependTo(element);
    $('<div class="masked_loading" />').insertAfter($('.masked'));
  } else {
    $('.masked').remove();
    $('.masked_loading').remove();
  }
}

function validate( input ) {
  input.value = input.value.replace( /[^\d,]/g, '' );
}

function update( target, status ) {
  masked('#popup-okno-inner', true);
  var input_val    = $( target ).parent().parent().parent().children( 'input[name=quantity]' ).val(),
      quantity     = parseInt( input_val ),
      product_id   = $( target ).parent().parent().parent().children( 'input[name=product_id]' ).val(),
      product_key  = $( target ).next().val(),
      urls         = null;

  if ( quantity <= 0 ) {
    masked('#popup-okno-inner', false);
    quantity = $( target ).parent().parent().parent().children( 'input[name=quantity]' ).val( 1 );
    return;
  }

  if ( status == 'update' ) {
    urls = 'index.php?route=revolution/revpopupcart&update=' + product_id + '&quantity=' + quantity;
  } else if ( status == 'add' ) {
    urls = 'index.php?route=revolution/revpopupcart&add=' + target + '&quantity=1';
  } else {
    urls = 'index.php?route=revolution/revpopupcart&remove=' + product_key;
  }
      
  $.ajax({
    url: urls,
    type: 'get',
    dataType: 'html',
    success: function( data ) {
      $.ajax({
        url: 'index.php?route=revolution/revpopupcart/status_cart',
        type: 'get',
        dataType: 'json',
        success: function( json ) {
          masked('#popup-okno-inner', false);
          if (json['total']) {
            $('#cart-total' ).html(json['total']);
			$('#cart-total-popup').html(json['total']);
			$('#cart > ul').load('index.php?route=common/cart/info ul li');
          }
          $('#popup-okno-inner').html( $( data ).find( '#popup-okno-inner > *' ) );
        } 
      });
    } 
  });
}
function update_manual( target, product_id ) {
  masked('#popup-okno-inner', true);
  var input_val = $( target ).val(),
      quantity  = parseInt( input_val );
    
  if ( quantity <= 0 ) {
    masked('#popup-okno-inner', false);
    quantity = $( target ).val( 1 );
    return;
  }
  
  $.ajax({
    url: 'index.php?route=revolution/revpopupcart&update=' + product_id + '&quantity=' + quantity,
    type: 'get',
    dataType: 'html',
    success: function( data ) {
      $.ajax({
        url: 'index.php?route=revolution/revpopupcart/status_cart',
        type: 'get',
        dataType: 'json',
        success: function( json ) {
          masked('#popup-okno-inner', false);
          if (json['total']) {
            $('#cart-total' ).html(json['total']);
			$('#cart-total-popup').html(json['total']);
            $('#cart > ul').load('index.php?route=common/cart/info ul li');
          }
          $('#popup-okno-inner').html( $( data ).find( '#popup-okno-inner > *' ) );
        } 
      });
    } 
  });
}
//--></script>
</div>