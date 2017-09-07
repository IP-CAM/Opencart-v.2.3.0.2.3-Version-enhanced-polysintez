<?php echo $header; ?><?php echo $column_left; ?>
<div id="content">
  <div class="page-header">
    <div class="container-fluid">		
      <div class="pull-right" id="control-buttons">
		<a onclick="apply()" class="btn btn-success" data-toggle="tooltip" data-placement="bottom" title="Применить"><i class="fa fa-check"></i></a>
        <button type="submit" form="form-revolution" data-toggle="tooltip" data-placement="bottom" title="<?php echo $button_save; ?>" class="btn btn-primary"><i class="fa fa-save"></i></button>
        <a href="<?php echo $cancel; ?>" data-toggle="tooltip" data-placement="bottom" title="<?php echo $button_cancel; ?>" class="btn btn-warning"><i class="fa fa-reply"></i></a>
		</div>
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
    <div class="alert alert-success"><i class="fa fa-check-circle"></i> <?php echo $success; ?>
      <button type="button" class="close" data-dismiss="alert">&times;</button>
    </div>
    <?php } ?>
    <div class="panel panel-default alert-helper">
      <div class="panel-heading">
        <h3 class="panel-title"><i class="fa fa-pencil"></i> <?php echo $text_edit; ?></h3>
      </div>
      <div class="panel-body">
		<?php if (!in_array('revolution', $extension)) { ?>
		<a href="<?php echo $install; ?>" data-toggle="tooltip" data-placement="right" title="<?php echo $button_install; ?>" class="btn btn-primary"><i class="fa fa-plus-circle"></i> Установить шаблон</a>
		<?php } else { ?>
        <form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data" id="form-revolution" class="form-horizontal">
		<input type="hidden" name="revtheme_license" value="<?php echo $revtheme_license; ?>" class="form-control" />
		<ul class="nav nav-tabs" role="tablist" id="revtabs">
			<li class="active"><a href="#tab_header" role="tab" data-toggle="tab">Шапка сайта</a></li>
			<li><a href="#tab_home" role="tab" data-toggle="tab">Главная страница</a></li>
			<li><a href="#tab_catalog" role="tab" data-toggle="tab">Каталог товаров</a></li>
			<li><a href="#tab_product" role="tab" data-toggle="tab">Товар</a></li>
			<li><a href="#tab_footer" role="tab" data-toggle="tab">Подвал сайта</a></li>
			<li><a href="#tab_css" role="tab" data-toggle="tab">Внешний вид</a></li>
			<li><a href="#tab_all_settings" role="tab" data-toggle="tab">Дополнительные настройки</a></li>
			<li><a href="#tab_user_set" role="tab" data-toggle="tab">Свои стили и скрипты</a></li>
			<li><a href="#tab_info" role="tab" data-toggle="tab">Сервис</a></li>
		</ul>		
<div class="tab-content">
<div class="tab-pane active" id="tab_header">
	<div class="col-sm-2">
		<nav class="nav-sidebar">
			<ul class="nav tabs">
				<li class="active"><a href="#tab_header_menu" data-toggle="tab">Каталог товаров</a></li>
				<li><a href="#tab_header_links" data-toggle="tab">Ссылки в верхней линии</a></li>
				<li><a href="#tab_header_links2" data-toggle="tab">Доп. ссылки в линии каталога</a></li>
				<li><a href="#tab_header_contacts" data-toggle="tab">Контакты</a></li>
				<li><a href="#tab_header_popupphone" data-toggle="tab">Обратный звонок</a></li>
				<li><a href="#tab_header_search" data-toggle="tab">Поиск в шапке</a></li>
				<li><a href="#tab_header_cart" data-toggle="tab">Корзина товаров</a></li>
			</ul>
		</nav>
	</div>	
	<div class="tab-content col-sm-10">
		<div class="tab-pane active text-style" id="tab_header_menu">
			<div class="form-group">
				<label class="col-sm-2 control-label">Плавающая полоса с каталогом:</label>
				<div class="col-sm-3">
					<label class="radio-inline">
						<input type="radio" name="revtheme_header_menu[sticky]" value="1" <?php if ($revtheme_header_menu['sticky']) { echo 'checked'; } ?> /><span>Да</span>
					</label>
					<label class="radio-inline">
						<input type="radio" name="revtheme_header_menu[sticky]" value="0" <?php if (!$revtheme_header_menu['sticky']) { echo 'checked';} ?> /><span>Нет</span>
					</label>
				</div>
			</div>
			<div class="form-group">
				<label class="col-sm-2 control-label">Картинки категорий вместо иконок:</label>
				<div class="col-sm-3">
					<label class="radio-inline">
						<input type="radio" onchange="$(this).parent().parent().parent().next().hide();"  name="revtheme_header_menu[image_in_ico]" value="1" <?php if ($revtheme_header_menu['image_in_ico']) { echo 'checked'; } ?> /><span>Да</span>
					</label>
					<label class="radio-inline">
						<input type="radio" onchange="$(this).parent().parent().parent().next().show();"  name="revtheme_header_menu[image_in_ico]" value="0" <?php if (!$revtheme_header_menu['image_in_ico']) { echo 'checked';} ?> /><span>Нет</span>
					</label>
				</div>
			</div>
			<div class="form-group" <?php if ($revtheme_header_menu['image_in_ico']) { ?> style="display: none" <?php } ?>>
				<label class="col-sm-2 control-label">Выводить 3 уровень подкатегорий в меню:</label>
				<div class="col-sm-3">
					<label class="radio-inline">
						<input type="radio" name="revtheme_header_menu[tri_level]" value="1" <?php if ($revtheme_header_menu['tri_level']) { echo 'checked'; } ?> /><span>Да</span>
					</label>
					<label class="radio-inline">
						<input type="radio" name="revtheme_header_menu[tri_level]" value="0" <?php if (!$revtheme_header_menu['tri_level']) { echo 'checked';} ?> /><span>Нет</span>
					</label>
				</div>
			</div>
			<div class="form-group">
				<div class="col-sm-12">
					<div class="form-group">
						<label class="col-sm-2 control-label">Меню производителей:</label>
						<div class="col-sm-2">
							<label class="radio-inline">
								<input type="radio" onchange="$(this).parent().parent().parent().parent().next().show().next().show().next().show();" name="revtheme_header_menu[manuf]" value="1" <?php if ($revtheme_header_menu['manuf']) { echo 'checked'; } ?> /><span>Вкл.</span>
							</label>
							<label class="radio-inline">
								<input type="radio" onchange="$(this).parent().parent().parent().parent().next().hide().next().hide().next().hide();" name="revtheme_header_menu[manuf]" value="0" <?php if (!$revtheme_header_menu['manuf']) { echo 'checked';} ?> /><span>Выкл.</span>
							</label>
						</div>
					</div>
				</div>
				<div class="col-sm-12" <?php if (!$revtheme_header_menu['manuf']) { ?> style="display: none" <?php } ?>>
					<div class="form-group">
						<label class="col-sm-2 control-label">Число колонок:</label>
						<div class="col-sm-1">
							<input type="text" name="revtheme_header_menu[n_column]" value="<?php echo $revtheme_header_menu['n_column']; ?>" placeholder="495" class="form-control" />
						</div>
					</div>
				</div>
				<div class="col-sm-12" <?php if (!$revtheme_header_menu['manuf']) { ?> style="display: none" <?php } ?>>
					<div class="form-group">
						<label class="col-sm-2 control-label">Иконка:</label>
						<div class="col-sm-2">
							<label class="radio-inline">
								<input type="radio" onchange="$(this).parent().parent().parent().find('.zavisimost_ico').show().next().hide();" name="revtheme_header_menu[manuf_icontype]" value="1" <?php if ($revtheme_header_menu['manuf_icontype']) { echo 'checked'; } ?> /><span>Иконка</span>
							</label>
							<label class="radio-inline">
								<input type="radio" onchange="$(this).parent().parent().parent().find('.zavisimost_ico').hide().next().show();" name="revtheme_header_menu[manuf_icontype]" value="0" <?php if (!$revtheme_header_menu['manuf_icontype']) { echo 'checked';} ?> /><span>Картинка</span>
							</label>
						</div>
						<div class="col-sm-2 zavisimost_ico" <?php if (!$revtheme_header_menu['manuf_icontype']) { ?> style="display: none" <?php } ?>>
							<span class="fazavisimost fa_icon form-control width_initial" id="icon_revtheme_header_menu_manuf" onclick="fa_icons($(this).attr('id'))"><i class="<?php echo $revtheme_header_menu['manuf_icon']; ?>"></i></span>
							<input type="hidden" name="revtheme_header_menu[manuf_icon]" value="<?php echo $revtheme_header_menu['manuf_icon']; ?>" id="input-icon_revtheme_header_menu_manuf" />
						</div>
						<div class="col-sm-2" <?php if ($revtheme_header_menu['manuf_icontype']) { ?> style="display: none" <?php } ?>>
							<a href="" id="thumb-image_revtheme_header_menu_manuf" data-toggle="image" class="img-thumbnail width_initial"><img style="width:25px;" src="<?php echo $revtheme_header_menu_manuf_thumb; ?>" alt="" title="" data-placeholder="<?php echo $placeholder; ?>" /></a>
							<input type="hidden" name="revtheme_header_menu[manuf_image]" value="<?php echo $revtheme_header_menu['manuf_image']; ?>" id="revtheme_header_menu_manuf_image" />
						</div>
					</div>
				</div>
				<div class="col-sm-12" <?php if (!$revtheme_header_menu['manuf']) { ?> style="display: none" <?php } ?>>
					<div class="form-group">
						<label class="col-sm-2 control-label">Картинки производителя вместо иконок:</label>
						<div class="col-sm-3">
							<label class="radio-inline">
								<input type="radio" name="revtheme_header_menu[image_in_ico_m]" value="1" <?php if ($revtheme_header_menu['image_in_ico_m']) { echo 'checked'; } ?> /><span>Да</span>
							</label>
							<label class="radio-inline">
								<input type="radio" name="revtheme_header_menu[image_in_ico_m]" value="0" <?php if (!$revtheme_header_menu['image_in_ico_m']) { echo 'checked';} ?> /><span>Нет</span>
							</label>
						</div>
					</div>
				</div>
			</div>
			<div class="form-group">
				<label class="col-sm-2 control-label">Тип меню:</label>
				<div class="col-sm-3">
					<label class="radio-inline">
						<input type="radio" id="header_menu_zavisimost_radio" onChange="header_menu_zavisimost(this)" name="revtheme_header_menu[type]" value="1" <?php if ($revtheme_header_menu['type']) { echo 'checked'; } ?> /><span>Amazon</span>
					</label>
					<label class="radio-inline">
						<input type="radio" id="header_menu_zavisimost_radio" onChange="header_menu_zavisimost(this)" name="revtheme_header_menu[type]" value="0" <?php if (!$revtheme_header_menu['type']) { echo 'checked';} ?> /><span>Простое</span>
					</label>
				</div>
			</div>
			<div class="form-group">
				<label class="col-sm-2 control-label">Выводить категории:</label>
				<div class="col-sm-3">
					<label class="radio-inline">
						<input type="radio" name="revtheme_header_menu[cats_status]" value="1" <?php if ($revtheme_header_menu['cats_status']) { echo 'checked'; } ?> /><span>Да</span>
					</label>
					<label class="radio-inline">
						<input type="radio" name="revtheme_header_menu[cats_status]" value="0" <?php if (!$revtheme_header_menu['cats_status']) { echo 'checked';} ?> /><span>Нет</span>
					</label>
				</div>
			</div>
			<div id="header_menu_zavisimost" style="display:none;">
				<div class="form-group">
					<div class="col-sm-12">
						<div class="form-group">
							<label class="col-sm-2 control-label">Иконка:</label>
							<div class="col-sm-2">
								<label class="radio-inline">
									<input type="radio" onchange="$(this).parent().parent().parent().find('.zavisimost_ico').show().next().hide();" name="revtheme_header_menu[icontype]" value="1" <?php if ($revtheme_header_menu['icontype']) { echo 'checked'; } ?> /><span>Иконка</span>
								</label>
								<label class="radio-inline">
									<input type="radio" onchange="$(this).parent().parent().parent().find('.zavisimost_ico').hide().next().show();" name="revtheme_header_menu[icontype]" value="0" <?php if (!$revtheme_header_menu['icontype']) { echo 'checked';} ?> /><span>Картинка</span>
								</label>
							</div>
							<div class="col-sm-2 zavisimost_ico" <?php if (!$revtheme_header_menu['icontype']) { ?> style="display: none" <?php } ?>>
								<span class="fazavisimost fa_icon form-control width_initial" id="icon_revtheme_header_menu" onclick="fa_icons($(this).attr('id'))"><i class="<?php echo $revtheme_header_menu['icon']; ?>"></i></span>
								<input type="hidden" name="revtheme_header_menu[icon]" value="<?php echo $revtheme_header_menu['icon']; ?>" id="input-icon_revtheme_header_menu" />
							</div>
							<div class="col-sm-2" <?php if ($revtheme_header_menu['icontype']) { ?> style="display: none" <?php } ?>>
								<a href="" id="thumb-image_revtheme_header_menu" data-toggle="image" class="img-thumbnail width_initial"><img style="width:25px;" src="<?php echo $revtheme_header_menu_thumb; ?>" alt="" title="" data-placeholder="<?php echo $placeholder; ?>" /></a>
								<input type="hidden" name="revtheme_header_menu[image]" value="<?php echo $revtheme_header_menu['image']; ?>" id="revtheme_header_menu_image" />
							</div>
						</div>
					</div>
					<div class="col-sm-12">
						<div class="form-group">
							<label class="col-sm-2 control-label">Выпадающее меню напротив выбранного пункта:</label>
							<div class="col-sm-3">
								<label class="radio-inline">
									<input type="radio" name="revtheme_header_menu[on_line_cat]" value="1" <?php if ($revtheme_header_menu['on_line_cat']) { echo 'checked'; } ?> /><span>Да</span>
								</label>
								<label class="radio-inline">
									<input type="radio" name="revtheme_header_menu[on_line_cat]" value="0" <?php if (!$revtheme_header_menu['on_line_cat']) { echo 'checked';} ?> /><span>Нет</span>
								</label>
							</div>
						</div>
					</div>
					<div class="col-sm-12">
						<div class="form-group">
							<label class="col-sm-2 control-label">Раскрыто на главной странице:</label>
							<div class="col-sm-3">
								<label class="radio-inline">
									<input type="radio" name="revtheme_header_menu[inhome]" value="1" <?php if ($revtheme_header_menu['inhome']) { echo 'checked'; } ?> /><span>Да</span>
								</label>
								<label class="radio-inline">
									<input type="radio" name="revtheme_header_menu[inhome]" value="0" <?php if (!$revtheme_header_menu['inhome']) { echo 'checked';} ?> /><span>Нет</span>
								</label>
							</div>
						</div>
					</div>
					<div class="col-sm-12">
						<div class="form-group">
							<label class="col-sm-2 control-label">Увеличенная высота меню на главной странице:</label>
							<div class="col-sm-3">
								<label class="radio-inline">
									<input type="radio" name="revtheme_header_menu[up_menu_height]" value="1" <?php if ($revtheme_header_menu['up_menu_height']) { echo 'checked'; } ?> /><span>Да</span>
								</label>
								<label class="radio-inline">
									<input type="radio" name="revtheme_header_menu[up_menu_height]" value="0" <?php if (!$revtheme_header_menu['up_menu_height']) { echo 'checked';} ?> /><span>Нет</span>
								</label>
							</div>
						</div>
					</div>
					<div class="col-sm-12">
						<div class="form-group">
							<label class="col-sm-12">Дополнительные ссылки в amazon-меню:</label>
							<div class="col-sm-12">
								<table id="t_amazon_links" class="table table-bordered">
									<thead>
										<tr>
											<td class="nowrap">Иконка</td>
											<td class="nowrap">Ссылка</td>
											<td class="nowrap">Заголовок</td>
											<td class="nowrap">Сортировка</td>
											<td></td>
										</tr>
									</thead>
									<tbody>
									<?php $item_row_header_menu_link = 1; ?>
									<?php foreach ($revtheme_header_menu_links as $revtheme_header_menu_link) { ?>
										<tr id="item-row-main<?php echo $item_row_header_menu_link; ?>" class="item_row_header_menu_link">
											<td class="text-center">
												<div>
													<label class="radio-inline">
														<input type="radio" name="revtheme_header_menu_link[<?php echo $item_row_header_menu_link; ?>][icontype]" value="1" <?php if ($revtheme_header_menu_link['icontype']) { echo 'checked'; } ?> onchange="$(this).parent().parent().parent().find('.zavisimost_ico').show().next().hide();" /><span>Иконка</span>
													</label>
													<label class="radio-inline">
														<input type="radio" name="revtheme_header_menu_link[<?php echo $item_row_header_menu_link; ?>][icontype]" value="0" <?php if (!$revtheme_header_menu_link['icontype']) { echo 'checked';} ?> onchange="$(this).parent().parent().parent().find('.zavisimost_ico').hide().next().show();" /><span>Картинка</span>
													</label>	
												</div><br>
												<div class="zavisimost_ico" <?php if (!$revtheme_header_menu_link['icontype']) { ?> style="display: none" <?php } ?>>
													<span class="fa_icon" id="icon_revtheme_header_menu_link<?php echo $item_row_header_menu_link; ?>" onclick="fa_icons($(this).attr('id'))"><i class="<?php echo $revtheme_header_menu_link['icon']; ?>"></i></span>
													<input type="hidden" name="revtheme_header_menu_link[<?php echo $item_row_header_menu_link; ?>][icon]" value="<?php echo $revtheme_header_menu_link['icon']; ?>" id="input-icon_revtheme_header_menu_link<?php echo $item_row_header_menu_link; ?>" />
												</div>
												<div <?php if ($revtheme_header_menu_link['icontype']) { ?> style="display: none" <?php } ?>>
													<a href="" id="revtheme_header_menu_link_thumb-image<?php echo $item_row_header_menu_link; ?>" data-toggle="image" class="img-thumbnail"><img src="<?php echo $revtheme_header_menu_link['thumb']; ?>" alt="" title="" data-placeholder="<?php echo $placeholder; ?>" /></a>
													<input type="hidden" name="revtheme_header_menu_link[<?php echo $item_row_header_menu_link; ?>][image]" value="<?php echo $revtheme_header_menu_link['image']; ?>" id="revtheme_header_menu_link-image<?php echo $item_row_header_menu_link; ?>" />
												</div>
											</td>
											<td class="text-left">
												<input class="form-control" type="text" name="revtheme_header_menu_link[<?php echo $item_row_header_menu_link; ?>][link]" value="<?php echo $revtheme_header_menu_link['link']; ?>" />
											</td>
											<td class="text-left">
												<?php foreach ($languages as $language) { ?>
													<div class="input-group">
														<span class="input-group-addon"><img src="<?php echo (VERSION >= 2.2) ? 'language/'.$language['code'].'/'.$language['code'].'.png' : 'view/image/flags/'.$language['image']; ?>" title="<?php echo $language['name']; ?>" /></span>
														<input class="form-control" type="text" name="revtheme_header_menu_link[<?php echo $item_row_header_menu_link; ?>][title][<?php echo $language['language_id']; ?>]" value="<?php echo(isset($revtheme_header_menu_link['title'][$language['language_id']]) ? $revtheme_header_menu_link['title'][$language['language_id']] : '') ?>" />
													</div>
												<?php } ?>
											</td>
											<td class="text-left">
												<input class="form-control" type="text" name="revtheme_header_menu_link[<?php echo $item_row_header_menu_link; ?>][sort]" value="<?php echo $revtheme_header_menu_link['sort']; ?>" />
											</td>
											<td class="text-right">
												<a class="btn btn-danger" onclick="$('#t_amazon_links #item-row-main<?php echo $item_row_header_menu_link; ?>').remove();" data-toggle="tooltip" title="Удалить"><i class="fa fa-trash-o"></i></a>
											</td>
										</tr>
									<?php $item_row_header_menu_link++; ?>
									<?php } ?>
									</tbody>
									<tfoot>
										<tr>
											<td colspan="4"></td>
											<td class="text-right"><a class="btn btn-primary" onclick="addBlockHeaderMenuLink();" data-toggle="tooltip" title="Добавить"><i class="fa fa-plus-circle"></i></a></td>
										</tr>
									</tfoot>
								</table>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		<div class="tab-pane text-style" id="tab_header_links">
			<div class="form-group">
				<label class="col-sm-2 control-label">Выбор языка:</label>
				<div class="col-sm-3">
					<label class="radio-inline">
						<input type="radio" name="revtheme_header_standart_links[rev_lang]" value="1" <?php if ($revtheme_header_standart_links['rev_lang']) { echo 'checked'; } ?> /><span>Вкл.</span>
					</label>
					<label class="radio-inline">
						<input type="radio" name="revtheme_header_standart_links[rev_lang]" value="0" <?php if (!$revtheme_header_standart_links['rev_lang']) { echo 'checked';} ?> /><span>Выкл.</span>
					</label>
				</div>
			</div>
			<div class="form-group">
				<label class="col-sm-2 control-label">Выбор валюты:</label>
				<div class="col-sm-3">
					<label class="radio-inline">
						<input type="radio" name="revtheme_header_standart_links[rev_curr]" value="1" <?php if ($revtheme_header_standart_links['rev_curr']) { echo 'checked'; } ?> /><span>Вкл.</span>
					</label>
					<label class="radio-inline">
						<input type="radio" name="revtheme_header_standart_links[rev_curr]" value="0" <?php if (!$revtheme_header_standart_links['rev_curr']) { echo 'checked';} ?> /><span>Выкл.</span>
					</label>
				</div>
			</div>
			<div class="form-group">
				<label class="col-sm-2 control-label">Сравнение:</label>
				<div class="col-sm-3">
					<label class="radio-inline">
						<input type="radio" name="revtheme_header_standart_links[rev_srav]" value="1" <?php if ($revtheme_header_standart_links['rev_srav']) { echo 'checked'; } ?> /><span>Вкл.</span>
					</label>
					<label class="radio-inline">
						<input type="radio" name="revtheme_header_standart_links[rev_srav]" value="0" <?php if (!$revtheme_header_standart_links['rev_srav']) { echo 'checked';} ?> /><span>Выкл.</span>
					</label>
				</div>
			</div>
			<div class="form-group">
				<label class="col-sm-2 control-label">Закладки:</label>
				<div class="col-sm-3">
					<label class="radio-inline">
						<input type="radio" name="revtheme_header_standart_links[rev_wish]" value="1" <?php if ($revtheme_header_standart_links['rev_wish']) { echo 'checked'; } ?> /><span>Вкл.</span>
					</label>
					<label class="radio-inline">
						<input type="radio" name="revtheme_header_standart_links[rev_wish]" value="0" <?php if (!$revtheme_header_standart_links['rev_wish']) { echo 'checked';} ?> /><span>Выкл.</span>
					</label>
				</div>
			</div>
			<div class="form-group">
				<label class="col-sm-2 control-label">Личный кабинет:</label>
				<div class="col-sm-3">
					<label class="radio-inline">
						<input type="radio" name="revtheme_header_standart_links[rev_acc]" value="1" <?php if ($revtheme_header_standart_links['rev_acc']) { echo 'checked'; } ?> /><span>Вкл.</span>
					</label>
					<label class="radio-inline">
						<input type="radio" name="revtheme_header_standart_links[rev_acc]" value="0" <?php if (!$revtheme_header_standart_links['rev_acc']) { echo 'checked';} ?> /><span>Выкл.</span>
					</label>
				</div>
			</div>
			<div class="form-group">
				<label class="col-sm-2 control-label">Авторизация в всплывающем окне:</label>
				<div class="col-sm-3">
					<label class="radio-inline">
						<input type="radio" name="revtheme_header_standart_links[popup_login]" value="1" <?php if ($revtheme_header_standart_links['popup_login']) { echo 'checked'; } ?> /><span>Да</span>
					</label>
					<label class="radio-inline">
						<input type="radio" name="revtheme_header_standart_links[popup_login]" value="0" <?php if (!$revtheme_header_standart_links['popup_login']) { echo 'checked';} ?> /><span>Нет</span>
					</label>
				</div>
			</div>
			<div class="form-group">
				<label class="col-sm-12">Дополнительные ссылки в верхней линии шапки сайта:</label>
				<div class="col-sm-12">
					<table id="t_header_links" class="table table-bordered">
						<thead>
							<tr>
								<td class="nowrap">Ссылка</td>
								<td class="nowrap">Заголовок</td>
								<td class="nowrap">Сортировка</td>
								<td></td>
							</tr>
						</thead>
						<tbody>
						<?php $item_row_header_link = 1; ?>
						<?php foreach ($revtheme_header_links as $revtheme_header_link) { ?>
							<tr id="item-row-main<?php echo $item_row_header_link; ?>" class="item_row_header_link">							
								<td class="text-left">
									<input class="form-control" type="text" name="revtheme_header_link[<?php echo $item_row_header_link; ?>][link]" value="<?php echo $revtheme_header_link['link']; ?>" />
								</td>
								<td class="text-left">
									<?php foreach ($languages as $language) { ?>
										<div class="input-group">
											<span class="input-group-addon"><img src="<?php echo (VERSION >= 2.2) ? 'language/'.$language['code'].'/'.$language['code'].'.png' : 'view/image/flags/'.$language['image']; ?>" title="<?php echo $language['name']; ?>" /></span>
											<input class="form-control" type="text" name="revtheme_header_link[<?php echo $item_row_header_link; ?>][title][<?php echo $language['language_id']; ?>]" value="<?php echo(isset($revtheme_header_link['title'][$language['language_id']]) ? $revtheme_header_link['title'][$language['language_id']] : '') ?>" />
										</div>
									<?php } ?>
								</td>
								<td class="text-left">
									<input class="form-control" type="text" name="revtheme_header_link[<?php echo $item_row_header_link; ?>][sort]" value="<?php echo $revtheme_header_link['sort']; ?>" />
								</td>
								<td class="text-right">
									<a class="btn btn-danger" onclick="$('#t_header_links #item-row-main<?php echo $item_row_header_link; ?>').remove();" data-toggle="tooltip" title="Удалить"><i class="fa fa-trash-o"></i></a>
								</td>
							</tr>
						<?php $item_row_header_link++; ?>
						<?php } ?>
						</tbody>
						<tfoot>
							<tr>
								<td colspan="3"></td>
								<td class="text-right"><a class="btn btn-primary" onclick="addBlockHeaderLink();" data-toggle="tooltip" title="Добавить"><i class="fa fa-plus-circle"></i></a></td>
							</tr>
						</tfoot>
					</table>
				</div>
			</div>
		</div>
		<div class="tab-pane text-style" id="tab_header_links2">
			<div class="form-group">
				<div class="col-sm-12">
					<table id="t_header_links2" class="table table-bordered">
						<thead>
							<tr>
								<td class="nowrap">Иконка</td>
								<td class="nowrap">Ссылка</td>
								<td class="nowrap">Заголовок</td>
								<td class="nowrap">Сортировка</td>
								<td></td>
							</tr>
						</thead>
						<tbody>
						<?php $item_row_header_link2 = 1; ?>
						<?php foreach ($revtheme_header_links2 as $revtheme_header_link2) { ?>
							<tr id="item-row-main<?php echo $item_row_header_link2; ?>" class="item_row_header_link2">
								<td class="text-center">
									<div>
										<label class="radio-inline">
											<input type="radio" name="revtheme_header_link2[<?php echo $item_row_header_link2; ?>][icontype]" value="1" <?php if ($revtheme_header_link2['icontype']) { echo 'checked'; } ?> onchange="$(this).parent().parent().parent().find('.zavisimost_ico').show().next().hide();" /><span>Иконка</span>
										</label>
										<label class="radio-inline">
											<input type="radio" name="revtheme_header_link2[<?php echo $item_row_header_link2; ?>][icontype]" value="0" <?php if (!$revtheme_header_link2['icontype']) { echo 'checked';} ?> onchange="$(this).parent().parent().parent().find('.zavisimost_ico').hide().next().show();" /><span>Картинка</span>
										</label>	
									</div><br>
									<div class="zavisimost_ico" <?php if (!$revtheme_header_link2['icontype']) { ?> style="display: none" <?php } ?>>
										<span class="fa_icon" id="icon_revtheme_header_link2<?php echo $item_row_header_link2; ?>" onclick="fa_icons($(this).attr('id'))"><i class="<?php echo $revtheme_header_link2['icon']; ?>"></i></span>
										<input type="hidden" name="revtheme_header_link2[<?php echo $item_row_header_link2; ?>][icon]" value="<?php echo $revtheme_header_link2['icon']; ?>" id="input-icon_revtheme_header_link2<?php echo $item_row_header_link2; ?>" />
									</div>
									<div <?php if ($revtheme_header_link2['icontype']) { ?> style="display: none" <?php } ?>>
										<a href="" id="revtheme_header_link2_thumb-image<?php echo $item_row_header_link2; ?>" data-toggle="image" class="img-thumbnail"><img src="<?php echo $revtheme_header_link2['thumb']; ?>" alt="" title="" data-placeholder="<?php echo $placeholder; ?>" /></a>
										<input type="hidden" name="revtheme_header_link2[<?php echo $item_row_header_link2; ?>][image]" value="<?php echo $revtheme_header_link2['image']; ?>" id="revtheme_header_link2-image<?php echo $item_row_header_link2; ?>" />
									</div>
								</td>
								<td class="text-left">
									<input class="form-control" type="text" name="revtheme_header_link2[<?php echo $item_row_header_link2; ?>][link]" value="<?php echo $revtheme_header_link2['link']; ?>" />
								</td>
								<td class="text-left">
									<?php foreach ($languages as $language) { ?>
										<div class="input-group">
											<span class="input-group-addon"><img src="<?php echo (VERSION >= 2.2) ? 'language/'.$language['code'].'/'.$language['code'].'.png' : 'view/image/flags/'.$language['image']; ?>" title="<?php echo $language['name']; ?>" /></span>
											<input class="form-control" type="text" name="revtheme_header_link2[<?php echo $item_row_header_link2; ?>][title][<?php echo $language['language_id']; ?>]" value="<?php echo(isset($revtheme_header_link2['title'][$language['language_id']]) ? $revtheme_header_link2['title'][$language['language_id']] : '') ?>" />
										</div>
									<?php } ?>
								</td>
								<td class="text-left">
									<input class="form-control" type="text" name="revtheme_header_link2[<?php echo $item_row_header_link2; ?>][sort]" value="<?php echo $revtheme_header_link2['sort']; ?>" />
								</td>
								<td class="text-right">
									<a class="btn btn-danger" onclick="$('#t_header_links2 #item-row-main<?php echo $item_row_header_link2; ?>').remove();" data-toggle="tooltip" title="Удалить"><i class="fa fa-trash-o"></i></a>
								</td>
							</tr>
						<?php $item_row_header_link2++; ?>
						<?php } ?>
						</tbody>
						<tfoot>
							<tr>
								<td colspan="4"></td>
								<td class="text-right"><a class="btn btn-primary" onclick="addBlockHeaderLink2();" data-toggle="tooltip" title="Добавить"><i class="fa fa-plus-circle"></i></a></td>
							</tr>
						</tfoot>
					</table>
				</div>
			</div>
		</div>
		<div class="tab-pane text-style" id="tab_header_contacts">
			<div class="form-group">
				<label class="col-sm-2 control-label">Режим работы:</label>
				<div class="col-sm-3">
					<?php foreach ($languages as $language) { ?>
						<div class="input-group">
							<span class="input-group-addon"><img src="<?php echo (VERSION >= 2.2) ? 'language/'.$language['code'].'/'.$language['code'].'.png' : 'view/image/flags/'.$language['image']; ?>" title="<?php echo $language['name']; ?>" /></span>
							<input type="text" name="revtheme_header_phone[<?php echo $language['language_id']; ?>][text]" value="<?php echo(isset($revtheme_header_phone[$language['language_id']]['text']) ? $revtheme_header_phone[$language['language_id']]['text'] : '') ?>" class="form-control" />
						</div>
					<?php } ?>
				</div>
			</div>
			<div class="form-group">
				<label class="col-sm-2 control-label">Режим работы 2 строка:</label>
				<div class="col-sm-3">
					<?php foreach ($languages as $language) { ?>
						<div class="input-group">
							<span class="input-group-addon"><img src="<?php echo (VERSION >= 2.2) ? 'language/'.$language['code'].'/'.$language['code'].'.png' : 'view/image/flags/'.$language['image']; ?>" title="<?php echo $language['name']; ?>" /></span>
							<input type="text" name="revtheme_header_phone[<?php echo $language['language_id']; ?>][text2]" value="<?php echo(isset($revtheme_header_phone[$language['language_id']]['text2']) ? $revtheme_header_phone[$language['language_id']]['text2'] : '') ?>" class="form-control" />
						</div>
					<?php } ?>
				</div>
			</div>
			<div class="form-group">
				<label class="col-sm-2 control-label">Номер телефона:</label>
				<div class="col-sm-2">
					<?php foreach ($languages as $language) { ?>
						<div class="input-group">
							<span class="input-group-addon"><img src="<?php echo (VERSION >= 2.2) ? 'language/'.$language['code'].'/'.$language['code'].'.png' : 'view/image/flags/'.$language['image']; ?>" title="<?php echo $language['name']; ?>" /></span>
							<input data-toggle="tooltip" data-placement="top" title="Код города" type="text" name="revtheme_header_phone[<?php echo $language['language_id']; ?>][cod]" value="<?php echo(isset($revtheme_header_phone[$language['language_id']]['cod']) ? $revtheme_header_phone[$language['language_id']]['cod'] : '') ?>" placeholder="8 (495)" class="form-control" />
						</div>
					<?php } ?>
				</div>
				<div class="col-sm-3">
					<?php foreach ($languages as $language) { ?>
						<div class="input-group">
							<span class="input-group-addon"><img src="<?php echo (VERSION >= 2.2) ? 'language/'.$language['code'].'/'.$language['code'].'.png' : 'view/image/flags/'.$language['image']; ?>" title="<?php echo $language['name']; ?>" /></span>
							<input type="text" name="revtheme_header_phone[<?php echo $language['language_id']; ?>][number]" value="<?php echo(isset($revtheme_header_phone[$language['language_id']]['number']) ? $revtheme_header_phone[$language['language_id']]['number'] : '') ?>" class="form-control" />
						</div>
					<?php } ?>
				</div>
			</div>
			<div class="form-group">
				<label class="col-sm-2 control-label">Номер телефона 2:</label>
				<div class="col-sm-2">
					<?php foreach ($languages as $language) { ?>
						<div class="input-group">
							<span class="input-group-addon"><img src="<?php echo (VERSION >= 2.2) ? 'language/'.$language['code'].'/'.$language['code'].'.png' : 'view/image/flags/'.$language['image']; ?>" title="<?php echo $language['name']; ?>" /></span>
							<input data-toggle="tooltip" data-placement="top" title="Код города" type="text" name="revtheme_header_phone[<?php echo $language['language_id']; ?>][cod2]" value="<?php echo(isset($revtheme_header_phone[$language['language_id']]['cod2']) ? $revtheme_header_phone[$language['language_id']]['cod2'] : '') ?>" placeholder="8 (495)" class="form-control" />
						</div>
					<?php } ?>
				</div>
				<div class="col-sm-3">
					<?php foreach ($languages as $language) { ?>
						<div class="input-group">
							<span class="input-group-addon"><img src="<?php echo (VERSION >= 2.2) ? 'language/'.$language['code'].'/'.$language['code'].'.png' : 'view/image/flags/'.$language['image']; ?>" title="<?php echo $language['name']; ?>" /></span>
							<input type="text" name="revtheme_header_phone[<?php echo $language['language_id']; ?>][number2]" value="<?php echo(isset($revtheme_header_phone[$language['language_id']]['number2']) ? $revtheme_header_phone[$language['language_id']]['number2'] : '') ?>" class="form-control" />
						</div>
					<?php } ?>
				</div>
			</div>
			<div class="form-group">
				<label class="col-sm-2 control-label">Иконка:</label>
				<div class="col-sm-2">
					<label class="radio-inline">
						<input type="radio" onchange="$(this).parent().parent().parent().find('.zavisimost_ico').show().next().hide();" name="revtheme_header_phone[icontype]" value="1" <?php if ($revtheme_header_phone['icontype']) { echo 'checked'; } ?> /><span>Иконка</span>
					</label>
					<label class="radio-inline">
						<input type="radio" onchange="$(this).parent().parent().parent().find('.zavisimost_ico').hide().next().show();" name="revtheme_header_phone[icontype]" value="0" <?php if (!$revtheme_header_phone['icontype']) { echo 'checked';} ?> /><span>Картинка</span>
					</label>	
				</div>
				<div class="col-sm-2 zavisimost_ico" <?php if (!$revtheme_header_phone['icontype']) { ?> style="display: none" <?php } ?>>
					<span class="fazavisimost fa_icon form-control width_initial" id="icon_revtheme_header_phone" onclick="fa_icons($(this).attr('id'))"><i class="<?php echo $revtheme_header_phone['icon']; ?>"></i></span>
					<input type="hidden" name="revtheme_header_phone[icon]" value="<?php echo $revtheme_header_phone['icon']; ?>" id="input-icon_revtheme_header_phone" />
				</div>
				<div class="col-sm-2" <?php if ($revtheme_header_phone['icontype']) { ?> style="display: none" <?php } ?>>
					<a href="" id="thumb-image_revtheme_header_phone" data-toggle="image" class="img-thumbnail width_initial"><img style="width:25px;" src="<?php echo $revtheme_header_phone_thumb; ?>" alt="" title="" data-placeholder="<?php echo $placeholder; ?>" /></a>
					<input type="hidden" name="revtheme_header_phone[image]" value="<?php echo $revtheme_header_phone['image']; ?>" id="revtheme_header_phone_image" />
				</div>
			</div>
			<div class="form-group">
				<label class="col-sm-2 control-label">Включить доп. контакты:</label>
				<div class="col-sm-3">
					<label class="radio-inline">
						<input type="radio" id="dop_contacts_zavisimost_radio" onChange="dop_contacts_zavisimost(this)" name="revtheme_header_dop_contacts_status" value="1" <?php if ($revtheme_header_dop_contacts_status) { echo 'checked'; } ?> /><span>Да</span>
					</label>
					<label class="radio-inline">
						<input type="radio" id="dop_contacts_zavisimost_radio" onChange="dop_contacts_zavisimost(this)" name="revtheme_header_dop_contacts_status" value="0" <?php if (!$revtheme_header_dop_contacts_status) { echo 'checked';} ?> /><span>Нет</span>
					</label>
				</div>
			</div>
			<div id="dop_contacts_zavisimost" style="display:none;">
			<div class="form-group">
				<div class="col-sm-12 dop_contact">
					<table id="t_dop_contacts" class="table table-bordered">
					<thead>
						<tr>
							<td class="nowrap">Иконка</td>
							<td class="nowrap">Контакт</td>
							<td class="nowrap">Ссылка</td>
							<td></td>
						</tr>
					</thead>
					<tbody>
					<?php $contact_row = 1; ?>
					<?php foreach ($revtheme_header_dop_contacts as $revtheme_header_dop_contact) { ?>
					<tr id="item-row-dop_contact<?php echo $contact_row; ?>" class="contact_row">
						<td class="text-center">
							<span class="fa_icon" id="icon_dop_contact_<?php echo $contact_row; ?>" onclick="fa_icons($(this).attr('id'))"><i class="<?php echo $revtheme_header_dop_contact['icon']; ?>"></i></span>
							<input type="hidden" name="revtheme_header_dop_contact[<?php echo $contact_row; ?>][icon]" value="<?php echo $revtheme_header_dop_contact['icon']; ?>" id="input-icon<?php echo $contact_row; ?>" />
						</td>
						<td class="text-left">
							<input class="form-control" type="text" name="revtheme_header_dop_contact[<?php echo $contact_row; ?>][number]" value="<?php if(isset($revtheme_header_dop_contact['number'])) { ?><?php echo $revtheme_header_dop_contact['number']; ?><?php } ?>" placeholder="Контакт <?php echo $contact_row; ?>" />
						</td>
						<td class="text-left">
							<input class="form-control" type="text" name="revtheme_header_dop_contact[<?php echo $contact_row; ?>][href]" value="<?php if(isset($revtheme_header_dop_contact['href'])) { ?><?php echo $revtheme_header_dop_contact['href']; ?><?php } ?>" placeholder="Ссылка <?php echo $contact_row; ?>" />
						</td>						
						<td class="text-right">
							<a class="btn btn-danger" onclick="$('#t_dop_contacts #item-row-dop_contact<?php echo $contact_row; ?>').remove();" data-toggle="tooltip" title="Удалить"><i class="fa fa-trash-o"></i></a>
						</td>
					</tr>
					<?php $contact_row++; ?>
					<?php } ?>
					</tbody>
					<tfoot>
						<tr>
							<td colspan="3"></td>
							<td class="text-right"><a class="btn btn-primary" onclick="addDopContact();" data-toggle="tooltip" title="Добавить"><i class="fa fa-plus-circle"></i></a></td>
						</tr>
					</tfoot>
					</table>
				</div>
			</div>
			</div>
		</div>
		<div class="tab-pane text-style" id="tab_header_popupphone">
		<div class="form-group">
			<label class="col-sm-2 control-label">Включить:</label>
			<div class="col-sm-3">
				<label class="radio-inline">
					<input type="radio" name="revtheme_header_popupphone[status]" value="1" <?php if ($revtheme_header_popupphone['status']) { echo 'checked'; } ?> /><span>Да</span>
				</label>
				<label class="radio-inline">
					<input type="radio" name="revtheme_header_popupphone[status]" value="0" <?php if (!$revtheme_header_popupphone['status']) { echo 'checked';} ?> /><span>Нет</span>
				</label>
			</div>
		</div>
		<div class="form-group">
			<label class="col-sm-2 control-label">Выводить под номером телефона:</label>
			<div class="col-sm-3">
				<label class="radio-inline">
					<input type="radio" name="revtheme_header_popupphone[under_phone]" value="1" <?php if ($revtheme_header_popupphone['under_phone']) { echo 'checked'; } ?> /><span>Да</span>
				</label>
				<label class="radio-inline">
					<input type="radio" name="revtheme_header_popupphone[under_phone]" value="0" <?php if (!$revtheme_header_popupphone['under_phone']) { echo 'checked';} ?> /><span>Нет</span>
				</label>
			</div>
		</div>
		<div class="form-group">
			<label class="col-sm-2 control-label" for="input-firstname">Имя:</label>
			<div class="col-sm-3">
			  <select name="revtheme_header_popupphone[firstname]" id="input-firstname" class="form-control">
				<?php if ($revtheme_header_popupphone['firstname'] == 1) { ?>
				<option value="1" selected="selected"><?php echo $text_enabled; ?></option>
				<option value="2">Включено и обязательно</option>
				<option value="0"><?php echo $text_disabled; ?></option>
				<?php } else if ($revtheme_header_popupphone['firstname'] == 2) { ?>
				<option value="1"><?php echo $text_enabled; ?></option>
				<option value="2" selected="selected">Включено и обязательно</option>
				<option value="0"><?php echo $text_disabled; ?></option>
				<?php } else { ?>
				<option value="1"><?php echo $text_enabled; ?></option>
				<option value="2">Включено и обязательно</option>
				<option value="0" selected="selected"><?php echo $text_disabled; ?></option>
				<?php } ?>
			  </select>
			</div>
		</div>
		<div class="form-group">
			<label class="col-sm-2 control-label" for="input-telephone">Телефон:</label>
			<div class="col-sm-3">
			  <select name="revtheme_header_popupphone[telephone]" id="input-telephone" class="form-control">
				<?php if ($revtheme_header_popupphone['telephone'] == 1) { ?>
				<option value="1" selected="selected"><?php echo $text_enabled; ?></option>
				<option value="2">Включено и обязательно</option>
				<option value="0"><?php echo $text_disabled; ?></option>
				<?php } else if ($revtheme_header_popupphone['telephone'] == 2) { ?>
				<option value="1"><?php echo $text_enabled; ?></option>
				<option value="2" selected="selected">Включено и обязательно</option>
				<option value="0"><?php echo $text_disabled; ?></option>
				<?php } else { ?>
				<option value="1"><?php echo $text_enabled; ?></option>
				<option value="2">Включено и обязательно</option>
				<option value="0" selected="selected"><?php echo $text_disabled; ?></option>
				<?php } ?>
			  </select>
			</div>
		</div>
		<div class="form-group">
			<label class="col-sm-2 control-label">Маска для телефона:</label>
			<div class="col-sm-3">
				<input class="form-control" name="revtheme_header_popupphone[telephone_mask]" value="<?php echo isset($revtheme_header_popupphone['telephone_mask']) ? $revtheme_header_popupphone['telephone_mask'] : ''; ?>" />
			</div>
		</div>
		<div class="form-group">
			<label class="col-sm-2 control-label" for="input-email">E-mail:</label>
			<div class="col-sm-3">
			  <select name="revtheme_header_popupphone[email]" id="input-email" class="form-control">
				<?php if ($revtheme_header_popupphone['email'] == 1) { ?>
				<option value="1" selected="selected"><?php echo $text_enabled; ?></option>
				<option value="2">Включено и обязательно</option>
				<option value="0"><?php echo $text_disabled; ?></option>
				<?php } else if ($revtheme_header_popupphone['email'] == 2) { ?>
				<option value="1"><?php echo $text_enabled; ?></option>
				<option value="2" selected="selected">Включено и обязательно</option>
				<option value="0"><?php echo $text_disabled; ?></option>
				<?php } else { ?>
				<option value="1"><?php echo $text_enabled; ?></option>
				<option value="2">Включено и обязательно</option>
				<option value="0" selected="selected"><?php echo $text_disabled; ?></option>
				<?php } ?>
			  </select>
			</div>
		</div>		  
		<div class="form-group">
			<label class="col-sm-2 control-label" for="input-comment">Комментарий:</label>
			<div class="col-sm-3">
			  <select name="revtheme_header_popupphone[comment]" id="input-comment" class="form-control">
				<?php if ($revtheme_header_popupphone['comment'] == 1) { ?>
				<option value="1" selected="selected"><?php echo $text_enabled; ?></option>
				<option value="2">Включено и обязательно</option>
				<option value="0"><?php echo $text_disabled; ?></option>
				<?php } else if ($revtheme_header_popupphone['comment'] == 2) { ?>
				<option value="1"><?php echo $text_enabled; ?></option>
				<option value="2" selected="selected">Включено и обязательно</option>
				<option value="0"><?php echo $text_disabled; ?></option>
				<?php } else { ?>
				<option value="1"><?php echo $text_enabled; ?></option>
				<option value="2">Включено и обязательно</option>
				<option value="0" selected="selected"><?php echo $text_disabled; ?></option>
				<?php } ?>
			  </select>
			</div>
		</div>
	</div>
	<div class="tab-pane text-style" id="tab_header_search">
		<div class="form-group">
			<label class="col-sm-2 control-label">Выбор категории поиска:</label>
			<div class="col-sm-3">
				<label class="radio-inline">
					<input type="radio" name="revtheme_header_search[in_category]" value="1" <?php if ($revtheme_header_search['in_category']) { echo 'checked'; } ?> /><span>Вкл.</span>
				</label>
				<label class="radio-inline">
					<input type="radio" name="revtheme_header_search[in_category]" value="0" <?php if (!$revtheme_header_search['in_category']) { echo 'checked';} ?> /><span>Выкл.</span>
				</label>
			</div>
			<label class="col-sm-2 control-label">Ajax поиск товаров:</label>
			<div class="col-sm-3">
				<label class="radio-inline">
					<input type="radio" id="ajax_search_status" onChange="ajax_search_status_zavisimost(this)" name="revtheme_header_search[ajax_search_status]" value="1" <?php if ($revtheme_header_search['ajax_search_status']) { echo 'checked'; } ?> /><span>Вкл.</span>
				</label>
				<label class="radio-inline">
					<input type="radio" id="ajax_search_status" onChange="ajax_search_status_zavisimost(this)" name="revtheme_header_search[ajax_search_status]" value="0" <?php if (!$revtheme_header_search['ajax_search_status']) {echo 'checked'; } ?> /><span>Выкл.</span>
				</label>
			</div>
		</div>
		<div id="ajax_search_status_zavisimost" style="display:none;">
		<div class="form-group"><div class="col-sm-12">Настройки Ajax поиска:</div></div>
		<div class="form-group">
			<label class="col-sm-2 control-label">Лимит результатов поиска:</label>
			<div class="col-sm-3">
				<input class="form-control" type="text" name="revtheme_header_search[ajax_search_limit]" value="<?php echo isset($revtheme_header_search['ajax_search_limit']) ? $revtheme_header_search['ajax_search_limit'] : ''; ?>" />
			</div>
			<label class="col-sm-2 control-label">Искать по модели товара:</label>
			<div class="col-sm-3">
				<label class="radio-inline">
					<input type="radio" name="revtheme_header_search[ajax_search_model]" value="1" <?php if ($revtheme_header_search['ajax_search_model']) { echo 'checked'; } ?> /><span>Да</span>
				</label>
				<label class="radio-inline">
					<input type="radio" name="revtheme_header_search[ajax_search_model]" value="0" <?php if (!$revtheme_header_search['ajax_search_model']) {echo 'checked'; } ?> /><span>Нет</span>
				</label>
			</div>
		</div>
		<div class="form-group">
			<label class="col-sm-2 control-label">Искать по производителю товара:</label>
			<div class="col-sm-3">
				<label class="radio-inline">
					<input type="radio" name="revtheme_header_search[ajax_search_manufacturer]" value="1" <?php if ($revtheme_header_search['ajax_search_manufacturer']) { echo 'checked'; } ?> /><span>Да</span>
				</label>
				<label class="radio-inline">
					<input type="radio" name="revtheme_header_search[ajax_search_manufacturer]" value="0" <?php if (!$revtheme_header_search['ajax_search_manufacturer']) {echo 'checked'; } ?> /><span>Нет</span>
				</label>
			</div>
			<label class="col-sm-2 control-label">Искать по тегам товара:</label>
			<div class="col-sm-3">
				<label class="radio-inline">
					<input type="radio" name="revtheme_header_search[ajax_search_tag]" value="1" <?php if ($revtheme_header_search['ajax_search_tag']) { echo 'checked'; } ?> /><span>Да</span>
				</label>
				<label class="radio-inline">
					<input type="radio" name="revtheme_header_search[ajax_search_tag]" value="0" <?php if (!$revtheme_header_search['ajax_search_tag']) {echo 'checked'; } ?> /><span>Нет</span>
				</label>
			</div>
		</div>
		<div class="form-group">
			<label class="col-sm-2 control-label">Искать по артикулу (sku) товара:</label>
			<div class="col-sm-3">
				<label class="radio-inline">
					<input type="radio" name="revtheme_header_search[ajax_search_sku]" value="1" <?php if ($revtheme_header_search['ajax_search_sku']) { echo 'checked'; } ?> /><span>Да</span>
				</label>
				<label class="radio-inline">
					<input type="radio" name="revtheme_header_search[ajax_search_sku]" value="0" <?php if (!$revtheme_header_search['ajax_search_sku']) {echo 'checked'; } ?> /><span>Нет</span>
				</label>
			</div>
			<label class="col-sm-2 control-label">Искать по upc товара:</label>
			<div class="col-sm-3">
				<label class="radio-inline">
					<input type="radio" name="revtheme_header_search[ajax_search_upc]" value="1" <?php if ($revtheme_header_search['ajax_search_upc']) { echo 'checked'; } ?> /><span>Да</span>
				</label>
				<label class="radio-inline">
					<input type="radio" name="revtheme_header_search[ajax_search_upc]" value="0" <?php if (!$revtheme_header_search['ajax_search_upc']) {echo 'checked'; } ?> /><span>Нет</span>
				</label>
			</div>
		</div>
		<div class="form-group">
			<label class="col-sm-2 control-label">Искать по mpn товара:</label>
			<div class="col-sm-3">
				<label class="radio-inline">
					<input type="radio" name="revtheme_header_search[ajax_search_mpn]" value="1" <?php if ($revtheme_header_search['ajax_search_mpn']) { echo 'checked'; } ?> /><span>Да</span>
				</label>
				<label class="radio-inline">
					<input type="radio" name="revtheme_header_search[ajax_search_mpn]" value="0" <?php if (!$revtheme_header_search['ajax_search_mpn']) {echo 'checked'; } ?> /><span>Нет</span>
				</label>
			</div>
			<label class="col-sm-2 control-label">Искать по isbn товара:</label>
			<div class="col-sm-3">
				<label class="radio-inline">
					<input type="radio" name="revtheme_header_search[ajax_search_isbn]" value="1" <?php if ($revtheme_header_search['ajax_search_isbn']) { echo 'checked'; } ?> /><span>Да</span>
				</label>
				<label class="radio-inline">
					<input type="radio" name="revtheme_header_search[ajax_search_isbn]" value="0" <?php if (!$revtheme_header_search['ajax_search_isbn']) {echo 'checked'; } ?> /><span>Нет</span>
				</label>
			</div>
		</div>
		<div class="form-group">
			<label class="col-sm-2 control-label">Искать по jan товара:</label>
			<div class="col-sm-3">
				<label class="radio-inline">
					<input type="radio" name="revtheme_header_search[ajax_search_jan]" value="1" <?php if ($revtheme_header_search['ajax_search_jan']) { echo 'checked'; } ?> /><span>Да</span>
				</label>
				<label class="radio-inline">
					<input type="radio" name="revtheme_header_search[ajax_search_jan]" value="0" <?php if (!$revtheme_header_search['ajax_search_jan']) {echo 'checked'; } ?> /><span>Нет</span>
				</label>
			</div>
			<label class="col-sm-2 control-label">Искать по ean товара:</label>
			<div class="col-sm-3">
				<label class="radio-inline">
					<input type="radio" name="revtheme_header_search[ajax_search_ean]" value="1" <?php if ($revtheme_header_search['ajax_search_ean']) { echo 'checked'; } ?> /><span>Да</span>
				</label>
				<label class="radio-inline">
					<input type="radio" name="revtheme_header_search[ajax_search_ean]" value="0" <?php if (!$revtheme_header_search['ajax_search_ean']) {echo 'checked'; } ?> /><span>Нет</span>
				</label>
			</div>
		</div>
		</div>
	</div>
	<div class="tab-pane text-style" id="tab_header_cart">
		<div class="form-group">
			<label class="col-sm-2 control-label">Иконка:</label>
			<div class="col-sm-2">
				<label class="radio-inline">
					<input type="radio" onchange="$(this).parent().parent().parent().find('.zavisimost_ico').show().next().hide();" name="revtheme_header_cart[icontype]" value="1" <?php if ($revtheme_header_cart['icontype']) { echo 'checked'; } ?> /><span>Иконка</span>
				</label>
				<label class="radio-inline">
					<input type="radio" onchange="$(this).parent().parent().parent().find('.zavisimost_ico').hide().next().show();" name="revtheme_header_cart[icontype]" value="0" <?php if (!$revtheme_header_cart['icontype']) { echo 'checked';} ?> /><span>Картинка</span>
				</label>	
			</div>
			<div class="col-sm-2 zavisimost_ico" <?php if (!$revtheme_header_cart['icontype']) { ?> style="display: none" <?php } ?>>
				<span class="fazavisimost fa_icon form-control width_initial" id="icon_revtheme_header_cart" onclick="fa_icons($(this).attr('id'))"><i class="<?php echo $revtheme_header_cart['icon']; ?>"></i></span>
				<input type="hidden" name="revtheme_header_cart[icon]" value="<?php echo $revtheme_header_cart['icon']; ?>" id="input-icon_revtheme_header_cart" />
			</div>
			<div class="col-sm-2" <?php if ($revtheme_header_cart['icontype']) { ?> style="display: none" <?php } ?>>
				<a href="" id="thumb-image_revtheme_header_cart" data-toggle="image" class="img-thumbnail width_initial"><img style="width:25px;" src="<?php echo $revtheme_header_cart_thumb; ?>" alt="" title="" data-placeholder="<?php echo $placeholder; ?>" /></a>
				<input type="hidden" name="revtheme_header_cart[image]" value="<?php echo $revtheme_header_cart['image']; ?>" id="revtheme_header_cart_image" />
			</div>
		</div>
		<div class="form-group">
			<label class="col-sm-2 control-label">Тип корзины:</label>
			<div class="col-sm-3">
				<select name="revtheme_header_cart[type]" class="form-control">
					<?php if ($revtheme_header_cart['type'] == 'standart') { ?>
					<option value="standart" selected="selected">Выпадающая</option>
					<?php } else { ?>
					<option value="standart">Выпадающая</option>
					<?php } ?>
					<?php if ($revtheme_header_cart['type'] == 'modal') { ?>
					<option value="modal" selected="selected">Всплывающая</option>
					<?php } else { ?>
					<option value="modal">Всплывающая</option>
					<?php } ?>
					<?php if ($revtheme_header_cart['type'] == 'redirect') { ?>
					<option value="redirect" selected="selected">Переход к оформлению</option>
					<?php } else { ?>
					<option value="redirect">Переход к оформлению</option>
					<?php } ?>
				  </select>
			</div>
		</div>
		<div class="form-group">
			<label class="col-sm-2 control-label">При клике на кнопку Купить:</label>
			<div class="col-sm-5">
				<label class="radio-inline">
					<input type="radio" name="revtheme_header_cart[cart_vspl]" value="1" <?php if ($revtheme_header_cart['cart_vspl']) { echo 'checked'; } ?> /><span>Всплывающая корзина</span>
				</label>
				<label class="radio-inline">
					<input type="radio" name="revtheme_header_cart[cart_vspl]" value="0" <?php if (!$revtheme_header_cart['cart_vspl']) {echo 'checked'; } ?> /><span>Полет картинки в корзину</span>
				</label>
			</div>
		</div>
	</div>
	</div>	
</div>
<div class="tab-pane" id="tab_catalog">
	<div class="col-sm-2">
		<nav class="nav-sidebar">
			<ul class="nav tabs">
				<li class="active"><a href="#tab_cat_all" data-toggle="tab">Общие настройки</a></li>
				<li><a href="#tab_cat_sorts" data-toggle="tab">Сортировки</a></li>
				<li><a href="#tab_cat_stikers" data-toggle="tab">Стикеры</a></li>
				<li><a href="#tab_cat_popuporder" data-toggle="tab">Быстрый заказ</a></li>
				<li><a href="#tab_cat_compare" data-toggle="tab">Сравнение товаров</a></li>
				<li><a href="#tab_cat_mods" data-toggle="tab">Модули</a></li>
				<li><a href="#tab_cat_attributes" data-toggle="tab">Вывод описания или характеристик товара</a></li>
				<!--<li><a href="#tab_cat_filter" data-toggle="tab">Фильтр товаров</a></li>-->
			</ul>
		</nav>
	</div>
<div class="tab-content col-sm-10">
	<div class="tab-pane active text-style" id="tab_cat_all">
		<div class="form-group">
			<label class="col-sm-2 control-label">Показывать выбор подкатегорий на странице с товарами:</label>
			<div class="col-sm-2">
				<label class="radio-inline">
					<input type="radio" name="revtheme_catalog_all[podcategory_status]" value="1" <?php if ($revtheme_catalog_all['podcategory_status']) { echo 'checked'; } ?> /><span>Да</span>
				</label>
				<label class="radio-inline">
					<input type="radio" name="revtheme_catalog_all[podcategory_status]" value="0" <?php if (!$revtheme_catalog_all['podcategory_status']) { echo 'checked';} ?> /><span>Нет</span>
				</label>
			</div>
		</div>
		<div class="form-group">
			<label class="col-sm-2 control-label">Вывод подкатегорий с картинками:</label>
			<div class="col-sm-2">
				<label class="radio-inline">
					<input type="radio" name="revtheme_catalog_all[podcategory_imgs]" value="1" <?php if ($revtheme_catalog_all['podcategory_imgs']) { echo 'checked'; } ?> /><span>Да</span>
				</label>
				<label class="radio-inline">
					<input type="radio" name="revtheme_catalog_all[podcategory_imgs]" value="0" <?php if (!$revtheme_catalog_all['podcategory_imgs']) { echo 'checked';} ?> /><span>Нет</span>
				</label>
			</div>
		</div>
		<div class="form-group">
			<label class="col-sm-2 control-label">Выбор количества товара:</label>
			<div class="col-sm-2">
				<label class="radio-inline">
					<input type="radio" name="revtheme_catalog_all[ch_quantity]" value="1" <?php if ($revtheme_catalog_all['ch_quantity']) { echo 'checked'; } ?> /><span>Вкл.</span>
				</label>
				<label class="radio-inline">
					<input type="radio" name="revtheme_catalog_all[ch_quantity]" value="0" <?php if (!$revtheme_catalog_all['ch_quantity']) { echo 'checked';} ?> /><span>Выкл.</span>
				</label>
			</div>
		</div>
		<div class="form-group">
			<label class="col-sm-2 control-label">Кнопка "Сравнения":</label>
			<div class="col-sm-2">
				<label class="radio-inline">
					<input type="radio" name="revtheme_catalog_all[rev_srav_prod]" value="1" <?php if ($revtheme_catalog_all['rev_srav_prod']) { echo 'checked'; } ?> /><span>Вкл.</span>
				</label>
				<label class="radio-inline">
					<input type="radio" name="revtheme_catalog_all[rev_srav_prod]" value="0" <?php if (!$revtheme_catalog_all['rev_srav_prod']) { echo 'checked';} ?> /><span>Выкл.</span>
				</label>
			</div>
		</div>
		<div class="form-group">
			<label class="col-sm-2 control-label">Кнопка "Закладок":</label>
			<div class="col-sm-2">
				<label class="radio-inline">
					<input type="radio" name="revtheme_catalog_all[rev_wish_prod]" value="1" <?php if ($revtheme_catalog_all['rev_wish_prod']) { echo 'checked'; } ?> /><span>Вкл.</span>
				</label>
				<label class="radio-inline">
					<input type="radio" name="revtheme_catalog_all[rev_wish_prod]" value="0" <?php if (!$revtheme_catalog_all['rev_wish_prod']) { echo 'checked';} ?> /><span>Выкл.</span>
				</label>
			</div>
		</div>
		<div class="form-group">
			<label class="col-sm-2 control-label">Быстрый просмотр товара:</label>
			<div class="col-sm-2">
				<label class="radio-inline">
					<input type="radio" name="revtheme_catalog_all[popup_view]" value="1" <?php if ($revtheme_catalog_all['popup_view']) { echo 'checked'; } ?> /><span>Вкл.</span>
				</label>
				<label class="radio-inline">
					<input type="radio" name="revtheme_catalog_all[popup_view]" value="0" <?php if (!$revtheme_catalog_all['popup_view']) { echo 'checked';} ?> /><span>Выкл.</span>
				</label>
			</div>
		</div>
		<div class="form-group">
			<label class="col-sm-2 control-label">Слайдер доп. изображений:</label>
			<div class="col-sm-2">
				<label class="radio-inline">
					<input type="radio" name="revtheme_catalog_all[img_slider]" value="1" <?php if ($revtheme_catalog_all['img_slider']) { echo 'checked'; } ?> /><span>Вкл.</span>
				</label>
				<label class="radio-inline">
					<input type="radio" name="revtheme_catalog_all[img_slider]" value="0" <?php if (!$revtheme_catalog_all['img_slider']) { echo 'checked';} ?> /><span>Выкл.</span>
				</label>
			</div>
		</div>
		<div class="form-group">
			<label class="col-sm-2 control-label">Количество товаров в ряду:</label>
			<div class="col-sm-2">
				<label class="radio-inline">
					<input type="radio" name="revtheme_catalog_all[chislo_ryad]" value="1" <?php if ($revtheme_catalog_all['chislo_ryad']) { echo 'checked'; } ?> /><span>4</span>
				</label>
				<label class="radio-inline">
					<input type="radio" name="revtheme_catalog_all[chislo_ryad]" value="0" <?php if (!$revtheme_catalog_all['chislo_ryad']) { echo 'checked';} ?> /><span>5</span>
				</label>
			</div>
		</div>
		<div class="form-group">
			<label class="col-sm-2 control-label">Включить выбор отображения товаров:</label>
			<div class="col-sm-3">
				<label class="radio-inline newmychek">
					<?php if (isset($revtheme_catalog_all['vid_grid'])) { ?>
					<input type="checkbox" name="revtheme_catalog_all[vid_grid]" value="1" checked="checked" />
					<?php } else { ?>
					<input type="checkbox" name="revtheme_catalog_all[vid_grid]" value="1" />
					<?php } ?><span>Сеткой</span>
				</label>
				<label class="radio-inline newmychek">
					<?php if (isset($revtheme_catalog_all['vid_list'])) { ?>
					<input type="checkbox" name="revtheme_catalog_all[vid_list]" value="1" checked="checked" />
					<?php } else { ?>
					<input type="checkbox" name="revtheme_catalog_all[vid_list]" value="1" />
					<?php } ?><span>Списком</span>
				</label>
				<label class="radio-inline newmychek">
					<?php if (isset($revtheme_catalog_all['vid_price'])) { ?>
					<input type="checkbox" name="revtheme_catalog_all[vid_price]" value="1" checked="checked" />
					<?php } else { ?>
					<input type="checkbox" name="revtheme_catalog_all[vid_price]" value="1" />
					<?php } ?><span>Компактный</span>
				</label>
			</div>
		</div>
		<div class="form-group">
			<label class="col-sm-2 control-label">Вид отображения товаров по умолчанию:</label>
			<div class="col-sm-3">
				<label class="radio-inline">
					<input type="radio" name="revtheme_catalog_all[vid_default]" value="vid_grid" <?php if ($revtheme_catalog_all['vid_default'] == 'vid_grid') { echo 'checked'; } ?> /><span>Сеткой</span>
				</label>
				<label class="radio-inline">
					<input type="radio" name="revtheme_catalog_all[vid_default]" value="vid_list" <?php if ($revtheme_catalog_all['vid_default'] == 'vid_list') { echo 'checked';} ?> /><span>Списком</span>
				</label>
				<label class="radio-inline">
					<input type="radio" name="revtheme_catalog_all[vid_default]" value="vid_price" <?php if ($revtheme_catalog_all['vid_default'] == 'vid_price') { echo 'checked';} ?> /><span>Компактный</span>
				</label>
			</div>
		</div>
		<div class="form-group">
			<label class="col-sm-2 control-label">Постраничная навигация:</label>
			<div class="col-sm-6">
				<label class="radio-inline">
					<input type="radio" name="revtheme_catalog_all[pagination]" value="standart" <?php if ($revtheme_catalog_all['pagination'] == 'standart') { echo 'checked'; } ?> /><span>Стандартная</span>
				</label>
				<label class="radio-inline">
					<input type="radio" name="revtheme_catalog_all[pagination]" value="knopka" <?php if ($revtheme_catalog_all['pagination'] == 'knopka') { echo 'checked';} ?> /><span>Кнопка "Показать еще"</span>
				</label>
				<label class="radio-inline">
					<input type="radio" name="revtheme_catalog_all[pagination]" value="standart_knopka" <?php if ($revtheme_catalog_all['pagination'] == 'standart_knopka') { echo 'checked';} ?> /><span>Стандартная + Кнопка "Показать еще"</span>
				</label>
			</div>
		</div>
		<div class="form-group">
			<label class="col-sm-2 control-label">Товары "Новинки" (автозаполнение):<span data-toggle="tooltip" title="Если товары не выбраны, они будут отобраны автоматически."></span></label>
			<div class="col-sm-4">
				<input type="text" name="last_product" value="" placeholder="Товары" id="input-product" class="form-control" />
				<br/>
				<div class="scrollbox_last_products well well-sm" id="last_products-product" style="height: 200px; overflow: auto;">
					<?php $class = 'odd'; ?>
					<?php foreach ($last_products as $product) { ?>
						<?php $class = ($class == 'even' ? 'odd' : 'even'); ?>
						<div id="last_products-product<?php echo $product['product_id']; ?>" class="<?php echo $class; ?>"><?php echo $product['name']; ?> <i class="fa fa-minus-circle"></i>
							<input type="hidden" value="<?php echo $product['product_id']; ?>" />
						</div>
					<?php } ?>
				</div>
				<input type="hidden" name="revtheme_catalog_last[last_products]" value="<?php echo $revtheme_catalog_last['last_products']; ?>" />
			</div>
		</div>
		<div class="form-group">
			<label class="col-sm-2 control-label pt0">Лимит товаров на странице<br>"Новинки":<span data-toggle="tooltip" title="Для автоматического отбора."></span>
			</label>
			<div class="col-sm-2">
				<input class="form-control" type="text" name="revtheme_catalog_last[limit]" value="<?php echo isset($revtheme_catalog_last['limit']) ? $revtheme_catalog_last['limit'] : ''; ?>" />
			</div>
			<label class="col-sm-2 control-label pt0">Добавлен дней назад не более:
			</label>
			<div class="col-sm-2">
				<input class="form-control" type="text" name="revtheme_catalog_last[filter_day]" value="<?php echo isset($revtheme_catalog_last['filter_day']) ? $revtheme_catalog_last['filter_day'] : ''; ?>" />
			</div>
		</div>
		<div class="form-group">
			<label class="col-sm-2 control-label">Товары "Хиты продаж" (автозаполнение):<span data-toggle="tooltip" title="Если товары не выбраны, они будут отобраны автоматически."></span></label>
			<div class="col-sm-4">
				<input type="text" name="best_product" value="" placeholder="Товары" id="input-product" class="form-control" />
				<br/>
				<div class="scrollbox_best_products well well-sm" id="best_products-product" style="height: 200px; overflow: auto;">
					<?php $class = 'odd'; ?>
					<?php foreach ($best_products as $product) { ?>
						<?php $class = ($class == 'even' ? 'odd' : 'even'); ?>
						<div id="best_products-product<?php echo $product['product_id']; ?>" class="<?php echo $class; ?>"><?php echo $product['name']; ?> <i class="fa fa-minus-circle"></i>
							<input type="hidden" value="<?php echo $product['product_id']; ?>" />
						</div>
					<?php } ?>
				</div>
				<input type="hidden" name="revtheme_catalog_best[best_products]" value="<?php echo $revtheme_catalog_best['best_products']; ?>" />
			</div>
		</div>
		<div class="form-group">
			<label class="col-sm-2 control-label pt0">Лимит товаров на странице<br>"Хиты продаж":<span data-toggle="tooltip" title="Для автоматического отбора."></span>
			</label>
			<div class="col-sm-2">
				<input class="form-control" type="text" name="revtheme_catalog_best[limit]" value="<?php echo isset($revtheme_catalog_best['limit']) ? $revtheme_catalog_best['limit'] : ''; ?>" />
			</div>
			<label class="col-sm-2 control-label pt0">С числом продаж более:
			</label>
			<div class="col-sm-2">
				<input class="form-control" type="text" name="revtheme_catalog_best[filter_buy]" value="<?php echo isset($revtheme_catalog_best['filter_buy']) ? $revtheme_catalog_best['filter_buy'] : ''; ?>" />
			</div>
		</div>
	</div>
	<div class="tab-pane text-style" id="tab_cat_sorts">
		<div class="form-group">
            <label class="col-sm-2 control-label">Сортировка по умолчанию:</label>
            <div class="col-sm-2">
              <select name="revtheme_catalog_sorts_category[sort_default]" class="form-control">
                <?php if ($revtheme_catalog_sorts_category['sort_default'] == 'p.sort_order') { ?>
                <option value="p.sort_order" selected="selected">По умолчанию</option>
                <?php } else { ?>
                <option value="p.sort_order">По умолчанию</option>
                <?php } ?>
				<?php if ($revtheme_catalog_sorts_category['sort_default'] == 'pd.name') { ?>
                <option value="pd.name" selected="selected">По имени</option>
                <?php } else { ?>
                <option value="pd.name">По имени</option>
                <?php } ?>
				<?php if ($revtheme_catalog_sorts_category['sort_default'] == 'p.price') { ?>
                <option value="p.price" selected="selected">По Цене</option>
                <?php } else { ?>
				<option value="p.price">По Цене</option>
				<?php } ?>
				<?php if ($revtheme_catalog_sorts_category['sort_default'] == 'rating') { ?>
                <option value="rating" selected="selected">По Рейтингу</option>
                <?php } else { ?>
                <option value="rating">По Рейтингу</option>
                <?php } ?>             
				<?php if ($revtheme_catalog_sorts_category['sort_default'] == 'p.model') { ?>
                <option value="p.model" selected="selected">По Модели</option>
                <?php } else { ?>
                <option value="p.model">По Модели</option>
                <?php } ?>
				<?php if ($revtheme_catalog_sorts_category['sort_default'] == 'p.date_added') { ?>
                <option value="p.date_added" selected="selected">По<span>Да</span>те поступления </option>
                <?php } else { ?>
                <option value="p.date_added">По<span>Да</span>те поступления </option>
                <?php } ?>
              </select>
            </div>
			<label class="col-sm-2 control-label">Направление:</label>
            <div class="col-sm-2">
              <select name="revtheme_catalog_sorts_category[sort_default_adesc]" class="form-control">
				<?php if ($revtheme_catalog_sorts_category['sort_default_adesc'] == 'ASC') { ?>
                <option value="ASC" selected="selected">По возрастанию</option>
                <?php } else { ?>
                <option value="ASC">По возрастанию</option>
                <?php } ?>
                <?php if ($revtheme_catalog_sorts_category['sort_default_adesc'] == 'DESC') { ?>
                <option value="DESC" selected="selected">По убыванию</option>
                <?php } else { ?>
                <option value="DESC">По убыванию</option>
                <?php } ?>		
              </select>
            </div>
        </div>
		<div class="form-group"><div class="col-sm-12">Используемые сортировки и их заголовки:</div></div>
		<div class="form-group">
			<label class="col-sm-2 control-label">По умолчанию:</label>
			<div class="col-sm-2">
				<label class="radio-inline">
					<input type="radio" name="revtheme_catalog_sorts_category[order_ASC]" value="1" <?php if ($revtheme_catalog_sorts_category['order_ASC']) { echo 'checked'; } ?> /><span>Да</span>
				</label>
				<label class="radio-inline">
					<input type="radio" name="revtheme_catalog_sorts_category[order_ASC]" value="0" <?php if (!$revtheme_catalog_sorts_category['order_ASC']) { echo 'checked';} ?> /><span>Нет</span>
				</label>
			</div>
			<label class="col-sm-2 control-label">Заголовок:</label>
			<div class="col-sm-2">
				<?php foreach ($languages as $language) { ?>
					<div class="input-group">
						<span class="input-group-addon"><img src="<?php echo (VERSION >= 2.2) ? 'language/'.$language['code'].'/'.$language['code'].'.png' : 'view/image/flags/'.$language['image']; ?>" title="<?php echo $language['name']; ?>" /></span>
						<input type="text" name="revtheme_catalog_sorts_category[<?php echo $language['language_id']; ?>][order_ASC_text]" value="<?php echo isset($revtheme_catalog_sorts_category[$language['language_id']]['order_ASC_text']) ? $revtheme_catalog_sorts_category[$language['language_id']]['order_ASC_text'] : ''; ?>" class="form-control" />
					</div>
				<?php } ?>
			</div>
		</div>
		<div class="form-group">
			<label class="col-sm-2 control-label">По имени<br>(А - Я):</label>
			<div class="col-sm-2">
				<label class="radio-inline">
					<input type="radio" name="revtheme_catalog_sorts_category[name_ASC]" value="1" <?php if ($revtheme_catalog_sorts_category['name_ASC']) { echo 'checked'; } ?> /><span>Да</span>
				</label>
				<label class="radio-inline">
					<input type="radio" name="revtheme_catalog_sorts_category[name_ASC]" value="0" <?php if (!$revtheme_catalog_sorts_category['name_ASC']) { echo 'checked';} ?> /><span>Нет</span>
				</label>
			</div>
			<label class="col-sm-2 control-label">Заголовок:</label>
			<div class="col-sm-2">
				<?php foreach ($languages as $language) { ?>
					<div class="input-group">
						<span class="input-group-addon"><img src="<?php echo (VERSION >= 2.2) ? 'language/'.$language['code'].'/'.$language['code'].'.png' : 'view/image/flags/'.$language['image']; ?>" title="<?php echo $language['name']; ?>" /></span>
						<input type="text" name="revtheme_catalog_sorts_category[<?php echo $language['language_id']; ?>][name_ASC_text]" value="<?php echo isset($revtheme_catalog_sorts_category[$language['language_id']]['name_ASC_text']) ? $revtheme_catalog_sorts_category[$language['language_id']]['name_ASC_text'] : ''; ?>" class="form-control" />
					</div>
				<?php } ?>
			</div>
		</div>
		<div class="form-group">
			<label class="col-sm-2 control-label">По имени<br>(Я - А):</label>
			<div class="col-sm-2">
				<label class="radio-inline">
					<input type="radio" name="revtheme_catalog_sorts_category[name_DESC]" value="1" <?php if ($revtheme_catalog_sorts_category['name_DESC']) { echo 'checked'; } ?> /><span>Да</span>
				</label>
				<label class="radio-inline">
					<input type="radio" name="revtheme_catalog_sorts_category[name_DESC]" value="0" <?php if (!$revtheme_catalog_sorts_category['name_DESC']) { echo 'checked';} ?> /><span>Нет</span>
				</label>
			</div>
			<label class="col-sm-2 control-label">Заголовок:</label>
			<div class="col-sm-2">
				<?php foreach ($languages as $language) { ?>
					<div class="input-group">
						<span class="input-group-addon"><img src="<?php echo (VERSION >= 2.2) ? 'language/'.$language['code'].'/'.$language['code'].'.png' : 'view/image/flags/'.$language['image']; ?>" title="<?php echo $language['name']; ?>" /></span>
						<input type="text" name="revtheme_catalog_sorts_category[<?php echo $language['language_id']; ?>][name_DESC_text]" value="<?php echo isset($revtheme_catalog_sorts_category[$language['language_id']]['name_DESC_text']) ? $revtheme_catalog_sorts_category[$language['language_id']]['name_DESC_text'] : ''; ?>" class="form-control" />
					</div>
				<?php } ?>
			</div>
		</div>
		<div class="form-group">
			<label class="col-sm-2 control-label">По Цене<br>(по возрастанию):</label>
			<div class="col-sm-2">
				<label class="radio-inline">
					<input type="radio" name="revtheme_catalog_sorts_category[price_ASC]" value="1" <?php if ($revtheme_catalog_sorts_category['price_ASC']) { echo 'checked'; } ?> /><span>Да</span>
				</label>
				<label class="radio-inline">
					<input type="radio" name="revtheme_catalog_sorts_category[price_ASC]" value="0" <?php if (!$revtheme_catalog_sorts_category['price_ASC']) { echo 'checked';} ?> /><span>Нет</span>
				</label>
			</div>
			<label class="col-sm-2 control-label">Заголовок:</label>
			<div class="col-sm-2">
				<?php foreach ($languages as $language) { ?>
					<div class="input-group">
						<span class="input-group-addon"><img src="<?php echo (VERSION >= 2.2) ? 'language/'.$language['code'].'/'.$language['code'].'.png' : 'view/image/flags/'.$language['image']; ?>" title="<?php echo $language['name']; ?>" /></span>
						<input type="text" name="revtheme_catalog_sorts_category[<?php echo $language['language_id']; ?>][price_ASC_text]" value="<?php echo isset($revtheme_catalog_sorts_category[$language['language_id']]['price_ASC_text']) ? $revtheme_catalog_sorts_category[$language['language_id']]['price_ASC_text'] : ''; ?>" class="form-control" />
					</div>
				<?php } ?>
			</div>
		</div>
		<div class="form-group">
			<label class="col-sm-2 control-label">По Цене<br>(по убыванию):</label>
			<div class="col-sm-2">
				<label class="radio-inline">
					<input type="radio" name="revtheme_catalog_sorts_category[price_DESC]" value="1" <?php if ($revtheme_catalog_sorts_category['price_DESC']) { echo 'checked'; } ?> /><span>Да</span>
				</label>
				<label class="radio-inline">
					<input type="radio" name="revtheme_catalog_sorts_category[price_DESC]" value="0" <?php if (!$revtheme_catalog_sorts_category['price_DESC']) { echo 'checked';} ?> /><span>Нет</span>
				</label>
			</div>
			<label class="col-sm-2 control-label">Заголовок:</label>
			<div class="col-sm-2">
				<?php foreach ($languages as $language) { ?>
					<div class="input-group">
						<span class="input-group-addon"><img src="<?php echo (VERSION >= 2.2) ? 'language/'.$language['code'].'/'.$language['code'].'.png' : 'view/image/flags/'.$language['image']; ?>" title="<?php echo $language['name']; ?>" /></span>
						<input type="text" name="revtheme_catalog_sorts_category[<?php echo $language['language_id']; ?>][price_DESC_text]" value="<?php echo isset($revtheme_catalog_sorts_category[$language['language_id']]['price_DESC_text']) ? $revtheme_catalog_sorts_category[$language['language_id']]['price_DESC_text'] : ''; ?>" class="form-control" />
					</div>
				<?php } ?>
			</div>
		</div>
		<div class="form-group">
			<label class="col-sm-2 control-label">По Рейтингу<br>(по убыванию):</label>
			<div class="col-sm-2">
				<label class="radio-inline">
					<input type="radio" name="revtheme_catalog_sorts_category[rating_DESC]" value="1" <?php if ($revtheme_catalog_sorts_category['rating_DESC']) { echo 'checked'; } ?> /><span>Да</span>
				</label>
				<label class="radio-inline">
					<input type="radio" name="revtheme_catalog_sorts_category[rating_DESC]" value="0" <?php if (!$revtheme_catalog_sorts_category['rating_DESC']) { echo 'checked';} ?> /><span>Нет</span>
				</label>
			</div>
			<label class="col-sm-2 control-label">Заголовок:</label>
			<div class="col-sm-2">
				<?php foreach ($languages as $language) { ?>
					<div class="input-group">
						<span class="input-group-addon"><img src="<?php echo (VERSION >= 2.2) ? 'language/'.$language['code'].'/'.$language['code'].'.png' : 'view/image/flags/'.$language['image']; ?>" title="<?php echo $language['name']; ?>" /></span>
						<input type="text" name="revtheme_catalog_sorts_category[<?php echo $language['language_id']; ?>][rating_DESC_text]" value="<?php echo isset($revtheme_catalog_sorts_category[$language['language_id']]['rating_DESC_text']) ? $revtheme_catalog_sorts_category[$language['language_id']]['rating_DESC_text'] : ''; ?>" class="form-control" />
					</div>
				<?php } ?>
			</div>
		</div>
		<div class="form-group">
			<label class="col-sm-2 control-label">По Рейтингу<br>(по возрастанию):</label>
			<div class="col-sm-2">
				<label class="radio-inline">
					<input type="radio" name="revtheme_catalog_sorts_category[rating_ASC]" value="1" <?php if ($revtheme_catalog_sorts_category['rating_ASC']) { echo 'checked'; } ?> /><span>Да</span>
				</label>
				<label class="radio-inline">
					<input type="radio" name="revtheme_catalog_sorts_category[rating_ASC]" value="0" <?php if (!$revtheme_catalog_sorts_category['rating_ASC']) { echo 'checked';} ?> /><span>Нет</span>
				</label>
			</div>
			<label class="col-sm-2 control-label">Заголовок:</label>
			<div class="col-sm-2">
				<?php foreach ($languages as $language) { ?>
					<div class="input-group">
						<span class="input-group-addon"><img src="<?php echo (VERSION >= 2.2) ? 'language/'.$language['code'].'/'.$language['code'].'.png' : 'view/image/flags/'.$language['image']; ?>" title="<?php echo $language['name']; ?>" /></span>
						<input type="text" name="revtheme_catalog_sorts_category[<?php echo $language['language_id']; ?>][rating_ASC_text]" value="<?php echo isset($revtheme_catalog_sorts_category[$language['language_id']]['rating_ASC_text']) ? $revtheme_catalog_sorts_category[$language['language_id']]['rating_ASC_text'] : ''; ?>" class="form-control" />
					</div>
				<?php } ?>
			</div>
		</div>
		<div class="form-group">
			<label class="col-sm-2 control-label">По Модели<br>(A - Я):</label>
			<div class="col-sm-2">
				<label class="radio-inline">
					<input type="radio" name="revtheme_catalog_sorts_category[model_ASC]" value="1" <?php if ($revtheme_catalog_sorts_category['model_ASC']) { echo 'checked'; } ?> /><span>Да</span>
				</label>
				<label class="radio-inline">
					<input type="radio" name="revtheme_catalog_sorts_category[model_ASC]" value="0" <?php if (!$revtheme_catalog_sorts_category['model_ASC']) { echo 'checked';} ?> /><span>Нет</span>
				</label>
			</div>
			<label class="col-sm-2 control-label">Заголовок:</label>
			<div class="col-sm-2">
				<?php foreach ($languages as $language) { ?>
					<div class="input-group">
						<span class="input-group-addon"><img src="<?php echo (VERSION >= 2.2) ? 'language/'.$language['code'].'/'.$language['code'].'.png' : 'view/image/flags/'.$language['image']; ?>" title="<?php echo $language['name']; ?>" /></span>
						<input type="text" name="revtheme_catalog_sorts_category[<?php echo $language['language_id']; ?>][model_ASC_text]" value="<?php echo isset($revtheme_catalog_sorts_category[$language['language_id']]['model_ASC_text']) ? $revtheme_catalog_sorts_category[$language['language_id']]['model_ASC_text'] : ''; ?>" class="form-control" />
					</div>
				<?php } ?>
			</div>
		</div>
		<div class="form-group">
			<label class="col-sm-2 control-label">По Модели<br>(Я - A):</label>
			<div class="col-sm-2">
				<label class="radio-inline">
					<input type="radio" name="revtheme_catalog_sorts_category[model_DESC]" value="1" <?php if ($revtheme_catalog_sorts_category['model_DESC']) { echo 'checked'; } ?> /><span>Да</span>
				</label>
				<label class="radio-inline">
					<input type="radio" name="revtheme_catalog_sorts_category[model_DESC]" value="0" <?php if (!$revtheme_catalog_sorts_category['model_DESC']) { echo 'checked';} ?> /><span>Нет</span>
				</label>
			</div>
			<label class="col-sm-2 control-label">Заголовок:</label>
			<div class="col-sm-2">
				<?php foreach ($languages as $language) { ?>
					<div class="input-group">
						<span class="input-group-addon"><img src="<?php echo (VERSION >= 2.2) ? 'language/'.$language['code'].'/'.$language['code'].'.png' : 'view/image/flags/'.$language['image']; ?>" title="<?php echo $language['name']; ?>" /></span>
						<input type="text" name="revtheme_catalog_sorts_category[<?php echo $language['language_id']; ?>][model_DESC_text]" value="<?php echo isset($revtheme_catalog_sorts_category[$language['language_id']]['model_DESC_text']) ? $revtheme_catalog_sorts_category[$language['language_id']]['model_DESC_text'] : ''; ?>" class="form-control" />
					</div>
				<?php } ?>
			</div>
		</div>
		<div class="form-group">
			<label class="col-sm-2 control-label">По дате поступления<br>(старые > новые):</label>
			<div class="col-sm-2">
				<label class="radio-inline">
					<input type="radio" name="revtheme_catalog_sorts_category[date_added_ASC]" value="1" <?php if ($revtheme_catalog_sorts_category['date_added_ASC']) { echo 'checked'; } ?> /><span>Да</span>
				</label>
				<label class="radio-inline">
					<input type="radio" name="revtheme_catalog_sorts_category[date_added_ASC]" value="0" <?php if (!$revtheme_catalog_sorts_category['date_added_ASC']) { echo 'checked';} ?> /><span>Нет</span>
				</label>
			</div>
			<label class="col-sm-2 control-label">Заголовок:</label>
			<div class="col-sm-2">
				<?php foreach ($languages as $language) { ?>
					<div class="input-group">
						<span class="input-group-addon"><img src="<?php echo (VERSION >= 2.2) ? 'language/'.$language['code'].'/'.$language['code'].'.png' : 'view/image/flags/'.$language['image']; ?>" title="<?php echo $language['name']; ?>" /></span>
						<input type="text" name="revtheme_catalog_sorts_category[<?php echo $language['language_id']; ?>][date_added_ASC_text]" value="<?php echo isset($revtheme_catalog_sorts_category[$language['language_id']]['date_added_ASC_text']) ? $revtheme_catalog_sorts_category[$language['language_id']]['date_added_ASC_text'] : ''; ?>" class="form-control" />
					</div>
				<?php } ?>
			</div>
		</div>
		<div class="form-group">
			<label class="col-sm-2 control-label">По дате поступления<br>(новые > старые):</label>
			<div class="col-sm-2">
				<label class="radio-inline">
					<input type="radio" name="revtheme_catalog_sorts_category[date_added_DESC]" value="1" <?php if ($revtheme_catalog_sorts_category['date_added_DESC']) { echo 'checked'; } ?> /><span>Да</span>
				</label>
				<label class="radio-inline">
					<input type="radio" name="revtheme_catalog_sorts_category[date_added_DESC]" value="0" <?php if (!$revtheme_catalog_sorts_category['date_added_DESC']) { echo 'checked';} ?> /><span>Нет</span>
				</label>
			</div>
			<label class="col-sm-2 control-label">Заголовок:</label>
			<div class="col-sm-2">
				<?php foreach ($languages as $language) { ?>
					<div class="input-group">
						<span class="input-group-addon"><img src="<?php echo (VERSION >= 2.2) ? 'language/'.$language['code'].'/'.$language['code'].'.png' : 'view/image/flags/'.$language['image']; ?>" title="<?php echo $language['name']; ?>" /></span>
						<input type="text" name="revtheme_catalog_sorts_category[<?php echo $language['language_id']; ?>][date_added_DESC_text]" value="<?php echo isset($revtheme_catalog_sorts_category[$language['language_id']]['date_added_DESC_text']) ? $revtheme_catalog_sorts_category[$language['language_id']]['date_added_DESC_text'] : ''; ?>" class="form-control" />
					</div>
				<?php } ?>
			</div>
		</div>
	</div>
	<div class="tab-pane text-style" id="tab_cat_stikers">
		<div class="form-group">
			<label class="col-sm-2 control-label">Включить стикеры:</label>
			<div class="col-sm-3">
				<label class="radio-inline">
					<input type="radio" name="revtheme_catalog_stiker[status]" value="1" <?php if ($revtheme_catalog_stiker['status']) { echo 'checked'; } ?> /><span>Да</span>
				</label>
				<label class="radio-inline">
					<input type="radio" name="revtheme_catalog_stiker[status]" value="0" <?php if (!$revtheme_catalog_stiker['status']) { echo 'checked';} ?> /><span>Нет</span>
				</label>
			</div>
		</div>
		<div class="form-group">
			<label class="col-sm-2 control-label">Стикер "Новинка":</label>
			<div class="col-sm-3">
				<label class="radio-inline">
					<input type="radio" name="revtheme_catalog_stiker[new_status]" value="1" <?php if ($revtheme_catalog_stiker['new_status']) { echo 'checked'; } ?> /><span>Вкл.</span>
				</label>
				<label class="radio-inline">
					<input type="radio" name="revtheme_catalog_stiker[new_status]" value="0" <?php if (!$revtheme_catalog_stiker['new_status']) { echo 'checked';} ?> /><span>Выкл.</span>
				</label>
			</div>
		</div>
		<div class="form-group">
			<label class="col-sm-2 control-label">Стикер "Хит":</label>
			<div class="col-sm-3">
				<label class="radio-inline">
					<input type="radio" name="revtheme_catalog_stiker[best_status]" value="1" <?php if ($revtheme_catalog_stiker['best_status']) { echo 'checked'; } ?> /><span>Вкл.</span>
				</label>
				<label class="radio-inline">
					<input type="radio" name="revtheme_catalog_stiker[best_status]" value="0" <?php if (!$revtheme_catalog_stiker['best_status']) { echo 'checked';} ?> /><span>Выкл.</span>
				</label>
			</div>
		</div>
		<div class="form-group">
			<label class="col-sm-2 control-label">Стикер "Акция":</label>
			<div class="col-sm-3">
				<label class="radio-inline">
					<input type="radio" name="revtheme_catalog_stiker[spec_status]" value="1" <?php if ($revtheme_catalog_stiker['spec_status']) { echo 'checked'; } ?> /><span>Вкл.</span>
				</label>
				<label class="radio-inline">
					<input type="radio" name="revtheme_catalog_stiker[spec_status]" value="0" <?php if (!$revtheme_catalog_stiker['spec_status']) { echo 'checked';} ?> /><span>Выкл.</span>
				</label>
			</div>
		</div>
		<div class="form-group">
			<label class="col-sm-2 control-label">Стикер "Нет в наличии":</label>
			<div class="col-sm-3">
				<label class="radio-inline">
					<input type="radio" name="revtheme_catalog_stiker[stock_status]" value="1" <?php if ($revtheme_catalog_stiker['stock_status']) { echo 'checked'; } ?> /><span>Вкл.</span>
				</label>
				<label class="radio-inline">
					<input type="radio" name="revtheme_catalog_stiker[stock_status]" value="0" <?php if (!$revtheme_catalog_stiker['stock_status']) { echo 'checked';} ?> /><span>Выкл.</span>
				</label>
			</div>
			<label class="col-sm-2 control-label">Заменить на статус товара:</label>
			<div class="col-sm-3">
				<label class="radio-inline">
					<input type="radio" name="revtheme_catalog_stiker[stiker_netu_stock]" value="1" <?php if ($revtheme_catalog_stiker['stiker_netu_stock']) { echo 'checked'; } ?> /><span>Да</span>
				</label>
				<label class="radio-inline">
					<input type="radio" name="revtheme_catalog_stiker[stiker_netu_stock]" value="0" <?php if (!$revtheme_catalog_stiker['stiker_netu_stock']) { echo 'checked';} ?> /><span>Нет</span>
				</label>
			</div>
		</div>
		<div class="form-group">
			<label class="col-sm-2 control-label">Поле UPC как стикер:</label>
			<div class="col-sm-3">
				<label class="radio-inline">
					<input type="radio" name="revtheme_catalog_stiker[upc]" value="1" <?php if ($revtheme_catalog_stiker['upc']) { echo 'checked'; } ?> /><span>Да</span>
				</label>
				<label class="radio-inline">
					<input type="radio" name="revtheme_catalog_stiker[upc]" value="0" <?php if (!$revtheme_catalog_stiker['upc']) { echo 'checked';} ?> /><span>Нет</span>
				</label>
			</div>
		</div>
		<div class="form-group">
			<label class="col-sm-2 control-label">Поле EAN как стикер:</label>
			<div class="col-sm-3">
				<label class="radio-inline">
					<input type="radio" name="revtheme_catalog_stiker[ean]" value="1" <?php if ($revtheme_catalog_stiker['ean']) { echo 'checked'; } ?> /><span>Да</span>
				</label>
				<label class="radio-inline">
					<input type="radio" name="revtheme_catalog_stiker[ean]" value="0" <?php if (!$revtheme_catalog_stiker['ean']) { echo 'checked';} ?> /><span>Нет</span>
				</label>
			</div>
		</div>
		<div class="form-group">
			<label class="col-sm-2 control-label">Поле JAN как стикер:</label>
			<div class="col-sm-3">
				<label class="radio-inline">
					<input type="radio" name="revtheme_catalog_stiker[jan]" value="1" <?php if ($revtheme_catalog_stiker['jan']) { echo 'checked'; } ?> /><span>Да</span>
				</label>
				<label class="radio-inline">
					<input type="radio" name="revtheme_catalog_stiker[jan]" value="0" <?php if (!$revtheme_catalog_stiker['jan']) { echo 'checked';} ?> /><span>Нет</span>
				</label>
			</div>
		</div>
		<div class="form-group">
			<label class="col-sm-2 control-label">Поле ISBN как стикер:</label>
			<div class="col-sm-3">
				<label class="radio-inline">
					<input type="radio" name="revtheme_catalog_stiker[isbn]" value="1" <?php if ($revtheme_catalog_stiker['isbn']) { echo 'checked'; } ?> /><span>Да</span>
				</label>
				<label class="radio-inline">
					<input type="radio" name="revtheme_catalog_stiker[isbn]" value="0" <?php if (!$revtheme_catalog_stiker['isbn']) { echo 'checked';} ?> /><span>Нет</span>
				</label>
			</div>
		</div>
		<div class="form-group">
			<label class="col-sm-2 control-label">Поле MPN как стикер:</label>
			<div class="col-sm-3">
				<label class="radio-inline">
					<input type="radio" name="revtheme_catalog_stiker[mpn]" value="1" <?php if ($revtheme_catalog_stiker['mpn']) { echo 'checked'; } ?> /><span>Да</span>
				</label>
				<label class="radio-inline">
					<input type="radio" name="revtheme_catalog_stiker[mpn]" value="0" <?php if (!$revtheme_catalog_stiker['mpn']) { echo 'checked';} ?> /><span>Нет</span>
				</label>
			</div>
		</div>
		<div class="form-group">
			<label class="col-sm-2 control-label">Стикер "Новинка":</label>
			<label class="col-sm-2 control-label">Цвет фона:</label>
			<div class="col-sm-2">
				<input class="jscolor form-control" name="revtheme_catalog_stiker[last_color]" value="<?php echo isset($revtheme_catalog_stiker['last_color']) ? $revtheme_catalog_stiker['last_color'] : ''; ?>" />
			</div>
			<label class="col-sm-2 control-label">Цвет текста:</label>
			<div class="col-sm-2">
				<input class="jscolor form-control" name="revtheme_catalog_stiker[last_color_text]" value="<?php echo isset($revtheme_catalog_stiker['last_color_text']) ? $revtheme_catalog_stiker['last_color_text'] : ''; ?>" />
			</div>
		</div>
		<div class="form-group">
			<label class="col-sm-2 control-label">Стикер "Хит":</label>
			<label class="col-sm-2 control-label">Цвет фона:</label>
			<div class="col-sm-2">
				<input class="jscolor form-control" name="revtheme_catalog_stiker[best_color]" value="<?php echo isset($revtheme_catalog_stiker['best_color']) ? $revtheme_catalog_stiker['best_color'] : ''; ?>" />
			</div>
			<label class="col-sm-2 control-label">Цвет текста:</label>
			<div class="col-sm-2">
				<input class="jscolor form-control" name="revtheme_catalog_stiker[best_color_text]" value="<?php echo isset($revtheme_catalog_stiker['best_color_text']) ? $revtheme_catalog_stiker['best_color_text'] : ''; ?>" />
			</div>
		</div>
		<div class="form-group">
			<label class="col-sm-2 control-label">Стикер "Акция":</label>
			<label class="col-sm-2 control-label">Цвет фона:</label>
			<div class="col-sm-2">
				<input class="jscolor form-control" name="revtheme_catalog_stiker[spec_color]" value="<?php echo isset($revtheme_catalog_stiker['spec_color']) ? $revtheme_catalog_stiker['spec_color'] : ''; ?>" />
			</div>
			<label class="col-sm-2 control-label">Цвет текста:</label>
			<div class="col-sm-2">
				<input class="jscolor form-control" name="revtheme_catalog_stiker[spec_color_text]" value="<?php echo isset($revtheme_catalog_stiker['spec_color_text']) ? $revtheme_catalog_stiker['spec_color_text'] : ''; ?>" />
			</div>
		</div>
		<div class="form-group">
			<label class="col-sm-2 control-label">Стикер "Нет в наличии":</label>
			<label class="col-sm-2 control-label">Цвет фона:</label>
			<div class="col-sm-2">
				<input class="jscolor form-control" name="revtheme_catalog_stiker[netu_color]" value="<?php echo isset($revtheme_catalog_stiker['netu_color']) ? $revtheme_catalog_stiker['netu_color'] : ''; ?>" />
			</div>
			<label class="col-sm-2 control-label">Цвет текста:</label>
			<div class="col-sm-2">
				<input class="jscolor form-control" name="revtheme_catalog_stiker[netu_color_text]" value="<?php echo isset($revtheme_catalog_stiker['netu_color_text']) ? $revtheme_catalog_stiker['netu_color_text'] : ''; ?>" />
			</div>
		</div>
		<div class="form-group">
			<label class="col-sm-2 control-label">Пользовательские стикеры:</label>
			<label class="col-sm-2 control-label">Цвет фона:</label>
			<div class="col-sm-2">
				<input class="jscolor form-control" name="revtheme_catalog_stiker[user_color]" value="<?php echo isset($revtheme_catalog_stiker['user_color']) ? $revtheme_catalog_stiker['user_color'] : ''; ?>" />
			</div>
			<label class="col-sm-2 control-label">Цвет текста:</label>
			<div class="col-sm-2">
				<input class="jscolor form-control" name="revtheme_catalog_stiker[user_color_text]" value="<?php echo isset($revtheme_catalog_stiker['user_color_text']) ? $revtheme_catalog_stiker['user_color_text'] : ''; ?>" />
			</div>
		</div>
	</div>
	<div class="tab-pane text-style" id="tab_cat_popuporder">
		<div class="form-group">
			<label class="col-sm-2 control-label">Включить:</label>
			<div class="col-sm-3">
				<label class="radio-inline">
					<input type="radio" name="revtheme_catalog_popuporder[status]" value="1" <?php if ($revtheme_catalog_popuporder['status']) { echo 'checked'; } ?> /><span>Да</span>
				</label>
				<label class="radio-inline">
					<input type="radio" name="revtheme_catalog_popuporder[status]" value="0" <?php if (!$revtheme_catalog_popuporder['status']) { echo 'checked';} ?> /><span>Нет</span>
				</label>
			</div>
		</div>
		<div class="form-group">
			<label class="col-sm-2 control-label" for="input-firstname">Имя</label>
			<div class="col-sm-3">
			  <select name="revtheme_catalog_popuporder[firstname]" id="input-firstname" class="form-control">
				<?php if ($revtheme_catalog_popuporder['firstname'] == 1) { ?>
				<option value="1" selected="selected"><?php echo $text_enabled; ?></option>
				<option value="2">Включено и обязательно</option>
				<option value="0"><?php echo $text_disabled; ?></option>
				<?php } else if ($revtheme_catalog_popuporder['firstname'] == 2) { ?>
				<option value="1"><?php echo $text_enabled; ?></option>
				<option value="2" selected="selected">Включено и обязательно</option>
				<option value="0"><?php echo $text_disabled; ?></option>
				<?php } else { ?>
				<option value="1"><?php echo $text_enabled; ?></option>
				<option value="2">Включено и обязательно</option>
				<option value="0" selected="selected"><?php echo $text_disabled; ?></option>
				<?php } ?>
			  </select>
			</div>
		</div>
		<div class="form-group">
			<label class="col-sm-2 control-label" for="input-telephone">Телефон</label>
			<div class="col-sm-3">
			  <select name="revtheme_catalog_popuporder[telephone]" id="input-telephone" class="form-control">
				<?php if ($revtheme_catalog_popuporder['telephone'] == 1) { ?>
				<option value="1" selected="selected"><?php echo $text_enabled; ?></option>
				<option value="2">Включено и обязательно</option>
				<option value="0"><?php echo $text_disabled; ?></option>
				<?php } else if ($revtheme_catalog_popuporder['telephone'] == 2) { ?>
				<option value="1"><?php echo $text_enabled; ?></option>
				<option value="2" selected="selected">Включено и обязательно</option>
				<option value="0"><?php echo $text_disabled; ?></option>
				<?php } else { ?>
				<option value="1"><?php echo $text_enabled; ?></option>
				<option value="2">Включено и обязательно</option>
				<option value="0" selected="selected"><?php echo $text_disabled; ?></option>
				<?php } ?>
			  </select>
			</div>
		</div>
		<div class="form-group">
			<label class="col-sm-2 control-label">Маска для телефона:</label>
			<div class="col-sm-3">
				<input class="form-control" name="revtheme_catalog_popuporder[telephone_mask]" value="<?php echo isset($revtheme_catalog_popuporder['telephone_mask']) ? $revtheme_catalog_popuporder['telephone_mask'] : ''; ?>" />
			</div>
		</div>
		<div class="form-group">
			<label class="col-sm-2 control-label" for="input-email">E-mail</label>
			<div class="col-sm-3">
			  <select name="revtheme_catalog_popuporder[email]" id="input-email" class="form-control">
				<?php if ($revtheme_catalog_popuporder['email'] == 1) { ?>
				<option value="1" selected="selected"><?php echo $text_enabled; ?></option>
				<option value="2">Включено и обязательно</option>
				<option value="0"><?php echo $text_disabled; ?></option>
				<?php } else if ($revtheme_catalog_popuporder['email'] == 2) { ?>
				<option value="1"><?php echo $text_enabled; ?></option>
				<option value="2" selected="selected">Включено и обязательно</option>
				<option value="0"><?php echo $text_disabled; ?></option>
				<?php } else { ?>
				<option value="1"><?php echo $text_enabled; ?></option>
				<option value="2">Включено и обязательно</option>
				<option value="0" selected="selected"><?php echo $text_disabled; ?></option>
				<?php } ?>
			  </select>
			</div>
		</div>		  
		<div class="form-group">
			<label class="col-sm-2 control-label" for="input-comment">Комментарий</label>
			<div class="col-sm-3">
			  <select name="revtheme_catalog_popuporder[comment]" id="input-comment" class="form-control">
				<?php if ($revtheme_catalog_popuporder['comment'] == 1) { ?>
				<option value="1" selected="selected"><?php echo $text_enabled; ?></option>
				<option value="2">Включено и обязательно</option>
				<option value="0"><?php echo $text_disabled; ?></option>
				<?php } else if ($revtheme_catalog_popuporder['comment'] == 2) { ?>
				<option value="1"><?php echo $text_enabled; ?></option>
				<option value="2" selected="selected">Включено и обязательно</option>
				<option value="0"><?php echo $text_disabled; ?></option>
				<?php } else { ?>
				<option value="1"><?php echo $text_enabled; ?></option>
				<option value="2">Включено и обязательно</option>
				<option value="0" selected="selected"><?php echo $text_disabled; ?></option>
				<?php } ?>
			  </select>
			</div>
		</div>
		<div class="form-group">
			<label class="col-sm-2 control-label">Статус нового заказа:</label>
			<div class="col-sm-3">
			<select name="revtheme_catalog_popuporder[order_status]" class="form-control">
			  <?php foreach ($order_statuses as $order_status) { ?>
			  <?php if ($order_status['order_status_id'] == $revtheme_catalog_popuporder['order_status']) { ?>
			  <option value="<?php echo $order_status['order_status_id']; ?>" selected="selected"><?php echo $order_status['name']; ?></option>
			  <?php } else { ?>
			  <option value="<?php echo $order_status['order_status_id']; ?>"><?php echo $order_status['name']; ?></option>
			  <?php } ?>
			  <?php } ?>
			</select>
		  </div>
		</div>
	</div>
	<div class="tab-pane text-style" id="tab_cat_compare">
		<div class="form-group">
			<label class="col-sm-2 control-label">Разбиение по вкладкам-категориям на странице сравнения:
			</label>
			<div class="col-sm-3">
				<label class="radio-inline">
					<input type="radio" name="revtheme_cat_compare[cat_sort]" value="1" <?php if ($revtheme_cat_compare['cat_sort']) { echo 'checked'; } ?> /><span>Да</span>
				</label>
				<label class="radio-inline">
					<input type="radio" name="revtheme_cat_compare[cat_sort]" value="0" <?php if (!$revtheme_cat_compare['cat_sort']) { echo 'checked';} ?> /><span>Нет</span>
				</label>
			</div>
		</div>
		<div class="form-group">
			<label class="col-sm-2 control-label">У товаров используется "Главная категория":
			</label>
			<div class="col-sm-3">
				<label class="radio-inline">
					<input type="radio" name="revtheme_cat_compare[main_cat]" value="1" <?php if ($revtheme_cat_compare['main_cat']) { echo 'checked'; } ?> /><span>Да</span>
				</label>
				<label class="radio-inline">
					<input type="radio" name="revtheme_cat_compare[main_cat]" value="0" <?php if (!$revtheme_cat_compare['main_cat']) { echo 'checked';} ?> /><span>Нет</span>
				</label>
			</div>
		</div>
		<div class="form-group">
			<label class="col-sm-2 control-label">Показывать в сравнении:
			</label>
		</div>	
		<div class="form-group" style="border-top: none; padding: 5px 0;">	
			<label class="col-sm-2 control-label">Цена:
			</label>
			<div class="col-sm-3">
				<label class="radio-inline">
					<input type="radio" name="revtheme_cat_compare[compare_price]" value="1" <?php if ($revtheme_cat_compare['compare_price']) { echo 'checked'; } ?> /><span>Да</span>
				</label>
				<label class="radio-inline">
					<input type="radio" name="revtheme_cat_compare[compare_price]" value="0" <?php if (!$revtheme_cat_compare['compare_price']) { echo 'checked';} ?> /><span>Нет</span>
				</label>
			</div>
		</div>
		<div class="form-group" style="border-top: none; padding: 5px 0;">	
			<label class="col-sm-2 control-label">Модель:
			</label>
			<div class="col-sm-3">
				<label class="radio-inline">
					<input type="radio" name="revtheme_cat_compare[compare_model]" value="1" <?php if ($revtheme_cat_compare['compare_model']) { echo 'checked'; } ?> /><span>Да</span>
				</label>
				<label class="radio-inline">
					<input type="radio" name="revtheme_cat_compare[compare_model]" value="0" <?php if (!$revtheme_cat_compare['compare_model']) { echo 'checked';} ?> /><span>Нет</span>
				</label>
			</div>
		</div>
		<div class="form-group" style="border-top: none; padding: 5px 0;">	
			<label class="col-sm-2 control-label">Артикул:
			</label>
			<div class="col-sm-3">
				<label class="radio-inline">
					<input type="radio" name="revtheme_cat_compare[compare_sku]" value="1" <?php if ($revtheme_cat_compare['compare_sku']) { echo 'checked'; } ?> /><span>Да</span>
				</label>
				<label class="radio-inline">
					<input type="radio" name="revtheme_cat_compare[compare_sku]" value="0" <?php if (!$revtheme_cat_compare['compare_sku']) { echo 'checked';} ?> /><span>Нет</span>
				</label>
			</div>
		</div>
		<div class="form-group" style="border-top: none; padding: 5px 0;">	
			<label class="col-sm-2 control-label">Производитель:
			</label>
			<div class="col-sm-3">
				<label class="radio-inline">
					<input type="radio" name="revtheme_cat_compare[compare_manuf]" value="1" <?php if ($revtheme_cat_compare['compare_manuf']) { echo 'checked'; } ?> /><span>Да</span>
				</label>
				<label class="radio-inline">
					<input type="radio" name="revtheme_cat_compare[compare_manuf]" value="0" <?php if (!$revtheme_cat_compare['compare_manuf']) { echo 'checked';} ?> /><span>Нет</span>
				</label>
			</div>
		</div>
		<div class="form-group" style="border-top: none; padding: 5px 0;">	
			<label class="col-sm-2 control-label">Наличие:
			</label>
			<div class="col-sm-3">
				<label class="radio-inline">
					<input type="radio" name="revtheme_cat_compare[compare_stock]" value="1" <?php if ($revtheme_cat_compare['compare_stock']) { echo 'checked'; } ?> /><span>Да</span>
				</label>
				<label class="radio-inline">
					<input type="radio" name="revtheme_cat_compare[compare_stock]" value="0" <?php if (!$revtheme_cat_compare['compare_stock']) { echo 'checked';} ?> /><span>Нет</span>
				</label>
			</div>
		</div>
		<div class="form-group" style="border-top: none; padding: 5px 0;">	
			<label class="col-sm-2 control-label">Рейтинг:
			</label>
			<div class="col-sm-3">
				<label class="radio-inline">
					<input type="radio" name="revtheme_cat_compare[compare_rate]" value="1" <?php if ($revtheme_cat_compare['compare_rate']) { echo 'checked'; } ?> /><span>Да</span>
				</label>
				<label class="radio-inline">
					<input type="radio" name="revtheme_cat_compare[compare_rate]" value="0" <?php if (!$revtheme_cat_compare['compare_rate']) { echo 'checked';} ?> /><span>Нет</span>
				</label>
			</div>
		</div>
		<div class="form-group" style="border-top: none; padding: 5px 0;">	
			<label class="col-sm-2 control-label">Краткое описание:
			</label>
			<div class="col-sm-3">
				<label class="radio-inline">
					<input type="radio" name="revtheme_cat_compare[compare_srtdesc]" value="1" <?php if ($revtheme_cat_compare['compare_srtdesc']) { echo 'checked'; } ?> /><span>Да</span>
				</label>
				<label class="radio-inline">
					<input type="radio" name="revtheme_cat_compare[compare_srtdesc]" value="0" <?php if (!$revtheme_cat_compare['compare_srtdesc']) { echo 'checked';} ?> /><span>Нет</span>
				</label>
			</div>
		</div>
		<div class="form-group" style="border-top: none; padding: 5px 0;">	
			<label class="col-sm-2 control-label">Вес:
			</label>
			<div class="col-sm-3">
				<label class="radio-inline">
					<input type="radio" name="revtheme_cat_compare[compare_weight]" value="1" <?php if ($revtheme_cat_compare['compare_weight']) { echo 'checked'; } ?> /><span>Да</span>
				</label>
				<label class="radio-inline">
					<input type="radio" name="revtheme_cat_compare[compare_weight]" value="0" <?php if (!$revtheme_cat_compare['compare_weight']) { echo 'checked';} ?> /><span>Нет</span>
				</label>
			</div>
		</div>
		<div class="form-group" style="border-top: none; padding: 5px 0;">	
			<label class="col-sm-2 control-label">Размеры:
			</label>
			<div class="col-sm-3">
				<label class="radio-inline">
					<input type="radio" name="revtheme_cat_compare[compare_razmer]" value="1" <?php if ($revtheme_cat_compare['compare_razmer']) { echo 'checked'; } ?> /><span>Да</span>
				</label>
				<label class="radio-inline">
					<input type="radio" name="revtheme_cat_compare[compare_razmer]" value="0" <?php if (!$revtheme_cat_compare['compare_razmer']) { echo 'checked';} ?> /><span>Нет</span>
				</label>
			</div>
		</div>
		<div class="form-group" style="border-top: none; padding: 5px 0;">	
			<label class="col-sm-2 control-label">Атрибуты:
			</label>
			<div class="col-sm-3">
				<label class="radio-inline">
					<input type="radio" name="revtheme_cat_compare[compare_atrib]" value="1" <?php if ($revtheme_cat_compare['compare_atrib']) { echo 'checked'; } ?> /><span>Да</span>
				</label>
				<label class="radio-inline">
					<input type="radio" name="revtheme_cat_compare[compare_atrib]" value="0" <?php if (!$revtheme_cat_compare['compare_atrib']) { echo 'checked';} ?> /><span>Нет</span>
				</label>
			</div>
		</div>
		<div class="form-group" style="border-top: none; padding: 5px 0;">	
			<label class="col-sm-2 control-label">Группы атрибутов:
			</label>
			<div class="col-sm-3">
				<label class="radio-inline">
					<input type="radio" name="revtheme_cat_compare[compare_atribgr]" value="1" <?php if ($revtheme_cat_compare['compare_atribgr']) { echo 'checked'; } ?> /><span>Да</span>
				</label>
				<label class="radio-inline">
					<input type="radio" name="revtheme_cat_compare[compare_atribgr]" value="0" <?php if (!$revtheme_cat_compare['compare_atribgr']) { echo 'checked';} ?> /><span>Нет</span>
				</label>
			</div>
		</div>
	</div>
	<div class="tab-pane text-style" id="tab_cat_mods">
		<div class="form-group">
			<div class="col-sm-12">
				<div class="form-group">
					<label class="col-sm-2 control-label">Просмотренные товары:
					</label>
					<div class="col-sm-2">
						<label class="radio-inline">
							<input type="radio" name="revtheme_cat_mods[viewed_products]" value="1" <?php if ($revtheme_cat_mods['viewed_products']) { echo 'checked'; } ?> /><span>Вкл.</span>
						</label>
						<label class="radio-inline">
							<input type="radio" name="revtheme_cat_mods[viewed_products]" value="0" <?php if (!$revtheme_cat_mods['viewed_products']) { echo 'checked';} ?> /><span>Выкл.</span>
						</label>
					</div>
				</div>
			</div>
			<div class="col-sm-12">
				<div class="form-group">
					<label class="col-sm-2 control-label">Заголовок:</label>
					<div class="col-sm-3">
						<?php foreach ($languages as $language) { ?>
							<div class="input-group">
								<span class="input-group-addon"><img src="<?php echo (VERSION >= 2.2) ? 'language/'.$language['code'].'/'.$language['code'].'.png' : 'view/image/flags/'.$language['image']; ?>" title="<?php echo $language['name']; ?>" /></span>
								<input type="text" name="revtheme_cat_mods[<?php echo $language['language_id']; ?>][viewed_products_zagolovok]" value="<?php echo(isset($revtheme_cat_mods[$language['language_id']]['viewed_products_zagolovok']) ? $revtheme_cat_mods[$language['language_id']]['viewed_products_zagolovok'] : 'Вы смотрели') ?>" class="form-control" />
							</div>
						<?php } ?>
					</div>
				</div>
			</div>
			<div class="col-sm-12">
				<div class="form-group">
					<label class="col-sm-2 control-label">Лимит товаров:</label>
					<div class="col-sm-3">
						<input type="text" name="revtheme_cat_mods[viewed_products_limit]" value="<?php echo $revtheme_cat_mods['viewed_products_limit']; ?>" class="form-control" />
					</div>
				</div>
			</div>
		</div>
	</div>
	<div class="tab-pane text-style" id="tab_cat_attributes">
		<div class="form-group">
			<label class="col-sm-2 control-label">Включить описание товара в каталоге:
			</label>
			<div class="col-sm-2">
				<label class="radio-inline">
					<input type="radio" name="revtheme_cat_attributes[description_on]" value="1" <?php if ($revtheme_cat_attributes['description_on']) { echo 'checked'; } ?> /><span>Да</span>
				</label>
				<label class="radio-inline">
					<input type="radio" name="revtheme_cat_attributes[description_on]" value="0" <?php if (!$revtheme_cat_attributes['description_on']) { echo 'checked';} ?> /><span>Нет</span>
				</label>
			</div>
			<label class="col-sm-2 control-label">Показывать при отображении сеткой:
			</label>
			<div class="col-sm-2">
				<label class="radio-inline">
					<input type="radio" name="revtheme_cat_attributes[description_in_grid]" value="1" <?php if ($revtheme_cat_attributes['description_in_grid']) { echo 'checked'; } ?> /><span>Да</span>
				</label>
				<label class="radio-inline">
					<input type="radio" name="revtheme_cat_attributes[description_in_grid]" value="0" <?php if (!$revtheme_cat_attributes['description_in_grid']) { echo 'checked';} ?> /><span>Нет</span>
				</label>
			</div>
		</div>
		<div class="form-group">
			<label class="col-sm-2 control-label">Выбор опций в каталоге:
			</label>
			<div class="col-sm-2">
				<label class="radio-inline">
					<input type="radio" name="revtheme_cat_attributes[options_in_cat]" value="1" <?php if ($revtheme_cat_attributes['options_in_cat']) { echo 'checked'; } ?> /><span>Да</span>
				</label>
				<label class="radio-inline">
					<input type="radio" name="revtheme_cat_attributes[options_in_cat]" value="0" <?php if (!$revtheme_cat_attributes['options_in_cat']) { echo 'checked';} ?> /><span>Нет</span>
				</label>
			</div>
			<label class="col-sm-2 control-label">Выбор опций при отображении сеткой:
			</label>
			<div class="col-sm-2">
				<label class="radio-inline">
					<input type="radio" name="revtheme_cat_attributes[options_in_grid]" value="1" <?php if ($revtheme_cat_attributes['options_in_grid']) { echo 'checked'; } ?> /><span>Да</span>
				</label>
				<label class="radio-inline">
					<input type="radio" name="revtheme_cat_attributes[options_in_grid]" value="0" <?php if (!$revtheme_cat_attributes['options_in_grid']) { echo 'checked';} ?> /><span>Нет</span>
				</label>
			</div>
		</div>
		<div class="form-group">
			<label class="col-sm-2 control-label">Заменить описание на характеристики:
			</label>
			<div class="col-sm-2">
				<label class="radio-inline">
					<input type="radio" id="zavisimost5_radio" onChange="zavisimost5(this)" name="revtheme_cat_attributes[zamena_description]" value="1" <?php if ($revtheme_cat_attributes['zamena_description']) { echo 'checked'; } ?> /><span>Да</span>
				</label>
				<label class="radio-inline">
					<input type="radio" id="zavisimost5_radio" onChange="zavisimost5(this)" name="revtheme_cat_attributes[zamena_description]" value="0" <?php if (!$revtheme_cat_attributes['zamena_description']) { echo 'checked';} ?> /><span>Нет</span>
				</label>
			</div>
		</div>
		<hr>
		<div id="zavisimost5" style="display:none;">
			<div class="form-group">
				<label class="col-sm-2 control-label">Показывать модель:
				</label>
				<div class="col-sm-2">
					<label class="radio-inline">
						<input type="radio" name="revtheme_cat_attributes[model]" value="1" <?php if ($revtheme_cat_attributes['model']) { echo 'checked'; } ?> /><span>Да</span>
					</label>
					<label class="radio-inline">
						<input type="radio" name="revtheme_cat_attributes[model]" value="0" <?php if (!$revtheme_cat_attributes['model']) { echo 'checked';} ?> /><span>Нет</span>
					</label>
				</div>
			</div>
			<div class="form-group">
				<label class="col-sm-2 control-label">Показывать артикул (sku):
				</label>
				<div class="col-sm-2">
					<label class="radio-inline">
						<input type="radio" name="revtheme_cat_attributes[sku]" value="1" <?php if ($revtheme_cat_attributes['sku']) { echo 'checked'; } ?> /><span>Да</span>
					</label>
					<label class="radio-inline">
						<input type="radio" name="revtheme_cat_attributes[sku]" value="0" <?php if (!$revtheme_cat_attributes['sku']) { echo 'checked';} ?> /><span>Нет</span>
					</label>
				</div>
			</div>
			<div class="form-group">
				<label class="col-sm-2 control-label">Показывать наличие:
				</label>
				<div class="col-sm-2">
					<label class="radio-inline">
						<input type="radio" name="revtheme_cat_attributes[stock]" value="1" <?php if ($revtheme_cat_attributes['stock']) { echo 'checked'; } ?> /><span>Да</span>
					</label>
					<label class="radio-inline">
						<input type="radio" name="revtheme_cat_attributes[stock]" value="0" <?php if (!$revtheme_cat_attributes['stock']) { echo 'checked';} ?> /><span>Нет</span>
					</label>
				</div>
			</div>
			<div class="form-group">
				<label class="col-sm-2 control-label">Показывать размеры:
				</label>
				<div class="col-sm-2">
					<label class="radio-inline">
						<input type="radio" name="revtheme_cat_attributes[length]" value="1" <?php if ($revtheme_cat_attributes['length']) { echo 'checked'; } ?> /><span>Да</span>
					</label>
					<label class="radio-inline">
						<input type="radio" name="revtheme_cat_attributes[length]" value="0" <?php if (!$revtheme_cat_attributes['length']) { echo 'checked';} ?> /><span>Нет</span>
					</label>
				</div>
			</div>
			<div class="form-group">
				<label class="col-sm-2 control-label">Показывать вес:
				</label>
				<div class="col-sm-2">
					<label class="radio-inline">
						<input type="radio" name="revtheme_cat_attributes[weight]" value="1" <?php if ($revtheme_cat_attributes['weight']) { echo 'checked'; } ?> /><span>Да</span>
					</label>
					<label class="radio-inline">
						<input type="radio" name="revtheme_cat_attributes[weight]" value="0" <?php if (!$revtheme_cat_attributes['weight']) { echo 'checked';} ?> /><span>Нет</span>
					</label>
				</div>
			</div>
			<div class="form-group">
				<label class="col-sm-2 control-label">Показывать атрибуты:
				</label>
				<div class="col-sm-2">
					<label class="radio-inline">
						<input type="radio" id="zavisimost6_radio" onChange="zavisimost6(this)" name="revtheme_cat_attributes[attributes_status]" value="1" <?php if ($revtheme_cat_attributes['attributes_status']) { echo 'checked'; } ?> /><span>Да</span>
					</label>
					<label class="radio-inline">
						<input type="radio" id="zavisimost6_radio" onChange="zavisimost6(this)" name="revtheme_cat_attributes[attributes_status]" value="0" <?php if (!$revtheme_cat_attributes['attributes_status']) { echo 'checked';} ?> /><span>Нет</span>
					</label>
				</div>
			</div>
			<hr>
			<div id="zavisimost6" style="display:none;">
				<div class="form-group">
					<label class="col-sm-2 control-label">Показывать название атрибута:
					</label>
					<div class="col-sm-2">
						<label class="radio-inline">
							<input type="radio" name="revtheme_cat_attributes[show_name]" value="1" <?php if ($revtheme_cat_attributes['show_name']) { echo 'checked'; } ?> /><span>Да</span>
						</label>
						<label class="radio-inline">
							<input type="radio" name="revtheme_cat_attributes[show_name]" value="0" <?php if (!$revtheme_cat_attributes['show_name']) { echo 'checked';} ?> /><span>Нет</span>
						</label>
					</div>
				</div>
				<div class="form-group">
					<label class="col-sm-2 control-label">Добавить теги к тексту:
					</label>
					<div class="col-sm-2">
						<label class="radio-inline">
							<input type="radio" name="revtheme_cat_attributes[show_tags]" value="1" <?php if ($revtheme_cat_attributes['show_tags']) { echo 'checked'; } ?> /><span>Да</span>
						</label>
						<label class="radio-inline">
							<input type="radio" name="revtheme_cat_attributes[show_tags]" value="0" <?php if (!$revtheme_cat_attributes['show_tags']) { echo 'checked';} ?> /><span>Нет</span>
						</label>
					</div>
				</div>
				<div class="form-group">
					<label class="col-sm-2 control-label">Показывать количество атрибутов, 0 - показать все:
					</label>
					<div class="col-sm-2">
						<input type="text" name="revtheme_cat_attributes[count]" value="<?php echo $revtheme_cat_attributes['count']; ?>" class="form-control" />
					</div>
				</div>
				<div class="form-group">
					<label class="col-sm-2 control-label">Разделитель атрибутов:
					</label>
					<div class="col-sm-2">
						<input type="text" name="revtheme_cat_attributes[separator]" value="<?php echo $revtheme_cat_attributes['separator']; ?>" class="form-control" />
					</div>
				</div>
				<div class="form-group">
					<table class="table table-bordered table-hover">
						<thead>
							<tr>
								<td class="left">Группа</td>
								<td class="left">Атрибут</td>
								<td class="left">Показывать</td>
								<td class="left">Заменить значение атрибута на название</td>
							</tr>
						</thead>
						<tbody>
							<?php foreach($attributes as $attribute) {?>
								<tr>
									<td class="left"><?php echo $attribute['attribute_group']; ?></td>              
									<td class="left"><?php echo $attribute['name']; ?></td>              
									<td>
										<select class="form-control" name="revtheme_cat_attributes[attributes][<?php echo $attribute['attribute_id']; ?>][show]">
											<option value="0" <?php echo (isset($revtheme_cat_attributes['attributes'][$attribute['attribute_id']]['show']) && $revtheme_cat_attributes['attributes'][$attribute['attribute_id']]['show'] == '0') ? 'selected="selected"' : "" ;?>>Не показывать</option>
											<option value="1" <?php echo (isset($revtheme_cat_attributes['attributes'][$attribute['attribute_id']]['show']) && $revtheme_cat_attributes['attributes'][$attribute['attribute_id']]['show'] == '1') ? 'selected="selected"' : "" ;?>>Показывать</option>
											<option value="2" <?php echo (isset($revtheme_cat_attributes['attributes'][$attribute['attribute_id']]['show']) && $revtheme_cat_attributes['attributes'][$attribute['attribute_id']]['show'] == '2') ? 'selected="selected"' : "" ;?>>С заменой</option>
										</select>
									</td>
									<td class="left">
										<input type="text" class="form-control" name="revtheme_cat_attributes[attributes][<?php echo $attribute['attribute_id']; ?>][replace]" value="<?php echo isset($revtheme_cat_attributes['attributes'][$attribute['attribute_id']]['replace']) ? $revtheme_cat_attributes['attributes'][$attribute['attribute_id']]['replace'] : '';?>">
									</td>  
								</tr>
							<?php } ?>
						</tbody>
					</table>
				</div>
			</div>
		</div>
	</div>
	<!--
	<div class="tab-pane text-style" id="tab_cat_filter">
		<div class="form-group">
			<label class="col-sm-2 control-label">Включить:
			</label>
			<div class="col-sm-3">
				<label class="radio-inline">
					<input type="radio" name="revtheme_catalog_filter[status]" value="1" <?php if ($revtheme_catalog_filter['status']) { echo 'checked'; } ?> /><span>Да</span>
				</label>
				<label class="radio-inline">
					<input type="radio" name="revtheme_catalog_filter[status]" value="0" <?php if (!$revtheme_catalog_filter['status']) { echo 'checked';} ?> /><span>Нет</span>
				</label>
			</div>
		</div>
		<div class="form-group">
			<div class="well well-sm" style="height: 150px; overflow: auto;">
				<?php foreach ($categories as $category) { ?>
					<div class="checkbox">
						<label>
						<?php if (in_array($category['category_id'], $revtheme_catalog_filter_categories)) { ?>
							<input type="checkbox" name="revtheme_catalog_filter_categories[]" value="<?php echo $category['category_id']; ?>" checked="checked" />
							<?php echo $category['name']; ?>
						<?php } else { ?>
							<input type="checkbox" name="revtheme_catalog_filter_categories[]" value="<?php echo $category['category_id']; ?>" />
							<?php echo $category['name']; ?>
						<?php } ?>
						</label>
					</div>
				<?php } ?>
			</div>
				<a onclick="selectAll(this);">Выбрать все</a> / <a onclick="deselectAll(this);">Снять выделения</a>
				<script type="text/javascript">
				function selectAll(element) {
					$(element).parent().find(':checkbox').attr('checked', true);
				}
				function deselectAll(element) {
					$(element).parent().find(':checkbox').attr('checked', false);
				}
				</script>
		</div>
		<div class="form-group">
			<label class="col-sm-2 control-label">Налоги:</label>
			<div class="col-sm-3">
			  <input type="text" name="revtheme_catalog_filter[tax]" value="<?php echo $revtheme_catalog_filter['tax']; ?>" class="form-control" />
			</div>
		</div>
		<div class="form-group">
            <label class="col-sm-2 control-label" for="input-banner">Метод фильтрации:</label>
            <div class="col-sm-3">
              <select name="revtheme_catalog_filter[metod]" id="input-banner" class="form-control">
                <?php if ($revtheme_catalog_filter['metod'] == 'and') { ?>
                <option value="and" selected="selected">Только И</option>
				<option value="andor">И и ИЛИ</option>
                <?php } else { ?>
                <option value="and">Только И</option>
				<option value="andor" selected="selected">И и ИЛИ</option>
                <?php } ?>
              </select>
            </div>
        </div>
	</div>
	-->
</div>
</div>
<div class="tab-pane" id="tab_product">
<div class="col-sm-2">
		<nav class="nav-sidebar">
			<ul class="nav tabs">
				<li class="active"><a href="#tab_product_all" data-toggle="tab">Общие настройки</a></li>
				<li><a href="#tab_product_attribs" data-toggle="tab">Характеристики</a></li>
				<li><a href="#tab_product_options" data-toggle="tab">Опции</a></li>
				<li><a href="#tab_product_images" data-toggle="tab">Изображения</a></li>
				<li><a href="#tab_product_mods" data-toggle="tab">Модули</a></li>
			</ul>
		</nav>
	</div>	
	<div class="tab-content col-sm-10">
		<div class="tab-pane active text-style" id="tab_product_all">
			<div class="form-group">
				<label class="col-sm-2 control-label">Быстрый заказ в карточке товара:
				</label>
				<div class="col-sm-3">
					<label class="radio-inline">
						<input type="radio" name="revtheme_product_all[popup_purchase]" value="1" <?php if ($revtheme_product_all['popup_purchase']) { echo 'checked'; } ?> /><span>Вкл.</span>
					</label>
					<label class="radio-inline">
						<input type="radio" name="revtheme_product_all[popup_purchase]" value="0" <?php if (!$revtheme_product_all['popup_purchase']) { echo 'checked';} ?> /><span>Выкл.</span>
					</label>
				</div>
			</div>
			<div class="form-group">
				<label class="col-sm-2 control-label">Возможность заказа<br>при 0 кол-ве товара:
				</label>
				<div class="col-sm-2">
					<label class="radio-inline">
						<input type="radio" name="revtheme_product_all[zakaz]" value="1" <?php if ($revtheme_product_all['zakaz']) { echo 'checked'; } ?> /><span>Да</span>
					</label>
					<label class="radio-inline">
						<input type="radio" name="revtheme_product_all[zakaz]" value="0" <?php if (!$revtheme_product_all['zakaz']) { echo 'checked';} ?> /><span>Нет</span>
					</label>
				</div>
				<label class="col-sm-2 control-label">Возможность заказа<br>при 0 цене товара:
				</label>
				<div class="col-sm-2">
					<label class="radio-inline">
						<input type="radio" name="revtheme_product_all[zakaz_price_null]" value="1" <?php if ($revtheme_product_all['zakaz_price_null']) { echo 'checked'; } ?> /><span>Да</span>
					</label>
					<label class="radio-inline">
						<input type="radio" name="revtheme_product_all[zakaz_price_null]" value="0" <?php if (!$revtheme_product_all['zakaz_price_null']) { echo 'checked';} ?> /><span>Нет</span>
					</label>
				</div>
			</div>
			<div class="form-group">
				<label class="col-sm-2 control-label">Пересчет цены при изменении количества:
				</label>
				<div class="col-sm-3">
					<label class="radio-inline">
						<input type="radio" name="revtheme_product_all[recalc_price]" value="1" <?php if ($revtheme_product_all['recalc_price']) { echo 'checked'; } ?> /><span>Да</span>
					</label>
					<label class="radio-inline">
						<input type="radio" name="revtheme_product_all[recalc_price]" value="0" <?php if (!$revtheme_product_all['recalc_price']) { echo 'checked';} ?> /><span>Нет</span>
					</label>
				</div>
			</div>
			<div class="form-group">
				<label class="col-sm-2 control-label">Зависимость от количества на складе:
				</label>
				<div class="col-sm-3">
					<label class="radio-inline">
						<input type="radio" name="revtheme_product_all[q_zavisimost]" value="1" <?php if ($revtheme_product_all['q_zavisimost']) { echo 'checked'; } ?> /><span>Да</span>
					</label>
					<label class="radio-inline">
						<input type="radio" name="revtheme_product_all[q_zavisimost]" value="0" <?php if (!$revtheme_product_all['q_zavisimost']) { echo 'checked';} ?> /><span>Нет</span>
					</label>
				</div>
			</div>
			<div class="form-group">
				<label class="col-sm-2 control-label">Отображать цену опций:
				</label>
				<div class="col-sm-3">
					<label class="radio-inline">
						<input type="radio" name="revtheme_product_all[opt_price]" value="1" <?php if ($revtheme_product_all['opt_price']) { echo 'checked'; } ?> /><span>Да</span>
					</label>
					<label class="radio-inline">
						<input type="radio" name="revtheme_product_all[opt_price]" value="0" <?php if (!$revtheme_product_all['opt_price']) { echo 'checked';} ?> /><span>Нет</span>
					</label>
				</div>
			</div>
			<div class="form-group">
				<label class="col-sm-2 control-label">Показывать счетчик до конца акции:
				</label>
				<div class="col-sm-3">
					<label class="radio-inline">
						<input type="radio" name="revtheme_product_all[countdown]" value="1" <?php if ($revtheme_product_all['countdown']) { echo 'checked'; } ?> /><span>Да</span>
					</label>
					<label class="radio-inline">
						<input type="radio" name="revtheme_product_all[countdown]" value="0" <?php if (!$revtheme_product_all['countdown']) { echo 'checked';} ?> /><span>Нет</span>
					</label>
				</div>
			</div>
			<div class="form-group">
				<label class="col-sm-2 control-label">Рекомендуемые товары в правой колонке:
				</label>
				<div class="col-sm-3">
					<label class="radio-inline">
						<input type="radio" name="revtheme_product_all[recpr_rightc]" value="1" <?php if ($revtheme_product_all['recpr_rightc']) { echo 'checked'; } ?> /><span>Да</span>
					</label>
					<label class="radio-inline">
						<input type="radio" name="revtheme_product_all[recpr_rightc]" value="0" <?php if (!$revtheme_product_all['recpr_rightc']) { echo 'checked';} ?> /><span>Нет</span>
					</label>
				</div>
			</div>
			<div class="form-group">
				<label class="col-sm-2 control-label">Выводить кнопки соц. сетей:
				</label>
				<div class="col-sm-3">
					<label class="radio-inline">
						<input type="radio" name="revtheme_product_all[share_status]" value="1" <?php if ($revtheme_product_all['share_status']) { echo 'checked'; } ?> /><span>Вкл.</span>
					</label>
					<label class="radio-inline">
						<input type="radio" name="revtheme_product_all[share_status]" value="0" <?php if (!$revtheme_product_all['share_status']) { echo 'checked';} ?> /><span>Выкл.</span>
					</label>
				</div>
			</div>
			<div class="form-group">
				<label class="col-sm-2 control-label">Описание, характеристики и т.п. во вкладках:
				</label>
				<div class="col-sm-3">
					<label class="radio-inline">
						<input type="radio" name="revtheme_product_all[pr_tabs]" value="1" <?php if ($revtheme_product_all['pr_tabs']) { echo 'checked'; } ?> /><span>Вкл.</span>
					</label>
					<label class="radio-inline">
						<input type="radio" name="revtheme_product_all[pr_tabs]" value="0" <?php if (!$revtheme_product_all['pr_tabs']) { echo 'checked';} ?> /><span>Выкл.</span>
					</label>
				</div>
			</div>
		</div>
		<div class="tab-pane text-style" id="tab_product_attribs">
			<div class="form-group">
				<label class="col-sm-2 control-label">Характеристики:
				</label>
				<div class="col-sm-3">
					<label class="radio-inline">
						<input type="radio" id="atributs_zavisimost_radio" onChange="atributs_zavisimost(this)" name="revtheme_product_all[atributs]" value="1" <?php if ($revtheme_product_all['atributs']) { echo 'checked'; } ?> /><span>Справа от картинки</span>
					</label>
					<label class="radio-inline">
						<input type="radio" id="atributs_zavisimost_radio" onChange="atributs_zavisimost(this)" name="revtheme_product_all[atributs]" value="0" <?php if (!$revtheme_product_all['atributs']) { echo 'checked';} ?> /><span>Во вкладке</span>
					</label>
				</div>
			</div>
			<div class="form-group">
				<label class="col-sm-2 control-label">Название группы в характеристиках:
				</label>
				<div class="col-sm-3">
					<label class="radio-inline">
						<input type="radio" name="revtheme_product_all[atributs_group_name]" value="1" <?php if ($revtheme_product_all['atributs_group_name']) { echo 'checked'; } ?> /><span>Вкл.</span>
					</label>
					<label class="radio-inline">
						<input type="radio" name="revtheme_product_all[atributs_group_name]" value="0" <?php if (!$revtheme_product_all['atributs_group_name']) { echo 'checked';} ?> /><span>Выкл.</span>
					</label>
				</div>
			</div>	
			<hr>
			<div id="atributs_zavisimost" style="display:none;">
				<div class="form-group">
					<label class="col-sm-2 control-label">Группа атрибутов в кратком описании:</label>
					<div class="col-sm-4">
					<div class="well well-sm" style="height: 150px; overflow: auto; margin-bottom: 5px;">
						<?php foreach ($attribute_groups as $attribute_group) { ?>
							<div class="checkbox">
								<label>
								<?php if (in_array($attribute_group['attribute_group_id'], $revtheme_product_all_attribute_group)) { ?>
									<input type="checkbox" name="revtheme_product_all_attribute_group[]" value="<?php echo $attribute_group['attribute_group_id']; ?>" checked="checked" />
									<?php echo $attribute_group['name']; ?>
								<?php } else { ?>
									<input type="checkbox" name="revtheme_product_all_attribute_group[]" value="<?php echo $attribute_group['attribute_group_id']; ?>" />
									<?php echo $attribute_group['name']; ?>
								<?php } ?>
								</label>
							</div>
						<?php } ?>
					</div>
					<a onclick="selectAll2(this);">Выбрать все</a> / <a onclick="deselectAll2(this);">Снять выделения</a>
					<script type="text/javascript"><!--
					function selectAll2(element) {
						$(element).parent().find(':checkbox').attr('checked', true);
					}
					function deselectAll2(element) {
						$(element).parent().find(':checkbox').attr('checked', false);
					}
					--></script>
					</div>
				</div>
				<div class="form-group">
					<label class="col-sm-2 control-label">Выводить ссылку "Показать все характеристики":
					</label>
					<div class="col-sm-3">
						<label class="radio-inline">
							<input type="radio" name="revtheme_product_all[atributs_ssilka_all]" value="1" <?php if ($revtheme_product_all['atributs_ssilka_all']) { echo 'checked'; } ?> /><span>Вкл.</span>
						</label>
						<label class="radio-inline">
							<input type="radio" name="revtheme_product_all[atributs_ssilka_all]" value="0" <?php if (!$revtheme_product_all['atributs_ssilka_all']) { echo 'checked';} ?> /><span>Выкл.</span>
						</label>
					</div>
				</div>
				<hr>
			</div>
			<div class="form-group">
			<label class="col-sm-2 control-label">Выводить производителя:
			</label>
			<div class="col-sm-3">
				<label class="radio-inline">
					<input type="radio" name="revtheme_product_all[manufacturer_status]" value="1" <?php if ($revtheme_product_all['manufacturer_status']) { echo 'checked'; } ?> /><span>Вкл.</span>
				</label>
				<label class="radio-inline">
					<input type="radio" name="revtheme_product_all[manufacturer_status]" value="0" <?php if (!$revtheme_product_all['manufacturer_status']) { echo 'checked';} ?> /><span>Выкл.</span>
				</label>
			</div>
			</div>
			<div class="form-group">
			<label class="col-sm-2 control-label">Выводить модель (model):
			</label>
			<div class="col-sm-3">
				<label class="radio-inline">
					<input type="radio" name="revtheme_product_all[model_status]" value="1" <?php if ($revtheme_product_all['model_status']) { echo 'checked'; } ?> /><span>Вкл.</span>
				</label>
				<label class="radio-inline">
					<input type="radio" name="revtheme_product_all[model_status]" value="0" <?php if (!$revtheme_product_all['model_status']) { echo 'checked';} ?> /><span>Выкл.</span>
				</label>
			</div>
			</div>
			<div class="form-group">
			<label class="col-sm-2 control-label">Выводить артикул (sku):
			</label>
			<div class="col-sm-3">
				<label class="radio-inline">
					<input type="radio" name="revtheme_product_all[sku_status]" value="1" <?php if ($revtheme_product_all['sku_status']) { echo 'checked'; } ?> /><span>Вкл.</span>
				</label>
				<label class="radio-inline">
					<input type="radio" name="revtheme_product_all[sku_status]" value="0" <?php if (!$revtheme_product_all['sku_status']) { echo 'checked';} ?> /><span>Выкл.</span>
				</label>
			</div>
			</div>
			<div class="form-group">
			<label class="col-sm-2 control-label">Выводить бонусные балы:
			</label>
			<div class="col-sm-3">
				<label class="radio-inline">
					<input type="radio" name="revtheme_product_all[bonusbals_status]" value="1" <?php if ($revtheme_product_all['bonusbals_status']) { echo 'checked'; } ?> /><span>Вкл.</span>
				</label>
				<label class="radio-inline">
					<input type="radio" name="revtheme_product_all[bonusbals_status]" value="0" <?php if (!$revtheme_product_all['bonusbals_status']) { echo 'checked';} ?> /><span>Выкл.</span>
				</label>
			</div>
			</div>
			<div class="form-group">
			<label class="col-sm-2 control-label">Выводить статус на складе:
			</label>
			<div class="col-sm-3">
				<label class="radio-inline">
					<input type="radio" name="revtheme_product_all[sklad_status]" value="1" <?php if ($revtheme_product_all['sklad_status']) { echo 'checked'; } ?> /><span>Вкл.</span>
				</label>
				<label class="radio-inline">
					<input type="radio" name="revtheme_product_all[sklad_status]" value="0" <?php if (!$revtheme_product_all['sklad_status']) { echo 'checked';} ?> /><span>Выкл.</span>
				</label>
			</div>
			</div>
			<div class="form-group">
			<label class="col-sm-2 control-label">Выводить остаток товара:
			</label>
			<div class="col-sm-3">
				<label class="radio-inline">
					<input type="radio" name="revtheme_product_all[ostatok_status]" value="1" <?php if ($revtheme_product_all['ostatok_status']) { echo 'checked'; } ?> /><span>Вкл.</span>
				</label>
				<label class="radio-inline">
					<input type="radio" name="revtheme_product_all[ostatok_status]" value="0" <?php if (!$revtheme_product_all['ostatok_status']) { echo 'checked';} ?> /><span>Выкл.</span>
				</label>
			</div>
			</div>
			<div class="form-group">
			<label class="col-sm-2 control-label">Выводить вес товара:
			</label>
			<div class="col-sm-3">
				<label class="radio-inline">
					<input type="radio" name="revtheme_product_all[weight_status]" value="1" <?php if ($revtheme_product_all['weight_status']) { echo 'checked'; } ?> /><span>Вкл.</span>
				</label>
				<label class="radio-inline">
					<input type="radio" name="revtheme_product_all[weight_status]" value="0" <?php if (!$revtheme_product_all['weight_status']) { echo 'checked';} ?> /><span>Выкл.</span>
				</label>
			</div>
			</div>
			<div class="form-group">
			<label class="col-sm-2 control-label">Выводить размеры товара:
			</label>
			<div class="col-sm-3">
				<label class="radio-inline">
					<input type="radio" name="revtheme_product_all[razmers]" value="1" <?php if ($revtheme_product_all['razmers']) { echo 'checked'; } ?> /><span>Вкл.</span>
				</label>
				<label class="radio-inline">
					<input type="radio" name="revtheme_product_all[razmers]" value="0" <?php if (!$revtheme_product_all['razmers']) { echo 'checked';} ?> /><span>Выкл.</span>
				</label>
			</div>
			</div>
		</div>
		<div class="tab-pane text-style" id="tab_product_options">
			<div class="form-group">
				<div class="col-sm-12">
					<div class="form-group">
						<label class="col-sm-2 control-label">Заменить на опции с кнопкой купить:<span data-toggle="tooltip" title="Выводятся только опции у которых префикс цены выбран '=' и количество > 0. И в товаре на вклдке 'Опции' должна быть выбрана опция 'Заменить опции на опции с кнопкой купить'."></span>
						</label>
						<div class="col-sm-3">
							<label class="radio-inline">
								<input type="radio" onchange="$(this).parent().parent().parent().parent().next().show().next().show().next().show().next().show().next().show();" name="revtheme_product_all[options_buy]" value="1" <?php if ($revtheme_product_all['options_buy']) { echo 'checked'; } ?> /><span>Да</span>
							</label>
							<label class="radio-inline">
								<input type="radio" onchange="$(this).parent().parent().parent().parent().next().hide().next().hide().next().hide().next().hide().next().hide();" name="revtheme_product_all[options_buy]" value="0" <?php if (!$revtheme_product_all['options_buy']) { echo 'checked';} ?> /><span>Нет</span>
							</label>
						</div>
					</div>
				</div>
				<div class="col-sm-12" <?php if (!$revtheme_product_all['options_buy']) { ?> style="display: none" <?php } ?>>
					<div class="form-group">
						<label class="col-sm-2 control-label">Выводить название опций:
						</label>
						<div class="col-sm-3">
							<label class="radio-inline">
								<input type="radio" name="revtheme_product_all[options_buy_optionname]" value="1" <?php if ($revtheme_product_all['options_buy_optionname']) { echo 'checked'; } ?> /><span>Да</span>
							</label>
							<label class="radio-inline">
								<input type="radio" name="revtheme_product_all[options_buy_optionname]" value="0" <?php if (!$revtheme_product_all['options_buy_optionname']) { echo 'checked';} ?> /><span>Нет</span>
							</label>
						</div>
					</div>
				</div>
				<div class="col-sm-12" <?php if (!$revtheme_product_all['options_buy']) { ?> style="display: none" <?php } ?>>
					<div class="form-group">
						<label class="col-sm-2 control-label">Выводить название опции вместо слова "Опция":<span data-toggle="tooltip" title="Включать только если у товара используется 1 опция (не путать со значениями опции)"></span>
						</label>
						<div class="col-sm-3">
							<label class="radio-inline">
								<input type="radio" name="revtheme_product_all[options_buy_optionname_one]" value="1" <?php if ($revtheme_product_all['options_buy_optionname_one']) { echo 'checked'; } ?> /><span>Да</span>
							</label>
							<label class="radio-inline">
								<input type="radio" name="revtheme_product_all[options_buy_optionname_one]" value="0" <?php if (!$revtheme_product_all['options_buy_optionname_one']) { echo 'checked';} ?> /><span>Нет</span>
							</label>
						</div>
					</div>
				</div>
				<div class="col-sm-12" <?php if (!$revtheme_product_all['options_buy']) { ?> style="display: none" <?php } ?>>
					<div class="form-group">
						<label class="col-sm-2 control-label">Выводить модель опции:
						</label>
						<div class="col-sm-3">
							<label class="radio-inline">
								<input type="radio" name="revtheme_product_all[options_buy_model]" value="1" <?php if ($revtheme_product_all['options_buy_model']) { echo 'checked'; } ?> /><span>Да</span>
							</label>
							<label class="radio-inline">
								<input type="radio" name="revtheme_product_all[options_buy_model]" value="0" <?php if (!$revtheme_product_all['options_buy_model']) { echo 'checked';} ?> /><span>Нет</span>
							</label>
						</div>
					</div>
				</div>
				<div class="col-sm-12" <?php if (!$revtheme_product_all['options_buy']) { ?> style="display: none" <?php } ?>>
					<div class="form-group">
						<label class="col-sm-2 control-label">Выводить остаток опций:
						</label>
						<div class="col-sm-3">
							<label class="radio-inline">
								<input type="radio" name="revtheme_product_all[options_buy_quantity]" value="1" <?php if ($revtheme_product_all['options_buy_quantity']) { echo 'checked'; } ?> /><span>Да</span>
							</label>
							<label class="radio-inline">
								<input type="radio" name="revtheme_product_all[options_buy_quantity]" value="0" <?php if (!$revtheme_product_all['options_buy_quantity']) { echo 'checked';} ?> /><span>Нет</span>
							</label>
						</div>
					</div>
				</div>
				<div class="col-sm-12" <?php if (!$revtheme_product_all['options_buy']) { ?> style="display: none" <?php } ?>>
					<div class="form-group">
						<label class="col-sm-2 control-label">Опции кликабельны:
						</label>
						<div class="col-sm-3">
							<label class="radio-inline">
								<input type="radio" name="revtheme_product_all[options_buy_click]" value="1" <?php if ($revtheme_product_all['options_buy_click']) { echo 'checked'; } ?> /><span>Да</span>
							</label>
							<label class="radio-inline">
								<input type="radio" name="revtheme_product_all[options_buy_click]" value="0" <?php if (!$revtheme_product_all['options_buy_click']) { echo 'checked';} ?> /><span>Нет</span>
							</label>
						</div>
					</div>
				</div>	
			</div>
		</div>
		<div class="tab-pane text-style" id="tab_product_images">
			<div class="form-group">
			<label class="col-sm-2 control-label">Зум (увеличение изображения):
			</label>
			<div class="col-sm-3">
				<label class="radio-inline">
					<input type="radio" name="revtheme_product_images[zoom]" value="1" <?php if ($revtheme_product_images['zoom']) { echo 'checked'; } ?> /><span>Вкл.</span>
				</label>
				<label class="radio-inline">
					<input type="radio" name="revtheme_product_images[zoom]" value="0" <?php if (!$revtheme_product_images['zoom']) { echo 'checked';} ?> /><span>Выкл.</span>
				</label>
			</div>
			</div>
			<div class="form-group">
			<label class="col-sm-2 control-label">Слайдер доп. изображений:
			</label>
			<div class="col-sm-3">
				<label class="radio-inline">
					<input type="radio" name="revtheme_product_images[slider]" value="1" <?php if ($revtheme_product_images['slider']) { echo 'checked'; } ?> /><span>Вкл.</span>
				</label>
				<label class="radio-inline">
					<input type="radio" name="revtheme_product_images[slider]" value="0" <?php if (!$revtheme_product_images['slider']) { echo 'checked';} ?> /><span>Выкл.</span>
				</label>
			</div>
			</div>
		</div>
		<div class="tab-pane text-style" id="tab_product_mods">
			<div class="form-group">
				<label class="col-sm-2 control-label">1) Просмотренные товары:
				</label>
				<div class="col-sm-2">
					<label class="radio-inline">
						<input type="radio" name="revtheme_product_mods[viewed_products]" value="1" <?php if ($revtheme_product_mods['viewed_products']) { echo 'checked'; } ?> /><span>Вкл.</span>
					</label>
					<label class="radio-inline">
						<input type="radio" name="revtheme_product_mods[viewed_products]" value="0" <?php if (!$revtheme_product_mods['viewed_products']) { echo 'checked';} ?> /><span>Выкл.</span>
					</label>
				</div>
			</div>
			<div class="form-group" style="border-top: none;">
				<label class="col-sm-2 control-label">Заголовок:</label>
				<div class="col-sm-3">
					<?php foreach ($languages as $language) { ?>
						<div class="input-group">
							<span class="input-group-addon"><img src="<?php echo (VERSION >= 2.2) ? 'language/'.$language['code'].'/'.$language['code'].'.png' : 'view/image/flags/'.$language['image']; ?>" title="<?php echo $language['name']; ?>" /></span>
							<input type="text" name="revtheme_product_mods[<?php echo $language['language_id']; ?>][viewed_products_zagolovok]" value="<?php echo(isset($revtheme_product_mods[$language['language_id']]['viewed_products_zagolovok']) ? $revtheme_product_mods[$language['language_id']]['viewed_products_zagolovok'] : 'Вы смотрели') ?>" class="form-control" />
						</div>
					<?php } ?>
				</div>
				<label class="col-sm-2 control-label">Лимит товаров:</label>
				<div class="col-sm-2">
					<input type="text" name="revtheme_product_mods[viewed_products_limit]" value="<?php echo $revtheme_product_mods['viewed_products_limit']; ?>" class="form-control" />
				</div>
			</div>
			<div class="form-group">
				<label class="col-sm-2 control-label">2) Текстовые блоки:
				</label>
				<div class="col-sm-3">
					<label class="radio-inline">
						<input type="radio" name="revtheme_product_mods[text_block]" value="1" <?php if ($revtheme_product_mods['text_block']) { echo 'checked'; } ?> /><span>Вкл.</span>
					</label>
					<label class="radio-inline">
						<input type="radio" name="revtheme_product_mods[text_block]" value="0" <?php if (!$revtheme_product_mods['text_block']) { echo 'checked';} ?> /><span>Выкл.</span>
					</label>
				</div>
			</div>
			<div class="form-group"  style="border-top: none;">
				<label class="col-sm-2 control-label">Заголовок:</label>
				<div class="col-sm-3">
					<?php foreach ($languages as $language) { ?>
						<div class="input-group">
							<span class="input-group-addon"><img src="<?php echo (VERSION >= 2.2) ? 'language/'.$language['code'].'/'.$language['code'].'.png' : 'view/image/flags/'.$language['image']; ?>" title="<?php echo $language['name']; ?>" /></span>
							<input type="text" name="revtheme_product_mods[<?php echo $language['language_id']; ?>][text_block_zagolovok]" value="<?php echo(isset($revtheme_product_mods[$language['language_id']]['text_block_zagolovok']) ? $revtheme_product_mods[$language['language_id']]['text_block_zagolovok'] : '') ?>" class="form-control" />
						</div>
					<?php } ?>
				</div>
				<label class="col-sm-2 control-label" for="input-text_block_cols">Блоков в ряд:</label>
				<div class="col-sm-2">
					<select name="revtheme_product_mods[text_block_cols]" id="input-text_block_cols" class="form-control">
						<?php if ($revtheme_product_mods['text_block_cols'] == 'col-sm-12') { ?>
							<option value="col-sm-12" selected="selected">1</option>
							<option value="col-sm-6">2</option>
							<option value="col-sm-4">3</option>
							<option value="col-sm-1">12</option>
						<?php } else if ($revtheme_product_mods['text_block_cols'] == 'col-sm-6') { ?>
							<option value="col-sm-12">1</option>
							<option value="col-sm-6" selected="selected">2</option>
							<option value="col-sm-4">3</option>
							<option value="col-sm-1">12</option>
						<?php } else if ($revtheme_product_mods['text_block_cols'] == 'col-sm-4') { ?>
							<option value="col-sm-12">1</option>
							<option value="col-sm-6">2</option>
							<option value="col-sm-4" selected="selected">3</option>
							<option value="col-sm-1">12</option>
						<?php } else { ?>
							<option value="col-sm-12">1</option>
							<option value="col-sm-6">2</option>
							<option value="col-sm-4">3</option>
							<option value="col-sm-1" selected="selected">12</option>
						<?php } ?>
					</select>
				</div>
			</div>
			<div class="form-group" style="border-top: none;">
				<div class="col-sm-12">
					<table id="t_product_blocks" class="table table-bordered">
						<thead>
							<tr>
								<td class="nowrap" style="width: 18%">Иконка</td>
								<td class="nowrap">Заголовок</td>
								<td class="nowrap">Текст</td>
								<td class="nowrap">Ссылка</td>
								<td class="nowrap" style="width:10%">Сортировка</td>
								<td></td>
							</tr>
						</thead>
						<tbody>
						<?php $item_row_product_main = 10; ?>
						<?php foreach ($revtheme_blocks_product_items as $revtheme_blocks_product_item) { ?>
							<tr id="item-row-product-main<?php echo $item_row_product_main; ?>" class="item_row_product_main">						
								<td class="text-center">
									<div>
										<label class="radio-inline">
											<input type="radio" name="revtheme_blocks_product_item[<?php echo $item_row_product_main; ?>][icontype]" value="1" <?php if ($revtheme_blocks_product_item['icontype']) { echo 'checked'; } ?> onchange="$(this).parent().parent().parent().find('.zavisimost_ico').show().next().hide();" /><span>Иконка</span>
										</label>
										<label class="radio-inline">
											<input type="radio" name="revtheme_blocks_product_item[<?php echo $item_row_product_main; ?>][icontype]" value="0" <?php if (!$revtheme_blocks_product_item['icontype']) { echo 'checked';} ?> onchange="$(this).parent().parent().parent().find('.zavisimost_ico').hide().next().show();" /><span>Картинка</span>
										</label>	
									</div><br>
									<div class="zavisimost_ico" <?php if (!$revtheme_blocks_product_item['icontype']) { ?> style="display: none" <?php } ?>>
										<span class="fa_icon" id="icon_revtheme_blocks_product_item<?php echo $item_row_product_main; ?>" onclick="fa_icons($(this).attr('id'))"><i class="<?php echo $revtheme_blocks_product_item['icon']; ?>"></i></span>
										<input type="hidden" name="revtheme_blocks_product_item[<?php echo $item_row_product_main; ?>][icon]" value="<?php echo $revtheme_blocks_product_item['icon']; ?>" id="input-icon_revtheme_blocks_product_item<?php echo $item_row_product_main; ?>" />
									</div>
									<div <?php if ($revtheme_blocks_product_item['icontype']) { ?> style="display: none" <?php } ?>>
										<a href="" id="revtheme_blocks_product_item_thumb-image<?php echo $item_row_product_main; ?>" data-toggle="image" class="img-thumbnail"><img src="<?php echo $revtheme_blocks_product_item['thumb']; ?>" alt="" title="" data-placeholder="<?php echo $placeholder; ?>" /></a>
										<input type="hidden" name="revtheme_blocks_product_item[<?php echo $item_row_product_main; ?>][image]" value="<?php echo $revtheme_blocks_product_item['image']; ?>" id="revtheme_blocks_product_item-image<?php echo $item_row_product_main; ?>" />
									</div>
								</td>
								<td class="text-left">
									<?php foreach ($languages as $language) { ?>
										<div class="input-group">
											<span class="input-group-addon"><img src="<?php echo (VERSION >= 2.2) ? 'language/'.$language['code'].'/'.$language['code'].'.png' : 'view/image/flags/'.$language['image']; ?>" title="<?php echo $language['name']; ?>" /></span>
											<input class="form-control" type="text" name="revtheme_blocks_product_item[<?php echo $item_row_product_main; ?>][title][<?php echo $language['language_id']; ?>]" value="<?php echo(isset($revtheme_blocks_product_item['title'][$language['language_id']]) ? $revtheme_blocks_product_item['title'][$language['language_id']] : '') ?>" />
										</div>
									<?php } ?>
								</td>
								<td class="text-left">
									<?php foreach ($languages as $language) { ?>
										<div class="input-group">
											<span class="input-group-addon"><img src="<?php echo (VERSION >= 2.2) ? 'language/'.$language['code'].'/'.$language['code'].'.png' : 'view/image/flags/'.$language['image']; ?>" title="<?php echo $language['name']; ?>" /></span>
											<input class="form-control" type="text" name="revtheme_blocks_product_item[<?php echo $item_row_product_main; ?>][description][<?php echo $language['language_id']; ?>]" value="<?php echo(isset($revtheme_blocks_product_item['description'][$language['language_id']]) ? $revtheme_blocks_product_item['description'][$language['language_id']] : '') ?>" />
										</div>
									<?php } ?>
								</td>
								<td class="text-left">
									<input class="form-control" type="text" name="revtheme_blocks_product_item[<?php echo $item_row_product_main; ?>][link]" value="<?php echo $revtheme_blocks_product_item['link']; ?>" />
								</td>
								<td class="text-left">
									<input class="form-control" type="text" name="revtheme_blocks_product_item[<?php echo $item_row_product_main; ?>][sort]" value="<?php echo $revtheme_blocks_product_item['sort']; ?>" />
								</td>
								<td class="text-right">
									<a class="btn btn-danger" onclick="$('#t_product_blocks #item-row-product-main<?php echo $item_row_product_main; ?>').remove();" data-toggle="tooltip" title="Удалить"><i class="fa fa-trash-o"></i></a>
								</td>
							</tr>
						<?php $item_row_product_main++; ?>
						<?php } ?>
						</tbody>
						<tfoot>
							<tr>
								<td colspan="5"></td>
								<td class="text-right"><a class="btn btn-primary" onclick="addBlockProductItem();" data-toggle="tooltip" title="Добавить"><i class="fa fa-plus-circle"></i></a></td>
							</tr>
						</tfoot>
					</table>
				</div>
			</div>
		</div>
	</div>
</div>
<div class="tab-pane" id="tab_footer">
	<div class="col-sm-2">
		<nav class="nav-sidebar">
			<ul class="nav tabs">
				<li class="active"><a href="#tab_footer_all" data-toggle="tab">Общие настройки</a></li>
				<li><a href="#tab_subscribe" data-toggle="tab">Подписка на новости</a></li>
				<li><a href="#tab_footer_links" data-toggle="tab">Доп. ссылки в подвале</a></li>
				<li><a href="#tab_soc" data-toggle="tab">Иконки социальных сетей</a></li>
				<li><a href="#tab_icons" data-toggle="tab">Иконки платежных систем</a></li>
			</ul>
		</nav>
	</div>
	<div class="tab-content col-sm-10">
		<div class="tab-pane active text-style" id="tab_footer_all">
			<div class="form-group">
				<label class="col-sm-2 control-label">Кнопка "Вверх":
				</label>
				<div class="col-sm-3">
					<label class="radio-inline">
						<input type="radio" name="revtheme_footer_all[in_top]" value="1" <?php if ($revtheme_footer_all['in_top']) { echo 'checked'; } ?> /><span>Вкл.</span>
					</label>
					<label class="radio-inline">
						<input type="radio" name="revtheme_footer_all[in_top]" value="0" <?php if (!$revtheme_footer_all['in_top']) { echo 'checked';} ?> /><span>Выкл.</span>
					</label>
				</div>
			</div>
			<div class="form-group">
				<label class="col-sm-2 control-label">Кнопка "Заказать звонок":
				</label>
				<div class="col-sm-3">
					<label class="radio-inline">
						<input type="radio" name="revtheme_footer_all[popup_phone]" value="1" <?php if ($revtheme_footer_all['popup_phone']) { echo 'checked'; } ?> /><span>Вкл.</span>
					</label>
					<label class="radio-inline">
						<input type="radio" name="revtheme_footer_all[popup_phone]" value="0" <?php if (!$revtheme_footer_all['popup_phone']) { echo 'checked';} ?> /><span>Выкл.</span>
					</label>
				</div>
			</div>
			<div class="form-group">
				<label class="col-sm-2 control-label">Карта с контактами в подвале:
				</label>
				<div class="col-sm-3">
					<label class="radio-inline">
						<input type="radio" name="revtheme_footer_all[f_map]" value="1" <?php if ($revtheme_footer_all['f_map']) { echo 'checked'; } ?> /><span>Вкл.</span>
					</label>
					<label class="radio-inline">
						<input type="radio" name="revtheme_footer_all[f_map]" value="0" <?php if (!$revtheme_footer_all['f_map']) { echo 'checked';} ?> /><span>Выкл.</span>
					</label>
				</div>
			</div>
		</div>
		<div class="tab-pane text-style" id="tab_subscribe">
			<div class="form-group">
				<label class="col-sm-2 control-label">Включить:
				</label>
				<div class="col-sm-3">
					<label class="radio-inline">
						<input type="radio" name="revtheme_footer_subscribe[status]" value="1" <?php if ($revtheme_footer_subscribe['status']) { echo 'checked'; } ?> /><span>Да</span>
					</label>
					<label class="radio-inline">
						<input type="radio" name="revtheme_footer_subscribe[status]" value="0" <?php if (!$revtheme_footer_subscribe['status']) { echo 'checked';} ?> /><span>Нет</span>
					</label>
				</div>
			</div>
			<div class="form-group">
				<label class="col-sm-2 control-label">Заголовок:</label>
				<div class="col-sm-3">
					<?php foreach ($languages as $language) { ?>
						<div class="input-group">
							<span class="input-group-addon"><img src="<?php echo (VERSION >= 2.2) ? 'language/'.$language['code'].'/'.$language['code'].'.png' : 'view/image/flags/'.$language['image']; ?>" title="<?php echo $language['name']; ?>" /></span>
							<input type="text" name="revtheme_footer_subscribe[<?php echo $language['language_id']; ?>][title]" value="<?php echo(isset($revtheme_footer_subscribe[$language['language_id']]['title']) ? $revtheme_footer_subscribe[$language['language_id']]['title'] : 'Подписка на новости') ?>" class="form-control" />
						</div>
					<?php } ?>
				</div>
			</div>
			<div class="form-group">
				<label class="col-sm-2 control-label">Текст:</label>
				<div class="col-sm-6">
					<?php foreach ($languages as $language) { ?>
						<div class="input-group">
							<span class="input-group-addon"><img src="<?php echo (VERSION >= 2.2) ? 'language/'.$language['code'].'/'.$language['code'].'.png' : 'view/image/flags/'.$language['image']; ?>" title="<?php echo $language['name']; ?>" /></span>
							<input type="text" name="revtheme_footer_subscribe[<?php echo $language['language_id']; ?>][text]" value="<?php echo(isset($revtheme_footer_subscribe[$language['language_id']]['text']) ? $revtheme_footer_subscribe[$language['language_id']]['text'] : 'Будьте в курсе новых акций и спецпредложений!') ?>" class="form-control" />
						</div>
					<?php } ?>
				</div>
			</div>
			<div class="form-group">
				<label class="col-sm-2 control-label">Текст при успешной подписке:</label>
				<div class="col-sm-10">
					<?php foreach ($languages as $language) { ?>
						<div class="input-group">
							<span class="input-group-addon"><img src="<?php echo (VERSION >= 2.2) ? 'language/'.$language['code'].'/'.$language['code'].'.png' : 'view/image/flags/'.$language['image']; ?>" title="<?php echo $language['name']; ?>" /></span>
							<input type="text" name="revtheme_footer_subscribe[<?php echo $language['language_id']; ?>][text_uspeh]" value="<?php echo(isset($revtheme_footer_subscribe[$language['language_id']]['text_uspeh']) ? $revtheme_footer_subscribe[$language['language_id']]['text_uspeh'] : 'Поздравляем! Вы подписались на рассылку.') ?>" class="form-control" />
						</div>
					<?php } ?>
				</div>
			</div>
		</div>
		<div class="tab-pane text-style" id="tab_footer_links">
			<div class="form-group">
				<div class="col-sm-12">
					<table id="t_footer_links" class="table table-bordered">
						<thead>
							<tr>
								<td class="nowrap">Ссылка</td>
								<td class="nowrap">Заголовок</td>
								<td class="nowrap">Сортировка</td>
								<td></td>
							</tr>
						</thead>
						<tbody>
						<?php $item_row_footer_link = 1; ?>
						<?php foreach ($revtheme_footer_links as $revtheme_footer_link) { ?>
							<tr id="item-row-main<?php echo $item_row_footer_link; ?>" class="item_row_footer_link">							
								<td class="text-left">
									<input class="form-control" type="text" name="revtheme_footer_link[<?php echo $item_row_footer_link; ?>][link]" value="<?php echo $revtheme_footer_link['link']; ?>" />
								</td>
								<td class="text-left">
									<?php foreach ($languages as $language) { ?>
										<div class="input-group">
											<span class="input-group-addon"><img src="<?php echo (VERSION >= 2.2) ? 'language/'.$language['code'].'/'.$language['code'].'.png' : 'view/image/flags/'.$language['image']; ?>" title="<?php echo $language['name']; ?>" /></span>
											<input class="form-control" type="text" name="revtheme_footer_link[<?php echo $item_row_footer_link; ?>][title][<?php echo $language['language_id']; ?>]" value="<?php echo(isset($revtheme_footer_link['title'][$language['language_id']]) ? $revtheme_footer_link['title'][$language['language_id']] : '') ?>" />
										</div>
									<?php } ?>
								</td>
								<td class="text-left">
									<input class="form-control" type="text" name="revtheme_footer_link[<?php echo $item_row_footer_link; ?>][sort]" value="<?php echo $revtheme_footer_link['sort']; ?>" />
								</td>
								<td class="text-right">
									<a class="btn btn-danger" onclick="$('#t_footer_links #item-row-main<?php echo $item_row_footer_link; ?>').remove();" data-toggle="tooltip" title="Удалить"><i class="fa fa-trash-o"></i></a>
								</td>
							</tr>
						<?php $item_row_footer_link++; ?>
						<?php } ?>
						</tbody>
						<tfoot>
							<tr>
								<td colspan="3"></td>
								<td class="text-right"><a class="btn btn-primary" onclick="addBlockFooterLink();" data-toggle="tooltip" title="Добавить"><i class="fa fa-plus-circle"></i></a></td>
							</tr>
						</tfoot>
					</table>
				</div>
			</div>
		</div>
		<div class="tab-pane text-style" id="tab_soc">
			<div class="form-group">
				<div class="col-sm-12">
					<table id="t_footer_socs" class="table table-bordered">
						<thead>
							<tr>
								<td class="nowrap">Иконка</td>
								<td class="nowrap">Ссылка</td>
								<td class="nowrap">Заголовок</td>
								<td class="nowrap">Сортировка</td>
								<td></td>
							</tr>
						</thead>
						<tbody>
						<?php $item_row_main_soc = 1; ?>
						<?php foreach ($revtheme_footer_socs as $revtheme_footer_soc) { ?>
							<tr id="item-row-main<?php echo $item_row_main_soc; ?>" class="item_row_main_soc">						
								<td class="text-center">
									<span class="fa_icon" id="icon_banner_<?php echo $item_row_main_soc; ?>" onclick="fa_icons($(this).attr('id'))"><i class="<?php echo $revtheme_footer_soc['image']; ?>"></i></span>
									<input type="hidden" name="revtheme_footer_soc[<?php echo $item_row_main_soc; ?>][image]" value="<?php echo $revtheme_footer_soc['image']; ?>" id="input-soc-image<?php echo $item_row_main_soc; ?>" />
								</td>		
								<td class="text-left">
									<input class="form-control" type="text" name="revtheme_footer_soc[<?php echo $item_row_main_soc; ?>][link]" value="<?php echo $revtheme_footer_soc['link']; ?>" />
								</td>
								<td class="text-left">
									<?php foreach ($languages as $language) { ?>
										<div class="input-group">
											<span class="input-group-addon"><img src="<?php echo (VERSION >= 2.2) ? 'language/'.$language['code'].'/'.$language['code'].'.png' : 'view/image/flags/'.$language['image']; ?>" title="<?php echo $language['name']; ?>" /></span>
											<input class="form-control" type="text" name="revtheme_footer_soc[<?php echo $item_row_main_soc; ?>][title][<?php echo $language['language_id']; ?>]" value="<?php echo(isset($revtheme_footer_soc['title'][$language['language_id']]) ? $revtheme_footer_soc['title'][$language['language_id']] : '') ?>" />
										</div>
									<?php } ?>
								</td>
								<td class="text-left">
									<input class="form-control" type="text" name="revtheme_footer_soc[<?php echo $item_row_main_soc; ?>][sort]" value="<?php echo $revtheme_footer_soc['sort']; ?>" />
								</td>
								<td class="text-right">
									<a class="btn btn-danger" onclick="$('#t_footer_socs #item-row-main<?php echo $item_row_main_soc; ?>').remove();" data-toggle="tooltip" title="Удалить"><i class="fa fa-trash-o"></i></a>
								</td>
							</tr>
						<?php $item_row_main_soc++; ?>
						<?php } ?>
						</tbody>
						<tfoot>
							<tr>
								<td colspan="4"></td>
								<td class="text-right"><a class="btn btn-primary" onclick="addBlockItemSoc();" data-toggle="tooltip" title="Добавить"><i class="fa fa-plus-circle"></i></a></td>
							</tr>
						</tfoot>
					</table>
				</div>
			</div>
		</div>
		<div class="tab-pane text-style" id="tab_icons">
			<div class="form-group">
				<label class="col-sm-2 control-label">Иконки:</label>
				<div class="col-sm-4">
					<table id="t_footer_icons" class="table table-bordered">
						<thead>
							<tr>
								<td class="nowrap"><i class="fa fa-edit fs14"></i>&nbsp;&nbsp;Иконка</td>
								<td class="nowrap"><i class="fa fa-sort fs14"></i>&nbsp;&nbsp;Сортировка</td>
								<td></td>
							</tr>
						</thead>
						<tbody>
						<?php $item_row_main_icon = 1; ?>
						<?php foreach ($revtheme_footer_icons as $revtheme_footer_icon) { ?>
							<tr id="item-row-main<?php echo $item_row_main_icon; ?>" class="item_row_main_icon">
								<td class="text-center">
									<a href="" id="thumb-image<?php echo $item_row_main_icon; ?>" data-toggle="image"><img style="width: 50px;" src="<?php echo $revtheme_footer_icon['thumb']; ?>" alt="" title="" data-placeholder="<?php echo $placeholder; ?>" /></a><input type="hidden" name="revtheme_footer_icon[<?php echo $item_row_main_icon; ?>][image]" value="<?php echo $revtheme_footer_icon['image']; ?>" id="input-icon-image<?php echo $item_row_main_icon; ?>" />
								</td>
								<td class="text-left">
									<input  class="form-control" type="text" name="revtheme_footer_icon[<?php echo $item_row_main_icon; ?>][sort]" value="<?php echo $revtheme_footer_icon['sort']; ?>" />
								</td>
								<td class="text-right">
									<a class="btn btn-danger" onclick="$('#t_footer_icons #item-row-main<?php echo $item_row_main_icon; ?>').remove();" data-toggle="tooltip" title="Удалить"><i class="fa fa-trash-o"></i></a>
								</td>
							</tr>
						<?php $item_row_main_icon++; ?>
						<?php } ?>
						</tbody>
						<tfoot>
							<tr>
								<td colspan="2"></td>
								<td class="text-right"><a class="btn btn-primary" onclick="addBlockItemIcon();" data-toggle="tooltip" title="Добавить"><i class="fa fa-plus-circle"></i></a></td>
							</tr>
						</tfoot>
					</table>
				</div>
			</div>
		</div>
	</div>	
</div>
<div class="tab-pane" id="tab_css">
	<div class="col-sm-2">
		<nav class="nav-sidebar">
			<ul class="nav tabs">
				<li class="active"><a href="#tab_all_css" data-toggle="tab">Общие настройки</a></li>
			</ul>
		</nav>
	</div>
	<div class="tab-content col-sm-10">
		<div class="tab-pane active text-style" id="tab_all_css">
			<div class="form-group">
				<div class="col-sm-12">
					<div class="form-group">
						<label class="col-sm-2 control-label">Цвет фона страницы:</label>
						<div class="col-sm-2">
							<input class="jscolor form-control" name="revtheme_all_settings[color_all_document]" value="<?php echo isset($revtheme_all_settings['color_all_document']) ? $revtheme_all_settings['color_all_document'] : ''; ?>" />
						</div>
					</div>
				</div>
				<div class="col-sm-12">
					<div class="form-group">
						<label class="col-sm-2 control-label">Цвет ссылок:</label>
						<div class="col-sm-2">
							<input class="jscolor form-control" name="revtheme_all_settings[color_href]" value="<?php echo isset($revtheme_all_settings['color_href']) ? $revtheme_all_settings['color_href'] : ''; ?>" />
						</div>
						<label class="col-sm-2 control-label">Цвет ссылок при наведении:</label>
						<div class="col-sm-2">
							<input class="jscolor form-control" name="revtheme_all_settings[color_href_hover]" value="<?php echo isset($revtheme_all_settings['color_href_hover']) ? $revtheme_all_settings['color_href_hover'] : ''; ?>" />
						</div>
					</div>
				</div>
				<div class="col-sm-12">
					<div class="form-group">
						<label class="col-sm-2 control-label">Цвет корзины:</label>
						<div class="col-sm-2">
							<input class="jscolor form-control" name="revtheme_all_settings[color_cart]" value="<?php echo isset($revtheme_all_settings['color_cart']) ? $revtheme_all_settings['color_cart'] : ''; ?>" />
						</div>
						<label class="col-sm-2 control-label">Цвет корзины при наведении:</label>
						<div class="col-sm-2">
							<input class="jscolor form-control" name="revtheme_all_settings[color_cart_hover]" value="<?php echo isset($revtheme_all_settings['color_cart_hover']) ? $revtheme_all_settings['color_cart_hover'] : ''; ?>" />
						</div>
					</div>
				</div>
				<div class="col-sm-12">
					<div class="form-group">
						<label class="col-sm-2 control-label">Цвет линии каталога:</label>
						<div class="col-sm-2">
							<input class="jscolor form-control" name="revtheme_all_settings[color_top3]" value="<?php echo isset($revtheme_all_settings['color_top3']) ? $revtheme_all_settings['color_top3'] : ''; ?>" />
						</div>
						<label class="col-sm-2 control-label">Цвет подвала:</label>
						<div class="col-sm-2">
							<input class="jscolor form-control" name="revtheme_all_settings[color_footer]" value="<?php echo isset($revtheme_all_settings['color_footer']) ? $revtheme_all_settings['color_footer'] : ''; ?>" />
						</div>
					</div>
				</div>
				<div class="col-sm-12">
					<div class="form-group">
						<label class="col-sm-2 control-label">Цвет amazon меню в линии каталога:</label>
						<div class="col-sm-2">
							<input class="jscolor form-control" name="revtheme_all_settings[color_amazon]" value="<?php echo isset($revtheme_all_settings['color_amazon']) ? $revtheme_all_settings['color_amazon'] : ''; ?>" />
						</div>
						<label class="col-sm-2 control-label">Цвет корзины в линии каталога:</label>
						<div class="col-sm-2">
							<input class="jscolor form-control" name="revtheme_all_settings[color_top3_cart]" value="<?php echo isset($revtheme_all_settings['color_top3_cart']) ? $revtheme_all_settings['color_top3_cart'] : ''; ?>" />
						</div>
					</div>
				</div>
				<div class="col-sm-12">
					<div class="form-group">
						<label class="col-sm-2 control-label">Страница на всю ширину:</label>
						<div class="col-sm-2">
							<label class="radio-inline">
								<input type="radio" onchange="$(this).parent().parent().parent().parent().next().hide().next().hide().next().hide();" name="revtheme_all_settings[all_document_width]" value="1" <?php if ($revtheme_all_settings['all_document_width']) { echo 'checked'; } ?> /><span>Да</span>
							</label>
							<label class="radio-inline">
								<input type="radio" onchange="$(this).parent().parent().parent().parent().next().show().next().show().next().show();" name="revtheme_all_settings[all_document_width]" value="0" <?php if (!$revtheme_all_settings['all_document_width']) { echo 'checked';} ?> /><span>Нет</span>
							</label>
						</div>
					</div>
				</div>
				<div class="col-sm-12" <?php if ($revtheme_all_settings['all_document_width']) { ?> style="display: none" <?php } ?>>
					<div class="form-group">
						<label class="col-sm-2 control-label">Шапка и подвал на всю ширину:</label>
						<div class="col-sm-2">
							<label class="radio-inline">
								<input type="radio" name="revtheme_all_settings[all_document_h_f_width]" value="1" <?php if ($revtheme_all_settings['all_document_h_f_width']) { echo 'checked'; } ?> /><span>Да</span>
							</label>
							<label class="radio-inline">
								<input type="radio" name="revtheme_all_settings[all_document_h_f_width]" value="0" <?php if (!$revtheme_all_settings['all_document_h_f_width']) { echo 'checked';} ?> /><span>Нет</span>
							</label>
						</div>
					</div>
				</div>
				<div class="col-sm-12" <?php if ($revtheme_all_settings['all_document_width']) { ?> style="display: none" <?php } ?>>
					<div class="form-group">
						<label class="col-sm-2 control-label">Отступы страницы:</label>
						<div class="col-sm-2">
							<label class="radio-inline">
								<input type="radio" name="revtheme_all_settings[all_document_margin]" value="1" <?php if ($revtheme_all_settings['all_document_margin']) { echo 'checked'; } ?> /><span>Да</span>
							</label>
							<label class="radio-inline">
								<input type="radio" name="revtheme_all_settings[all_document_margin]" value="0" <?php if (!$revtheme_all_settings['all_document_margin']) { echo 'checked';} ?> /><span>Нет</span>
							</label>
						</div>
					</div>
				</div>
				<div class="col-sm-12" <?php if ($revtheme_all_settings['all_document_width']) { ?> style="display: none" <?php } ?>>
					<div class="form-group">
						<label class="col-sm-2 control-label">Бэкграунд сайта:</label>
						<div class="col-sm-1">
							<label class="radio-inline">
								<a href="" id="thumb-image_revtheme_all_settings" data-toggle="image" class="img-thumbnail width_initial"><img style="width:50px;" src="<?php echo $revtheme_all_settings_all_fon_thumb; ?>" alt="" title="" data-placeholder="<?php echo $placeholder; ?>" /></a>
							<input type="hidden" name="revtheme_all_settings[all_fon_image]" value="<?php echo $revtheme_all_settings['all_fon_image']; ?>" id="revtheme_all_settings_image" />
							</label>
						</div>
						<label class="col-sm-1 control-label">Свойства:</label>
						<div class="col-sm-5">
							<label class="radio-inline newmychek">
								<?php if (isset($revtheme_all_settings['all_fon_image_css_1'])) { ?>
								<input type="checkbox" name="revtheme_all_settings[all_fon_image_css_1]" value="1" checked="checked" />
								<?php } else { ?>
								<input type="checkbox" name="revtheme_all_settings[all_fon_image_css_1]" value="0" />
								<?php } ?><span>Повторять</span>
							</label>
							<label class="radio-inline newmychek">
								<?php if (isset($revtheme_all_settings['all_fon_image_css_2'])) { ?>
								<input type="checkbox" name="revtheme_all_settings[all_fon_image_css_2]" value="1" checked="checked" />
								<?php } else { ?>
								<input type="checkbox" name="revtheme_all_settings[all_fon_image_css_2]" value="0" />
								<?php } ?><span>Фиксированный</span>
							</label>
							<label class="radio-inline newmychek">
								<?php if (isset($revtheme_all_settings['all_fon_image_css_3'])) { ?>
								<input type="checkbox" name="revtheme_all_settings[all_fon_image_css_3]" value="1" checked="checked" />
								<?php } else { ?>
								<input type="checkbox" name="revtheme_all_settings[all_fon_image_css_3]" value="0" />
								<?php } ?><span>По центру</span>
							</label>
							<label class="radio-inline newmychek">
								<?php if (isset($revtheme_all_settings['all_fon_image_css_4'])) { ?>
								<input type="checkbox" name="revtheme_all_settings[all_fon_image_css_4]" value="1" checked="checked" />
								<?php } else { ?>
								<input type="checkbox" name="revtheme_all_settings[all_fon_image_css_4]" value="0" />
								<?php } ?><span>Резиновый</span>
							</label>
						</div>
					</div>
				</div>
				<div class="col-sm-12">
					<div class="form-group">
						<label class="col-sm-2 control-label">Цвет подложки выделения текста:</label>
						<div class="col-sm-2">
							<input class="jscolor form-control" name="revtheme_all_settings[color_selecta]" value="<?php echo isset($revtheme_all_settings['color_selecta']) ? $revtheme_all_settings['color_selecta'] : ''; ?>" />
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
<div class="tab-pane" id="tab_home">
	<div class="col-sm-2">
    <nav class="nav-sidebar">
		<ul class="nav tabs">
			<li class="active"><a href="#tab_home_all" data-toggle="tab">Общие настройки</a></li>
			<li><a href="#tab_slideshow" data-toggle="tab">Слайдшоу</a></li>
			<li><a href="#tab_blocks" data-toggle="tab">Текстовые блоки</a></li>
			<li><a href="#tab_category_wall" data-toggle="tab">Список категорий или производителей</a></li>
			<li><a href="#tab_sliders_mod" data-toggle="tab">Слайдеры: Последние, Хиты продаж, Спецпредложения</a></li>
			<li><a href="#tab_slider1" data-toggle="tab">Слайдер товаров 1</a></li>
			<li><a href="#tab_slider2" data-toggle="tab">Слайдер товаров 2</a></li>
			<li><a href="#tab_slider3" data-toggle="tab">Слайдер товаров 3</a></li>
			<li><a href="#tab_slider4" data-toggle="tab">Слайдер товаров 4</a></li>
			<li><a href="#tab_slider5" data-toggle="tab">Слайдер товаров 5</a></li>
			<li><a href="#tab_blog" data-toggle="tab">Виджет новостей</a></li>
			<li><a href="#tab_aboutstore" data-toggle="tab">О магазине</a></li>
			<li><a href="#tab_socv" data-toggle="tab">Виджеты Вконтакте, Instagram</a></li>
			<li><a href="#tab_storereview" data-toggle="tab">Отзывы о магазине</a></li>
			<li><a href="#tab_viewed_products" data-toggle="tab">Просмотренные товары</a></li>
		</ul>
	</nav>
	</div>
<div class="tab-content col-sm-10">
	<div class="tab-pane active text-style" id="tab_home_all">
		<div class="form-group">
            <label class="col-sm-2 control-label" for="input-width">Заголовок H1 на главной:</label>
            <div class="col-sm-3">
			<?php foreach ($languages as $language) { ?>
				<div class="input-group">
					<span class="input-group-addon"><img src="<?php echo (VERSION >= 2.2) ? 'language/'.$language['code'].'/'.$language['code'].'.png' : 'view/image/flags/'.$language['image']; ?>" title="<?php echo $language['name']; ?>" /></span>
					<input type="text" name="revtheme_home_all[<?php echo $language['language_id']; ?>][h1_home]" value="<?php echo(isset($revtheme_home_all[$language['language_id']]['h1_home']) ? $revtheme_home_all[$language['language_id']]['h1_home'] : '') ?>" id="input-width" class="form-control" />
				</div>
			<?php } ?>
            </div>
        </div>
		<div class="form-group">
			<label class="col-sm-2 control-label">Показывать описание и опции у товаров на главной:</label>
			<div class="col-sm-2">
				<label class="radio-inline">
					<input type="radio" name="revtheme_home_all[pr_opisanie]" value="1" <?php if ($revtheme_home_all['pr_opisanie']) { echo 'checked'; } ?> /><span>Да</span>
				</label>
				<label class="radio-inline">
					<input type="radio" name="revtheme_home_all[pr_opisanie]" value="0" <?php if (!$revtheme_home_all['pr_opisanie']) { echo 'checked';} ?> /><span>Нет</span>
				</label>
			</div>
		</div>
	</div>		
	<div class="tab-pane text-style" id="tab_slideshow">
		<div class="form-group">
			<label class="col-sm-2 control-label">Включить:
			</label>
			<div class="col-sm-3">
				<label class="radio-inline">
					<input type="radio" name="revtheme_home_slideshow[status]" value="1" <?php if ($revtheme_home_slideshow['status']) { echo 'checked'; } ?> /><span>Да</span>
				</label>
				<label class="radio-inline">
					<input type="radio" name="revtheme_home_slideshow[status]" value="0" <?php if (!$revtheme_home_slideshow['status']) { echo 'checked';} ?> /><span>Нет</span>
				</label>
			</div>
		</div>
        <div class="form-group">
            <label class="col-sm-2 control-label" for="input-banner">Баннеры:</label>
            <div class="col-sm-3">
				<input type="hidden" name="revtheme_home_slideshow[banner_id]" value="" />
				<select name="revtheme_home_slideshow[banner_id]" id="input-banner" class="form-control">
				<?php if ($banners) { ?>
					<?php foreach ($banners as $banner) { ?>
						<?php if ($banner['banner_id'] == $revtheme_home_slideshow['banner_id']) { ?>
							<option value="<?php echo $banner['banner_id']; ?>" selected="selected"><?php echo $banner['name']; ?></option>
						<?php } else { ?>
							<option value="<?php echo $banner['banner_id']; ?>"><?php echo $banner['name']; ?></option>
						<?php } ?>
					<?php } ?>
				<?php } ?>
				</select>
            </div>
        </div>
		<div class="form-group">
			<label class="col-sm-2 control-label">Слайдшоу на весь экран:
			</label>
			<div class="col-sm-3">
				<label class="radio-inline">
					<input type="radio" name="revtheme_home_slideshow[allwide]" value="1" <?php if ($revtheme_home_slideshow['allwide']) { echo 'checked'; } ?> /><span>Да</span>
				</label>
				<label class="radio-inline">
					<input type="radio" name="revtheme_home_slideshow[allwide]" value="0" <?php if (!$revtheme_home_slideshow['allwide']) { echo 'checked';} ?> /><span>Нет</span>
				</label>
			</div>
		</div>
		<div class="form-group">
			<label class="col-sm-2 control-label">Показывать слайдшоу на мобильном:
			</label>
			<div class="col-sm-3">
				<label class="radio-inline">
					<input type="radio" name="revtheme_home_slideshow[mobile]" value="1" <?php if ($revtheme_home_slideshow['mobile']) { echo 'checked'; } ?> /><span>Да</span>
				</label>
				<label class="radio-inline">
					<input type="radio" name="revtheme_home_slideshow[mobile]" value="0" <?php if (!$revtheme_home_slideshow['mobile']) { echo 'checked';} ?> /><span>Нет</span>
				</label>
			</div>
		</div>
		<div class="form-group">
            <label class="col-sm-2 control-label" for="input-slides">Баннеров в одном слайде:</label>
            <div class="col-sm-2">
              <input type="text" name="revtheme_home_slideshow[slides]" value="<?php echo $revtheme_home_slideshow['slides']; ?>" placeholder="Ширина" id="input-slides" class="form-control" />
            </div>
        </div>
		<div class="form-group">
			<label class="col-sm-2 control-label"><span data-toggle="tooltip" title="Период через который будет срабатывать автопрокрутка.<br/>Оставьте пустым чтобы отключить.">Автопрокрутка (сек):</span></label>
			<div class="col-sm-2">
				<input type="text" name="revtheme_home_slideshow[autoscroll]" value="<?php echo $revtheme_home_slideshow['autoscroll']; ?>" class="form-control" />
			</div>
		</div>
        <div class="form-group">
            <label class="col-sm-2 control-label" for="input-width">Ширина баннера:</label>
            <div class="col-sm-3">
              <input type="text" name="revtheme_home_slideshow[width]" value="<?php echo $revtheme_home_slideshow['width']; ?>" placeholder="Ширина" id="input-width" class="form-control" />
            </div>
        </div>
        <div class="form-group">
            <label class="col-sm-2 control-label" for="input-height">Высота баннера:</label>
            <div class="col-sm-3">
              <input type="text" name="revtheme_home_slideshow[height]" value="<?php echo $revtheme_home_slideshow['height']; ?>" placeholder="Высота" id="input-height" class="form-control" />
            </div>
        </div>
		<div class="form-group">
			<label class="col-sm-2 control-label">Цвет фона:</label>
			<div class="col-sm-3">
				<input class="jscolor form-control" name="revtheme_home_slideshow[b_color]" value="<?php echo isset($revtheme_home_slideshow['b_color']) ? $revtheme_home_slideshow['b_color'] : ''; ?>" />
			</div>
		</div>
	</div>
	<div class="tab-pane text-style" id="tab_blocks">
		<div class="form-group">
			<label class="col-sm-2 control-label">Включить:
			</label>
			<div class="col-sm-10">
				<label class="radio-inline">
					<input type="radio" name="revtheme_blocks_home[status]" value="1" <?php if ($revtheme_blocks_home['status']) { echo 'checked'; } ?> /><span>Да</span>
				</label>
				<label class="radio-inline">
					<input type="radio" name="revtheme_blocks_home[status]" value="0" <?php if (!$revtheme_blocks_home['status']) { echo 'checked';} ?> /><span>Нет</span>
				</label>
			</div>
		</div>
		<div class="form-group">
			<div class="col-sm-12">
				<table id="t_home_blocks" class="table table-bordered">
					<thead>
						<tr>
							<td class="nowrap" style="width:18%">Иконка</td>
							<td class="nowrap">Заголовок</td>
							<td class="nowrap">Текст</td>
							<td class="nowrap">Ссылка</td>
							<td class="nowrap" style="width:10%">Сортировка</td>
							<td></td>
						</tr>
					</thead>
					<tbody>
					<?php $item_row_main = 10; ?>
					<?php foreach ($revtheme_blocks_home_items as $revtheme_blocks_home_item) { ?>
						<tr id="item-row-main<?php echo $item_row_main; ?>" class="item_row_main">						
							<td class="text-center">
								<div>
									<label class="radio-inline">
										<input type="radio" name="revtheme_blocks_home_item[<?php echo $item_row_main; ?>][icontype]" value="1" <?php if ($revtheme_blocks_home_item['icontype']) { echo 'checked'; } ?> onchange="$(this).parent().parent().parent().find('.zavisimost_ico').show().next().hide();" /><span>Иконка</span>
									</label>
									<label class="radio-inline">
										<input type="radio" name="revtheme_blocks_home_item[<?php echo $item_row_main; ?>][icontype]" value="0" <?php if (!$revtheme_blocks_home_item['icontype']) { echo 'checked';} ?> onchange="$(this).parent().parent().parent().find('.zavisimost_ico').hide().next().show();" /><span>Картинка</span>
									</label>	
								</div><br>
								<div class="zavisimost_ico" <?php if (!$revtheme_blocks_home_item['icontype']) { ?> style="display: none" <?php } ?>>
									<span class="fa_icon" id="icon_banner_<?php echo $item_row_main; ?>" onclick="fa_icons($(this).attr('id'))"><i class="<?php echo $revtheme_blocks_home_item['icon']; ?>"></i></span>
									<input type="hidden" name="revtheme_blocks_home_item[<?php echo $item_row_main; ?>][icon]" value="<?php echo $revtheme_blocks_home_item['icon']; ?>" id="input-block-icon<?php echo $item_row_main; ?>" />
								</div>
								<div <?php if ($revtheme_blocks_home_item['icontype']) { ?> style="display: none" <?php } ?>>
									<a href="" id="revtheme_blocks_home_item_thumb-image<?php echo $item_row_main; ?>" data-toggle="image" class="img-thumbnail"><img src="<?php echo $revtheme_blocks_home_item['thumb']; ?>" alt="" title="" data-placeholder="<?php echo $placeholder; ?>" /></a>
									<input type="hidden" name="revtheme_blocks_home_item[<?php echo $item_row_main; ?>][image]" value="<?php echo $revtheme_blocks_home_item['image']; ?>" id="input-block-image<?php echo $item_row_main; ?>" />
								</div>
							</td>
							<td class="text-left">
								<?php foreach ($languages as $language) { ?>
									<div class="input-group">
										<span class="input-group-addon"><img src="<?php echo (VERSION >= 2.2) ? 'language/'.$language['code'].'/'.$language['code'].'.png' : 'view/image/flags/'.$language['image']; ?>" title="<?php echo $language['name']; ?>" /></span>
										<input class="form-control" type="text" name="revtheme_blocks_home_item[<?php echo $item_row_main; ?>][title][<?php echo $language['language_id']; ?>]" value="<?php echo(isset($revtheme_blocks_home_item['title'][$language['language_id']]) ? $revtheme_blocks_home_item['title'][$language['language_id']] : '') ?>" />
									</div>
								<?php } ?>
							</td>
							<td class="text-left">
								<?php foreach ($languages as $language) { ?>
									<div class="input-group">
										<span class="input-group-addon"><img src="<?php echo (VERSION >= 2.2) ? 'language/'.$language['code'].'/'.$language['code'].'.png' : 'view/image/flags/'.$language['image']; ?>" title="<?php echo $language['name']; ?>" /></span>
										<input class="form-control" type="text" name="revtheme_blocks_home_item[<?php echo $item_row_main; ?>][description][<?php echo $language['language_id']; ?>]" value="<?php echo(isset($revtheme_blocks_home_item['description'][$language['language_id']]) ? $revtheme_blocks_home_item['description'][$language['language_id']] : '') ?>" />
									</div>
								<?php } ?>
							</td>
							<td class="text-left">
								<input class="form-control" type="text" name="revtheme_blocks_home_item[<?php echo $item_row_main; ?>][link]" value="<?php echo $revtheme_blocks_home_item['link']; ?>" />
								<label class="radio-inline" style="padding-top: 5px;">
								  <?php if ($revtheme_blocks_home_item['checkbox']) { ?>
								  <input type="checkbox" name="revtheme_blocks_home_item[<?php echo $item_row_main; ?>][checkbox]" value="1" checked="checked" />
								  <?php } else { ?>
								  <input type="checkbox" name="revtheme_blocks_home_item[<?php echo $item_row_main; ?>][checkbox]" value="1" />
								  <?php } ?> Открывать в модальном окне
								</label>
							</td>
							<td class="text-left">
								<input class="form-control" type="text" name="revtheme_blocks_home_item[<?php echo $item_row_main; ?>][sort]" value="<?php echo $revtheme_blocks_home_item['sort']; ?>" />
							</td>
							<td class="text-right">
								<a class="btn btn-danger" onclick="$('#t_home_blocks #item-row-main<?php echo $item_row_main; ?>').remove();" data-toggle="tooltip" title="Удалить"><i class="fa fa-trash-o"></i></a>
							</td>
						</tr>
					<?php $item_row_main++; ?>
					<?php } ?>
					</tbody>
					<tfoot>
						<tr>
							<td colspan="5"></td>
							<td class="text-right"><a class="btn btn-primary" onclick="addBlockItem();" data-toggle="tooltip" title="Добавить"><i class="fa fa-plus-circle"></i></a></td>
						</tr>
					</tfoot>
				</table>
			</div>
		</div>
	</div>
	<div class="tab-pane text-style" id="tab_category_wall">
		<div class="form-group">
			<label class="col-sm-2 control-label">Включить:
			</label>
			<div class="col-sm-3">
				<label class="radio-inline">
					<input type="radio" name="revtheme_home_categorywall[status]" value="1" <?php if ($revtheme_home_categorywall['status']) { echo 'checked'; } ?> /><span>Да</span>
				</label>
				<label class="radio-inline">
					<input type="radio" name="revtheme_home_categorywall[status]" value="0" <?php if (!$revtheme_home_categorywall['status']) { echo 'checked';} ?> /><span>Нет</span>
				</label>
			</div>
		</div>
        <div class="form-group">
            <label class="col-sm-2 control-label">Заголовок:</label>
            <div class="col-sm-3">
				<?php foreach ($languages as $language) { ?>
					<div class="input-group">
						<span class="input-group-addon"><img src="<?php echo (VERSION >= 2.2) ? 'language/'.$language['code'].'/'.$language['code'].'.png' : 'view/image/flags/'.$language['image']; ?>" title="<?php echo $language['name']; ?>" /></span>
						<input type="text" name="revtheme_home_categorywall[<?php echo $language['language_id']; ?>][title]" value="<?php echo(isset($revtheme_home_categorywall[$language['language_id']]['title']) ? $revtheme_home_categorywall[$language['language_id']]['title'] : 'Категории') ?>" class="form-control" />
					</div>
				<?php } ?>
            </div>
        </div>
		<div class="form-group">
			<label class="col-sm-2 control-label">Иконка:</label>
			<div class="col-sm-2">
				<label class="radio-inline">
					<input type="radio" onchange="$(this).parent().parent().parent().find('.zavisimost_ico').show().next().hide();" name="revtheme_home_categorywall[icontype]" value="1" <?php if ($revtheme_home_categorywall['icontype']) { echo 'checked'; } ?> /><span>Иконка</span>
				</label>
				<label class="radio-inline">
					<input type="radio" onchange="$(this).parent().parent().parent().find('.zavisimost_ico').hide().next().show();" name="revtheme_home_categorywall[icontype]" value="0" <?php if (!$revtheme_home_categorywall['icontype']) { echo 'checked';} ?> /><span>Картинка</span>
				</label>	
			</div>
			<div class="col-sm-2 zavisimost_ico" <?php if (!$revtheme_home_categorywall['icontype']) { ?> style="display: none" <?php } ?>>
				<span class="fazavisimost fa_icon form-control width_initial" id="icon_home_categorywall" onclick="fa_icons($(this).attr('id'))"><i class="<?php echo $revtheme_home_categorywall['icon']; ?>"></i></span>
				<input type="hidden" name="revtheme_home_categorywall[icon]" value="<?php echo $revtheme_home_categorywall['icon']; ?>" id="input-icon_categorywall" />
			</div>
			<div class="col-sm-2" <?php if ($revtheme_home_categorywall['icontype']) { ?> style="display: none" <?php } ?>>
				<a href="" id="thumb-image_revtheme_home_categorywall" data-toggle="image" class="img-thumbnail width_initial"><img style="width:25px;" src="<?php echo $revtheme_home_categorywall_thumb; ?>" alt="" title="" data-placeholder="<?php echo $placeholder; ?>"/></a>
				<input type="hidden" name="revtheme_home_categorywall[image]" value="<?php echo $revtheme_home_categorywall['image']; ?>" id="revtheme_home_categorywall_image" />
			</div>
		</div>
		<div class="form-group">
			<label class="col-sm-2 control-label">Выводить:</label>
			<div class="col-sm-4">
				<select name="revtheme_home_categorywall[categories]" id="select6" onchange="showhide6();" class="form-control">
					<option value="0" <?php if ($revtheme_home_categorywall['categories']=='0') { ?>selected="selected"<?php } ?>>Все родительские категории</option>
					<option value="1" <?php if ($revtheme_home_categorywall['categories']=='1') { ?>selected="selected"<?php } ?>>Выборочные категории</option>
					<option value="2" <?php if ($revtheme_home_categorywall['categories']=='2') { ?>selected="selected"<?php } ?>>Выборочные производители</option>
				</select>
			</div>
		</div>
		<?php if ($revtheme_home_categorywall['categories']=='1') { $categorywall_categories_style="block";} else {$categorywall_categories_style="none";} ?>
		<div class="form-group" id="categorywall_categories_style" style="display:<?php echo $categorywall_categories_style; ?>;">
			<label class="col-sm-2 control-label" for="input-category">Категории:</label>
			<div class="col-sm-10">
				<div class="well well-sm" style="height: 200px; overflow: auto;">
					<?php foreach ($categories as $category) { ?>
						<div class="checkbox">
							<label>
							<?php if (in_array($category['category_id'], $revtheme_home_categorywall_categories)) { ?>
								<input type="checkbox" name="revtheme_home_categorywall_categories[]" value="<?php echo $category['category_id']; ?>" checked="checked" />
								<?php echo $category['name']; ?>
							<?php } else { ?>
								<input type="checkbox" name="revtheme_home_categorywall_categories[]" value="<?php echo $category['category_id']; ?>" />
								<?php echo $category['name']; ?>
							<?php } ?>
							</label>
						</div>
					<?php } ?>
				</div>
				<a onclick="$(this).parent().find(':checkbox').prop('checked', true);">Выделить все</a> / <a onclick="$(this).parent().find(':checkbox').prop('checked', false);">Снять выделения</a>
			</div>
		</div>
		<?php if ($revtheme_home_categorywall['categories']=='2') { $categorywall_categories_style2="block";} else {$categorywall_categories_style2="none";} ?>
		<div class="form-group" id="categorywall_categories_style2" style="display:<?php echo $categorywall_categories_style2; ?>;">
			<label class="col-sm-2 control-label" for="input-category">Производители:</label>
			<div class="col-sm-10">
				<div class="well well-sm" style="height: 200px; overflow: auto;">
					<?php foreach ($manufacturers as $manufacturer) { ?>
						<div class="checkbox">
							<label>
							<?php if (in_array($manufacturer['manufacturer_id'], $revtheme_home_categorywall_manufacturers)) { ?>
								<input type="checkbox" name="revtheme_home_categorywall_manufacturers[]" value="<?php echo $manufacturer['manufacturer_id']; ?>" checked="checked" />
								<?php echo $manufacturer['name']; ?>
							<?php } else { ?>
								<input type="checkbox" name="revtheme_home_categorywall_manufacturers[]" value="<?php echo $manufacturer['manufacturer_id']; ?>" />
								<?php echo $manufacturer['name']; ?>
							<?php } ?>
							</label>
						</div>
					<?php } ?>
				</div>
				<a onclick="$(this).parent().find(':checkbox').prop('checked', true);">Выделить все</a> / <a onclick="$(this).parent().find(':checkbox').prop('checked', false);">Снять выделения</a>
			</div>
		</div>
	</div>
	<div class="tab-pane text-style" id="tab_sliders_mod">
		<div class="form-group">
			<label class="col-sm-2 control-label">Отображение слайдеров:
			</label>
			<div class="col-sm-2">
				<label class="radio-inline">
					<input type="radio" name="revtheme_home_tabs" value="1" <?php if ($revtheme_home_tabs) { echo 'checked'; } ?> /><span>В табах</span>
				</label>
				<label class="radio-inline">
					<input type="radio" name="revtheme_home_tabs" value="0" <?php if (!$revtheme_home_tabs) { echo 'checked';} ?> /><span>Раздельно</span>
				</label>
			</div>
		</div>
		<div class="form-group">
			<div class="col-sm-12">
				<div class="form-group">
					<label class="col-sm-2 control-label">Слайдер последних товаров:
					</label>
					<div class="col-sm-2">
						<label class="radio-inline">
							<input type="radio" name="revtheme_home_last[status]" value="1" <?php if ($revtheme_home_last['status']) { echo 'checked'; } ?> /><span>Вкл.</span>
						</label>
						<label class="radio-inline">
							<input type="radio" name="revtheme_home_last[status]" value="0" <?php if (!$revtheme_home_last['status']) { echo 'checked';} ?> /><span>Выкл.</span>
						</label>
					</div>
				</div>
			</div>
			<div class="col-sm-12">
				<div class="form-group">
					<label class="col-sm-2 control-label">Заголовок:</label>
					<div class="col-sm-3">
							<?php foreach ($languages as $language) { ?>
								<div class="input-group">
									<span class="input-group-addon"><img src="<?php echo (VERSION >= 2.2) ? 'language/'.$language['code'].'/'.$language['code'].'.png' : 'view/image/flags/'.$language['image']; ?>" title="<?php echo $language['name']; ?>" /></span>
									<input class="form-control" type="text" name="revtheme_home_last[<?php echo $language['language_id']; ?>][title]" value="<?php echo(isset($revtheme_home_last[$language['language_id']]['title']) ? $revtheme_home_last[$language['language_id']]['title'] : 'Новинки') ?>" />
								</div>
							<?php } ?>
					</div>
				</div>
			</div>
			<div class="col-sm-12">
				<div class="form-group">
					<label class="col-sm-2 control-label">Иконка:</label>
					<div class="col-sm-2">
						<label class="radio-inline">
							<input type="radio" class="revtheme_home_last_radio" onChange="revtheme_home_last_zavisimost(this)" name="revtheme_home_last[icontype]" value="1" <?php if ($revtheme_home_last['icontype']) { echo 'checked'; } ?> /><span>Иконка</span>
						</label>
						<label class="radio-inline">
							<input type="radio" class="revtheme_home_last_radio" onChange="revtheme_home_last_zavisimost(this)" name="revtheme_home_last[icontype]" value="0" <?php if (!$revtheme_home_last['icontype']) { echo 'checked';} ?> /><span>Картинка</span>
						</label>	
					</div>
					<div class="col-sm-2 revtheme_home_last_zavisimost_1">
						<span class="fazavisimost fa_icon form-control width_initial" id="icon_home_last" onclick="fa_icons($(this).attr('id'))"><i class="<?php echo $revtheme_home_last['icon']; ?>"></i></span>
						<input type="hidden" name="revtheme_home_last[icon]" value="<?php echo $revtheme_home_last['icon']; ?>" id="input-icon_home_last" />
					</div>
					<div class="col-sm-2 revtheme_home_last_zavisimost_2">
						<a href="" id="thumb-image_revtheme_home_last" data-toggle="image" class="img-thumbnail width_initial"><img style="width:25px;" src="<?php echo $revtheme_home_last_image; ?>" alt="" title="" data-placeholder="<?php echo $placeholder; ?>" /></a>
						<input type="hidden" name="revtheme_home_last[image]" value="<?php echo $revtheme_home_last['image']; ?>" id="revtheme_home_last_image" />
					</div>
				</div>
			</div>
			<div class="col-sm-12">
				<div class="form-group">
					<label class="col-sm-2 control-label">Лимит товаров:</label>
					<div class="col-sm-2">
							<input class="form-control width_initial" type="text" name="revtheme_home_last[limit]" value="<?php echo $revtheme_home_last['limit']; ?>" />
					</div>
				</div>
			</div>
			<div class="col-sm-12">
				<div class="form-group">
					<label class="col-sm-2 control-label"><span data-toggle="tooltip" title="Если отключена возможность заказа товаров при 0 количестве или цене.">Не выводить товары<br>с кол-вом или ценой = 0:</span></label>
					<div class="col-sm-2">
						<label class="radio-inline">
							<input type="radio" name="revtheme_home_last[not_view_null]" value="1" <?php if ($revtheme_home_last['not_view_null']) { echo 'checked'; } ?> /><span>Вкл.</span>
						</label>
						<label class="radio-inline">
							<input type="radio" name="revtheme_home_last[not_view_null]" value="0" <?php if (!$revtheme_home_last['not_view_null']) { echo 'checked';} ?> /><span>Выкл.</span>
						</label>
					</div>
				</div>
			</div>
			<div class="col-sm-12">
				<div class="form-group">
					<label class="col-sm-2 control-label">Слайдер товаров:
					</label>
					<div class="col-sm-2">
						<label class="radio-inline">
							<input type="radio" onchange="$(this).parent().parent().parent().parent().next().show();" name="revtheme_home_last[slider]" value="1" <?php if ($revtheme_home_last['slider']) { echo 'checked'; } ?> /><span>Да</span>
						</label>
						<label class="radio-inline">
							<input type="radio" onchange="$(this).parent().parent().parent().parent().next().hide();" name="revtheme_home_last[slider]" value="0" <?php if (!$revtheme_home_last['slider']) { echo 'checked';} ?> /><span>Нет</span>
						</label>
					</div>
				</div>
			</div>
			<div class="col-sm-12" <?php if (!$revtheme_home_last['slider']) { ?> style="display: none" <?php } ?>>
				<div class="form-group">
					<label class="col-sm-2 control-label"><span data-toggle="tooltip" title="Период через который будет срабатывать автопрокрутка.<br/>Оставьте пустым чтобы отключить.">Автопрокрутка (сек):</span></label>
					<div class="col-sm-2">
						<input type="text" name="revtheme_home_last[autoscroll]" value="<?php echo $revtheme_home_last['autoscroll']; ?>" class="form-control" />
					</div>
				</div>
			</div>
			<div class="col-sm-12">
				<div class="form-group">
					<label class="col-sm-2 control-label">Изображение (Ш x В):</label>
					<div class="col-sm-4">
						<input class="form-control width_initial" type="text" name="revtheme_home_last[image_width]" value="<?php echo $revtheme_home_last['image_width']; ?>" /> x 
						<input class="form-control width_initial" type="text" name="revtheme_home_last[image_height]" value="<?php echo $revtheme_home_last['image_height']; ?>" /> px
					</div>
				</div>
			</div>
		</div>
		<hr>
		<div class="form-group">
			<div class="col-sm-12">
				<div class="form-group">
					<label class="col-sm-2 control-label">Слайдер хитов продаж:
					</label>
					<div class="col-sm-2">
						<label class="radio-inline">
							<input type="radio" name="revtheme_home_best[status]" value="1" <?php if ($revtheme_home_best['status']) { echo 'checked'; } ?> /><span>Вкл.</span>
						</label>
						<label class="radio-inline">
							<input type="radio" name="revtheme_home_best[status]" value="0" <?php if (!$revtheme_home_best['status']) { echo 'checked';} ?> /><span>Выкл.</span>
						</label>
					</div>
				</div>
			</div>
			<div class="col-sm-12">
				<div class="form-group">
					<label class="col-sm-2 control-label">Заголовок:</label>
					<div class="col-sm-3">
							<?php foreach ($languages as $language) { ?>
								<div class="input-group">
									<span class="input-group-addon"><img src="<?php echo (VERSION >= 2.2) ? 'language/'.$language['code'].'/'.$language['code'].'.png' : 'view/image/flags/'.$language['image']; ?>" title="<?php echo $language['name']; ?>" /></span>
									<input class="form-control" type="text" name="revtheme_home_best[<?php echo $language['language_id']; ?>][title]" value="<?php echo(isset($revtheme_home_best[$language['language_id']]['title']) ? $revtheme_home_best[$language['language_id']]['title'] : 'Хиты продаж') ?>" />
								</div>
							<?php } ?>
					</div>
				</div>
			</div>
			<div class="col-sm-12">
				<div class="form-group">
					<label class="col-sm-2 control-label">Иконка:</label>
					<div class="col-sm-2">
						<label class="radio-inline">
							<input type="radio" class="revtheme_home_best_radio" onChange="revtheme_home_best_zavisimost(this)" name="revtheme_home_best[icontype]" value="1" <?php if ($revtheme_home_best['icontype']) { echo 'checked'; } ?> /><span>Иконка</span>
						</label>
						<label class="radio-inline">
							<input type="radio" class="revtheme_home_best_radio" onChange="revtheme_home_best_zavisimost(this)" name="revtheme_home_best[icontype]" value="0" <?php if (!$revtheme_home_best['icontype']) { echo 'checked';} ?> /><span>Картинка</span>
						</label>	
					</div>
					<div class="col-sm-2 revtheme_home_best_zavisimost_1">
						<span class="fazavisimost fa_icon form-control width_initial" id="icon_home_best" onclick="fa_icons($(this).attr('id'))"><i class="<?php echo $revtheme_home_best['icon']; ?>"></i></span>
						<input type="hidden" name="revtheme_home_best[icon]" value="<?php echo $revtheme_home_best['icon']; ?>" id="input-icon_home_best" />
					</div>
					<div class="col-sm-2 revtheme_home_best_zavisimost_2">
						<a href="" id="thumb-image_revtheme_home_best" data-toggle="image" class="img-thumbnail width_initial"><img style="width:25px;" src="<?php echo $revtheme_home_best_image; ?>" alt="" title="" data-placeholder="<?php echo $placeholder; ?>" /></a>
						<input type="hidden" name="revtheme_home_best[image]" value="<?php echo $revtheme_home_best['image']; ?>" id="revtheme_home_best_image" />
					</div>
				</div>
			</div>
			<div class="col-sm-12">
				<div class="form-group">
					<label class="col-sm-2 control-label">Лимит товаров:</label>
					<div class="col-sm-2">
							<input class="form-control width_initial" type="text" name="revtheme_home_best[limit]" value="<?php echo $revtheme_home_best['limit']; ?>" />
					</div>
				</div>
			</div>
			<div class="col-sm-12">
				<div class="form-group">
					<label class="col-sm-2 control-label"><span data-toggle="tooltip" title="Если отключена возможность заказа товаров при 0 количестве или цене.">Не выводить товары<br>с кол-вом или ценой = 0:</span></label>
					<div class="col-sm-2">
						<label class="radio-inline">
							<input type="radio" name="revtheme_home_best[not_view_null]" value="1" <?php if ($revtheme_home_best['not_view_null']) { echo 'checked'; } ?> /><span>Вкл.</span>
						</label>
						<label class="radio-inline">
							<input type="radio" name="revtheme_home_best[not_view_null]" value="0" <?php if (!$revtheme_home_best['not_view_null']) { echo 'checked';} ?> /><span>Выкл.</span>
						</label>
					</div>
				</div>
			</div>
			<div class="col-sm-12">
				<div class="form-group">
					<label class="col-sm-2 control-label">Слайдер товаров:
					</label>
					<div class="col-sm-2">
						<label class="radio-inline">
							<input type="radio" onchange="$(this).parent().parent().parent().parent().next().show();" name="revtheme_home_best[slider]" value="1" <?php if ($revtheme_home_best['slider']) { echo 'checked'; } ?> /><span>Да</span>
						</label>
						<label class="radio-inline">
							<input type="radio" onchange="$(this).parent().parent().parent().parent().next().hide();" name="revtheme_home_best[slider]" value="0" <?php if (!$revtheme_home_best['slider']) { echo 'checked';} ?> /><span>Нет</span>
						</label>
					</div>
				</div>
			</div>
			<div class="col-sm-12" <?php if (!$revtheme_home_best['slider']) { ?> style="display: none" <?php } ?>>
				<div class="form-group">
					<label class="col-sm-2 control-label"><span data-toggle="tooltip" title="Период через который будет срабатывать автопрокрутка.<br/>Оставьте пустым чтобы отключить.">Автопрокрутка (сек):</span></label>
					<div class="col-sm-2">
						<input type="text" name="revtheme_home_best[autoscroll]" value="<?php echo $revtheme_home_best['autoscroll']; ?>" class="form-control" />
					</div>
				</div>
			</div>
			<div class="col-sm-12">
				<div class="form-group">
					<label class="col-sm-2 control-label">Изображение (Ш x В):</label>
					<div class="col-sm-4">
						<input class="form-control width_initial" type="text" name="revtheme_home_best[image_width]" value="<?php echo $revtheme_home_best['image_width']; ?>" /> x 
						<input class="form-control width_initial" type="text" name="revtheme_home_best[image_height]" value="<?php echo $revtheme_home_best['image_height']; ?>" /> px
					</div>
				</div>
			</div>
		</div>
		<hr>
		<div class="form-group">
			<div class="col-sm-12">
				<div class="form-group">
					<label class="col-sm-2 control-label">Слайдер спецпредложений:
					</label>
					<div class="col-sm-2">
						<label class="radio-inline">
							<input type="radio" name="revtheme_home_spec[status]" value="1" <?php if ($revtheme_home_spec['status']) { echo 'checked'; } ?> /><span>Вкл.</span>
						</label>
						<label class="radio-inline">
							<input type="radio" name="revtheme_home_spec[status]" value="0" <?php if (!$revtheme_home_spec['status']) { echo 'checked';} ?> /><span>Выкл.</span>
						</label>
					</div>
				</div>
			</div>
			<div class="col-sm-12">
				<div class="form-group">
					<label class="col-sm-2 control-label">Заголовок:</label>
					<div class="col-sm-3">
							<?php foreach ($languages as $language) { ?>
								<div class="input-group">
									<span class="input-group-addon"><img src="<?php echo (VERSION >= 2.2) ? 'language/'.$language['code'].'/'.$language['code'].'.png' : 'view/image/flags/'.$language['image']; ?>" title="<?php echo $language['name']; ?>" /></span>
									<input class="form-control" type="text" name="revtheme_home_spec[<?php echo $language['language_id']; ?>][title]" value="<?php echo(isset($revtheme_home_spec[$language['language_id']]['title']) ? $revtheme_home_spec[$language['language_id']]['title'] : 'Акции') ?>" />
								</div>
							<?php } ?>
					</div>
				</div>
			</div>
			<div class="col-sm-12">
				<div class="form-group">
					<label class="col-sm-2 control-label">Иконка:</label>
					<div class="col-sm-2">
						<label class="radio-inline">
							<input type="radio" class="revtheme_home_spec_radio" onChange="revtheme_home_spec_zavisimost(this)" name="revtheme_home_spec[icontype]" value="1" <?php if ($revtheme_home_spec['icontype']) { echo 'checked'; } ?> /><span>Иконка</span>
						</label>
						<label class="radio-inline">
							<input type="radio" class="revtheme_home_spec_radio" onChange="revtheme_home_spec_zavisimost(this)" name="revtheme_home_spec[icontype]" value="0" <?php if (!$revtheme_home_spec['icontype']) { echo 'checked';} ?> /><span>Картинка</span>
						</label>	
					</div>
					<div class="col-sm-2 revtheme_home_spec_zavisimost_1">
						<span class="fazavisimost fa_icon form-control width_initial" id="icon_home_spec" onclick="fa_icons($(this).attr('id'))"><i class="<?php echo $revtheme_home_spec['icon']; ?>"></i></span>
						<input type="hidden" name="revtheme_home_spec[icon]" value="<?php echo $revtheme_home_spec['icon']; ?>" id="input-icon_home_spec" />
					</div>
					<div class="col-sm-2 revtheme_home_spec_zavisimost_2">
						<a href="" id="thumb-image_revtheme_home_spec" data-toggle="image" class="img-thumbnail width_initial"><img style="width:25px;" src="<?php echo $revtheme_home_spec_image; ?>" alt="" title="" data-placeholder="<?php echo $placeholder; ?>" /></a>
						<input type="hidden" name="revtheme_home_spec[image]" value="<?php echo $revtheme_home_spec['image']; ?>" id="revtheme_home_spec_image" />
					</div>
				</div>
			</div>
			<div class="col-sm-12">
				<div class="form-group">
					<label class="col-sm-2 control-label">Лимит товаров:</label>
					<div class="col-sm-2">
							<input class="form-control width_initial" type="text" name="revtheme_home_spec[limit]" value="<?php echo $revtheme_home_spec['limit']; ?>" />
					</div>
				</div>
			</div>
			<div class="col-sm-12">
				<div class="form-group">
					<label class="col-sm-2 control-label"><span data-toggle="tooltip" title="Если отключена возможность заказа товаров при 0 количестве или цене.">Не выводить товары<br>с кол-вом или ценой = 0:</span></label>
					<div class="col-sm-2">
						<label class="radio-inline">
							<input type="radio" name="revtheme_home_spec[not_view_null]" value="1" <?php if ($revtheme_home_spec['not_view_null']) { echo 'checked'; } ?> /><span>Вкл.</span>
						</label>
						<label class="radio-inline">
							<input type="radio" name="revtheme_home_spec[not_view_null]" value="0" <?php if (!$revtheme_home_spec['not_view_null']) { echo 'checked';} ?> /><span>Выкл.</span>
						</label>
					</div>
				</div>
			</div>
			<div class="col-sm-12">
				<div class="form-group">
					<label class="col-sm-2 control-label">Слайдер товаров:
					</label>
					<div class="col-sm-2">
						<label class="radio-inline">
							<input type="radio" onchange="$(this).parent().parent().parent().parent().next().show();" name="revtheme_home_spec[slider]" value="1" <?php if ($revtheme_home_spec['slider']) { echo 'checked'; } ?> /><span>Да</span>
						</label>
						<label class="radio-inline">
							<input type="radio" onchange="$(this).parent().parent().parent().parent().next().hide();" name="revtheme_home_spec[slider]" value="0" <?php if (!$revtheme_home_spec['slider']) { echo 'checked';} ?> /><span>Нет</span>
						</label>
					</div>
				</div>
			</div>
			<div class="col-sm-12" <?php if (!$revtheme_home_spec['slider']) { ?> style="display: none" <?php } ?>>
				<div class="form-group">
					<label class="col-sm-2 control-label"><span data-toggle="tooltip" title="Период через который будет срабатывать автопрокрутка.<br/>Оставьте пустым чтобы отключить.">Автопрокрутка (сек):</span></label>
					<div class="col-sm-2">
						<input type="text" name="revtheme_home_spec[autoscroll]" value="<?php echo $revtheme_home_spec['autoscroll']; ?>" class="form-control" />
					</div>
				</div>
			</div>
			<div class="col-sm-12">
				<div class="form-group">
					<label class="col-sm-2 control-label">Изображение (Ш x В):</label>
					<div class="col-sm-4">
						<input class="form-control width_initial" type="text" name="revtheme_home_spec[image_width]" value="<?php echo $revtheme_home_spec['image_width']; ?>" /> x 
						<input class="form-control width_initial" type="text" name="revtheme_home_spec[image_height]" value="<?php echo $revtheme_home_spec['image_height']; ?>" /> px
					</div>
				</div>
			</div>
		</div>
	</div>
	<div class="tab-pane text-style" id="tab_slider1">
		<div class="form-group">
			<label class="col-sm-2 control-label">Включен:
			</label>
			<div class="col-sm-2">
				<label class="radio-inline">
					<input type="radio" name="revtheme_slider_1[status]" value="1" <?php if ($revtheme_slider_1['status']) { echo 'checked'; } ?> /><span>Да</span>
				</label>
				<label class="radio-inline">
					<input type="radio" name="revtheme_slider_1[status]" value="0" <?php if (!$revtheme_slider_1['status']) { echo 'checked';} ?> /><span>Нет</span>
				</label>
			</div>
		</div>
		<div class="form-group">
			<label class="col-sm-2 control-label">Заголовок:</label>
			<div class="col-sm-3">
				<?php foreach ($languages as $language) { ?>
					<div class="input-group">
						<span class="input-group-addon"><img src="<?php echo (VERSION >= 2.2) ? 'language/'.$language['code'].'/'.$language['code'].'.png' : 'view/image/flags/'.$language['image']; ?>" title="<?php echo $language['name']; ?>" /></span>
						<input class="form-control" type="text" name="revtheme_slider_1[<?php echo $language['language_id']; ?>][title]" value="<?php echo(isset($revtheme_slider_1[$language['language_id']]['title']) ? $revtheme_slider_1[$language['language_id']]['title'] : '') ?>" />
					</div>
				<?php } ?>
			</div>
		</div>
		<div class="form-group">
			<label class="col-sm-2 control-label">Иконка:</label>
			<div class="col-sm-2">
				<label class="radio-inline">
					<input type="radio" onchange="$(this).parent().parent().parent().find('.zavisimost_ico').show().next().hide();" name="revtheme_slider_1[icontype]" value="1" <?php if ($revtheme_slider_1['icontype']) { echo 'checked'; } ?> /><span>Иконка</span>
				</label>
				<label class="radio-inline">
					<input type="radio" onchange="$(this).parent().parent().parent().find('.zavisimost_ico').hide().next().show();" name="revtheme_slider_1[icontype]" value="0" <?php if (!$revtheme_slider_1['icontype']) { echo 'checked';} ?> /><span>Картинка</span>
				</label>	
			</div>
			<div class="col-sm-2 zavisimost_ico" <?php if (!$revtheme_slider_1['icontype']) { ?> style="display: none" <?php } ?>>
				<span class="fazavisimost fa_icon form-control width_initial" id="icon_slider_1" onclick="fa_icons($(this).attr('id'))"><i class="<?php echo $revtheme_slider_1['icon']; ?>"></i></span>
				<input type="hidden" name="revtheme_slider_1[icon]" value="<?php echo $revtheme_slider_1['icon']; ?>" id="input-icon_slider1" />
			</div>
			<div class="col-sm-2" <?php if ($revtheme_slider_1['icontype']) { ?> style="display: none" <?php } ?>>
				<a href="" id="thumb-image_icon_slider1" data-toggle="image" class="img-thumbnail width_initial"><img style="width:25px;" src="<?php echo $revtheme_slider_1_thumb; ?>" alt="" title="" data-placeholder="<?php echo $placeholder; ?>" /></a>
				<input type="hidden" name="revtheme_slider_1[image]" value="<?php echo $revtheme_slider_1['image']; ?>" id="icon_slider1_image" />
			</div>
		</div>
		<div class="form-group">
			<label class="col-sm-2 control-label">Лимит товаров:</label>
			<div class="col-sm-2">
					<input class="form-control width_initial" type="text" name="revtheme_slider_1[count]" value="<?php echo $revtheme_slider_1['count']; ?>" />
			</div>
		</div>
		<div class="form-group">
			<label class="col-sm-2 control-label"><span data-toggle="tooltip" title="Если отключена возможность заказа товаров при 0 количестве или цене.">Не выводить товары<br>с кол-вом или ценой = 0:</span></label>
			<div class="col-sm-2">
				<label class="radio-inline">
					<input type="radio" name="revtheme_slider_1[not_view_null]" value="1" <?php if ($revtheme_slider_1['not_view_null']) { echo 'checked'; } ?> /><span>Вкл.</span>
				</label>
				<label class="radio-inline">
					<input type="radio" name="revtheme_slider_1[not_view_null]" value="0" <?php if (!$revtheme_slider_1['not_view_null']) { echo 'checked';} ?> /><span>Выкл.</span>
				</label>
			</div>
		</div>
		<div class="form-group">
			<label class="col-sm-2 control-label">Слайдер товаров:
			</label>
			<div class="col-sm-2">
				<label class="radio-inline">
					<input type="radio" name="revtheme_slider_1[slider]" value="1" <?php if ($revtheme_slider_1['slider']) { echo 'checked'; } ?> /><span>Да</span>
				</label>
				<label class="radio-inline">
					<input type="radio" name="revtheme_slider_1[slider]" value="0" <?php if (!$revtheme_slider_1['slider']) { echo 'checked';} ?> /><span>Нет</span>
				</label>
			</div>
		</div>
		<div class="form-group">
			<label class="col-sm-2 control-label">Изображение (Ш x В):</label>
			<div class="col-sm-4">
				<input class="form-control width_initial" type="text" name="revtheme_slider_1[image_width]" value="<?php echo $revtheme_slider_1['image_width']; ?>" /> x 
				<input class="form-control width_initial" type="text" name="revtheme_slider_1[image_height]" value="<?php echo $revtheme_slider_1['image_height']; ?>" /> px
			</div>
		</div>
		<div class="form-group">
			<label class="col-sm-2 control-label">Источник товаров:</label>
			<div class="col-sm-4">
				<select name="revtheme_slider_1[category_id]" id="select" onchange="showhide();" class="form-control">
					<option value="0" <?php if ($revtheme_slider_1['category_id']=='0') { ?>selected="selected"<?php } ?>>Все товары</option>
					<option value="featured" <?php if ($revtheme_slider_1['category_id']=='featured') { ?>selected="selected"<?php } ?>>Выборочные товары</option>
				<?php foreach ($rootcats as $rootcat) { ?>
					<?php if ($rootcat['category_id'] == $revtheme_slider_1['category_id']) { ?>
						<option value="<?php echo $rootcat['category_id']; ?>" selected="selected"><?php echo $rootcat['name']; ?></option>
					<?php } else { ?>
						<option value="<?php echo $rootcat['category_id']; ?>"><?php echo $rootcat['name']; ?></option>
					<?php } ?>
				<?php } ?>
				</select>
			</div>
		</div>
		<?php if ($revtheme_slider_1['category_id']=='featured') { $featured_style="block";} else {$featured_style="none";}?>
		<div class="form-group" id="rowfeatured" style="display:<?php echo $featured_style; ?>;">
			<label class="col-sm-2 control-label">Товары (автозаполнение):</label>
			<div class="col-sm-4">
				<input type="text" name="product" value="" placeholder="Товары" id="input-product" class="form-control" />
				<br/>
				<div class="scrollbox well well-sm" id="featured-product" style="height: 150px; overflow: auto;">
					<?php $class = 'odd'; ?>
					<?php foreach ($products as $product) { ?>
						<?php $class = ($class == 'even' ? 'odd' : 'even'); ?>
						<div id="featured-product<?php echo $product['product_id']; ?>" class="<?php echo $class; ?>"><?php echo $product['name']; ?> <i class="fa fa-minus-circle"></i>
							<input type="hidden" value="<?php echo $product['product_id']; ?>" />
						</div>
					<?php } ?>
				</div>
				<input type="hidden" name="revtheme_slider_1[featured]" value="<?php echo $revtheme_slider_1['featured']; ?>" />
			</div>
		</div>
		<?php if ($revtheme_slider_1['category_id']=='featured') { $featured_style="none";} else {$featured_style="block";}?>
		<div class="form-group" id="catonly" style="display:<?php echo $featured_style;?>;">
			<label class="col-sm-2 control-label">Фильтр по производителю:</label>
			<div class="col-sm-4 scrollbox" id="featured-product">
				<select name="revtheme_slider_1[manufacturer_id]" id="select" class="form-control">
					<option value="0" <?php if ($revtheme_slider_1['manufacturer_id']=='0') { ?>selected="selected"<?php } ?>>Все производители</option>
				<?php if (isset($manufacturers1)){
					foreach ($manufacturers1 as $manufacturer) { ?>
						<?php if ($manufacturer['manufacturer_id'] == $revtheme_slider_1['manufacturer_id']) { ?>
							<option value="<?php echo $manufacturer['manufacturer_id']; ?>" selected="selected"><?php echo $manufacturer['name']; ?></option>
						<?php } else { ?>
							<option value="<?php echo $manufacturer['manufacturer_id']; ?>"><?php echo $manufacturer['name']; ?></option>
						<?php } ?>
					<?php } ?>
				<?php } ?>
				</select>
			</div>
		</div>
		<?php if ($revtheme_slider_1['category_id']=='featured') { $featured_style3="block";} else {$featured_style3="none";}?>
		<div class="form-group" style="display:<?php echo $featured_style;?>;">
			<label class="col-sm-2 control-label">Сортировка и фильтрация:</label>
			<div class="col-sm-4">
				<select name="revtheme_slider_1[sort]" class="form-control">
				<?php if ($revtheme_slider_1['sort'] == 'p.date_added') { ?>
					<option value="p.date_added" selected="selected"><?php echo $text_sort_date_added; ?></option>
				<?php } else { ?>
					<option value="p.date_added"><?php echo $text_sort_date_added; ?></option>
				<?php } ?>
				<?php if ($revtheme_slider_1['sort'] == 'rating') { ?>
					<option value="rating" selected="selected"><?php echo $text_sort_rating; ?></option>
				<?php } else { ?>
					<option value="rating"><?php echo $text_sort_rating; ?></option>
				<?php } ?>
				<?php if ($revtheme_slider_1['sort'] == 'p.viewed') { ?>
					<option value="p.viewed" selected="selected"><?php echo $text_sort_viewed; ?></option>
				<?php } else { ?>
					<option value="p.viewed"><?php echo $text_sort_viewed; ?></option>
				<?php } ?>
				<?php if ($revtheme_slider_1['sort'] == 'p.sort_order') { ?>
					<option value="p.sort_order" selected="selected"><?php echo $text_sort_order; ?></option>
				<?php } else { ?>
					<option value="p.sort_order"><?php echo $text_sort_order; ?></option>
				<?php } ?>
				<?php if ($revtheme_slider_1['sort'] == 'topsellers') { ?>
					<option value="topsellers" selected="selected"><?php echo $text_sort_bestseller; ?></option>
				<?php } else { ?>
					<option value="topsellers"><?php echo $text_sort_bestseller; ?></option>
				<?php } ?>
				<?php if ($revtheme_slider_1['sort'] == 'special') { ?>
					<option value="special" selected="selected"><?php echo $text_sort_special; ?></option>
				<?php } else { ?>
					<option value="special"><?php echo $text_sort_special; ?></option>
				<?php } ?>
				</select>
			</div>
		</div>
		<div class="form-group">
			<label class="col-sm-2 control-label" for="autoscroll"><span data-toggle="tooltip" title="Период через который будет срабатывать автопрокрутка.<br/>Оставьте пустым чтобы отключить.">Автопрокрутка (сек):</span></label>
			<div class="col-sm-2">
				<input type="text" name="revtheme_slider_1[autoscroll]" value="<?php echo $revtheme_slider_1['autoscroll']; ?>" class="form-control" />
			</div>
		</div>
	</div>
	<div class="tab-pane text-style" id="tab_slider2">
		<div class="form-group">
			<label class="col-sm-2 control-label">Включен:
			</label>
			<div class="col-sm-2">
				<label class="radio-inline">
					<input type="radio" name="revtheme_slider_2[status]" value="1" <?php if ($revtheme_slider_2['status']) { echo 'checked'; } ?> /><span>Да</span>
				</label>
				<label class="radio-inline">
					<input type="radio" name="revtheme_slider_2[status]" value="0" <?php if (!$revtheme_slider_2['status']) { echo 'checked';} ?> /><span>Нет</span>
				</label>
			</div>
		</div>
		<div class="form-group">
			<label class="col-sm-2 control-label">Заголовок:</label>
			<div class="col-sm-3">
				<?php foreach ($languages as $language) { ?>
					<div class="input-group">
						<span class="input-group-addon"><img src="<?php echo (VERSION >= 2.2) ? 'language/'.$language['code'].'/'.$language['code'].'.png' : 'view/image/flags/'.$language['image']; ?>" title="<?php echo $language['name']; ?>" /></span>
						<input class="form-control" type="text" name="revtheme_slider_2[<?php echo $language['language_id']; ?>][title]" value="<?php echo(isset($revtheme_slider_2[$language['language_id']]['title']) ? $revtheme_slider_2[$language['language_id']]['title'] : '') ?>" />
					</div>
				<?php } ?>
			</div>
		</div>
		<div class="form-group">
			<label class="col-sm-2 control-label">Иконка:</label>
			<div class="col-sm-2">
				<label class="radio-inline">
					<input type="radio" onchange="$(this).parent().parent().parent().find('.zavisimost_ico').show().next().hide();" name="revtheme_slider_2[icontype]" value="1" <?php if ($revtheme_slider_2['icontype']) { echo 'checked'; } ?> /><span>Иконка</span>
				</label>
				<label class="radio-inline">
					<input type="radio" onchange="$(this).parent().parent().parent().find('.zavisimost_ico').hide().next().show();" name="revtheme_slider_2[icontype]" value="0" <?php if (!$revtheme_slider_2['icontype']) { echo 'checked';} ?> /><span>Картинка</span>
				</label>	
			</div>
			<div class="col-sm-2 zavisimost_ico" <?php if (!$revtheme_slider_2['icontype']) { ?> style="display: none" <?php } ?>>
				<span class="fazavisimost fa_icon form-control width_initial" id="icon_slider_2" onclick="fa_icons($(this).attr('id'))"><i class="<?php echo $revtheme_slider_2['icon']; ?>"></i></span>
				<input type="hidden" name="revtheme_slider_2[icon]" value="<?php echo $revtheme_slider_2['icon']; ?>" id="input-icon_slider2" />
			</div>
			<div class="col-sm-2" <?php if ($revtheme_slider_2['icontype']) { ?> style="display: none" <?php } ?>>
				<a href="" id="thumb-image_icon_slider2" data-toggle="image" class="img-thumbnail width_initial"><img style="width:25px;" src="<?php echo $revtheme_slider_2_thumb; ?>" alt="" title="" data-placeholder="<?php echo $placeholder; ?>" /></a>
				<input type="hidden" name="revtheme_slider_2[image]" value="<?php echo $revtheme_slider_2['image']; ?>" id="icon_slider2_image" />
			</div>
		</div>
		<div class="form-group">
			<label class="col-sm-2 control-label">Лимит товаров:</label>
			<div class="col-sm-2">
					<input class="form-control width_initial" type="text" name="revtheme_slider_2[count]" value="<?php echo $revtheme_slider_2['count']; ?>" />
			</div>
		</div>
		<div class="form-group">
			<label class="col-sm-2 control-label"><span data-toggle="tooltip" title="Если отключена возможность заказа товаров при 0 количестве или цене.">Не выводить товары<br>с кол-вом или ценой = 0:</span></label>
			<div class="col-sm-2">
				<label class="radio-inline">
					<input type="radio" name="revtheme_slider_2[not_view_null]" value="1" <?php if ($revtheme_slider_2['not_view_null']) { echo 'checked'; } ?> /><span>Вкл.</span>
				</label>
				<label class="radio-inline">
					<input type="radio" name="revtheme_slider_2[not_view_null]" value="0" <?php if (!$revtheme_slider_2['not_view_null']) { echo 'checked';} ?> /><span>Выкл.</span>
				</label>
			</div>
		</div>
		<div class="form-group">
			<label class="col-sm-2 control-label">Слайдер товаров:
			</label>
			<div class="col-sm-2">
				<label class="radio-inline">
					<input type="radio" name="revtheme_slider_2[slider]" value="1" <?php if ($revtheme_slider_2['slider']) { echo 'checked'; } ?> /><span>Да</span>
				</label>
				<label class="radio-inline">
					<input type="radio" name="revtheme_slider_2[slider]" value="0" <?php if (!$revtheme_slider_2['slider']) { echo 'checked';} ?> /><span>Нет</span>
				</label>
			</div>
		</div>
		<div class="form-group">
			<label class="col-sm-2 control-label">Изображение (Ш x В):</label>
			<div class="col-sm-4">
				<input class="form-control width_initial" type="text" name="revtheme_slider_2[image_width]" value="<?php echo $revtheme_slider_2['image_width']; ?>" /> x 
				<input class="form-control width_initial" type="text" name="revtheme_slider_2[image_height]" value="<?php echo $revtheme_slider_2['image_height']; ?>" /> px
			</div>
		</div>
		<div class="form-group">
			<label class="col-sm-2 control-label">Источник товаров:</label>
			<div class="col-sm-4">
				<select name="revtheme_slider_2[category_id]" id="select2" onchange="showhide2();" class="form-control">
					<option value="0" <?php if ($revtheme_slider_2['category_id']=='0') { ?>selected="selected"<?php } ?>>Все товары</option>
					<option value="featured" <?php if ($revtheme_slider_2['category_id']=='featured') { ?>selected="selected"<?php } ?>>Выборочные товары</option>
				<?php foreach ($rootcats2 as $rootcat) { ?>
					<?php if ($rootcat['category_id'] == $revtheme_slider_2['category_id']) { ?>
						<option value="<?php echo $rootcat['category_id']; ?>" selected="selected"><?php echo $rootcat['name']; ?></option>
					<?php } else { ?>
						<option value="<?php echo $rootcat['category_id']; ?>"><?php echo $rootcat['name']; ?></option>
					<?php } ?>
				<?php } ?>
				</select>
			</div>
		</div>
		<?php if ($revtheme_slider_2['category_id']=='featured') { $featured_style2="block";} else {$featured_style2="none";}?>
		<div class="form-group" id="rowfeatured2" style="display:<?php echo $featured_style2; ?>;">
			<label class="col-sm-2 control-label">Товары (автозаполнение):</label>
			<div class="col-sm-4">
				<input type="text" name="product2" value="" placeholder="Товары" id="input-product" class="form-control" />
				<br/>
				<div class="scrollbox2 well well-sm" id="featured-product2" style="height: 150px; overflow: auto;">
					<?php $class = 'odd'; ?>
					<?php foreach ($products2 as $product) { ?>
						<?php $class = ($class == 'even' ? 'odd' : 'even'); ?>
						<div id="featured-product2<?php echo $product['product_id']; ?>" class="<?php echo $class; ?>"><?php echo $product['name']; ?> <i class="fa fa-minus-circle"></i>
							<input type="hidden" value="<?php echo $product['product_id']; ?>" />
						</div>
					<?php } ?>
				</div>
				<input type="hidden" name="revtheme_slider_2[featured]" value="<?php echo $revtheme_slider_2['featured']; ?>" />
			</div>
		</div>
		<?php if ($revtheme_slider_2['category_id']=='featured') { $featured_style2="none";} else {$featured_style2="block";}?>
		<div class="form-group" id="catonly2" style="display:<?php echo $featured_style2;?>;">
			<label class="col-sm-2 control-label">Фильтр по производителю:</label>
			<div class="col-sm-4 scrollbox2" id="featured-product2">
				<select name="revtheme_slider_2[manufacturer_id]" id="select2" class="form-control">
					<option value="0" <?php if ($revtheme_slider_2['manufacturer_id']=='0') { ?>selected="selected"<?php } ?>>Все производители</option>
				<?php if (isset($manufacturers2)){
					foreach ($manufacturers2 as $manufacturer) { ?>
						<?php if ($manufacturer['manufacturer_id'] == $revtheme_slider_2['manufacturer_id']) { ?>
							<option value="<?php echo $manufacturer['manufacturer_id']; ?>" selected="selected"><?php echo $manufacturer['name']; ?></option>
						<?php } else { ?>
							<option value="<?php echo $manufacturer['manufacturer_id']; ?>"><?php echo $manufacturer['name']; ?></option>
						<?php } ?>
					<?php } ?>
				<?php } ?>
				</select>
			</div>
		</div>
		<?php if ($revtheme_slider_2['category_id']=='featured') { $featured_style3="block";} else {$featured_style3="none";}?>
		<div class="form-group" style="display:<?php echo $featured_style2;?>;">
			<label class="col-sm-2 control-label">Сортировка и фильтрация:</label>
			<div class="col-sm-4">
				<select name="revtheme_slider_2[sort]" class="form-control">
				<?php if ($revtheme_slider_2['sort'] == 'p.date_added') { ?>
					<option value="p.date_added" selected="selected"><?php echo $text_sort_date_added; ?></option>
				<?php } else { ?>
					<option value="p.date_added"><?php echo $text_sort_date_added; ?></option>
				<?php } ?>
				<?php if ($revtheme_slider_2['sort'] == 'rating') { ?>
					<option value="rating" selected="selected"><?php echo $text_sort_rating; ?></option>
				<?php } else { ?>
					<option value="rating"><?php echo $text_sort_rating; ?></option>
				<?php } ?>
				<?php if ($revtheme_slider_2['sort'] == 'p.viewed') { ?>
					<option value="p.viewed" selected="selected"><?php echo $text_sort_viewed; ?></option>
				<?php } else { ?>
					<option value="p.viewed"><?php echo $text_sort_viewed; ?></option>
				<?php } ?>
				<?php if ($revtheme_slider_2['sort'] == 'p.sort_order') { ?>
					<option value="p.sort_order" selected="selected"><?php echo $text_sort_order; ?></option>
				<?php } else { ?>
					<option value="p.sort_order"><?php echo $text_sort_order; ?></option>
				<?php } ?>
				<?php if ($revtheme_slider_2['sort'] == 'topsellers') { ?>
					<option value="topsellers" selected="selected"><?php echo $text_sort_bestseller; ?></option>
				<?php } else { ?>
					<option value="topsellers"><?php echo $text_sort_bestseller; ?></option>
				<?php } ?>
				<?php if ($revtheme_slider_2['sort'] == 'special') { ?>
					<option value="special" selected="selected"><?php echo $text_sort_special; ?></option>
				<?php } else { ?>
					<option value="special"><?php echo $text_sort_special; ?></option>
				<?php } ?>
				</select>
			</div>
		</div>
		<div class="form-group">
			<label class="col-sm-2 control-label" for="autoscroll"><span data-toggle="tooltip" title="Период через который будет срабатывать автопрокрутка.<br/>Оставьте пустым чтобы отключить.">Автопрокрутка (сек):</span></label>
			<div class="col-sm-2">
				<input type="text" name="revtheme_slider_2[autoscroll]" value="<?php echo $revtheme_slider_2['autoscroll']; ?>" class="form-control" />
			</div>
		</div>
	</div>
	<div class="tab-pane text-style" id="tab_slider3">
		<div class="form-group">
			<label class="col-sm-2 control-label">Включен:
			</label>
			<div class="col-sm-2">
				<label class="radio-inline">
					<input type="radio" name="revtheme_slider_3[status]" value="1" <?php if ($revtheme_slider_3['status']) { echo 'checked'; } ?> /><span>Да</span>
				</label>
				<label class="radio-inline">
					<input type="radio" name="revtheme_slider_3[status]" value="0" <?php if (!$revtheme_slider_3['status']) { echo 'checked';} ?> /><span>Нет</span>
				</label>
			</div>
		</div>
		<div class="form-group">
			<label class="col-sm-2 control-label">Заголовок:</label>
			<div class="col-sm-3">
				<?php foreach ($languages as $language) { ?>
					<div class="input-group">
						<span class="input-group-addon"><img src="<?php echo (VERSION >= 2.2) ? 'language/'.$language['code'].'/'.$language['code'].'.png' : 'view/image/flags/'.$language['image']; ?>" title="<?php echo $language['name']; ?>" /></span>
						<input class="form-control" type="text" name="revtheme_slider_3[<?php echo $language['language_id']; ?>][title]" value="<?php echo(isset($revtheme_slider_3[$language['language_id']]['title']) ? $revtheme_slider_3[$language['language_id']]['title'] : '') ?>" />
					</div>
				<?php } ?>
			</div>
		</div>
		<div class="form-group">
			<label class="col-sm-2 control-label">Иконка:</label>
			<div class="col-sm-2">
				<label class="radio-inline">
					<input type="radio" onchange="$(this).parent().parent().parent().find('.zavisimost_ico').show().next().hide();" name="revtheme_slider_3[icontype]" value="1" <?php if ($revtheme_slider_3['icontype']) { echo 'checked'; } ?> /><span>Иконка</span>
				</label>
				<label class="radio-inline">
					<input type="radio" onchange="$(this).parent().parent().parent().find('.zavisimost_ico').hide().next().show();" name="revtheme_slider_3[icontype]" value="0" <?php if (!$revtheme_slider_3['icontype']) { echo 'checked';} ?> /><span>Картинка</span>
				</label>	
			</div>
			<div class="col-sm-2 zavisimost_ico" <?php if (!$revtheme_slider_3['icontype']) { ?> style="display: none" <?php } ?>>
				<span class="fazavisimost fa_icon form-control width_initial" id="icon_slider_3" onclick="fa_icons($(this).attr('id'))"><i class="<?php echo $revtheme_slider_3['icon']; ?>"></i></span>
				<input type="hidden" name="revtheme_slider_3[icon]" value="<?php echo $revtheme_slider_3['icon']; ?>" id="input-icon_slider3" />
			</div>
			<div class="col-sm-2" <?php if ($revtheme_slider_3['icontype']) { ?> style="display: none" <?php } ?>>
				<a href="" id="thumb-image_icon_slider3" data-toggle="image" class="img-thumbnail width_initial"><img style="width:25px;" src="<?php echo $revtheme_slider_3_thumb; ?>" alt="" title="" data-placeholder="<?php echo $placeholder; ?>" /></a>
				<input type="hidden" name="revtheme_slider_3[image]" value="<?php echo $revtheme_slider_3['image']; ?>" id="icon_slider3_image" />
			</div>
		</div>
		<div class="form-group">
			<label class="col-sm-2 control-label">Лимит товаров:</label>
			<div class="col-sm-2">
					<input class="form-control width_initial" type="text" name="revtheme_slider_3[count]" value="<?php echo $revtheme_slider_3['count']; ?>" />
			</div>
		</div>
		<div class="form-group">
			<label class="col-sm-2 control-label"><span data-toggle="tooltip" title="Если отключена возможность заказа товаров при 0 количестве или цене.">Не выводить товары<br>с кол-вом или ценой = 0:</span></label>
			<div class="col-sm-2">
				<label class="radio-inline">
					<input type="radio" name="revtheme_slider_3[not_view_null]" value="1" <?php if ($revtheme_slider_3['not_view_null']) { echo 'checked'; } ?> /><span>Вкл.</span>
				</label>
				<label class="radio-inline">
					<input type="radio" name="revtheme_slider_3[not_view_null]" value="0" <?php if (!$revtheme_slider_3['not_view_null']) { echo 'checked';} ?> /><span>Выкл.</span>
				</label>
			</div>
		</div>
		<div class="form-group">
			<label class="col-sm-2 control-label">Слайдер товаров:
			</label>
			<div class="col-sm-2">
				<label class="radio-inline">
					<input type="radio" name="revtheme_slider_3[slider]" value="1" <?php if ($revtheme_slider_3['slider']) { echo 'checked'; } ?> /><span>Да</span>
				</label>
				<label class="radio-inline">
					<input type="radio" name="revtheme_slider_3[slider]" value="0" <?php if (!$revtheme_slider_3['slider']) { echo 'checked';} ?> /><span>Нет</span>
				</label>
			</div>
		</div>
		<div class="form-group">
			<label class="col-sm-2 control-label">Изображение (Ш x В):</label>
			<div class="col-sm-4">
				<input class="form-control width_initial" type="text" name="revtheme_slider_3[image_width]" value="<?php echo $revtheme_slider_3['image_width']; ?>" /> x 
				<input class="form-control width_initial" type="text" name="revtheme_slider_3[image_height]" value="<?php echo $revtheme_slider_3['image_height']; ?>" /> px
			</div>
		</div>
		<div class="form-group">
			<label class="col-sm-2 control-label">Источник товаров:</label>
			<div class="col-sm-4">
				<select name="revtheme_slider_3[category_id]" id="select3" onchange="showhide3();" class="form-control">
					<option value="0" <?php if ($revtheme_slider_3['category_id']=='0') { ?>selected="selected"<?php } ?>>Все товары</option>
					<option value="featured" <?php if ($revtheme_slider_3['category_id']=='featured') { ?>selected="selected"<?php } ?>>Выборочные товары</option>
				<?php foreach ($rootcats3 as $rootcat) { ?>
					<?php if ($rootcat['category_id'] == $revtheme_slider_3['category_id']) { ?>
						<option value="<?php echo $rootcat['category_id']; ?>" selected="selected"><?php echo $rootcat['name']; ?></option>
					<?php } else { ?>
						<option value="<?php echo $rootcat['category_id']; ?>"><?php echo $rootcat['name']; ?></option>
					<?php } ?>
				<?php } ?>
				</select>
			</div>
		</div>
		<?php if ($revtheme_slider_3['category_id']=='featured') { $featured_style3="block";} else {$featured_style3="none";}?>
		<div class="form-group" id="rowfeatured3" style="display:<?php echo $featured_style3; ?>;">
			<label class="col-sm-2 control-label">Товары (автозаполнение):</label>
			<div class="col-sm-4">
				<input type="text" name="product3" value="" placeholder="Товары" id="input-product" class="form-control" />
				<br/>
				<div class="scrollbox2 well well-sm" id="featured-product3" style="height: 150px; overflow: auto;">
					<?php $class = 'odd'; ?>
					<?php foreach ($products3 as $product) { ?>
						<?php $class = ($class == 'even' ? 'odd' : 'even'); ?>
						<div id="featured-product3<?php echo $product['product_id']; ?>" class="<?php echo $class; ?>"><?php echo $product['name']; ?> <i class="fa fa-minus-circle"></i>
							<input type="hidden" value="<?php echo $product['product_id']; ?>" />
						</div>
					<?php } ?>
				</div>
				<input type="hidden" name="revtheme_slider_3[featured]" value="<?php echo $revtheme_slider_3['featured']; ?>" />
			</div>
		</div>
		<?php if ($revtheme_slider_3['category_id']=='featured') { $featured_style3="none";} else {$featured_style3="block";}?>
		<div class="form-group" id="catonly3" style="display:<?php echo $featured_style3;?>;">
			<label class="col-sm-2 control-label">Фильтр по производителю:</label>
			<div class="col-sm-4 scrollbox2" id="featured-product3">
				<select name="revtheme_slider_3[manufacturer_id]" id="select3" class="form-control">
					<option value="0" <?php if ($revtheme_slider_3['manufacturer_id']=='0') { ?>selected="selected"<?php } ?>>Все производители</option>
				<?php if (isset($manufacturers3)){
					foreach ($manufacturers3 as $manufacturer) { ?>
						<?php if ($manufacturer['manufacturer_id'] == $revtheme_slider_3['manufacturer_id']) { ?>
							<option value="<?php echo $manufacturer['manufacturer_id']; ?>" selected="selected"><?php echo $manufacturer['name']; ?></option>
						<?php } else { ?>
							<option value="<?php echo $manufacturer['manufacturer_id']; ?>"><?php echo $manufacturer['name']; ?></option>
						<?php } ?>
					<?php } ?>
				<?php } ?>
				</select>
			</div>
		</div>
		<?php if ($revtheme_slider_3['category_id']=='featured') { $featured_style3="none";} else {$featured_style3="block";}?>
		<div class="form-group" style="display:<?php echo $featured_style3;?>;">
			<label class="col-sm-2 control-label">Сортировка и фильтрация:</label>
			<div class="col-sm-4">
				<select name="revtheme_slider_3[sort]" class="form-control">
				<?php if ($revtheme_slider_3['sort'] == 'p.date_added') { ?>
					<option value="p.date_added" selected="selected"><?php echo $text_sort_date_added; ?></option>
				<?php } else { ?>
					<option value="p.date_added"><?php echo $text_sort_date_added; ?></option>
				<?php } ?>
				<?php if ($revtheme_slider_3['sort'] == 'rating') { ?>
					<option value="rating" selected="selected"><?php echo $text_sort_rating; ?></option>
				<?php } else { ?>
					<option value="rating"><?php echo $text_sort_rating; ?></option>
				<?php } ?>
				<?php if ($revtheme_slider_3['sort'] == 'p.viewed') { ?>
					<option value="p.viewed" selected="selected"><?php echo $text_sort_viewed; ?></option>
				<?php } else { ?>
					<option value="p.viewed"><?php echo $text_sort_viewed; ?></option>
				<?php } ?>
				<?php if ($revtheme_slider_3['sort'] == 'p.sort_order') { ?>
					<option value="p.sort_order" selected="selected"><?php echo $text_sort_order; ?></option>
				<?php } else { ?>
					<option value="p.sort_order"><?php echo $text_sort_order; ?></option>
				<?php } ?>
				<?php if ($revtheme_slider_3['sort'] == 'topsellers') { ?>
					<option value="topsellers" selected="selected"><?php echo $text_sort_bestseller; ?></option>
				<?php } else { ?>
					<option value="topsellers"><?php echo $text_sort_bestseller; ?></option>
				<?php } ?>
				<?php if ($revtheme_slider_3['sort'] == 'special') { ?>
					<option value="special" selected="selected"><?php echo $text_sort_special; ?></option>
				<?php } else { ?>
					<option value="special"><?php echo $text_sort_special; ?></option>
				<?php } ?>
				</select>
			</div>
		</div>
		<div class="form-group">
			<label class="col-sm-2 control-label" for="autoscroll"><span data-toggle="tooltip" title="Период через который будет срабатывать автопрокрутка.<br/>Оставьте пустым чтобы отключить.">Автопрокрутка (сек):</span></label>
			<div class="col-sm-2">
				<input type="text" name="revtheme_slider_3[autoscroll]" value="<?php echo $revtheme_slider_3['autoscroll']; ?>" class="form-control" />
			</div>
		</div>
	</div>
	<div class="tab-pane text-style" id="tab_slider4">
		<div class="form-group">
			<label class="col-sm-2 control-label">Включен:
			</label>
			<div class="col-sm-2">
				<label class="radio-inline">
					<input type="radio" name="revtheme_slider_4[status]" value="1" <?php if ($revtheme_slider_4['status']) { echo 'checked'; } ?> /><span>Да</span>
				</label>
				<label class="radio-inline">
					<input type="radio" name="revtheme_slider_4[status]" value="0" <?php if (!$revtheme_slider_4['status']) { echo 'checked';} ?> /><span>Нет</span>
				</label>
			</div>
		</div>
		<div class="form-group">
			<label class="col-sm-2 control-label">Заголовок:</label>
			<div class="col-sm-3">
				<?php foreach ($languages as $language) { ?>
					<div class="input-group">
						<span class="input-group-addon"><img src="<?php echo (VERSION >= 2.2) ? 'language/'.$language['code'].'/'.$language['code'].'.png' : 'view/image/flags/'.$language['image']; ?>" title="<?php echo $language['name']; ?>" /></span>
						<input class="form-control" type="text" name="revtheme_slider_4[<?php echo $language['language_id']; ?>][title]" value="<?php echo(isset($revtheme_slider_4[$language['language_id']]['title']) ? $revtheme_slider_4[$language['language_id']]['title'] : '') ?>" />
					</div>
				<?php } ?>
			</div>
		</div>
		<div class="form-group">
			<label class="col-sm-2 control-label">Иконка:</label>
			<div class="col-sm-2">
				<label class="radio-inline">
					<input type="radio" onchange="$(this).parent().parent().parent().find('.zavisimost_ico').show().next().hide();" name="revtheme_slider_4[icontype]" value="1" <?php if ($revtheme_slider_4['icontype']) { echo 'checked'; } ?> /><span>Иконка</span>
				</label>
				<label class="radio-inline">
					<input type="radio" onchange="$(this).parent().parent().parent().find('.zavisimost_ico').hide().next().show();" name="revtheme_slider_4[icontype]" value="0" <?php if (!$revtheme_slider_4['icontype']) { echo 'checked';} ?> /><span>Картинка</span>
				</label>	
			</div>
			<div class="col-sm-2 zavisimost_ico" <?php if (!$revtheme_slider_4['icontype']) { ?> style="display: none" <?php } ?>>
				<span class="fazavisimost fa_icon form-control width_initial" id="icon_slider_4" onclick="fa_icons($(this).attr('id'))"><i class="<?php echo $revtheme_slider_4['icon']; ?>"></i></span>
				<input type="hidden" name="revtheme_slider_4[icon]" value="<?php echo $revtheme_slider_4['icon']; ?>" id="input-icon_slider4" />
			</div>
			<div class="col-sm-2" <?php if ($revtheme_slider_4['icontype']) { ?> style="display: none" <?php } ?>>
				<a href="" id="thumb-image_icon_slider4" data-toggle="image" class="img-thumbnail width_initial"><img style="width:25px;" src="<?php echo $revtheme_slider_4_thumb; ?>" alt="" title="" data-placeholder="<?php echo $placeholder; ?>" /></a>
				<input type="hidden" name="revtheme_slider_4[image]" value="<?php echo $revtheme_slider_4['image']; ?>" id="icon_slider4_image" />
			</div>
		</div>
		<div class="form-group">
			<label class="col-sm-2 control-label">Лимит товаров:</label>
			<div class="col-sm-2">
					<input class="form-control width_initial" type="text" name="revtheme_slider_4[count]" value="<?php echo $revtheme_slider_4['count']; ?>" />
			</div>
		</div>
		<div class="form-group">
			<label class="col-sm-2 control-label"><span data-toggle="tooltip" title="Если отключена возможность заказа товаров при 0 количестве или цене.">Не выводить товары<br>с кол-вом или ценой = 0:</span></label>
			<div class="col-sm-2">
				<label class="radio-inline">
					<input type="radio" name="revtheme_slider_4[not_view_null]" value="1" <?php if ($revtheme_slider_4['not_view_null']) { echo 'checked'; } ?> /><span>Вкл.</span>
				</label>
				<label class="radio-inline">
					<input type="radio" name="revtheme_slider_4[not_view_null]" value="0" <?php if (!$revtheme_slider_4['not_view_null']) { echo 'checked';} ?> /><span>Выкл.</span>
				</label>
			</div>
		</div>
		<div class="form-group">
			<label class="col-sm-2 control-label">Слайдер товаров:
			</label>
			<div class="col-sm-2">
				<label class="radio-inline">
					<input type="radio" name="revtheme_slider_4[slider]" value="1" <?php if ($revtheme_slider_4['slider']) { echo 'checked'; } ?> /><span>Да</span>
				</label>
				<label class="radio-inline">
					<input type="radio" name="revtheme_slider_4[slider]" value="0" <?php if (!$revtheme_slider_4['slider']) { echo 'checked';} ?> /><span>Нет</span>
				</label>
			</div>
		</div>
		<div class="form-group">
			<label class="col-sm-2 control-label">Изображение (Ш x В):</label>
			<div class="col-sm-4">
				<input class="form-control width_initial" type="text" name="revtheme_slider_4[image_width]" value="<?php echo $revtheme_slider_4['image_width']; ?>" /> x 
				<input class="form-control width_initial" type="text" name="revtheme_slider_4[image_height]" value="<?php echo $revtheme_slider_4['image_height']; ?>" /> px
			</div>
		</div>
		<div class="form-group">
			<label class="col-sm-2 control-label">Источник товаров:</label>
			<div class="col-sm-4">
				<select name="revtheme_slider_4[category_id]" id="select4" onchange="showhide4();" class="form-control">
					<option value="0" <?php if ($revtheme_slider_4['category_id']=='0') { ?>selected="selected"<?php } ?>>Все товары</option>
					<option value="featured" <?php if ($revtheme_slider_4['category_id']=='featured') { ?>selected="selected"<?php } ?>>Выборочные товары</option>
				<?php foreach ($rootcats4 as $rootcat) { ?>
					<?php if ($rootcat['category_id'] == $revtheme_slider_4['category_id']) { ?>
						<option value="<?php echo $rootcat['category_id']; ?>" selected="selected"><?php echo $rootcat['name']; ?></option>
					<?php } else { ?>
						<option value="<?php echo $rootcat['category_id']; ?>"><?php echo $rootcat['name']; ?></option>
					<?php } ?>
				<?php } ?>
				</select>
			</div>
		</div>
		<?php if ($revtheme_slider_4['category_id']=='featured') { $featured_style4="block";} else {$featured_style4="none";}?>
		<div class="form-group" id="rowfeatured4" style="display:<?php echo $featured_style4; ?>;">
			<label class="col-sm-2 control-label">Товары (автозаполнение):</label>
			<div class="col-sm-4">
				<input type="text" name="product4" value="" placeholder="Товары" id="input-product" class="form-control" />
				<br/>
				<div class="scrollbox4 well well-sm" id="featured-product4" style="height: 150px; overflow: auto;">
					<?php $class = 'odd'; ?>
					<?php foreach ($products4 as $product) { ?>
						<?php $class = ($class == 'even' ? 'odd' : 'even'); ?>
						<div id="featured-product4<?php echo $product['product_id']; ?>" class="<?php echo $class; ?>"><?php echo $product['name']; ?> <i class="fa fa-minus-circle"></i>
							<input type="hidden" value="<?php echo $product['product_id']; ?>" />
						</div>
					<?php } ?>
				</div>
				<input type="hidden" name="revtheme_slider_4[featured]" value="<?php echo $revtheme_slider_4['featured']; ?>" />
			</div>
		</div>
		<?php if ($revtheme_slider_4['category_id']=='featured') { $featured_style4="none";} else {$featured_style4="block";}?>
		<div class="form-group" id="catonly4" style="display:<?php echo $featured_style4;?>;">
			<label class="col-sm-2 control-label">Фильтр по производителю:</label>
			<div class="col-sm-4 scrollbox4" id="featured-product3">
				<select name="revtheme_slider_4[manufacturer_id]" id="select4" class="form-control">
					<option value="0" <?php if ($revtheme_slider_4['manufacturer_id']=='0') { ?>selected="selected"<?php } ?>>Все производители</option>
				<?php if (isset($manufacturers4)){
					foreach ($manufacturers4 as $manufacturer) { ?>
						<?php if ($manufacturer['manufacturer_id'] == $revtheme_slider_4['manufacturer_id']) { ?>
							<option value="<?php echo $manufacturer['manufacturer_id']; ?>" selected="selected"><?php echo $manufacturer['name']; ?></option>
						<?php } else { ?>
							<option value="<?php echo $manufacturer['manufacturer_id']; ?>"><?php echo $manufacturer['name']; ?></option>
						<?php } ?>
					<?php } ?>
				<?php } ?>
				</select>
			</div>
		</div>
		<?php if ($revtheme_slider_4['category_id']=='featured') { $featured_style4="none";} else {$featured_style4="block";}?>
		<div class="form-group" style="display:<?php echo $featured_style4;?>;">
			<label class="col-sm-2 control-label">Сортировка и фильтрация:</label>
			<div class="col-sm-4">
				<select name="revtheme_slider_4[sort]" class="form-control">
				<?php if ($revtheme_slider_4['sort'] == 'p.date_added') { ?>
					<option value="p.date_added" selected="selected"><?php echo $text_sort_date_added; ?></option>
				<?php } else { ?>
					<option value="p.date_added"><?php echo $text_sort_date_added; ?></option>
				<?php } ?>
				<?php if ($revtheme_slider_4['sort'] == 'rating') { ?>
					<option value="rating" selected="selected"><?php echo $text_sort_rating; ?></option>
				<?php } else { ?>
					<option value="rating"><?php echo $text_sort_rating; ?></option>
				<?php } ?>
				<?php if ($revtheme_slider_4['sort'] == 'p.viewed') { ?>
					<option value="p.viewed" selected="selected"><?php echo $text_sort_viewed; ?></option>
				<?php } else { ?>
					<option value="p.viewed"><?php echo $text_sort_viewed; ?></option>
				<?php } ?>
				<?php if ($revtheme_slider_4['sort'] == 'p.sort_order') { ?>
					<option value="p.sort_order" selected="selected"><?php echo $text_sort_order; ?></option>
				<?php } else { ?>
					<option value="p.sort_order"><?php echo $text_sort_order; ?></option>
				<?php } ?>
				<?php if ($revtheme_slider_4['sort'] == 'topsellers') { ?>
					<option value="topsellers" selected="selected"><?php echo $text_sort_bestseller; ?></option>
				<?php } else { ?>
					<option value="topsellers"><?php echo $text_sort_bestseller; ?></option>
				<?php } ?>
				<?php if ($revtheme_slider_4['sort'] == 'special') { ?>
					<option value="special" selected="selected"><?php echo $text_sort_special; ?></option>
				<?php } else { ?>
					<option value="special"><?php echo $text_sort_special; ?></option>
				<?php } ?>
				</select>
			</div>
		</div>
		<div class="form-group">
			<label class="col-sm-2 control-label" for="autoscroll"><span data-toggle="tooltip" title="Период через который будет срабатывать автопрокрутка.<br/>Оставьте пустым чтобы отключить.">Автопрокрутка (сек):</span></label>
			<div class="col-sm-2">
				<input type="text" name="revtheme_slider_4[autoscroll]" value="<?php echo $revtheme_slider_4['autoscroll']; ?>" class="form-control" />
			</div>
		</div>
	</div>
	<div class="tab-pane text-style" id="tab_slider5">
		<div class="form-group">
			<label class="col-sm-2 control-label">Включен:
			</label>
			<div class="col-sm-2">
				<label class="radio-inline">
					<input type="radio" name="revtheme_slider_5[status]" value="1" <?php if ($revtheme_slider_5['status']) { echo 'checked'; } ?> /><span>Да</span>
				</label>
				<label class="radio-inline">
					<input type="radio" name="revtheme_slider_5[status]" value="0" <?php if (!$revtheme_slider_5['status']) { echo 'checked';} ?> /><span>Нет</span>
				</label>
			</div>
		</div>
		<div class="form-group">
			<label class="col-sm-2 control-label">Заголовок:</label>
			<div class="col-sm-3">
				<?php foreach ($languages as $language) { ?>
					<div class="input-group">
						<span class="input-group-addon"><img src="<?php echo (VERSION >= 2.2) ? 'language/'.$language['code'].'/'.$language['code'].'.png' : 'view/image/flags/'.$language['image']; ?>" title="<?php echo $language['name']; ?>" /></span>
						<input class="form-control" type="text" name="revtheme_slider_5[<?php echo $language['language_id']; ?>][title]" value="<?php echo(isset($revtheme_slider_5[$language['language_id']]['title']) ? $revtheme_slider_5[$language['language_id']]['title'] : '') ?>" />
					</div>
				<?php } ?>
			</div>
		</div>
		<div class="form-group">
			<label class="col-sm-2 control-label">Иконка:</label>
			<div class="col-sm-2">
				<label class="radio-inline">
					<input type="radio" onchange="$(this).parent().parent().parent().find('.zavisimost_ico').show().next().hide();" name="revtheme_slider_5[icontype]" value="1" <?php if ($revtheme_slider_5['icontype']) { echo 'checked'; } ?> /><span>Иконка</span>
				</label>
				<label class="radio-inline">
					<input type="radio" onchange="$(this).parent().parent().parent().find('.zavisimost_ico').hide().next().show();" name="revtheme_slider_5[icontype]" value="0" <?php if (!$revtheme_slider_5['icontype']) { echo 'checked';} ?> /><span>Картинка</span>
				</label>	
			</div>
			<div class="col-sm-2 zavisimost_ico" <?php if (!$revtheme_slider_5['icontype']) { ?> style="display: none" <?php } ?>>
				<span class="fazavisimost fa_icon form-control width_initial" id="icon_slider_5" onclick="fa_icons($(this).attr('id'))"><i class="<?php echo $revtheme_slider_5['icon']; ?>"></i></span>
				<input type="hidden" name="revtheme_slider_5[icon]" value="<?php echo $revtheme_slider_5['icon']; ?>" id="input-icon_slider5" />
			</div>
			<div class="col-sm-2" <?php if ($revtheme_slider_5['icontype']) { ?> style="display: none" <?php } ?>>
				<a href="" id="thumb-image_icon_slider5" data-toggle="image" class="img-thumbnail width_initial"><img style="width:25px;" src="<?php echo $revtheme_slider_5_thumb; ?>" alt="" title="" data-placeholder="<?php echo $placeholder; ?>" /></a>
				<input type="hidden" name="revtheme_slider_5[image]" value="<?php echo $revtheme_slider_5['image']; ?>" id="icon_slider5_image" />
			</div>
		</div>
		<div class="form-group">
			<label class="col-sm-2 control-label">Лимит товаров:</label>
			<div class="col-sm-2">
					<input class="form-control width_initial" type="text" name="revtheme_slider_5[count]" value="<?php echo $revtheme_slider_5['count']; ?>" />
			</div>
		</div>
		<div class="form-group">
			<label class="col-sm-2 control-label"><span data-toggle="tooltip" title="Если отключена возможность заказа товаров при 0 количестве или цене.">Не выводить товары<br>с кол-вом или ценой = 0:</span>
			</label>
			<div class="col-sm-2">
				<label class="radio-inline">
					<input type="radio" name="revtheme_slider_5[not_view_null]" value="1" <?php if ($revtheme_slider_5['not_view_null']) { echo 'checked'; } ?> /><span>Вкл.</span>
				</label>
				<label class="radio-inline">
					<input type="radio" name="revtheme_slider_5[not_view_null]" value="0" <?php if (!$revtheme_slider_5['not_view_null']) { echo 'checked';} ?> /><span>Выкл.</span>
				</label>
			</div>
		</div>
		<div class="form-group">
			<label class="col-sm-2 control-label">Слайдер товаров:
			</label>
			<div class="col-sm-2">
				<label class="radio-inline">
					<input type="radio" name="revtheme_slider_5[slider]" value="1" <?php if ($revtheme_slider_5['slider']) { echo 'checked'; } ?> /><span>Да</span>
				</label>
				<label class="radio-inline">
					<input type="radio" name="revtheme_slider_5[slider]" value="0" <?php if (!$revtheme_slider_5['slider']) { echo 'checked';} ?> /><span>Нет</span>
				</label>
			</div>
		</div>
		<div class="form-group">
			<label class="col-sm-2 control-label">Изображение (Ш x В):</label>
			<div class="col-sm-4">
				<input class="form-control width_initial" type="text" name="revtheme_slider_5[image_width]" value="<?php echo $revtheme_slider_5['image_width']; ?>" /> x 
				<input class="form-control width_initial" type="text" name="revtheme_slider_5[image_height]" value="<?php echo $revtheme_slider_5['image_height']; ?>" /> px
			</div>
		</div>
		<div class="form-group">
			<label class="col-sm-2 control-label">Источник товаров:</label>
			<div class="col-sm-4">
				<select name="revtheme_slider_5[category_id]" id="select5" onchange="showhide5();" class="form-control">
					<option value="0" <?php if ($revtheme_slider_5['category_id']=='0') { ?>selected="selected"<?php } ?>>Все товары</option>
					<option value="featured" <?php if ($revtheme_slider_5['category_id']=='featured') { ?>selected="selected"<?php } ?>>Выборочные товары</option>
				<?php foreach ($rootcats5 as $rootcat) { ?>
					<?php if ($rootcat['category_id'] == $revtheme_slider_5['category_id']) { ?>
						<option value="<?php echo $rootcat['category_id']; ?>" selected="selected"><?php echo $rootcat['name']; ?></option>
					<?php } else { ?>
						<option value="<?php echo $rootcat['category_id']; ?>"><?php echo $rootcat['name']; ?></option>
					<?php } ?>
				<?php } ?>
				</select>
			</div>
		</div>
		<?php if ($revtheme_slider_5['category_id']=='featured') { $featured_style5="block";} else {$featured_style5="none";}?>
		<div class="form-group" id="rowfeatured5" style="display:<?php echo $featured_style5; ?>;">
			<label class="col-sm-2 control-label">Товары (автозаполнение):</label>
			<div class="col-sm-4">
				<input type="text" name="product5" value="" placeholder="Товары" id="input-product" class="form-control" />
				<br/>
				<div class="scrollbox5 well well-sm" id="featured-product5" style="height: 150px; overflow: auto;">
					<?php $class = 'odd'; ?>
					<?php foreach ($products5 as $product) { ?>
						<?php $class = ($class == 'even' ? 'odd' : 'even'); ?>
						<div id="featured-product5<?php echo $product['product_id']; ?>" class="<?php echo $class; ?>"><?php echo $product['name']; ?> <i class="fa fa-minus-circle"></i>
							<input type="hidden" value="<?php echo $product['product_id']; ?>" />
						</div>
					<?php } ?>
				</div>
				<input type="hidden" name="revtheme_slider_5[featured]" value="<?php echo $revtheme_slider_5['featured']; ?>" />
			</div>
		</div>
		<?php if ($revtheme_slider_5['category_id']=='featured') { $featured_style5="none";} else {$featured_style5="block";}?>
		<div class="form-group" id="catonly5" style="display:<?php echo $featured_style5;?>;">
			<label class="col-sm-2 control-label">Фильтр по производителю:</label>
			<div class="col-sm-4 scrollbox5" id="featured-product3">
				<select name="revtheme_slider_5[manufacturer_id]" id="select5" class="form-control">
					<option value="0" <?php if ($revtheme_slider_5['manufacturer_id']=='0') { ?>selected="selected"<?php } ?>>Все производители</option>
				<?php if (isset($manufacturers5)){
					foreach ($manufacturers5 as $manufacturer) { ?>
						<?php if ($manufacturer['manufacturer_id'] == $revtheme_slider_5['manufacturer_id']) { ?>
							<option value="<?php echo $manufacturer['manufacturer_id']; ?>" selected="selected"><?php echo $manufacturer['name']; ?></option>
						<?php } else { ?>
							<option value="<?php echo $manufacturer['manufacturer_id']; ?>"><?php echo $manufacturer['name']; ?></option>
						<?php } ?>
					<?php } ?>
				<?php } ?>
				</select>
			</div>
		</div>
		<?php if ($revtheme_slider_5['category_id']=='featured') { $featured_style5="none";} else {$featured_style5="block";}?>
		<div class="form-group" style="display:<?php echo $featured_style5;?>;">
			<label class="col-sm-2 control-label">Сортировка и фильтрация:</label>
			<div class="col-sm-4">
				<select name="revtheme_slider_5[sort]" class="form-control">
				<?php if ($revtheme_slider_5['sort'] == 'p.date_added') { ?>
					<option value="p.date_added" selected="selected"><?php echo $text_sort_date_added; ?></option>
				<?php } else { ?>
					<option value="p.date_added"><?php echo $text_sort_date_added; ?></option>
				<?php } ?>
				<?php if ($revtheme_slider_5['sort'] == 'rating') { ?>
					<option value="rating" selected="selected"><?php echo $text_sort_rating; ?></option>
				<?php } else { ?>
					<option value="rating"><?php echo $text_sort_rating; ?></option>
				<?php } ?>
				<?php if ($revtheme_slider_5['sort'] == 'p.viewed') { ?>
					<option value="p.viewed" selected="selected"><?php echo $text_sort_viewed; ?></option>
				<?php } else { ?>
					<option value="p.viewed"><?php echo $text_sort_viewed; ?></option>
				<?php } ?>
				<?php if ($revtheme_slider_5['sort'] == 'p.sort_order') { ?>
					<option value="p.sort_order" selected="selected"><?php echo $text_sort_order; ?></option>
				<?php } else { ?>
					<option value="p.sort_order"><?php echo $text_sort_order; ?></option>
				<?php } ?>
				<?php if ($revtheme_slider_5['sort'] == 'topsellers') { ?>
					<option value="topsellers" selected="selected"><?php echo $text_sort_bestseller; ?></option>
				<?php } else { ?>
					<option value="topsellers"><?php echo $text_sort_bestseller; ?></option>
				<?php } ?>
				<?php if ($revtheme_slider_5['sort'] == 'special') { ?>
					<option value="special" selected="selected"><?php echo $text_sort_special; ?></option>
				<?php } else { ?>
					<option value="special"><?php echo $text_sort_special; ?></option>
				<?php } ?>
				</select>
			</div>
		</div>
		<div class="form-group">
			<label class="col-sm-2 control-label" for="autoscroll"><span data-toggle="tooltip" title="Период через который будет срабатывать автопрокрутка.<br/>Оставьте пустым чтобы отключить.">Автопрокрутка (сек):</span></label>
			<div class="col-sm-2">
				<input type="text" name="revtheme_slider_5[autoscroll]" value="<?php echo $revtheme_slider_5['autoscroll']; ?>" class="form-control" />
			</div>
		</div>
	</div>
	<div class="tab-pane" id="tab_blog">
		<div class="form-group">
			<label class="col-sm-2 control-label">Включен:</label>
			<div class="col-sm-3">
				<label class="radio-inline">
					<input type="radio" name="revtheme_home_blog[status]" value="1" <?php if($revtheme_home_blog['status']) echo " checked='checked'"?> /><span>Да</span>
				</label>
				<label class="radio-inline">
					<input type="radio" name="revtheme_home_blog[status]" value="0" <?php if(!$revtheme_home_blog['status']) echo " checked='checked'"?> /><span>Нет</span>
				</label>
			</div>
		</div>
		<div class="form-group">
		  <label class="col-sm-2 control-label">Заголовок:</label>
		  <div class="col-sm-3">			
			<?php foreach ($languages as $language) { ?>
				<div class="input-group">
					<span class="input-group-addon"><img src="<?php echo (VERSION >= 2.2) ? 'language/'.$language['code'].'/'.$language['code'].'.png' : 'view/image/flags/'.$language['image']; ?>" title="<?php echo $language['name']; ?>" /></span>
					<input class="form-control" type="text" name="revtheme_home_blog[<?php echo $language['language_id']; ?>][title]" value="<?php echo(isset($revtheme_home_blog[$language['language_id']]['title']) ? $revtheme_home_blog[$language['language_id']]['title'] : 'Новости') ?>" />
				</div>
			<?php } ?>
		  </div>
		</div>
		<div class="form-group">
			<label class="col-sm-2 control-label" for="input-category">Категория новостей:</label>
			<div class="col-sm-3">
				<select name="revtheme_home_blog[blog_category_id]" class="form-control">
					<option value="0" selected="selected">Все</option>
					<?php foreach($blog_categories as $category) { ?>
					<?php if($category['category_id'] == $revtheme_home_blog['blog_category_id']) { ?>
					<option value="<?php echo $category['category_id']; ?>" selected="selected"><?php echo $category['title']; ?></option>
					<?php } else { ?>
					<option value="<?php echo $category['category_id']; ?>"><?php echo $category['title']; ?></option>
					<?php } ?>
					<?php } ?>
				</select>
			</div>
		</div>
		<div class="form-group">
		  <label class="col-sm-2 control-label">Лимит новостей в виджете:</label>
		  <div class="col-sm-3">
			<input type="text" name="revtheme_home_blog[news_limit]" value="<?php echo (isset($revtheme_home_blog['news_limit'])) ? $revtheme_home_blog['news_limit'] : ''; ?>" class="form-control" />
		  </div>
		</div>
		<div class="form-group">
		  <label class="col-sm-2 control-label">Лимит символов описания:</label>
		  <div class="col-sm-3">
			<input type="text" name="revtheme_home_blog[desc_limit]" value="<?php echo (isset($revtheme_home_blog['desc_limit'])) ? $revtheme_home_blog['desc_limit'] : ''; ?>" class="form-control" />
		  </div>
		</div>
		<div class="form-group">
			<label class="col-sm-2 control-label">Иконка:</label>
			<div class="col-sm-2">
				<label class="radio-inline">
					<input type="radio" onchange="$(this).parent().parent().parent().find('.zavisimost_ico').show().next().hide();" name="revtheme_home_blog[icontype]" value="1" <?php if ($revtheme_home_blog['icontype']) { echo 'checked'; } ?> /><span>Иконка</span>
				</label>
				<label class="radio-inline">
					<input type="radio" onchange="$(this).parent().parent().parent().find('.zavisimost_ico').hide().next().show();" name="revtheme_home_blog[icontype]" value="0" <?php if (!$revtheme_home_blog['icontype']) { echo 'checked';} ?> /><span>Картинка</span>
				</label>	
			</div>
			<div class="col-sm-2 zavisimost_ico" <?php if (!$revtheme_home_blog['icontype']) { ?> style="display: none" <?php } ?>>
				<span class="fazavisimost fa_icon form-control width_initial" id="icon_home_blog" onclick="fa_icons($(this).attr('id'))"><i class="<?php echo $revtheme_home_blog['icon']; ?>"></i></span>
				<input type="hidden" name="revtheme_home_blog[icon]" value="<?php echo $revtheme_home_blog['icon']; ?>" id="input-icon_home_blog" />
			</div>
			<div class="col-sm-2" <?php if ($revtheme_home_blog['icontype']) { ?> style="display: none" <?php } ?>>
				<a href="" id="thumb-image_revtheme_home_blog" data-toggle="image" class="img-thumbnail width_initial"><img style="width:25px;" src="<?php echo $revtheme_home_blog_thumb; ?>" alt="" title="" data-placeholder="<?php echo $placeholder; ?>" /></a>
				<input type="hidden" name="revtheme_home_blog[image]" value="<?php echo $revtheme_home_blog['image']; ?>" id="revtheme_home_blog_image" />
			</div>
		</div>
		<div class="form-group">
			<label class="col-sm-2 control-label">Размер картинки, px:</label>
			<div class="col-sm-9">
				<div class="row">
				  <div class="col-sm-2">
					<input data-toggle="tooltip" data-placement="top" title="Ширина" type="text" name="revtheme_home_blog[image_width]" value="<?php echo (isset($revtheme_home_blog['image_width'])) ? $revtheme_home_blog['image_width'] : ''; ?>" class="form-control" />
				  </div>
				  <div class="col-sm-2">
					<input data-toggle="tooltip" data-placement="top" title="Высота" type="text" name="revtheme_home_blog[image_height]" value="<?php echo (isset($revtheme_home_blog['image_height'])) ? $revtheme_home_blog['image_height'] : ''; ?>" class="form-control" />
				  </div>
				</div>
			</div>
		</div>
		<div class="form-group">
			<label class="col-sm-2 control-label">Цвет фона:</label>
			<div class="col-sm-2">
				<input class="jscolor form-control" name="revtheme_home_blog[b_color]" value="<?php echo isset($revtheme_home_blog['b_color']) ? $revtheme_home_blog['b_color'] : ''; ?>" />
			</div>
		</div>
	</div>
	<div class="tab-pane text-style" id="tab_aboutstore">
		<div class="form-group">
			<label class="col-sm-2 control-label">Включить:
			</label>
			<div class="col-sm-3">
				<label class="radio-inline">
					<input type="radio" name="revtheme_aboutstore_home[status]" value="1" <?php if ($revtheme_aboutstore_home['status']) { echo 'checked'; } ?> /><span>Да</span>
				</label>
				<label class="radio-inline">
					<input type="radio" name="revtheme_aboutstore_home[status]" value="0" <?php if (!$revtheme_aboutstore_home['status']) { echo 'checked';} ?> /><span>Нет</span>
				</label>
			</div>
		</div>
		<div class="form-group">
			<label class="col-sm-2 control-label">Заголовок:</label>
			<div class="col-sm-3">
				<?php foreach ($languages as $language) { ?>
					<div class="input-group">
						<span class="input-group-addon"><img src="<?php echo (VERSION >= 2.2) ? 'language/'.$language['code'].'/'.$language['code'].'.png' : 'view/image/flags/'.$language['image']; ?>" title="<?php echo $language['name']; ?>" /></span>
						<input class="form-control" type="text" name="revtheme_aboutstore_home[<?php echo $language['language_id']; ?>][title]" value="<?php echo(isset($revtheme_aboutstore_home[$language['language_id']]['title']) ? $revtheme_aboutstore_home[$language['language_id']]['title'] : 'О магазине') ?>" />
					</div>
				<?php } ?>
			</div>
		</div>
		<div class="form-group">
			<label class="col-sm-2 control-label">Иконка:</label>
			<div class="col-sm-2">
				<label class="radio-inline">
					<input type="radio" onchange="$(this).parent().parent().parent().find('.zavisimost_ico').show().next().hide();" name="revtheme_aboutstore_home[icontype]" value="1" <?php if ($revtheme_aboutstore_home['icontype']) { echo 'checked'; } ?> /><span>Иконка</span>
				</label>
				<label class="radio-inline">
					<input type="radio" onchange="$(this).parent().parent().parent().find('.zavisimost_ico').hide().next().show();" name="revtheme_aboutstore_home[icontype]" value="0" <?php if (!$revtheme_aboutstore_home['icontype']) { echo 'checked';} ?> /><span>Картинка</span>
				</label>	
			</div>
			<div class="col-sm-2 zavisimost_ico" <?php if (!$revtheme_aboutstore_home['icontype']) { ?> style="display: none" <?php } ?>>
				<span class="fazavisimost fa_icon form-control width_initial" id="icon_aboutstore_home" onclick="fa_icons($(this).attr('id'))"><i class="<?php echo $revtheme_aboutstore_home['icon']; ?>"></i></span>
				<input type="hidden" name="revtheme_aboutstore_home[icon]" value="<?php echo $revtheme_aboutstore_home['icon']; ?>" id="input-icon_aboutstore_home" />
			</div>
			<div class="col-sm-2" <?php if ($revtheme_aboutstore_home['icontype']) { ?> style="display: none" <?php } ?>>
				<a href="" id="thumb-image_revtheme_aboutstore_home" data-toggle="image" class="img-thumbnail width_initial"><img style="width:25px;" src="<?php echo $revtheme_aboutstore_home_thumb; ?>" alt="" title="" data-placeholder="<?php echo $placeholder; ?>" /></a>
				<input type="hidden" name="revtheme_aboutstore_home[image]" value="<?php echo $revtheme_aboutstore_home['image']; ?>" id="revtheme_aboutstore_home_image" />
			</div>
		</div>
		<div class="form-group">
			<label class="col-sm-2 control-label">Текст:</label>
			<div class="col-sm-10">
				<ul class="nav nav-tabs" id="revtheme_aboutstore_home">
					<?php foreach ($languages as $language) { ?>
						<li><a href="#revtheme_aboutstore_home<?php echo $language['language_id']; ?>" data-toggle="tab"><img src="<?php echo (VERSION >= 2.2) ? 'language/'.$language['code'].'/'.$language['code'].'.png' : 'view/image/flags/'.$language['image']; ?>" title="<?php echo $language['name']; ?>" /> <?php echo $language['name']; ?></a></li>
					<?php } ?>
				</ul>
				<div class="tab-content">
					<?php foreach ($languages as $language) { ?>
						<div class="tab-pane" id="revtheme_aboutstore_home<?php echo $language['language_id']; ?>">
							<textarea name="revtheme_aboutstore_home[<?php echo $language['language_id']; ?>][description]" placeholder="Текст о магазине" id="input-description<?php echo $language['language_id']; ?>" class="form-control"><?php echo isset($revtheme_aboutstore_home[$language['language_id']]['description']) ? $revtheme_aboutstore_home[$language['language_id']]['description'] : ''; ?></textarea>
						</div>
					<?php } ?>
				</div>
			</div>
		</div>
	</div>
	<div class="tab-pane" id="tab_socv">
		<div class="form-group">
			<div class="col-sm-12">
				<div class="form-group">
					<label class="col-sm-2 control-label">Виджет Вконтакте:
					</label>
					<div class="col-sm-3">
						<label class="radio-inline">
							<input type="radio" name="revtheme_home_socv[status_vk]" value="1" <?php if ($revtheme_home_socv['status_vk']) { echo 'checked'; } ?> /><span>Вкл.</span>
						</label>
						<label class="radio-inline">
							<input type="radio" name="revtheme_home_socv[status_vk]" value="0" <?php if (!$revtheme_home_socv['status_vk']) { echo 'checked';} ?> /><span>Выкл.</span>
						</label>
					</div>
				</div>
			</div>
			<div class="col-sm-12">
				<div class="form-group">
					<label class="col-sm-2 control-label">Размеры виджета, px:</label>
					<div class="col-sm-9">
						<div class="row">
						  <div class="col-sm-2">
							<input data-toggle="tooltip" data-placement="top" title="Ширина" type="text" name="revtheme_home_socv[width_vk]" value="<?php echo (isset($revtheme_home_socv['width_vk'])) ? $revtheme_home_socv['width_vk'] : ''; ?>" class="form-control" />
						  </div>
						  <div class="col-sm-2">
							<input data-toggle="tooltip" data-placement="top" title="Высота" type="text" name="revtheme_home_socv[height_vk]" value="<?php echo (isset($revtheme_home_socv['height_vk'])) ? $revtheme_home_socv['height_vk'] : ''; ?>" class="form-control" />
						  </div>
						</div>
					</div>
				</div>
			</div>
			<div class="col-sm-12">
				<div class="form-group">
					<label class="col-sm-2 control-label">Id группы vk:</label>
					<div class="col-sm-3">
						<input type="text" name="revtheme_home_socv[id_vk]" value="<?php echo (isset($revtheme_home_socv['id_vk'])) ? $revtheme_home_socv['id_vk'] : ''; ?>" class="form-control" />
					</div>
				</div>
			</div>
		</div>
		<div class="form-group">
			<div class="col-sm-12">
				<div class="form-group">
					<label class="col-sm-2 control-label">Виджет Instagram:
					</label>
					<div class="col-sm-3">
						<label class="radio-inline">
							<input type="radio" name="revtheme_home_socv[status_insta]" value="1" <?php if ($revtheme_home_socv['status_insta']) { echo 'checked'; } ?> /><span>Вкл.</span>
						</label>
						<label class="radio-inline">
							<input type="radio" name="revtheme_home_socv[status_insta]" value="0" <?php if (!$revtheme_home_socv['status_insta']) { echo 'checked';} ?> /><span>Выкл.</span>
						</label>
					</div>
				</div>
			</div>
			<div class="col-sm-12">
				<div class="form-group">
					<label class="col-sm-2 control-label">Справа от описания магазина:
					</label>
					<div class="col-sm-3">
						<label class="radio-inline">
							<input type="radio" name="revtheme_home_socv[right_insta]" value="1" <?php if ($revtheme_home_socv['right_insta']) { echo 'checked'; } ?> /><span>Да</span>
						</label>
						<label class="radio-inline">
							<input type="radio" name="revtheme_home_socv[right_insta]" value="0" <?php if (!$revtheme_home_socv['right_insta']) { echo 'checked';} ?> /><span>Нет</span>
						</label>
					</div>
				</div>
			</div>
			<div class="col-sm-12">
				<div class="form-group">
					<label class="col-sm-2 control-label">Ширина виджета, px:</label>
						<div class="col-sm-2">
							<input type="text" name="revtheme_home_socv[width_insta]" value="<?php echo (isset($revtheme_home_socv['width_insta'])) ? $revtheme_home_socv['width_insta'] : ''; ?>" class="form-control" />
						</div>
				</div>
			</div>
			<div class="col-sm-12">
				<div class="form-group">
					<label class="col-sm-2 control-label">Id профиля Instagram:</label>
					<div class="col-sm-3">
						<input type="text" name="revtheme_home_socv[id_insta]" value="<?php echo (isset($revtheme_home_socv['id_insta'])) ? $revtheme_home_socv['id_insta'] : ''; ?>" class="form-control" />
					</div>
				</div>
			</div>
		</div>
	</div>
	<div class="tab-pane text-style" id="tab_storereview">
		<div class="form-group">
			<label class="col-sm-2 control-label">Включить:
			</label>
			<div class="col-sm-3">
				<label class="radio-inline">
					<input type="radio" name="revtheme_home_storereview[status]" value="1" <?php if ($revtheme_home_storereview['status']) { echo 'checked'; } ?> /><span>Да</span>
				</label>
				<label class="radio-inline">
					<input type="radio" name="revtheme_home_storereview[status]" value="0" <?php if (!$revtheme_home_storereview['status']) { echo 'checked';} ?> /><span>Нет</span>
				</label>
			</div>
		</div>
		<div class="form-group">
			<label class="col-sm-2 control-label">Заголовок:</label>
			<div class="col-sm-3">
				<?php foreach ($languages as $language) { ?>
					<div class="input-group">
						<span class="input-group-addon"><img src="<?php echo (VERSION >= 2.2) ? 'language/'.$language['code'].'/'.$language['code'].'.png' : 'view/image/flags/'.$language['image']; ?>" title="<?php echo $language['name']; ?>" /></span>
						<input type="text" name="revtheme_home_storereview[<?php echo $language['language_id']; ?>][title]" value="<?php echo(isset($revtheme_home_storereview[$language['language_id']]['title']) ? $revtheme_home_storereview[$language['language_id']]['title'] : 'Отзывы наших клиентов') ?>" class="form-control" />
					</div>
				<?php } ?>
			</div>
		</div>
		<div class="form-group">
			<label class="col-sm-2 control-label">Иконка:</label>
			<div class="col-sm-2">
				<label class="radio-inline">
					<input type="radio" onchange="$(this).parent().parent().parent().find('.zavisimost_ico').show().next().hide();" name="revtheme_home_storereview[icontype]" value="1" <?php if ($revtheme_home_storereview['icontype']) { echo 'checked'; } ?> /><span>Иконка</span>
				</label>
				<label class="radio-inline">
					<input type="radio" onchange="$(this).parent().parent().parent().find('.zavisimost_ico').hide().next().show();" name="revtheme_home_storereview[icontype]" value="0" <?php if (!$revtheme_home_storereview['icontype']) { echo 'checked';} ?> /><span>Картинка</span>
				</label>	
			</div>
			<div class="col-sm-2 zavisimost_ico" <?php if (!$revtheme_home_storereview['icontype']) { ?> style="display: none" <?php } ?>>
				<span class="fazavisimost fa_icon form-control width_initial" id="icon_revtheme_home_storereview" onclick="fa_icons($(this).attr('id'))"><i class="<?php echo $revtheme_home_storereview['icon']; ?>"></i></span>
				<input type="hidden" name="revtheme_home_storereview[icon]" value="<?php echo $revtheme_home_storereview['icon']; ?>" id="input-icon_revtheme_home_storereview" />
			</div>
			<div class="col-sm-2" <?php if ($revtheme_home_storereview['icontype']) { ?> style="display: none" <?php } ?>>
				<a href="" id="thumb-image_revtheme_home_storereview" data-toggle="image" class="img-thumbnail width_initial"><img style="width:25px;" src="<?php echo $revtheme_home_storereview_thumb; ?>" alt="" title="" data-placeholder="<?php echo $placeholder; ?>" /></a>
				<input type="hidden" name="revtheme_home_storereview[image]" value="<?php echo $revtheme_home_storereview['image']; ?>" id="revtheme_home_storereview_image" />
			</div>
		</div>
		<div class="form-group">
			<label class="col-sm-2 control-label">Кнопка "Все отзывы":
			</label>
			<div class="col-sm-3">
				<label class="radio-inline">
					<input type="radio" name="revtheme_home_storereview[button_all]" value="1" <?php if ($revtheme_home_storereview['button_all']) { echo 'checked'; } ?> /><span>Вкл.</span>
				</label>
				<label class="radio-inline">
					<input type="radio" name="revtheme_home_storereview[button_all]" value="0" <?php if (!$revtheme_home_storereview['button_all']) { echo 'checked';} ?> /><span>Выкл.</span>
				</label>
			</div>
		</div>
		<div class="form-group">
			<label class="col-sm-2 control-label">Текст кнопки "Все отзывы":</label>
			<div class="col-sm-3">
				<?php foreach ($languages as $language) { ?>
					<div class="input-group">
						<span class="input-group-addon"><img src="<?php echo (VERSION >= 2.2) ? 'language/'.$language['code'].'/'.$language['code'].'.png' : 'view/image/flags/'.$language['image']; ?>" title="<?php echo $language['name']; ?>" /></span>
						<input type="text" name="revtheme_home_storereview[<?php echo $language['language_id']; ?>][button_all_text]" value="<?php echo(isset($revtheme_home_storereview[$language['language_id']]['button_all_text']) ? $revtheme_home_storereview[$language['language_id']]['button_all_text'] : 'Читать все отзывы') ?>" class="form-control" />
					</div>
				<?php } ?>
			</div>
		</div>
		<div class="form-group">
			<label class="col-sm-2 control-label">Лимит отзывов:</label>
			<div class="col-sm-3">
				<input class="form-control" type="text" name="revtheme_home_storereview[limit]" value="<?php echo $revtheme_home_storereview['limit']; ?>" />
			</div>
		</div>
		<div class="form-group">
			<label class="col-sm-2 control-label">Сортировка отзывов:
			</label>
			<div class="col-sm-3">
				<label class="radio-inline">
					<input type="radio" name="revtheme_home_storereview[order]" value="1" <?php if ($revtheme_home_storereview['order']) { echo 'checked'; } ?> /><span>Случайно</span>
				</label>
				<label class="radio-inline">
					<input type="radio" name="revtheme_home_storereview[order]" value="0" <?php if (!$revtheme_home_storereview['order']) { echo 'checked';} ?> /><span>По дате</span>
				</label>
			</div>
		</div>
		<div class="form-group">
			<label class="col-sm-2 control-label">Лимит символов отзыва:</label>
			<div class="col-sm-3">
					<input class="form-control" type="text" name="revtheme_home_storereview[limit_text]" value="<?php echo $revtheme_home_storereview['limit_text']; ?>" />
			</div>
		</div>
	</div>
	<div class="tab-pane text-style" id="tab_viewed_products">
		<div class="form-group">
			<label class="col-sm-2 control-label">Включить:
			</label>
			<div class="col-sm-2">
				<label class="radio-inline">
					<input type="radio" name="revtheme_home_viewed_products[status]" value="1" <?php if ($revtheme_home_viewed_products['status']) { echo 'checked'; } ?> /><span>Да</span>
				</label>
				<label class="radio-inline">
					<input type="radio" name="revtheme_home_viewed_products[status]" value="0" <?php if (!$revtheme_home_viewed_products['status']) { echo 'checked';} ?> /><span>Нет</span>
				</label>
			</div>
		</div>
		<div class="form-group">
			<label class="col-sm-2 control-label">Заголовок:</label>
			<div class="col-sm-3">
				<?php foreach ($languages as $language) { ?>
					<div class="input-group">
						<span class="input-group-addon"><img src="<?php echo (VERSION >= 2.2) ? 'language/'.$language['code'].'/'.$language['code'].'.png' : 'view/image/flags/'.$language['image']; ?>" title="<?php echo $language['name']; ?>" /></span>
						<input type="text" name="revtheme_home_viewed_products[<?php echo $language['language_id']; ?>][zagolovok]" value="<?php echo(isset($revtheme_home_viewed_products[$language['language_id']]['zagolovok']) ? $revtheme_home_viewed_products[$language['language_id']]['zagolovok'] : 'Вы смотрели') ?>" class="form-control" />
					</div>
				<?php } ?>
			</div>
		</div>
		<div class="form-group">
			<label class="col-sm-2 control-label">Иконка:</label>
			<div class="col-sm-2">
				<label class="radio-inline">
					<input type="radio" onchange="$(this).parent().parent().parent().find('.zavisimost_ico').show().next().hide();" name="revtheme_home_viewed_products[icontype]" value="1" <?php if ($revtheme_home_viewed_products['icontype']) { echo 'checked'; } ?> /><span>Иконка</span>
				</label>
				<label class="radio-inline">
					<input type="radio" onchange="$(this).parent().parent().parent().find('.zavisimost_ico').hide().next().show();" name="revtheme_home_viewed_products[icontype]" value="0" <?php if (!$revtheme_home_viewed_products['icontype']) { echo 'checked';} ?> /><span>Картинка</span>
				</label>	
			</div>
			<div class="col-sm-2 zavisimost_ico" <?php if (!$revtheme_home_viewed_products['icontype']) { ?> style="display: none" <?php } ?>>
				<span class="fazavisimost fa_icon form-control width_initial" id="icon_revtheme_home_viewed_products" onclick="fa_icons($(this).attr('id'))"><i class="<?php echo $revtheme_home_viewed_products['icon']; ?>"></i></span>
				<input type="hidden" name="revtheme_home_viewed_products[icon]" value="<?php echo $revtheme_home_viewed_products['icon']; ?>" id="input-icon_revtheme_home_viewed_products" />
			</div>
			<div class="col-sm-2" <?php if ($revtheme_home_viewed_products['icontype']) { ?> style="display: none" <?php } ?>>
				<a href="" id="thumb-image_revtheme_home_viewed_products" data-toggle="image" class="img-thumbnail width_initial"><img style="width:25px;" src="<?php echo $revtheme_home_viewed_products_thumb; ?>" alt="" title="" data-placeholder="<?php echo $placeholder; ?>" /></a>
				<input type="hidden" name="revtheme_home_viewed_products[image]" value="<?php echo $revtheme_home_viewed_products['image']; ?>" id="revtheme_home_viewed_products_image" />
			</div>
		</div>
		<div class="form-group">
			<label class="col-sm-2 control-label">Лимит товаров:</label>
			<div class="col-sm-3">
				<input type="text" name="revtheme_home_viewed_products[limit]" value="<?php echo $revtheme_home_viewed_products['limit']; ?>" class="form-control" />
			</div>
		</div>
	</div>
</div>
</div>
<div class="tab-pane" id="tab_user_set">
	<div class="col-sm-2">
    <nav class="nav-sidebar">
		<ul class="nav tabs">
			<li class="active"><a href="#tab_user_set_styles" data-toggle="tab">Стили css</a></li>
			<li><a href="#tab_user_set_scripts" data-toggle="tab">Скрипты</a></li>
		</ul>
	</nav>
	</div>
	<div class="tab-content col-sm-10">
		<div class="tab-pane active text-style" id="tab_user_set_styles">
			<div class="form-group">
				<label class="col-sm-1 control-label">Стили:</label>
				<div class="col-sm-11">
					<textarea name="revtheme_footer_user_set[styles]" class="form-control" rows = "20"><?php echo $revtheme_footer_user_set['styles']; ?></textarea>
				</div>
			</div>
		</div>
		<div class="tab-pane text-style" id="tab_user_set_scripts">
			<div class="form-group">
				<label class="col-sm-1 control-label">Скрипты:</label>
				<div class="col-sm-11">
					<textarea name="revtheme_footer_user_set[scripts]" class="form-control" rows = "20"><?php echo $revtheme_footer_user_set['scripts']; ?></textarea>
				</div>
			</div>
		</div>
	</div>	
</div>
<div class="tab-pane" id="tab_info">
	<div class="col-sm-2">
    <nav class="nav-sidebar">
		<ul class="nav tabs">
			<li class="active"><a href="#tab_info_info" data-toggle="tab">Информация</a></li>
			<li><a href="#tab_info_demos" data-toggle="tab">Демо-данные</a></li>
		</ul>
	</nav>
	</div>
	<div class="tab-content col-sm-10">
		<div class="tab-pane active text-style" id="tab_info_info">
			<div class="form-group">
				<div class="col-sm-12">
					<p style="font-size: 14px">
					Шаблон Revolution, версия <?php echo $theme_version; ?><br>
					Лицензионный ключ: <span style="background-color:#d0f0c0;border-radius:2px;padding:0 2px;"><?php echo $lic_key; ?></span>
					</p>
					<hr>
					<p style="font-size: 14px">	
					Автор шаблона: <a href="https://opencartforum.com/user/14391-pikitos/" target="_blank">pikitos</a><br>
					Сайт: <a href="http://oc-mod.ru/" target="_blank">oc-mod.ru</a><br>
					Почта: info@oc-mod.ru<br>
					Skype: nikita_24ru
					</p>
					<hr>
					<p style="font-size: 14px">
					<!--noindex-->
					Иконки для сайта: <a rel="nofollow" href="https://ru.icons8.com/" target="_blank">icons8.com</a><br>
					Фоны для сайта: <a rel="nofollow" href="https://subtlepatterns.com/" target="_blank">subtlepatterns.com</a><br>
					Подбор цвета: <a rel="nofollow" href="http://www.flatuicolorpicker.com/" target="_blank">flatuicolorpicker.com</a>
					<span class="hidden"><?php echo $md5_file; ?></span>
					<!--/noindex-->
					</p>
				</div>
			</div>
		</div>
		<div class="tab-pane text-style" id="tab_info_demos">
			<div class="form-group">
				<?php if (in_array('revolution', $extension)) { ?>
				<button type="button" class="btn btn-primary btn-sm" data-toggle="modal" data-target="#demo_auto">Установить настройки и демо-данные автотоваров</button><br/><br/>
				<button type="button" class="btn btn-primary btn-sm" data-toggle="modal" data-target="#demo_moda">Установить настройки и демо-данные одежды</button><br/><br/>
				<button type="button" class="btn btn-danger btn-xs" data-toggle="modal" data-target="#undo_theme">Удалить шаблон</button><br/><br/>
				<?php } ?>
				<div class="modal fade" id="demo_auto" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
					<div class="modal-dialog">
						<div class="modal-content">
							<div class="modal-header">
								<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
								<h4 class="modal-title" id="myModalLabel">Установка демо-данных и настроек для магазна автотоваров</h4>
							</div>
							<div class="modal-body" style="font-size: 14px">
							<b>Внимание!</b> Все текущие данные (категории, товары и т.п.) и настройки сотрутся!<br>Устанавливайте демо-данные только на новых магазинах.
							</div>
							<div class="modal-footer">
								<button type="button" class="btn btn-default" data-dismiss="modal">Закрыть</button>
								<a href="<?php echo $install_demo_1; ?>" class="btn btn-primary">Установить</a>
							</div>
						</div>
					</div>
				</div>
				<div class="modal fade" id="demo_moda" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
					<div class="modal-dialog">
						<div class="modal-content">
							<div class="modal-header">
								<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
								<h4 class="modal-title" id="myModalLabel">Установка демо-данных и настроек для магазна одежды</h4>
							</div>
							<div class="modal-body" style="font-size: 14px">
							<b>Внимание!</b> Все текущие данные (категории, товары и т.п.) и настройки сотрутся!<br>Устанавливайте демо-данные только на новых магазинах.
							</div>
							<div class="modal-footer">
								<button type="button" class="btn btn-default" data-dismiss="modal">Закрыть</button>
								<a href="<?php echo $install_demo_2; ?>" class="btn btn-primary">Установить</a>
							</div>
						</div>
					</div>
				</div>
				<div class="modal fade" id="undo_theme" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
					<div class="modal-dialog">
						<div class="modal-content">
							<div class="modal-header">
								<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
								<h4 class="modal-title" id="myModalLabel">Удалить настройки шаблона</h4>
							</div>
							<div class="modal-body" style="font-size: 14px">
							<?php echo $button_uninstall; ?><br>Будьте внимательны.
							</div>
							<div class="modal-footer">
								<button type="button" class="btn btn-default" data-dismiss="modal">Закрыть</button>
								<a href="<?php echo $uninstall; ?>" class="btn btn-danger">Удалить</a>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>	
</div>
<div class="tab-pane" id="tab_all_settings">
	<div class="col-sm-2">
    <nav class="nav-sidebar">
		<ul class="nav tabs">
			<li class="active"><a href="#tab_all_settings_osn" data-toggle="tab">Общие настройки</a></li>
			<li><a href="#tab_all_settings_contacts" data-toggle="tab">Страница контактов</a></li>
			<li><a href="#tab_all_settings_modal" data-toggle="tab">Всплывающее окно</a></li>
			<li><a href="#tab_all_settings_microdata" data-toggle="tab">Микроразметка</a></li>
		</ul>
	</nav>
	</div>
	<div class="tab-content col-sm-10">
		<div class="tab-pane active text-style" id="tab_all_settings_osn">
			<div class="form-group">
				<label class="col-sm-2 control-label">Включить кэширование:</label>
				<div class="col-sm-2">
					<label class="radio-inline">
						<input type="radio" name="revtheme_all_settings[cache_on]" value="1" <?php if ($revtheme_all_settings['cache_on']) { echo 'checked'; } ?> /><span>Да</span>
					</label>
					<label class="radio-inline">
						<input type="radio" name="revtheme_all_settings[cache_on]" value="0" <?php if (!$revtheme_all_settings['cache_on']) { echo 'checked';} ?> /><span>Нет</span>
					</label>
				</div>
			</div>
			<div class="form-group">
				<label class="col-sm-2 control-label">Альтернативная страница 404:</label>
				<div class="col-sm-2">
					<label class="radio-inline">
						<input type="radio" name="revtheme_all_settings[error404]" value="1" <?php if ($revtheme_all_settings['error404']) { echo 'checked'; } ?> /><span>Да</span>
					</label>
					<label class="radio-inline">
						<input type="radio" name="revtheme_all_settings[error404]" value="0" <?php if (!$revtheme_all_settings['error404']) { echo 'checked';} ?> /><span>Нет</span>
					</label>
				</div>
			</div>
			<div class="form-group">
				<label class="col-sm-2 control-label">Индикатор загрузки страницы:</label>
				<div class="col-sm-2">
					<label class="radio-inline">
						<input type="radio" name="revtheme_all_settings[n_progres]" value="1" <?php if ($revtheme_all_settings['n_progres']) { echo 'checked'; } ?> /><span>Вкл.</span>
					</label>
					<label class="radio-inline">
						<input type="radio" name="revtheme_all_settings[n_progres]" value="0" <?php if (!$revtheme_all_settings['n_progres']) { echo 'checked';} ?> /><span>Выкл.</span>
					</label>
				</div>
			</div>
			<div class="form-group">
				<label class="col-sm-2 control-label">Эффект размытия:</label>
				<div class="col-sm-2">
					<label class="radio-inline">
						<input type="radio" name="revtheme_all_settings[razmiv_cont]" value="1" <?php if ($revtheme_all_settings['razmiv_cont']) { echo 'checked'; } ?> /><span>Вкл.</span>
					</label>
					<label class="radio-inline">
						<input type="radio" name="revtheme_all_settings[razmiv_cont]" value="0" <?php if (!$revtheme_all_settings['razmiv_cont']) { echo 'checked';} ?> /><span>Выкл.</span>
					</label>
				</div>
			</div>
		</div>
		<div class="tab-pane text-style" id="tab_all_settings_contacts">
			<div class="form-group">
				<label class="col-sm-2 control-label">Отображать контакты из настрек магазина:</label>
				<div class="col-sm-2">
					<label class="radio-inline">
						<input type="radio" name="revtheme_all_settings[m_conts]" value="1" <?php if ($revtheme_all_settings['m_conts']) { echo 'checked'; } ?> /><span>Да</span>
					</label>
					<label class="radio-inline">
						<input type="radio" name="revtheme_all_settings[m_conts]" value="0" <?php if (!$revtheme_all_settings['m_conts']) { echo 'checked';} ?> /><span>Нет</span>
					</label>
				</div>
			</div>
			<div class="form-group">
				<label class="col-sm-2 control-label">Отображать дополнительные контакты:</label>
				<div class="col-sm-2">
					<label class="radio-inline">
						<input type="radio" name="revtheme_all_settings[dop_conts]" value="1" <?php if ($revtheme_all_settings['dop_conts']) { echo 'checked'; } ?> /><span>Да</span>
					</label>
					<label class="radio-inline">
						<input type="radio" name="revtheme_all_settings[dop_conts]" value="0" <?php if (!$revtheme_all_settings['dop_conts']) { echo 'checked';} ?> /><span>Нет</span>
					</label>
				</div>
			</div>
			<div class="form-group">
				<label class="col-sm-2 control-label">Отображать ссылки на соц. сети:</label>
				<div class="col-sm-2">
					<label class="radio-inline">
						<input type="radio" name="revtheme_all_settings[soc_conts]" value="1" <?php if ($revtheme_all_settings['soc_conts']) { echo 'checked'; } ?> /><span>Да</span>
					</label>
					<label class="radio-inline">
						<input type="radio" name="revtheme_all_settings[soc_conts]" value="0" <?php if (!$revtheme_all_settings['soc_conts']) { echo 'checked';} ?> /><span>Нет</span>
					</label>
				</div>
			</div>
			<div class="form-group">
				<label class="col-sm-2 control-label">Своя карта в контактах:<span data-toggle="tooltip" title="Введите сюда код карты если хотите поменять карту, формируемую шаблоном или она не отображается."></span></label>
				<div class="col-sm-10">
					<textarea name="revtheme_all_settings[yamap]" class="form-control" rows = "5"><?php echo $revtheme_all_settings['yamap']; ?></textarea>
				</div>
			</div>
			<div class="form-group">
				<label class="col-sm-2 control-label">Дополнительный текст:</label>
				<div class="col-sm-10">
					<ul class="nav nav-tabs" id="revtheme_all_settings">
						<?php foreach ($languages as $language) { ?>
							<li><a href="#revtheme_all_settings<?php echo $language['language_id']; ?>" data-toggle="tab"><img src="<?php echo (VERSION >= 2.2) ? 'language/'.$language['code'].'/'.$language['code'].'.png' : 'view/image/flags/'.$language['image']; ?>" title="<?php echo $language['name']; ?>" /> <?php echo $language['name']; ?></a></li>
						<?php } ?>
					</ul>
					<div class="tab-content">
						<?php foreach ($languages as $language) { ?>
							<div class="tab-pane" id="revtheme_all_settings<?php echo $language['language_id']; ?>">
								<textarea name="revtheme_all_settings[<?php echo $language['language_id']; ?>][description]" placeholder="Текст о магазине" id="input-description-contact<?php echo $language['language_id']; ?>" class="form-control"><?php echo isset($revtheme_all_settings[$language['language_id']]['description']) ? $revtheme_all_settings[$language['language_id']]['description'] : ''; ?></textarea>
							</div>
						<?php } ?>
					</div>
				</div>
			</div>
		</div>
		<div class="tab-pane text-style" id="tab_all_settings_modal">
			<div class="form-group">
				<label class="col-sm-2 control-label">Включить:</label>
				<div class="col-sm-2">
					<label class="radio-inline">
						<input type="radio" name="revtheme_all_settings[modal_status]" value="1" <?php if ($revtheme_all_settings['modal_status']) { echo 'checked'; } ?> /><span>Да</span>
					</label>
					<label class="radio-inline">
						<input type="radio" name="revtheme_all_settings[modal_status]" value="0" <?php if (!$revtheme_all_settings['modal_status']) { echo 'checked';} ?> /><span>Нет</span>
					</label>
				</div>
			</div>
			<div class="form-group">
				<label class="col-sm-2 control-label">Заголовок:</label>
				<div class="col-sm-3">
					<?php foreach ($languages as $language) { ?>
						<div class="input-group">
							<span class="input-group-addon"><img src="<?php echo (VERSION >= 2.2) ? 'language/'.$language['code'].'/'.$language['code'].'.png' : 'view/image/flags/'.$language['image']; ?>" title="<?php echo $language['name']; ?>" /></span>
							<input type="text" name="revtheme_all_settings[<?php echo $language['language_id']; ?>][modal_header]" value="<?php echo(isset($revtheme_all_settings[$language['language_id']]['modal_header']) ? $revtheme_all_settings[$language['language_id']]['modal_header'] : '') ?>" class="form-control" />
						</div>
					<?php } ?>
				</div>
			</div>
			<div class="form-group">
				<label class="col-sm-2 control-label">Показывать через:<span data-toggle="tooltip" title="Время в днях через которое снова будет показано окно. Если 0 - при следующем открытии браузера, 888 - всегда."></span></label>
				<div class="col-sm-3">
					<input type="text" name="revtheme_all_settings[modal_time]" value="<?php echo $revtheme_all_settings['modal_time']; ?>" class="form-control" />
				</div>
			</div>
			<div class="form-group">
				<label class="col-sm-2 control-label">Кнопки подтверждения:<span data-toggle="tooltip" title="Кнопки Да и Нет, например для подтверждения возраста."></span></label>
				<div class="col-sm-2">
					<label class="radio-inline">
						<input type="radio" onchange="$(this).parent().parent().parent().next().show().next().show();" name="revtheme_all_settings[modal_buttons]" value="1" <?php if ($revtheme_all_settings['modal_buttons']) { echo 'checked'; } ?> /><span>Вкл.</span>
					</label>
					<label class="radio-inline">
						<input type="radio" onchange="$(this).parent().parent().parent().next().hide().next().hide();" name="revtheme_all_settings[modal_buttons]" value="0" <?php if (!$revtheme_all_settings['modal_buttons']) { echo 'checked';} ?> /><span>Выкл.</span>
					</label>
				</div>
			</div>
			<div class="form-group" <?php if (!$revtheme_all_settings['modal_buttons']) { echo 'style="display: none"'; } ?>>
				<label class="col-sm-2 control-label">Текст кнопки Нет:</label>
				<div class="col-sm-3">
					<?php foreach ($languages as $language) { ?>
						<div class="input-group">
							<span class="input-group-addon"><img src="<?php echo (VERSION >= 2.2) ? 'language/'.$language['code'].'/'.$language['code'].'.png' : 'view/image/flags/'.$language['image']; ?>" title="<?php echo $language['name']; ?>" /></span>
							<input type="text" name="revtheme_all_settings[<?php echo $language['language_id']; ?>][text_no]" value="<?php echo(isset($revtheme_all_settings[$language['language_id']]['text_no']) ? $revtheme_all_settings[$language['language_id']]['text_no'] : 'Нет') ?>" class="form-control" />
						</div>
					<?php } ?>
				</div>
			</div>
			<div class="form-group" <?php if (!$revtheme_all_settings['modal_buttons']) { echo 'style="display: none"'; } ?>>
				<label class="col-sm-2 control-label">Текст кнопки Да:</label>
				<div class="col-sm-3">
					<?php foreach ($languages as $language) { ?>
						<div class="input-group">
							<span class="input-group-addon"><img src="<?php echo (VERSION >= 2.2) ? 'language/'.$language['code'].'/'.$language['code'].'.png' : 'view/image/flags/'.$language['image']; ?>" title="<?php echo $language['name']; ?>" /></span>
							<input type="text" name="revtheme_all_settings[<?php echo $language['language_id']; ?>][text_yes]" value="<?php echo(isset($revtheme_all_settings[$language['language_id']]['text_yes']) ? $revtheme_all_settings[$language['language_id']]['text_yes'] : 'Да') ?>" class="form-control" />
						</div>
					<?php } ?>
				</div>
			</div>
			<div class="form-group">
				<label class="col-sm-2 control-label">Сообщение:</label>
				<div class="col-sm-10">
					<ul class="nav nav-tabs" id="revtheme_all_settings2">
						<?php foreach ($languages as $language) { ?>
							<li><a href="#revtheme_all_settings2<?php echo $language['language_id']; ?>" data-toggle="tab"><img src="<?php echo (VERSION >= 2.2) ? 'language/'.$language['code'].'/'.$language['code'].'.png' : 'view/image/flags/'.$language['image']; ?>" title="<?php echo $language['name']; ?>" /> <?php echo $language['name']; ?></a></li>
						<?php } ?>
					</ul>
					<div class="tab-content">
						<?php foreach ($languages as $language) { ?>
							<div class="tab-pane" id="revtheme_all_settings2<?php echo $language['language_id']; ?>">
								<textarea name="revtheme_all_settings[<?php echo $language['language_id']; ?>][modal_text]" placeholder="Текст о магазине" id="input-modal-text<?php echo $language['language_id']; ?>" class="form-control"><?php echo isset($revtheme_all_settings[$language['language_id']]['modal_text']) ? $revtheme_all_settings[$language['language_id']]['modal_text'] : ''; ?></textarea>
							</div>
						<?php } ?>
					</div>
				</div>
			</div>
		</div>
		<div class="tab-pane text-style" id="tab_all_settings_microdata">
			<div class="form-group">
				<label class="col-sm-2 control-label">Микроразметка данных о компании:</label>
				<div class="col-sm-2">
					<label class="radio-inline">
						<input type="radio" name="revtheme_all_settings[microdata_status]" value="1" <?php if ($revtheme_all_settings['microdata_status']) { echo 'checked'; } ?> /><span>Вкл.</span>
					</label>
					<label class="radio-inline">
						<input type="radio" name="revtheme_all_settings[microdata_status]" value="0" <?php if (!$revtheme_all_settings['microdata_status']) { echo 'checked';} ?> /><span>Выкл.</span>
					</label>
				</div>
			</div>
			<div class="form-group">
				<label class="col-sm-2 control-label">Почтовый индекс:</label>
				<div class="col-sm-3">
					<input type="text" name="revtheme_all_settings[microdata_postcode]" placeholder="119021" value="<?php echo $revtheme_all_settings['microdata_postcode']; ?>" class="form-control" />
				</div>
			</div>
			<div class="form-group">
				<label class="col-sm-2 control-label">Город:</label>
				<div class="col-sm-3">
					<input type="text" name="revtheme_all_settings[microdata_city]" placeholder="Москва" value="<?php echo $revtheme_all_settings['microdata_city']; ?>" class="form-control" />
				</div>
			</div>
			<div class="form-group">
				<label class="col-sm-2 control-label">Адрес:</label>
				<div class="col-sm-3">
					<input type="text" name="revtheme_all_settings[microdata_adress]" placeholder="Льва Толстого, 16" value="<?php echo $revtheme_all_settings['microdata_adress']; ?>" class="form-control" />
				</div>
			</div>
			<div class="form-group">
				<label class="col-sm-2 control-label">Телефоны:<span data-toggle="tooltip" title="Если несколько номеров, то вводить через запятую"></span></label>
				<div class="col-sm-6">
					<textarea name="revtheme_all_settings[microdata_phones]" placeholder="+7 495 222–33–44, +7 495 555–66-77" class="form-control"><?php echo isset($revtheme_all_settings['microdata_phones']) ? $revtheme_all_settings['microdata_phones'] : ''; ?></textarea>
				</div>
			</div>
			<div class="form-group">
				<label class="col-sm-2 control-label">Социальные сети:<span data-toggle="tooltip" title="Если несколько, то вводить через запятую"></span></label>
				<div class="col-sm-6">
					<textarea name="revtheme_all_settings[microdata_social]" placeholder="https://vk.com, http://ok.ru, https://www.youtube.com" class="form-control"><?php echo isset($revtheme_all_settings['microdata_social']) ? $revtheme_all_settings['microdata_social'] : ''; ?></textarea>
				</div>
			</div>
			<div class="form-group">
				<label class="col-sm-2 control-label">E-mail:</label>
				<div class="col-sm-3">
					<input type="text" name="revtheme_all_settings[microdata_email]" value="<?php echo $revtheme_all_settings['microdata_email']; ?>" class="form-control" />
				</div>
			</div>
		</div>
	</div>	
</div>
<hr>
</div>
        </form>
		<?php } ?>
      </div>
    </div>
	<div class="panel-footer clearfix">
		<div class="pull-left">
		<span style="vertical-align: middle;margin-right: 10px;">2016 - <?php echo date('Y') ?> © Revolution v.<?php echo $theme_version; ?></span>
		</div>
		<?php if (in_array('revolution', $extension)) { ?>
		<div class="pull-right">
		<a href="<?php echo $clear_cache; ?>" class="btn btn-primary btn-xs">Очистить системный кэш</a>
		</div>
		<?php } ?>
    </div>

  </div>
</div>
<script type="text/javascript" src="view/javascript/revolution/jscolor.min.js"></script>
<script type="text/javascript" src="view/javascript/revolution/popup_icons.js"></script>
<script type="text/javascript"><!--
$('#revtheme_aboutstore_home li:first-child a').tab('show');
$('#revtheme_all_settings li:first-child a').tab('show');
$('#revtheme_all_settings2 li:first-child a').tab('show');
<?php foreach ($languages as $language) { ?>

				$('#input-description<?php echo $language['language_id']; ?>').summernote({height: 300});
				$('#input-description-contact<?php echo $language['language_id']; ?>').summernote({height: 300});
				$('#input-modal-text<?php echo $language['language_id']; ?>').summernote({height: 300});
			
<?php } ?>
function apply(){
	$(".alert").remove();
	$.post($("#form-revolution").attr('action'), $("#form-revolution").serialize(), function(html) {
		var $success = $(html).find(".alert-success, .alert-danger");
		if ($success.length > 0) {
			$(".alert-helper").before($success);
		}
	});
}

var radiocheckedval = $("#ajax_search_status:checked").attr("value");
if (radiocheckedval == 1) {
	$("#ajax_search_status_zavisimost").css('display', 'block');
} else {
	$("#ajax_search_status_zavisimost").css('display', 'none');
}
function ajax_search_status_zavisimost(radio) {
  var valzn = radio.value;
    if (valzn == 1) {
       $("#ajax_search_status_zavisimost").fadeIn(100);
   } else {
       $("#ajax_search_status_zavisimost").fadeOut(100);
   } 
}

var radiocheckedval2 = $("#atributs_zavisimost_radio:checked").attr("value");
if (radiocheckedval2 == 0) {
	$("#atributs_zavisimost").css('display', 'block');
} else {
	$("#atributs_zavisimost").css('display', 'none');
}
function atributs_zavisimost(radio2) {
  var valzn2 = radio2.value;
    if (valzn2 == 0) {
       $("#atributs_zavisimost").fadeIn(100);
   } else {
       $("#atributs_zavisimost").fadeOut(100);
   } 
}

var radiocheckedval3 = $("#dop_contacts_zavisimost_radio:checked").attr("value");
if (radiocheckedval3 == 1) {
	$("#dop_contacts_zavisimost").css('display', 'block');
} else {
	$("#dop_contacts_zavisimost").css('display', 'none');
}
function dop_contacts_zavisimost(radio3) {
  var valzn3 = radio3.value;
    if (valzn3 == 1) {
       $("#dop_contacts_zavisimost").fadeIn(100);
   } else {
       $("#dop_contacts_zavisimost").fadeOut(100);
   } 
}

var radiocheckedval4 = $("#header_menu_zavisimost_radio:checked").attr("value");
if (radiocheckedval4 == 1) {
	$("#header_menu_zavisimost").css('display', 'block');
} else {
	$("#header_menu_zavisimost").css('display', 'none');
}
function header_menu_zavisimost(radio4) {
  var valzn4 = radio4.value;
    if (valzn4 == 1) {
       $("#header_menu_zavisimost").fadeIn(100);
   } else {
       $("#header_menu_zavisimost").fadeOut(100);
   } 
}

var radiocheckedval5 = $("#zavisimost5_radio:checked").attr("value");
if (radiocheckedval5 == 1) {
	$("#zavisimost5").css('display', 'block');
} else {
	$("#zavisimost5").css('display', 'none');
}
function zavisimost5(radio5) {
  var valzn5 = radio5.value;
    if (valzn5 == 1) {
       $("#zavisimost5").fadeIn(100);
   } else {
       $("#zavisimost5").fadeOut(100);
   }
}

var radiocheckedval6 = $("#zavisimost6_radio:checked").attr("value");
if (radiocheckedval6 == 1) {
	$("#zavisimost6").css('display', 'block');
} else {
	$("#zavisimost6").css('display', 'none');
}
function zavisimost6(radio6) {
  var valzn6 = radio6.value;
    if (valzn6 == 1) {
       $("#zavisimost6").fadeIn(100);
   } else {
       $("#zavisimost6").fadeOut(100);
   } 
}

var radiocheckedval_revtheme_home_last = $(".revtheme_home_last_radio:checked").attr("value");
if (radiocheckedval_revtheme_home_last == 1) {
	$(".revtheme_home_last_zavisimost_1").css('display', 'block');
	$(".revtheme_home_last_zavisimost_2").css('display', 'none');
} else {
	$(".revtheme_home_last_zavisimost_1").css('display', 'none');
	$(".revtheme_home_last_zavisimost_2").css('display', 'block');
}
function revtheme_home_last_zavisimost(revtheme_home_last_radio) {
  var revtheme_home_last_radio_valzn = revtheme_home_last_radio.value;
    if (revtheme_home_last_radio_valzn == 1) {
       $(".revtheme_home_last_zavisimost_1").fadeIn(0);
	   $(".revtheme_home_last_zavisimost_2").fadeOut(0);
   } else {
       $(".revtheme_home_last_zavisimost_1").fadeOut(0);
	   $(".revtheme_home_last_zavisimost_2").fadeIn(0);
   } 
}

var radiocheckedval_revtheme_home_best = $(".revtheme_home_best_radio:checked").attr("value");
if (radiocheckedval_revtheme_home_best == 1) {
	$(".revtheme_home_best_zavisimost_1").css('display', 'block');
	$(".revtheme_home_best_zavisimost_2").css('display', 'none');
} else {
	$(".revtheme_home_best_zavisimost_1").css('display', 'none');
	$(".revtheme_home_best_zavisimost_2").css('display', 'block');
}
function revtheme_home_best_zavisimost(revtheme_home_best_radio) {
  var revtheme_home_best_radio_valzn = revtheme_home_best_radio.value;
    if (revtheme_home_best_radio_valzn == 1) {
       $(".revtheme_home_best_zavisimost_1").fadeIn(0);
	   $(".revtheme_home_best_zavisimost_2").fadeOut(0);
   } else {
       $(".revtheme_home_best_zavisimost_1").fadeOut(0);
	   $(".revtheme_home_best_zavisimost_2").fadeIn(0);
   } 
}

var radiocheckedval_revtheme_home_spec = $(".revtheme_home_spec_radio:checked").attr("value");
if (radiocheckedval_revtheme_home_spec == 1) {
	$(".revtheme_home_spec_zavisimost_1").css('display', 'block');
	$(".revtheme_home_spec_zavisimost_2").css('display', 'none');
} else {
	$(".revtheme_home_spec_zavisimost_1").css('display', 'none');
	$(".revtheme_home_spec_zavisimost_2").css('display', 'block');
}
function revtheme_home_spec_zavisimost(revtheme_home_spec_radio) {
  var revtheme_home_spec_radio_valzn = revtheme_home_spec_radio.value;
    if (revtheme_home_spec_radio_valzn == 1) {
       $(".revtheme_home_spec_zavisimost_1").fadeIn(0);
	   $(".revtheme_home_spec_zavisimost_2").fadeOut(0);
   } else {
       $(".revtheme_home_spec_zavisimost_1").fadeOut(0);
	   $(".revtheme_home_spec_zavisimost_2").fadeIn(0);
   } 
}
//--></script>
<script type="text/javascript"><!--
function showhide() {
  var $select = $('#select');
  var selectedValue = $select.val();
  $("#rowfeatured")[selectedValue == 'featured' ? 'show' : 'hide'] ();
  $("#catonly")[selectedValue == 'featured' ? 'hide' : 'show'] ();
}
$('input[name=\'last_product\']').autocomplete({
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
      $('#last_products-product' + item.value).remove();
      $('#last_products-product').append('<div id="last_products-product' +  item.value + '">' + item.label + ' <i class="fa fa-minus-circle"></i><input type="hidden" value="' + item.value + '" /></div>');
      $('#last_products-product div:odd').attr('class', 'odd');
      $('#last_products-product div:even').attr('class', 'even');
      var data = $.map($('#last_products-product input'), function(element){
        return $(element).attr('value');
      });
      $('input[name=\'revtheme_catalog_last[last_products]\']').attr('value', data.join());
	}
});
$('.scrollbox_last_products').on('click', '.fa-minus-circle', function() {
	$(this).parent().remove();
	$('#last_products-product div:odd').attr('class', 'odd');
	$('#last_products-product div:even').attr('class', 'even');
	var data = $.map($('#last_products-product input'), function(element){
		return $(element).attr('value');
	});
	$('input[name=\'revtheme_catalog_last[last_products]\']').attr('value', data.join());
});
$('input[name=\'best_product\']').autocomplete({
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
      $('#best_products-product' + item.value).remove();
      $('#best_products-product').append('<div id="best_products-product' +  item.value + '">' + item.label + ' <i class="fa fa-minus-circle"></i><input type="hidden" value="' + item.value + '" /></div>');
      $('#best_products-product div:odd').attr('class', 'odd');
      $('#best_products-product div:even').attr('class', 'even');
      var data = $.map($('#best_products-product input'), function(element){
        return $(element).attr('value');
      });
      $('input[name=\'revtheme_catalog_best[best_products]\']').attr('value', data.join());
	}
});
$('.scrollbox_best_products').on('click', '.fa-minus-circle', function() {
	$(this).parent().remove();
	$('#best_products-product div:odd').attr('class', 'odd');
	$('#best_products-product div:even').attr('class', 'even');
	var data = $.map($('#best_products-product input'), function(element){
		return $(element).attr('value');
	});
	$('input[name=\'revtheme_catalog_best[best_products]\']').attr('value', data.join());
});
$('input[name=\'product\']').autocomplete({
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
      $('#featured-product' + item.value).remove();
      $('#featured-product').append('<div id="featured-product' +  item.value + '">' + item.label + ' <i class="fa fa-minus-circle"></i><input type="hidden" value="' + item.value + '" /></div>');
      $('#featured-product div:odd').attr('class', 'odd');
      $('#featured-product div:even').attr('class', 'even');
      var data = $.map($('#featured-product input'), function(element){
        return $(element).attr('value');
      });
      $('input[name=\'revtheme_slider_1[featured]\']').attr('value', data.join());
	}
});
$('.scrollbox').on('click', '.fa-minus-circle', function() {
	$(this).parent().remove();
	$('#featured-product div:odd').attr('class', 'odd');
	$('#featured-product div:even').attr('class', 'even');
	var data = $.map($('#featured-product input'), function(element){
		return $(element).attr('value');
	});
	$('input[name=\'revtheme_slider_1[featured]\']').attr('value', data.join());
});
function showhide2() {
  var $select = $('#select2');
  var selectedValue = $select.val();
  $("#rowfeatured2")[selectedValue == 'featured' ? 'show' : 'hide'] ();
  $("#catonly2")[selectedValue == 'featured' ? 'hide' : 'show'] ();
}
$('input[name=\'product2\']').autocomplete({
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
      $('#featured-product2' + item.value).remove();
      $('#featured-product2').append('<div id="featured-product2' +  item.value + '">' + item.label + ' <i class="fa fa-minus-circle"></i><input type="hidden" value="' + item.value + '" /></div>');
      $('#featured-product2 div:odd').attr('class', 'odd');
      $('#featured-product2 div:even').attr('class', 'even');
      var data = $.map($('#featured-product2 input'), function(element){
        return $(element).attr('value');
      });
      $('input[name=\'revtheme_slider_2[featured]\']').attr('value', data.join());
	}
});
$('.scrollbox2').on('click', '.fa-minus-circle', function() {
	$(this).parent().remove();
	$('#featured-product2 div:odd').attr('class', 'odd');
	$('#featured-product2 div:even').attr('class', 'even');
	var data = $.map($('#featured-product2 input'), function(element){
		return $(element).attr('value');
	});
	$('input[name=\'revtheme_slider_2[featured]\']').attr('value', data.join());
});
function showhide3() {
  var $select = $('#select3');
  var selectedValue = $select.val();
  $("#rowfeatured3")[selectedValue == 'featured' ? 'show' : 'hide'] ();
  $("#catonly3")[selectedValue == 'featured' ? 'hide' : 'show'] ();
}
$('input[name=\'product3\']').autocomplete({
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
      $('#featured-product3' + item.value).remove();
      $('#featured-product3').append('<div id="featured-product3' +  item.value + '">' + item.label + ' <i class="fa fa-minus-circle"></i><input type="hidden" value="' + item.value + '" /></div>');
      $('#featured-product3 div:odd').attr('class', 'odd');
      $('#featured-product3 div:even').attr('class', 'even');
      var data = $.map($('#featured-product3 input'), function(element){
        return $(element).attr('value');
      });
      $('input[name=\'revtheme_slider_3[featured]\']').attr('value', data.join());
	}
});
$('.scrollbox3').on('click', '.fa-minus-circle', function() {
	$(this).parent().remove();
	$('#featured-product3 div:odd').attr('class', 'odd');
	$('#featured-product3 div:even').attr('class', 'even');
	var data = $.map($('#featured-product3 input'), function(element){
		return $(element).attr('value');
	});
	$('input[name=\'revtheme_slider_3[featured]\']').attr('value', data.join());
});
function showhide4() {
  var $select = $('#select4');
  var selectedValue = $select.val();
  $("#rowfeatured4")[selectedValue == 'featured' ? 'show' : 'hide'] ();
  $("#catonly4")[selectedValue == 'featured' ? 'hide' : 'show'] ();
}
$('input[name=\'product4\']').autocomplete({
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
      $('#featured-product4' + item.value).remove();
      $('#featured-product4').append('<div id="featured-product4' +  item.value + '">' + item.label + ' <i class="fa fa-minus-circle"></i><input type="hidden" value="' + item.value + '" /></div>');
      $('#featured-product4 div:odd').attr('class', 'odd');
      $('#featured-product4 div:even').attr('class', 'even');
      var data = $.map($('#featured-product4 input'), function(element){
        return $(element).attr('value');
      });
      $('input[name=\'revtheme_slider_4[featured]\']').attr('value', data.join());
	}
});
$('.scrollbox4').on('click', '.fa-minus-circle', function() {
	$(this).parent().remove();
	$('#featured-product4 div:odd').attr('class', 'odd');
	$('#featured-product4 div:even').attr('class', 'even');
	var data = $.map($('#featured-product4 input'), function(element){
		return $(element).attr('value');
	});
	$('input[name=\'revtheme_slider_4[featured]\']').attr('value', data.join());
});
function showhide5() {
  var $select = $('#select5');
  var selectedValue = $select.val();
  $("#rowfeatured5")[selectedValue == 'featured' ? 'show' : 'hide'] ();
  $("#catonly5")[selectedValue == 'featured' ? 'hide' : 'show'] ();
}
$('input[name=\'product5\']').autocomplete({
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
      $('#featured-product5' + item.value).remove();
      $('#featured-product5').append('<div id="featured-product5' +  item.value + '">' + item.label + ' <i class="fa fa-minus-circle"></i><input type="hidden" value="' + item.value + '" /></div>');
      $('#featured-product5 div:odd').attr('class', 'odd');
      $('#featured-product5 div:even').attr('class', 'even');
      var data = $.map($('#featured-product5 input'), function(element){
        return $(element).attr('value');
      });
      $('input[name=\'revtheme_slider_5[featured]\']').attr('value', data.join());
	}
});
$('.scrollbox5').on('click', '.fa-minus-circle', function() {
	$(this).parent().remove();
	$('#featured-product5 div:odd').attr('class', 'odd');
	$('#featured-product5 div:even').attr('class', 'even');
	var data = $.map($('#featured-product5 input'), function(element){
		return $(element).attr('value');
	});
	$('input[name=\'revtheme_slider_5[featured]\']').attr('value', data.join());
});

function showhide6() {
  var $select = $('#select6');
  var selectedValue = $select.val();
  $("#categorywall_categories_style")[selectedValue == '1' ? 'show' : 'hide'] ();
  $("#categorywall_categories_style2")[selectedValue == '2' ? 'show' : 'hide'] ();
}

var item_row_main = $('tr.item_row_main').size()+11;
function addBlockItem() {

	html  = '<tr id="item-row-main' + item_row_main + '" class="item_row_main">';
	html += '<td class="text-center"><div><label class="radio-inline"><input type="radio" name="revtheme_blocks_home_item[' + item_row_main + '][icontype]" value="1" checked onchange="$(this).parent().parent().parent().find(\'.zavisimost_ico\').show().next().hide();" /><span>Иконка</span></label><label class="radio-inline"><input type="radio" name="revtheme_blocks_home_item[' + item_row_main + '][icontype]" value="0" onchange="$(this).parent().parent().parent().find(\'.zavisimost_ico\').hide().next().show();" /><span>Картинка</span></label></div><br><div class="zavisimost_ico"><span class="fa_icon" id="icon_banner_' + item_row_main + '" onclick="fa_icons($(this).attr(\'id\'))"><i class="fa fa-opencart"></i></span><input type="hidden" name="revtheme_blocks_home_item[' + item_row_main + '][icon]" value="" id="input-block-icon' + item_row_main + '" /></div><div style="display: none"><a href="" id="revtheme_blocks_home_item_thumb-image' + item_row_main + '" data-toggle="image" class="img-thumbnail"><img src="<?php echo $placeholder; ?>" /></a><input type="hidden" name="revtheme_blocks_home_item[' + item_row_main + '][image]" value="" id="input-block-image' + item_row_main + '" /></div></td>';
	html += '<td class="text-left">';
	<?php foreach ($languages as $language) { ?>
	html += '<div class="input-group"><span class="input-group-addon"><img src="<?php echo (VERSION >= 2.2) ? 'language/'.$language['code'].'/'.$language['code'].'.png' : 'view/image/flags/'.$language['image']; ?>" title="<?php echo $language['name']; ?>" /></span>';
	html += '<input class="form-control" type="text" name="revtheme_blocks_home_item[' + item_row_main + '][title][<?php echo $language['language_id']; ?>]" value="" />';
	html += '</div>';
	<?php } ?>
	html += '</td>';
	html += '<td class="text-left">';
	<?php foreach ($languages as $language) { ?>
	html += '<div class="input-group"><span class="input-group-addon"><img src="<?php echo (VERSION >= 2.2) ? 'language/'.$language['code'].'/'.$language['code'].'.png' : 'view/image/flags/'.$language['image']; ?>" title="<?php echo $language['name']; ?>" /></span>';
	html += '<input class="form-control" type="text" name="revtheme_blocks_home_item[' + item_row_main + '][description][<?php echo $language['language_id']; ?>]" value="" />';
	html += '</div>';
	<?php } ?>
	html += '</td>';	
	html += '<td class="text-left">';
	html += '<input class="form-control"  type="text" name="revtheme_blocks_home_item[' + item_row_main + '][link]" value="" /><label class="radio-inline" style="padding-top: 5px;"><input type="checkbox" name="revtheme_blocks_home_item[' + item_row_main + '][checkbox]" value="1" /> Открывать в модальном окне</label>';
	html += '</td>';
	html += '<td class="text-left"><input class="form-control" type="text" name="revtheme_blocks_home_item[' + item_row_main + '][sort]" size="1" value="" /></td>';
	html += '<td class="text-right"><a class="btn btn-danger" onclick="$(\'#t_home_blocks #item-row-main' + item_row_main  + '\').remove();" data-toggle="tooltip" title="Удалить"><i class="fa fa-trash-o"></i></a></td>';
	html += '</tr>'; 
	
	$('#t_home_blocks tbody').append(html);
	
	item_row_main++;
}

var contact_row = $('tr.contact_row').size()+1;
function addDopContact() {
	
	html  = '<tr id="item-row-dop_contact' + contact_row + '" class="contact_row">';
	html += '<td class="text-center"><span class="fa_icon" id="icon_dop_contact_' + contact_row + '" onclick="fa_icons($(this).attr(\'id\'))"><i class="fa fa-opencart"></i></span><input type="hidden" name="revtheme_header_dop_contact[' + contact_row + '][icon]" value="" id="input-icon' + contact_row + '" /></td>';
	html += '<td class="text-left"><input class="form-control" type="text" name="revtheme_header_dop_contact[' + contact_row + '][number]" value="" placeholder="Контакт ' + contact_row + '" /></td>';
	html += '<td class="text-left"><input class="form-control" type="text" name="revtheme_header_dop_contact[' + contact_row + '][href]" value="" placeholder="Ссылка ' + contact_row + '" /></td>';
	html += '<td class="text-right"><a class="btn btn-danger" onclick="$(\'#t_dop_contacts #item-row-dop_contact' + contact_row  + '\').remove();" data-toggle="tooltip" title="Удалить"><i class="fa fa-trash-o"></i></a></td>';
	html += '</tr>'; 
		
	$('#t_dop_contacts tbody').append(html);
	
	contact_row++;
}

var item_row_main_icon = $('tr.item_row_main_icon').size()+1;
function addBlockItemIcon() {
	html  = '<tr id="item-row-main' + item_row_main_icon + '" class="item_row_main_icon">';
	html += '<td class="text-center"><a href="" id="thumb-image' + item_row_main_icon + '" data-toggle="image"><img style="width: 50px;" src="<?php echo $placeholder; ?>" /></a><input type="hidden" name="revtheme_footer_icon[' + item_row_main_icon + '][image]" value="" id="input-icon-image' + item_row_main_icon + '" /></td>';
	html += '<td class="text-left"><input class="form-control" type="text" name="revtheme_footer_icon[' + item_row_main_icon + '][sort]" size="1" value="" /></td>';
	html += '<td class="text-right"><a class="btn btn-danger" onclick="$(\'#t_footer_icons #item-row-main' + item_row_main_icon  + '\').remove();" data-toggle="tooltip" title="Удалить"><i class="fa fa-trash-o"></i></a></td>';
	html += '</tr>'; 
	
	$('#t_footer_icons tbody').append(html);;	
	item_row_main_icon++;
}

var item_row_main_soc = $('tr.item_row_main_soc').size()+1;
function addBlockItemSoc() {
	html  = '<tr id="item-row-main' + item_row_main_soc + '" class="item_row_main_soc">';
	html += '<td class="text-center"><span class="fa_icon" id="icon_banner_' + item_row_main_soc + '" onclick="fa_icons($(this).attr(\'id\'))"><i class="fa fa-opencart"></i></span><input type="hidden" name="revtheme_footer_soc[' + item_row_main_soc + '][image]" value="" id="input-soc-image' + item_row_main_soc + '" /></td>';
	html += '<td class="text-left">';
	html += '<input class="form-control"  type="text" name="revtheme_footer_soc[' + item_row_main_soc + '][link]" value="" />';
	html += '</td>';
	html += '<td class="text-left">';
	<?php foreach ($languages as $language) { ?>
	html += '<div class="input-group"><span class="input-group-addon"><img src="<?php echo (VERSION >= 2.2) ? 'language/'.$language['code'].'/'.$language['code'].'.png' : 'view/image/flags/'.$language['image']; ?>" title="<?php echo $language['name']; ?>" /></span>';
	html += '<input class="form-control" type="text" name="revtheme_footer_soc[' + item_row_main_soc + '][title][<?php echo $language['language_id']; ?>]" value="" />';
	html += '</div>';
	<?php } ?>
	html += '</td>';
	html += '<td class="text-left"><input class="form-control" type="text" name="revtheme_footer_soc[' + item_row_main_soc + '][sort]" size="1" value="" /></td>';
	html += '<td class="text-right"><a class="btn btn-danger" onclick="$(\'#t_footer_socs #item-row-main' + item_row_main_soc  + '\').remove();" data-toggle="tooltip" title="Удалить"><i class="fa fa-trash-o"></i></a></td>';
	html += '</tr>'; 
	
	$('#t_footer_socs tbody').append(html);;	
	item_row_main_soc++;
}

var item_row_header_link = $('tr.item_row_header_link').size()+1;
function addBlockHeaderLink() {
	html  = '<tr id="item-row-main' + item_row_header_link + '" class="item_row_header_link">';
	html += '<td class="text-left">';
	html += '<input class="form-control"  type="text" name="revtheme_header_link[' + item_row_header_link + '][link]" value="" />';
	html += '</td>';
	html += '<td class="text-left">';
	<?php foreach ($languages as $language) { ?>
	html += '<div class="input-group"><span class="input-group-addon"><img src="<?php echo (VERSION >= 2.2) ? 'language/'.$language['code'].'/'.$language['code'].'.png' : 'view/image/flags/'.$language['image']; ?>" title="<?php echo $language['name']; ?>" /></span>';
	html += '<input class="form-control" type="text" name="revtheme_header_link[' + item_row_header_link + '][title][<?php echo $language['language_id']; ?>]" value="" />';
	html += '</div>';
	<?php } ?>
	html += '</td>';
	html += '<td class="text-left"><input class="form-control" type="text" name="revtheme_header_link[' + item_row_header_link + '][sort]" size="1" value="" /></td>';
	html += '<td class="text-right"><a class="btn btn-danger" onclick="$(\'#t_header_links #item-row-main' + item_row_header_link  + '\').remove();" data-toggle="tooltip" title="Удалить"><i class="fa fa-trash-o"></i></a></td>';
	html += '</tr>'; 
	
	$('#t_header_links tbody').append(html);;	
	item_row_header_link++;
}

var item_row_header_menu_link = $('tr.item_row_header_menu_link').size()+1;
function addBlockHeaderMenuLink() {
	html  = '<tr id="item-row-main' + item_row_header_menu_link + '" class="item_row_header_menu_link">';
	html += '<td class="text-center"><div><label class="radio-inline"><input type="radio" name="revtheme_header_menu_link[' + item_row_header_menu_link + '][icontype]" value="1" checked onchange="$(this).parent().parent().parent().find(\'.zavisimost_ico\').show().next().hide();" /><span>Иконка</span></label><label class="radio-inline"><input type="radio" name="revtheme_header_menu_link[' + item_row_header_menu_link + '][icontype]" value="0" onchange="$(this).parent().parent().parent().find(\'.zavisimost_ico\').hide().next().show();" /><span>Картинка</span></label></div><br><div class="zavisimost_ico"><span class="fa_icon" id="icon_revtheme_header_menu_link' + item_row_header_menu_link + '" onclick="fa_icons($(this).attr(\'id\'))"><i class="fa fa-opencart"></i></span><input type="hidden" name="revtheme_header_menu_link[' + item_row_header_menu_link + '][icon]" value="" id="input-icon_revtheme_header_menu_link' + item_row_header_menu_link + '" /></div><div style="display: none"><a href="" id="revtheme_header_menu_link_thumb-image' + item_row_header_menu_link + '" data-toggle="image" class="img-thumbnail"><img src="<?php echo $placeholder; ?>" /></a><input type="hidden" name="revtheme_header_menu_link[' + item_row_header_menu_link + '][image]" value="" id="revtheme_header_menu_link-image' + item_row_header_menu_link + '" /></div></td>';
	html += '<td class="text-left">';
	html += '<input class="form-control"  type="text" name="revtheme_header_menu_link[' + item_row_header_menu_link + '][link]" value="" />';
	html += '</td>';
	html += '<td class="text-left">';
	<?php foreach ($languages as $language) { ?>
	html += '<div class="input-group"><span class="input-group-addon"><img src="<?php echo (VERSION >= 2.2) ? 'language/'.$language['code'].'/'.$language['code'].'.png' : 'view/image/flags/'.$language['image']; ?>" title="<?php echo $language['name']; ?>" /></span>';
	html += '<input class="form-control" type="text" name="revtheme_header_menu_link[' + item_row_header_menu_link + '][title][<?php echo $language['language_id']; ?>]" value="" />';
	html += '</div>';
	<?php } ?>
	html += '</td>';
	html += '<td class="text-left"><input class="form-control" type="text" name="revtheme_header_menu_link[' + item_row_header_menu_link + '][sort]" size="1" value="" /></td>';
	html += '<td class="text-right"><a class="btn btn-danger" onclick="$(\'#t_amazon_links #item-row-main' + item_row_header_menu_link  + '\').remove();" data-toggle="tooltip" title="Удалить"><i class="fa fa-trash-o"></i></a></td>';
	html += '</tr>'; 
	
	$('#t_amazon_links tbody').append(html);;	
	item_row_header_menu_link++;
}

var item_row_header_link2 = $('tr.item_row_header_link2').size()+1;
function addBlockHeaderLink2() {
	html  = '<tr id="item-row-main' + item_row_header_link2 + '" class="item_row_header_link2">';
	html += '<td class="text-center"><div><label class="radio-inline"><input type="radio" name="revtheme_header_link2[' + item_row_header_link2 + '][icontype]" value="1" checked onchange="$(this).parent().parent().parent().find(\'.zavisimost_ico\').show().next().hide();" /><span>Иконка</span></label><label class="radio-inline"><input type="radio" name="revtheme_header_link2[' + item_row_header_link2 + '][icontype]" value="0" onchange="$(this).parent().parent().parent().find(\'.zavisimost_ico\').hide().next().show();" /><span>Картинка</span></label></div><br><div class="zavisimost_ico"><span class="fa_icon" id="icon_revtheme_header_link2' + item_row_header_link2 + '" onclick="fa_icons($(this).attr(\'id\'))"><i class="fa fa-opencart"></i></span><input type="hidden" name="revtheme_header_link2[' + item_row_header_link2 + '][icon]" value="" id="input-icon_revtheme_header_link2' + item_row_header_link2 + '" /></div><div style="display: none"><a href="" id="revtheme_header_link2-image' + item_row_header_link2 + '" data-toggle="image" class="img-thumbnail"><img src="<?php echo $placeholder; ?>" /></a><input type="hidden" name="revtheme_header_link2[' + item_row_header_link2 + '][image]" value="" id="revtheme_header_link2-image' + item_row_header_link2 + '" /></div></td>';
	html += '<td class="text-left">';
	html += '<input class="form-control"  type="text" name="revtheme_header_link2[' + item_row_header_link2 + '][link]" value="" />';
	html += '</td>';
	html += '<td class="text-left">';
	<?php foreach ($languages as $language) { ?>
	html += '<div class="input-group"><span class="input-group-addon"><img src="<?php echo (VERSION >= 2.2) ? 'language/'.$language['code'].'/'.$language['code'].'.png' : 'view/image/flags/'.$language['image']; ?>" title="<?php echo $language['name']; ?>" /></span>';
	html += '<input class="form-control" type="text" name="revtheme_header_link2[' + item_row_header_link2 + '][title][<?php echo $language['language_id']; ?>]" value="" />';
	html += '</div>';
	<?php } ?>
	html += '</td>';
	html += '<td class="text-left"><input class="form-control" type="text" name="revtheme_header_link2[' + item_row_header_link2 + '][sort]" size="1" value="" /></td>';
	html += '<td class="text-right"><a class="btn btn-danger" onclick="$(\'#t_header_links2 #item-row-main' + item_row_header_link2  + '\').remove();" data-toggle="tooltip" title="Удалить"><i class="fa fa-trash-o"></i></a></td>';
	html += '</tr>'; 
	
	$('#t_header_links2 tbody').append(html);;	
	item_row_header_link2++;
}

var item_row_footer_link = $('tr.item_row_footer_link').size()+1;
function addBlockFooterLink() {
	html  = '<tr id="item-row-main' + item_row_footer_link + '" class="item_row_footer_link">';
	html += '<td class="text-left">';
	html += '<input class="form-control"  type="text" name="revtheme_footer_link[' + item_row_footer_link + '][link]" value="" />';
	html += '</td>';
	html += '<td class="text-left">';
	<?php foreach ($languages as $language) { ?>
	html += '<div class="input-group"><span class="input-group-addon"><img src="<?php echo (VERSION >= 2.2) ? 'language/'.$language['code'].'/'.$language['code'].'.png' : 'view/image/flags/'.$language['image']; ?>" title="<?php echo $language['name']; ?>" /></span>';
	html += '<input class="form-control" type="text" name="revtheme_footer_link[' + item_row_footer_link + '][title][<?php echo $language['language_id']; ?>]" value="" />';
	html += '</div>';
	<?php } ?>
	html += '</td>';
	html += '<td class="text-left"><input class="form-control" type="text" name="revtheme_footer_link[' + item_row_footer_link + '][sort]" size="1" value="" /></td>';
	html += '<td class="text-right"><a class="btn btn-danger" onclick="$(\'#t_footer_links #item-row-main' + item_row_footer_link  + '\').remove();" data-toggle="tooltip" title="Удалить"><i class="fa fa-trash-o"></i></a></td>';
	html += '</tr>'; 
	
	$('#t_footer_links tbody').append(html);;	
	item_row_footer_link++;
}

var item_row_product_main = $('tr.item_row_product_main').size()+11;
function addBlockProductItem() {

	html  = '<tr id="item-row-product-main' + item_row_product_main + '" class="item_row_product_main">';
	html += '<td class="text-center"><div><label class="radio-inline"><input type="radio" name="revtheme_blocks_product_item[' + item_row_product_main + '][icontype]" value="1" checked onchange="$(this).parent().parent().parent().find(\'.zavisimost_ico\').show().next().hide();" /><span>Иконка</span></label><label class="radio-inline"><input type="radio" name="revtheme_blocks_product_item[' + item_row_product_main + '][icontype]" value="0" onchange="$(this).parent().parent().parent().find(\'.zavisimost_ico\').hide().next().show();" /><span>Картинка</span></label></div><br><div class="zavisimost_ico"><span class="fa_icon" id="icon_revtheme_blocks_product_item' + item_row_product_main + '" onclick="fa_icons($(this).attr(\'id\'))"><i class="fa fa-opencart"></i></span><input type="hidden" name="revtheme_blocks_product_item[' + item_row_product_main + '][icon]" value="" id="input-icon_revtheme_blocks_product_item' + item_row_product_main + '" /></div><div style="display: none"><a href="" id="revtheme_blocks_product_item_thumb-image' + item_row_product_main + '" data-toggle="image" class="img-thumbnail"><img src="<?php echo $placeholder; ?>" /></a><input type="hidden" name="revtheme_blocks_product_item[' + item_row_product_main + '][image]" value="" id="revtheme_blocks_product_item-image' + item_row_product_main + '" /></div></td>';
	html += '<td class="text-left">';
	<?php foreach ($languages as $language) { ?>
	html += '<div class="input-group"><span class="input-group-addon"><img src="<?php echo (VERSION >= 2.2) ? 'language/'.$language['code'].'/'.$language['code'].'.png' : 'view/image/flags/'.$language['image']; ?>" title="<?php echo $language['name']; ?>" /></span>';
	html += '<input class="form-control" type="text" name="revtheme_blocks_product_item[' + item_row_product_main + '][title][<?php echo $language['language_id']; ?>]" value="" />';
	html += '</div>';
	<?php } ?>
	html += '</td>';
	html += '<td class="text-left">';
	<?php foreach ($languages as $language) { ?>
	html += '<div class="input-group"><span class="input-group-addon"><img src="<?php echo (VERSION >= 2.2) ? 'language/'.$language['code'].'/'.$language['code'].'.png' : 'view/image/flags/'.$language['image']; ?>" title="<?php echo $language['name']; ?>" /></span>';
	html += '<input class="form-control" type="text" name="revtheme_blocks_product_item[' + item_row_product_main + '][description][<?php echo $language['language_id']; ?>]" value="" />';
	html += '</div>';
	<?php } ?>
	html += '</td>';	
	html += '<td class="text-left">';
	html += '<input class="form-control"  type="text" name="revtheme_blocks_product_item[' + item_row_product_main + '][link]" value="" />';
	html += '</td>';
	html += '<td class="text-left"><input class="form-control" type="text" name="revtheme_blocks_product_item[' + item_row_product_main + '][sort]" size="1" value="" /></td>';
	html += '<td class="text-right"><a class="btn btn-danger" onclick="$(\'#t_product_blocks #item-row-product-main' + item_row_product_main  + '\').remove();" data-toggle="tooltip" title="Удалить"><i class="fa fa-trash-o"></i></a></td>';
	html += '</tr>'; 
	
	$('#t_product_blocks tbody').append(html);
	
	item_row_product_main++;
}
//--></script>
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
<script type="text/javascript"><!--
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
//--></script>
<?php echo $footer; ?>