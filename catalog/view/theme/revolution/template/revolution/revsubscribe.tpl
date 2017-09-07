<div id="revsubscribe">
	<div class="container">
		<div class="row">
		<form id="revsubscribe_form">
			<div class="col-sm-5 col-xs-12">
				<div class="revtext">
				<i class="fa fa-envelope-o" aria-hidden="true"></i>
				<span class="susbs_head_text"><?php echo $revsubscribe_title; ?></span>
				<?php if (!empty($revsubscribe_text)) { ?>
					<br>
					<?php echo htmlspecialchars_decode($revsubscribe_text); ?>
				<?php } ?>
				</div>
				<div id="revsubscribe_success"></div>
			</div>
			<div class="col-sm-4 col-xs-6">										
				<input type="text" class="form-control" name="revs_email" id="revs_email" placeholder="<?php echo $text_revsubscribe_email_tooltip; ?>" value="" />
				<input type="hidden" name="language_id" id="language_id" value="<?php echo $language_id; ?>" />
				<input type="hidden" name="store_id" id="store_id" value="<?php echo $store_id; ?>" />							
			</div>
			<div class="col-sm-3 col-xs-6">
			<a id="revsubscribe_submit" class="btn btn-primary"><?php echo $revsubscribe_subscribe_now; ?></a>
			</div>
		</form>	
		</div>
	</div>
</div>
<script type="text/javascript"><!--
$( "#revsubscribe_form" ).submit(function( event ) {
	$('#revsubscribe_submit').click(); 
	event.preventDefault();
});
$('#revsubscribe_submit').on('click', function(){
	var email_validate = /^([A-Za-z0-9_\-\.])+\@([A-Za-z0-9_\-\.])+\.([A-Za-z]{2,4})$/;
	if ((document.getElementById("revs_email").value.length == 0)) {
		var message = '<?php echo $revsubscribe_error1; ?>';
		get_revpopup_notification('alert-danger', '<?php echo $text_product_oshibka; ?>', message);
	} else if (!document.getElementById("revs_email").value.match(email_validate)) {
		var message = '<?php echo $revsubscribe_error2; ?>';
		get_revpopup_notification('alert-danger', '<?php echo $text_product_oshibka; ?>', message);
	} else {
		$.ajax({
			url: 'index.php?route=revolution/revsubscribe/subscribecustomer',
			type: 'post',
			data: $('#revsubscribe_form').serialize(),
			success: function(response) {
				get_revpopup_notification('alert-success', '<?php echo $text_revsubscribe_spasibo; ?>', response);
				$('#revs_email').val('');
			}
		});
	}
});
//--></script>