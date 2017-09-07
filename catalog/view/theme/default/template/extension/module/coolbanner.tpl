<div id="coolbanner<?php echo $module; ?>" class="coolbanner  row ">
  <?php foreach ($coolbanners as $coolbanner) { ?>
  <?php if ($coolbanner['link']) { ?>
  <div class="col-sm-6 col-xs-12"><a href="<?php echo $coolbanner['link']; ?>"><img src="<?php echo $coolbanner['image']; ?>" alt="<?php echo $coolbanner['title']; ?>" title="<?php echo $coolbanner['title']; ?>" /></a></div>
  <?php } else { ?>
  <div class="col-md-3 col-sm-6 col-xs-12"><img src="<?php echo $coolbanner['image']; ?>" alt="<?php echo $coolbanner['title']; ?>" title="<?php echo $coolbanner['title']; ?>" /></div>
  <?php } ?>
  <?php } ?>

</div>

<script type="text/javascript"><!--
$(document).ready(function() {

var bannercontainer = $('#coolbanner<?php echo $module; ?>');

var parentwidth =  parseInt(bannercontainer.parent().css('width'), 10);
  		
	var count = <?php echo count($coolbanners);?>;
	var width = bannercontainer.width();
	var margr = parseInt(bannercontainer.find('.cbitem').first().css('margin-right'));
	var margl = parseInt(bannercontainer.find('.cbitem').first().css('margin-left'));
	
	width = (width  - (margr + margl) * (count-1))/(count) + 'px';

	//bannercontainer.find('.cbitem').last().css('margin-right','0px')
	
	//bannercontainer.find('img').css('width', width);
			
	bannercontainer.find('div').show();
	
	
	switch(true) {
            case (count == 1):
                bannercontainer.find('div').addClass('col-lg-12 col-md-12');
                break;
            case (count == 2):
                bannercontainer.find('div').addClass('col-lg-6 col-md-6');
                break;
            case (count == 3):
               bannercontainer.find('div').addClass('col-lg-4 col-md-4');
                break;
           case (count == 4):
               bannercontainer.find('div').addClass('col-lg-3 col-md-3');
                break;
			case (count == 5):
               bannercontainer.find('div').addClass('col-lg-2c col-md-2');
                break;	
        }
	
	
	
});

//--></script>
<style>
.coolbanner {
overflow: hidden;
}
.coolbanner img {
width: 100%;
}
.coolbanner div{
margin:5px 0px;
}
#container > .coolbanner {
margin:10px 0px;
}
.col-lg-2c {
width: 20%;
}
</style>
