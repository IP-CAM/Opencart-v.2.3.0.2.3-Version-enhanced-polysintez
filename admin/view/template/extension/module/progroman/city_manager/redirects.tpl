<div class="for-general-form row">
    <div class="col-lg-3 col-md-4 col-sm-4">
        <div class="form-group">
            <label class="control-label">
                <input name="progroman_cm_setting[enable_switch_redirects]" value="1" type="checkbox"
                <?= !empty($settings['enable_switch_redirects']) ? ' checked="checked"' : ''; ?>">
                <?= $entry_sub_enabled; ?>
            </label>
        </div>
        <div class="form-group">
            <label class="control-label">
                <input name="progroman_cm_setting[disable_autoredirect]" value="1" type="checkbox"
                    <?= !empty($settings['disable_autoredirect']) ? ' checked="checked"' : ''; ?>">
                <?php echo $entry_disable_autoredirect; ?>
            </label>
        </div>
        <div class="form-group">
            <label class="control-label"><?php echo $entry_domain; ?></label>
            <input type="text" name="progroman_cm_setting[main_domain]" class="form-control"
                   value="<?php echo !empty($settings['main_domain']) ? $settings['main_domain'] : '' ?>"/>
        </div>
    </div>
</div>
<form action="<?php echo $action_redirects; ?>">
<table id="redirects" class="table table-striped table-bordered">
    <thead>
    <tr>
        <td>
            <div class="row">
                <div class="col-lg-2 col-md-3 col-sm-4 col-xs-5">
                    <?php echo $entry_zone; ?>
                </div>
                <div class="col-lg-2 col-md-3 col-sm-4 col-xs-5">
                    <?php echo $entry_subdomain; ?>
                </div>
            </div>
        </td>
    </tr>
    </thead>
    <tbody>
    <?php $redirect_row = 0; ?>
    <?php foreach ($redirects as $redirect) { ?>
        <tr id="redirect-row<?php echo $redirect_row; ?>">
            <td>
                <div class="row">
                    <div class="col-lg-2 col-md-3 col-sm-4 col-xs-5">
                        <input type="text" name="" value="<?php echo $redirect['fias_name']; ?>" class="row-fias-name form-control"/>
                        <input type="hidden" name="redirects[<?php echo $redirect_row; ?>][fias_id]"
                               value="<?php echo $redirect['fias_id']; ?>" class="row-fias-id"/>
                        <input type="hidden" name="redirects[<?php echo $redirect_row; ?>][id]"
                               value="<?php echo $redirect['id']; ?>"/>
                    </div>
                    <div class="col-lg-2 col-md-3 col-sm-4 col-xs-5">
                        <input type="text" name="redirects[<?php echo $redirect_row; ?>][url]" class="form-control"
                               value="<?php echo $redirect['url']; ?>" placeholder="http://site.com"/>
                    </div>
                    <div class="col-sm-2 col-xs-1">
                        <a class="btn btn-danger" onclick="$('#redirect-row<?php echo $redirect_row; ?>').remove();">
                            <i class="fa fa-remove visible-xs"></i>
                            <span class="hidden-xs"><?php echo $button_remove; ?></span>
                        </a>
                    </div>
                </div>
            </td>
        </tr>
        <?php $redirect_row++; ?>
    <?php } ?>
    </tbody>
    <tfoot>
    <tr>
        <th>
            <a class="btn btn-success" onclick="addRedirect();">
                <?php echo $button_add; ?>
            </a>
        </th>
    </tr>
    </tfoot>
</table>
</form>
<script type="text/javascript">
    var redirect_row = <?php echo $redirect_row; ?>;

    function addRedirect() {
        var html = '<tr id="redirect-row' + redirect_row + '"><td><div class="row">';
        html += '<div class="col-lg-2 col-md-3 col-sm-4 col-xs-5">';
        html += '<input type="text" name="" class="row-fias-name form-control"/>';
        html += '<input type="hidden" name="redirects[' + redirect_row + '][fias_id]" class="row-fias-id"/>';
        html += '<input type="hidden" name="redirects[' + redirect_row + '][id]" value=""/>';
        html += '</div><div class="col-lg-2 col-md-3 col-sm-4 col-xs-5">';
        html += '<input type="text" name="redirects[' + redirect_row + '][url]" value="" class="form-control" placeholder="http://site.com"/>';
        html += '</div><div class="col-sm-2 col-xs-1">';
        html += '<a class="btn btn-danger" onclick="$(\'#redirect-row' + redirect_row + '\').remove();">';
        html += '<i class="fa fa-remove visible-xs"></i><span class="hidden-xs"><?php echo $button_remove; ?></span></a>';
        html += '</div></div></td></tr>';

        $('#redirects').find('tbody').append(html);

        redirect_row++;
    }
</script>