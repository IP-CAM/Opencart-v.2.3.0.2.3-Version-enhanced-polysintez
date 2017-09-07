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
<div style="display:none;">breadcrumbs_revolution_theme</div>
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
                <?php if ($review_status) { ?>
				<?php if ($review_guest) { ?>
                <div class="form-group required mb0">
						<div class="well well-sm otz">
							<div class="text-right">
								<a class="btn btn-primary" id="open-review-box"><i class="fa fa-comment-o" aria-hidden="true"></i><?php echo $text_product_wr_review; ?></a>
							</div>						
							<div class="row" id="post-review-box" style="display:none;">
								<div class="col-md-12">
									<form class="form-review form-horizontal">
										<div class="form-group required">
											<label class="col-sm-2 control-label" for="input-name"><?php echo $entry_name; ?></label>
											<div class="col-sm-10">
												<input type="text" name="name" value="" id="input-name" class="form-control" />
											</div>
										</div>
										<div class="form-group required">
											<label class="col-sm-2 control-label" for="input-review"><?php echo $entry_review; ?></label>
											<div class="col-sm-10">
												<textarea name="text" rows="5" id="input-review" class="form-control"></textarea>
											</div>
										</div>
										<div class="form-group required">
											<label class="col-sm-2 control-label"><?php echo $entry_rating; ?></label>
											<div class="col-sm-10">
												<div class="prod-rating">
													<input id="rat1" type="radio" name="rating" value="1" /><label class="rat-star" for="rat1"><i class="fa fa-star"></i></label>
													<input id="rat2" type="radio" name="rating" value="2" /><label class="rat-star" for="rat2"><i class="fa fa-star"></i></label>
													<input id="rat3" type="radio" name="rating" value="3" /><label class="rat-star" for="rat3"><i class="fa fa-star"></i></label>
													<input id="rat4" type="radio" name="rating" value="4" /><label class="rat-star" for="rat4"><i class="fa fa-star"></i></label>
													<input id="rat5" type="radio" name="rating" value="5" /><label class="rat-star" for="rat5"><i class="fa fa-star"></i></label>
												</div>
												<script type="text/javascript"><!--
													$('.rat-star').hover(function () {
														$(this).prevAll('.rat-star').addClass('active');
														$(this).addClass('active');
													},function () {
														$(this).prevAll('.rat-star').removeClass('active');
														$(this).removeClass('active');
													});
													
													$('.rat-star').click(function(){
														$('.rat-star').each(function(){
															$(this).removeClass('checked');
															$(this).prevAll('.rat-star').removeClass('checked');
														});
														
														$(this).addClass('checked');
														$(this).prevAll('.rat-star').addClass('checked');
													});
													
												//--></script>
											</div>
										</div>
										<?php echo $captcha; ?>
										<div class="pull-right text-right">
											<a class="btn btn-default" href="#" id="close-review-box" style="display:none; margin-right: 10px;"><?php echo $text_product_otmena; ?></a>
											<button type="button" id="button-review" data-loading-text="<?php echo $text_loading; ?>" class="btn btn-danger"><?php echo $button_continue; ?></button>
										</div>					
									</form>
								</div>
							</div>
						</div>
						<script type="text/javascript"><!--
						$('#open-review-box').click(function(e) {
						$('#post-review-box').slideDown(400, function() {
						$('#new-review').trigger('autosize.resize');
						$('#new-review').focus();
						});
						$('#open-review-box').fadeOut(100);
						$('#close-review-box').show();
						});

						$('#close-review-box').click(function(e) {
						e.preventDefault();
						$('#post-review-box').slideUp(300, function() {
						$('#new-review').focus();
						$('#open-review-box').fadeIn(200);
						});
						$('#close-review-box').hide();
						});
						//--></script>
                </div>              
                <?php } else { ?>
                <?php echo $text_login; ?>
                <?php } ?>
                <div id="review">
<?php if ($reviews) { ?>
<?php foreach ($reviews as $review) { ?>
<div class="review-list">
  <div class="author"><?php echo $review['author']; ?><span> / <?php echo $review['date_added']; ?></span></div>
  <div class="rating">
	<?php for ($i = 1; $i <= 5; $i++) { ?>
      <?php if ($review['rating'] < $i) { ?>
      <span class="fa fa-stack"><i class="fa fa-star-o fa-stack-2x"></i></span>
      <?php } else { ?>
      <span class="fa fa-stack"><i class="fa fa-star fa-stack-2x"></i></span>
      <?php } ?>
    <?php } ?>
	</div>
  <div class="text"><?php echo $review['text']; ?></div>
  <?php if ($review['answer']) { ?>
	<div class="name_admin"><?php echo $review['answer_from']; ?></div>
	<div class="answer_admin">
		<div><?php echo $review['answer']; ?></div>
	</div>
  <?php } ?>
</div>
<?php } ?>
      <div class="row">
		<div class="pagpages clearfix">
			<div class="col-sm-6 text-left"><?php echo $pagination; ?></div>
			<div class="col-sm-6 text-right"><?php echo $results; ?></div>
		</div>
      </div>
<?php } else { ?>
<p><?php echo $text_no_reviews; ?></p>
<?php } ?>
				</div>

                <?php } ?>
            <?php echo $content_bottom; ?></div>
        <?php echo $column_right; ?></div>

<script type="text/javascript"><!--
$('#button-review').on('click', function () {
	$.ajax({
		url: 'index.php?route=revolution/revstorereview/write',
		type: 'post',
		dataType: 'json',
		data:  $(".form-review").serialize(),
		beforeSend: function () {
			if ($("textarea").is("#g-recaptcha-response")) {
				grecaptcha.reset();
			}
			$('#button-review').button('loading');
		},
		complete: function () {
			$('#button-review').button('reset');
		},
		success: function(json) {
			$('.alert-success, .alert-danger').remove();

			if (json['error']) {
				get_revpopup_notification('alert-danger', '<?php echo $text_product_oshibka; ?>', json['error']);
			}

			if (json['success']) {
				get_revpopup_notification('alert-success', '<?php echo $text_product_spasibo_otz; ?>', json['success']);

				$('input[name=\'name\']').val('');
				$('textarea[name=\'text\']').val('');
				$('input[name=\'rating\']:checked').prop('checked', false);
				
				$('#post-review-box').slideUp(300);
				$('#new-review').focus();
				$('#open-review-box').fadeIn(200);
				$('#close-review-box').hide();
				$('#ratings-hidden').val('');
				$('.stars .glyphicon').removeClass('glyphicon-star').addClass('glyphicon-star-empty');
				
			}
		}
	});
});
//--></script>
</div>
<?php echo $footer; ?>