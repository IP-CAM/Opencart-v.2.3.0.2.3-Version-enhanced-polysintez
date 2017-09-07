<?php if (!empty($info)) { ?>
    <h2><?php echo $text_instruction; ?></h2>
    <div class="well well-sm">
        <?php echo $info; ?>
    </div>
<?php } ?>

<div class="buttons">
    <div class="pull-right">
        <input type="button" value="<?php echo $button_confirm; ?>" id="button-confirm" class="btn btn-primary" />
    </div>
</div>


<script type="text/javascript"><!--
$('#button-confirm').bind('click', function() {
	$.ajax({ 
		type: 'get',
		url: 'index.php?route=extension/payment/<?php echo $name; ?>/confirm',
        cache: false,
        beforeSend: function() {
            $('#button-confirm').button('loading');
        },
        complete: function() {
            $('#button-confirm').button('reset');
        },
        success: function() {
			location = '<?php echo $continue; ?>';
		}		
	});
});
//--></script> 
