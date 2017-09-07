<?php if (count($languages) > 1) { ?>
<form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data" id="language">
    <li class="dropdown pull-left"><span class="span-a dropdown-toggle" data-toggle="dropdown">
    <?php foreach ($languages as $language) { ?>
    <?php if ($language['code'] == $code) { ?>
    <img src="<?php echo (VERSION >= 2.2) ? 'catalog/language/'.$language['code'].'/'.$language['code'].'.png' : 'image/flags/'.$language['image']; ?>" alt="<?php echo $language['name']; ?>" title="<?php echo $language['name']; ?>" />
    <?php } ?>
    <?php } ?>
    <span class="hidden-xs hidden-sm hidden-md"> <?php echo $text_language; ?></span><i class="fa fa-chevron-down strdown"></i></span>
	<ul class="dropdown-menu dropdown-menu-right">
		<?php foreach ($languages as $language) { ?>
			<li><a href="<?php echo $language['code']; ?>"><img src="<?php echo (VERSION >= 2.2) ? 'catalog/language/'.$language['code'].'/'.$language['code'].'.png' : 'image/flags/'.$language['image']; ?>" alt="<?php echo $language['name']; ?>" title="<?php echo $language['name']; ?>" /> <?php echo $language['name']; ?></a></li>
		<?php } ?>
	</ul>
  <input type="hidden" name="code" value="" />
  <input type="hidden" name="redirect" value="<?php echo $redirect; ?>" />
  </li>
</form>
<?php } ?>