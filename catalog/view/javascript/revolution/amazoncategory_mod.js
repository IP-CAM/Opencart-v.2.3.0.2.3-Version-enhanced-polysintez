(function($){
	var $menu = $(),
		options = {
			popup: false,
			maximize: false
		},
		exitMenuDelay = 0,
		topDelayedChange = 0,
		itemMouseleaveDelay = 0,
		delayTime = 100,
		menuElDelayTime = 200,
		subMenuWidth = 190,
		maxMenuHeight = 0,
		scrollStep = 1000,
		scrollViewport = 0,
		scrollSpeed = 'fast',
		openCls = 'open',
		closeCls = 'closed',
		rowSelector = 'div.revlevel_1',
		childrenCls = '.childrenList';	
	function init (menu, params) {
		options = $.extend( {}, options, params );
		$menu = $(menu);
		menuNamespace = $menu.attr('id');
		$menu.menuAim({
			rowSelector: rowSelector,
			activate: activateSubmenu,
			exitMenu: exitMenu
		});
	};
	function exitMenu() {
		clearTimeout(itemMouseleaveDelay);
		exitMenuDelay = setTimeout(function() {
			$('#' + menuNamespace + ' ' + childrenCls).hide();
			toggleClasses('#' + menuNamespace + ' .catalog_list .revlevel_1', openCls, closeCls);
			if (!options.popup) {
				hidePopupMenu();
			}
		}, delayTime);
		return true;
	}
	function enterMenu(row) {
			var $row = $(row);
			if (exitMenuDelay > 0) {
				clearTimeout(exitMenuDelay);
			}
			clearTimeout(topDelayedChange);
			toggleClasses('#' + menuNamespace + ' .catalog_list .revlevel_1 div.open', openCls, closeCls);
			toggleClasses(row, closeCls, openCls);
			$row.find('> '+childrenCls).show();
			$('#' + menuNamespace + ' .catalog_list .revlevel_1.open').not($row).each(function(){	
				toggleClasses(this, openCls, closeCls);
			});
	}
	function activateSubmenu(row) {
		var $row = $(row),
		$submenu = $row.find(childrenCls + ':first');
		clearTimeout(exitMenuDelay);
		$submenu.show();
		enterMenu(row);
		toggleClasses(row, closeCls, openCls);
		var mm = $('#menu2').outerHeight();
		$('#menu2 .child-box').css('min-height', mm);
	}
	function deactivateSubmenu(row) {
		return true;
	}
	function toggleClasses(el, rmCls, addCls) {
		$(el).removeClass(rmCls).addClass(addCls);
	}
	$.fn.popupMenuWidget = function(options){
		init(this, options);
	};
	var defaults = {
        columns: 4,
        classname: 'column',
        min: 1
    };
    $.fn.autocolumnlist = function(params){        
        var options = $.extend({}, defaults, params);        
        return this.each(function() {        
            var els = $(this).find('li.glavli');
            var dimension = els.size();
            if (dimension > 0) {
                var elCol = Math.ceil(dimension/options.columns);
                if (elCol < options.min) {
                    elCol = options.min;
                }
                var start = 0;
                var end = elCol;
                for (i=0; i<options.columns; i++) {
                    if ((i + 1) == options.columns) {
                        els.slice(start, end).wrapAll('<div class="'+options.classname+' last" />');
                    } else {
                            els.slice(start, end).wrapAll('<div class="'+options.classname+'" />');
                    }
                    start = start+elCol;
                    end = end+elCol;
                }
           }
        });
    };
})(jQuery);
$(document).ready(function(){
	var options = {};
			options = {
		popup: true, maximize: true
	};
	$("#menu2").popupMenuWidget(options);		   		
		
});