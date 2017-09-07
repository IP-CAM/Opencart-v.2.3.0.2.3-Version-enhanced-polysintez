<?php echo $header; ?><?php echo $column_left; ?>
<div id="content">
  <div class="page-header">
    <div class="container-fluid">
      <div class="pull-right">
        <button type="submit" form="form-category" data-toggle="tooltip" title="<?php echo $button_save; ?>" class="btn btn-primary"><i class="fa fa-save"></i></button>
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
    <div class="panel panel-default">
      <div class="panel-heading">
        <h3 class="panel-title"><i class="fa fa-pencil"></i> <?php echo $text_form; ?></h3>
      </div>
      <div class="panel-body">
        <form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data" id="form-category" class="form-horizontal">
          <ul class="nav nav-tabs">
            <li class="active"><a href="#tab-general" data-toggle="tab"><?php echo $tab_general; ?></a></li>
            <li><a href="#tab-data" data-toggle="tab"><?php echo $tab_data; ?></a></li>
			<li><a href="#tab-related" data-toggle="tab"><?php echo $tab_related; ?></a></li>
            <li><a href="#tab-design" data-toggle="tab"><?php echo $tab_design; ?></a></li>
          </ul>
          <div class="tab-content">
            <div class="tab-pane active" id="tab-general">
              <ul class="nav nav-tabs" id="language">
                <?php foreach ($languages as $language) { ?>
                <li><a href="#language<?php echo $language['language_id']; ?>" data-toggle="tab"><img src="language/<?php echo $language['code']; ?>/<?php echo $language['code']; ?>.png" title="<?php echo $language['name']; ?>" /> <?php echo $language['name']; ?></a></li>
                <?php } ?>
              </ul>
              <div class="tab-content">
                <?php foreach ($languages as $language) { ?>
                <div class="tab-pane" id="language<?php echo $language['language_id']; ?>">
                  <div class="form-group required">
                    <label class="col-sm-2 control-label" for="input-name<?php echo $language['language_id']; ?>"><?php echo $entry_name; ?></label>
                    <div class="col-sm-10">
                      <input type="text" name="category_description[<?php echo $language['language_id']; ?>][name]" value="<?php echo isset($category_description[$language['language_id']]) ? $category_description[$language['language_id']]['name'] : ''; ?>" placeholder="<?php echo $entry_name; ?>" id="input-name<?php echo $language['language_id']; ?>" class="form-control" />
                      <?php if (isset($error_name[$language['language_id']])) { ?>
                      <div class="text-danger"><?php echo $error_name[$language['language_id']]; ?></div>
                      <?php } ?>
                    </div>
                  </div>
				  <div class="form-group">
                    <label class="col-sm-2 control-label" for="input-meta-h1<?php echo $language['language_id']; ?>"><?php echo $entry_meta_h1; ?></label>
                    <div class="col-sm-10">
                      <input type="text" name="category_description[<?php echo $language['language_id']; ?>][meta_h1]" value="<?php echo isset($category_description[$language['language_id']]) ? $category_description[$language['language_id']]['meta_h1'] : ''; ?>" placeholder="<?php echo $entry_meta_h1; ?>" id="input-meta-title<?php echo $language['language_id']; ?>" class="form-control" />
                      <?php if (isset($error_meta_h1[$language['language_id']])) { ?>
                      <div class="text-danger"><?php echo $error_meta_h1[$language['language_id']]; ?></div>
                      <?php } ?>
                    </div>
				   </div>
				   <div class="form-group">
                    <label class="col-sm-2 control-label" for="input-meta-title<?php echo $language['language_id']; ?>"><?php echo $entry_meta_title; ?></label>
                    <div class="col-sm-10">
                      <input type="text" name="category_description[<?php echo $language['language_id']; ?>][meta_title]" value="<?php echo isset($category_description[$language['language_id']]) ? $category_description[$language['language_id']]['meta_title'] : ''; ?>" placeholder="<?php echo $entry_meta_title; ?>" id="input-meta-title<?php echo $language['language_id']; ?>" class="form-control" />
                      <?php if (isset($error_meta_title[$language['language_id']])) { ?>
                      <div class="text-danger"><?php echo $error_meta_title[$language['language_id']]; ?></div>
                      <?php } ?>
                    </div>
                  </div>
                  <div class="form-group">
                    <label class="col-sm-2 control-label" for="input-meta-description<?php echo $language['language_id']; ?>"><?php echo $entry_meta_description; ?></label>
                    <div class="col-sm-10">
                      <textarea name="category_description[<?php echo $language['language_id']; ?>][meta_description]" rows="5" placeholder="<?php echo $entry_meta_description; ?>" id="input-meta-description<?php echo $language['language_id']; ?>" class="form-control"><?php echo isset($category_description[$language['language_id']]) ? $category_description[$language['language_id']]['meta_description'] : ''; ?></textarea>
                    </div>
                  </div>
                  <div class="form-group">
                    <label class="col-sm-2 control-label" for="input-meta-keyword<?php echo $language['language_id']; ?>"><?php echo $entry_meta_keyword; ?></label>
                    <div class="col-sm-10">
                      <textarea name="category_description[<?php echo $language['language_id']; ?>][meta_keyword]" rows="5" placeholder="<?php echo $entry_meta_keyword; ?>" id="input-meta-keyword<?php echo $language['language_id']; ?>" class="form-control"><?php echo isset($category_description[$language['language_id']]) ? $category_description[$language['language_id']]['meta_keyword'] : ''; ?></textarea>
                    </div>
                  </div>
                  <div class="form-group">
                    <label class="col-sm-2 control-label" for="input-description<?php echo $language['language_id']; ?>"><?php echo $entry_description; ?></label>
                    <div class="col-sm-10">
                      <textarea name="category_description[<?php echo $language['language_id']; ?>][description]" placeholder="<?php echo $entry_description; ?>" id="input-description<?php echo $language['language_id']; ?>" class="form-control summernote"><?php echo isset($category_description[$language['language_id']]) ? $category_description[$language['language_id']]['description'] : ''; ?></textarea>
                    </div>
                  </div>
				  <div class="form-group">
                    <label class="col-sm-2 control-label" for="input-description_bottom<?php echo $language['language_id']; ?>"><?php echo $entry_description_bottom; ?></label>
                    <div class="col-sm-10">
                      <textarea name="category_description[<?php echo $language['language_id']; ?>][description_bottom]" placeholder="<?php echo $entry_description_bottom; ?>" id="input-description_bottom<?php echo $language['language_id']; ?>" class="form-control summernote"><?php echo isset($category_description[$language['language_id']]) ? $category_description[$language['language_id']]['description_bottom'] : ''; ?></textarea>
                   </div>
                  </div>
                </div>
                <?php } ?>
              </div>
            </div>
            <div class="tab-pane" id="tab-data">
              <div class="form-group">
                <label class="col-sm-2 control-label" for="input-parent"><?php echo $entry_parent; ?></label>
                <div class="col-sm-10">
                  <input type="text" name="path" value="<?php echo $path; ?>" placeholder="<?php echo $entry_parent; ?>" id="input-parent" class="form-control" />
                  <input type="hidden" name="parent_id" value="<?php echo $parent_id; ?>" />
                  <?php if ($error_parent) { ?>
                  <div class="text-danger"><?php echo $error_parent; ?></div>
                  <?php } ?>
                </div>
              </div>
              <div class="form-group">
                <label class="col-sm-2 control-label" for="input-filter"><span data-toggle="tooltip" title="<?php echo $help_filter; ?>"><?php echo $entry_filter; ?></span></label>
                <div class="col-sm-10">
                  <input type="text" name="filter" value="" placeholder="<?php echo $entry_filter; ?>" id="input-filter" class="form-control" />
                  <div id="category-filter" class="well well-sm" style="height: 150px; overflow: auto;">
                    <?php foreach ($category_filters as $category_filter) { ?>
                    <div id="category-filter<?php echo $category_filter['filter_id']; ?>"><i class="fa fa-minus-circle"></i> <?php echo $category_filter['name']; ?>
                      <input type="hidden" name="category_filter[]" value="<?php echo $category_filter['filter_id']; ?>" />
                    </div>
                    <?php } ?>
                  </div>
                </div>
              </div>
              <div class="form-group">
                <label class="col-sm-2 control-label"><?php echo $entry_store; ?></label>
                <div class="col-sm-10">
                  <div class="well well-sm" style="height: 150px; overflow: auto;">
                    <div class="checkbox">
                      <label>
                        <?php if (in_array(0, $category_store)) { ?>
                        <input type="checkbox" name="category_store[]" value="0" checked="checked" />
                        <?php echo $text_default; ?>
                        <?php } else { ?>
                        <input type="checkbox" name="category_store[]" value="0" />
                        <?php echo $text_default; ?>
                        <?php } ?>
                      </label>
                    </div>
                    <?php foreach ($stores as $store) { ?>
                    <div class="checkbox">
                      <label>
                        <?php if (in_array($store['store_id'], $category_store)) { ?>
                        <input type="checkbox" name="category_store[]" value="<?php echo $store['store_id']; ?>" checked="checked" />
                        <?php echo $store['name']; ?>
                        <?php } else { ?>
                        <input type="checkbox" name="category_store[]" value="<?php echo $store['store_id']; ?>" />
                        <?php echo $store['name']; ?>
                        <?php } ?>
                      </label>
                    </div>
                    <?php } ?>
                  </div>
                </div>
              </div>
              <div class="form-group">
                <label class="col-sm-2 control-label" for="input-keyword"><span data-toggle="tooltip" title="<?php echo $help_keyword; ?>"><?php echo $entry_keyword; ?></span></label>
                <div class="col-sm-10">
                  <input type="text" name="keyword" value="<?php echo $keyword; ?>" placeholder="<?php echo $entry_keyword; ?>" id="input-keyword" class="form-control" />
                  <?php if ($error_keyword) { ?>
                  <div class="text-danger"><?php echo $error_keyword; ?></div>
                  <?php } ?>
                </div>
              </div>
              <div class="form-group">
                <label class="col-sm-2 control-label"><?php echo $entry_image; ?></label>
                <div class="col-sm-10"><a href="" id="thumb-image" data-toggle="image" class="img-thumbnail"><img src="<?php echo $thumb; ?>" alt="" title="" data-placeholder="<?php echo $placeholder; ?>" /></a>
                  <input type="hidden" name="image" value="<?php echo $image; ?>" id="input-image" />
                </div>
              </div>

				<div class="form-group">
					<label class="col-sm-2 control-label">Изображение в выпадающем меню:</label>
					<div class="col-sm-10"><a href="" id="thumb-image2" data-toggle="image" class="img-thumbnail"><img src="<?php echo $thumb2; ?>" alt="" title="" data-placeholder="<?php echo $placeholder; ?>" /></a>
					  <input type="hidden" name="image2" value="<?php echo $image2; ?>" id="input-image2" />
					</div>
				</div>
				<div class="form-group">
					<div id="form-revolution" class="form-group">
						<div class="form-group" style="padding:0">
							<label class="col-sm-2 control-label">Иконка в меню:</label>
							<div class="col-sm-2">
								<label class="radio-inline">
									<input type="radio" onchange="$(this).parent().parent().parent().find('.zavisimost_ico').show().next().hide();" name="category_icontype" value="1" <?php if ($category_icontype) { echo 'checked'; } ?> /><span>Иконка</span>
								</label>
								<label class="radio-inline">
									<input type="radio" onchange="$(this).parent().parent().parent().find('.zavisimost_ico').hide().next().show();" name="category_icontype" value="0" <?php if (!$category_icontype) { echo 'checked';} ?> /><span>Картинка</span>
								</label>	
							</div>
							<div class="col-sm-2 zavisimost_ico" <?php if (!$category_icontype) { ?> style="display: none" <?php } ?>>
								<span class="fazavisimost fa_icon form-control width_initial" id="icon_category" onclick="fa_icons($(this).attr('id'))"><i class="<?php echo $category_icon; ?>"></i></span>
								<input type="hidden" name="category_icon" value="<?php echo $category_icon; ?>" id="input-icon_category" />
							</div>
							<div class="col-sm-2" <?php if ($category_icontype) { ?> style="display: none" <?php } ?>>
								<a href="" id="thumb-image_category" data-toggle="image" class="img-thumbnail width_initial"><img style="width:25px;" src="<?php echo $category_image_thumb; ?>" alt="" title="" /></a>
								<input type="hidden" name="category_image" value="<?php echo $category_image; ?>" id="category_image" />
							</div>
						</div>
					<input type="hidden" class="target" value="" />
					<input type="hidden" class="class" value="" />
					<div class="fa_icons">
					<div class="fontawesome-icon-list">
					<div class="col-xs-2" style="margin-bottom:5px;margin-left:-20px;float:initial;"><i class="fa none" aria-hidden="true">Не использовать иконку</i></div>
					<div class="col-xs-1"><i class="fa fa-500px"></i></div>
					<div class="col-xs-1"><i class="fa fa-address-book"></i></div>
					<div class="col-xs-1"><i class="fa fa-address-book-o"></i></div>
					<div class="col-xs-1"><i class="fa fa-address-card"></i></div>
					<div class="col-xs-1"><i class="fa fa-address-card-o"></i></div>
					<div class="col-xs-1"><i class="fa fa-adjust"></i></div>
					<div class="col-xs-1"><i class="fa fa-adn"></i></div>
					<div class="col-xs-1"><i class="fa fa-align-center"></i></div>
					<div class="col-xs-1"><i class="fa fa-align-justify"></i></div>
					<div class="col-xs-1"><i class="fa fa-align-left"></i></div>
					<div class="col-xs-1"><i class="fa fa-align-right"></i></div>
					<div class="col-xs-1"><i class="fa fa-amazon"></i></div>
					<div class="col-xs-1"><i class="fa fa-ambulance"></i></div>
					<div class="col-xs-1"><i class="fa fa-american-sign-language-interpreting"></i></div>
					<div class="col-xs-1"><i class="fa fa-anchor"></i></div>
					<div class="col-xs-1"><i class="fa fa-android"></i></div>
					<div class="col-xs-1"><i class="fa fa-angellist"></i></div>
					<div class="col-xs-1"><i class="fa fa-angle-double-down"></i></div>
					<div class="col-xs-1"><i class="fa fa-angle-double-left"></i></div>
					<div class="col-xs-1"><i class="fa fa-angle-double-right"></i></div>
					<div class="col-xs-1"><i class="fa fa-angle-double-up"></i></div>
					<div class="col-xs-1"><i class="fa fa-angle-down"></i></div>
					<div class="col-xs-1"><i class="fa fa-angle-left"></i></div>
					<div class="col-xs-1"><i class="fa fa-angle-right"></i></div>
					<div class="col-xs-1"><i class="fa fa-angle-up"></i></div>
					<div class="col-xs-1"><i class="fa fa-apple"></i></div>
					<div class="col-xs-1"><i class="fa fa-archive"></i></div>
					<div class="col-xs-1"><i class="fa fa-area-chart"></i></div>
					<div class="col-xs-1"><i class="fa fa-arrow-circle-down"></i></div>
					<div class="col-xs-1"><i class="fa fa-arrow-circle-left"></i></div>
					<div class="col-xs-1"><i class="fa fa-arrow-circle-o-down"></i></div>
					<div class="col-xs-1"><i class="fa fa-arrow-circle-o-left"></i></div>
					<div class="col-xs-1"><i class="fa fa-arrow-circle-o-right"></i></div>
					<div class="col-xs-1"><i class="fa fa-arrow-circle-o-up"></i></div>
					<div class="col-xs-1"><i class="fa fa-arrow-circle-right"></i></div>
					<div class="col-xs-1"><i class="fa fa-arrow-circle-up"></i></div>
					<div class="col-xs-1"><i class="fa fa-arrow-down"></i></div>
					<div class="col-xs-1"><i class="fa fa-arrow-left"></i></div>
					<div class="col-xs-1"><i class="fa fa-arrow-right"></i></div>
					<div class="col-xs-1"><i class="fa fa-arrow-up"></i></div>
					<div class="col-xs-1"><i class="fa fa-arrows"></i></div>
					<div class="col-xs-1"><i class="fa fa-arrows-alt"></i></div>
					<div class="col-xs-1"><i class="fa fa-arrows-h"></i></div>
					<div class="col-xs-1"><i class="fa fa-arrows-v"></i></div>
					<div class="col-xs-1"><i class="fa fa-asl-interpreting"></i></div>
					<div class="col-xs-1"><i class="fa fa-assistive-listening-systems"></i></div>
					<div class="col-xs-1"><i class="fa fa-asterisk"></i></div>
					<div class="col-xs-1"><i class="fa fa-at"></i></div>
					<div class="col-xs-1"><i class="fa fa-audio-description"></i></div>
					<div class="col-xs-1"><i class="fa fa-automobile"></i></div>
					<div class="col-xs-1"><i class="fa fa-backward"></i></div>
					<div class="col-xs-1"><i class="fa fa-balance-scale"></i></div>
					<div class="col-xs-1"><i class="fa fa-ban"></i></div>
					<div class="col-xs-1"><i class="fa fa-bandcamp"></i></div>
					<div class="col-xs-1"><i class="fa fa-bank"></i></div>
					<div class="col-xs-1"><i class="fa fa-bar-chart"></i></div>
					<div class="col-xs-1"><i class="fa fa-bar-chart-o"></i></div>
					<div class="col-xs-1"><i class="fa fa-barcode"></i></div>
					<div class="col-xs-1"><i class="fa fa-bars"></i></div>
					<div class="col-xs-1"><i class="fa fa-bath"></i></div>
					<div class="col-xs-1"><i class="fa fa-bathtub"></i></div>
					<div class="col-xs-1"><i class="fa fa-battery"></i></div>
					<div class="col-xs-1"><i class="fa fa-battery-0"></i></div>
					<div class="col-xs-1"><i class="fa fa-battery-1"></i></div>
					<div class="col-xs-1"><i class="fa fa-battery-2"></i></div>
					<div class="col-xs-1"><i class="fa fa-battery-3"></i></div>
					<div class="col-xs-1"><i class="fa fa-battery-4"></i></div>
					<div class="col-xs-1"><i class="fa fa-battery-empty"></i></div>
					<div class="col-xs-1"><i class="fa fa-battery-full"></i></div>
					<div class="col-xs-1"><i class="fa fa-battery-half"></i></div>
					<div class="col-xs-1"><i class="fa fa-battery-quarter"></i></div>
					<div class="col-xs-1"><i class="fa fa-battery-three-quarters"></i></div>
					<div class="col-xs-1"><i class="fa fa-bed"></i></div>
					<div class="col-xs-1"><i class="fa fa-beer"></i></div>
					<div class="col-xs-1"><i class="fa fa-behance"></i></div>
					<div class="col-xs-1"><i class="fa fa-behance-square"></i></div>
					<div class="col-xs-1"><i class="fa fa-bell"></i></div>
					<div class="col-xs-1"><i class="fa fa-bell-o"></i></div>
					<div class="col-xs-1"><i class="fa fa-bell-slash"></i></div>
					<div class="col-xs-1"><i class="fa fa-bell-slash-o"></i></div>
					<div class="col-xs-1"><i class="fa fa-bicycle"></i></div>
					<div class="col-xs-1"><i class="fa fa-binoculars"></i></div>
					<div class="col-xs-1"><i class="fa fa-birthday-cake"></i></div>
					<div class="col-xs-1"><i class="fa fa-bitbucket"></i></div>
					<div class="col-xs-1"><i class="fa fa-bitbucket-square"></i></div>
					<div class="col-xs-1"><i class="fa fa-bitcoin"></i></div>
					<div class="col-xs-1"><i class="fa fa-black-tie"></i></div>
					<div class="col-xs-1"><i class="fa fa-blind"></i></div>
					<div class="col-xs-1"><i class="fa fa-bluetooth"></i></div>
					<div class="col-xs-1"><i class="fa fa-bluetooth-b"></i></div>
					<div class="col-xs-1"><i class="fa fa-bold"></i></div>
					<div class="col-xs-1"><i class="fa fa-bolt"></i></div>
					<div class="col-xs-1"><i class="fa fa-bomb"></i></div>
					<div class="col-xs-1"><i class="fa fa-book"></i></div>
					<div class="col-xs-1"><i class="fa fa-bookmark"></i></div>
					<div class="col-xs-1"><i class="fa fa-bookmark-o"></i></div>
					<div class="col-xs-1"><i class="fa fa-braille"></i></div>
					<div class="col-xs-1"><i class="fa fa-briefcase"></i></div>
					<div class="col-xs-1"><i class="fa fa-btc"></i></div>
					<div class="col-xs-1"><i class="fa fa-bug"></i></div>
					<div class="col-xs-1"><i class="fa fa-building"></i></div>
					<div class="col-xs-1"><i class="fa fa-building-o"></i></div>
					<div class="col-xs-1"><i class="fa fa-bullhorn"></i></div>
					<div class="col-xs-1"><i class="fa fa-bullseye"></i></div>
					<div class="col-xs-1"><i class="fa fa-bus"></i></div>
					<div class="col-xs-1"><i class="fa fa-buysellads"></i></div>
					<div class="col-xs-1"><i class="fa fa-cab"></i></div>
					<div class="col-xs-1"><i class="fa fa-calculator"></i></div>
					<div class="col-xs-1"><i class="fa fa-calendar"></i></div>
					<div class="col-xs-1"><i class="fa fa-calendar-check-o"></i></div>
					<div class="col-xs-1"><i class="fa fa-calendar-minus-o"></i></div>
					<div class="col-xs-1"><i class="fa fa-calendar-o"></i></div>
					<div class="col-xs-1"><i class="fa fa-calendar-plus-o"></i></div>
					<div class="col-xs-1"><i class="fa fa-calendar-times-o"></i></div>
					<div class="col-xs-1"><i class="fa fa-camera"></i></div>
					<div class="col-xs-1"><i class="fa fa-camera-retro"></i></div>
					<div class="col-xs-1"><i class="fa fa-car"></i></div>
					<div class="col-xs-1"><i class="fa fa-caret-down"></i></div>
					<div class="col-xs-1"><i class="fa fa-caret-left"></i></div>
					<div class="col-xs-1"><i class="fa fa-caret-right"></i></div>
					<div class="col-xs-1"><i class="fa fa-caret-square-o-down"></i></div>
					<div class="col-xs-1"><i class="fa fa-caret-square-o-left"></i></div>
					<div class="col-xs-1"><i class="fa fa-caret-square-o-right"></i></div>
					<div class="col-xs-1"><i class="fa fa-caret-square-o-up"></i></div>
					<div class="col-xs-1"><i class="fa fa-caret-up"></i></div>
					<div class="col-xs-1"><i class="fa fa-cart-arrow-down"></i></div>
					<div class="col-xs-1"><i class="fa fa-cart-plus"></i></div>
					<div class="col-xs-1"><i class="fa fa-cc"></i></div>
					<div class="col-xs-1"><i class="fa fa-cc-amex"></i></div>
					<div class="col-xs-1"><i class="fa fa-cc-diners-club"></i></div>
					<div class="col-xs-1"><i class="fa fa-cc-discover"></i></div>
					<div class="col-xs-1"><i class="fa fa-cc-jcb"></i></div>
					<div class="col-xs-1"><i class="fa fa-cc-mastercard"></i></div>
					<div class="col-xs-1"><i class="fa fa-cc-paypal"></i></div>
					<div class="col-xs-1"><i class="fa fa-cc-stripe"></i></div>
					<div class="col-xs-1"><i class="fa fa-cc-visa"></i></div>
					<div class="col-xs-1"><i class="fa fa-certificate"></i></div>
					<div class="col-xs-1"><i class="fa fa-chain"></i></div>
					<div class="col-xs-1"><i class="fa fa-chain-broken"></i></div>
					<div class="col-xs-1"><i class="fa fa-check"></i></div>
					<div class="col-xs-1"><i class="fa fa-check-circle"></i></div>
					<div class="col-xs-1"><i class="fa fa-check-circle-o"></i></div>
					<div class="col-xs-1"><i class="fa fa-check-square"></i></div>
					<div class="col-xs-1"><i class="fa fa-check-square-o"></i></div>
					<div class="col-xs-1"><i class="fa fa-chevron-circle-down"></i></div>
					<div class="col-xs-1"><i class="fa fa-chevron-circle-left"></i></div>
					<div class="col-xs-1"><i class="fa fa-chevron-circle-right"></i></div>
					<div class="col-xs-1"><i class="fa fa-chevron-circle-up"></i></div>
					<div class="col-xs-1"><i class="fa fa-chevron-down"></i></div>
					<div class="col-xs-1"><i class="fa fa-chevron-left"></i></div>
					<div class="col-xs-1"><i class="fa fa-chevron-right"></i></div>
					<div class="col-xs-1"><i class="fa fa-chevron-up"></i></div>
					<div class="col-xs-1"><i class="fa fa-child"></i></div>
					<div class="col-xs-1"><i class="fa fa-chrome"></i></div>
					<div class="col-xs-1"><i class="fa fa-circle"></i></div>
					<div class="col-xs-1"><i class="fa fa-circle-o"></i></div>
					<div class="col-xs-1"><i class="fa fa-circle-o-notch"></i></div>
					<div class="col-xs-1"><i class="fa fa-circle-thin"></i></div>
					<div class="col-xs-1"><i class="fa fa-clipboard"></i></div>
					<div class="col-xs-1"><i class="fa fa-clock-o"></i></div>
					<div class="col-xs-1"><i class="fa fa-clone"></i></div>
					<div class="col-xs-1"><i class="fa fa-close"></i></div>
					<div class="col-xs-1"><i class="fa fa-cloud"></i></div>
					<div class="col-xs-1"><i class="fa fa-cloud-download"></i></div>
					<div class="col-xs-1"><i class="fa fa-cloud-upload"></i></div>
					<div class="col-xs-1"><i class="fa fa-cny"></i></div>
					<div class="col-xs-1"><i class="fa fa-code"></i></div>
					<div class="col-xs-1"><i class="fa fa-code-fork"></i></div>
					<div class="col-xs-1"><i class="fa fa-codepen"></i></div>
					<div class="col-xs-1"><i class="fa fa-codiepie"></i></div>
					<div class="col-xs-1"><i class="fa fa-coffee"></i></div>
					<div class="col-xs-1"><i class="fa fa-cog"></i></div>
					<div class="col-xs-1"><i class="fa fa-cogs"></i></div>
					<div class="col-xs-1"><i class="fa fa-columns"></i></div>
					<div class="col-xs-1"><i class="fa fa-comment"></i></div>
					<div class="col-xs-1"><i class="fa fa-comment-o"></i></div>
					<div class="col-xs-1"><i class="fa fa-commenting"></i></div>
					<div class="col-xs-1"><i class="fa fa-commenting-o"></i></div>
					<div class="col-xs-1"><i class="fa fa-comments"></i></div>
					<div class="col-xs-1"><i class="fa fa-comments-o"></i></div>
					<div class="col-xs-1"><i class="fa fa-compass"></i></div>
					<div class="col-xs-1"><i class="fa fa-compress"></i></div>
					<div class="col-xs-1"><i class="fa fa-connectdevelop"></i></div>
					<div class="col-xs-1"><i class="fa fa-contao"></i></div>
					<div class="col-xs-1"><i class="fa fa-copy"></i></div>
					<div class="col-xs-1"><i class="fa fa-copyright"></i></div>
					<div class="col-xs-1"><i class="fa fa-creative-commons"></i></div>
					<div class="col-xs-1"><i class="fa fa-credit-card"></i></div>
					<div class="col-xs-1"><i class="fa fa-credit-card-alt"></i></div>
					<div class="col-xs-1"><i class="fa fa-crop"></i></div>
					<div class="col-xs-1"><i class="fa fa-crosshairs"></i></div>
					<div class="col-xs-1"><i class="fa fa-css3"></i></div>
					<div class="col-xs-1"><i class="fa fa-cube"></i></div>
					<div class="col-xs-1"><i class="fa fa-cubes"></i></div>
					<div class="col-xs-1"><i class="fa fa-cut"></i></div>
					<div class="col-xs-1"><i class="fa fa-cutlery"></i></div>
					<div class="col-xs-1"><i class="fa fa-dashboard"></i></div>
					<div class="col-xs-1"><i class="fa fa-dashcube"></i></div>
					<div class="col-xs-1"><i class="fa fa-database"></i></div>
					<div class="col-xs-1"><i class="fa fa-deaf"></i></div>
					<div class="col-xs-1"><i class="fa fa-deafness"></i></div>
					<div class="col-xs-1"><i class="fa fa-dedent"></i></div>
					<div class="col-xs-1"><i class="fa fa-delicious"></i></div>
					<div class="col-xs-1"><i class="fa fa-desktop"></i></div>
					<div class="col-xs-1"><i class="fa fa-deviantart"></i></div>
					<div class="col-xs-1"><i class="fa fa-diamond"></i></div>
					<div class="col-xs-1"><i class="fa fa-digg"></i></div>
					<div class="col-xs-1"><i class="fa fa-dollar"></i></div>
					<div class="col-xs-1"><i class="fa fa-dot-circle-o"></i></div>
					<div class="col-xs-1"><i class="fa fa-download"></i></div>
					<div class="col-xs-1"><i class="fa fa-dribbble"></i></div>
					<div class="col-xs-1"><i class="fa fa-drivers-license"></i></div>
					<div class="col-xs-1"><i class="fa fa-drivers-license-o"></i></div>
					<div class="col-xs-1"><i class="fa fa-dropbox"></i></div>
					<div class="col-xs-1"><i class="fa fa-drupal"></i></div>
					<div class="col-xs-1"><i class="fa fa-edge"></i></div>
					<div class="col-xs-1"><i class="fa fa-edit"></i></div>
					<div class="col-xs-1"><i class="fa fa-eercast"></i></div>
					<div class="col-xs-1"><i class="fa fa-eject"></i></div>
					<div class="col-xs-1"><i class="fa fa-ellipsis-h"></i></div>
					<div class="col-xs-1"><i class="fa fa-ellipsis-v"></i></div>
					<div class="col-xs-1"><i class="fa fa-empire"></i></div>
					<div class="col-xs-1"><i class="fa fa-envelope"></i></div>
					<div class="col-xs-1"><i class="fa fa-envelope-o"></i></div>
					<div class="col-xs-1"><i class="fa fa-envelope-open"></i></div>
					<div class="col-xs-1"><i class="fa fa-envelope-open-o"></i></div>
					<div class="col-xs-1"><i class="fa fa-envelope-square"></i></div>
					<div class="col-xs-1"><i class="fa fa-envira"></i></div>
					<div class="col-xs-1"><i class="fa fa-eraser"></i></div>
					<div class="col-xs-1"><i class="fa fa-etsy"></i></div>
					<div class="col-xs-1"><i class="fa fa-eur"></i></div>
					<div class="col-xs-1"><i class="fa fa-euro"></i></div>
					<div class="col-xs-1"><i class="fa fa-exchange"></i></div>
					<div class="col-xs-1"><i class="fa fa-exclamation"></i></div>
					<div class="col-xs-1"><i class="fa fa-exclamation-circle"></i></div>
					<div class="col-xs-1"><i class="fa fa-exclamation-triangle"></i></div>
					<div class="col-xs-1"><i class="fa fa-expand"></i></div>
					<div class="col-xs-1"><i class="fa fa-expeditedssl"></i></div>
					<div class="col-xs-1"><i class="fa fa-external-link"></i></div>
					<div class="col-xs-1"><i class="fa fa-external-link-square"></i></div>
					<div class="col-xs-1"><i class="fa fa-eye"></i></div>
					<div class="col-xs-1"><i class="fa fa-eye-slash"></i></div>
					<div class="col-xs-1"><i class="fa fa-eyedropper"></i></div>
					<div class="col-xs-1"><i class="fa fa-fa"></i></div>
					<div class="col-xs-1"><i class="fa fa-facebook"></i></div>
					<div class="col-xs-1"><i class="fa fa-facebook-f"></i></div>
					<div class="col-xs-1"><i class="fa fa-facebook-official"></i></div>
					<div class="col-xs-1"><i class="fa fa-facebook-square"></i></div>
					<div class="col-xs-1"><i class="fa fa-fast-backward"></i></div>
					<div class="col-xs-1"><i class="fa fa-fast-forward"></i></div>
					<div class="col-xs-1"><i class="fa fa-fax"></i></div>
					<div class="col-xs-1"><i class="fa fa-feed"></i></div>
					<div class="col-xs-1"><i class="fa fa-female"></i></div>
					<div class="col-xs-1"><i class="fa fa-fighter-jet"></i></div>
					<div class="col-xs-1"><i class="fa fa-file"></i></div>
					<div class="col-xs-1"><i class="fa fa-file-archive-o"></i></div>
					<div class="col-xs-1"><i class="fa fa-file-audio-o"></i></div>
					<div class="col-xs-1"><i class="fa fa-file-code-o"></i></div>
					<div class="col-xs-1"><i class="fa fa-file-excel-o"></i></div>
					<div class="col-xs-1"><i class="fa fa-file-image-o"></i></div>
					<div class="col-xs-1"><i class="fa fa-file-movie-o"></i></div>
					<div class="col-xs-1"><i class="fa fa-file-o"></i></div>
					<div class="col-xs-1"><i class="fa fa-file-pdf-o"></i></div>
					<div class="col-xs-1"><i class="fa fa-file-photo-o"></i></div>
					<div class="col-xs-1"><i class="fa fa-file-picture-o"></i></div>
					<div class="col-xs-1"><i class="fa fa-file-powerpoint-o"></i></div>
					<div class="col-xs-1"><i class="fa fa-file-sound-o"></i></div>
					<div class="col-xs-1"><i class="fa fa-file-text"></i></div>
					<div class="col-xs-1"><i class="fa fa-file-text-o"></i></div>
					<div class="col-xs-1"><i class="fa fa-file-video-o"></i></div>
					<div class="col-xs-1"><i class="fa fa-file-word-o"></i></div>
					<div class="col-xs-1"><i class="fa fa-file-zip-o"></i></div>
					<div class="col-xs-1"><i class="fa fa-files-o"></i></div>
					<div class="col-xs-1"><i class="fa fa-film"></i></div>
					<div class="col-xs-1"><i class="fa fa-filter"></i></div>
					<div class="col-xs-1"><i class="fa fa-fire"></i></div>
					<div class="col-xs-1"><i class="fa fa-fire-extinguisher"></i></div>
					<div class="col-xs-1"><i class="fa fa-firefox"></i></div>
					<div class="col-xs-1"><i class="fa fa-first-order"></i></div>
					<div class="col-xs-1"><i class="fa fa-flag"></i></div>
					<div class="col-xs-1"><i class="fa fa-flag-checkered"></i></div>
					<div class="col-xs-1"><i class="fa fa-flag-o"></i></div>
					<div class="col-xs-1"><i class="fa fa-flash"></i></div>
					<div class="col-xs-1"><i class="fa fa-flask"></i></div>
					<div class="col-xs-1"><i class="fa fa-flickr"></i></div>
					<div class="col-xs-1"><i class="fa fa-floppy-o"></i></div>
					<div class="col-xs-1"><i class="fa fa-folder"></i></div>
					<div class="col-xs-1"><i class="fa fa-folder-o"></i></div>
					<div class="col-xs-1"><i class="fa fa-folder-open"></i></div>
					<div class="col-xs-1"><i class="fa fa-folder-open-o"></i></div>
					<div class="col-xs-1"><i class="fa fa-font"></i></div>
					<div class="col-xs-1"><i class="fa fa-font-awesome"></i></div>
					<div class="col-xs-1"><i class="fa fa-fonticons"></i></div>
					<div class="col-xs-1"><i class="fa fa-fort-awesome"></i></div>
					<div class="col-xs-1"><i class="fa fa-forumbee"></i></div>
					<div class="col-xs-1"><i class="fa fa-forward"></i></div>
					<div class="col-xs-1"><i class="fa fa-foursquare"></i></div>
					<div class="col-xs-1"><i class="fa fa-free-code-camp"></i></div>
					<div class="col-xs-1"><i class="fa fa-frown-o"></i></div>
					<div class="col-xs-1"><i class="fa fa-futbol-o"></i></div>
					<div class="col-xs-1"><i class="fa fa-gamepad"></i></div>
					<div class="col-xs-1"><i class="fa fa-gavel"></i></div>
					<div class="col-xs-1"><i class="fa fa-gbp"></i></div>
					<div class="col-xs-1"><i class="fa fa-ge"></i></div>
					<div class="col-xs-1"><i class="fa fa-gear"></i></div>
					<div class="col-xs-1"><i class="fa fa-gears"></i></div>
					<div class="col-xs-1"><i class="fa fa-genderless"></i></div>
					<div class="col-xs-1"><i class="fa fa-get-pocket"></i></div>
					<div class="col-xs-1"><i class="fa fa-gg"></i></div>
					<div class="col-xs-1"><i class="fa fa-gg-circle"></i></div>
					<div class="col-xs-1"><i class="fa fa-gift"></i></div>
					<div class="col-xs-1"><i class="fa fa-git"></i></div>
					<div class="col-xs-1"><i class="fa fa-git-square"></i></div>
					<div class="col-xs-1"><i class="fa fa-github"></i></div>
					<div class="col-xs-1"><i class="fa fa-github-alt"></i></div>
					<div class="col-xs-1"><i class="fa fa-github-square"></i></div>
					<div class="col-xs-1"><i class="fa fa-gitlab"></i></div>
					<div class="col-xs-1"><i class="fa fa-gittip"></i></div>
					<div class="col-xs-1"><i class="fa fa-glass"></i></div>
					<div class="col-xs-1"><i class="fa fa-glide"></i></div>
					<div class="col-xs-1"><i class="fa fa-glide-g"></i></div>
					<div class="col-xs-1"><i class="fa fa-globe"></i></div>
					<div class="col-xs-1"><i class="fa fa-google"></i></div>
					<div class="col-xs-1"><i class="fa fa-google-plus"></i></div>
					<div class="col-xs-1"><i class="fa fa-google-plus-circle"></i></div>
					<div class="col-xs-1"><i class="fa fa-google-plus-official"></i></div>
					<div class="col-xs-1"><i class="fa fa-google-plus-square"></i></div>
					<div class="col-xs-1"><i class="fa fa-google-wallet"></i></div>
					<div class="col-xs-1"><i class="fa fa-graduation-cap"></i></div>
					<div class="col-xs-1"><i class="fa fa-gratipay"></i></div>
					<div class="col-xs-1"><i class="fa fa-grav"></i></div>
					<div class="col-xs-1"><i class="fa fa-group"></i></div>
					<div class="col-xs-1"><i class="fa fa-h-square"></i></div>
					<div class="col-xs-1"><i class="fa fa-hacker-news"></i></div>
					<div class="col-xs-1"><i class="fa fa-hand-grab-o"></i></div>
					<div class="col-xs-1"><i class="fa fa-hand-lizard-o"></i></div>
					<div class="col-xs-1"><i class="fa fa-hand-o-down"></i></div>
					<div class="col-xs-1"><i class="fa fa-hand-o-left"></i></div>
					<div class="col-xs-1"><i class="fa fa-hand-o-right"></i></div>
					<div class="col-xs-1"><i class="fa fa-hand-o-up"></i></div>
					<div class="col-xs-1"><i class="fa fa-hand-paper-o"></i></div>
					<div class="col-xs-1"><i class="fa fa-hand-peace-o"></i></div>
					<div class="col-xs-1"><i class="fa fa-hand-pointer-o"></i></div>
					<div class="col-xs-1"><i class="fa fa-hand-rock-o"></i></div>
					<div class="col-xs-1"><i class="fa fa-hand-scissors-o"></i></div>
					<div class="col-xs-1"><i class="fa fa-hand-spock-o"></i></div>
					<div class="col-xs-1"><i class="fa fa-hand-stop-o"></i></div>
					<div class="col-xs-1"><i class="fa fa-handshake-o"></i></div>
					<div class="col-xs-1"><i class="fa fa-hard-of-hearing"></i></div>
					<div class="col-xs-1"><i class="fa fa-hashtag"></i></div>
					<div class="col-xs-1"><i class="fa fa-hdd-o"></i></div>
					<div class="col-xs-1"><i class="fa fa-header"></i></div>
					<div class="col-xs-1"><i class="fa fa-headphones"></i></div>
					<div class="col-xs-1"><i class="fa fa-heart"></i></div>
					<div class="col-xs-1"><i class="fa fa-heart-o"></i></div>
					<div class="col-xs-1"><i class="fa fa-heartbeat"></i></div>
					<div class="col-xs-1"><i class="fa fa-history"></i></div>
					<div class="col-xs-1"><i class="fa fa-home"></i></div>
					<div class="col-xs-1"><i class="fa fa-hospital-o"></i></div>
					<div class="col-xs-1"><i class="fa fa-hotel"></i></div>
					<div class="col-xs-1"><i class="fa fa-hourglass"></i></div>
					<div class="col-xs-1"><i class="fa fa-hourglass-1"></i></div>
					<div class="col-xs-1"><i class="fa fa-hourglass-2"></i></div>
					<div class="col-xs-1"><i class="fa fa-hourglass-3"></i></div>
					<div class="col-xs-1"><i class="fa fa-hourglass-end"></i></div>
					<div class="col-xs-1"><i class="fa fa-hourglass-half"></i></div>
					<div class="col-xs-1"><i class="fa fa-hourglass-o"></i></div>
					<div class="col-xs-1"><i class="fa fa-hourglass-start"></i></div>
					<div class="col-xs-1"><i class="fa fa-houzz"></i></div>
					<div class="col-xs-1"><i class="fa fa-html5"></i></div>
					<div class="col-xs-1"><i class="fa fa-i-cursor"></i></div>
					<div class="col-xs-1"><i class="fa fa-id-badge"></i></div>
					<div class="col-xs-1"><i class="fa fa-id-card"></i></div>
					<div class="col-xs-1"><i class="fa fa-id-card-o"></i></div>
					<div class="col-xs-1"><i class="fa fa-ils"></i></div>
					<div class="col-xs-1"><i class="fa fa-image"></i></div>
					<div class="col-xs-1"><i class="fa fa-imdb"></i></div>
					<div class="col-xs-1"><i class="fa fa-inbox"></i></div>
					<div class="col-xs-1"><i class="fa fa-indent"></i></div>
					<div class="col-xs-1"><i class="fa fa-industry"></i></div>
					<div class="col-xs-1"><i class="fa fa-info"></i></div>
					<div class="col-xs-1"><i class="fa fa-info-circle"></i></div>
					<div class="col-xs-1"><i class="fa fa-inr"></i></div>
					<div class="col-xs-1"><i class="fa fa-instagram"></i></div>
					<div class="col-xs-1"><i class="fa fa-institution"></i></div>
					<div class="col-xs-1"><i class="fa fa-internet-explorer"></i></div>
					<div class="col-xs-1"><i class="fa fa-intersex"></i></div>
					<div class="col-xs-1"><i class="fa fa-ioxhost"></i></div>
					<div class="col-xs-1"><i class="fa fa-italic"></i></div>
					<div class="col-xs-1"><i class="fa fa-joomla"></i></div>
					<div class="col-xs-1"><i class="fa fa-jpy"></i></div>
					<div class="col-xs-1"><i class="fa fa-jsfiddle"></i></div>
					<div class="col-xs-1"><i class="fa fa-key"></i></div>
					<div class="col-xs-1"><i class="fa fa-keyboard-o"></i></div>
					<div class="col-xs-1"><i class="fa fa-krw"></i></div>
					<div class="col-xs-1"><i class="fa fa-language"></i></div>
					<div class="col-xs-1"><i class="fa fa-laptop"></i></div>
					<div class="col-xs-1"><i class="fa fa-lastfm"></i></div>
					<div class="col-xs-1"><i class="fa fa-lastfm-square"></i></div>
					<div class="col-xs-1"><i class="fa fa-leaf"></i></div>
					<div class="col-xs-1"><i class="fa fa-leanpub"></i></div>
					<div class="col-xs-1"><i class="fa fa-legal"></i></div>
					<div class="col-xs-1"><i class="fa fa-lemon-o"></i></div>
					<div class="col-xs-1"><i class="fa fa-level-down"></i></div>
					<div class="col-xs-1"><i class="fa fa-level-up"></i></div>
					<div class="col-xs-1"><i class="fa fa-life-bouy"></i></div>
					<div class="col-xs-1"><i class="fa fa-life-buoy"></i></div>
					<div class="col-xs-1"><i class="fa fa-life-ring"></i></div>
					<div class="col-xs-1"><i class="fa fa-life-saver"></i></div>
					<div class="col-xs-1"><i class="fa fa-lightbulb-o"></i></div>
					<div class="col-xs-1"><i class="fa fa-line-chart"></i></div>
					<div class="col-xs-1"><i class="fa fa-link"></i></div>
					<div class="col-xs-1"><i class="fa fa-linkedin"></i></div>
					<div class="col-xs-1"><i class="fa fa-linkedin-square"></i></div>
					<div class="col-xs-1"><i class="fa fa-linode"></i></div>
					<div class="col-xs-1"><i class="fa fa-linux"></i></div>
					<div class="col-xs-1"><i class="fa fa-list"></i></div>
					<div class="col-xs-1"><i class="fa fa-list-alt"></i></div>
					<div class="col-xs-1"><i class="fa fa-list-ol"></i></div>
					<div class="col-xs-1"><i class="fa fa-list-ul"></i></div>
					<div class="col-xs-1"><i class="fa fa-location-arrow"></i></div>
					<div class="col-xs-1"><i class="fa fa-lock"></i></div>
					<div class="col-xs-1"><i class="fa fa-long-arrow-down"></i></div>
					<div class="col-xs-1"><i class="fa fa-long-arrow-left"></i></div>
					<div class="col-xs-1"><i class="fa fa-long-arrow-right"></i></div>
					<div class="col-xs-1"><i class="fa fa-long-arrow-up"></i></div>
					<div class="col-xs-1"><i class="fa fa-low-vision"></i></div>
					<div class="col-xs-1"><i class="fa fa-magic"></i></div>
					<div class="col-xs-1"><i class="fa fa-magnet"></i></div>
					<div class="col-xs-1"><i class="fa fa-mail-forward"></i></div>
					<div class="col-xs-1"><i class="fa fa-mail-reply"></i></div>
					<div class="col-xs-1"><i class="fa fa-mail-reply-all"></i></div>
					<div class="col-xs-1"><i class="fa fa-male"></i></div>
					<div class="col-xs-1"><i class="fa fa-map"></i></div>
					<div class="col-xs-1"><i class="fa fa-map-marker"></i></div>
					<div class="col-xs-1"><i class="fa fa-map-o"></i></div>
					<div class="col-xs-1"><i class="fa fa-map-pin"></i></div>
					<div class="col-xs-1"><i class="fa fa-map-signs"></i></div>
					<div class="col-xs-1"><i class="fa fa-mars"></i></div>
					<div class="col-xs-1"><i class="fa fa-mars-double"></i></div>
					<div class="col-xs-1"><i class="fa fa-mars-stroke"></i></div>
					<div class="col-xs-1"><i class="fa fa-mars-stroke-h"></i></div>
					<div class="col-xs-1"><i class="fa fa-mars-stroke-v"></i></div>
					<div class="col-xs-1"><i class="fa fa-maxcdn"></i></div>
					<div class="col-xs-1"><i class="fa fa-meanpath"></i></div>
					<div class="col-xs-1"><i class="fa fa-medium"></i></div>
					<div class="col-xs-1"><i class="fa fa-medkit"></i></div>
					<div class="col-xs-1"><i class="fa fa-meetup"></i></div>
					<div class="col-xs-1"><i class="fa fa-meh-o"></i></div>
					<div class="col-xs-1"><i class="fa fa-mercury"></i></div>
					<div class="col-xs-1"><i class="fa fa-microchip"></i></div>
					<div class="col-xs-1"><i class="fa fa-microphone"></i></div>
					<div class="col-xs-1"><i class="fa fa-microphone-slash"></i></div>
					<div class="col-xs-1"><i class="fa fa-minus"></i></div>
					<div class="col-xs-1"><i class="fa fa-minus-circle"></i></div>
					<div class="col-xs-1"><i class="fa fa-minus-square"></i></div>
					<div class="col-xs-1"><i class="fa fa-minus-square-o"></i></div>
					<div class="col-xs-1"><i class="fa fa-mixcloud"></i></div>
					<div class="col-xs-1"><i class="fa fa-mobile"></i></div>
					<div class="col-xs-1"><i class="fa fa-mobile-phone"></i></div>
					<div class="col-xs-1"><i class="fa fa-modx"></i></div>
					<div class="col-xs-1"><i class="fa fa-money"></i></div>
					<div class="col-xs-1"><i class="fa fa-moon-o"></i></div>
					<div class="col-xs-1"><i class="fa fa-mortar-board"></i></div>
					<div class="col-xs-1"><i class="fa fa-motorcycle"></i></div>
					<div class="col-xs-1"><i class="fa fa-mouse-pointer"></i></div>
					<div class="col-xs-1"><i class="fa fa-music"></i></div>
					<div class="col-xs-1"><i class="fa fa-navicon"></i></div>
					<div class="col-xs-1"><i class="fa fa-neuter"></i></div>
					<div class="col-xs-1"><i class="fa fa-newspaper-o"></i></div>
					<div class="col-xs-1"><i class="fa fa-object-group"></i></div>
					<div class="col-xs-1"><i class="fa fa-object-ungroup"></i></div>
					<div class="col-xs-1"><i class="fa fa-odnoklassniki"></i></div>
					<div class="col-xs-1"><i class="fa fa-odnoklassniki-square"></i></div>
					<div class="col-xs-1"><i class="fa fa-opencart"></i></div>
					<div class="col-xs-1"><i class="fa fa-openid"></i></div>
					<div class="col-xs-1"><i class="fa fa-opera"></i></div>
					<div class="col-xs-1"><i class="fa fa-optin-monster"></i></div>
					<div class="col-xs-1"><i class="fa fa-outdent"></i></div>
					<div class="col-xs-1"><i class="fa fa-pagelines"></i></div>
					<div class="col-xs-1"><i class="fa fa-paint-brush"></i></div>
					<div class="col-xs-1"><i class="fa fa-paper-plane"></i></div>
					<div class="col-xs-1"><i class="fa fa-paper-plane-o"></i></div>
					<div class="col-xs-1"><i class="fa fa-paperclip"></i></div>
					<div class="col-xs-1"><i class="fa fa-paragraph"></i></div>
					<div class="col-xs-1"><i class="fa fa-paste"></i></div>
					<div class="col-xs-1"><i class="fa fa-pause"></i></div>
					<div class="col-xs-1"><i class="fa fa-pause-circle"></i></div>
					<div class="col-xs-1"><i class="fa fa-pause-circle-o"></i></div>
					<div class="col-xs-1"><i class="fa fa-paw"></i></div>
					<div class="col-xs-1"><i class="fa fa-paypal"></i></div>
					<div class="col-xs-1"><i class="fa fa-pencil"></i></div>
					<div class="col-xs-1"><i class="fa fa-pencil-square"></i></div>
					<div class="col-xs-1"><i class="fa fa-pencil-square-o"></i></div>
					<div class="col-xs-1"><i class="fa fa-percent"></i></div>
					<div class="col-xs-1"><i class="fa fa-phone"></i></div>
					<div class="col-xs-1"><i class="fa fa-phone-square"></i></div>
					<div class="col-xs-1"><i class="fa fa-photo"></i></div>
					<div class="col-xs-1"><i class="fa fa-picture-o"></i></div>
					<div class="col-xs-1"><i class="fa fa-pie-chart"></i></div>
					<div class="col-xs-1"><i class="fa fa-pied-piper"></i></div>
					<div class="col-xs-1"><i class="fa fa-pied-piper-alt"></i></div>
					<div class="col-xs-1"><i class="fa fa-pied-piper-pp"></i></div>
					<div class="col-xs-1"><i class="fa fa-pinterest"></i></div>
					<div class="col-xs-1"><i class="fa fa-pinterest-p"></i></div>
					<div class="col-xs-1"><i class="fa fa-pinterest-square"></i></div>
					<div class="col-xs-1"><i class="fa fa-plane"></i></div>
					<div class="col-xs-1"><i class="fa fa-play"></i></div>
					<div class="col-xs-1"><i class="fa fa-play-circle"></i></div>
					<div class="col-xs-1"><i class="fa fa-play-circle-o"></i></div>
					<div class="col-xs-1"><i class="fa fa-plug"></i></div>
					<div class="col-xs-1"><i class="fa fa-plus"></i></div>
					<div class="col-xs-1"><i class="fa fa-plus-circle"></i></div>
					<div class="col-xs-1"><i class="fa fa-plus-square"></i></div>
					<div class="col-xs-1"><i class="fa fa-plus-square-o"></i></div>
					<div class="col-xs-1"><i class="fa fa-podcast"></i></div>
					<div class="col-xs-1"><i class="fa fa-power-off"></i></div>
					<div class="col-xs-1"><i class="fa fa-print"></i></div>
					<div class="col-xs-1"><i class="fa fa-product-hunt"></i></div>
					<div class="col-xs-1"><i class="fa fa-puzzle-piece"></i></div>
					<div class="col-xs-1"><i class="fa fa-qq"></i></div>
					<div class="col-xs-1"><i class="fa fa-qrcode"></i></div>
					<div class="col-xs-1"><i class="fa fa-question"></i></div>
					<div class="col-xs-1"><i class="fa fa-question-circle"></i></div>
					<div class="col-xs-1"><i class="fa fa-question-circle-o"></i></div>
					<div class="col-xs-1"><i class="fa fa-quora"></i></div>
					<div class="col-xs-1"><i class="fa fa-quote-left"></i></div>
					<div class="col-xs-1"><i class="fa fa-quote-right"></i></div>
					<div class="col-xs-1"><i class="fa fa-ra"></i></div>
					<div class="col-xs-1"><i class="fa fa-random"></i></div>
					<div class="col-xs-1"><i class="fa fa-ravelry"></i></div>
					<div class="col-xs-1"><i class="fa fa-rebel"></i></div>
					<div class="col-xs-1"><i class="fa fa-recycle"></i></div>
					<div class="col-xs-1"><i class="fa fa-reddit"></i></div>
					<div class="col-xs-1"><i class="fa fa-reddit-alien"></i></div>
					<div class="col-xs-1"><i class="fa fa-reddit-square"></i></div>
					<div class="col-xs-1"><i class="fa fa-refresh"></i></div>
					<div class="col-xs-1"><i class="fa fa-registered"></i></div>
					<div class="col-xs-1"><i class="fa fa-remove"></i></div>
					<div class="col-xs-1"><i class="fa fa-renren"></i></div>
					<div class="col-xs-1"><i class="fa fa-reorder"></i></div>
					<div class="col-xs-1"><i class="fa fa-repeat"></i></div>
					<div class="col-xs-1"><i class="fa fa-reply"></i></div>
					<div class="col-xs-1"><i class="fa fa-reply-all"></i></div>
					<div class="col-xs-1"><i class="fa fa-resistance"></i></div>
					<div class="col-xs-1"><i class="fa fa-retweet"></i></div>
					<div class="col-xs-1"><i class="fa fa-rmb"></i></div>
					<div class="col-xs-1"><i class="fa fa-road"></i></div>
					<div class="col-xs-1"><i class="fa fa-rocket"></i></div>
					<div class="col-xs-1"><i class="fa fa-rotate-left"></i></div>
					<div class="col-xs-1"><i class="fa fa-rotate-right"></i></div>
					<div class="col-xs-1"><i class="fa fa-rouble"></i></div>
					<div class="col-xs-1"><i class="fa fa-rss"></i></div>
					<div class="col-xs-1"><i class="fa fa-rss-square"></i></div>
					<div class="col-xs-1"><i class="fa fa-rub"></i></div>
					<div class="col-xs-1"><i class="fa fa-ruble"></i></div>
					<div class="col-xs-1"><i class="fa fa-rupee"></i></div>
					<div class="col-xs-1"><i class="fa fa-s15"></i></div>
					<div class="col-xs-1"><i class="fa fa-safari"></i></div>
					<div class="col-xs-1"><i class="fa fa-save"></i></div>
					<div class="col-xs-1"><i class="fa fa-scissors"></i></div>
					<div class="col-xs-1"><i class="fa fa-scribd"></i></div>
					<div class="col-xs-1"><i class="fa fa-search"></i></div>
					<div class="col-xs-1"><i class="fa fa-search-minus"></i></div>
					<div class="col-xs-1"><i class="fa fa-search-plus"></i></div>
					<div class="col-xs-1"><i class="fa fa-sellsy"></i></div>
					<div class="col-xs-1"><i class="fa fa-send"></i></div>
					<div class="col-xs-1"><i class="fa fa-send-o"></i></div>
					<div class="col-xs-1"><i class="fa fa-server"></i></div>
					<div class="col-xs-1"><i class="fa fa-share"></i></div>
					<div class="col-xs-1"><i class="fa fa-share-alt"></i></div>
					<div class="col-xs-1"><i class="fa fa-share-alt-square"></i></div>
					<div class="col-xs-1"><i class="fa fa-share-square"></i></div>
					<div class="col-xs-1"><i class="fa fa-share-square-o"></i></div>
					<div class="col-xs-1"><i class="fa fa-shekel"></i></div>
					<div class="col-xs-1"><i class="fa fa-sheqel"></i></div>
					<div class="col-xs-1"><i class="fa fa-shield"></i></div>
					<div class="col-xs-1"><i class="fa fa-ship"></i></div>
					<div class="col-xs-1"><i class="fa fa-shirtsinbulk"></i></div>
					<div class="col-xs-1"><i class="fa fa-shopping-bag"></i></div>
					<div class="col-xs-1"><i class="fa fa-shopping-basket"></i></div>
					<div class="col-xs-1"><i class="fa fa-shopping-cart"></i></div>
					<div class="col-xs-1"><i class="fa fa-shower"></i></div>
					<div class="col-xs-1"><i class="fa fa-sign-in"></i></div>
					<div class="col-xs-1"><i class="fa fa-sign-language"></i></div>
					<div class="col-xs-1"><i class="fa fa-sign-out"></i></div>
					<div class="col-xs-1"><i class="fa fa-signal"></i></div>
					<div class="col-xs-1"><i class="fa fa-signing"></i></div>
					<div class="col-xs-1"><i class="fa fa-simplybuilt"></i></div>
					<div class="col-xs-1"><i class="fa fa-sitemap"></i></div>
					<div class="col-xs-1"><i class="fa fa-skyatlas"></i></div>
					<div class="col-xs-1"><i class="fa fa-skype"></i></div>
					<div class="col-xs-1"><i class="fa fa-slack"></i></div>
					<div class="col-xs-1"><i class="fa fa-sliders"></i></div>
					<div class="col-xs-1"><i class="fa fa-slideshare"></i></div>
					<div class="col-xs-1"><i class="fa fa-smile-o"></i></div>
					<div class="col-xs-1"><i class="fa fa-snapchat"></i></div>
					<div class="col-xs-1"><i class="fa fa-snapchat-ghost"></i></div>
					<div class="col-xs-1"><i class="fa fa-snapchat-square"></i></div>
					<div class="col-xs-1"><i class="fa fa-snowflake-o"></i></div>
					<div class="col-xs-1"><i class="fa fa-soccer-ball-o"></i></div>
					<div class="col-xs-1"><i class="fa fa-sort"></i></div>
					<div class="col-xs-1"><i class="fa fa-sort-alpha-asc"></i></div>
					<div class="col-xs-1"><i class="fa fa-sort-alpha-desc"></i></div>
					<div class="col-xs-1"><i class="fa fa-sort-amount-asc"></i></div>
					<div class="col-xs-1"><i class="fa fa-sort-amount-desc"></i></div>
					<div class="col-xs-1"><i class="fa fa-sort-asc"></i></div>
					<div class="col-xs-1"><i class="fa fa-sort-desc"></i></div>
					<div class="col-xs-1"><i class="fa fa-sort-down"></i></div>
					<div class="col-xs-1"><i class="fa fa-sort-numeric-asc"></i></div>
					<div class="col-xs-1"><i class="fa fa-sort-numeric-desc"></i></div>
					<div class="col-xs-1"><i class="fa fa-sort-up"></i></div>
					<div class="col-xs-1"><i class="fa fa-soundcloud"></i></div>
					<div class="col-xs-1"><i class="fa fa-space-shuttle"></i></div>
					<div class="col-xs-1"><i class="fa fa-spinner"></i></div>
					<div class="col-xs-1"><i class="fa fa-spoon"></i></div>
					<div class="col-xs-1"><i class="fa fa-spotify"></i></div>
					<div class="col-xs-1"><i class="fa fa-square"></i></div>
					<div class="col-xs-1"><i class="fa fa-square-o"></i></div>
					<div class="col-xs-1"><i class="fa fa-stack-exchange"></i></div>
					<div class="col-xs-1"><i class="fa fa-stack-overflow"></i></div>
					<div class="col-xs-1"><i class="fa fa-star"></i></div>
					<div class="col-xs-1"><i class="fa fa-star-half"></i></div>
					<div class="col-xs-1"><i class="fa fa-star-half-empty"></i></div>
					<div class="col-xs-1"><i class="fa fa-star-half-full"></i></div>
					<div class="col-xs-1"><i class="fa fa-star-half-o"></i></div>
					<div class="col-xs-1"><i class="fa fa-star-o"></i></div>
					<div class="col-xs-1"><i class="fa fa-steam"></i></div>
					<div class="col-xs-1"><i class="fa fa-steam-square"></i></div>
					<div class="col-xs-1"><i class="fa fa-step-backward"></i></div>
					<div class="col-xs-1"><i class="fa fa-step-forward"></i></div>
					<div class="col-xs-1"><i class="fa fa-stethoscope"></i></div>
					<div class="col-xs-1"><i class="fa fa-sticky-note"></i></div>
					<div class="col-xs-1"><i class="fa fa-sticky-note-o"></i></div>
					<div class="col-xs-1"><i class="fa fa-stop"></i></div>
					<div class="col-xs-1"><i class="fa fa-stop-circle"></i></div>
					<div class="col-xs-1"><i class="fa fa-stop-circle-o"></i></div>
					<div class="col-xs-1"><i class="fa fa-street-view"></i></div>
					<div class="col-xs-1"><i class="fa fa-strikethrough"></i></div>
					<div class="col-xs-1"><i class="fa fa-stumbleupon"></i></div>
					<div class="col-xs-1"><i class="fa fa-stumbleupon-circle"></i></div>
					<div class="col-xs-1"><i class="fa fa-subscript"></i></div>
					<div class="col-xs-1"><i class="fa fa-subway"></i></div>
					<div class="col-xs-1"><i class="fa fa-suitcase"></i></div>
					<div class="col-xs-1"><i class="fa fa-sun-o"></i></div>
					<div class="col-xs-1"><i class="fa fa-superpowers"></i></div>
					<div class="col-xs-1"><i class="fa fa-superscript"></i></div>
					<div class="col-xs-1"><i class="fa fa-support"></i></div>
					<div class="col-xs-1"><i class="fa fa-table"></i></div>
					<div class="col-xs-1"><i class="fa fa-tablet"></i></div>
					<div class="col-xs-1"><i class="fa fa-tachometer"></i></div>
					<div class="col-xs-1"><i class="fa fa-tag"></i></div>
					<div class="col-xs-1"><i class="fa fa-tags"></i></div>
					<div class="col-xs-1"><i class="fa fa-tasks"></i></div>
					<div class="col-xs-1"><i class="fa fa-taxi"></i></div>
					<div class="col-xs-1"><i class="fa fa-telegram"></i></div>
					<div class="col-xs-1"><i class="fa fa-television"></i></div>
					<div class="col-xs-1"><i class="fa fa-tencent-weibo"></i></div>
					<div class="col-xs-1"><i class="fa fa-terminal"></i></div>
					<div class="col-xs-1"><i class="fa fa-text-height"></i></div>
					<div class="col-xs-1"><i class="fa fa-text-width"></i></div>
					<div class="col-xs-1"><i class="fa fa-th"></i></div>
					<div class="col-xs-1"><i class="fa fa-th-large"></i></div>
					<div class="col-xs-1"><i class="fa fa-th-list"></i></div>
					<div class="col-xs-1"><i class="fa fa-themeisle"></i></div>
					<div class="col-xs-1"><i class="fa fa-thermometer"></i></div>
					<div class="col-xs-1"><i class="fa fa-thermometer-0"></i></div>
					<div class="col-xs-1"><i class="fa fa-thermometer-1"></i></div>
					<div class="col-xs-1"><i class="fa fa-thermometer-2"></i></div>
					<div class="col-xs-1"><i class="fa fa-thermometer-3"></i></div>
					<div class="col-xs-1"><i class="fa fa-thermometer-4"></i></div>
					<div class="col-xs-1"><i class="fa fa-thermometer-empty"></i></div>
					<div class="col-xs-1"><i class="fa fa-thermometer-full"></i></div>
					<div class="col-xs-1"><i class="fa fa-thermometer-half"></i></div>
					<div class="col-xs-1"><i class="fa fa-thermometer-quarter"></i></div>
					<div class="col-xs-1"><i class="fa fa-thermometer-three-quarters"></i></div>
					<div class="col-xs-1"><i class="fa fa-thumb-tack"></i></div>
					<div class="col-xs-1"><i class="fa fa-thumbs-down"></i></div>
					<div class="col-xs-1"><i class="fa fa-thumbs-o-down"></i></div>
					<div class="col-xs-1"><i class="fa fa-thumbs-o-up"></i></div>
					<div class="col-xs-1"><i class="fa fa-thumbs-up"></i></div>
					<div class="col-xs-1"><i class="fa fa-ticket"></i></div>
					<div class="col-xs-1"><i class="fa fa-times"></i></div>
					<div class="col-xs-1"><i class="fa fa-times-circle"></i></div>
					<div class="col-xs-1"><i class="fa fa-times-circle-o"></i></div>
					<div class="col-xs-1"><i class="fa fa-times-rectangle"></i></div>
					<div class="col-xs-1"><i class="fa fa-times-rectangle-o"></i></div>
					<div class="col-xs-1"><i class="fa fa-tint"></i></div>
					<div class="col-xs-1"><i class="fa fa-toggle-down"></i></div>
					<div class="col-xs-1"><i class="fa fa-toggle-left"></i></div>
					<div class="col-xs-1"><i class="fa fa-toggle-off"></i></div>
					<div class="col-xs-1"><i class="fa fa-toggle-on"></i></div>
					<div class="col-xs-1"><i class="fa fa-toggle-right"></i></div>
					<div class="col-xs-1"><i class="fa fa-toggle-up"></i></div>
					<div class="col-xs-1"><i class="fa fa-trademark"></i></div>
					<div class="col-xs-1"><i class="fa fa-train"></i></div>
					<div class="col-xs-1"><i class="fa fa-transgender"></i></div>
					<div class="col-xs-1"><i class="fa fa-transgender-alt"></i></div>
					<div class="col-xs-1"><i class="fa fa-trash"></i></div>
					<div class="col-xs-1"><i class="fa fa-trash-o"></i></div>
					<div class="col-xs-1"><i class="fa fa-tree"></i></div>
					<div class="col-xs-1"><i class="fa fa-trello"></i></div>
					<div class="col-xs-1"><i class="fa fa-tripadvisor"></i></div>
					<div class="col-xs-1"><i class="fa fa-trophy"></i></div>
					<div class="col-xs-1"><i class="fa fa-truck"></i></div>
					<div class="col-xs-1"><i class="fa fa-try"></i></div>
					<div class="col-xs-1"><i class="fa fa-tty"></i></div>
					<div class="col-xs-1"><i class="fa fa-tumblr"></i></div>
					<div class="col-xs-1"><i class="fa fa-tumblr-square"></i></div>
					<div class="col-xs-1"><i class="fa fa-turkish-lira"></i></div>
					<div class="col-xs-1"><i class="fa fa-tv"></i></div>
					<div class="col-xs-1"><i class="fa fa-twitch"></i></div>
					<div class="col-xs-1"><i class="fa fa-twitter"></i></div>
					<div class="col-xs-1"><i class="fa fa-twitter-square"></i></div>
					<div class="col-xs-1"><i class="fa fa-umbrella"></i></div>
					<div class="col-xs-1"><i class="fa fa-underline"></i></div>
					<div class="col-xs-1"><i class="fa fa-undo"></i></div>
					<div class="col-xs-1"><i class="fa fa-universal-access"></i></div>
					<div class="col-xs-1"><i class="fa fa-university"></i></div>
					<div class="col-xs-1"><i class="fa fa-unlink"></i></div>
					<div class="col-xs-1"><i class="fa fa-unlock"></i></div>
					<div class="col-xs-1"><i class="fa fa-unlock-alt"></i></div>
					<div class="col-xs-1"><i class="fa fa-unsorted"></i></div>
					<div class="col-xs-1"><i class="fa fa-upload"></i></div>
					<div class="col-xs-1"><i class="fa fa-usb"></i></div>
					<div class="col-xs-1"><i class="fa fa-usd"></i></div>
					<div class="col-xs-1"><i class="fa fa-user"></i></div>
					<div class="col-xs-1"><i class="fa fa-user-circle"></i></div>
					<div class="col-xs-1"><i class="fa fa-user-circle-o"></i></div>
					<div class="col-xs-1"><i class="fa fa-user-md"></i></div>
					<div class="col-xs-1"><i class="fa fa-user-o"></i></div>
					<div class="col-xs-1"><i class="fa fa-user-plus"></i></div>
					<div class="col-xs-1"><i class="fa fa-user-secret"></i></div>
					<div class="col-xs-1"><i class="fa fa-user-times"></i></div>
					<div class="col-xs-1"><i class="fa fa-users"></i></div>
					<div class="col-xs-1"><i class="fa fa-vcard"></i></div>
					<div class="col-xs-1"><i class="fa fa-vcard-o"></i></div>
					<div class="col-xs-1"><i class="fa fa-venus"></i></div>
					<div class="col-xs-1"><i class="fa fa-venus-double"></i></div>
					<div class="col-xs-1"><i class="fa fa-venus-mars"></i></div>
					<div class="col-xs-1"><i class="fa fa-viacoin"></i></div>
					<div class="col-xs-1"><i class="fa fa-viadeo"></i></div>
					<div class="col-xs-1"><i class="fa fa-viadeo-square"></i></div>
					<div class="col-xs-1"><i class="fa fa-video-camera"></i></div>
					<div class="col-xs-1"><i class="fa fa-vimeo"></i></div>
					<div class="col-xs-1"><i class="fa fa-vimeo-square"></i></div>
					<div class="col-xs-1"><i class="fa fa-vine"></i></div>
					<div class="col-xs-1"><i class="fa fa-vk"></i></div>
					<div class="col-xs-1"><i class="fa fa-volume-control-phone"></i></div>
					<div class="col-xs-1"><i class="fa fa-volume-down"></i></div>
					<div class="col-xs-1"><i class="fa fa-volume-off"></i></div>
					<div class="col-xs-1"><i class="fa fa-volume-up"></i></div>
					<div class="col-xs-1"><i class="fa fa-warning"></i></div>
					<div class="col-xs-1"><i class="fa fa-wechat"></i></div>
					<div class="col-xs-1"><i class="fa fa-weibo"></i></div>
					<div class="col-xs-1"><i class="fa fa-weixin"></i></div>
					<div class="col-xs-1"><i class="fa fa-whatsapp"></i></div>
					<div class="col-xs-1"><i class="fa fa-wheelchair"></i></div>
					<div class="col-xs-1"><i class="fa fa-wheelchair-alt"></i></div>
					<div class="col-xs-1"><i class="fa fa-wifi"></i></div>
					<div class="col-xs-1"><i class="fa fa-wikipedia-w"></i></div>
					<div class="col-xs-1"><i class="fa fa-window-close"></i></div>
					<div class="col-xs-1"><i class="fa fa-window-close-o"></i></div>
					<div class="col-xs-1"><i class="fa fa-window-maximize"></i></div>
					<div class="col-xs-1"><i class="fa fa-window-minimize"></i></div>
					<div class="col-xs-1"><i class="fa fa-window-restore"></i></div>
					<div class="col-xs-1"><i class="fa fa-windows"></i></div>
					<div class="col-xs-1"><i class="fa fa-won"></i></div>
					<div class="col-xs-1"><i class="fa fa-wordpress"></i></div>
					<div class="col-xs-1"><i class="fa fa-wpbeginner"></i></div>
					<div class="col-xs-1"><i class="fa fa-wpexplorer"></i></div>
					<div class="col-xs-1"><i class="fa fa-wpforms"></i></div>
					<div class="col-xs-1"><i class="fa fa-wrench"></i></div>
					<div class="col-xs-1"><i class="fa fa-xing"></i></div>
					<div class="col-xs-1"><i class="fa fa-xing-square"></i></div>
					<div class="col-xs-1"><i class="fa fa-y-combinator"></i></div>
					<div class="col-xs-1"><i class="fa fa-y-combinator-square"></i></div>
					<div class="col-xs-1"><i class="fa fa-yahoo"></i></div>
					<div class="col-xs-1"><i class="fa fa-yc"></i></div>
					<div class="col-xs-1"><i class="fa fa-yc-square"></i></div>
					<div class="col-xs-1"><i class="fa fa-yelp"></i></div>
					<div class="col-xs-1"><i class="fa fa-yen"></i></div>
					<div class="col-xs-1"><i class="fa fa-yoast"></i></div>
					<div class="col-xs-1"><i class="fa fa-youtube"></i></div>
					<div class="col-xs-1"><i class="fa fa-youtube-play"></i></div>
					<div class="col-xs-1"><i class="fa fa-youtube-square"></i></div>
					</div>
					</div>
					<script type="text/javascript" src="view/javascript/revolution/popup_icons.js"></script>
					<script>
						function fa_icons(id) {
							$('.fa_icons').popup('show');
							$('.target').val(id);
							
							$('.fa_icons .fa').on('click', function() {
								var this_class = $(this).attr('class');
								$('.class').val(this_class);
								save_icons();
								$('.fa_icons').popup('hide');
							});
						}
						
						function save_icons() {
							var target = $('.target').val();
							var this_class = $('.class').val();
							$('#'+target).html('<i class="'+this_class+'"></i>');
							$('#'+target).next().val(this_class);
						}
					</script>
					</div>
				</div>
            
              <div class="form-group">
                <label class="col-sm-2 control-label" for="input-top"><span data-toggle="tooltip" title="<?php echo $help_top; ?>"><?php echo $entry_top; ?></span></label>
                <div class="col-sm-10">
                  <div class="checkbox">
                    <label>
                      <?php if ($top) { ?>
                      <input type="checkbox" name="top" value="1" checked="checked" id="input-top" />
                      <?php } else { ?>
                      <input type="checkbox" name="top" value="1" id="input-top" />
                      <?php } ?>
                      &nbsp; </label>
                  </div>
                </div>
              </div>
              <div class="form-group">
                <label class="col-sm-2 control-label" for="input-column"><span data-toggle="tooltip" title="<?php echo $help_column; ?>"><?php echo $entry_column; ?></span></label>
                <div class="col-sm-10">
                  <input type="text" name="column" value="<?php echo $column; ?>" placeholder="<?php echo $entry_column; ?>" id="input-column" class="form-control" />
                </div>
              </div>
              <div class="form-group">
                <label class="col-sm-2 control-label" for="input-sort-order"><?php echo $entry_sort_order; ?></label>
                <div class="col-sm-10">
                  <input type="text" name="sort_order" value="<?php echo $sort_order; ?>" placeholder="<?php echo $entry_sort_order; ?>" id="input-sort-order" class="form-control" />
                </div>
              </div>
              <div class="form-group">
                <label class="col-sm-2 control-label" for="input-status"><?php echo $entry_status; ?></label>
                <div class="col-sm-10">
                  <select name="status" id="input-status" class="form-control">
                    <?php if ($status) { ?>
                    <option value="1" selected="selected"><?php echo $text_enabled; ?></option>
                    <option value="0"><?php echo $text_disabled; ?></option>
                    <?php } else { ?>
                    <option value="1"><?php echo $text_enabled; ?></option>
                    <option value="0" selected="selected"><?php echo $text_disabled; ?></option>
                    <?php } ?>
                  </select>
                </div>
              </div>
			<div class="form-group">
                <label class="col-sm-2 control-label" for="input-noindex"><span data-toggle="tooltip" title="<?php echo $help_noindex; ?>"><?php echo $entry_noindex; ?></span></label>
                <div class="col-sm-10">
                  <select name="noindex" id="input-noindex" class="form-control">
                    <?php if ($noindex) { ?>
                    <option value="1" selected="selected"><?php echo $text_enabled; ?></option>
                    <option value="0"><?php echo $text_disabled; ?></option>
                    <?php } else { ?>
                    <option value="1"><?php echo $text_enabled; ?></option>
                    <option value="0" selected="selected"><?php echo $text_disabled; ?></option>
                    <?php } ?>
                  </select>
                </div>
              </div>
			</div>
						<div class="tab-pane" id="tab-related">
			<div class="form-group">
            <label class="col-sm-2 control-label" for="input-product-related"><?php echo $entry_related_wb; ?></label>
            <div class="col-sm-10">
              <input type="text" name="product_related_input" value="" placeholder="<?php echo $entry_related_wb; ?>" id="input-product-related" class="form-control" />
              <div id="product-related" class="well well-sm" style="height: 150px; overflow: auto;">
                <?php foreach ($product_related as $product_related) { ?>
                <div id="product-related<?php echo $product_related['product_id']; ?>"><i class="fa fa-minus-circle"></i> <?php echo $product_related['name']; ?>
                  <input type="hidden" name="product_related[]" value="<?php echo $product_related['product_id']; ?>" />
                </div>
                <?php } ?>
              </div>
			  </div>
			  </div>
			<div class="form-group">
            <label class="col-sm-2 control-label" for="input-article-related"><?php echo $entry_related_article; ?></label>
            <div class="col-sm-10">
              <input type="text" name="article_related_input" value="" placeholder="<?php echo $entry_related_article; ?>" id="input-article-related" class="form-control" />
              <div id="article-related" class="well well-sm" style="height: 150px; overflow: auto;">
                <?php foreach ($article_related as $article_related) { ?>
                <div id="article-related<?php echo $article_related['article_id']; ?>"><i class="fa fa-minus-circle"></i> <?php echo $article_related['name']; ?>
                  <input type="hidden" name="article_related[]" value="<?php echo $article_related['article_id']; ?>" />
                </div>
                <?php } ?>
              </div>
            </div>
          </div>
			</div>
            <div class="tab-pane" id="tab-design">
              <div class="table-responsive">
                <table class="table table-bordered table-hover">
                  <thead>
                    <tr>
                      <td class="text-left"><?php echo $entry_store; ?></td>
                      <td class="text-left"><?php echo $entry_layout; ?></td>
                    </tr>
                  </thead>
                  <tbody>
                    <tr>
                      <td class="text-left"><?php echo $text_default; ?></td>
                      <td class="text-left"><select name="category_layout[0]" class="form-control">
                          <option value=""></option>
                          <?php foreach ($layouts as $layout) { ?>
                          <?php if (isset($category_layout[0]) && $category_layout[0] == $layout['layout_id']) { ?>
                          <option value="<?php echo $layout['layout_id']; ?>" selected="selected"><?php echo $layout['name']; ?></option>
                          <?php } else { ?>
                          <option value="<?php echo $layout['layout_id']; ?>"><?php echo $layout['name']; ?></option>
                          <?php } ?>
                          <?php } ?>
                        </select></td>
                    </tr>
                    <?php foreach ($stores as $store) { ?>
                    <tr>
                      <td class="text-left"><?php echo $store['name']; ?></td>
                      <td class="text-left"><select name="category_layout[<?php echo $store['store_id']; ?>]" class="form-control">
                          <option value=""></option>
                          <?php foreach ($layouts as $layout) { ?>
                          <?php if (isset($category_layout[$store['store_id']]) && $category_layout[$store['store_id']] == $layout['layout_id']) { ?>
                          <option value="<?php echo $layout['layout_id']; ?>" selected="selected"><?php echo $layout['name']; ?></option>
                          <?php } else { ?>
                          <option value="<?php echo $layout['layout_id']; ?>"><?php echo $layout['name']; ?></option>
                          <?php } ?>
                          <?php } ?>
                        </select></td>
                    </tr>
                    <?php } ?>
                  </tbody>
                </table>
              </div>
            </div>
          </div>
        </form>
      </div>
    </div>
  </div>
  <script type="text/javascript" src="view/javascript/summernote/summernote.js"></script>
  <link href="view/javascript/summernote/summernote.css" rel="stylesheet" />
  <script type="text/javascript" src="view/javascript/summernote/opencart.js"></script> 
  <script type="text/javascript"><!--
$('input[name=\'path\']').autocomplete({
	'source': function(request, response) {
		$.ajax({
			url: 'index.php?route=catalog/category/autocomplete&token=<?php echo $token; ?>&filter_name=' +  encodeURIComponent(request),
			dataType: 'json',
			success: function(json) {
				json.unshift({
					category_id: 0,
					name: '<?php echo $text_none; ?>'
				});

				response($.map(json, function(item) {
					return {
						label: item['name'],
						value: item['category_id']
					}
				}));
			}
		});
	},
	'select': function(item) {
		$('input[name=\'path\']').val(item['label']);
		$('input[name=\'parent_id\']').val(item['value']);
	}
});
//--></script> 
  <script type="text/javascript"><!--
$('input[name=\'filter\']').autocomplete({
	'source': function(request, response) {
		$.ajax({
			url: 'index.php?route=catalog/filter/autocomplete&token=<?php echo $token; ?>&filter_name=' +  encodeURIComponent(request),
			dataType: 'json',
			success: function(json) {
				response($.map(json, function(item) {
					return {
						label: item['name'],
						value: item['filter_id']
					}
				}));
			}
		});
	},
	'select': function(item) {
		$('input[name=\'filter\']').val('');

		$('#category-filter' + item['value']).remove();

		$('#category-filter').append('<div id="category-filter' + item['value'] + '"><i class="fa fa-minus-circle"></i> ' + item['label'] + '<input type="hidden" name="category_filter[]" value="' + item['value'] + '" /></div>');
	}
});

$('#category-filter').delegate('.fa-minus-circle', 'click', function() {
	$(this).parent().remove();
});
//--></script> 
  <script type="text/javascript"><!--
$('#language a:first').tab('show');
//--></script>
<script type="text/javascript"><!--
$('input[name=\'product_related_input\']').autocomplete({
	source: function(request, response) {
		$.ajax({
			url: 'index.php?route=catalog/product/autocomplete&token=<?php echo $token; ?>&filter_name=' +  encodeURIComponent(request),
			dataType: 'json',
			success: function(json) {
				response($.map(json, function(item) {
					return {
						label: item['name'],
						value: item['product_id']
					}
				}));
			}
		});
	},
	select: function(item) {
		$('input[name=\'product\']').val('');
		
		$('#product-related' + item['value']).remove();
		
		$('#product-related').append('<div id="product-related' + item['value'] + '"><i class="fa fa-minus-circle"></i> ' + item['label'] + '<input type="hidden" name="product_related[]" value="' + item['value'] + '" /></div>');	
	}
});
	
$('#product-related').delegate('.fa-minus-circle', 'click', function() {
	$(this).parent().remove();
});
//--></script>
<script type="text/javascript"><!--
$('input[name=\'article_related_input\']').autocomplete({
	source: function(request, response) {
		$.ajax({
			url: 'index.php?route=blog/article/autocomplete&token=<?php echo $token; ?>&filter_name=' +  encodeURIComponent(request),
			dataType: 'json',
			success: function(json) {
				response($.map(json, function(item) {
					return {
						label: item['name'],
						value: item['article_id']
					}
				}));
			}
		});
	},
	select: function(item) {
		$('input[name=\'product\']').val('');
		
		$('#article-related' + item['value']).remove();
		
		$('#article-related').append('<div id="article-related' + item['value'] + '"><i class="fa fa-minus-circle"></i> ' + item['label'] + '<input type="hidden" name="article_related[]" value="' + item['value'] + '" /></div>');	
	}
});
	
$('#article-related').delegate('.fa-minus-circle', 'click', function() {
	$(this).parent().remove();
});
//--></script>
</div>

			<script> var language_id = <?php echo $translite_language; ?></script>
			
<?php echo $footer; ?>