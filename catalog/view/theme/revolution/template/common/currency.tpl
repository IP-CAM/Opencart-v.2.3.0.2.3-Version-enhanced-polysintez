<?php if (count($currencies) > 1) { ?>
<form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data" id="currency">
	<li class="dropdown pull-left"><a class="dropdown-toggle" data-toggle="dropdown">
    <span class="hidden-xs hidden-sm"><?php echo $text_currency; ?>: </span>
	<?php foreach ($currencies as $currency) { ?>
    <?php if ($currency['symbol_left'] && $currency['code'] == $code) { ?>
    <?php echo $currency['symbol_left']; ?>
    <?php } elseif ($currency['symbol_right'] && $currency['code'] == $code) { ?>
    <?php echo $currency['symbol_right']; ?>
    <?php } ?>
    <?php } ?>
	<i class="fa fa-chevron-down strdown"></i></a>
    <ul class="dropdown-menu dropdown-menu-right">
		<?php foreach ($currencies as $currency) { ?>
		<?php if ($currency['symbol_left']) { ?>
		<li><a class="currency-select" type="button" name="<?php echo $currency['code']; ?>"><?php echo $currency['title']; ?>: <?php echo $currency['symbol_left']; ?></a></li>
		<?php } else { ?>
		<li><a class="currency-select" type="button" name="<?php echo $currency['code']; ?>"><?php echo $currency['title']; ?>: <?php echo $currency['symbol_right']; ?></a></li>
		<?php } ?>
		<?php } ?>
    </ul>
  <input type="hidden" name="code" value="" />
  <input type="hidden" name="redirect" value="<?php echo $redirect; ?>" />
  </li>
</form>
<?php } ?>
