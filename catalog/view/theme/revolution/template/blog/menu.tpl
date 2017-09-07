    <div class="dropdown" style="display:inline-block">
	<a class="dropdown-toggle" data-toggle="dropdown">
	<i class="hidden-md hidden-lg fa fa-book"></i> <span class="hidden-xs hidden-sm"><?php echo $text_blog; ?></span><i class="fa fa-chevron-down strdown"></i>
	</a>
	<ul class="dropdown-menu dropdown-menu-right">
	<?php foreach ($categories as $category) { ?>
        <?php if ($category['children']) { ?>
        <li><a href="<?php echo $category['href']; ?>"><?php echo $category['name']; ?></a></li>
            <?php foreach (array_chunk($category['children'], ceil(count($category['children']) / $category['column'])) as $children) { ?>    
				<?php foreach ($children as $child) { ?>
                <li><a href="<?php echo $child['href']; ?>"><i class="fa fa-angle-right"></i> <?php echo $child['name']; ?></a></li>
				<?php } ?>
			<?php } ?>
		<?php } else { ?>
        <li><a href="<?php echo $category['href']; ?>"><?php echo $category['name']; ?></a></li>
        <?php } ?>
	<?php } ?>
	<li><a href="<?php echo $blog; ?>" class="see-all"><?php echo $text_all; ?> <?php echo $text_blog; ?></a></li>
	</ul>
	</div>