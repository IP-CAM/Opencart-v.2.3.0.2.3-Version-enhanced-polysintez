<?php echo $header; ?>
<div class="container">
<div itemscope itemtype="http://schema.org/BreadcrumbList" style="display:none;">
<?php $position = 1; foreach ($breadcrumbs as $breadcrumb) { ?>
<div itemprop="itemListElement" itemscope itemtype="http://schema.org/ListItem">
<link itemprop="item" href="<?php echo $breadcrumb['href']; ?>">
<meta itemprop="name" content="<?php echo $breadcrumb['text']; ?>" />
<meta itemprop="position" content="<?php echo $position; ?>" />
</div>
<?php $position++; } ?>
</div>
<ul class="breadcrumb"><li class="br_ellipses" style="display: none;">...</li>
<?php foreach ($breadcrumbs as $i=> $breadcrumb) { ?>
<?php if($i+1<count($breadcrumbs)) { ?><li><a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a></li><?php } else { ?><?php } ?>
<?php } ?>
<li><h1 class="inbreadcrumb"><?php echo $heading_title; ?></h1></li>
</ul>
  <div class="row"><?php echo $column_left; ?>
    <?php if ($column_left && $column_right) { ?>
    <?php $class = 'col-sm-6'; ?>
    <?php } elseif ($column_left || $column_right) { ?>
    <?php $class = 'col-sm-9'; ?>
    <?php } else { ?>
    <?php $class = 'col-sm-12'; ?>
    <?php } ?>
    <div id="content" class="<?php echo $class; ?>"><?php echo $content_top; ?>     
      <?php if ($blogs) { ?>
	  <div class="well well-sm">
			<div class="row">
				<div class="col-lg-3 col-md-4 col-sm-3 ">
				</div>
				<br class="visible-xs">
				<div class="col-lg-6 col-md-5 col-sm-5 ">
					<div class="input-group">
						<span class="input-group-addon" ><i class="fa fa-sort-amount-asc"></i><span class="hidden-xs hidden-sm hidden-md"> <?php echo $text_sort; ?></span></span>
						<select id="input-sort" class="form-control" onchange="location = this.value;">
						<?php foreach ($sorts as $sorts) { ?>
						<?php if ($sorts['value'] == $sort . '-' . $order) { ?>
						<option value="<?php echo $sorts['href']; ?>" selected="selected"><?php echo $sorts['text']; ?></option>
						<?php } else { ?>
						<option value="<?php echo $sorts['href']; ?>"><?php echo $sorts['text']; ?></option>
						<?php } ?>
						<?php } ?>
					  </select>
					</div>
				</div>
				<br class="visible-xs">
				<div class="col-lg-3 col-md-3 col-sm-4 ">
					<div class="input-group">
						<span class="input-group-addon"><i class="fa fa-eye"></i><span class="hidden-xs hidden-sm hidden-md"> <?php echo $text_limit; ?></span></span>
						<select id="input-limit" class="form-control" onchange="location = this.value;">
						<?php foreach ($limits as $limits) { ?>
						<?php if ($limits['value'] == $limit) { ?>
						<option value="<?php echo $limits['href']; ?>" selected="selected"><?php echo $limits['text']; ?></option>
						<?php } else { ?>
						<option value="<?php echo $limits['href']; ?>"><?php echo $limits['text']; ?></option>
						<?php } ?>
						<?php } ?>
					  </select>
					</div>
				</div>
			</div>
      </div>
		<?php if (strlen($description) > 14) { ?>
			<div class="row category_description blog">
				<?php if ($thumb) { ?>
					<div class="fl-l"><img src="<?php echo $thumb; ?>" alt="<?php echo $heading_title; ?>" title="<?php echo $heading_title; ?>" class="img-thumbnail" /></div>
				<?php } ?>
				<div><?php echo $description; ?></div>
			</div>
		<?php } else { ?>
			<br/>
		<?php } ?>
		<?php if ($categories) { ?>
		<div class="row" style="margin-top: 20px; margin-bottom: 10px;">
			<?php if (count($categories) <= 5) { ?>
				<div class="col-sm-3">
					<ul>
						<?php foreach ($categories as $category) { ?>
							<li><a href="<?php echo $category['href']; ?>"><?php echo $category['title']; ?></a></li>
						<?php } ?>
					</ul>
				</div>
			<?php } else { ?>
				<?php foreach (array_chunk($categories, ceil(count($categories) / 4)) as $categories) { ?>
					<div class="col-sm-3">
						<ul>
							<?php foreach ($categories as $category) { ?>
								<li><a href="<?php echo $category['href']; ?>"><?php echo $category['title']; ?></a></li>
							<?php } ?>
						</ul>
					</div>
				<?php } ?>
			<?php } ?>
		</div>
		<?php } ?>	
		<div class="row">
        <?php foreach ($blogs as $blog) { ?>
        <div class="revblog-list product-layout product-price col-xs-12">
          <div class="product-thumb">
            <div class="image"><a href="<?php echo $blog['href']; ?>"><img src="<?php echo $blog['thumb']; ?>" alt="<?php echo $blog['title']; ?>" title="<?php echo $blog['title']; ?>" class="img-responsive" /></a></div>
            <div>
              <div class="caption">
                <h4 style="height: inherit; margin-bottom: 5px;"><a href="<?php echo $blog['href']; ?>"><?php echo $blog['title']; ?></a></h4>
                <p class="bl_time"><i class="fa fa-clock-o" style="padding-right:3px;"></i><?php echo $blog['data_added']; ?></p>
				<p><?php echo $blog['description']; ?></p>
              </div>
            </div>
          </div>
        </div>
        <?php } ?>
      </div>
      <div class="row">
		<div class="pagpages clearfix">
			<div class="col-sm-6 text-left"><?php echo $pagination; ?></div>
			<div class="col-sm-6 text-right"><?php echo $results; ?></div>
		</div>
      </div>
      <?php } ?>
      <?php if (!$blogs) { ?>
      <p><?php echo $text_empty; ?></p>
      <div class="buttons">
        <div class="pull-right"><a href="<?php echo $continue; ?>" class="btn btn-primary"><?php echo $button_continue; ?></a></div>
      </div>
      <?php } ?>
      <?php echo $content_bottom; ?></div>
    <?php echo $column_right; ?></div>
</div>
<?php echo $footer; ?>