<div class="for-general-form row">
    <div class="col-lg-3 col-md-4 col-sm-4">
        <div class="form-group">
            <label class="control-label">
                <input name="progroman_cm_setting[enable_switch_messages]" value="1" type="checkbox"
                <?= !empty($settings['enable_switch_messages']) ? ' checked="checked"' : ''; ?>">
                <?= $entry_sub_enabled; ?>
            </label>
        </div>
    </div>
</div>
<form action="<?= $action_messages; ?>">
<table id="messages" class="table table-striped table-bordered">
    <thead>
    <tr>
        <th>
            <div class="row">
                <div class="col-lg-2 col-md-3 col-sm-3 col-xs-3">
                    <?= $entry_key; ?>
                </div>
                <div class="col-lg-2 col-md-3 col-sm-3 col-xs-3">
                    <?= $entry_zone; ?>
                </div>
                <div class="col-md-4 col-sm-4 col-xs-4">
                    <?= $entry_value; ?>
                </div>
            </div>
        </th>
    </tr>
    </thead>
    <tbody>
    <?php $message_row = 0; ?>
    <?php foreach ($messages as $message) { ?>
        <tr id="message-row<?= $message_row; ?>">
            <td>
                <div class="row">
                    <div class="col-lg-2 col-sm-3 col-xs-3">
                        <input type="text" class="form-control" name="messages[<?= $message_row; ?>][key]" value="<?= $message['key']; ?>"/>
                    </div>
                    <div class="col-lg-2 col-sm-3 col-xs-3">
                        <input type="text" name="" value="<?= $message['fias_name']; ?>" class="row-fias-name form-control"/>
                        <input type="hidden" name="messages[<?= $message_row; ?>][fias_id]" value="<?= $message['fias_id']; ?>" class="row-fias-id"/>
                        <input type="hidden" name="messages[<?= $message_row; ?>][id]" value="<?= $message['id']; ?>"/>
                    </div>
                    <div class="col-md-4 col-sm-4 col-xs-4">
                        <textarea class="form-control" name="messages[<?= $message_row; ?>][value]"><?= $message['value']; ?></textarea>
                    </div>
                    <div class="col-md-2 col-xs-1">
                        <a class="btn btn-danger" onclick="$('#message-row<?= $message_row; ?>').remove();">
                            <i class="fa fa-remove visible-xs"></i>
                            <span class="hidden-xs"><?= $button_remove; ?></span>
                        </a>
                    </div>
                </div>
            </td>
        </tr>
        <?php $message_row++; ?>
    <?php } ?>
    </tbody>
    <tfoot>
    <tr>
        <th>
            <a class="btn btn-success" onclick="addMessage();"> <?= $button_add; ?></a>
        </th>
    </tr>
    </tfoot>
</table>
</form>
<script type="text/javascript">
    var message_row = <?= $message_row; ?>;

    function addMessage() {
        var html = '<tr id="message-row' + message_row + '"><td><div class="row"><div class="col-lg-2 col-sm-3 col-xs-3">';
        html += '<input type="text" name="messages[' + message_row + '][key]" class="form-control"/>';
        html += '</div><div class="col-lg-2 col-sm-3 col-xs-3">';
        html += '<input type="text" name="" class="row-fias-name form-control"/>';
        html += '<input type="hidden" name="messages[' + message_row + '][fias_id]" class="row-fias-id"/>';
        html += '<input type="hidden" name="messages[' + message_row + '][id]" value=""/>';
        html += '</div><div class="col-md-4 col-sm-4 col-xs-4">';
        html += '<textarea class="form-control" name="messages[' + message_row + '][value]"></textarea>';
        html += '</div><div class="col-md-2 col-xs-1">';
        html += '<a class="btn btn-danger" onclick="$(\'#message-row' + message_row + '\').remove();">';
        html += '<i class="fa fa-remove visible-xs"></i><span class="hidden-xs"><?= $button_remove; ?></span></a>';
        html += '</div></div></td></tr>';

        $('#messages').find('tbody').append(html);

        message_row++;
    }
</script>