<?php echo $header; ?>
<div class="container" itemscope itemtype="http://schema.org/NewsArticle">
<meta itemscope itemprop="mainEntityOfPage"  itemType="https://schema.org/WebPage" itemid="<?php echo $microdata_url_info; ?>"/>
<div itemprop="author" itemscope itemtype="https://schema.org/Person"><meta itemprop="name" content="<?php echo $microdata_author; ?>" /></div>
<div itemprop="image" itemscope itemtype="https://schema.org/ImageObject">
<link itemprop="contentUrl" href="<?php echo $logo; ?>" />
<link itemprop="url" href="<?php echo $logo; ?>">
<meta itemprop="width" content="<?php echo $logo_width; ?>">
<meta itemprop="height" content="<?php echo $logo_height; ?>">
</div>
<div itemprop="publisher" itemscope itemtype="https://schema.org/Organization">		  
<div itemprop="logo" itemscope itemtype="https://schema.org/ImageObject">
<link itemprop="url" href="<?php echo $logo; ?>">
<link itemprop="contentUrl" href="<?php echo $logo; ?>" />
</div>
<meta itemprop="name" content="<?php echo $microdata_name; ?>" />
</div>
<meta itemprop="datePublished" content="<?php echo $microdata_date_info; ?>" />
<meta itemprop="dateModified" content="<?php echo $microdata_date_info; ?>" />
<div itemscope itemtype="http://schema.org/BreadcrumbList" style="display:none;">
<div style="display:none;">breadcrumbs_revolution_theme</div>
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
<?php if($i+1<count($breadcrumbs)) { ?><li><a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a></li><?php } else { ?><li><h1 class="inbreadcrumb" itemprop="headline"><?php echo $breadcrumb['text']; ?></h1></li><?php } ?>
<?php } ?>
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
      <div itemprop="description"><?php echo $description; ?></div><?php echo $content_bottom; ?></div>
    <?php echo $column_right; ?></div>
</div>
<?php echo $footer; ?>