<?php if ($error_warning) { ?>
<div class="alert alert-warning"><i class="fa fa-exclamation-circle"></i> <?php echo $error_warning; ?></div>
<?php } ?>
<?php if ($payment_methods) { ?>
<p><?php echo $text_payment_method; ?></p>
<?php foreach ($payment_methods as $payment_method) { ?>
<div class="radio">
  <label>

                    <?php 
					$lock = true;
					if ((isset($payment_method['error']) and empty($payment_method['error'])) or !isset($payment_method['error'])) {
						$lock = false;
					}
					?>
                
    
                   <?php if (($payment_method['code'] == $code or !$code) and $lock == false) { ?>
                
    <?php $code = $payment_method['code']; ?>
    <input type="radio" name="payment_method" value="<?php echo $payment_method['code']; ?>" checked="checked" />
    <?php } else { ?>
    
                   <input type="radio" name="payment_method" value="<?php echo $payment_method['code']; ?>" <?php if ($lock == true) { echo 'disabled';} ?>/>
                
    <?php } ?>
    <?php 
                if (isset($payment_method['image']) and !empty($payment_method['image']) ) {
					$pos1 = strpos($payment_method['image'], 'http://');
					if ($pos1) {
						$payment_method['image'] = substr($payment_method['image'], $pos1);
						$pos2 = strpos($payment_method['image'], '"');
						if ($pos2) {
							$payment_method['image'] = substr($payment_method['image'], 0, $pos2);
						}
					}
                    ?>
                    <img src="<?php echo $payment_method['image'];?>"/>
                <?php
                    echo '<span style="vertical-align:10px;">'.$payment_method['title'].'</span>';
                }
                else {
                    echo $payment_method['title'];
                }
             ?>
    <?php if ($payment_method['terms']) { ?>
    
                <?php if (!empty($payment_method['terms']) and ((isset($payment_method['show_description']) and (($payment_method['code'] == $code and $payment_method['show_description'] == 1) or $payment_method['show_description'] == 2)) or !isset($payment_method['show_description'])) ) { ?>
                    <br/><div class="transfer_plus"><?php echo $payment_method['terms']; ?></div>
                <?php } ?>
                
    <?php } ?>

					<?php if (isset($payment_method['error']) and $payment_method['error'] == true) {
						if (isset($payment_method['warning'])) {
							echo '<br/>'.$payment_method['warning'];
						}
					} ?>
                
  </label>
</div>
<?php } ?>
<?php } ?>
<p><strong><?php echo $text_comments; ?></strong></p>
<p>
  <textarea name="comment" rows="8" class="form-control"><?php echo $comment; ?></textarea>
</p>
<?php if ($text_agree) { ?>
<div class="buttons">
  <div class="pull-right"><?php echo $text_agree; ?>
    <?php if ($agree) { ?>
    <input type="checkbox" name="agree" value="1" checked="checked" />
    <?php } else { ?>
    <input type="checkbox" name="agree" value="1" />
    <?php } ?>
    &nbsp;
    <input type="button" value="<?php echo $button_continue; ?>" id="button-payment-method" data-loading-text="<?php echo $text_loading; ?>" class="btn btn-primary" />
  </div>
</div>
<?php } else { ?>
<div class="buttons">
  <div class="pull-right">
    <input type="button" value="<?php echo $button_continue; ?>" id="button-payment-method" data-loading-text="<?php echo $text_loading; ?>" class="btn btn-primary" />
  </div>
</div>
<?php } ?>
