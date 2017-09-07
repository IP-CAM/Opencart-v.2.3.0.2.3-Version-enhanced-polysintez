<?php echo $header; ?>
    <style>
        #fio-field-values input, #fio-field-values select {
            width: 70%;
        }
    </style>
<?php echo $column_left; ?>
    <div id="content">
        <div class="page-header">
            <div class="container-fluid">
                <div class="pull-right">
                    <button type="submit" form="form" data-toggle="tooltip" title="<?php echo $button_save; ?>"
                            class="btn btn-primary"><i class="fa fa-save"></i></button>
                    <a href="<?php echo $cancel; ?>" data-toggle="tooltip" title="<?php echo $button_cancel; ?>"
                       class="btn btn-default"><i class="fa fa-reply"></i></a>
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
            <div class="panel panel-default">
                <div class="panel-heading">
                    <h3 class="panel-title"><i class="fa fa-pencil"></i> <?php echo $heading_title; ?></h3>
                </div>
                <div class="panel-body">
                    <form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data" id="form"
                          class="form-horizontal">
                        <ul class="nav nav-tabs">
                            <li class="active">
                                <a href="#tab-general" data-toggle="tab">Основные настройки</a>
                            </li>
                            <li>
                                <a href="#tab-fields" data-toggle="tab">Настройки полей</a>
                            </li>
                        </ul>
                        <div class="tab-content">
                            <div class="tab-pane active" id="tab-general">
                                <div class="form-group required">
                                    <label class="col-sm-2 control-label" for="suggest_api">
                                        <?php echo $entry_api; ?>
                                    </label>
                                    <div class="col-sm-10">
                                        <input type="hidden" name="suggest_version" value="<?php echo $version; ?>"/>
                                        <input type="text" id="suggest_api" class="form-control" name="suggest_api"
                                               value="<?php echo $suggest_api; ?>"/>
                                        <?php if (isset($error_api)) { ?>
                                            <span class="error"><?php echo $error_api; ?></span>
                                        <?php } ?>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="col-sm-2 control-label" for="suggest_tips">
                                        <?php echo $entry_tips; ?>
                                    </label>
                                    <div class="col-sm-10">
                                        <input type="number" class="form-control" id="suggest_tips" name="suggest_tips"
                                               value="<?php echo $suggest_tips; ?>"/>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="col-sm-2 control-label" for="suggest_geo">
                                        <?php echo $entry_geo; ?>
                                    </label>
                                    <div class="col-sm-10">
                                        <select class="form-control" id="suggest_geo" name="suggest_geo">
                                            <?php if ($suggest_geo) { ?>
                                                <option value="1" selected="selected"><?php echo $text_yes; ?></option>
                                                <option value="0"><?php echo $text_no; ?></option>
                                            <?php } else { ?>
                                                <option value="1"><?php echo $text_yes; ?></option>
                                                <option value="0" selected="selected"><?php echo $text_no; ?></option>
                                            <?php } ?>
                                        </select>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="col-sm-2 control-label" for="suggest_status">
                                        <?php echo $entry_status; ?>
                                    </label>
                                    <div class="col-sm-10">
                                        <select class="form-control" id="suggest_status" name="suggest_status">
                                            <?php if ($suggest_status) { ?>
                                                <option value="1"
                                                        selected="selected"><?php echo $text_enabled; ?></option>
                                                <option value="0"><?php echo $text_disabled; ?></option>
                                            <?php } else { ?>
                                                <option value="1"><?php echo $text_enabled; ?></option>
                                                <option value="0"
                                                        selected="selected"><?php echo $text_disabled; ?></option>
                                            <?php } ?>
                                        </select>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="col-sm-2 control-label">
                                        <?php echo "Установить демо-данные настроек полей:"; ?>
                                    </label>
                                    <div class="col-sm-10">
                                        <input type="submit" class="btn btn-primary"
                                               formaction="<?php echo $url->link('extension/module/suggest/installDefaultDemoData', 'token=' . $token, 'SSL'); ?>"
                                               name="demo_default" value="Обычный заказ\регистрация"/>
                                        <input type="submit" class="btn btn-warning"
                                               formaction="<?php echo $url->link('extension/module/suggest/installSimpleDemoData', 'token=' . $token, 'SSL'); ?>"
                                               name="demo_default" value="Simple - упрощенная регистрация и заказ"/>
                                    </div>
                                </div>
                            </div>
                            <div class="tab-pane" id="tab-fields">
                                <div class="row">
                                    <div class="col-sm-2">
                                        <ul class="nav nav-pills nav-stacked">
                                            <li class="active">
                                                <a href="#tab-fio-fields" data-toggle="tab">ФИО</a>
                                            </li>
                                            <li>
                                                <a href="#tab-address-fields" data-toggle="tab">Адрес</a>
                                            </li>
                                            <li>
                                                <a href="#tab-email-fields" data-toggle="tab">E-mail</a>
                                            </li>
                                        </ul>
                                    </div>
                                    <div class="col-sm-10">
                                        <div class="tab-content">
                                            <div id="tab-fio-fields" class="tab-pane active">
                                                <?php
                                                $fio_group_key = 0;
                                                if (!empty($fio_groups)) {
                                                    foreach ($fio_groups as $fio_group_key => $fio_group) {
                                                        ?>
                                                        <div class="well"
                                                             id="suggest_fio-group_<?php echo $fio_group_key; ?>">
                                                            <div class="heading"><h2 class="dadata-heading">
                                                                    <span>группа <?php echo $fio_group_key + 1; ?></span>
                                                                </h2></div>
                                                            <div class="form-group" style="margin-bottom: 0;">
                                                                <label class="col-sm-4 control-label"
                                                                       for="suggest_fio_<?php echo $fio_group_key . '_' . $fio_group['group_id']; ?>">html-идентификатор
                                                                    группы<br>(id # или class .):
                                                                </label>
                                                                <div class="col-sm-8"><input type="text" size="50"
                                                                                              class="form-control"
                                                                                              id="suggest_fio_<?php echo $fio_group_key . '_' . $fio_group['group_id']; ?>"
                                                                                              name="suggest_fio[<?php echo $fio_group_key; ?>][group_id]"
                                                                                              value="<?php echo $fio_group['group_id']; ?>">
                                                                </div>
                                                            </div>
                                                            <table id="fio-field-values" class="table table-bordered">
                                                                <thead>
                                                                <tr>
                                                                    <td class="left"><?php echo "Имя поля (атрибут name)"; ?></td>
                                                                    <td class="left"><?php echo "Что подсказывать" ?></td>
                                                                    <td class="left"><?php echo "Статус"; ?></td>
                                                                    <td></td>
                                                                </tr>
                                                                </thead>
                                                                <tbody>
                                                                <tr>
                                                                    <td class="left">
                                                                        <span class="help">html-атрибут "name"</span>
                                                                    </td>
                                                                    <td class="left">
                                                                        <span class="help">Для выбора нескольких значений используйте ctrl+клик.</span>
                                                                    </td>
                                                                    <td class="left">
                                                                        <span class="help">Активность подсказок.</span>
                                                                    </td>
                                                                    <td>
                                                                        <span class="help">Действия.</span>
                                                                    </td>
                                                                </tr>
                                                                </tbody>
                                                                <?php
                                                                $fio_field_key = 0;
                                                                if (isset($fio_group['data']) && !empty($fio_group['data']))
                                                                    foreach ($fio_group['data'] as $fio_field_key => $fio_field) {
                                                                        ?>
                                                                        <tbody
                                                                            id="fio-field-value-row_<?php echo $fio_group_key; ?>_<?php echo $fio_field_key; ?>">
                                                                        <tr>
                                                                            <td class="left"><input type="text" class="form-control"
                                                                                                    name="suggest_fio[<?php echo $fio_group_key; ?>][data][<?php echo $fio_field_key; ?>][name]"
                                                                                                    value="<?php echo $fio_field['name']; ?>"
                                                                                                    size="40"/></td>
                                                                            <td class="left"><select class="form-control" multiple
                                                                                                     name="suggest_fio[<?php echo $fio_group_key; ?>][data][<?php echo $fio_field_key; ?>][parts][]">
                                                                                    <?php if (isset($fio_field_parts_data)) { ?>
                                                                                        <?php foreach ($fio_field_parts_data as $fio_field_part_data) { ?>
                                                                                            <?php
                                                                                            $fio_part_selected_trigger = 0;
                                                                                            foreach ($fio_field['parts'] as $fio_field_saved_part) {
                                                                                                if ($fio_field_saved_part == $fio_field_part_data['value']) {
                                                                                                    ?>
                                                                                                    <option
                                                                                                        value="<?php echo $fio_field_part_data['value']; ?>"
                                                                                                        selected="selected"><?php echo $fio_field_part_data['name']; ?></option>
                                                                                                    <?php
                                                                                                    $fio_part_selected_trigger = 1;
                                                                                                    break;
                                                                                                }
                                                                                            }
                                                                                            ?>
                                                                                            <?php if ($fio_part_selected_trigger == 0) { ?>
                                                                                                <option
                                                                                                    value="<?php echo $fio_field_part_data['value']; ?>"><?php echo $fio_field_part_data['name']; ?></option>
                                                                                            <?php } ?>
                                                                                        <?php } ?>
                                                                                    <?php } ?>
                                                                                </select>
                                                                            </td>

                                                                            <td class="left">
                                                                                <select  class="form-control"
                                                                                    name="suggest_fio[<?php echo $fio_group_key; ?>][data][<?php echo $fio_field_key; ?>][status]">
                                                                                    <?php if ($fio_field['status']) { ?>
                                                                                        <option value="1"
                                                                                                selected="selected"><?php echo $text_enabled; ?></option>
                                                                                        <option
                                                                                            value="0"><?php echo $text_disabled; ?></option>
                                                                                    <?php } else { ?>
                                                                                        <option
                                                                                            value="1"><?php echo $text_enabled; ?></option>
                                                                                        <option value="0"
                                                                                                selected="selected"><?php echo $text_disabled; ?></option>
                                                                                    <?php } ?>
                                                                                </select>
                                                                            </td>
                                                                            <td class="left"><a
                                                                                    onclick="$('#fio-field-value-row_<?php echo $fio_group_key; ?>_<?php echo $fio_field_key; ?>').remove();"
                                                                                    class="btn btn-danger"><?php echo $button_remove; ?></a>
                                                                            </td>
                                                                        </tr>
                                                                        </tbody>
                                                                    <?php } ?>
                                                                <tfoot>
                                                                <tr>
                                                                    <td colspan="3" class="left"><a
                                                                            onclick="addFioFieldValue(<?php echo $fio_group_key; ?>);"
                                                                            class="btn btn-success"><?php echo "Добавить поле"; ?></a>
                                                                    </td>
                                                                    <td class="left"><a
                                                                            onclick="$('#suggest_fio-group_<?php echo $fio_group_key; ?>').remove();"
                                                                            class="btn btn-warning"><?php echo "Удалить группу"; ?></a>
                                                                    </td>
                                                                </tr>
                                                                </tfoot>
                                                            </table>
                                                        </div>
                                                        <?php
                                                    }
                                                } ?>
                                                <a onclick="addFioGroup();" id="addFioGroup" class="btn btn-success">Добавить
                                                    группу</a>
                                            </div>
                                            <div id="tab-address-fields" class="tab-pane">
                                                <?php
                                                $address_group_key = 0;
                                                if (!empty($address_groups)) {
                                                    foreach ($address_groups as $address_group_key => $address_group) {
                                                        ?>
                                                        <div class="well"
                                                             id="suggest_address-group_<?php echo $address_group_key; ?>">
                                                            <div class="heading"><h2 class="dadata-heading">
                                                                    <span>группа <?php echo $address_group_key + 1; ?></span>
                                                                </h2></div>
                                                            <div class="form-group">
                                                            <label class="col-sm-4 control-label"
                                                                   for="suggest_address_<?php echo $address_group_key . '_' . $address_group['group_id']; ?>">html-идентификатор
                                                                группы<br>(id # или class .):
                                                            </label>
                                                                    <div class="col-sm-8"><input class="form-control" type="text" size="50" id="suggest_address_<?php echo $address_group_key . '_' . $address_group['group_id']; ?>"
                                                                               name="suggest_address[<?php echo $address_group_key; ?>][group_id]"
                                                                               value="<?php echo $address_group['group_id']; ?>">
                                                                    </div>
                                                               </div>
                                                            <table id="address-field-values" class="table table-bordered">
                                                                <thead>
                                                                <tr>
                                                                    <td class="left"><?php echo "Имя поля (атрибут name)"; ?></td>
                                                                    <td class="left"><?php echo "Тип поля"; ?></td>
                                                                    <td class="left"><?php echo "Что подсказывать/чем заполнять" ?></td>
                                                                    <td class="left"><?php echo "Область поиска (атрибут name)" ?></td>
                                                                    <td class="left"><?php echo "Статус"; ?></td>
                                                                    <td></td>
                                                                </tr>
                                                                </thead>
                                                                <tbody>
                                                                <tr>
                                                                    <td class="left">
                                                                        <span class="help">html-атрибут "name".</span>
                                                                    </td>
                                                                    <td class="left">
										<span class="help">
											input или select
										</span>
                                                                    </td>
                                                                    <td class="left">
                                                                        <span class="help">Для выбора нескольких значений используйте ctrl+клик.</span>
                                                                    </td>
                                                                    <td class="left">
										<span class="help">должен совпадать с одним из имен полей подсказок.<br/>
											Устанавливает область поиска подсказок.
										</span>
                                                                    </td>
                                                                    <td class="left">
                                                                        <span class="help">Активность подсказок.</span>
                                                                    </td>
                                                                    <td>
                                                                        <span class="help">Действия.</span>
                                                                    </td>
                                                                </tr>
                                                                </tbody>
                                                                <?php
                                                                $address_field_key = 0;
                                                                if (isset($address_group['data']) && !empty($address_group['data']))
                                                                    foreach ($address_group['data'] as $address_field_key => $address_field) {
                                                                        ?>
                                                                        <tbody
                                                                            id="address-field-value-row_<?php echo $address_group_key; ?>_<?php echo $address_field_key; ?>">
                                                                        <tr>
                                                                            <td class="left"><input class="form-control" type="text"
                                                                                                    name="suggest_address[<?php echo $address_group_key; ?>][data][<?php echo $address_field_key; ?>][name]"
                                                                                                    value="<?php echo $address_field['name']; ?>"
                                                                                                    size="40"/></td>
                                                                            <td class="left">
                                                                                <select class="form-control"
                                                                                    name="suggest_address[<?php echo $address_group_key; ?>][data][<?php echo $address_field_key; ?>][type]">
                                                                                    <?php foreach ($fieldTypes as $addFieldType) {
                                                                                        if ($address_field['type'] == $addFieldType['value']) {
                                                                                            ?>
                                                                                            <option
                                                                                                value="<?php echo $addFieldType['value']; ?>"
                                                                                                selected="selected"><?php echo $addFieldType['name']; ?></option>
                                                                                            <?php
                                                                                        } else {
                                                                                            ?>
                                                                                            <option
                                                                                                value="<?php echo $addFieldType['value']; ?>"><?php echo $addFieldType['name']; ?></option>
                                                                                            <?php
                                                                                        }
                                                                                    } ?>
                                                                                </select>
                                                                            </td>
                                                                            <td class="left"><select class="form-control" multiple
                                                                                                     name="suggest_address[<?php echo $address_group_key; ?>][data][<?php echo $address_field_key; ?>][parts_suggest][]"
                                                                                                     size="7">
                                                                                    <?php
                                                                                    if (isset($address_field_parts_data)) {
                                                                                        ?>
                                                                                        <?php foreach ($address_field_parts_data as $address_field_part_data) { ?>
                                                                                            <?php
                                                                                            $address_part_selected_trigger = 0;
                                                                                            foreach ($address_field['parts_suggest'] as $address_field_saved_part) {
                                                                                                if ($address_field_saved_part == $address_field_part_data['value']) {
                                                                                                    ?>
                                                                                                    <option
                                                                                                        value="<?php echo $address_field_part_data['value']; ?>"
                                                                                                        selected="selected"><?php echo $address_field_part_data['name']; ?></option>
                                                                                                    <?php
                                                                                                    $address_part_selected_trigger = 1;
                                                                                                    break;
                                                                                                }
                                                                                            }
                                                                                            ?>
                                                                                            <?php if ($address_part_selected_trigger == 0) { ?>
                                                                                                <option
                                                                                                    value="<?php echo $address_field_part_data['value']; ?>"><?php echo $address_field_part_data['name']; ?></option>
                                                                                            <?php } ?>
                                                                                        <?php } ?>
                                                                                    <?php } ?>
                                                                                </select>
                                                                            </td>
                                                                            <td class="left"><input class="form-control" type="text"
                                                                                                    name="suggest_address[<?php echo $address_group_key; ?>][data][<?php echo $address_field_key; ?>][constraint]"
                                                                                                    value="<?php echo $address_field['constraint']; ?>"
                                                                                                    size="40"/>
                                                                            </td>
                                                                            <td class="left">
                                                                                <select class="form-control"
                                                                                    name="suggest_address[<?php echo $address_group_key; ?>][data][<?php echo $address_field_key; ?>][status]">
                                                                                    <?php if ($address_field['status']) { ?>
                                                                                        <option value="1"
                                                                                                selected="selected"><?php echo $text_enabled; ?></option>
                                                                                        <option
                                                                                            value="0"><?php echo $text_disabled; ?></option>
                                                                                    <?php } else { ?>
                                                                                        <option
                                                                                            value="1"><?php echo $text_enabled; ?></option>
                                                                                        <option value="0"
                                                                                                selected="selected"><?php echo $text_disabled; ?></option>
                                                                                    <?php } ?>
                                                                                </select>
                                                                            </td>
                                                                            <td class="left"><a
                                                                                    onclick="$('#address-field-value-row_<?php echo $address_group_key; ?>_<?php echo $address_field_key; ?>').remove();"
                                                                                    class="btn btn-danger"><?php echo $button_remove; ?></a>
                                                                            </td>
                                                                        </tr>
                                                                        </tbody>
                                                                    <?php } ?>
                                                                <tfoot>
                                                                <tr>
                                                                    <td colspan="5" class="left"><a
                                                                            onclick="addAddressFieldValue(<?php echo $address_group_key; ?>);"
                                                                            class="btn btn-success"><?php echo "Добавить поле"; ?></a>
                                                                    </td>
                                                                    <td class="left"><a
                                                                            onclick="$('#suggest_address-group_<?php echo $address_group_key; ?>').remove();"
                                                                            class="btn btn-warning"><?php echo "Удалить группу"; ?></a>
                                                                    </td>
                                                                </tr>
                                                                </tfoot>
                                                            </table>
                                                        </div>
                                                        <?php
                                                    }
                                                } ?>
                                                <a onclick="addAddressGroup();" id="addAddressGroup" class="btn btn-success">Добавить
                                                    группу</a>
                                            </div>
                                            <div id="tab-email-fields" class="tab-pane">
                                                <?php
                                                $email_group_key = 0;
                                                if (!empty($email_groups)) {
                                                    foreach ($email_groups as $email_group_key => $email_group) {
                                                        ?>
                                                        <div class="well"
                                                             id="suggest_email-group_<?php echo $email_group_key; ?>">
                                                            <div class="heading"><h2 class="dadata-heading">
                                                                    <span>группа <?php echo $email_group_key + 1; ?></span>
                                                                </h2></div>
                                                            <div class="form-group">
                                                            <label class="col-sm-4 control-label"
                                                                   for="suggest_email_<?php echo $email_group_key . '_' . $email_group['group_id']; ?>">html-идентификатор
                                                                группы<br>(id # или class .):
                                                            </label>
                                                                    <div class="col-sm-8"><input class="form-control" type="text" size="50"
                                                                               name="suggest_email[<?php echo $email_group_key; ?>][group_id]"
                                                                               value="<?php echo $email_group['group_id']; ?>">
                                                                    </div>
                                                            </div>
                                                            <table id="email-field-values" class="table table-bordered">
                                                                <thead>
                                                                <tr>
                                                                    <td class="left"><?php echo "Имя поля (name):"; ?></td>
                                                                    <td class="left"><?php echo "Статус:"; ?></td>
                                                                    <td></td>
                                                                </tr>
                                                                </thead>
                                                                <tbody>
                                                                <tr>
                                                                    <td class="left">
                                                    <span
                                                        class="help">html-атрибут "name", только поля типа input.</span>
                                                                    </td>

                                                                    <td class="left">
                                                                        <span class="help">Активность подсказок.</span>
                                                                    </td>
                                                                    <td class="left">
                                                                        <span class="help">Действия.</span>
                                                                    </td>
                                                                </tr>
                                                                </tbody>
                                                                <?php
                                                                $email_field_key = 0;
                                                                if (isset($email_group['data']) && !empty($email_group['data']))
                                                                    foreach ($email_group['data'] as $email_field_key => $email_field) {
                                                                        ?>
                                                                        <tbody
                                                                            id="email-field-value-row_<?php echo $email_group_key; ?>_<?php echo $email_field_key; ?>">
                                                                        <tr>
                                                                            <td class="left">
                                                                                <input size="40" class="form-control"
                                                                                       name="suggest_email[<?php echo $email_group_key; ?>][data][<?php echo $email_field_key; ?>][name]"
                                                                                       value="<?php echo isset($email_field['name']) ? $email_field['name'] : ''; ?>"/>
                                                                            </td>
                                                                            <td class="left">
                                                                                <select class="form-control"
                                                                                    name="suggest_email[<?php echo $email_group_key; ?>][data][<?php echo $email_field_key; ?>][status]">
                                                                                    <?php if (isset($email_field['status']) && $email_field['status']) { ?>
                                                                                        <option value="1"
                                                                                                selected="selected"><?php echo $text_enabled; ?></option>
                                                                                        <option
                                                                                            value="0"><?php echo $text_disabled; ?></option>
                                                                                    <?php } else { ?>
                                                                                        <option
                                                                                            value="1"><?php echo $text_enabled; ?></option>
                                                                                        <option value="0"
                                                                                                selected="selected"><?php echo $text_disabled; ?></option>
                                                                                    <?php } ?>
                                                                                </select>
                                                                            </td>
                                                                            <td class="left"><a
                                                                                    onclick="$('#email-field-value-row_<?php echo $email_group_key; ?>_<?php echo $email_field_key; ?>').remove();"
                                                                                    class="btn btn-danger"><?php echo $button_remove; ?></a>
                                                                            </td>
                                                                        </tr>
                                                                        </tbody>
                                                                    <?php } ?>
                                                                <tfoot>
                                                                <tr>
                                                                    <td colspan="2" class="left"><a
                                                                            onclick="addEmailFieldValue(<?php echo $email_group_key; ?>);"
                                                                            class="btn btn-success"><?php echo "Добавить поле"; ?></a>
                                                                    </td>
                                                                    <td class="left"><a
                                                                            onclick="$('#suggest_email-group_<?php echo $email_group_key; ?>').remove();"
                                                                            class="btn btn-warning"><?php echo "Удалить группу"; ?></a>
                                                                    </td>
                                                                </tr>
                                                                </tfoot>
                                                            </table>
                                                        </div>
                                                    <?php }
                                                } ?>
                                                <a onclick="addEmailGroup();" id="addEmailGroup" class="btn btn-success">Добавить
                                                    группу</a>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </form>
                    <div class="help"
                         style="text-align: center;clear:both;">Автор модуля: Александр Ефремов.<br/> Skype:<a
                            href="skype:efremovav91">efremovav91</a>, E-mail: <a
                            href="mailto:alex_uralsk14@mail.ru">alex_uralsk14@mail.ru</a><br/>Все права защищены.
                    </div>
                </div>

            </div>
        </div>
        <script type="text/javascript">
            //   $("#tabs a").tabs();
            // $('#tab-fields .vtabs a').tabs();
        </script>
        <script type="text/javascript"><!--
            var fio_group_keys = [];
            <?php if (!empty($fio_groups)) {
            foreach ($fio_groups as $fio_group_key=>$fio_group) {
            $fio_fields_count = 0;
            if (isset($fio_group['data']) && !empty($fio_group['data'])) {
                $fio_fields_count = count($fio_group['data']);
            } ?>
            fio_group_keys[<?php echo $fio_group_key;?>] =<?php echo $fio_fields_count; ?>;
            <?php }
            } ?>
            var address_group_keys = [];
            <?php if (!empty($address_groups)) {
            foreach ($address_groups as $address_group_key=>$address_group) {
            $address_fields_count = 0;
            if (isset($address_group['data']) && !empty($address_group['data'])) {
                $address_fields_count = count($address_group['data']);
            } ?>
            address_group_keys[<?php echo $address_group_key;?>] =<?php echo $address_fields_count; ?>;
            <?php }
            } ?>
            var email_group_keys = [];
            <?php if (!empty($email_groups)) {
            foreach ($email_groups as $email_group_key=>$email_group) {
            $email_fields_count = 0;
            if (isset($email_group['data']) && !empty($email_group['data'])) {
                $email_fields_count = count($email_group['data']);
            } ?>
            email_group_keys[<?php echo $email_group_key;?>] =<?php echo $email_fields_count; ?>;
            <?php }
            } ?>

            var fio_groups_count =<?php echo count($fio_groups); ?>;
            var address_groups_count =<?php echo count($address_groups); ?>;
            var email_groups_count =<?php echo count($email_groups); ?>;

            function addFioGroup() {
                var group_key = 0;
                var new_group_index = fio_group_keys.length;
                if (fio_groups_count > 0) {
                    group_key = fio_groups_count;
                }
                group_key++;

                html = '<div class="well" id="suggest_fio-group_' + new_group_index + '">';
                html += '<div class="heading"><h2 class="dadata-heading"><span>группа ' + group_key + '</span></h2></div><div class="form-group">';
                html += '<label class="col-sm-4 control-label" for="suggest_fio_'+new_group_index+'_'+group_key+'">html-идентификатор группы<br>(id # или class .):</label>';
                html += '<div class="col-sm-8"><input type="text" id="suggest_fio_'+new_group_index+'_'+group_key+'" class="form-control" size="50" name="suggest_fio[' + new_group_index + '][group_id]" value=""></div>';
                html += '</div>';
                html += '<table id="fio-field-values" class="table table-bordered"><thead><tr>';
                html += '<td class="left">Имя поля (атрибут name)</td>';
                html += '<td class="left">Что подсказывать</td>';
                html += '<td class="left">Статус</td>';
                html += '<td></td></tr></thead>';
                html += '<tbody><tr>';
                html += '<td class="left"><span class="help">html-атрибут "name".</span></td>';
                html += '<td class="left"><span class="help">Для выбора нескольких значений используйте ctrl+клик.</span></td>';
                html += '<td class="left"><span class="help">Активность подсказок.</span></td>';
                html += '<td><span class="help">Действия.</span></td>';
                html += '</tr></tbody>';
                html += '<tfoot><tr>';
                html += '<td colspan="3" class="left"><a onclick="addFioFieldValue(' + new_group_index + ');" class="btn btn-success">Добавить поле</a></td>';
                html += '<td class="left"><a onclick=\'$("#suggest_fio-group_' + new_group_index + '").remove();\' class="btn btn-warning">Удалить группу</a></td>';
                html += '</tr></tfoot></table></div>';
                $('#addFioGroup').before(html);
                fio_groups_count++;
                fio_group_keys[new_group_index] = 0;

            }

            function addAddressGroup() {
                var group_key = 0;
                var new_group_index = address_group_keys.length;
                if (address_groups_count > 0) {
                    group_key = address_groups_count;
                }
                group_key++;

                html = '<div class="well" id="suggest_address-group_' + new_group_index + '">';
                html += '<div class="heading"><h2 class="dadata-heading"><span>группа ' + group_key + '</span></h2></div><div class="form-group">';
                html += '<label class="col-sm-4 control-label" for="suggest_address_'+new_group_index+'_'+group_key+'">html-идентификатор группы<br>(id # или class .):</label>';
                html += '<div class="col-sm-8"><input class="form-control" id="suggest_address_'+new_group_index+'_'+group_key+'" type="text" size="50" name="suggest_address[' + new_group_index + '][group_id]" value=""></div>';
                html += '</div>';
                html += '<table id="address-field-values" class="table table-bordered"><thead><tr>';
                html += '<td class="left">Имя поля (атрибут name)</td>';
                html += '<td class="left">Тип поля</td>';
                html += '<td class="left">Что подсказывать</td>';
                html += '<td class="left">Область поиска (атрибут name)</td>';
                html += '<td class="left">Статус</td>';
                html += '<td></td></tr></thead>';
                html += '<tbody><tr>';
                html += '<td class="left"><span class="help">html-атрибут "name".</span></td>';
                html += '<td class="left"><span class="help">input или select</span></td>';
                html += '<td class="left"><span class="help">Для выбора нескольких значений используйте ctrl+клик.</span></td>';
                html += '<td class="left"><span class="help">';
                html += 'должен совпадать с одним из имен полей подсказок.<br>Устанавливает область поиска подсказок.</span></td>';
                html += '<td class="left"><span class="help">Активность подсказок.</span></td>';
                html += '<td><span class="help">Действия.</span></td>';
                html += '</tr></tbody>';
                html += '<tfoot><tr>';
                html += '<td colspan="5" class="left"><a onclick="addAddressFieldValue(' + new_group_index + ');" class="btn btn-success">Добавить поле</a></td>';
                html += '<td class="left"><a onclick=\'$("#suggest_address-group_' + new_group_index + '").remove();\' class="btn btn-warning">Удалить группу</a></td>';
                html += '</tr></tfoot></table></div>';
                $('#addAddressGroup').before(html);
                address_groups_count++;
                address_group_keys[new_group_index] = 0;
            }

            function addEmailGroup() {
                var group_key = 0;
                var new_group_index = email_group_keys.length;
                if (email_groups_count > 0) {
                    group_key = email_groups_count;
                }
                group_key++;

                html = '<div class="well" id="suggest_email-group_' + new_group_index + '">';
                html += '<div class="heading"><h2 class="dadata-heading"><span>группа ' + group_key + '</span></h2></div><div class="form-group">';
                html += '<label class="col-sm-4 control-label" for="suggest_email_'+new_group_index+'_'+group_key+'">html-идентификатор группы<br>(id # или class .):</label>';
                html += '<div class="col-sm-8"><input id="suggest_email_'+new_group_index+'_'+group_key+'" class="form-control" type="text" size="50" name="suggest_email[' + new_group_index + '][group_id]" value=""></div>';
                html += '</div>';
                html += '<table id="email-field-values" class="table table-bordered"><thead><tr>';
                html += '<td class="left">Имя поля (name)</td>';
                html += '<td class="left">Статус</td>';
                html += '<td></td></tr></thead>';
                html += '<tbody><tr>';
                html += '<td class="left"><span class="help">html-атрибут "name", только поля типа input.</span></td>';
                html += '<td class="left"><span class="help">Активность подсказок.</span></td>';
                html += '<td><span class="help">Действия.</span></td>';
                html += '</tr></tbody>';
                html += '<tfoot><tr>';
                html += '<td colspan="2" class="left"><a onclick="addEmailFieldValue(' + new_group_index + ');" class="btn btn-success">Добавить поле</a></td>';
                html += '<td class="left"><a onclick=\'$("#suggest_email-group_' + new_group_index + '").remove();\' class="btn btn-warning">Удалить группу</a></td>';
                html += '</tr></tfoot></table></div>';
                $('#addEmailGroup').before(html);
                email_groups_count++;
                email_group_keys[new_group_index] = 0;
            }

            function addFioFieldValue(current_fio_group_key) {
                html = '<tbody id="fio-field-value-row_' + current_fio_group_key + '_' + fio_group_keys[current_fio_group_key] + '">';
                html += '<tr>';
                html += '<td class="left"><input type="text" class="form-control" name="suggest_fio[' + current_fio_group_key + '][data][' + fio_group_keys[current_fio_group_key] + '][name]" size="40" /></td>';
                html += '<td class="left"><select multiple class="form-control" name="suggest_fio[' + current_fio_group_key + '][data][' + fio_group_keys[current_fio_group_key] + '][parts][]">';
                <?php if (isset($fio_field_parts_data)) { ?>
                <?php foreach ($fio_field_parts_data as $fio_field_part_data) { ?>
                html += '<option value="<?php echo $fio_field_part_data['value']; ?>"><?php echo $fio_field_part_data['name']; ?></option>';
                <?php }
                } ?>
                html += '</select></td>';
                html += '<td class="left"><select class="form-control" name="suggest_fio[' + current_fio_group_key + '][data][' + fio_group_keys[current_fio_group_key] + '][status]">';
                html += '<option value="0"><?php echo $text_disabled; ?></option>';
                html += '<option value="1"><?php echo $text_enabled; ?></option>'
                html += '</select></td>';
                html += '<td class="left"><a onclick="$(\'#fio-field-value-row_' + current_fio_group_key + '_' + fio_group_keys[current_fio_group_key] + '\').remove();" class="btn btn-danger"><?php echo $button_remove; ?></a></td>';
                html += '  </tr>';
                html += '</tbody>';
                fio_group_keys[current_fio_group_key]++;
                $('#suggest_fio-group_' + current_fio_group_key + ' tfoot').before(html);
            }

            function addAddressFieldValue(current_address_group_key) {
                html = '<tbody id="address-field-value-row_' + current_address_group_key + '_' + address_group_keys[current_address_group_key] + '">';
                html += '<tr>';
                html += '<td class="left"><input type="text" class="form-control" name="suggest_address[' + current_address_group_key + '][data][' + address_group_keys[current_address_group_key] + '][name]" size="40" /></td>';
                html += '<td><select class="form-control" name="suggest_address[' + current_address_group_key + '][data][' + address_group_keys[current_address_group_key] + '][type]">';
                <?php foreach ($fieldTypes as $addFieldType) { ?>

                html += '<option value="<?php echo $addFieldType['value']; ?>"><?php echo $addFieldType['name']; ?></option>';
                <?php }
                ?>
                html += '</select></td>';
                html += '<td><select multiple class="form-control" name="suggest_address[' + current_address_group_key + '][data][' + address_group_keys[current_address_group_key] + '][parts_suggest][]" size="7">';
                <?php if (isset($address_field_parts_data)) { ?>
                <?php foreach ($address_field_parts_data as $address_field_part_data) { ?>
                html += '<option value="<?php echo $address_field_part_data['value']; ?>"><?php echo $address_field_part_data['name']; ?></option>';
                <?php }
                } ?>
                html += '</select></td>';
                html += '<td class="left"><input type="text" class="form-control" name="suggest_address[' + current_address_group_key + '][data][' + address_group_keys[current_address_group_key] + '][constraint]" size="40" /></td>';
                html += '<td class="left"><select class="form-control" name="suggest_address[' + current_address_group_key + '][data][' + address_group_keys[current_address_group_key] + '][status]">';
                html += '<option value="0"><?php echo $text_disabled; ?></option>';
                html += '<option value="1"><?php echo $text_enabled; ?></option>'
                html += '</select></td>';
                html += '<td class="left"><a onclick="$(\'#address-field-value-row_' + current_address_group_key + '_' + address_group_keys[current_address_group_key] + '\').remove();" class="btn btn-danger"><?php echo $button_remove; ?></a></td>';
                html += '  </tr>';
                html += '</tbody>';
                address_group_keys[current_address_group_key]++;
                $('#suggest_address-group_' + current_address_group_key + ' tfoot').before(html);
            }

            function addEmailFieldValue(current_email_group_key) {
                html = '<tbody id="email-field-value-row_' + current_email_group_key + '_' + email_group_keys[current_email_group_key] + '">';
                html += '<tr>';
                html += '<td class="left"><input type="text" class="form-control" name="suggest_email[' + current_email_group_key + '][data][' + email_group_keys[current_email_group_key] + '][name]" size="40" /></td>';
                html += '<td class="left"><select class="form-control" name="suggest_email[' + current_email_group_key + '][data][' + email_group_keys[current_email_group_key] + '][status]">';
                html += '<option value="0"><?php echo $text_disabled; ?></option>';
                html += '<option value="1"><?php echo $text_enabled; ?></option>'
                html += '</select></td>';
                html += '<td class="left"><a onclick="$(\'#email-field-value-row_' + current_email_group_key + '_' + email_group_keys[current_email_group_key] + '\').remove();" class="btn btn-danger"><?php echo $button_remove; ?></a></td>';
                html += '  </tr>';
                html += '</tbody>';
                email_group_keys[current_email_group_key]++;
                $('#suggest_email-group_' + current_email_group_key + ' tfoot').before(html);
            }
            //--></script>
    </div>
<?php echo $footer; ?>