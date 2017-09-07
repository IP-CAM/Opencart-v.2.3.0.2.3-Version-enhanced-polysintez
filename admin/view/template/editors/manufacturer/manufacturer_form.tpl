<?php echo $header; ?><?php echo $column_left; ?>
<div id="content">
  <div class="page-header">
    <div class="container-fluid">
      <div class="pull-right">
        <button type="submit" form="form-manufacturer" input type="hidden" name="apply" value="1" data-toggle="tooltip" title="<?php echo $button_apply; ?>" class="btn btn-success"><i class="fa fa-check"></i></button>
		<button type="submit" form="form-manufacturer" data-toggle="tooltip" title="<?php echo $button_save; ?>" class="btn btn-primary"><i class="fa fa-save"></i></button>
        <a href="<?php echo $cancel; ?>" data-toggle="tooltip" title="<?php echo $button_cancel; ?>" class="btn btn-default"><i class="fa fa-reply"></i></a></div>
      <h1><?php echo $heading_title; ?></h1>
      <ul class="breadcrumb">
        <?php foreach ($breadcrumbs as $breadcrumb) { ?>
        <li><a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a></li>
        <?php } ?>
      </ul>
    </div>
  </div>
  <div class="container-fluid">
    <?php if ($error_warning) { ?>
    <div class="alert alert-danger"><i class="fa fa-exclamation-circle"></i> <?php echo $error_warning; ?>
      <button type="button" class="close" data-dismiss="alert">&times;</button>
    </div>
    <?php } ?>
	<?php if ($success) { ?>
  	<div class="alert alert-success"><i class="fa fa-exclamation-circle"></i> <?php echo $success; ?>
      <button type="button" class="close" data-dismiss="alert">&times;</button>
    </div>
  	<?php } ?>
    <div class="panel panel-default">
      <div class="panel-heading">
        <h3 class="panel-title"><i class="fa fa-pencil"></i> <?php echo $text_form; ?><span class="manufacturer_name"></span></h3>
      </div>
      <div class="panel-body">
        <form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data" id="form-manufacturer" class="form-horizontal">
          <ul class="nav nav-tabs">
            <li class="active"><a href="#tab-general" data-toggle="tab"><?php echo $tab_general; ?></a></li>
            <li><a href="#tab-data" data-toggle="tab"><?php echo $tab_data; ?></a></li>
          </ul>
		  <div class="tab-content">
            <div class="tab-pane active" id="tab-general">
              <div class="form-group required">
				<label class="col-sm-2 control-label" for="input-name"><?php echo $entry_name; ?></label>
				<div class="col-sm-10">
				  <input type="text" name="name" value="<?php echo $name; ?>" placeholder="<?php echo $entry_name; ?>" id="input-name" class="form-control" />
				  <?php if ($error_name) { ?>
				  <div class="text-danger"><?php echo $error_name; ?></div>
				  <?php } ?>
				</div>
			  </div>
			  <div class="form-group">
			    <div class="col-sm-12">
				  <ul class="nav nav-tabs" id="language">
					<?php foreach ($languages as $language) { ?>
					<li><a href="#language<?php echo $language['language_id']; ?>" data-toggle="tab"><img src="language/<?php echo $language['code']; ?>/<?php echo $language['code']; ?>.png" title="<?php echo $language['name']; ?>" /> <?php echo $language['name']; ?></a></li>
					<?php } ?>
				  </ul>
			    </div>
			  </div>
              <div class="tab-content">
                <?php foreach ($languages as $language) { ?>
                <div class="tab-pane" id="language<?php echo $language['language_id']; ?>">
                  <div class="form-group required">
                    <label class="col-sm-2 control-label" for="input-description<?php echo $language['language_id']; ?>"><?php echo $entry_description; ?></label>
                    <div class="col-sm-10">
                      <textarea name="manufacturer_description[<?php echo $language['language_id']; ?>][description]" placeholder="<?php echo $entry_description; ?>" id="input-description<?php echo $language['language_id']; ?>" class="form-control summernote" data-locale="<?php echo $locale; ?>"><?php echo isset($manufacturer_description[$language['language_id']]) ? $manufacturer_description[$language['language_id']]['description'] : ''; ?></textarea>
                    </div>
                  </div>
                  <div class="form-group required">
                    <label class="col-sm-2 control-label" for="input-meta-title<?php echo $language['language_id']; ?>"><?php echo $entry_meta_title; ?></label>
                    <div class="col-sm-10">
                      <input type="text" name="manufacturer_description[<?php echo $language['language_id']; ?>][meta_title]" value="<?php echo isset($manufacturer_description[$language['language_id']]) ? $manufacturer_description[$language['language_id']]['meta_title'] : ''; ?>" placeholder="<?php echo $entry_meta_title; ?>" id="input-meta-title<?php echo $language['language_id']; ?>" class="form-control" />
                      <?php if (isset($error_meta_title[$language['language_id']])) { ?>
                      <div class="text-danger"><?php echo $error_meta_title[$language['language_id']]; ?></div>
                      <?php } ?>
                    </div>
                  </div>
				  <div class="form-group">
                    <label class="col-sm-2 control-label" for="input-meta-h1<?php echo $language['language_id']; ?>"><?php echo $entry_meta_h1; ?></label>
                    <div class="col-sm-10">
                      <input type="text" name="manufacturer_description[<?php echo $language['language_id']; ?>][meta_h1]" value="<?php echo isset($manufacturer_description[$language['language_id']]) ? $manufacturer_description[$language['language_id']]['meta_h1'] : ''; ?>" placeholder="<?php echo $entry_meta_title; ?>" id="input-meta-h1<?php echo $language['language_id']; ?>" class="form-control" />
                    </div>
                  </div>
                  <div class="form-group">
                    <label class="col-sm-2 control-label" for="input-meta-description<?php echo $language['language_id']; ?>"><?php echo $entry_meta_description; ?></label>
                    <div class="col-sm-10">
                      <textarea name="manufacturer_description[<?php echo $language['language_id']; ?>][meta_description]" rows="5" placeholder="<?php echo $entry_meta_description; ?>" id="input-meta-description<?php echo $language['language_id']; ?>" class="form-control"><?php echo isset($manufacturer_description[$language['language_id']]) ? $manufacturer_description[$language['language_id']]['meta_description'] : ''; ?></textarea>
                    </div>
                  </div>
                  <div class="form-group">
                    <label class="col-sm-2 control-label" for="input-meta-keyword<?php echo $language['language_id']; ?>"><?php echo $entry_meta_keyword; ?></label>
                    <div class="col-sm-10">
                      <textarea name="manufacturer_description[<?php echo $language['language_id']; ?>][meta_keyword]" rows="5" placeholder="<?php echo $entry_meta_keyword; ?>" id="input-meta-keyword<?php echo $language['language_id']; ?>" class="form-control"><?php echo isset($manufacturer_description[$language['language_id']]) ? $manufacturer_description[$language['language_id']]['meta_keyword'] : ''; ?></textarea>
                    </div>
                  </div>
                </div>
                <?php } ?>
              </div>
            </div>
			<div class="tab-pane" id="tab-data">		  
			  <div class="form-group">
				<label class="col-sm-2 control-label"><?php echo $entry_store; ?></label>
				<div class="col-sm-10">
				  <div class="well well-sm" style="height: 150px; overflow: auto;">
					<div class="input-checkbox">
					  <label class="label-store">
						<?php if (in_array(0, $manufacturer_store)) { ?>
						  <input type="checkbox" class="checkbox" name="manufacturer_store[]" value="0" checked="checked" id="input-store" />
						  <label for="input-store"></label>
						  <?php } else { ?>
						  <input type="checkbox" class="checkbox" name="manufacturer_store[]" value="0" id="input-store" />
						  <label for="input-store"></label>
						<?php } ?>	
						<span><?php echo $text_default; ?></span>
					  </label>
					</div>					
					<?php foreach ($stores as $store) { ?>                      
					  <div class="input-checkbox">
						<label class="label-store">
						  <?php if (in_array($store['store_id'], $manufacturer_store)) { ?>
							<input type="checkbox" class="checkbox" name="manufacturer_store[]" value="<?php echo $store['store_id']; ?>" checked="checked" id="input-store<?php echo $store['store_id']; ?>" />
							<label for="input-store<?php echo $store['store_id']; ?>"></label>
							<?php } else { ?>
							<input type="checkbox" class="checkbox" name="manufacturer_store[]" value="<?php echo $store['store_id']; ?>" id="input-store<?php echo $store['store_id']; ?>" />
							<label for="input-store<?php echo $store['store_id']; ?>"></label>						    
						  <?php } ?>
						  <span><?php echo $store['name']; ?></span>
						</label>
					  </div>					  
					<?php } ?>
				  </div>
				</div>
			  </div>
			  <?php if (!$keyword) { ?>
				<div class="form-group">
				  <label class="col-sm-2 control-label"><span data-toggle="tooltip" title="<?php echo $help_auto_keyword; ?>"><?php echo $entry_auto_keyword; ?></span></label>
				  <div class="col-sm-10">
					<select name="auto_keyword_manufacturer" class="form-control" id="auto-keyword-manufacturer">
					  <option value="1" selected="selected"><?php echo $text_yes; ?></option>
					  <option value="0"><?php echo $text_no; ?></option>
					</select>
				  </div>
				</div>
				<?php } else { ?>
				<div class="form-group hide">
				  <label class="col-sm-2 control-label"><?php echo $entry_auto_keyword; ?></label>
				  <div class="col-sm-10">
					<select name="auto_keyword_manufacturer" class="form-control">
					  <option value="0" selected="selected"><?php echo $text_no; ?></option>
					  <option value="1"><?php echo $text_yes; ?></option>
					</select>
				  </div>
				</div>
			  <?php } ?>
			  <div class="form-group" id="seo-url-customs">
				<label class="col-sm-2 control-label" for="input-keyword"><span data-toggle="tooltip" title="<?php echo $help_keyword; ?>"><?php echo $entry_keyword; ?></span></label>
				<div class="col-sm-10">
				  <input type="text" name="keyword" value="<?php echo $keyword; ?>" placeholder="<?php echo $entry_keyword; ?>" id="input-keyword" class="form-control" />
				  <?php if ($error_keyword) { ?>
					<div class="text-danger"><?php echo $error_keyword; ?></div>
				  <?php } ?>
				</div>
			  </div>
			  <div class="form-group">
				<label class="col-sm-2 control-label" for="input-image"><?php echo $entry_image; ?></label>
				<div class="col-sm-10"><a href="" id="thumb-image" data-toggle="image" class="img-thumbnail"><img src="<?php echo $thumb; ?>" alt="" title="" data-placeholder="<?php echo $placeholder; ?>" /></a>
				  <input type="hidden" name="image" value="<?php echo $image; ?>" id="input-image" />
				</div>
			  </div>
			  <div class="form-group">
				<label class="col-sm-2 control-label" for="input-sort-order"><?php echo $entry_sort_order; ?></label>
				<div class="col-sm-10">
				  <input type="text" name="sort_order" value="<?php echo $sort_order; ?>" placeholder="<?php echo $entry_sort_order; ?>" id="input-sort-order" class="form-control" />
				</div>
			  </div>
			</div>
		  </div>
        </form>
      </div>
    </div>
  </div>
  <script type="text/javascript" src="view/javascript/summernote/summernote.js"></script>
  <script type="text/javascript" src="view/javascript/summernote/lang/summernote-<?php echo $locale; ?>.js"></script>
  <link href="view/javascript/summernote/summernote.css" rel="stylesheet" />
  <script type="text/javascript"><!--
$manufacturer_name = $('input[name="name"]'); 
$title = $('.manufacturer_name');

if ($manufacturer_name.val() != '') {
	$title.html(' - ' + $manufacturer_name.val()); 
}
$manufacturer_name.keyup(function() {
	if ($manufacturer_name.val() != '') {
		$title.html(' - ' + $manufacturer_name.val()); 
	} else {
		$title.html('');
	}
});
//--></script>
  <script type="text/javascript"><!--
$(document).ready(function() {
	$('.alert-success').delay(1000).fadeOut(1000);
	
	var selectAutoSeo = $('#auto-keyword-manufacturer');
	
	function selectAutoSeoStatus(){
		if (selectAutoSeo.val() == '1') {
			$('#seo-url-customs').addClass('hide');
		} else {
			$('#seo-url-customs').removeClass('hide');
		}
	}	
	selectAutoSeoStatus();
			
	selectAutoSeo.on('change', function() {
		if (selectAutoSeo.val() == '1') {
			$('#seo-url-customs').addClass('hide');
		} else {
			$('#seo-url-customs').removeClass('hide');
		}
	}); 
});
//--></script>
  <script type="text/javascript"><!--
$(document).ready(function() {
	// Override summernotes image manager
	$('.summernote').each(function() {
		var element = this;
		
		$(element).summernote({
			disableDragAndDrop: true,
			height: 300,
			lang: '<?php echo $locale; ?>',
			emptyPara: '',
			toolbar: [
				['style', ['style']],
				['font', ['bold', 'underline', 'clear']],
				['fontname', ['fontname']],
				['fontsize', ['fontsize']],
				['color', ['color']],
				['para', ['ul', 'ol', 'paragraph']],
				['table', ['table']],
				['insert', ['link', 'image', 'video']],
				['view', ['fullscreen', 'codeview', 'help']]
			],
			buttons: {
    			image: function() {
					var ui = $.summernote.ui;

					// create button
					var button = ui.button({
						contents: '<i class="note-icon-picture" />',
						tooltip: $.summernote.lang[$.summernote.options.lang].image.image,
						click: function () {
							$('#modal-image').remove();
						
							$.ajax({
								url: 'index.php?route=common/filemanager&token=' + getURLVar('token'),
								dataType: 'html',
								beforeSend: function() {
									$('#button-image i').replaceWith('<i class="fa fa-circle-o-notch fa-spin"></i>');
									$('#button-image').prop('disabled', true);
								},
								complete: function() {
									$('#button-image i').replaceWith('<i class="fa fa-upload"></i>');
									$('#button-image').prop('disabled', false);
								},
								success: function(html) {
									$('body').append('<div id="modal-image" class="modal">' + html + '</div>');
									
									$('#modal-image').modal('show');
									
									$('#modal-image').delegate('a.thumbnail', 'click', function(e) {
										e.preventDefault();
										
										$(element).summernote('insertImage', $(this).attr('href'));
																	
										$('#modal-image').modal('hide');
									});
								}
							});						
						}
					});
				
					return button.render();
				}
  			}
		});
	});
	
});
//--></script>
  <script type="text/javascript"><!--
$('#language a:first').tab('show');
//--></script></div>
<?php echo $footer; ?>