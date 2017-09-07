<div class="box">
<div id="menu2_button">
<div class="box-heading"><?php echo $heading_title; ?></div>
<div class="box-content am" style="padding: 0;-webkit-border-radius: 0px 0px 0px 0px;-moz-border-radius: 0px 0px 0px 0px;-khtml-border-radius: 0px 0px 0px 0px;border-radius: 0px 0px 0px 0px;
<?php if ($nehh == '1') { ?>
position:absolute;
<?php } ?>	
">
<div id="menu2" class="<?php echo $module_class; ?>">
<div class="catalog_list catalog_list_popup catalog_as_popup">
<?php foreach ($categories as $category) { ?>  
	<div class="level_1 hasChildren closed">
		<div class="title"><a href="<?php echo $category['href']; ?>"><?php echo $category['name']; ?><?php echo $category['column']; ?>
		<?php if ($category['children']) { ?>
		<span class="arrow-btn"></span>
		<?php } ?>
		</a>	
		</div>	
		<?php if ($category['children']) { ?>	
		<div class="childrenList" style="display: none;">
				<ul class="subnav">
					<div id="subwidth">
						<div id="col" class="ul_block">
						<?php foreach ($category['children'] as $child) { ?>
						<li class="glavli"><a href="<?php echo $child['href']; ?>"><?php echo $child['name']; ?></a>
							<?php if($child['child2_id']){ ?>
							<ul class="lastul">
								<?php foreach ($child['child2_id'] as $child2) { ?>
								  <?php if ($child2['category_id'] == $child2_id) { ?>
								  <li class="category-<?php echo $child2['category_id']; ?> active"><a href="<?php echo $child2['href']; ?>" class="active"><span></span><?php echo $child2['name']; ?></a>
								  <?php } else { ?>
								  <li class="category-<?php echo $child2['category_id']; ?>"><a href="<?php echo $child2['href']; ?>"><span></span><?php echo $child2['name']; ?></a>
								  <?php } ?>
								<?php } ?>	
							</ul>
							<?php } ?>
						</li>
						<?php } ?>						
					</div>	
					</div>
					<?php if ($category['thumb2']) { ?>
					<img class="img_sub" src="<?php echo $category['thumb2']; ?>" alt="<?php echo $category['name']; ?>" />	
					<?php } ?>	
				</ul>					
		</div>
		<?php } ?>
	</div>			
<?php } ?>	
</div>	
</div>
</div>
</div>
</div>
<style type="text/css">
.ul_block .column {
width: <?php echo $code3; ?>px;
float: left;
}
</style>

<style type="text/css">
.level_1.hasChildren.open {
position:<?php echo $code5; ?>;
}
</style>
<script type="text/javascript">
(function($) {
	$(function() {
		$('.ul_block').autocolumnlist({
			columns: <?php echo $code2; ?>,
			min: <?php echo $code; ?>
		});
	})
})(jQuery)
</script>
<script type="text/javascript"><!--
$(document).ready(function() {
  //var width = $('.box').outerWidth();
  var width = '200';
  var width2 = $('.ul_block .column').outerWidth();
  $('.catalog_list_popup .level_1 > .childrenList').css('width', width2*<?php echo $code2; ?>+17);
  $('.catalog_list_popup .level_1 .childrenList').css('left', width-2);
  $('.box-content.am').css('width', width-2);
});
//--></script>