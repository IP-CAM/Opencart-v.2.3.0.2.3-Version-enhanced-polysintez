<div class="row">
    <div class="for-general-form col-lg-3 col-md-4 col-sm-5 clearfix">
        <div class="form-group">
            <label class="control-label"><?= $entry_popup_cookie_time; ?></label>
            <input type="text" name="progroman_cm_setting[popup_cookie_time]" class="form-control"
               value="<?= !empty($settings['popup_cookie_time']) ? $settings['popup_cookie_time'] : '' ?>"/>
        </div>
    </div>
</div>

<h3><?= $text_popup_cities; ?></h3>
<form action="<?= $action_popups; ?>">
<table id="cities" class="table table-striped table-bordered">
    <thead>
        <tr>
            <td>
                <div class="row">
                    <div class="col-md-2">
                        <?= $entry_city; ?>
                    </div>
                    <div class="col-md-1">
                        <?= $entry_sort; ?>
                    </div>
                </div>
            </td>
        </tr>
    </thead>
    <tbody>
    <?php $city_row = 0; ?>
    <?php foreach ($cities as $city) { ?>
        <tr id="city-row<?= $city_row; ?>">
            <td>
                <div class="row">
                    <div class="col-lg-3 col-md-3 col-sm-4 col-xs-6">
                        <input type="text" name="popup_cities[<?= $city_row; ?>][name]" value="<?= $city['name']; ?>" class="row-fias-name form-control"/>
                        <input type="hidden" name="popup_cities[<?= $city_row; ?>][fias_id]" value="<?= $city['fias_id']; ?>" class="row-fias-id"/>
                        <input type="hidden" name="popup_cities[<?= $city_row; ?>][id]" value="<?= $city['id']; ?>"/>
                    </div>
                    <div class="col-md-1 col-xs-3">
                        <input type="text" name="popup_cities[<?= $city_row; ?>][sort]" value="<?= $city['sort']; ?>" class="form-control"/>
                    </div>
                    <div class="col-xs-2">
                        <a class="btn btn-danger" onclick="$('#city-row<?= $city_row; ?>').remove();">
                            <i class="fa fa-remove visible-xs"></i>
                            <span class="hidden-xs"><?= $button_remove; ?></span>
                        </a>
                    </div>
                </div>
            </td>
        </tr>
        <?php $city_row++; ?>
    <?php } ?>
    </tbody>
    <tfoot>
    <tr>
        <th>
            <a class="btn btn-success" onclick="addCity();">
                <?= $button_add; ?>
            </a>
        </th>
    </tr>
    </tfoot>
</table>
</form>
<script type="text/javascript">
    var city_row = <?= $city_row; ?>;

    function addCity() {
        var html = '<tr id="city-row' + city_row + '"><td><div class="row">';
        html += '<div class="col-lg-3 col-md-3 col-sm-4 col-xs-6">';
        html += '<input type="text" name="popup_cities[' + city_row + '][name]" class="row-fias-name form-control"/>';
        html += '<input type="hidden" name="popup_cities[' + city_row + '][fias_id]" class="row-fias-id"/>';
        html += '<input type="hidden" name="popup_cities[' + city_row + '][id]" value=""/></div>';
        html += '<div class="col-md-1 col-xs-3"><input type="text" name="popup_cities[' + city_row + '][sort]" value="" class="form-control"/></div>';
        html += '<div class="col-xs-2"><a class="btn btn-danger" onclick="$(\'#city-row' + city_row + '\').remove();">';
        html += '<i class="fa fa-remove visible-xs"></i><span class="hidden-xs"><?= $button_remove; ?></span></a>';
        html += '</div>';
        html += '</div></td></tr>';

        $('#cities').find('tbody').append(html);

        city_row++;
    }
</script>