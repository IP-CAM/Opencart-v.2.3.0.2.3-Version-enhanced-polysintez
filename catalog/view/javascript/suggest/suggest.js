var flag_geo = [];
var is_fixData=0;
(function ($) {
    "use strict";

    /**Подсказки ФИО**/
    var FullNameSuggestions = {
        init: function ($options) {
            var self = this;
            $.each($options.fields, function (index, $field) {
                var $el = $($field.group_id + " input[name*='" + $field.name + "']:visible");

                $el.suggestions({
                    serviceUrl: "index.php?route=extension/module/suggest/request&r=",
                    type: "NAME",
                    deferRequestBy: 200,
                    hint: "",
                    count: $options.tips,
                    params: {
                        // каждому полю --- соответствующая подсказка
                        parts: $field.parts
                    },
                    onSearchStart: function (params) {
                        // если пол известен на основании других полей,
                        // используем его
                        // params.gender = self.isGenderKnown() ? self.gender : "UNKNOWN";
                    },
                    onSelect: function (suggestion) {
                        // определяем пол по выбранной подсказке
                        self.gender = suggestion.data.gender;
                        $.each($options.fields, function (index, $fieldd) {
                           formatFioValues(suggestion, $fieldd);
                        });
                    }
                });
            });
        },
        isGenderKnown: function () {
            return this.gender != undefined;
        }
    };

    /**Подсказки e-mail адреса**/
    var EmailSuggestions = {
        init: function ($options) {
            $.each($options.fields, function (index, $field) {
                var $el = $($field.group_id + " input[name*='" + $field.name + "']:visible");
                $el.suggestions({
                    serviceUrl: "index.php?route=extension/module/suggest/request&r=",
                    type: "EMAIL",
                    deferRequestBy: 200,
                    hint: "",
                    count: $options.tips
                });
            });
        }
    };

    /**Подсказки адреса**/
    var FullAddressSuggestions = {
        init: function ($options) {
            FullAddressSuggestions.$address = $options.address;
            FullAddressSuggestions.options = FullAddressSuggestions.options || [];
            FullAddressSuggestions.options[$options.group_key] = $options;
            if ($options.fields.length > 0) {
                $.each($options.fields, function (index, $field) {
                    var country_id = $($field.group_id + " select[name*='country_id']:visible");
                    if (country_id.length > 0 && country_id.val() != 176) {
                        return true;
                    }
                    var $el = $($field.group_id + " input[name*='" + $field.name + "']:visible");

                    if ($el.length > 0) {
                        $($el).on('suggestions-fixdata',function (e) {
                            setTimeout(function() {is_fixData=0;},600);
                        });
                        FullAddressSuggestions.initSuggestions($el, $options, $field);

                        if ($el.suggestions() != undefined && window.address[$el.selector] != undefined) {
                            var address_id=$($field.group_id + " select[name*='address_id']:visible");
                            if (address_id.length <= 0) {
                                $el.suggestions().setSuggestion(window.address[$el.selector]);
                            }
                        }

                        if (flag_geo[$field.group_key] == (0 || undefined)) {
                            if ($el.suggestions() != undefined && $.inArray("city", $field.parts_suggest) !== -1) {
                                if ($el.val() != '') { 
								   is_fixData=1;
                                   $el.suggestions().fixData();
                                }
                                var geoLocation = $el.suggestions().getGeoLocation();
                                if (geoLocation != undefined) {
                                    geoLocation.done(
                                        function (locationData) {
                                            FullAddressSuggestions.suggestionComplete({
                                                data: locationData,
                                                options: $options
                                            });
                                            flag_geo[$field.group_key] = "1";
                                            if (typeof reloadAll === 'function' && $($el).data('onchange')=='reloadAll') { 
                                                reloadAll();
                                            } else {
                                                $el.change();
                                            }
                                        }
                                    );
                                }
                            }
                        }
                    }
                });
            }
        },

        initSuggestions: function ($el, $options, $field) {
            FullAddressSuggestions.options = FullAddressSuggestions.options || [];
            FullAddressSuggestions.options[$options.group_key] = [];
            FullAddressSuggestions.options[$options.group_key] = $options;
            var $suggest = $el.suggestions({
                serviceUrl: "index.php?route=extension/module/suggest/request&r=",
                type: "ADDRESS",
                floating: true,
                deferRequestBy: 200,
                triggerSelectOnSpace: false,
                count: $options.tips,
                geoLocation: ($options.geoLocation && (flag_geo[$field.group_key] == undefined || 0)),
                bounds: ($.inArray("house", $field.parts_suggest) == -1) ? $field.parts_suggest.join('-') : false,
                constraints: ($field.constraint.length > 0 ? $($field.group_id + " input[name*='" + $field.constraint + "']:visible") : false),
                onSearchStart: function (params) {
					
                    return params;
                },
                onSelectNothing: function () {
                    //$(this).suggestions().clear();
                },
                onSelect: function (suggest, changed) {
                    $.each(FullAddressSuggestions.options[$options.group_key].fields, function (index, $fieldd) {
                        formatSuggestionValues(suggest, $fieldd);
                    });

                    suggest.data.city_type = '';
                    if (changed == true && is_fixData==0) {
                                                                    if (typeof reloadAll === 'function' && $($el).data('onchange')=='reloadAll') { 

                           reloadAll();
                        } else {
                            $(this).change();
                        }
                    }


                    return suggest;
                },
                formatSelected: function (suggest) {
                    suggest.data.city_type = '';
                    var result = formatSuggestionValues(suggest, $field);
                    return result;
                }
            }).suggestions();

        },
        suggestionComplete: function (suggestion) {
            if (!suggestion.data) {
                return;
            }
            $.each(suggestion.options.fields, function (index, $field) {
                formatSuggestionValues(suggestion, $field);
            });
        },
        selectField: function (address_field, $el) {

            $el.children("option").each(function () {
                if (this.text.indexOf(address_field) !== -1 || address_field.indexOf(this.text.replace(/ Республика|Республика |край | край| область/g, "")) !== -1) {
                    $(this).attr("selected", "selected");
                }
            });
            return true;
        }
    };

    window.FullNameSuggestions = FullNameSuggestions;
    window.EmailSuggestions = EmailSuggestions;
    window.FullAddressSuggestions = FullAddressSuggestions;

    function nvl(val) {
        return val || '';
    }

    function formatSuggestionValues(suggestion, $field) {

        var address = suggestion.data;
        var $where = $(this).parents(".simplecheckout-block");
        if (!$where.length) {
            $where = $(document);
        }
        var $el = $where.find($field.group_id + " input[name*='" + $field.name + "']:visible");
        var field_array = [];
        $.each($field.parts_suggest, function (i, part) {
            switch (part) {
                case 'postcode':
                    if (address.postal_code) {
                        field_array.push(address.postal_code);
                    }
                    break;
                case 'region':
                    var region = [];
                    if (address.region && address.region.length > 0) {
                        region.push(address.region);
                        if ($field.type == 'input')
                            if (address.region_type && address.region_type.length > 0) {
                                region.push(address.region_type);
                            }
                    }
                    if (region) {
                        field_array.push(region.join(' '));
                    }
                    break;
                case 'area':
                    if (address.area_with_type && address.area_with_type.length > 0)
                        field_array.push(address.area_with_type);
                    break;
                case 'city':
                    if (address.city && address.city.length > 0) {
                        field_array.push(address.city);
                    }
                    break;
                case 'settlement':
                    if (address.settlement_with_type && address.settlement_with_type.length > 0)
                        field_array.push(address.settlement_with_type);
                    break;
                case 'street':
                    if (address.street_with_type && address.street_with_type.length > 0)
                        field_array.push(address.street_with_type);
                    break;
                case 'house':
                    var house = [];
                    if (address.house && address.house.length > 0) {
                        if (address.house_type && address.house_type.length > 0)
                            house.push(address.house_type);
                        house.push(address.house);
                        if (address.block_type && address.block_type.length > 0)
                            house.push(address.block_type);
                        if (address.block && address.block.length > 0)
                            house.push(address.block);
                        if (address.flat_type && address.flat_type.length > 0) {
                            house.push(address.flat_type);
                            if (address.flat && address.flat.length > 0) {
                                house.push(address.flat);
                            }
                        }
                    }
                    if (house) {
                        field_array.push(house.join(' '));
                    }
                    break;
            }

        });
        var field_val = field_array.join(', ');
        var val = nvl(field_val);
        if ($field.type == 'input') {
            $el.val(val);

        } else {
            FullAddressSuggestions.selectField(val, $where.find("select[name*='" + $field.name + "']:visible"));
        }
        suggestion.value = val;
        window.address[$el.selector] = suggestion;
        return suggestion;
    }

    function formatFioValues(suggestion, $field) {
        var fio = suggestion.data;
        var $where = $(this).parents(".simplecheckout-block");
        if (!$where.length) {
            $where = $(document);
        }
        var $el = $where.find($field.group_id + " input[name*='" + $field.name + "']");
        var field_array = [];
        if ($el.length>0) { 
            try{
                var el_data=$el.suggestions().suggestions[0].data;


            }catch(e){
                var el_data=undefined;
            }
            $.each($field.parts, function (i, part) {
                switch (part) {
                    case 'NAME':
                        if (fio.name) {
                            field_array.push(fio.name);
                        } else if (el_data!=undefined && el_data.name && el_data.name!=undefined) {
                            field_array.push(el_data.name);
                        }
                        break;
                    case 'SURNAME':
                        if (fio.surname) {
                            field_array.push(fio.surname);
                        }  else if (el_data!=undefined && el_data.surname && el_data.surname!=undefined) {
                            field_array.push(el_data.surname);
                        }
                        break;
                    case 'PATRONYMIC':
                        if (fio.patronymic) {
                            field_array.push(fio.patronymic);
                        }  else if (el_data!=undefined && el_data.patronymic && el_data.patronymic!=undefined) {
                            field_array.push(el_data.patronymic);
                        }
                        break;
                }
            });
            var field_val = field_array.join(' ');
            var val = nvl(field_val);

            if (val !== '') {
                $el.val(val);
            }
        }
    }

})
(jQuery);