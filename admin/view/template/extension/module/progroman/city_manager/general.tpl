<form action="<?= $action_general; ?>" class="row">
    <div class="col-md-4 col-sm-6">
        <div class="form-group">
            <label><?php echo $entry_status; ?></label>
            <select name="progroman_cm_status" class="form-control">
                <option value="1"<?= $status ? ' selected="selected"' : '' ?>><?php echo $text_enabled; ?></option>
                <option value="0"<?= !$status ? ' selected="selected"' : '' ?>><?php echo $text_disabled; ?></option>
            </select>
        </div>

        <div class="form-group">
            <label><?= $entry_default_city; ?></label>
            <input type="text" class="form-control row-fias-name"
                   value="<?= !empty($settings['default_city_name']) ? $settings['default_city_name'] : '' ?>"/>
            <input type="hidden" name="progroman_cm_setting[default_city]" class="row-fias-id"
                   value="<?= !empty($settings['default_city']) ? $settings['default_city'] : '' ?>"/>
        </div>
        <div class="form-group">
            <label class="control-label">
                <input name="progroman_cm_setting[use_geoip]" value="1" type="checkbox"
                    <?= !empty($settings['use_geoip']) ? ' checked="checked"' : ''; ?>>
                <?= $entry_use_geoip; ?>
            </label>
        </div>
        <div class="form-group">
            <label class="control-label"><?= $entry_license; ?></label>
            <input type="text" name="progroman_cm_setting[geoip_license]" class="form-control"
               value="<?= !empty($settings['geoip_license']) ? $settings['geoip_license'] : '' ?>"/>
            <?php if ($valid_license_plus) { ?>
                <small><?= $text_available_geoip_plus ?></small>
            <?php } ?>
        </div>
    </div>
</form>