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
	  <div class="row conts" <?php if ($f_map) echo 'style="margin-bottom: 10px"'?>>
		<?php if (!$f_map) { ?>
			<div class="col-sm-8">
				<div id="yamap" style="width: 100%; overflow: hidden;">
				<?php if ($yamap) echo $yamap; ?>
				</div>
			</div>
			<div class="col-sm-4">
				<h3><?php echo $text_contact_ourcontacts; ?></h3>
				<?php if ($settings_all_settings['m_conts']) { ?>
					<p class="hid_address"><i class="fa fa-map-marker" aria-hidden="true"></i><?php echo $address; ?></p>
					<p class="hid_telephone"><i class="fa fa fa-phone" aria-hidden="true"></i><?php echo $telephone; ?></p>
				<?php } ?>
				<?php if ($settings_all_settings['dop_conts']) { ?>
					<?php if ($header_phone_number != '') { ?>
						<p class="dop_contact_tel1"><i class="fa fa fa-phone" aria-hidden="true"></i><?php echo $header_phone_cod; ?> <?php echo $header_phone_number; ?></p>
					<?php } ?>
					<?php if ($header_phone_number2 != '') { ?>
						<p class="dop_contact_tel2"><i class="fa fa fa-phone" aria-hidden="true"></i><?php echo $header_phone_cod2; ?> <?php echo $header_phone_number2; ?><p>
					<?php } ?>
					<?php if ($dop_contacts) { $i_dc = 1; ?>
						<?php foreach ($dop_contacts as $dop_contact) { ?>
							<p class="dop_contact_<?php echo $i_dc; ?>"><i class="fa <?php echo $dop_contact['icon']; ?>" aria-hidden="true"></i><?php echo $dop_contact['number']; ?></p>
						<?php $i_dc++; } ?>
					<?php } ?>
				<?php } ?>
				<?php if ($settings_all_settings['soc_conts']) { ?>
					<?php if ($revtheme_footer_socs) { ?>
						<?php foreach ($revtheme_footer_socs as $revtheme_footer_soc) { ?>
							<p><i class="<?php echo $revtheme_footer_soc['image']; ?>" aria-hidden="true"></i><a href="<?php echo $revtheme_footer_soc['link']; ?>"><?php echo $revtheme_footer_soc['link_t']; ?></a></p>
						<?php } ?>
					<?php } ?>
				<?php } ?>
			</div>
		<?php } ?>
		<?php if (strlen($descript) > 30) { ?>
			<div class="col-sm-12" style="<?php if (!$f_map) echo 'margin-top:30px' ?>"><?php echo html_entity_decode($descript, ENT_QUOTES, 'UTF-8'); ?></div>
		<?php } ?>
	  </div>  
      <form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data" class="form-horizontal">
        <fieldset>
          <legend><?php echo $text_contact; ?></legend>
          <div class="form-group required">
            <label class="col-sm-2 control-label" for="input-name"><?php echo $entry_name; ?></label>
            <div class="col-sm-10">
              <input type="text" name="name" value="<?php echo $name; ?>" id="input-name" class="form-control" />
              <?php if ($error_name) { ?>
              <div class="text-danger"><?php echo $error_name; ?></div>
              <?php } ?>
            </div>
          </div>
          <div class="form-group required">
            <label class="col-sm-2 control-label" for="input-email"><?php echo $entry_email; ?></label>
            <div class="col-sm-10">
              <input type="text" name="email" value="<?php echo $email; ?>" id="input-email" class="form-control" />
              <?php if ($error_email) { ?>
              <div class="text-danger"><?php echo $error_email; ?></div>
              <?php } ?>
            </div>
          </div>
          <div class="form-group required">
            <label class="col-sm-2 control-label" for="input-enquiry"><?php echo $entry_enquiry; ?></label>
            <div class="col-sm-10">
              <textarea name="enquiry" rows="10" id="input-enquiry" class="form-control"><?php echo $enquiry; ?></textarea>
              <?php if ($error_enquiry) { ?>
              <div class="text-danger"><?php echo $error_enquiry; ?></div>
              <?php } ?>
            </div>
          </div>
          <?php echo $captcha; ?>
        </fieldset>
        <div class="buttons">
          <div class="pull-right">
            <input class="btn btn-primary" type="submit" value="<?php echo $button_submit; ?>" />
          </div>
        </div>
      </form>
      <?php echo $content_bottom; ?></div>
    <?php echo $column_right; ?></div>
</div>
<?php if (!$f_map && !$yamap) { ?>
	<script src="//api-maps.yandex.ru/2.1/?lang=ru_RU" type="text/javascript"></script>
	<script type="text/javascript"><!--
	ymaps.ready(init_map);
	$('#yamap').css('height', '400px');
	function init_map(){
		var address = '<?php echo $address; ?>';
		var geocoder = ymaps.geocode(address);
		geocoder.then(
			function (res) {
				var coordinates = res.geoObjects.get(0).geometry.getCoordinates();
				var map = new ymaps.Map("yamap", {
					center: coordinates,
					zoom: 15,
					controls: [
						'typeSelector',
						'zoomControl'
					]
				});			
				map.geoObjects.add(new ymaps.Placemark(
					coordinates,
					{
						'hintContent': address,
						'balloonContent': '<?php echo $store; ?>'
					},
					{
						'preset': 'islands#redDotIcon'
					}
				));
			}
		);
	}
	//--></script>
<?php } ?>
<?php echo $footer; ?>