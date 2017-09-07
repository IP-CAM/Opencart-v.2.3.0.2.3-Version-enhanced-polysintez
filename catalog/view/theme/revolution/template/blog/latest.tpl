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
<ul class="breadcrumb">
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
    <div id="content" class="<?php echo $class; ?> showcase-list"><?php echo $content_top; ?>
      <?php if ($articles) { ?>
 <div class="well well-sm">
			<div class="row">
				<div class="col-lg-3 col-md-4 col-sm-3 ">
				  <div class="btn-group">
					<button type="button" id="list-view" class="btn btn-default" data-toggle="tooltip" title="<?php echo $text_list; ?>"><i class="fa fa-th-list"></i></button>
					<button type="button" id="grid-view" class="btn btn-default" data-toggle="tooltip" title="<?php echo $text_grid; ?>"><i class="fa fa-th"></i></button>
				  </div>
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
      <br />
      <div class="row">  
        <?php foreach ($articles as $article) { ?>     
        <div class="product-layout product-list col-xs-12">
          <div class="product-thumb">
            <div class="image"><a href="<?php echo $article['href']; ?>"><img src="<?php echo $article['thumb']; ?>" alt="<?php echo $article['name']; ?>" title="<?php echo $article['name']; ?>" class="img-responsive" /></a></div>
            <div class="caption">
              <h4><a href="<?php echo $article['href']; ?>"><?php echo $article['name']; ?></a></h4>
              <p class="description"><?php echo $article['description']; ?></p>
              <?php if ($configblog_review_status) { ?>
              <div class="rating">
                <?php for ($i = 1; $i <= 5; $i++) { ?>
                <?php if ($article['rating'] < $i) { ?>
                <span class="fa fa-stack"><i class="fa fa-star-o fa-stack-2x"></i></span>
                <?php } else { ?>
                <span class="fa fa-stack"><i class="fa fa-star fa-stack-2x"></i><i class="fa fa-star-o fa-stack-2x"></i></span>
                <?php } ?>
                <?php } ?>
              </div>
			  <?php } ?>
            </div>
            <div class="button-group"> 
				<button type="button" onclick="location.href = ('<?php echo $article['href']; ?>');"><i class="fa fa-share"></i> <span class="hidden-xs hidden-sm hidden-md"><?php echo $button_more; ?></span></button>
			<!--	<button type="button""><i class="fa fa-share"></i> <span class="hidden-xs hidden-sm hidden-md"><a class="button button-more" href="<?php echo $article['href']; ?>"><?php echo $button_more; ?></a></span></button>-->
				<button type="button" data-toggle="tooltip" title="<?php echo $article["date_added"];?>" "><i class="fa fa-clock-o"></i></button>
				<button type="button" data-toggle="tooltip" title="<?php echo $text_views; ?> <?php echo $article["viewed"];?>" "><i class="fa fa-eye"></i></button>
			</div>
          </div>
        </div>
        <?php } ?>
      </div>
      <div class="row">
        <div class="col-sm-6 text-left"><?php echo $pagination; ?></div>
        <!-- <div class="col-sm-6 text-right"><?php //echo $results; ?></div> -->
      </div>
      <?php } else { ?>
      <p><?php echo $text_empty; ?></p>
      <div class="buttons">
        <div class="pull-right"><a href="<?php echo $continue; ?>" class="btn btn-primary"><?php echo $button_continue; ?></a></div>
      </div>
      <?php } ?>
      <?php echo $content_bottom; ?></div>
    <?php echo $column_right; ?></div>
</div>
<?php echo $footer; ?>