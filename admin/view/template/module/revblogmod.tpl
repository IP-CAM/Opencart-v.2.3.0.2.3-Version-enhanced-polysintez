<?php echo $header; ?><?php echo $column_left; ?>
<div id="content">
  <div class="page-header">
    <div class="container-fluid">
      <div class="pull-right">
        <button type="submit" form="form-information" data-toggle="tooltip" title="<?php echo $button_save; ?>" class="btn btn-primary"><i class="fa fa-save"></i></button>
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
        <h3 class="panel-title"><i class="fa fa-pencil"></i> <?php echo $text_edit; ?></h3>
      </div>
      <div class="panel-body">
        <form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data" id="form-revblogmod" class="form-horizontal">
		<div class="form-group">
			<label class="col-sm-2 control-label" for="input-name">Название модуля:</label>
			<div class="col-sm-3">
			  <input type="text" name="name" value="<?php echo $name; ?>" id="input-name" class="form-control" />
			  <?php if ($error_name) { ?>
			  <div class="text-danger"><?php echo $error_name; ?></div>
			  <?php } ?>
			</div>
		</div>
		<div class="form-group">
			<label class="col-sm-2 control-label" for="input-status"><?php echo $entry_status; ?>:</label>
			<div class="col-sm-3">
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
		  <label class="col-sm-2 control-label">Заголовок:</label>
		  <div class="col-sm-3">
			<input type="text" name="title" value="<?php echo (isset($title)) ? $title : ''; ?>" class="form-control" />
		  </div>
		</div>
		<div class="form-group">
			<label class="col-sm-2 control-label">Иконка:</label>
			<div class="col-sm-3">
				<span style="cursor:pointer" class="fa_icon form-control width_initial" id="icon_blogmods" onclick="fa_icons($(this).attr('id'))"><i class="<?php echo $icon; ?>"></i></span>
				<input type="hidden" name="icon" value="<?php echo $icon; ?>" id="input-icon_blogmods" />
			</div>
		</div>
		<div class="form-group">
			<label class="col-sm-2 control-label" for="input-category">Категория новостей:</label>
			<div class="col-sm-3">
				<select name="blog_category_id" class="form-control">
					<option value="0" selected="selected">Все</option>
					<?php foreach($blog_categories as $category) { ?>
					<?php if($category['category_id'] == $blog_category_id) { ?>
					<option value="<?php echo $category['category_id']; ?>" selected="selected"><?php echo $category['title']; ?></option>
					<?php } else { ?>
					<option value="<?php echo $category['category_id']; ?>"><?php echo $category['title']; ?></option>
					<?php } ?>
					<?php } ?>
				</select>
			</div>
		</div>
		<div class="form-group">
		  <label class="col-sm-2 control-label">Лимит новостей:</label>
		  <div class="col-sm-3">
			<input type="text" name="news_limit" value="<?php echo (isset($news_limit)) ? $news_limit : ''; ?>" class="form-control" />
			<?php if ($error_news_limit) { ?>
			<div class="text-danger"><?php echo $error_news_limit; ?></div>
			<?php } ?>
		  </div>
		</div>
		<div class="form-group">
		  <label class="col-sm-2 control-label">Лимит символов описания:</label>
		  <div class="col-sm-3">
			<input type="text" name="desc_limit" value="<?php echo (isset($desc_limit)) ? $desc_limit : ''; ?>" class="form-control" />
			<?php if ($error_desc_limit) { ?>
			<div class="text-danger"><?php echo $error_desc_limit; ?></div>
			<?php } ?>
		  </div>
		</div>
		<div class="form-group">
			<label class="col-sm-2 control-label">Отображать картинку:</label>
			<div class="col-sm-3">
				<label class="radio-inline">
					<input type="radio" name="image_status" value="1" <?php if ($image_status) { echo 'checked'; } ?> /> Да
				</label>
				<label class="radio-inline">
					<input type="radio" name="image_status" value="0" <?php if (!$image_status) { echo 'checked';} ?> /> Нет
				</label>
			</div>
		</div>
		<div class="form-group">
			<label class="col-sm-2 control-label">Размер картинки, px:</label>
			<div class="col-sm-9">
				<div class="row">
				  <div class="col-sm-2">
					<input data-toggle="tooltip" data-placement="top" title="Ширина" type="text" name="image_width" value="<?php echo (isset($image_width)) ? $image_width : ''; ?>" class="form-control width_initial" />
					<?php if ($error_image_width) { ?>
					<div class="text-danger"><?php echo $error_image_width; ?></div>
					<?php } ?>
				  </div>
				  <div class="col-sm-2">
					<input data-toggle="tooltip" data-placement="top" title="Высота" type="text" name="image_height" value="<?php echo (isset($image_height)) ? $image_height : ''; ?>" class="form-control width_initial" />
					<?php if ($error_image_height) { ?>
					<div class="text-danger"><?php echo $error_image_height; ?></div>
					<?php } ?>
				  </div>
				</div>
			</div>
		</div>
		<div class="form-group">
			<label class="col-sm-2 control-label">Отображать дату новости:</label>
			<div class="col-sm-3">
				<label class="radio-inline">
					<input type="radio" name="data_status" value="1" <?php if ($data_status) { echo 'checked'; } ?> /> Да
				</label>
				<label class="radio-inline">
					<input type="radio" name="data_status" value="0" <?php if (!$data_status) { echo 'checked';} ?> /> Нет
				</label>
			</div>
		</div>
		<div class="form-group">
			<label class="col-sm-2 control-label">Слайдер новостей:</label>
			<div class="col-sm-3">
				<label class="radio-inline">
					<input type="radio" name="slider" value="1" <?php if ($slider) { echo 'checked'; } ?> /> Вкл.
				</label>
				<label class="radio-inline">
					<input type="radio" name="slider" value="0" <?php if (!$slider) { echo 'checked';} ?> /> Выкл.
				</label>
			</div>
		</div>
        </form>
      </div>
    </div>
  </div>
</div>
<input type="hidden" class="target" value="" />
<input type="hidden" class="class" value="" />
<div class="fa_icons">
<div class="fontawesome-icon-list">
<div class="col-xs-2" style="margin-bottom:5px;margin-left:-20px;float:initial;"><i class="fa none" aria-hidden="true">Не использовать иконку</i></div>
<div class="col-xs-1"><i class="fa fa-american-sign-language-interpreting" aria-hidden="true"></i></div>
<div class="col-xs-1"><i class="fa fa-blind" aria-hidden="true"></i></div>
<div class="col-xs-1"><i class="fa fa-gitlab" aria-hidden="true"></i></div>
<div class="col-xs-1"><i class="fa fa-pied-piper" aria-hidden="true"></i></div>
<div class="col-xs-1"><i class="fa fa-google-plus-official" aria-hidden="true"></i></div>
<div class="col-xs-1"><i class="fa fa-snapchat" aria-hidden="true"></i></div>
<div class="col-xs-1"><i class="fa fa-universal-access" aria-hidden="true"></i></div>
<div class="col-xs-1"><i class="fa fa-wheelchair-alt" aria-hidden="true"></i></div>
<div class="col-xs-1"><i class="fa fa-american-sign-language-interpreting" aria-hidden="true"></i></div>
<div class="col-xs-1"><i class="fa fa-braille" aria-hidden="true"></i></div>
<div class="col-xs-1"><i class="fa fa-font-awesome" aria-hidden="true"></i></div>
<div class="col-xs-1"><i class="fa fa-glide" aria-hidden="true"></i></div>
<div class="col-xs-1"><i class="fa fa-deaf" aria-hidden="true"></i></div>
<div class="col-xs-1"><i class="fa fa-question-circle-o" aria-hidden="true"></i></div>
<div class="col-xs-1"><i class="fa fa-snapchat-ghost" aria-hidden="true"></i></div>
<div class="col-xs-1"><i class="fa fa-viadeo" aria-hidden="true"></i></div>
<div class="col-xs-1"><i class="fa fa-wpbeginner" aria-hidden="true"></i></div>
<div class="col-xs-1"><i class="fa fa-assistive-listening-systems" aria-hidden="true"></i></div>
<div class="col-xs-1"><i class="fa fa-first-order" aria-hidden="true"></i></div>
<div class="col-xs-1"><i class="fa fa-glide-g" aria-hidden="true"></i></div>
<div class="col-xs-1"><i class="fa fa-instagram" aria-hidden="true"></i></div>
<div class="col-xs-1"><i class="fa fa-sign-language" aria-hidden="true"></i></div>
<div class="col-xs-1"><i class="fa fa-snapchat-square" aria-hidden="true"></i></div>
<div class="col-xs-1"><i class="fa fa-viadeo-square" aria-hidden="true"></i></div>
<div class="col-xs-1"><i class="fa fa-wpforms" aria-hidden="true"></i></div>
<div class="col-xs-1"><i class="fa fa-audio-description" aria-hidden="true"></i></div>
<div class="col-xs-1"><i class="fa fa-font-awesome" aria-hidden="true"></i></div>
<div class="col-xs-1"><i class="fa fa-google-plus-official" aria-hidden="true"></i></div>
<div class="col-xs-1"><i class="fa fa-low-vision" aria-hidden="true"></i></div>
<div class="col-xs-1"><i class="fa fa-themeisle" aria-hidden="true"></i></div>
<div class="col-xs-1"><i class="fa fa-volume-control-phone" aria-hidden="true"></i></div>
<div class="col-xs-1"><i class="fa fa-yoast" aria-hidden="true"></i></div>
<div class="col-xs-1"><i class="fa fa-adjust" aria-hidden="true"></i></div>
<div class="col-xs-1"><i class="fa fa-area-chart" aria-hidden="true"></i></div>
<div class="col-xs-1"><i class="fa fa-american-sign-language-interpreting" aria-hidden="true"></i></div>
<div class="col-xs-1"><i class="fa fa-audio-description" aria-hidden="true"></i></div>
<div class="col-xs-1"><i class="fa fa-university" aria-hidden="true"></i></div>
<div class="col-xs-1"><i class="fa fa-bars" aria-hidden="true"></i></div>
<div class="col-xs-1"><i class="fa fa-battery-three-quarters" aria-hidden="true"></i></div>
<div class="col-xs-1"><i class="fa fa-battery-half" aria-hidden="true"></i></div>
<div class="col-xs-1"><i class="fa fa-beer" aria-hidden="true"></i></div>
<div class="col-xs-1"><i class="fa fa-bell-slash-o" aria-hidden="true"></i></div>
<div class="col-xs-1"><i class="fa fa-blind" aria-hidden="true"></i></div>
<div class="col-xs-1"><i class="fa fa-bomb" aria-hidden="true"></i></div>
<div class="col-xs-1"><i class="fa fa-braille" aria-hidden="true"></i></div>
<div class="col-xs-1"><i class="fa fa-building-o" aria-hidden="true"></i></div>
<div class="col-xs-1"><i class="fa fa-taxi" aria-hidden="true"></i></div>
<div class="col-xs-1"><i class="fa fa-calendar-minus-o" aria-hidden="true"></i></div>
<div class="col-xs-1"><i class="fa fa-camera" aria-hidden="true"></i></div>
<div class="col-xs-1"><i class="fa fa-caret-square-o-left" aria-hidden="true"></i></div>
<div class="col-xs-1"><i class="fa fa-cart-plus" aria-hidden="true"></i></div>
<div class="col-xs-1"><i class="fa fa-check-circle" aria-hidden="true"></i></div>
<div class="col-xs-1"><i class="fa fa-child" aria-hidden="true"></i></div>
<div class="col-xs-1"><i class="fa fa-circle-thin" aria-hidden="true"></i></div>
<div class="col-xs-1"><i class="fa fa-cloud" aria-hidden="true"></i></div>
<div class="col-xs-1"><i class="fa fa-code-fork" aria-hidden="true"></i></div>
<div class="col-xs-1"><i class="fa fa-comment" aria-hidden="true"></i></div>
<div class="col-xs-1"><i class="fa fa-comments" aria-hidden="true"></i></div>
<div class="col-xs-1"><i class="fa fa-creative-commons" aria-hidden="true"></i></div>
<div class="col-xs-1"><i class="fa fa-crosshairs" aria-hidden="true"></i></div>
<div class="col-xs-1"><i class="fa fa-tachometer" aria-hidden="true"></i></div>
<div class="col-xs-1"><i class="fa fa-desktop" aria-hidden="true"></i></div>
<div class="col-xs-1"><i class="fa fa-pencil-square-o" aria-hidden="true"></i></div>
<div class="col-xs-1"><i class="fa fa-envelope-o" aria-hidden="true"></i></div>
<div class="col-xs-1"><i class="fa fa-exclamation" aria-hidden="true"></i></div>
<div class="col-xs-1"><i class="fa fa-external-link-square" aria-hidden="true"></i></div>
<div class="col-xs-1"><i class="fa fa-fax" aria-hidden="true"></i></div>
<div class="col-xs-1"><i class="fa fa-file-archive-o" aria-hidden="true"></i></div>
<div class="col-xs-1"><i class="fa fa-file-image-o" aria-hidden="true"></i></div>
<div class="col-xs-1"><i class="fa fa-file-image-o" aria-hidden="true"></i></div>
<div class="col-xs-1"><i class="fa fa-file-word-o" aria-hidden="true"></i></div>
<div class="col-xs-1"><i class="fa fa-fire" aria-hidden="true"></i></div>
<div class="col-xs-1"><i class="fa fa-flag-o" aria-hidden="true"></i></div>
<div class="col-xs-1"><i class="fa fa-folder-o" aria-hidden="true"></i></div>
<div class="col-xs-1"><i class="fa fa-futbol-o" aria-hidden="true"></i></div>
<div class="col-xs-1"><i class="fa fa-cogs" aria-hidden="true"></i></div>
<div class="col-xs-1"><i class="fa fa-hand-paper-o" aria-hidden="true"></i></div>
<div class="col-xs-1"><i class="fa fa-hand-scissors-o" aria-hidden="true"></i></div>
<div class="col-xs-1"><i class="fa fa-hashtag" aria-hidden="true"></i></div>
<div class="col-xs-1"><i class="fa fa-heart-o" aria-hidden="true"></i></div>
<div class="col-xs-1"><i class="fa fa-bed" aria-hidden="true"></i></div>
<div class="col-xs-1"><i class="fa fa-hourglass-end" aria-hidden="true"></i></div>
<div class="col-xs-1"><i class="fa fa-hourglass-start" aria-hidden="true"></i></div>
<div class="col-xs-1"><i class="fa fa-industry" aria-hidden="true"></i></div>
<div class="col-xs-1"><i class="fa fa-key" aria-hidden="true"></i></div>
<div class="col-xs-1"><i class="fa fa-leaf" aria-hidden="true"></i></div>
<div class="col-xs-1"><i class="fa fa-level-up" aria-hidden="true"></i></div>
<div class="col-xs-1"><i class="fa fa-life-ring" aria-hidden="true"></i></div>
<div class="col-xs-1"><i class="fa fa-lock" aria-hidden="true"></i></div>
<div class="col-xs-1"><i class="fa fa-share" aria-hidden="true"></i></div>
<div class="col-xs-1"><i class="fa fa-map" aria-hidden="true"></i></div>
<div class="col-xs-1"><i class="fa fa-map-signs" aria-hidden="true"></i></div>
<div class="col-xs-1"><i class="fa fa-minus" aria-hidden="true"></i></div>
<div class="col-xs-1"><i class="fa fa-mobile" aria-hidden="true"></i></div>
<div class="col-xs-1"><i class="fa fa-graduation-cap" aria-hidden="true"></i></div>
<div class="col-xs-1"><i class="fa fa-bars" aria-hidden="true"></i></div>
<div class="col-xs-1"><i class="fa fa-paint-brush" aria-hidden="true"></i></div>
<div class="col-xs-1"><i class="fa fa-pencil" aria-hidden="true"></i></div>
<div class="col-xs-1"><i class="fa fa-phone" aria-hidden="true"></i></div>
<div class="col-xs-1"><i class="fa fa-pie-chart" aria-hidden="true"></i></div>
<div class="col-xs-1"><i class="fa fa-plus-circle" aria-hidden="true"></i></div>
<div class="col-xs-1"><i class="fa fa-print" aria-hidden="true"></i></div>
<div class="col-xs-1"><i class="fa fa-question-circle" aria-hidden="true"></i></div>
<div class="col-xs-1"><i class="fa fa-random" aria-hidden="true"></i></div>
<div class="col-xs-1"><i class="fa fa-times" aria-hidden="true"></i></div>
<div class="col-xs-1"><i class="fa fa-retweet" aria-hidden="true"></i></div>
<div class="col-xs-1"><i class="fa fa-rss-square" aria-hidden="true"></i></div>
<div class="col-xs-1"><i class="fa fa-paper-plane" aria-hidden="true"></i></div>
<div class="col-xs-1"><i class="fa fa-share-alt" aria-hidden="true"></i></div>
<div class="col-xs-1"><i class="fa fa-shield" aria-hidden="true"></i></div>
<div class="col-xs-1"><i class="fa fa-shopping-cart" aria-hidden="true"></i></div>
<div class="col-xs-1"><i class="fa fa-signal" aria-hidden="true"></i></div>
<div class="col-xs-1"><i class="fa fa-smile-o" aria-hidden="true"></i></div>
<div class="col-xs-1"><i class="fa fa-sort-alpha-desc" aria-hidden="true"></i></div>
<div class="col-xs-1"><i class="fa fa-sort-desc" aria-hidden="true"></i></div>
<div class="col-xs-1"><i class="fa fa-sort-asc" aria-hidden="true"></i></div>
<div class="col-xs-1"><i class="fa fa-square" aria-hidden="true"></i></div>
<div class="col-xs-1"><i class="fa fa-star-half-o" aria-hidden="true"></i></div>
<div class="col-xs-1"><i class="fa fa-sticky-note" aria-hidden="true"></i></div>
<div class="col-xs-1"><i class="fa fa-sun-o" aria-hidden="true"></i></div>
<div class="col-xs-1"><i class="fa fa-tag" aria-hidden="true"></i></div>
<div class="col-xs-1"><i class="fa fa-television" aria-hidden="true"></i></div>
<div class="col-xs-1"><i class="fa fa-thumbs-o-down" aria-hidden="true"></i></div>
<div class="col-xs-1"><i class="fa fa-times" aria-hidden="true"></i></div>
<div class="col-xs-1"><i class="fa fa-caret-square-o-down" aria-hidden="true"></i></div>
<div class="col-xs-1"><i class="fa fa-caret-square-o-right" aria-hidden="true"></i></div>
<div class="col-xs-1"><i class="fa fa-trash-o" aria-hidden="true"></i></div>
<div class="col-xs-1"><i class="fa fa-tty" aria-hidden="true"></i></div>
<div class="col-xs-1"><i class="fa fa-university" aria-hidden="true"></i></div>
<div class="col-xs-1"><i class="fa fa-upload" aria-hidden="true"></i></div>
<div class="col-xs-1"><i class="fa fa-user-times" aria-hidden="true"></i></div>
<div class="col-xs-1"><i class="fa fa-volume-down" aria-hidden="true"></i></div>
<div class="col-xs-1"><i class="fa fa-wheelchair" aria-hidden="true"></i></div>
<div class="col-xs-1"><i class="fa fa-users" aria-hidden="true"></i></div>
<div class="col-xs-1"><i class="fa fa-unlock" aria-hidden="true"></i></div>
<div class="col-xs-1"><i class="fa fa-television" aria-hidden="true"></i></div>
<div class="col-xs-1"><i class="fa fa-tree" aria-hidden="true"></i></div>
<div class="col-xs-1"><i class="fa fa-caret-square-o-up" aria-hidden="true"></i></div>
<div class="col-xs-1"><i class="fa fa-caret-square-o-left" aria-hidden="true"></i></div>
<div class="col-xs-1"><i class="fa fa-times-circle" aria-hidden="true"></i></div>
<div class="col-xs-1"><i class="fa fa-thumbs-o-up" aria-hidden="true"></i></div>
<div class="col-xs-1"><i class="fa fa-tags" aria-hidden="true"></i></div>
<div class="col-xs-1"><i class="fa fa-life-ring" aria-hidden="true"></i></div>
<div class="col-xs-1"><i class="fa fa-sticky-note-o" aria-hidden="true"></i></div>
<div class="col-xs-1"><i class="fa fa-space-shuttle" aria-hidden="true"></i></div>
<div class="col-xs-1"><i class="fa fa-sort-amount-asc" aria-hidden="true"></i></div>
<div class="col-xs-1"><i class="fa fa-futbol-o" aria-hidden="true"></i></div>
<div class="col-xs-1"><i class="fa fa-sign-language" aria-hidden="true"></i></div>
<div class="col-xs-1"><i class="fa fa-sign-in" aria-hidden="true"></i></div>
<div class="col-xs-1"><i class="fa fa-ship" aria-hidden="true"></i></div>
<div class="col-xs-1"><i class="fa fa-share-alt-square" aria-hidden="true"></i></div>
<div class="col-xs-1"><i class="fa fa-paper-plane-o" aria-hidden="true"></i></div>
<div class="col-xs-1"><i class="fa fa-search" aria-hidden="true"></i></div>
<div class="col-xs-1"><i class="fa fa-road" aria-hidden="true"></i></div>
<div class="col-xs-1"><i class="fa fa-bars" aria-hidden="true"></i></div>
<div class="col-xs-1"><i class="fa fa-recycle" aria-hidden="true"></i></div>
<div class="col-xs-1"><i class="fa fa-question-circle-o" aria-hidden="true"></i></div>
<div class="col-xs-1"><i class="fa fa-puzzle-piece" aria-hidden="true"></i></div>
<div class="col-xs-1"><i class="fa fa-plus-square" aria-hidden="true"></i></div>
<div class="col-xs-1"><i class="fa fa-plane" aria-hidden="true"></i></div>
<div class="col-xs-1"><i class="fa fa-phone-square" aria-hidden="true"></i></div>
<div class="col-xs-1"><i class="fa fa-pencil-square" aria-hidden="true"></i></div>
<div class="col-xs-1"><i class="fa fa-paper-plane" aria-hidden="true"></i></div>
<div class="col-xs-1"><i class="fa fa-newspaper-o" aria-hidden="true"></i></div>
<div class="col-xs-1"><i class="fa fa-motorcycle" aria-hidden="true"></i></div>
<div class="col-xs-1"><i class="fa fa-mobile" aria-hidden="true"></i></div>
<div class="col-xs-1"><i class="fa fa-minus-circle" aria-hidden="true"></i></div>
<div class="col-xs-1"><i class="fa fa-meh-o" aria-hidden="true"></i></div>
<div class="col-xs-1"><i class="fa fa-map-marker" aria-hidden="true"></i></div>
<div class="col-xs-1"><i class="fa fa-reply" aria-hidden="true"></i></div>
<div class="col-xs-1"><i class="fa fa-low-vision" aria-hidden="true"></i></div>
<div class="col-xs-1"><i class="fa fa-lightbulb-o" aria-hidden="true"></i></div>
<div class="col-xs-1"><i class="fa fa-life-ring" aria-hidden="true"></i></div>
<div class="col-xs-1"><i class="fa fa-gavel" aria-hidden="true"></i></div>
<div class="col-xs-1"><i class="fa fa-keyboard-o" aria-hidden="true"></i></div>
<div class="col-xs-1"><i class="fa fa-info" aria-hidden="true"></i></div>
<div class="col-xs-1"><i class="fa fa-i-cursor" aria-hidden="true"></i></div>
<div class="col-xs-1"><i class="fa fa-hourglass-end" aria-hidden="true"></i></div>
<div class="col-xs-1"><i class="fa fa-hourglass" aria-hidden="true"></i></div>
<div class="col-xs-1"><i class="fa fa-heartbeat" aria-hidden="true"></i></div>
<div class="col-xs-1"><i class="fa fa-hdd-o" aria-hidden="true"></i></div>
<div class="col-xs-1"><i class="fa fa-hand-spock-o" aria-hidden="true"></i></div>
<div class="col-xs-1"><i class="fa fa-hand-peace-o" aria-hidden="true"></i></div>
<div class="col-xs-1"><i class="fa fa-users" aria-hidden="true"></i></div>
<div class="col-xs-1"><i class="fa fa-gift" aria-hidden="true"></i></div>
<div class="col-xs-1"><i class="fa fa-gamepad" aria-hidden="true"></i></div>
<div class="col-xs-1"><i class="fa fa-folder-open" aria-hidden="true"></i></div>
<div class="col-xs-1"><i class="fa fa-bolt" aria-hidden="true"></i></div>
<div class="col-xs-1"><i class="fa fa-fire-extinguisher" aria-hidden="true"></i></div>
<div class="col-xs-1"><i class="fa fa-file-archive-o" aria-hidden="true"></i></div>
<div class="col-xs-1"><i class="fa fa-file-powerpoint-o" aria-hidden="true"></i></div>
<div class="col-xs-1"><i class="fa fa-file-video-o" aria-hidden="true"></i></div>
<div class="col-xs-1"><i class="fa fa-file-audio-o" aria-hidden="true"></i></div>
<div class="col-xs-1"><i class="fa fa-rss" aria-hidden="true"></i></div>
<div class="col-xs-1"><i class="fa fa-eye" aria-hidden="true"></i></div>
<div class="col-xs-1"><i class="fa fa-exclamation-circle" aria-hidden="true"></i></div>
<div class="col-xs-1"><i class="fa fa-envelope-square" aria-hidden="true"></i></div>
<div class="col-xs-1"><i class="fa fa-ellipsis-h" aria-hidden="true"></i></div>
<div class="col-xs-1"><i class="fa fa-diamond" aria-hidden="true"></i></div>
<div class="col-xs-1"><i class="fa fa-database" aria-hidden="true"></i></div>
<div class="col-xs-1"><i class="fa fa-cube" aria-hidden="true"></i></div>
<div class="col-xs-1"><i class="fa fa-credit-card" aria-hidden="true"></i></div>
<div class="col-xs-1"><i class="fa fa-comments-o" aria-hidden="true"></i></div>
<div class="col-xs-1"><i class="fa fa-comment-o" aria-hidden="true"></i></div>
<div class="col-xs-1"><i class="fa fa-coffee" aria-hidden="true"></i></div>
<div class="col-xs-1"><i class="fa fa-cloud-download" aria-hidden="true"></i></div>
<div class="col-xs-1"><i class="fa fa-clock-o" aria-hidden="true"></i></div>
<div class="col-xs-1"><i class="fa fa-circle" aria-hidden="true"></i></div>
<div class="col-xs-1"><i class="fa fa-check-circle-o" aria-hidden="true"></i></div>
<div class="col-xs-1"><i class="fa fa-cc" aria-hidden="true"></i></div>
<div class="col-xs-1"><i class="fa fa-caret-square-o-right" aria-hidden="true"></i></div>
<div class="col-xs-1"><i class="fa fa-camera-retro" aria-hidden="true"></i></div>
<div class="col-xs-1"><i class="fa fa-calendar-o" aria-hidden="true"></i></div>
<div class="col-xs-1"><i class="fa fa-calculator" aria-hidden="true"></i></div>
<div class="col-xs-1"><i class="fa fa-bullhorn" aria-hidden="true"></i></div>
<div class="col-xs-1"><i class="fa fa-briefcase" aria-hidden="true"></i></div>
<div class="col-xs-1"><i class="fa fa-book" aria-hidden="true"></i></div>
<div class="col-xs-1"><i class="fa fa-bluetooth" aria-hidden="true"></i></div>
<div class="col-xs-1"><i class="fa fa-bicycle" aria-hidden="true"></i></div>
<div class="col-xs-1"><i class="fa fa-bell" aria-hidden="true"></i></div>
<div class="col-xs-1"><i class="fa fa-battery-quarter" aria-hidden="true"></i></div>
<div class="col-xs-1"><i class="fa fa-battery-full" aria-hidden="true"></i></div>
<div class="col-xs-1"><i class="fa fa-battery-empty" aria-hidden="true"></i></div>
<div class="col-xs-1"><i class="fa fa-bar-chart" aria-hidden="true"></i></div>
<div class="col-xs-1"><i class="fa fa-car" aria-hidden="true"></i></div>
<div class="col-xs-1"><i class="fa fa-arrows" aria-hidden="true"></i></div>
<div class="col-xs-1"><i class="fa fa-anchor" aria-hidden="true"></i></div>
<div class="col-xs-1"><i class="fa fa-asterisk" aria-hidden="true"></i></div>
<div class="col-xs-1"><i class="fa fa-balance-scale" aria-hidden="true"></i></div>
<div class="col-xs-1"><i class="fa fa-bar-chart" aria-hidden="true"></i></div>
<div class="col-xs-1"><i class="fa fa-battery-quarter" aria-hidden="true"></i></div>
<div class="col-xs-1"><i class="fa fa-battery-empty" aria-hidden="true"></i></div>
<div class="col-xs-1"><i class="fa fa-battery-three-quarters" aria-hidden="true"></i></div>
<div class="col-xs-1"><i class="fa fa-bell-o" aria-hidden="true"></i></div>
<div class="col-xs-1"><i class="fa fa-binoculars" aria-hidden="true"></i></div>
<div class="col-xs-1"><i class="fa fa-bluetooth-b" aria-hidden="true"></i></div>
<div class="col-xs-1"><i class="fa fa-bookmark" aria-hidden="true"></i></div>
<div class="col-xs-1"><i class="fa fa-bug" aria-hidden="true"></i></div>
<div class="col-xs-1"><i class="fa fa-bullseye" aria-hidden="true"></i></div>
<div class="col-xs-1"><i class="fa fa-calendar" aria-hidden="true"></i></div>
<div class="col-xs-1"><i class="fa fa-calendar-plus-o" aria-hidden="true"></i></div>
<div class="col-xs-1"><i class="fa fa-car" aria-hidden="true"></i></div>
<div class="col-xs-1"><i class="fa fa-caret-square-o-up" aria-hidden="true"></i></div>
<div class="col-xs-1"><i class="fa fa-certificate" aria-hidden="true"></i></div>
<div class="col-xs-1"><i class="fa fa-check-square" aria-hidden="true"></i></div>
<div class="col-xs-1"><i class="fa fa-circle-o" aria-hidden="true"></i></div>
<div class="col-xs-1"><i class="fa fa-clone" aria-hidden="true"></i></div>
<div class="col-xs-1"><i class="fa fa-cloud-upload" aria-hidden="true"></i></div>
<div class="col-xs-1"><i class="fa fa-cog" aria-hidden="true"></i></div>
<div class="col-xs-1"><i class="fa fa-commenting" aria-hidden="true"></i></div>
<div class="col-xs-1"><i class="fa fa-compass" aria-hidden="true"></i></div>
<div class="col-xs-1"><i class="fa fa-credit-card-alt" aria-hidden="true"></i></div>
<div class="col-xs-1"><i class="fa fa-cubes" aria-hidden="true"></i></div>
<div class="col-xs-1"><i class="fa fa-deaf" aria-hidden="true"></i></div>
<div class="col-xs-1"><i class="fa fa-dot-circle-o" aria-hidden="true"></i></div>
<div class="col-xs-1"><i class="fa fa-ellipsis-v" aria-hidden="true"></i></div>
<div class="col-xs-1"><i class="fa fa-eraser" aria-hidden="true"></i></div>
<div class="col-xs-1"><i class="fa fa-exclamation-triangle" aria-hidden="true"></i></div>
<div class="col-xs-1"><i class="fa fa-eye-slash" aria-hidden="true"></i></div>
<div class="col-xs-1"><i class="fa fa-female" aria-hidden="true"></i></div>
<div class="col-xs-1"><i class="fa fa-file-code-o" aria-hidden="true"></i></div>
<div class="col-xs-1"><i class="fa fa-file-pdf-o" aria-hidden="true"></i></div>
<div class="col-xs-1"><i class="fa fa-file-audio-o" aria-hidden="true"></i></div>
<div class="col-xs-1"><i class="fa fa-film" aria-hidden="true"></i></div>
<div class="col-xs-1"><i class="fa fa-flag" aria-hidden="true"></i></div>
<div class="col-xs-1"><i class="fa fa-flask" aria-hidden="true"></i></div>
<div class="col-xs-1"><i class="fa fa-folder-open-o" aria-hidden="true"></i></div>
<div class="col-xs-1"><i class="fa fa-gavel" aria-hidden="true"></i></div>
<div class="col-xs-1"><i class="fa fa-glass" aria-hidden="true"></i></div>
<div class="col-xs-1"><i class="fa fa-hand-rock-o" aria-hidden="true"></i></div>
<div class="col-xs-1"><i class="fa fa-hand-pointer-o" aria-hidden="true"></i></div>
<div class="col-xs-1"><i class="fa fa-hand-paper-o" aria-hidden="true"></i></div>
<div class="col-xs-1"><i class="fa fa-headphones" aria-hidden="true"></i></div>
<div class="col-xs-1"><i class="fa fa-history" aria-hidden="true"></i></div>
<div class="col-xs-1"><i class="fa fa-hourglass-start" aria-hidden="true"></i></div>
<div class="col-xs-1"><i class="fa fa-hourglass-half" aria-hidden="true"></i></div>
<div class="col-xs-1"><i class="fa fa-picture-o" aria-hidden="true"></i></div>
<div class="col-xs-1"><i class="fa fa-info-circle" aria-hidden="true"></i></div>
<div class="col-xs-1"><i class="fa fa-language" aria-hidden="true"></i></div>
<div class="col-xs-1"><i class="fa fa-lemon-o" aria-hidden="true"></i></div>
<div class="col-xs-1"><i class="fa fa-life-ring" aria-hidden="true"></i></div>
<div class="col-xs-1"><i class="fa fa-line-chart" aria-hidden="true"></i></div>
<div class="col-xs-1"><i class="fa fa-magic" aria-hidden="true"></i></div>
<div class="col-xs-1"><i class="fa fa-reply-all" aria-hidden="true"></i></div>
<div class="col-xs-1"><i class="fa fa-microphone" aria-hidden="true"></i></div>
<div class="col-xs-1"><i class="fa fa-minus-square" aria-hidden="true"></i></div>
<div class="col-xs-1"><i class="fa fa-money" aria-hidden="true"></i></div>
<div class="col-xs-1"><i class="fa fa-mouse-pointer" aria-hidden="true"></i></div>
<div class="col-xs-1"><i class="fa fa-paper-plane-o" aria-hidden="true"></i></div>
<div class="col-xs-1"><i class="fa fa-pencil-square-o" aria-hidden="true"></i></div>
<div class="col-xs-1"><i class="fa fa-picture-o" aria-hidden="true"></i></div>
<div class="col-xs-1"><i class="fa fa-plug" aria-hidden="true"></i></div>
<div class="col-xs-1"><i class="fa fa-plus-square-o" aria-hidden="true"></i></div>
<div class="col-xs-1"><i class="fa fa-qrcode" aria-hidden="true"></i></div>
<div class="col-xs-1"><i class="fa fa-refresh" aria-hidden="true"></i></div>
<div class="col-xs-1"><i class="fa fa-reply" aria-hidden="true"></i></div>
<div class="col-xs-1"><i class="fa fa-rocket" aria-hidden="true"></i></div>
<div class="col-xs-1"><i class="fa fa-search-minus" aria-hidden="true"></i></div>
<div class="col-xs-1"><i class="fa fa-server" aria-hidden="true"></i></div>
<div class="col-xs-1"><i class="fa fa-share-square" aria-hidden="true"></i></div>
<div class="col-xs-1"><i class="fa fa-shopping-bag" aria-hidden="true"></i></div>
<div class="col-xs-1"><i class="fa fa-sign-language" aria-hidden="true"></i></div>
<div class="col-xs-1"><i class="fa fa-sitemap" aria-hidden="true"></i></div>
<div class="col-xs-1"><i class="fa fa-sort" aria-hidden="true"></i></div>
<div class="col-xs-1"><i class="fa fa-sort-amount-desc" aria-hidden="true"></i></div>
<div class="col-xs-1"><i class="fa fa-sort-numeric-asc" aria-hidden="true"></i></div>
<div class="col-xs-1"><i class="fa fa-spinner" aria-hidden="true"></i></div>
<div class="col-xs-1"><i class="fa fa-star" aria-hidden="true"></i></div>
<div class="col-xs-1"><i class="fa fa-star-half-o" aria-hidden="true"></i></div>
<div class="col-xs-1"><i class="fa fa-street-view" aria-hidden="true"></i></div>
<div class="col-xs-1"><i class="fa fa-tablet" aria-hidden="true"></i></div>
<div class="col-xs-1"><i class="fa fa-tasks" aria-hidden="true"></i></div>
<div class="col-xs-1"><i class="fa fa-thumb-tack" aria-hidden="true"></i></div>
<div class="col-xs-1"><i class="fa fa-thumbs-up" aria-hidden="true"></i></div>
<div class="col-xs-1"><i class="fa fa-times-circle-o" aria-hidden="true"></i></div>
<div class="col-xs-1"><i class="fa fa-toggle-off" aria-hidden="true"></i></div>
<div class="col-xs-1"><i class="fa fa-trademark" aria-hidden="true"></i></div>
<div class="col-xs-1"><i class="fa fa-trophy" aria-hidden="true"></i></div>
<div class="col-xs-1"><i class="fa fa-umbrella" aria-hidden="true"></i></div>
<div class="col-xs-1"><i class="fa fa-unlock-alt" aria-hidden="true"></i></div>
<div class="col-xs-1"><i class="fa fa-user-plus" aria-hidden="true"></i></div>
<div class="col-xs-1"><i class="fa fa-video-camera" aria-hidden="true"></i></div>
<div class="col-xs-1"><i class="fa fa-volume-up" aria-hidden="true"></i></div>
<div class="col-xs-1"><i class="fa fa-wifi" aria-hidden="true"></i></div>
<div class="col-xs-1"><i class="fa fa-wrench" aria-hidden="true"></i></div>
<div class="col-xs-1"><i class="fa fa-exclamation-triangle" aria-hidden="true"></i></div>
<div class="col-xs-1"><i class="fa fa-volume-control-phone" aria-hidden="true"></i></div>
<div class="col-xs-1"><i class="fa fa-user-secret" aria-hidden="true"></i></div>
<div class="col-xs-1"><i class="fa fa-sort" aria-hidden="true"></i></div>
<div class="col-xs-1"><i class="fa fa-universal-access" aria-hidden="true"></i></div>
<div class="col-xs-1"><i class="fa fa-truck" aria-hidden="true"></i></div>
<div class="col-xs-1"><i class="fa fa-trash" aria-hidden="true"></i></div>
<div class="col-xs-1"><i class="fa fa-toggle-on" aria-hidden="true"></i></div>
<div class="col-xs-1"><i class="fa fa-tint" aria-hidden="true"></i></div>
<div class="col-xs-1"><i class="fa fa-ticket" aria-hidden="true"></i></div>
<div class="col-xs-1"><i class="fa fa-thumbs-down" aria-hidden="true"></i></div>
<div class="col-xs-1"><i class="fa fa-taxi" aria-hidden="true"></i></div>
<div class="col-xs-1"><i class="fa fa-tachometer" aria-hidden="true"></i></div>
<div class="col-xs-1"><i class="fa fa-suitcase" aria-hidden="true"></i></div>
<div class="col-xs-1"><i class="fa fa-star-o" aria-hidden="true"></i></div>
<div class="col-xs-1"><i class="fa fa-star-half" aria-hidden="true"></i></div>
<div class="col-xs-1"><i class="fa fa-spoon" aria-hidden="true"></i></div>
<div class="col-xs-1"><i class="fa fa-sort-numeric-desc" aria-hidden="true"></i></div>
<div class="col-xs-1"><i class="fa fa-sort-asc" aria-hidden="true"></i></div>
<div class="col-xs-1"><i class="fa fa-sliders" aria-hidden="true"></i></div>
<div class="col-xs-1"><i class="fa fa-sign-out" aria-hidden="true"></i></div>
<div class="col-xs-1"><i class="fa fa-shopping-basket" aria-hidden="true"></i></div>
<div class="col-xs-1"><i class="fa fa-share-square-o" aria-hidden="true"></i></div>
<div class="col-xs-1"><i class="fa fa-share" aria-hidden="true"></i></div>
<div class="col-xs-1"><i class="fa fa-search-plus" aria-hidden="true"></i></div>
<div class="col-xs-1"><i class="fa fa-rss" aria-hidden="true"></i></div>
<div class="col-xs-1"><i class="fa fa-reply-all" aria-hidden="true"></i></div>
<div class="col-xs-1"><i class="fa fa-registered" aria-hidden="true"></i></div>
<div class="col-xs-1"><i class="fa fa-question" aria-hidden="true"></i></div>
<div class="col-xs-1"><i class="fa fa-power-off" aria-hidden="true"></i></div>
<div class="col-xs-1"><i class="fa fa-plus" aria-hidden="true"></i></div>
<div class="col-xs-1"><i class="fa fa-picture-o" aria-hidden="true"></i></div>
<div class="col-xs-1"><i class="fa fa-percent" aria-hidden="true"></i></div>
<div class="col-xs-1"><i class="fa fa-paw" aria-hidden="true"></i></div>
<div class="col-xs-1"><i class="fa fa-object-ungroup" aria-hidden="true"></i></div>
<div class="col-xs-1"><i class="fa fa-music" aria-hidden="true"></i></div>
<div class="col-xs-1"><i class="fa fa-moon-o" aria-hidden="true"></i></div>
<div class="col-xs-1"><i class="fa fa-minus-square-o" aria-hidden="true"></i></div>
<div class="col-xs-1"><i class="fa fa-microphone-slash" aria-hidden="true"></i></div>
<div class="col-xs-1"><i class="fa fa-map-pin" aria-hidden="true"></i></div>
<div class="col-xs-1"><i class="fa fa-male" aria-hidden="true"></i></div>
<div class="col-xs-1"><i class="fa fa-magnet" aria-hidden="true"></i></div>
<div class="col-xs-1"><i class="fa fa-location-arrow" aria-hidden="true"></i></div>
<div class="col-xs-1"><i class="fa fa-life-ring" aria-hidden="true"></i></div>
<div class="col-xs-1"><i class="fa fa-level-down" aria-hidden="true"></i></div>
<div class="col-xs-1"><i class="fa fa-laptop" aria-hidden="true"></i></div>
<div class="col-xs-1"><i class="fa fa-university" aria-hidden="true"></i></div>
<div class="col-xs-1"><i class="fa fa-inbox" aria-hidden="true"></i></div>
<div class="col-xs-1"><i class="fa fa-hourglass-o" aria-hidden="true"></i></div>
<div class="col-xs-1"><i class="fa fa-hourglass-half" aria-hidden="true"></i></div>
<div class="col-xs-1"><i class="fa fa-home" aria-hidden="true"></i></div>
<div class="col-xs-1"><i class="fa fa-heart" aria-hidden="true"></i></div>
<div class="col-xs-1"><i class="fa fa-hand-rock-o" aria-hidden="true"></i></div>
<div class="col-xs-1"><i class="fa fa-hand-lizard-o" aria-hidden="true"></i></div>
<div class="col-xs-1"><i class="fa fa-globe" aria-hidden="true"></i></div>
<div class="col-xs-1"><i class="fa fa-cog" aria-hidden="true"></i></div>
<div class="col-xs-1"><i class="fa fa-frown-o" aria-hidden="true"></i></div>
<div class="col-xs-1"><i class="fa fa-folder" aria-hidden="true"></i></div>
<div class="col-xs-1"><i class="fa fa-flag-checkered" aria-hidden="true"></i></div>
<div class="col-xs-1"><i class="fa fa-filter" aria-hidden="true"></i></div>
<div class="col-xs-1"><i class="fa fa-file-video-o" aria-hidden="true"></i></div>
<div class="col-xs-1"><i class="fa fa-file-image-o" aria-hidden="true"></i></div>
<div class="col-xs-1"><i class="fa fa-file-excel-o" aria-hidden="true"></i></div>
<div class="col-xs-1"><i class="fa fa-fighter-jet" aria-hidden="true"></i></div>
<div class="col-xs-1"><i class="fa fa-eyedropper" aria-hidden="true"></i></div>
<div class="col-xs-1"><i class="fa fa-external-link" aria-hidden="true"></i></div>
<div class="col-xs-1"><i class="fa fa-exchange" aria-hidden="true"></i></div>
<div class="col-xs-1"><i class="fa fa-envelope" aria-hidden="true"></i></div>
<div class="col-xs-1"><i class="fa fa-download" aria-hidden="true"></i></div>
<div class="col-xs-1"><i class="fa fa-cutlery" aria-hidden="true"></i></div>
<div class="col-xs-1"><i class="fa fa-crop" aria-hidden="true"></i></div>
<div class="col-xs-1"><i class="fa fa-copyright" aria-hidden="true"></i></div>
<div class="col-xs-1"><i class="fa fa-commenting-o" aria-hidden="true"></i></div>
<div class="col-xs-1"><i class="fa fa-cogs" aria-hidden="true"></i></div>
<div class="col-xs-1"><i class="fa fa-code" aria-hidden="true"></i></div>
<div class="col-xs-1"><i class="fa fa-times" aria-hidden="true"></i></div>
<div class="col-xs-1"><i class="fa fa-circle-o-notch" aria-hidden="true"></i></div>
<div class="col-xs-1"><i class="fa fa-check-square-o" aria-hidden="true"></i></div>
<div class="col-xs-1"><i class="fa fa-check" aria-hidden="true"></i></div>
<div class="col-xs-1"><i class="fa fa-cart-arrow-down" aria-hidden="true"></i></div>
<div class="col-xs-1"><i class="fa fa-caret-square-o-down" aria-hidden="true"></i></div>
<div class="col-xs-1"><i class="fa fa-calendar-times-o" aria-hidden="true"></i></div>
<div class="col-xs-1"><i class="fa fa-calendar-check-o" aria-hidden="true"></i></div>
<div class="col-xs-1"><i class="fa fa-bus" aria-hidden="true"></i></div>
<div class="col-xs-1"><i class="fa fa-building" aria-hidden="true"></i></div>
<div class="col-xs-1"><i class="fa fa-bookmark-o" aria-hidden="true"></i></div>
<div class="col-xs-1"><i class="fa fa-bolt" aria-hidden="true"></i></div>
<div class="col-xs-1"><i class="fa fa-birthday-cake" aria-hidden="true"></i></div>
<div class="col-xs-1"><i class="fa fa-bell-slash" aria-hidden="true"></i></div>
<div class="col-xs-1"><i class="fa fa-bed" aria-hidden="true"></i></div>
<div class="col-xs-1"><i class="fa fa-battery-full" aria-hidden="true"></i></div>
<div class="col-xs-1"><i class="fa fa-barcode" aria-hidden="true"></i></div>
<div class="col-xs-1"><i class="fa fa-ban" aria-hidden="true"></i></div>
<div class="col-xs-1"><i class="fa fa-at" aria-hidden="true"></i></div>
<div class="col-xs-1"><i class="fa fa-arrows-v" aria-hidden="true"></i></div>
<div class="col-xs-1"><i class="fa fa-archive" aria-hidden="true"></i></div>
<div class="col-xs-1"><i class="fa fa-hand-rock-o" aria-hidden="true"></i></div>
<div class="col-xs-1"><i class="fa fa-hand-o-right" aria-hidden="true"></i></div>
<div class="col-xs-1"><i class="fa fa-hand-pointer-o" aria-hidden="true"></i></div>
<div class="col-xs-1"><i class="fa fa-hand-paper-o" aria-hidden="true"></i></div>
<div class="col-xs-1"><i class="fa fa-thumbs-up" aria-hidden="true"></i></div>
<div class="col-xs-1"><i class="fa fa-hand-lizard-o" aria-hidden="true"></i></div>
<div class="col-xs-1"><i class="fa fa-hand-o-up" aria-hidden="true"></i></div>
<div class="col-xs-1"><i class="fa fa-hand-rock-o" aria-hidden="true"></i></div>
<div class="col-xs-1"><i class="fa fa-thumbs-down" aria-hidden="true"></i></div>
<div class="col-xs-1"><i class="fa fa-hand-o-down" aria-hidden="true"></i></div>
<div class="col-xs-1"><i class="fa fa-hand-paper-o" aria-hidden="true"></i></div>
<div class="col-xs-1"><i class="fa fa-hand-scissors-o" aria-hidden="true"></i></div>
<div class="col-xs-1"><i class="fa fa-thumbs-o-down" aria-hidden="true"></i></div>
<div class="col-xs-1"><i class="fa fa-hand-o-left" aria-hidden="true"></i></div>
<div class="col-xs-1"><i class="fa fa-hand-peace-o" aria-hidden="true"></i></div>
<div class="col-xs-1"><i class="fa fa-hand-spock-o" aria-hidden="true"></i></div>
<div class="col-xs-1"><i class="fa fa-thumbs-o-up" aria-hidden="true"></i></div>
<div class="col-xs-1"><i class="fa fa-ambulance" aria-hidden="true"></i></div>
<div class="col-xs-1"><i class="fa fa-taxi" aria-hidden="true"></i></div>
<div class="col-xs-1"><i class="fa fa-plane" aria-hidden="true"></i></div>
<div class="col-xs-1"><i class="fa fa-subway" aria-hidden="true"></i></div>
<div class="col-xs-1"><i class="fa fa-car" aria-hidden="true"></i></div>
<div class="col-xs-1"><i class="fa fa-rocket" aria-hidden="true"></i></div>
<div class="col-xs-1"><i class="fa fa-taxi" aria-hidden="true"></i></div>
<div class="col-xs-1"><i class="fa fa-bicycle" aria-hidden="true"></i></div>
<div class="col-xs-1"><i class="fa fa-fighter-jet" aria-hidden="true"></i></div>
<div class="col-xs-1"><i class="fa fa-ship" aria-hidden="true"></i></div>
<div class="col-xs-1"><i class="fa fa-train" aria-hidden="true"></i></div>
<div class="col-xs-1"><i class="fa fa-bus" aria-hidden="true"></i></div>
<div class="col-xs-1"><i class="fa fa-motorcycle" aria-hidden="true"></i></div>
<div class="col-xs-1"><i class="fa fa-space-shuttle" aria-hidden="true"></i></div>
<div class="col-xs-1"><i class="fa fa-truck" aria-hidden="true"></i></div>
<div class="col-xs-1"><i class="fa fa-file" aria-hidden="true"></i></div>
<div class="col-xs-1"><i class="fa fa-file-excel-o" aria-hidden="true"></i></div>
<div class="col-xs-1"><i class="fa fa-file-pdf-o" aria-hidden="true"></i></div>
<div class="col-xs-1"><i class="fa fa-file-audio-o" aria-hidden="true"></i></div>
<div class="col-xs-1"><i class="fa fa-file-word-o" aria-hidden="true"></i></div>
<div class="col-xs-1"><i class="fa fa-file-archive-o" aria-hidden="true"></i></div>
<div class="col-xs-1"><i class="fa fa-file-image-o" aria-hidden="true"></i></div>
<div class="col-xs-1"><i class="fa fa-file-image-o" aria-hidden="true"></i></div>
<div class="col-xs-1"><i class="fa fa-file-text" aria-hidden="true"></i></div>
<div class="col-xs-1"><i class="fa fa-file-archive-o" aria-hidden="true"></i></div>
<div class="col-xs-1"><i class="fa fa-file-audio-o" aria-hidden="true"></i></div>
<div class="col-xs-1"><i class="fa fa-file-video-o" aria-hidden="true"></i></div>
<div class="col-xs-1"><i class="fa fa-file-image-o" aria-hidden="true"></i></div>
<div class="col-xs-1"><i class="fa fa-file-text-o" aria-hidden="true"></i></div>
<div class="col-xs-1"><i class="fa fa-file-code-o" aria-hidden="true"></i></div>
<div class="col-xs-1"><i class="fa fa-file-o" aria-hidden="true"></i></div>
<div class="col-xs-1"><i class="fa fa-file-powerpoint-o" aria-hidden="true"></i></div>
<div class="col-xs-1"><i class="fa fa-file-video-o" aria-hidden="true"></i></div>
<div class="col-xs-1"><i class="fa fa-cc-amex" aria-hidden="true"></i></div>
<div class="col-xs-1"><i class="fa fa-cc-mastercard" aria-hidden="true"></i></div>
<div class="col-xs-1"><i class="fa fa-credit-card" aria-hidden="true"></i></div>
<div class="col-xs-1"><i class="fa fa-cc-diners-club" aria-hidden="true"></i></div>
<div class="col-xs-1"><i class="fa fa-cc-paypal" aria-hidden="true"></i></div>
<div class="col-xs-1"><i class="fa fa-credit-card-alt" aria-hidden="true"></i></div>
<div class="col-xs-1"><i class="fa fa-cc-discover" aria-hidden="true"></i></div>
<div class="col-xs-1"><i class="fa fa-cc-stripe" aria-hidden="true"></i></div>
<div class="col-xs-1"><i class="fa fa-google-wallet" aria-hidden="true"></i></div>
<div class="col-xs-1"><i class="fa fa-cc-jcb" aria-hidden="true"></i></div>
<div class="col-xs-1"><i class="fa fa-cc-visa" aria-hidden="true"></i></div>
<div class="col-xs-1"><i class="fa fa-paypal" aria-hidden="true"></i></div>
<div class="col-xs-1"><i class="fa fa-usd" aria-hidden="true"></i></div>
<div class="col-xs-1"><i class="fa fa-gg" aria-hidden="true"></i></div>
<div class="col-xs-1"><i class="fa fa-jpy" aria-hidden="true"></i></div>
<div class="col-xs-1"><i class="fa fa-rub" aria-hidden="true"></i></div>
<div class="col-xs-1"><i class="fa fa-gbp" aria-hidden="true"></i></div>
<div class="col-xs-1"><i class="fa fa-eur" aria-hidden="true"></i></div>
<div class="col-xs-1"><i class="fa fa-eur" aria-hidden="true"></i></div>
<div class="col-xs-1"><i class="fa fa-angellist" aria-hidden="true"></i></div>
<div class="col-xs-1"><i class="fa fa-bitbucket" aria-hidden="true"></i></div>
<div class="col-xs-1"><i class="fa fa-bluetooth" aria-hidden="true"></i></div>
<div class="col-xs-1"><i class="fa fa-cc-amex" aria-hidden="true"></i></div>
<div class="col-xs-1"><i class="fa fa-cc-mastercard" aria-hidden="true"></i></div>
<div class="col-xs-1"><i class="fa fa-chrome" aria-hidden="true"></i></div>
<div class="col-xs-1"><i class="fa fa-contao" aria-hidden="true"></i></div>
<div class="col-xs-1"><i class="fa fa-deviantart" aria-hidden="true"></i></div>
<div class="col-xs-1"><i class="fa fa-drupal" aria-hidden="true"></i></div>
<div class="col-xs-1"><i class="fa fa-expeditedssl" aria-hidden="true"></i></div>
<div class="col-xs-1"><i class="fa fa-facebook-official" aria-hidden="true"></i></div>
<div class="col-xs-1"><i class="fa fa-flickr" aria-hidden="true"></i></div>
<div class="col-xs-1"><i class="fa fa-forumbee" aria-hidden="true"></i></div>
<div class="col-xs-1"><i class="fa fa-gg" aria-hidden="true"></i></div>
<div class="col-xs-1"><i class="fa fa-github" aria-hidden="true"></i></div>
<div class="col-xs-1"><i class="fa fa-gratipay" aria-hidden="true"></i></div>
<div class="col-xs-1"><i class="fa fa-google-plus" aria-hidden="true"></i></div>
<div class="col-xs-1"><i class="fa fa-google-wallet" aria-hidden="true"></i></div>
<div class="col-xs-1"><i class="fa fa-html5" aria-hidden="true"></i></div>
<div class="col-xs-1"><i class="fa fa-joomla" aria-hidden="true"></i></div>
<div class="col-xs-1"><i class="fa fa-leanpub" aria-hidden="true"></i></div>
<div class="col-xs-1"><i class="fa fa-maxcdn" aria-hidden="true"></i></div>
<div class="col-xs-1"><i class="fa fa-modx" aria-hidden="true"></i></div>
<div class="col-xs-1"><i class="fa fa-openid" aria-hidden="true"></i></div>
<div class="col-xs-1"><i class="fa fa-paypal" aria-hidden="true"></i></div>
<div class="col-xs-1"><i class="fa fa-pinterest" aria-hidden="true"></i></div>
<div class="col-xs-1"><i class="fa fa-qq" aria-hidden="true"></i></div>
<div class="col-xs-1"><i class="fa fa-reddit-alien" aria-hidden="true"></i></div>
<div class="col-xs-1"><i class="fa fa-safari" aria-hidden="true"></i></div>
<div class="col-xs-1"><i class="fa fa-share-alt-square" aria-hidden="true"></i></div>
<div class="col-xs-1"><i class="fa fa-skype" aria-hidden="true"></i></div>
<div class="col-xs-1"><i class="fa fa-snapchat-ghost" aria-hidden="true"></i></div>
<div class="col-xs-1"><i class="fa fa-stack-exchange" aria-hidden="true"></i></div>
<div class="col-xs-1"><i class="fa fa-stumbleupon" aria-hidden="true"></i></div>
<div class="col-xs-1"><i class="fa fa-trello" aria-hidden="true"></i></div>
<div class="col-xs-1"><i class="fa fa-twitch" aria-hidden="true"></i></div>
<div class="col-xs-1"><i class="fa fa-vimeo-square" aria-hidden="true"></i></div>
<div class="col-xs-1"><i class="fa fa-weibo" aria-hidden="true"></i></div>
<div class="col-xs-1"><i class="fa fa-windows" aria-hidden="true"></i></div>
<div class="col-xs-1"><i class="fa fa-xing" aria-hidden="true"></i></div>
<div class="col-xs-1"><i class="fa fa-yahoo" aria-hidden="true"></i></div>
<div class="col-xs-1"><i class="fa fa-yoast" aria-hidden="true"></i></div>
<div class="col-xs-1"><i class="fa fa-youtube" aria-hidden="true"></i></div>
<div class="col-xs-1"><i class="fa fa-y-combinator" aria-hidden="true"></i></div>
<div class="col-xs-1"><i class="fa fa-xing-square" aria-hidden="true"></i></div>
<div class="col-xs-1"><i class="fa fa-wordpress" aria-hidden="true"></i></div>
<div class="col-xs-1"><i class="fa fa-weixin" aria-hidden="true"></i></div>
<div class="col-xs-1"><i class="fa fa-vine" aria-hidden="true"></i></div>
<div class="col-xs-1"><i class="fa fa-viadeo" aria-hidden="true"></i></div>
<div class="col-xs-1"><i class="fa fa-twitter" aria-hidden="true"></i></div>
<div class="col-xs-1"><i class="fa fa-tripadvisor" aria-hidden="true"></i></div>
<div class="col-xs-1"><i class="fa fa-stumbleupon-circle" aria-hidden="true"></i></div>
<div class="col-xs-1"><i class="fa fa-stack-overflow" aria-hidden="true"></i></div>
<div class="col-xs-1"><i class="fa fa-snapchat-square" aria-hidden="true"></i></div>
<div class="col-xs-1"><i class="fa fa-slack" aria-hidden="true"></i></div>
<div class="col-xs-1"><i class="fa fa-shirtsinbulk" aria-hidden="true"></i></div>
<div class="col-xs-1"><i class="fa fa-scribd" aria-hidden="true"></i></div>
<div class="col-xs-1"><i class="fa fa-reddit-square" aria-hidden="true"></i></div>
<div class="col-xs-1"><i class="fa fa-rebel" aria-hidden="true"></i></div>
<div class="col-xs-1"><i class="fa fa-pinterest-p" aria-hidden="true"></i></div>
<div class="col-xs-1"><i class="fa fa-pied-piper" aria-hidden="true"></i></div>
<div class="col-xs-1"><i class="fa fa-opera" aria-hidden="true"></i></div>
<div class="col-xs-1"><i class="fa fa-odnoklassniki" aria-hidden="true"></i></div>
<div class="col-xs-1"><i class="fa fa-meanpath" aria-hidden="true"></i></div>
<div class="col-xs-1"><i class="fa fa-linkedin" aria-hidden="true"></i></div>
<div class="col-xs-1"><i class="fa fa-jsfiddle" aria-hidden="true"></i></div>
<div class="col-xs-1"><i class="fa fa-instagram" aria-hidden="true"></i></div>
<div class="col-xs-1"><i class="fa fa-gratipay" aria-hidden="true"></i></div>
<div class="col-xs-1"><i class="fa fa-google-plus-official" aria-hidden="true"></i></div>
<div class="col-xs-1"><i class="fa fa-glide" aria-hidden="true"></i></div>
<div class="col-xs-1"><i class="fa fa-github-alt" aria-hidden="true"></i></div>
<div class="col-xs-1"><i class="fa fa-gg-circle" aria-hidden="true"></i></div>
<div class="col-xs-1"><i class="fa fa-foursquare" aria-hidden="true"></i></div>
<div class="col-xs-1"><i class="fa fa-font-awesome" aria-hidden="true"></i></div>
<div class="col-xs-1"><i class="fa fa-facebook-square" aria-hidden="true"></i></div>
<div class="col-xs-1"><i class="fa fa-font-awesome" aria-hidden="true"></i></div>
<div class="col-xs-1"><i class="fa fa-edge" aria-hidden="true"></i></div>
<div class="col-xs-1"><i class="fa fa-css3" aria-hidden="true"></i></div>
<div class="col-xs-1"><i class="fa fa-codepen" aria-hidden="true"></i></div>
<div class="col-xs-1"><i class="fa fa-cc-paypal" aria-hidden="true"></i></div>
<div class="col-xs-1"><i class="fa fa-cc-diners-club" aria-hidden="true"></i></div>
<div class="col-xs-1"><i class="fa fa-bluetooth-b" aria-hidden="true"></i></div>
<div class="col-xs-1"><i class="fa fa-bitbucket-square" aria-hidden="true"></i></div>
<div class="col-xs-1"><i class="fa fa-apple" aria-hidden="true"></i></div>
<div class="col-xs-1"><i class="fa fa-adn" aria-hidden="true"></i></div>
<div class="col-xs-1"><i class="fa fa-amazon" aria-hidden="true"></i></div>
<div class="col-xs-1"><i class="fa fa-behance" aria-hidden="true"></i></div>
<div class="col-xs-1"><i class="fa fa-btc" aria-hidden="true"></i></div>
<div class="col-xs-1"><i class="fa fa-cc-discover" aria-hidden="true"></i></div>
<div class="col-xs-1"><i class="fa fa-cc-stripe" aria-hidden="true"></i></div>
<div class="col-xs-1"><i class="fa fa-codiepie" aria-hidden="true"></i></div>
<div class="col-xs-1"><i class="fa fa-dashcube" aria-hidden="true"></i></div>
<div class="col-xs-1"><i class="fa fa-dribbble" aria-hidden="true"></i></div>
<div class="col-xs-1"><i class="fa fa-empire" aria-hidden="true"></i></div>
<div class="col-xs-1"><i class="fa fa-facebook" aria-hidden="true"></i></div>
<div class="col-xs-1"><i class="fa fa-firefox" aria-hidden="true"></i></div>
<div class="col-xs-1"><i class="fa fa-fonticons" aria-hidden="true"></i></div>
<div class="col-xs-1"><i class="fa fa-empire" aria-hidden="true"></i></div>
<div class="col-xs-1"><i class="fa fa-github-square" aria-hidden="true"></i></div>
<div class="col-xs-1"><i class="fa fa-glide-g" aria-hidden="true"></i></div>
<div class="col-xs-1"><i class="fa fa-google-plus-official" aria-hidden="true"></i></div>
<div class="col-xs-1"><i class="fa fa-hacker-news" aria-hidden="true"></i></div>
<div class="col-xs-1"><i class="fa fa-internet-explorer" aria-hidden="true"></i></div>
<div class="col-xs-1"><i class="fa fa-lastfm" aria-hidden="true"></i></div>
<div class="col-xs-1"><i class="fa fa-linkedin-square" aria-hidden="true"></i></div>
<div class="col-xs-1"><i class="fa fa-medium" aria-hidden="true"></i></div>
<div class="col-xs-1"><i class="fa fa-odnoklassniki-square" aria-hidden="true"></i></div>
<div class="col-xs-1"><i class="fa fa-optin-monster" aria-hidden="true"></i></div>
<div class="col-xs-1"><i class="fa fa-pied-piper-alt" aria-hidden="true"></i></div>
<div class="col-xs-1"><i class="fa fa-pinterest-square" aria-hidden="true"></i></div>
<div class="col-xs-1"><i class="fa fa-rebel" aria-hidden="true"></i></div>
<div class="col-xs-1"><i class="fa fa-renren" aria-hidden="true"></i></div>
<div class="col-xs-1"><i class="fa fa-simplybuilt" aria-hidden="true"></i></div>
<div class="col-xs-1"><i class="fa fa-sellsy" aria-hidden="true"></i></div>
<div class="col-xs-1"><i class="fa fa-slideshare" aria-hidden="true"></i></div>
<div class="col-xs-1"><i class="fa fa-soundcloud" aria-hidden="true"></i></div>
<div class="col-xs-1"><i class="fa fa-steam" aria-hidden="true"></i></div>
<div class="col-xs-1"><i class="fa fa-tencent-weibo" aria-hidden="true"></i></div>
<div class="col-xs-1"><i class="fa fa-tumblr" aria-hidden="true"></i></div>
<div class="col-xs-1"><i class="fa fa-twitter-square" aria-hidden="true"></i></div>
<div class="col-xs-1"><i class="fa fa-viadeo-square" aria-hidden="true"></i></div>
<div class="col-xs-1"><i class="fa fa-vk" aria-hidden="true"></i></div>
<div class="col-xs-1"><i class="fa fa-whatsapp" aria-hidden="true"></i></div>
<div class="col-xs-1"><i class="fa fa-wpbeginner" aria-hidden="true"></i></div>
<div class="col-xs-1"><i class="fa fa-y-combinator" aria-hidden="true"></i></div>
<div class="col-xs-1"><i class="fa fa-hacker-news" aria-hidden="true"></i></div>
<div class="col-xs-1"><i class="fa fa-youtube-play" aria-hidden="true"></i></div>
<div class="col-xs-1"><i class="fa fa-youtube-square" aria-hidden="true"></i></div>
<div class="col-xs-1"><i class="fa fa-yelp" aria-hidden="true"></i></div>
<div class="col-xs-1"><i class="fa fa-hacker-news" aria-hidden="true"></i></div>
<div class="col-xs-1"><i class="fa fa-wpforms" aria-hidden="true"></i></div>
<div class="col-xs-1"><i class="fa fa-wikipedia-w" aria-hidden="true"></i></div>
<div class="col-xs-1"><i class="fa fa-weixin" aria-hidden="true"></i></div>
<div class="col-xs-1"><i class="fa fa-vimeo" aria-hidden="true"></i></div>
<div class="col-xs-1"><i class="fa fa-usb" aria-hidden="true"></i></div>
<div class="col-xs-1"><i class="fa fa-tumblr-square" aria-hidden="true"></i></div>
<div class="col-xs-1"><i class="fa fa-themeisle" aria-hidden="true"></i></div>
<div class="col-xs-1"><i class="fa fa-steam-square" aria-hidden="true"></i></div>
<div class="col-xs-1"><i class="fa fa-spotify" aria-hidden="true"></i></div>
<div class="col-xs-1"><i class="fa fa-snapchat" aria-hidden="true"></i></div>
<div class="col-xs-1"><i class="fa fa-skyatlas" aria-hidden="true"></i></div>
<div class="col-xs-1"><i class="fa fa-rebel" aria-hidden="true"></i></div>
<div class="col-xs-1"><i class="fa fa-product-hunt" aria-hidden="true"></i></div>
<div class="col-xs-1"><i class="fa fa-product-hunt" aria-hidden="true"></i></div>
<div class="col-xs-1"><i class="fa fa-pied-piper-pp" aria-hidden="true"></i></div>
<div class="col-xs-1"><i class="fa fa-pagelines" aria-hidden="true"></i></div>
<div class="col-xs-1"><i class="fa fa-opencart" aria-hidden="true"></i></div>
<div class="col-xs-1"><i class="fa fa-linux" aria-hidden="true"></i></div>
<div class="col-xs-1"><i class="fa fa-lastfm-square" aria-hidden="true"></i></div>
<div class="col-xs-1"><i class="fa fa-ioxhost" aria-hidden="true"></i></div>
<div class="col-xs-1"><i class="fa fa-houzz" aria-hidden="true"></i></div>
<div class="col-xs-1"><i class="fa fa-google-plus-square" aria-hidden="true"></i></div>
<div class="col-xs-1"><i class="fa fa-google" aria-hidden="true"></i></div>
<div class="col-xs-1"><i class="fa fa-gitlab" aria-hidden="true"></i></div>
<div class="col-xs-1"><i class="fa fa-get-pocket" aria-hidden="true"></i></div>
<div class="col-xs-1"><i class="fa fa-git-square" aria-hidden="true"></i></div>
<div class="col-xs-1"><i class="fa fa-fort-awesome" aria-hidden="true"></i></div>
<div class="col-xs-1"><i class="fa fa-first-order" aria-hidden="true"></i></div>
<div class="col-xs-1"><i class="fa fa-facebook" aria-hidden="true"></i></div>
<div class="col-xs-1"><i class="fa fa-envira" aria-hidden="true"></i></div>
<div class="col-xs-1"><i class="fa fa-dropbox" aria-hidden="true"></i></div>
<div class="col-xs-1"><i class="fa fa-delicious" aria-hidden="true"></i></div>
<div class="col-xs-1"><i class="fa fa-connectdevelop" aria-hidden="true"></i></div>
<div class="col-xs-1"><i class="fa fa-cc-jcb" aria-hidden="true"></i></div>
<div class="col-xs-1"><i class="fa fa-buysellads" aria-hidden="true"></i></div>
<div class="col-xs-1"><i class="fa fa-black-tie" aria-hidden="true"></i></div>
<div class="col-xs-1"><i class="fa fa-behance-square" aria-hidden="true"></i></div>
<div class="col-xs-1"><i class="fa fa-android" aria-hidden="true"></i></div>
<div class="col-xs-1"><i class="fa fa-cc-visa" aria-hidden="true"></i></div>
</div>
</div>
<script>
;(function($){var $window=$(window);var options={};var zindexvalues=[];var lastclicked=[];var scrollbarwidth;var bodymarginright=null;var opensuffix='_open';var closesuffix='_close';var stack=[];var transitionsupport=null;var opentimer;var iOS=/(iPad|iPhone|iPod)/g.test(navigator.userAgent);var methods={_init:function(el){var $el=$(el);var options=$el.data('popupoptions');lastclicked[el.id]=false;zindexvalues[el.id]=0;if(!$el.data('popup-initialized')){$el.attr('data-popup-initialized','true');methods._initonce(el)}if(options.autoopen){setTimeout(function(){methods.show(el,0)},0)}},_initonce:function(el){var $el=$(el);var $body=$('body');var $wrapper;var options=$el.data('popupoptions');var css;bodymarginright=parseInt($body.css('margin-right'),10);transitionsupport=document.body.style.webkitTransition!==undefined||document.body.style.MozTransition!==undefined||document.body.style.msTransition!==undefined||document.body.style.OTransition!==undefined||document.body.style.transition!==undefined;if(options.type=='tooltip'){options.background=false;options.scrolllock=false}if(options.backgroundactive){options.background=false;options.blur=false;options.scrolllock=false}if(options.scrolllock){var parent;var child;if(typeof scrollbarwidth==='undefined'){parent=$('<div style="width:50px;height:50px;overflow:auto"><div/></div>').appendTo('body');child=parent.children();scrollbarwidth=child.innerWidth()-child.height(99).innerWidth();parent.remove()}}if(!$el.attr('id')){$el.attr('id','j-popup-'+parseInt((Math.random()*100000000),10))}$el.addClass('popup_content');$body.prepend(el);$el.wrap('<div id="'+el.id+'_wrapper" class="popup_wrapper" />');$wrapper=$('#'+el.id+'_wrapper');$wrapper.css({opacity:0,visibility:'hidden',position:'absolute'});if(iOS){$wrapper.css('cursor','pointer')}if(options.type=='overlay'){$wrapper.css('overflow','auto')}$el.css({opacity:0,visibility:'hidden',display:'inline-block'});if(options.setzindex&&!options.autozindex){$wrapper.css('z-index','100001')}if(!options.outline){$el.css('outline','none')}if(options.transition){$el.css('transition',options.transition);$wrapper.css('transition',options.transition)}$el.attr('aria-hidden',true);if((options.background)&&(!$('#'+el.id+'_background').length)){$body.prepend('<div id="'+el.id+'_background" class="popup_background"></div>');var $background=$('#'+el.id+'_background');$background.css({opacity:0,visibility:'hidden',backgroundColor:options.color,position:'fixed',top:0,right:0,bottom:0,left:0});if(options.setzindex&&!options.autozindex){$background.css('z-index','100000')}if(options.transition){$background.css('transition',options.transition)}}if(options.type=='overlay'){$el.css({textAlign:'left',position:'relative',verticalAlign:'middle'});css={position:'fixed',width:'100%',height:'100%',top:0,left:0,textAlign:'center'};if(options.backgroundactive){css.position='relative';css.height='0';css.overflow='visible'}$wrapper.css(css);$wrapper.append('<div class="popup_align" />');$('.popup_align').css({display:'inline-block',verticalAlign:'middle',height:'100%'})}$el.attr('role','dialog');var openelement=(options.openelement)?options.openelement:('.'+el.id+opensuffix);$(openelement).each(function(i,item){$(item).attr('data-popup-ordinal',i);if(!item.id){$(item).attr('id','open_'+parseInt((Math.random()*100000000),10))}});if(!($el.attr('aria-labelledby')||$el.attr('aria-label'))){$el.attr('aria-labelledby',$(openelement).attr('id'))}if(options.action=='hover'){options.keepfocus=false;$(openelement).on('mouseenter',function(event){methods.show(el,$(this).data('popup-ordinal'))});$(openelement).on('mouseleave',function(event){methods.hide(el)})}else{$(document).on('click',openelement,function(event){event.preventDefault();var ord=$(this).data('popup-ordinal');setTimeout(function(){methods.show(el,ord)},0)})}if(options.closebutton){methods.addclosebutton(el)}if(options.detach){$el.hide().detach()}else{$wrapper.hide()}},show:function(el,ordinal){var $el=$(el);if($el.data('popup-visible'))return;if(!$el.data('popup-initialized')){methods._init(el)}$el.attr('data-popup-initialized','true');var $body=$('body');var options=$el.data('popupoptions');var $wrapper=$('#'+el.id+'_wrapper');var $background=$('#'+el.id+'_background');callback(el,ordinal,options.beforeopen);lastclicked[el.id]=ordinal;setTimeout(function(){stack.push(el.id)},0);if(options.autozindex){var elements=document.getElementsByTagName('*');var len=elements.length;var maxzindex=0;for(var i=0;i<len;i++){var elementzindex=$(elements[i]).css('z-index');if(elementzindex!=='auto'){elementzindex=parseInt(elementzindex,10);if(maxzindex<elementzindex){maxzindex=elementzindex}}}zindexvalues[el.id]=maxzindex;if(options.background){if(zindexvalues[el.id]>0){$('#'+el.id+'_background').css({zIndex:(zindexvalues[el.id]+1)})}}if(zindexvalues[el.id]>0){$wrapper.css({zIndex:(zindexvalues[el.id]+2)})}}if(options.detach){$wrapper.prepend(el);$el.show()}else{$wrapper.show()}opentimer=setTimeout(function(){$wrapper.css({visibility:'visible',opacity:1});$('html').addClass('popup_visible').addClass('popup_visible_'+el.id);$wrapper.addClass('popup_wrapper_visible')},20);if(options.scrolllock){$body.css('overflow','hidden');if($body.height()>$window.height()){$body.css('margin-right',bodymarginright+scrollbarwidth)}}if(options.backgroundactive){$el.css({top:($window.height()-($el.get(0).offsetHeight+parseInt($el.css('margin-top'),10)+parseInt($el.css('margin-bottom'),10)))/2+'px'})}$el.css({'visibility':'visible','opacity':1});if(options.background){$background.css({'visibility':'visible','opacity':options.opacity});setTimeout(function(){$background.css({'opacity':options.opacity})},0)}$el.data('popup-visible',true);methods.reposition(el,ordinal);$el.data('focusedelementbeforepopup',document.activeElement);if(options.keepfocus){$el.attr('tabindex',-1);setTimeout(function(){if(options.focuselement==='closebutton'){$('#'+el.id+' .'+el.id+closesuffix+':first').focus()}else if(options.focuselement){$(options.focuselement).focus()}else{$el.focus()}},options.focusdelay)}$(options.pagecontainer).attr('aria-hidden',true);$el.attr('aria-hidden',false);callback(el,ordinal,options.onopen);if(transitionsupport){$wrapper.one('transitionend',function(){callback(el,ordinal,options.opentransitionend)})}else{callback(el,ordinal,options.opentransitionend)}},hide:function(el){if(opentimer)clearTimeout(opentimer);var $body=$('body');var $el=$(el);var options=$el.data('popupoptions');var $wrapper=$('#'+el.id+'_wrapper');var $background=$('#'+el.id+'_background');$el.data('popup-visible',false);if(stack.length===1){$('html').removeClass('popup_visible').removeClass('popup_visible_'+el.id)}else{if($('html').hasClass('popup_visible_'+el.id)){$('html').removeClass('popup_visible_'+el.id)}}stack.pop();if($wrapper.hasClass('popup_wrapper_visible')){$wrapper.removeClass('popup_wrapper_visible')}if(options.keepfocus){setTimeout(function(){if($($el.data('focusedelementbeforepopup')).is(':visible')){$el.data('focusedelementbeforepopup').focus()}},0)}$wrapper.css({'visibility':'hidden','opacity':0});$el.css({'visibility':'hidden','opacity':0});if(options.background){$background.css({'visibility':'hidden','opacity':0})}$(options.pagecontainer).attr('aria-hidden',false);$el.attr('aria-hidden',true);callback(el,lastclicked[el.id],options.onclose);if(transitionsupport&&$el.css('transition-duration')!=='0s'){$el.one('transitionend',function(e){if(!($el.data('popup-visible'))){if(options.detach){$el.hide().detach()}else{$wrapper.hide()}}if(options.scrolllock){setTimeout(function(){$body.css({overflow:'visible','margin-right':bodymarginright})},10)}callback(el,lastclicked[el.id],options.closetransitionend)})}else{if(options.detach){$el.hide().detach()}else{$wrapper.hide()}if(options.scrolllock){setTimeout(function(){$body.css({overflow:'visible','margin-right':bodymarginright})},10)}callback(el,lastclicked[el.id],options.closetransitionend)}},toggle:function(el,ordinal){if($(el).data('popup-visible')){methods.hide(el)}else{setTimeout(function(){methods.show(el,ordinal)},0)}},reposition:function(el,ordinal){var $el=$(el);var options=$el.data('popupoptions');var $wrapper=$('#'+el.id+'_wrapper');var $background=$('#'+el.id+'_background');ordinal=ordinal||0;if(options.type=='tooltip'){$wrapper.css({'position':'absolute'});var $tooltipanchor;if(options.tooltipanchor){$tooltipanchor=$(options.tooltipanchor)}else if(options.openelement){$tooltipanchor=$(options.openelement).filter('[data-popup-ordinal="'+ordinal+'"]')}else{$tooltipanchor=$('.'+el.id+opensuffix+'[data-popup-ordinal="'+ordinal+'"]')}var linkOffset=$tooltipanchor.offset();if(options.horizontal=='right'){$wrapper.css('left',linkOffset.left+$tooltipanchor.outerWidth()+options.offsetleft)}else if(options.horizontal=='leftedge'){$wrapper.css('left',linkOffset.left+$tooltipanchor.outerWidth()-$tooltipanchor.outerWidth()+options.offsetleft)}else if(options.horizontal=='left'){$wrapper.css('right',$window.width()-linkOffset.left-options.offsetleft)}else if(options.horizontal=='rightedge'){$wrapper.css('right',$window.width()-linkOffset.left-$tooltipanchor.outerWidth()-options.offsetleft)}else{$wrapper.css('left',linkOffset.left+($tooltipanchor.outerWidth()/2)-($el.outerWidth()/2)-parseFloat($el.css('marginLeft'))+options.offsetleft)}if(options.vertical=='bottom'){$wrapper.css('top',linkOffset.top+$tooltipanchor.outerHeight()+options.offsettop)}else if(options.vertical=='bottomedge'){$wrapper.css('top',linkOffset.top+$tooltipanchor.outerHeight()-$el.outerHeight()+options.offsettop)}else if(options.vertical=='top'){$wrapper.css('bottom',$window.height()-linkOffset.top-options.offsettop)}else if(options.vertical=='topedge'){$wrapper.css('bottom',$window.height()-linkOffset.top-$el.outerHeight()-options.offsettop)}else{$wrapper.css('top',linkOffset.top+($tooltipanchor.outerHeight()/2)-($el.outerHeight()/2)-parseFloat($el.css('marginTop'))+options.offsettop)}}else if(options.type=='overlay'){if(options.horizontal){$wrapper.css('text-align',options.horizontal)}else{$wrapper.css('text-align','center')}if(options.vertical){$el.css('vertical-align',options.vertical)}else{$el.css('vertical-align','middle')}}},addclosebutton:function(el){var genericCloseButton;if($(el).data('popupoptions').closebuttonmarkup){genericCloseButton=$(options.closebuttonmarkup).addClass(el.id+'_close')}else{genericCloseButton='<button class="popup_close '+el.id+'_close" title="Close" aria-label="Close"><span aria-hidden="true">?</span></button>'}if($el.data('popup-initialized')){$el.append(genericCloseButton)}}};var callback=function(el,ordinal,func){var options=$(el).data('popupoptions');var openelement=(options.openelement)?options.openelement:('.'+el.id+opensuffix);var elementclicked=$(openelement+'[data-popup-ordinal="'+ordinal+'"]');if(typeof func=='function'){func.call($(el),el,elementclicked)}};$(document).on('keydown',function(event){if(stack.length){var elementId=stack[stack.length-1];var el=document.getElementById(elementId);if($(el).data('popupoptions').escape&&event.keyCode==27){methods.hide(el)}}});$(document).on('click',function(event){if(stack.length){var elementId=stack[stack.length-1];var el=document.getElementById(elementId);var closeButton=($(el).data('popupoptions').closeelement)?$(el).data('popupoptions').closeelement:('.'+el.id+closesuffix);if($(event.target).closest(closeButton).length){event.preventDefault();methods.hide(el)}if($(el).data('popupoptions').blur&&!$(event.target).closest('#'+elementId).length&&event.which!==2&&$(event.target).is(':visible')){methods.hide(el);if($(el).data('popupoptions').type==='overlay'){event.preventDefault()}}}});$(document).on('focusin',function(event){if(stack.length){var elementId=stack[stack.length-1];var el=document.getElementById(elementId);if($(el).data('popupoptions').keepfocus){if(!el.contains(event.target)){event.stopPropagation();el.focus()}}}});$.fn.popup=function(customoptions){return this.each(function(){$el=$(this);if(typeof customoptions==='object'){var opt=$.extend({},$.fn.popup.defaults,customoptions);$el.data('popupoptions',opt);options=$el.data('popupoptions');methods._init(this)}else if(typeof customoptions==='string'){if(!($el.data('popupoptions'))){$el.data('popupoptions',$.fn.popup.defaults);options=$el.data('popupoptions')}methods[customoptions].call(this,this)}else{if(!($el.data('popupoptions'))){$el.data('popupoptions',$.fn.popup.defaults);options=$el.data('popupoptions')}methods._init(this)}})};$.fn.popup.defaults={type:'overlay',autoopen:false,background:true,backgroundactive:false,color:'black',opacity:'0.5',horizontal:'center',vertical:'middle',offsettop:0,offsetleft:0,escape:true,blur:true,setzindex:true,autozindex:false,scrolllock:false,closebutton:false,closebuttonmarkup:null,keepfocus:true,focuselement:null,focusdelay:50,outline:false,pagecontainer:null,detach:false,openelement:null,closeelement:null,transition:null,tooltipanchor:null,beforeopen:null,onclose:null,onopen:null,opentransitionend:null,closetransitionend:null}})(jQuery);
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
<?php echo $footer; ?>