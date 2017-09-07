<?= $header; ?><?= $column_left; ?>
    <div id="content">
        <div class="page-header">
            <div class="container-fluid">
                <div class="pull-right">
                    <button type="submit" data-toggle="tooltip" title="<?= $button_save; ?>" class="btn btn-primary submit-forms">
                        <i class="fa fa-save"></i></button>
                    <a href="<?= $cancel; ?>" data-toggle="tooltip" title="<?= $button_cancel; ?>" class="btn btn-default">
                        <i class="fa fa-reply"></i></a>
                </div>
                <h1><?= $heading_title; ?></h1>
                <ul class="breadcrumb">
                    <?php foreach ($breadcrumbs as $breadcrumb) { ?>
                        <li>
                            <a href="<?= $breadcrumb['href']; ?>"><?= $breadcrumb['text']; ?></a>
                        </li>
                    <?php } ?>
                </ul>
            </div>
        </div>
        <div class="container-fluid">
            <div id="warning" class="alert alert-danger hidden"><i class="fa fa-exclamation-circle"></i>
                <span></span>
                <button type="button" class="close" data-dismiss="alert">&times;</button>
            </div>
            <div id="success" class="alert alert-success hidden"><i class="fa fa-exclamation-circle"></i>
                <span></span>
                <button type="button" class="close" data-dismiss="alert">&times;</button>
            </div>
            <div class="alert alert-danger<?= $valid_license ? ' hidden' : '' ?>" id="alert-license">
                <i class="fa fa-exclamation-circle"></i> <?= $error_license; ?>
                <button type="button" class="close" data-dismiss="alert">&times;</button>
            </div>

            <ul id="tabs" class="nav nav-tabs">
                <li class="active"><a href="#tab-general" data-toggle="tab"><?= $tab_general; ?></a></li>
                <li><a href="#tab-popups" data-toggle="tab"><?= $tab_popup; ?></a></li>
                <li><a href="#tab-messages" data-toggle="tab"><?= $tab_messages; ?></a></li>
                <li><a href="#tab-redirects" data-toggle="tab"><?= $tab_redirects; ?></a></li>
                <li><a href="#tab-currencies" data-toggle="tab"><?= $tab_currencies; ?></a></li>
                <li><a id="tab-regions-btn" href="#tab-regions" data-toggle="tab"><?= $tab_regions; ?></a></li>
                <li><a href="#tab-customer-group" data-toggle="tab"><?= $tab_groups; ?></a></li>
            </ul>
            <div class="tab-content">
                <div class="tab-pane active" id="tab-general">
                    <?php include($module_dir . 'city_manager/general.tpl'); ?>
                </div>
                <div class="tab-pane" id="tab-popups">
                    <?php include($module_dir . 'city_manager/popup.tpl'); ?>
                </div>
                <div class="tab-pane" id="tab-messages">
                    <?php include($module_dir . 'city_manager/messages.tpl'); ?>
                </div>
                <div class="tab-pane" id="tab-redirects">
                    <?php include($module_dir . 'city_manager/redirects.tpl'); ?>
                </div>
                <div class="tab-pane" id="tab-currencies">
                    <?php include($module_dir . 'city_manager/currencies.tpl'); ?>
                </div>
                <div class="tab-pane" id="tab-regions">
                    <?php include($module_dir . 'city_manager/zone_fias.tpl'); ?>
                </div>
                <div class="tab-pane" id="tab-customer-group">
                    <?php include($module_dir . 'city_manager/customer_group.tpl'); ?>
                </div>
            </div>
        </div>
    </div>
<script type="text/javascript"><!--
    function savePopups() {
        var form = $('#tab-popups').find('form');
        form.find('.text-danger').remove();
        $.post(form.attr('action'), form.serialize(),
            function(json) {
                if (json.errors) {
                    for (i in json.errors.cities) {
                        $('#city-row' + i).find('input[name="popup_cities\[' + i + '\]\[name\]"]')
                            .after('<p class="text-danger">' + json.errors.cities[i] + '</p>');
                    }
                    $('#tabs').find('a[href="#tab-popups"]').tab('show');
                    return;
                }

                saveMessages();
            }, 'json');
    }

    function saveMessages() {
        var form = $('#tab-messages').find('form');
        form.find('.text-danger').remove();
        $.post(form.attr('action'), form.serialize(),
            function(json) {
                if (json.errors) {
                    for (i in json.errors.key) {
                        $('#message-row' + i).find('input[name="messages\[' + i + '\]\[key\]"]')
                            .after('<p class="text-danger">' + json.errors.key[i] + '</p>');
                    }
                    for (i in json.errors.fias) {
                        $('#message-row' + i).find('.row-fias-name').after('<p class="text-danger">' + json.errors.fias[i] + '</p>');
                    }
                    $('#tabs').find('a[href="#tab-messages"]').tab('show');
                    return;
                }

                saveRedirects();
            }, 'json');
    }

    function saveRedirects() {
        var form = $('#tab-redirects').find('form');
        form.find('.text-danger').remove();
        $.post(form.attr('action'), form.serialize(),
            function(json) {
                if (json.errors) {
                    for (i in json.errors.fias) {
                        $('#redirect-row' + i).find('.row-fias-name').after('<p class="text-danger">' + json.errors.fias[i] + '</p>');
                    }
                    for (i in json.errors.subdomain) {
                        $('#redirect-row' + i).find('input[name="redirects\[' + i + '\]\[url\]"]')
                            .after('<p class="text-danger">' + json.errors.subdomain[i] + '</p>');
                    }
                    $('#tabs').find('a[href="#tab-redirects"]').tab('show');
                    return;
                }

                saveCurrencies();
            }, 'json');
    }

    function saveCurrencies() {
        var form = $('#tab-currencies').find('form');
        form.find('.text-danger').remove();
        $.post(form.attr('action'), form.serialize(),
            function(json) {
                if (json.errors) {
                    for (i in json.errors.country) {
                        $('#currency-row' + i).find('select[name="currencies\[' + i + '\]\[country_id\]"]')
                            .after('<p class="text-danger">' + json.errors.country[i] + '</p>');
                    }
                    for (i in json.errors.code) {
                        $('#currency-row' + i).find('select[name="currencies\[' + i + '\]\[code\]"]')
                            .after('<p class="text-danger">' + json.errors.code[i] + '</p>');
                    }
                    $('#tabs').find('a[href="#tab-currencies"]').tab('show');
                    return;
                }

                saveRegions();
            }, 'json');
    }

    function saveRegions() {
        var form = $('#tab-regions').find('form');
        form.find('.text-danger').remove();
        $.post(form.attr('action'), form.serialize(),
            function(json) {
                if (json.errors) {
                    for (i in json.errors.country) {
                        $('#zone-fias-row' + i).find('.country-fias-country-id').after('<p class="text-danger">' + json.errors.country[i] + '</p>');
                    }
                    $('#tabs').find('a[href="#tab-regions"]').tab('show');
                    return;
                }

                saveCustomerGroups();
            }, 'json');
    }

    function saveCustomerGroups() {
        var form = $('#tab-customer-group').find('form');
        form.find('.text-danger').remove();
        $.post(form.attr('action'), form.serialize(),
            function(json) {
                if (json.errors) {
                    for (i in json.errors.fias) {
                        $('#customer-group-row' + i).find('.row-fias-name').after('<p class="text-danger">' + json.errors.fias[i] + '</p>');
                    }
                    for (i in json.errors.customer_group) {
                        $('#customer-group-row' + i).find('select[name="customer_groups\[' + i + '\]\[customer_group_id\]"]')
                            .after('<p class="text-danger">' + json.errors.customer_group[i] + '</p>');
                    }
                    $('#tabs').find('a[href="#tab-customer-group"]').tab('show');
                    return;
                }

                $('#success').removeClass('hidden').find('span').text(json.success);
            }, 'json');
    }

    $(function() {
        $('.submit-forms').click(function() {
            if (!validate()) {
                return false;
            }
            $('#warning, #success').addClass('hidden').find('span').text('');
            var form = $('#tab-general').find('form');
            $.post(form.attr('action'), form.serialize() + '&' + $('.for-general-form :input').serialize(),
                function(json) {
                    if (json.warning) {
                        $('#warning').removeClass('hidden').find('span').text(json.warning);
                        $('#tabs').find('a[href="#tab-general"]').tab('show');
                        return;
                    }

                    if (json.license) {
                        $('#alert-license').addClass('hidden');
                    } else {
                        $('#alert-license').removeClass('hidden');
                    }

                    savePopups();
                }, 'json');
        });

        $('form').submit(function(e) {
            e.preventDefault();
        });
    });

    var xhr;

    $('#messages, #redirects, #cities, #customer_groups').on('focus', '.row-fias-name', function() {
        if (!$(this).data('autocomplete')) {
            addAutocomplete($(this));
        }
    });

    $('.row-fias-name').each(function() {
        addAutocomplete($(this));
    });

    function addAutocomplete(el) {
        el.autocomplete({
            'source': function(request, response) {
                if (xhr) {
                    xhr.abort();
                }

                request = $.trim(request);
                if (request && request.length > 2) {
                    xhr = $.get(
                        '<?= $url_module; ?>/search&term=' + encodeURIComponent(request) + '&token=<?= $token; ?>',
                        function(json) { response(json); },
                        'json'
                    );
                } else {
                    response([]);
                }
            },
            'select': function(item) {
                el.val(item.value);
                el.siblings('.row-fias-id').val(item.fias_id);
            }
        });
        el.data('autocomplete', true);
    }

    function validate() {
        var c = {}, z = {}, bad = false, error = '<?= $error_unique_regions; ?>';
        $('#country-fias').find('.country-fias-country-id').each(function(i, el) {
            var val = $(this).val();
            if (val > 0) {
                if (c[val] != undefined) {
                    bad = true;
                    error += ' "' + $.trim($(this).parents('.row:first').find('div:first').text()) + '"';
                    return false;
                }
                c[val] = 1;
            }
        });
        if (!bad) {
            $('#zone-fias').find('.zone-fias-zone-id').each(function(i, el) {
                var val = $(this).val();
                if (val > 0) {
                    if (z[val] != undefined) {
                        bad = true;
                        error += ' "' + $.trim($(this).parents('.row:first').find('div:first').text()) + '"';
                        return false;
                    }
                    z[val] = 1;
                }
            });
        }

        if (bad) {
            $('#warning').removeClass('hidden').find('span').text(error);
            $('#tabs').find('a[href="#tab-regions"]').tab('show');
        }

        return !bad;
    }
//--></script>
<?= $footer; ?>
