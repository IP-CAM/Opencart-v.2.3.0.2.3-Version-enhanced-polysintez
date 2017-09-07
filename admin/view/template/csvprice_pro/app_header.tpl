<?php if(isset($mdemo_title)) {?>
<div class="g-row">
	<?php echo $mdemo_title;?>
</div>
<?php } ?>
<div class="g-row f-main-menu">
	<div class="g-4 f-menu-header">
		<h3><?php echo $heading_title; ?></h3>
	</div>
	<div class="g-8">
		<ul class="f-nav f-pull-right">
			<?php foreach( $top_menu as $menu_item ) { ?>
			<?php if($menu_item['active'] == 1) { ?>
			<li class="active"><a href="<?php echo $menu_item['url'];?>"><?php echo $menu_item['text'];?></a></li>
			<?php } else {?>
			<li><a href="<?php echo $menu_item['url'];?>"><?php echo $menu_item['text'];?></a></li>
			<?php }?>
			<?php }?>
		</ul>
		<!-- end f-nav -->
	</div>
</div>