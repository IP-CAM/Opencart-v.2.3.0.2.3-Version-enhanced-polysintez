<?php if ($reviews) { ?>
<?php foreach ($reviews as $review) { ?>
<div class="review-list" itemprop="review" itemscope itemtype="http://schema.org/Review">
  <div class="author"><span itemprop="author"><?php echo $review['author']; ?></span><span class="rdate" itemprop="datePublished"> / <?php echo $review['date_added']; ?></span></div>
  <div class="rating" itemprop="reviewRating" itemscope itemtype="http://schema.org/Rating">
	<meta itemprop="worstRating" content = "1">
	<meta itemprop="bestRating" content = "5">
	<meta itemprop="ratingValue" content = "<?php echo $review['rating']; ?>">
	<?php for ($i = 1; $i <= 5; $i++) { ?>
      <?php if ($review['rating'] < $i) { ?>
      <span class="fa fa-stack"><i class="fa fa-star-o fa-stack-2x"></i></span>
      <?php } else { ?>
      <span class="fa fa-stack"><i class="fa fa-star fa-stack-2x"></i></span>
      <?php } ?>
    <?php } ?>
	</div>
  <div class="text" itemprop="description"><?php echo $review['text']; ?></div>
	<?php if ($review['answer']) { ?>
		<div class="name_admin"><?php echo $review['answer_from']; ?></div>
		<div class="answer_admin">
			<div><?php echo $review['answer']; ?></div>
		</div>
	<?php } ?>
</div>
<?php } ?>
<div class="text-right"><?php echo $pagination; ?></div>
<?php } else { ?>
<p><?php echo $text_no_reviews; ?></p>
<?php } ?>