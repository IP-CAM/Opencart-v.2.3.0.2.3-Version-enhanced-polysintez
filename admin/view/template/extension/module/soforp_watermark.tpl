<?php echo $header; ?><?php echo $column_left; ?>


<?php
require_once(DIR_SYSTEM . '/engine/soforp_view.php' );
$widgets = new SoforpWidgets('soforp_watermark_',$params);
$widgets->text_select_all = $text_select_all;
$widgets->text_unselect_all = $text_unselect_all;
?>
<div id="content">

    <div class="page-header">
        <div class="container-fluid">
            <div class="pull-right">
                <?php if( !isset($license_error) ) { ?>
                <button type="submit" name="action" value="clean" form="form-clean" data-toggle="tooltip" title="<?php echo $button_clean; ?>" class="btn btn-default btn-danger"><i class="fa fa-eraser"></i> <?php echo $button_clean; ?></button>
                <button type="submit" name="action" value="save" onclick="beforeSave();" form="form" data-toggle="tooltip" title="<?php echo $button_save; ?>" class="btn btn-primary"><i class="fa fa-save"></i> <?php echo $button_save; ?></button>
                <button type="submit" name="action" value="save_and_close" onclick="beforeSave();" form="form" data-toggle="tooltip" title="<?php echo $button_save_and_close; ?>" class="btn btn-default"><i class="fa fa-save"></i> <?php echo $button_save_and_close; ?></button>
                <?php } else { ?>
                <a href="<?php echo $recheck; ?>" data-toggle="tooltip" title="<?php echo $button_recheck; ?>"class="btn btn-primary" /><i class="fa fa-check"></i> <?php echo $button_recheck; ?></a>
                <?php } ?>
                <a href="<?php echo $close; ?>" data-toggle="tooltip" title="<?php echo $button_close; ?>" class="btn btn-default"><i class="fa fa-close"></i> <?php echo $button_close; ?></a>
            </div>
            <img width="36" height="36" style="float:left" src="view/image/neoseo.png" alt=""/>
            <h1><?php echo $heading_title_raw . " " . $text_module_version; ?></h1>
            <ul class="breadcrumb">
                <?php foreach ($breadcrumbs as $breadcrumb) { ?>
                <li><a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a></li>
                <?php } ?>
            </ul>
        </div>
    </div>

    <div class="container-fluid">
        <?php if ($error_warning) { ?>
        <div class="alert alert-danger">
            <i class="fa fa-exclamation-circle"></i> <?php echo $error_warning; ?>
            <button type="button" class="close" data-dismiss="alert">&times;</button>
        </div>
        <?php } ?>
        <?php if (isset($success) && $success) { ?>
        <div class="alert alert-success">
            <i class="fa fa-check-circle"></i>
            <?php echo $success; ?>
            <button type="button" class="close" data-dismiss="alert">&times;</button>
        </div>
        <?php } ?>
        <div class="panel panel-default">
            <div class="panel-heading ui-helper-clearfix" style="height: 55px">
                <div class="pull-left">
                    <h3 class="panel-title "><i class="fa fa-pencil"></i> <?php echo $text_edit; ?></h3>
                </div>
                <div class="pull-right">
                    <select id="ctrl_watermark_store" class="form-control pull-left">
                        <?php foreach( $stores as $store_id => $store_data ) { ?>
                        <option value="<?php echo $store_id; ?>"><?php echo $store_data['name']; ?></option>
                        <?php } ?>
                    </select>
                </div>
            </div>
            <div class="panel-body">

                <ul class="nav nav-tabs">

                    <li class="active"><a href="#tab-general" data-toggle="tab"><?php echo $tab_general; ?></a></li>
                    <li><a href="#tab-params" data-toggle="tab"><?php echo $tab_params; ?></a></li>
                    <li><a href="#tab-logs" data-toggle="tab"><?php echo $tab_logs; ?></a></li>
                    <li><a href="#tab-support" data-toggle="tab"><?php echo $tab_support; ?></a></li>
                    <li><a href="#tab-license" data-toggle="tab"><?php echo $tab_license; ?></a></li>
                </ul>
                <form action="<?php echo $clean; ?>" method="post" enctype="multipart/form-data" id="form-clean">
                    <input type="hidden" name="dummy" value="0" />
                </form>
                <form action="<?php echo $save; ?>" method="post" enctype="multipart/form-data" id="form">
                    <div class="tab-content">
                        <div class="tab-pane active" id="tab-general">

                            <?php if( !isset($license_error) ) { ?>

                            <?php foreach( $stores as $store_id => $store_data ) { ?>

                            <div class="form-group store store_<?php echo $store_id; ?>" style="display: inline-block; width:100%">
                                <div class="col-sm-5">
                                    <label class="control-label" for="soforp_watermark_status_<?php echo $store_id; ?>"><?php echo $entry_status; ?></label>
                                </div>
                                <div class="col-sm-7">
                                    <select name="soforp_watermark_status_<?php echo $store_id; ?>" id="soforp_watermark_status_<?php echo $store_id; ?>" class="form-control">
                                        <option value="0"><?php echo $text_disabled; ?></option>
                                        <option value="1" <?php if ( ${'soforp_watermark_status_' . $store_id} ) { ?> selected="selected" <?php } ?> ><?php echo $text_enabled; ?></option>
                                    </select>
                                </div>
                            </div>
                            <div class="form-group store store_<?php echo $store_id; ?>" style="display: inline-block; width:100%">
                                <div class="col-sm-5">
                                    <label class="control-label" for="draggable-zone"><?php echo $entry_image; ?></label>
                                </div>
                                <div class="col-sm-7">
                                    <input type="hidden" value="" id="tmp_<?php echo $store_id; ?>"/>
                                    <input type="hidden" name="soforp_watermark_image_<?php echo $store_id; ?>" value="<?php echo ${'soforp_watermark_image_' . $store_id }; ?>" id="soforp_watermark_image_<?php echo $store_id; ?>"/>
                                    <input type="hidden" name="soforp_watermark_top_<?php echo $store_id; ?>" value="<?php echo ${'soforp_watermark_top_' . $store_id }; ?>" id="soforp_watermark_top_<?php echo $store_id; ?>"/>
                                    <input type="hidden" name="soforp_watermark_left_<?php echo $store_id; ?>" value="<?php echo ${'soforp_watermark_left_' . $store_id }; ?>" id="soforp_watermark_left_<?php echo $store_id; ?>"/>
                                    <input type="hidden" name="soforp_watermark_width_<?php echo $store_id; ?>" value="<?php echo ${'soforp_watermark_width_' . $store_id }; ?>" id="soforp_watermark_width_<?php echo $store_id; ?>"/>
                                    <input type="hidden" name="soforp_watermark_height_<?php echo $store_id; ?>" value="<?php echo ${'soforp_watermark_height_' . $store_id }; ?>" id="soforp_watermark_height_<?php echo $store_id; ?>"/>
                                    <input type="hidden" name="soforp_watermark_angle_<?php echo $store_id; ?>" value="<?php echo ${'soforp_watermark_angle_' . $store_id }; ?>" id="soforp_watermark_angle_<?php echo $store_id; ?>"/>
                                    <div class="draggable-zone" style="background:url(<?php echo ${'soforp_watermark_product_image_thumb_' . $store_id} ; ?>) 0 0 no-repeat">
                                        <div class="draggable-wrapper" style="width: <?php echo ${'soforp_watermark_width_' . $store_id}*3; ?>px; height: <?php echo ${'soforp_watermark_height_' . $store_id}*3; ?>px; left: <?php echo ${'soforp_watermark_left_' . $store_id}*3; ?>px; top: <?php echo ${'soforp_watermark_top_' . $store_id}*3; ?>px;">
                                            <div class="resizable-wrapper">
                                                <img id="soforp_watermark_image_thumb_<?php echo $store_id; ?>" src="<?php echo ${'soforp_watermark_image_root_' . $store_id} . 'image/' . ${'soforp_watermark_image_' . $store_id}; ?>" width="<?php echo ${'soforp_watermark_width_' . $store_id}*3; ?>" height="<?php echo ${'soforp_watermark_height_' . $store_id}*3; ?>" alt="Водяной знак"/>
                                            </div>
                                        </div>
                                    </div>
                                    <div style="margin-top:0.5em;width:300px;text-align: right">
                                        <button type="button" target="soforp_watermark_image_<?php echo $store_id; ?>" class="button-image btn btn-primary"><i class="fa fa-pencil"></i> <?php echo $text_browse; ?></button>
                                        <button type="button" target="soforp_watermark_image_<?php echo $store_id; ?>" class="button-clear btn btn-danger"><i class="fa fa-eraser"></i> <?php echo $text_clear; ?></button>
                                    </div>
                                </div>
                            </div>
                            <div class="form-group store store_<?php echo $store_id; ?>" style="display: inline-block; width:100%">
                                <div class="col-sm-5">
                                    <label class="control-label" for="soforp_watermark_hide_real_path_<?php echo $store_id; ?>"><?php echo $entry_hide_real_path; ?></label>
                                </div>
                                <div class="col-sm-7">
                                    <select name="soforp_watermark_hide_real_path_<?php echo $store_id; ?>" id="soforp_watermark_hide_real_path_<?php echo $store_id; ?>" class="form-control">
                                        <option value="0"><?php echo $text_disabled; ?></option>
                                        <option value="1" <?php if (${'soforp_watermark_hide_real_path_' . $store_id }) { ?> selected="selected" <?php } ?> ><?php echo $text_enabled; ?></option>
                                    </select>
                                </div>
                            </div>

                            <?php } ?>

                            <?php } else { ?>

                            <?php echo $license_error; ?>

                            <?php } ?>

                        </div>

                        <div class="tab-pane" id="tab-params">

                            <?php if( !isset($license_error) ) { ?>

                            <?php foreach( $stores as $store_id => $store_data ) { ?>

                            <div class="form-group store store_<?php echo $store_id; ?>" style="display: inline-block; width:100%">
                                <div class="col-sm-5">
                                    <?php echo $entry_min_size; ?>
                                </div>
                                <div class="col-sm-7 form-inline">
                                    <input style="width:100px"  type="text" name="soforp_watermark_min_width_<?php echo $store_id; ?>" value="<?php echo ${'soforp_watermark_min_width_' . $store_id}; ?>" id="soforp_watermark_min_width_<?php echo $store_id; ?>" class="form-control">
                                    &nbsp; X&nbsp;&nbsp;<input style="width:100px"  type="text" name="soforp_watermark_min_height_<?php echo $store_id; ?>" value="<?php echo ${'soforp_watermark_min_height_' . $store_id}; ?>" id="soforp_watermark_min_height_<?php echo $store_id; ?>" class="form-control">
                                </div>
                            </div>
                            <div class="form-group store store_<?php echo $store_id; ?>" style="display: inline-block; width:100%">
                                <div class="col-sm-5">
                                    <?php echo $entry_max_size; ?>
                                </div>
                                <div class="col-sm-7 form-inline">
                                    <input style="width:100px" type="text" name="soforp_watermark_max_width_<?php echo $store_id; ?>" value="<?php echo ${'soforp_watermark_max_width_' . $store_id}; ?>" id="soforp_watermark_max_width_<?php echo $store_id; ?>" class="form-control">
                                    &nbsp;X &nbsp;&nbsp;<input style="width:100px" type="text" name="soforp_watermark_max_height_<?php echo $store_id; ?>" value="<?php echo ${'soforp_watermark_max_height_' . $store_id}; ?>" id="soforp_watermark_max_height_<?php echo $store_id; ?>" class="form-control">
                                </div>
                            </div>
                            <div class="form-group store store_<?php echo $store_id; ?>" style="display: inline-block; width:100%">
                                <div class="col-sm-5">
                                    <?php echo $entry_exclude; ?>
                                </div>
                                <div class="col-sm-7">
                                    <div class="well well-sm" style="height: 150px; overflow: auto;">
                                        <?php $class = 'odd'; ?>
                                        <?php foreach ($image_directories as $item) { ?>
                                        <?php $class = ($class == 'even' ? 'odd' : 'even'); ?>
                                        <div class="<?php echo $class; ?>">
                                            <input type="checkbox" name="soforp_watermark_exclude_<?php echo $store_id; ?>[]" value="<?php echo $item['value']; ?>"<?php if (is_array(${'soforp_watermark_exclude_' .$store_id}) && in_array($item['value'], ${'soforp_watermark_exclude_' .$store_id})) echo ' checked="checked"'; ?> />
                                                   <?php echo $item['text']; ?>
                                        </div>
                                        <?php } ?>
                                    </div>
                                    <button type="button" onclick="$(this).parent().find(':checkbox').prop('checked', true);" class="btn btn-primary"><i class="fa fa-pencil"></i> <?php echo $text_select_all; ?></button>
                                    <button type="button" onclick="$(this).parent().find(':checkbox').prop('checked', false);" class="btn btn-danger"><i class="fa fa-trash-o"></i> <?php echo $text_unselect_all; ?></button>
                                </div>
                            </div>
                            <?php } ?>
                            <?php } else { ?>
                            <?php echo $license_error; ?>
                            <?php } ?>
                            
                        </div>      
                        <?php if( !isset($license_error) ) { ?>
                        <div class="tab-pane" id="tab-logs">
                            <?php $widgets->debug_and_logs('debug',array( 0 => $text_disabled, 1 => $text_enabled), $clear, $button_clear_log ); ?>
                            <textarea class="form-control" style="width: 100%; height: 300px; padding: 5px; border: 1px solid #CCCCCC; background: #FFFFFF; overflow: scroll;"><?php echo $logs; ?></textarea>
                        </div>
                        <?php } ?>


                        <div class="tab-pane" id="tab-support">
                            <?php echo $mail_support; ?>
                        </div>

                        <div class="tab-pane" id="tab-license">
                            <?php echo $module_licence; ?>
                        </div>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>
<?php echo $footer; ?>
<script type="text/javascript"><!--
	if( window.location.hash.indexOf('#tab') == 0 && $("[href=" + window.location.hash + "]").length ) {
		$(".panel-body > .nav-tabs li").removeClass("active");
		$("[href=" + window.location.hash + "]").parents('li').addClass("active");
		$(".panel-body:first .tab-content:first .tab-pane:first").removeClass("active");
		$(window.location.hash).addClass("active");
	}
	$(".nav-tabs li a").click(function(){
		var url = $(this).prop('href');
		window.location.hash = url.substring(url.indexOf('#'));
	});
	 // Специальный фикс системной функции, поскольку даниель понятия не имеет о том что в url может быть еще и hash
    // и по итогу этот hash становится частью token
    function getURLVar(key) {
        var value = [];

        var url = String(document.location);
        if( url.indexOf('#') != -1 ) {
            url = url.substring(0, url.indexOf('#'));
        }
        var query = url.split('?');

        if (query[1]) {
            var part = query[1].split('&');

            for (i = 0; i < part.length; i++) {
                var data = part[i].split('=');

                if (data[0] && data[1]) {
                    value[data[0]] = data[1];
                }
            }

            if (value[key]) {
                return value[key];
            } else {
                return '';
            }
        }
    }
//--></script>
<script type="text/javascript">
            $(window).load(function() {
           var drWr, elem;
           <?php foreach($stores as $store_id => $store_data) { ?>
           drWr = $('.store_<?php echo $store_id; ?> .draggable-wrapper');
           elem = $('#soforp_watermark_image_thumb_<?php echo $store_id; ?>');
           elem.resizable({
               aspectRatio: true,
               handles: 'ne, nw, se, sw'
           });
           $(".store_<?php echo $store_id; ?> .ui-resizable-ne")
               .css("width", "20px").css("height", "20px").css("right", "-10px").css("top", "-10px");
           $(".store_<?php echo $store_id; ?> .ui-resizable-nw")
               .css("width", "20px").css("height", "20px").css("left", "-10px").css("top", "-10px");
           $(".store_<?php echo $store_id; ?> .ui-resizable-se")
               .removeClass("ui-icon-gripsmall-diagonal-se")
               .removeClass("ui-icon")
               .css("width", "20px").css("height", "20px").css("right", "-10px").css("bottom", "-10px");
           $(".store_<?php echo $store_id; ?> .ui-resizable-sw")
               .css("width", "20px").css("height", "20px").css("left", "-10px").css("bottom", "-10px");
           drWr.draggable();
           elem.parent().rotatable({
               angle: <?php echo str_replace(",", ".", ${'soforp_watermark_angle_' .$store_id } * pi() / 180); ?>
           });
           <?php } ?>
       });
       $('#soforp_watermark_store').on("change", function() {
           var current = $(this).val();
           $(".store").hide();
           $(".store_" + current).show();
       }).trigger("change");
       <?php foreach($stores as $store_id => $store_data) { ?>
       $('.store_<?php echo $store_id; ?> .button-image').on('click', function() {
           $('#modal-image').remove();
           $('#tmp_<?php echo $store_id; ?>').val("").attr('target', $(this).attr('target'));
           $.ajax({
               url: 'index.php?route=common/filemanager&token=' + getURLVar('token') + '&target=tmp_<?php echo $store_id; ?>',
               dataType: 'html',
               beforeSend: function() {
                   $('.store_<?php echo $store_id; ?> .button-image i').replaceWith('<i class="fa fa-circle-o-notch fa-spin"></i>');
                   $('.store_<?php echo $store_id; ?> .button-image').prop('disabled', true);
               },
               complete: function() {
                   $('.store_<?php echo $store_id; ?> .button-image i').replaceWith('<i class="fa fa-upload"></i>');
                   $('.store_<?php echo $store_id; ?> .button-image').prop('disabled', false);
                   $('#modal-image').on('hide.bs.modal', function() {
                       if ($('#tmp_<?php echo $store_id; ?>').val() != "") {
                           var target = $('#tmp_<?php echo $store_id; ?>').attr('target');
                           $("#" + target).val($('#tmp_<?php echo $store_id; ?>').val());
                           if (target == 'soforp_watermark_image_<?php echo $store_id; ?>') {

                               $.ajax({
                                   url: 'index.php?route=module/soforp_watermark/getImgSize&token=<?php echo $token; ?>',
                                   data: "src=" + $("#tmp_<?php echo $store_id; ?>").val(),
                                   type: 'post',
                                   dataType: 'json',
                                   success: function(json) {
                                       var rate, width, height;
                                       if (json["size"][0] > 130 || json["size"][1] > 130) {
                                           rate = (json["size"][0] > json["size"][1]) ? (json["size"][0] / 130) : (json["size"][1] / 130);
                                           width = Math.round(json["size"][0] / rate);
                                           height = Math.round(json["size"][1] / rate);
                                       } else {
                                           width = json["size"][0];
                                           height = json["size"][1];
                                       }

                                       $('#soforp_watermark_image_thumb_<?php echo $store_id; ?>').css("width", width).css("height", height);
                                       $('.store_<?php echo $store_id; ?> .draggable-wrapper_<?php echo $store_id; ?>').css("width", width).css("height", height);
                                       $('.store_<?php echo $store_id; ?> .ui-wrapper').css("width", width).css("height", height);
                                   }
                               });
                               $('#soforp_watermark_image_thumb_<?php echo $store_id; ?>').attr('src', '<?php echo ${'soforp_watermark_image_root_' .$store_id}; ?>image/' + $('#tmp_<?php echo $store_id; ?>').val());
                           } else if (target == 'soforp_watermark_product_image_<?php echo $store_id; ?>') {
                               $.ajax({
                                   url: 'index.php?route=module/soforp_watermark/image&token=<?php echo $token; ?>&image=' + encodeURIComponent($('#tmp_<?php echo $store_id; ?>').val()),
                                   dataType: 'text',
                                   success: function(data) {
                                       $('.store_<?php echo $store_id; ?> .draggable-zone').css('background-image', 'url(' + data + ')');
                                   }
                               });
                           }

                       }
                   });
               },
               success: function(html) {
                   $('body').append('<div id="modal-image" class="modal">' + html + '</div>');
                   $('#modal-image').modal('show');
               }
           });
       });
       <?php } ?>
       <?php foreach($stores as $store_id => $store_data) { ?>
       $('.store_<?php echo $store_id; ?> .button-clear').on('click', function() {
           $("#soforp_watermark_image_thumb_<?php echo $store_id; ?>")
               .attr('src', '/image/<?php echo ${'soforp_watermark_default_image_' . $store_id}; ?>')
               .css("width", <?php echo ${'soforp_watermark_default_image_width_' . $store_id} * 3; ?>)
               .css("height", <?php echo ${'soforp_watermark_default_image_height_' . $store_id} * 3; ?>);
           $(".store_<?php echo $store_id; ?> .draggable-wrapper")
               .css("left", <?php echo ${'soforp_watermark_default_image_left_' . $store_id} * 3; ?>)
               .css("top", <?php echo ${'soforp_watermark_default_image_top_' . $store_id} * 3; ?>)
               .css("width", <?php echo ${'soforp_watermark_default_image_width_' . $store_id} * 3; ?>)
               .css("height", <?php echo ${'soforp_watermark_default_image_height_' . $store_id} * 3; ?>);
           $(".store_<?php echo $store_id; ?> .ui-wrapper")
               .css("left", "auto")
               .css("top", "auto")
               .css("width", <?php echo ${'soforp_watermark_default_image_width_' . $store_id} * 3; ?>)
               .css("height", <?php echo ${'soforp_watermark_default_image_height_' . $store_id} * 3; ?>)
               .rotatable("angle", <?php echo str_replace(",", ".", ${'soforp_watermark_default_image_angle_' . $store_id} * pi() / 180); ?>);
           $("#soforp_watermark_image_<?php echo $store_id; ?>").val('<?php echo ${'soforp_watermark_default_image_' . $store_id}; ?>');
           $("#soforp_watermark_left_<?php echo $store_id; ?>").val(<?php echo ${'soforp_watermark_default_image_left_' . $store_id}; ?>);
           $("#soforp_watermark_top_<?php echo $store_id; ?>").val(<?php echo ${'soforp_watermark_default_image_top_' . $store_id}; ?>);
           $("#soforp_watermark_width_<?php echo $store_id; ?>").val(<?php echo ${'soforp_watermark_default_image_width_' . $store_id}; ?>);
           $("#soforp_watermark_height_<?php echo $store_id; ?>").val(<?php echo ${'soforp_watermark_default_image_height_' . $store_id}; ?>);
           $("#soforp_watermark_angle_<?php echo $store_id; ?>").val(<?php echo ${'soforp_watermark_default_image_angle_' . $store_id}; ?>);
       });
       <?php } ?>

       function beforeSave() {
           var angle = 0;
           <?php foreach($stores as $store_id => $store_data) { ?>
           angle = ($(".store_<?php echo $store_id; ?> .ui-wrapper").rotatable("ui").angle.current * 180) / Math.PI;
           if (!angle)
               angle = 0;
           while (angle < 0)
               angle += 360;
           while (angle >= 360)
               
               angle -= 360;
           $("#soforp_watermark_angle_<?php echo $store_id; ?>").val(
               Math.ceil(angle));
           $("#soforp_watermark_width_<?php echo $store_id; ?>").val(
               Math.ceil($(".store_<?php echo $store_id; ?> .resizable-wrapper .ui-wrapper").css('width').replace(/[^0-9]/gi, "") / 3));
           $("#soforp_watermark_height_<?php echo $store_id; ?>").val(
               Math.ceil($(".store_<?php echo $store_id; ?> .resizable-wrapper .ui-wrapper").css('height').replace(/[^0-9]/gi, "") / 3));
           $("#soforp_watermark_left_<?php echo $store_id; ?>").val(
               Math.ceil((Number($(".store_<?php echo $store_id; ?> .draggable-wrapper").css('left').replace(/[^\-\.0-9]/gi, "")) +
                   Number($(".store_<?php echo $store_id; ?> .ui-wrapper").css('left').replace(/[^\-\.0-9]/gi, ""))) / 3));
           $("#soforp_watermark_top_<?php echo $store_id; ?>").val(
               Math.ceil((Number($(".store_<?php echo $store_id; ?> .draggable-wrapper").css('top').replace(/[^\-\.0-9]/gi, "")) +
                   Number($(".store_<?php echo $store_id; ?> .ui-wrapper").css('top').replace(/[^\-\.0-9]/gi, ""))) / 3));
           <?php } ?>
           return true;
       }
</script>