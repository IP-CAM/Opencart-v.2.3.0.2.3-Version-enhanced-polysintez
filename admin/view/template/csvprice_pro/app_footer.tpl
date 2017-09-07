<div class="modal fade" id="oc2-dialog-scroll">
    <div class="modal-dialog">
        <div class="modal-content">
         <div class="modal-body" id="oc2-modal-body">
         </div>
         <div class="modal-footer">
             <a href="#" class="f-bu f-bu-default g-1" data-dismiss="modal"> &nbsp;OK&nbsp; </a>
         </div>
        </div>
    </div>
</div>

<div class="g f-content">
	<?php if( isset($note_status) && $note_status ) { ?>
	<div class="g-row"><?php echo $text_show_help_note;?></div>
	<?php } ?>
	<div class="g-row f-copyright">
		<?php echo $copy; ?>
	</div>
</div>
<div class="f-help-block f-tooltip" id="prop_desc_win">
	<div class="c_top l"></div>
	<div class="c_top r"></div>
	<div class="close" onclick="$('#prop_desc_win').hide()"></div>
	<div class="f-help-content" id="prop_desc_win_content"></div>
	<div class="c_btm l"></div>
	<div class="c_btm r"></div>
</div>
<script type="text/javascript"><!--
	$('a.delete').on('click', function() {
		if (!confirm('<?php echo $text_confirm_delete;?>')) {
			return false;
		}
	});
	$(document).ready(function() {
		$('.f-row label').each(function() {
			var h,i,e=$(this);
			if ( e.attr('data-prop_id') ) {
				h=e.html();
				if( e.find("input").length ) {
					e.after('<i data-prop_id="'+e.attr('data-prop_id')+'" class="f-icon-helper fa fa-info-circle fa-lg" aria-hidden="true" title="<?php echo addslashes($text_show_help);?>"></i>');
					i=e.next();
				} else {
					e.html('<i data-prop_id="'+e.attr('data-prop_id')+'" class="f-icon-helper fa fa-info-circle fa-lg" aria-hidden="true" title="<?php echo addslashes($text_show_help);?>"></i>'+h);
					i=e.find('.f-icon-helper');
				}
				if( i.length ) {
					i.click(function() {
						var offset = e.offset();
						$("#prop_desc_win_content").html(prop_descr[$(this).attr('data-prop_id')]);
						$("#prop_desc_win").css({
							top: offset.top,
							left: offset.left,// - 10,
							display: "block"
						});
						return false;
					});
				}
			}
		});
	});

	$(document).keyup(function(e) {
		if (e.keyCode == 27 && !$("#prop_desc_win").is(':hidden')) {
			$('#prop_desc_win').hide()
		}
	});
	$(function() {
		$(".show_scroll").click(function(e) {
			e.preventDefault();
			var d=$('#oc2-dialog-scroll'),m=$('#oc2-modal-body'),id=$(this).parent().attr('id'),k=0;
			m.html('<div class="scrollbox" style="width: 100% !important; height: 100% !important">' + $("#" + id + " div.scrollbox").html() + '</div>');
			$("#" + id + ' input[type="checkbox"]').each(function() {
				$(this).attr("id", "l-scroll_" + k);
				k++;
			});k=0;
			$('#oc2-modal-body input[type="checkbox"]').each(function() {
				$(this).attr("id", "k-scroll_" + k);
				if ($("#l-scroll_" + k).prop('checked')) {
					$(this).prop('checked', true);
				}
				k++;
			});
			d.on('show.bs.modal', function (e) {
				$('#oc2-modal-body input[type="checkbox"').change(function() {
					$('#' + $(this).attr('id').replace('k-scroll_', 'l-scroll_')).prop('checked', $(this).prop('checked'));
				});
			})
			d.on('hidden.bs.modal', function (e) {
				$("#" + id + ' input[type="checkbox"]').each(function() {
					$(this).attr('id', '');
				});
  				m.html('');
			})
			d.modal('show');
			return false;
		});
	});
	//--></script>