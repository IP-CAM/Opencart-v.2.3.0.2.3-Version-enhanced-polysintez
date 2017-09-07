<div class="alert alert-info">
    <?= $text_regions_info; ?>
    <button type="button" class="close" data-dismiss="alert">&times;</button>
</div>
<form action="<?= $action_regions; ?>">
<table id="country-fias" class="table table-striped table-bordered">
    <tbody>
    <?php $country_fias_row = 0; ?>
    <?php foreach ($country_fias as $cf) { ?>
        <tbody id="country-fias-row<?= $country_fias_row; ?>">
        <tr>
            <td>
                <div class="row">
                    <div class="col-lg-1 col-md-2 col-xs-3">
                        <?= $cf['fias_name']; ?>
                        <input type="hidden" name="country_fias[<?= $country_fias_row; ?>][fias_id]"
                               value="<?= $cf['fias_id']; ?>" class="row-fias-id"/>
                    </div>
                    <div class="col-md-4 col-xs-6 form-inline">
                        <select class="country-fias-country-id form-control"
                                name="country_fias[<?= $country_fias_row; ?>][country_id]">
                            <option value="0"><?= $text_none; ?></option>
                            <?php foreach ($countries as $country) { ?>
                                <option value="<?= $country['country_id']; ?>"<?= $country['country_id'] == $cf['country_id'] ? ' selected' : ''; ?>>
                                    <?= $country['name']; ?>
                                </option>
                            <?php } ?>
                        </select>
                    </div>
                </div>
            </td>
        </tr>
        </tbody>
        <?php $country_fias_row++; ?>
    <?php } ?>
</table>
<table id="zone-fias" class="table table-striped table-bordered">
    <tbody>
    <?php $zone_fias_row = 0; ?>
    <?php foreach ($zone_fias as $zf) { ?>
        <tbody id="zone-fias-row<?= $zone_fias_row; ?>">
        <tr>
            <td>
                <div class="row">
                    <div class="col-md-2 col-sm-3 col-xs-3">
                        <?= $zf['fias_name']; ?>
                        <input type="hidden" name="zone_fias[<?= $zone_fias_row; ?>][fias_id]"
                               value="<?= $zf['fias_id']; ?>" class="row-fias-id"/>
                    </div>
                    <div class="col-lg-6 col-md-8 col-sm-9 col-xs-8 form-inline">
                        <select class="zone-fias-country-id form-control">
                            <option value="0"><?= $text_none; ?></option>
                            <?php foreach ($countries as $country) { ?>
                                <option value="<?= $country['country_id']; ?>"<?= $country['country_id'] == $zf['country_id'] ? ' selected' : ''; ?>>
                                    <?= $country['name']; ?>
                                </option>
                            <?php } ?>
                        </select>
                        <select name="zone_fias[<?= $zone_fias_row; ?>][zone_id]"
                                class="zone-fias-zone-id form-control" data-zone_id="<?= $zf['zone_id']; ?>">
                            <option value="0"><?= $text_none; ?></option>
                            <?php if (!empty($country_zones[$zf['country_id']])) { ?>
                                <?php foreach ($country_zones[$zf['country_id']] as $zone) { ?>
                                    <option value="<?= $zone['zone_id'] ?>"<?= $zone['zone_id'] == $zf['zone_id'] ? ' selected' : ''; ?>>
                                        <?= $zone['name'] ?>
                                    </option>
                                <?php } ?>
                            <?php } ?>
                        </select>
                    </div>
                </div>
            </td>
        </tr>
        </tbody>
        <?php $zone_fias_row++; ?>
    <?php } ?>
</table>
</form>
<script type="text/javascript"><!--
    $(function() {
        $('#zone-fias').on('change', '.zone-fias-country-id', function() {
            var zone = $(this).siblings('.zone-fias-zone-id'), zone_id = zone.data('zone_id');
            $.get(
                '<?= $url_module; ?>/country&country_id=' + $(this).val() + '&token=<?= $token; ?>',
                function(json) {
                    var html = '<option value="0"><?= $text_none; ?></option>', i, z;
                    if (json['zones']) {
                        for (i = 0; i < json['zones'].length; i++) {
                            z = json['zones'][i];
                            html += '<option value="' + z.zone_id + '"';

                            if (z.zone_id == zone_id) {
                                html += ' selected="selected"';
                            }

                            html += '>' + z.name + '</option>';
                        }
                    }

                    zone.html(html);
                },
                'json'
            )
        });
    });
//--></script>