<?php if (!$valid_license_plus) { ?>
<div class="alert alert-info">
    <?= $text_customer_groups_info; ?>
    <button type="button" class="close" data-dismiss="alert">&times;</button>
</div>
<?php } ?>
<div class="for-general-form row">
    <div class="col-lg-3 col-md-4 col-sm-4">
        <div class="form-group">
            <label class="control-label">
                <input name="progroman_cm_setting[enable_switch_customer_group]" value="1" type="checkbox"
                <?= !empty($settings['enable_switch_customer_group']) ? ' checked="checked"' : ''; ?>">
                <?= $entry_sub_enabled; ?>
            </label>
        </div>
    </div>
</div>
<form action="<?= $action_customer_group; ?>">
    <table id="customer_groups" class="table table-striped table-bordered">
        <thead>
        <tr>
            <td>
                <div class="row">
                    <div class="col-lg-3 col-md-3 col-sm-4 col-xs-6">
                        <?= $entry_zone; ?>
                    </div>
                    <div class="col-lg-2 col-md-3 col-sm-4 col-xs-5">
                        <?= $entry_customer_group; ?>
                    </div>
                </div>
            </td>
        </tr>
        </thead>
        <tbody>
        <?php $customer_group_row = 0; ?>
        <?php foreach ($cm_customer_groups as $cm_group) { ?>
            <tr id="customer-group-row<?= $customer_group_row; ?>">
                <td>
                    <div class="row">
                        <div class="col-lg-3 col-md-3 col-sm-4 col-xs-6">
                            <input type="text" name="" value="<?= $cm_group['fias_name']; ?>" class="row-fias-name form-control"/>
                            <input type="hidden" name="customer_groups[<?= $customer_group_row; ?>][fias_id]" value="<?= $cm_group['fias_id']; ?>" class="row-fias-id"/>
                        </div>
                        <div class="col-lg-2 col-md-3 col-sm-4 col-xs-5">
                            <select name="customer_groups[<?= $customer_group_row ?>][customer_group_id]"
                                    class="form-control">
                                <option value="0"><?= $text_none; ?></option>
                                <?php foreach ($customer_groups as $customer_group) { ?>
                                    <option value="<?= $customer_group['customer_group_id']; ?>"
                                        <?= $customer_group['customer_group_id'] == $cm_group['customer_group_id'] ? 'selected' : ''; ?>>
                                        <?= $customer_group['name']; ?>
                                    </option>
                                <?php } ?>
                            </select>
                        </div>
                        <div class="col-md-1">
                            <a onclick="$('#customer-group-row<?= $customer_group_row; ?>').remove();" class="btn btn-danger">
                                <i class="fa fa-remove visible-xs"></i>
                                <span class="hidden-xs"><?= $button_remove; ?></span>
                            </a>
                        </div>
                    </div>
                </td>
            </tr>
            <?php $customer_group_row++; ?>
        <?php } ?>
        </tbody>
        <tfoot>
        <tr>
            <th>
                <a class="btn btn-success" onclick="addCustomerGroup();">
                    <?= $button_add; ?>
                </a>
                <a class="btn btn-info" href="<?= $url_add_customer_group; ?>" target="_blank">
                    <?= $button_customer_group; ?>
                </a>
            </th>
        </tr>
        </tfoot>
    </table>
</form>
<select id="select-customer-group" class="hidden">
    <option value="0"><?= $text_none; ?></option>
    <?php foreach ($customer_groups as $customer_group) { ?>
        <option value="<?= $customer_group['customer_group_id']; ?>"><?= $customer_group['name']; ?></option>
    <?php } ?>
</select>
<script type="text/javascript">
    var customer_group_row = <?= $customer_group_row; ?>;

    function addCustomerGroup() {
        var html = '<tr id="customer-group-row' + customer_group_row + '"><td><div class="row"><div class="col-lg-3 col-md-3 col-sm-4 col-xs-6">';
        html += '<input type="text" name="" class="row-fias-name form-control"/>';
        html += '<input type="hidden" name="customer_groups[' + customer_group_row + '][fias_id]" class="row-fias-id"/>';
        html += '</div><div class="col-lg-2 col-md-3 col-sm-4 col-xs-5">';
        html += '<select name="customer_groups[' + customer_group_row + '][customer_group_id]" class="form-control">';
        html += $('#select-customer-group').html();
        html += '</select>';
        html += '</div><div class="col-md-1">';
        html += '<a onclick="$(\'#customer-group-row' + customer_group_row + '\').remove();" class="btn btn-danger">';
        html += '<i class="fa fa-remove visible-xs"></i><span class="hidden-xs"><?= $button_remove; ?></span></a>';
        html += '</div></div></td></tr>';

        $('#customer_groups').find('tbody').append(html);
        customer_group_row++;
    }
</script>
