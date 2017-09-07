(function ($) {
    "use strict";
    $.fn.ratingLocales['ru'] = {
        defaultCaption: '{rating} Звёзды',
        starCaptions: {
            0.5: 'Неудовлетворительно',
            1: 'Неудовлетворительно',
            1.5: 'Плохо',
            2: 'Плохо',
            2.5: 'Плохо',
            3: 'Удовлетворительно',
            3.5: 'Удовлетворительно',
            4: 'Хорошо',
            4.5: 'Хорошо',
            5: 'Отлично'
        },
        clearButtonTitle: 'Очистить',
        clearCaption: 'Без рейтинга'
    };
})(window.jQuery);
