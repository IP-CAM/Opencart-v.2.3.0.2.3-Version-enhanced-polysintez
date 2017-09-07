<div class="popup_notification modalokno">
<div class="popup_notification_heading"><?php echo $modal_heading_title; ?></div>
<div class="popup_notification_message"><?php echo $modal_message; ?></div>
<?php if ($modal_buttons) { ?>
<div class="popup-footer">
<button onclick="window.close();"><?php echo $text_no; ?></button>
<a class="popup-modal-dismiss" href="#"><?php echo $text_yes; ?></a>
</div>
<?php } ?>
</div>
<script type="text/javascript"><!--
var Cookie = {
	set: function(name, value, days) {
		var domain, domainParts, date, expires, host;
		if (days) {
			date = new Date();
			date.setTime(date.getTime()+(days*24*60*60*1000));
			expires = "; expires="+date.toGMTString();
		} else {
			expires = "";
		}
		host = location.host;
		if (host.split('.').length === 1) {
			document.cookie = name+"="+value+expires+"; path=/";
		} else {
			domainParts = host.split('.');
			domainParts.shift();
			domain = '.'+domainParts.join('.');
			document.cookie = name+"="+value+expires+"; path=/; domain="+domain;
			if (Cookie.get(name) == null || Cookie.get(name) != value) {
				domain = '.'+host;
				document.cookie = name+"="+value+expires+"; path=/; domain="+domain;
			}
		}
	},
	get: function(name) {
		var nameEQ = name + "=";
		var ca = document.cookie.split(';');
		for (var i=0; i < ca.length; i++) {
			var c = ca[i];
			while (c.charAt(0)==' ') {
				c = c.substring(1,c.length);
			}
			if (c.indexOf(nameEQ) == 0) return c.substring(nameEQ.length,c.length);
		}
		return null;
	}
};

if(!Cookie.get('revmodal')) {
	<?php if ($modal_time == '888') { ?>
		Cookie.set('revmodal', '', -1);
	<?php } else { ?>
		Cookie.set('revmodal', true, <?php echo $modal_time; ?>);
	<?php } ?>
}
//--></script>