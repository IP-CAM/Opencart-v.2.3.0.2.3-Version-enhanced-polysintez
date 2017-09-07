<!DOCTYPE html>
<!--[if IE]><![endif]-->
<!--[if IE 8 ]><html dir="<?php echo $direction; ?>" lang="<?php echo $lang; ?>" class="iexpl"><![endif]-->
<!--[if IE 9 ]><html dir="<?php echo $direction; ?>" lang="<?php echo $lang; ?>" class="iexpl"><![endif]-->
<!--[if (gt IE 9)|!(IE)]><!-->
<html dir="<?php echo $direction; ?>" lang="<?php echo $lang; ?>" class="<?php echo $class; ?>">
<!--<![endif]-->
<head>
<meta charset="UTF-8" />
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<title><?php echo $title; ?></title>
<base href="<?php echo $base; ?>" />
<?php if ($description) { ?>
<meta name="description" content="<?php echo $description; ?>" />
<?php } ?>
<?php if ($keywords) { ?>
<meta name="keywords" content= "<?php echo $keywords; ?>" />
<?php } ?>
<meta property="og:title" content="<?php echo $title; ?>" />
<meta property="og:type" content="website" />
<meta property="og:url" content="<?php echo $og_url; ?>" />
<meta property="og:image" content="<?php echo !empty($og_image) ? $og_image : $logo; ?>" />
<meta property="og:site_name" content="<?php echo $name; ?>" />
<link href="catalog/view/javascript/bootstrap/css/bootstrap.min.css" rel="stylesheet" media="screen" />
<link href="catalog/view/javascript/revolution/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css" />
<link href="catalog/view/theme/revolution/stylesheet/stylesheet.css" rel="stylesheet">
<style>
.container-smooth{max-width:1170px}@media (min-width:1px){.container-smooth{width:auto}}.btn-labeled{padding-top:0;padding-bottom:0}.btn-label{position:relative;background:0 0;background:rgba(0,0,0,.15);display:inline-block;padding:6px 12px;left:-12px;border-radius:3px 0 0 3px}.btn-label.btn-label-right{left:auto;right:-12px;border-radius:0 3px 3px 0}.btn-lg .btn-label{padding:10px 16px;left:-16px;border-radius:5px 0 0 5px}.btn-lg .btn-label.btn-label-right{left:auto;right:-16px;border-radius:0 5px 5px 0}.btn-sm .btn-label{padding:5px 10px;left:-10px;border-radius:2px 0 0 2px}.btn-sm .btn-label.btn-label-right{left:auto;right:-10px;border-radius:0 2px 2px 0}.btn-xs .btn-label{padding:1px 5px;left:-5px;border-radius:2px 0 0 2px}.btn-xs .btn-label.btn-label-right{left:auto;right:-5px;border-radius:0 2px 2px 0}.nav-tabs-bottom{border-bottom:0;border-top:1px solid #ddd}.nav-tabs-bottom>li{margin-bottom:0;margin-top:-1px}.nav-tabs-bottom>li>a{border-radius:0 0 4px 4px}.nav-tabs-bottom>li>a:hover,.nav-tabs-bottom>li>a:focus,.nav-tabs-bottom>li.active>a,.nav-tabs-bottom>li.active>a:hover,.nav-tabs-bottom>li.active>a:focus{border:1px solid #ddd;border-top-color:transparent}.nav-tabs-left{border-bottom:0;border-right:1px solid #ddd}.nav-tabs-left>li{margin-bottom:0;margin-right:-1px;float:none}.nav-tabs-left>li>a{border-radius:4px 0 0 4px;margin-right:0;margin-bottom:2px}.nav-tabs-left>li>a:hover,.nav-tabs-left>li>a:focus,.nav-tabs-left>li.active>a,.nav-tabs-left>li.active>a:hover,.nav-tabs-left>li.active>a:focus{border:1px solid #ddd;border-right-color:transparent}.row>.nav-tabs-left{padding-right:0;padding-left:15px;margin-right:-1px;position:relative;z-index:1}.row>.nav-tabs-left+.tab-content{border-left:1px solid #ddd}.nav-tabs-right{border-bottom:0;border-left:1px solid #ddd}.nav-tabs-right>li{margin-bottom:0;margin-left:-1px;float:none}.nav-tabs-right>li>a{border-radius:0 4px 4px 0;margin-left:0;margin-bottom:2px}.nav-tabs-right>li>a:hover,.nav-tabs-right>li>a:focus,.nav-tabs-right>li.active>a,.nav-tabs-right>li.active>a:hover,.nav-tabs-right>li.active>a:focus{border:1px solid #ddd;border-left-color:transparent}.row>.nav-tabs-right{padding-left:0;padding-right:15px}.navmenu,.navbar-offcanvas{width:300px;height:auto;border-width:1px;border-style:solid;border-radius:4px}.navmenu-fixed-left,.navmenu-fixed-right,.navbar-offcanvas{position:fixed;z-index:1030;top:0;bottom:0;overflow-y:auto;border-radius:0}.navmenu-fixed-left,.navbar-offcanvas.navmenu-fixed-left{left:0;right:auto;border-width:0 1px 0 0}.navmenu-fixed-right,.navbar-offcanvas{left:auto;right:0;border-width:0 0 0 1px}.navmenu-nav{margin-bottom:10px}.navmenu-nav.dropdown-menu{position:static;margin:0;padding-top:0;float:none;border:none;-webkit-box-shadow:none;box-shadow:none;border-radius:0}.navbar-offcanvas .navbar-nav{margin:0}@media (min-width:768px){.navbar-offcanvas{width:auto;border-top:0;box-shadow:none}.navbar-offcanvas.offcanvas{position:static;display:block!important;height:auto!important;padding-bottom:0;overflow:visible!important}.navbar-offcanvas .navbar-nav.navbar-left:first-child{margin-left:-15px}.navbar-offcanvas .navbar-nav.navbar-right:last-child{margin-right:-15px}.navbar-offcanvas .navmenu-brand{display:none}}.navmenu-brand{display:block;font-size:18px;line-height:20px;padding:10px 15px;margin:10px 0}.navmenu-brand:hover,.navmenu-brand:focus{text-decoration:none}.navmenu-default,.navbar-default .navbar-offcanvas{background-color:#f8f8f8;border-color:#e7e7e7}.navmenu-default .navmenu-brand,.navbar-default .navbar-offcanvas .navmenu-brand{color:#777}.navmenu-default .navmenu-brand:hover,.navbar-default .navbar-offcanvas .navmenu-brand:hover,.navmenu-default .navmenu-brand:focus,.navbar-default .navbar-offcanvas .navmenu-brand:focus{color:#5e5e5e;background-color:transparent}.navmenu-default .navmenu-text,.navbar-default .navbar-offcanvas .navmenu-text{color:#777}.navmenu-default .navmenu-nav>.dropdown>a:hover .caret,.navbar-default .navbar-offcanvas .navmenu-nav>.dropdown>a:hover .caret,.navmenu-default .navmenu-nav>.dropdown>a:focus .caret,.navbar-default .navbar-offcanvas .navmenu-nav>.dropdown>a:focus .caret{border-top-color:#333;border-bottom-color:#333}.navmenu-default .navmenu-nav>.open>a,.navbar-default .navbar-offcanvas .navmenu-nav>.open>a,.navmenu-default .navmenu-nav>.open>a:hover,.navbar-default .navbar-offcanvas .navmenu-nav>.open>a:hover,.navmenu-default .navmenu-nav>.open>a:focus,.navbar-default .navbar-offcanvas .navmenu-nav>.open>a:focus{background-color:#e7e7e7;color:#555}.navmenu-default .navmenu-nav>.open>a .caret,.navbar-default .navbar-offcanvas .navmenu-nav>.open>a .caret,.navmenu-default .navmenu-nav>.open>a:hover .caret,.navbar-default .navbar-offcanvas .navmenu-nav>.open>a:hover .caret,.navmenu-default .navmenu-nav>.open>a:focus .caret,.navbar-default .navbar-offcanvas .navmenu-nav>.open>a:focus .caret{border-top-color:#555;border-bottom-color:#555}.navmenu-default .navmenu-nav>.dropdown>a .caret,.navbar-default .navbar-offcanvas .navmenu-nav>.dropdown>a .caret{border-top-color:#777;border-bottom-color:#777}.navmenu-default .navmenu-nav.dropdown-menu,.navbar-default .navbar-offcanvas .navmenu-nav.dropdown-menu{background-color:#e7e7e7}.navmenu-default .navmenu-nav.dropdown-menu>.divider,.navbar-default .navbar-offcanvas .navmenu-nav.dropdown-menu>.divider{background-color:#f8f8f8}.navmenu-default .navmenu-nav.dropdown-menu>.active>a,.navbar-default .navbar-offcanvas .navmenu-nav.dropdown-menu>.active>a,.navmenu-default .navmenu-nav.dropdown-menu>.active>a:hover,.navbar-default .navbar-offcanvas .navmenu-nav.dropdown-menu>.active>a:hover,.navmenu-default .navmenu-nav.dropdown-menu>.active>a:focus,.navbar-default .navbar-offcanvas .navmenu-nav.dropdown-menu>.active>a:focus{background-color:#d7d7d7}.navmenu-default .navmenu-nav>li>a,.navbar-default .navbar-offcanvas .navmenu-nav>li>a{color:#777}.navmenu-default .navmenu-nav>li>a:hover,.navbar-default .navbar-offcanvas .navmenu-nav>li>a:hover,.navmenu-default .navmenu-nav>li>a:focus,.navbar-default .navbar-offcanvas .navmenu-nav>li>a:focus{color:#333;background-color:transparent}.navmenu-default .navmenu-nav>.active>a,.navbar-default .navbar-offcanvas .navmenu-nav>.active>a,.navmenu-default .navmenu-nav>.active>a:hover,.navbar-default .navbar-offcanvas .navmenu-nav>.active>a:hover,.navmenu-default .navmenu-nav>.active>a:focus,.navbar-default .navbar-offcanvas .navmenu-nav>.active>a:focus{color:#555;background-color:#e7e7e7}.navmenu-default .navmenu-nav>.disabled>a,.navbar-default .navbar-offcanvas .navmenu-nav>.disabled>a,.navmenu-default .navmenu-nav>.disabled>a:hover,.navbar-default .navbar-offcanvas .navmenu-nav>.disabled>a:hover,.navmenu-default .navmenu-nav>.disabled>a:focus,.navbar-default .navbar-offcanvas .navmenu-nav>.disabled>a:focus{color:#ccc;background-color:transparent}.navmenu-inverse,.navbar-inverse .navbar-offcanvas{background-color:#222;border-color:#080808}.navmenu-inverse .navmenu-brand,.navbar-inverse .navbar-offcanvas .navmenu-brand{color:#999}.navmenu-inverse .navmenu-brand:hover,.navbar-inverse .navbar-offcanvas .navmenu-brand:hover,.navmenu-inverse .navmenu-brand:focus,.navbar-inverse .navbar-offcanvas .navmenu-brand:focus{color:#fff;background-color:transparent}.navmenu-inverse .navmenu-text,.navbar-inverse .navbar-offcanvas .navmenu-text{color:#999}.navmenu-inverse .navmenu-nav>.dropdown>a:hover .caret,.navbar-inverse .navbar-offcanvas .navmenu-nav>.dropdown>a:hover .caret,.navmenu-inverse .navmenu-nav>.dropdown>a:focus .caret,.navbar-inverse .navbar-offcanvas .navmenu-nav>.dropdown>a:focus .caret{border-top-color:#fff;border-bottom-color:#fff}.navmenu-inverse .navmenu-nav>.open>a,.navbar-inverse .navbar-offcanvas .navmenu-nav>.open>a,.navmenu-inverse .navmenu-nav>.open>a:hover,.navbar-inverse .navbar-offcanvas .navmenu-nav>.open>a:hover,.navmenu-inverse .navmenu-nav>.open>a:focus,.navbar-inverse .navbar-offcanvas .navmenu-nav>.open>a:focus{background-color:#080808;color:#fff}.navmenu-inverse .navmenu-nav>.open>a .caret,.navbar-inverse .navbar-offcanvas .navmenu-nav>.open>a .caret,.navmenu-inverse .navmenu-nav>.open>a:hover .caret,.navbar-inverse .navbar-offcanvas .navmenu-nav>.open>a:hover .caret,.navmenu-inverse .navmenu-nav>.open>a:focus .caret,.navbar-inverse .navbar-offcanvas .navmenu-nav>.open>a:focus .caret{border-top-color:#fff;border-bottom-color:#fff}.navmenu-inverse .navmenu-nav>.dropdown>a .caret,.navbar-inverse .navbar-offcanvas .navmenu-nav>.dropdown>a .caret{border-top-color:#999;border-bottom-color:#999}.navmenu-inverse .navmenu-nav.dropdown-menu,.navbar-inverse .navbar-offcanvas .navmenu-nav.dropdown-menu{background-color:#080808}.navmenu-inverse .navmenu-nav.dropdown-menu>.divider,.navbar-inverse .navbar-offcanvas .navmenu-nav.dropdown-menu>.divider{background-color:#222}.navmenu-inverse .navmenu-nav.dropdown-menu>.active>a,.navbar-inverse .navbar-offcanvas .navmenu-nav.dropdown-menu>.active>a,.navmenu-inverse .navmenu-nav.dropdown-menu>.active>a:hover,.navbar-inverse .navbar-offcanvas .navmenu-nav.dropdown-menu>.active>a:hover,.navmenu-inverse .navmenu-nav.dropdown-menu>.active>a:focus,.navbar-inverse .navbar-offcanvas .navmenu-nav.dropdown-menu>.active>a:focus{background-color:#000}.navmenu-inverse .navmenu-nav>li>a,.navbar-inverse .navbar-offcanvas .navmenu-nav>li>a{color:#999}.navmenu-inverse .navmenu-nav>li>a:hover,.navbar-inverse .navbar-offcanvas .navmenu-nav>li>a:hover,.navmenu-inverse .navmenu-nav>li>a:focus,.navbar-inverse .navbar-offcanvas .navmenu-nav>li>a:focus{color:#fff;background-color:transparent}.navmenu-inverse .navmenu-nav>.active>a,.navbar-inverse .navbar-offcanvas .navmenu-nav>.active>a,.navmenu-inverse .navmenu-nav>.active>a:hover,.navbar-inverse .navbar-offcanvas .navmenu-nav>.active>a:hover,.navmenu-inverse .navmenu-nav>.active>a:focus,.navbar-inverse .navbar-offcanvas .navmenu-nav>.active>a:focus{color:#fff;background-color:#080808}.navmenu-inverse .navmenu-nav>.disabled>a,.navbar-inverse .navbar-offcanvas .navmenu-nav>.disabled>a,.navmenu-inverse .navmenu-nav>.disabled>a:hover,.navbar-inverse .navbar-offcanvas .navmenu-nav>.disabled>a:hover,.navmenu-inverse .navmenu-nav>.disabled>a:focus,.navbar-inverse .navbar-offcanvas .navmenu-nav>.disabled>a:focus{color:#444;background-color:transparent}.alert-fixed-top,.alert-fixed-bottom{position:fixed;width:100%;z-index:1035;border-radius:0;margin:0;left:0}@media (min-width:992px){.alert-fixed-top,.alert-fixed-bottom{width:992px;left:50%;margin-left:-496px}}.alert-fixed-top{top:0;border-width:0 0 1px}@media (min-width:992px){.alert-fixed-top{border-bottom-right-radius:4px;border-bottom-left-radius:4px;border-width:0 1px 1px}}.alert-fixed-bottom{bottom:0;border-width:1px 0 0}@media (min-width:992px){.alert-fixed-bottom{border-top-right-radius:4px;border-top-left-radius:4px;border-width:1px 1px 0}}.offcanvas{display:none}.offcanvas.in{display:block}@media (max-width:767px){.offcanvas-xs{display:none}.offcanvas-xs.in{display:block}}@media (max-width:991px){.offcanvas-sm{display:none}.offcanvas-sm.in{display:block}}@media (max-width:1199px){.offcanvas-md{display:none}.offcanvas-md.in{display:block}}.offcanvas-lg{display:none}.offcanvas-lg.in{display:block}.canvas-sliding{-webkit-transition:top .35s,left .35s,bottom .35s,right .35s;transition:top .35s,left .35s,bottom .35s,right .35s}.offcanvas-clone{height:0!important;width:0!important;overflow:hidden!important;border:none!important;margin:0!important;padding:0!important;position:absolute!important;top:auto!important;left:auto!important;bottom:0!important;right:0!important;opacity:0!important}.table.rowlink td:not(.rowlink-skip),.table .rowlink td:not(.rowlink-skip){cursor:pointer}.table.rowlink td:not(.rowlink-skip) a,.table .rowlink td:not(.rowlink-skip) a{color:inherit;font:inherit;text-decoration:inherit}.table-hover.rowlink tr:hover td,.table-hover .rowlink tr:hover td{background-color:#cfcfcf}.btn-file{overflow:hidden;position:relative;vertical-align:middle}.btn-file>input{position:absolute;top:0;right:0;margin:0;opacity:0;filter:alpha(opacity=0);font-size:23px;height:100%;width:100%;direction:ltr;cursor:pointer}.fileinput{margin-bottom:9px;display:inline-block}.fileinput .form-control{padding-top:7px;padding-bottom:5px;display:inline-block;margin-bottom:0;vertical-align:middle;cursor:text}.fileinput .thumbnail{overflow:hidden;display:inline-block;margin-bottom:5px;vertical-align:middle;text-align:center}.fileinput .thumbnail>img{max-height:100%}.fileinput .btn{vertical-align:middle}.fileinput-exists .fileinput-new,.fileinput-new .fileinput-exists{display:none}.fileinput-inline .fileinput-controls{display:inline}.fileinput-filename{vertical-align:middle;display:inline-block;overflow:hidden}.form-control .fileinput-filename{vertical-align:bottom}.fileinput.input-group{display:table}.fileinput.input-group>*{position:relative;z-index:2}.fileinput.input-group>.btn-file{z-index:1}.fileinput-new.input-group .btn-file,.fileinput-new .input-group .btn-file{border-radius:0 4px 4px 0}.fileinput-new.input-group .btn-file.btn-xs,.fileinput-new .input-group .btn-file.btn-xs,.fileinput-new.input-group .btn-file.btn-sm,.fileinput-new .input-group .btn-file.btn-sm{border-radius:0 3px 3px 0}.fileinput-new.input-group .btn-file.btn-lg,.fileinput-new .input-group .btn-file.btn-lg{border-radius:0 6px 6px 0}.form-group.has-warning .fileinput .fileinput-preview{color:#8a6d3b}.form-group.has-warning .fileinput .thumbnail{border-color:#faebcc}.form-group.has-error .fileinput .fileinput-preview{color:#a94442}.form-group.has-error .fileinput .thumbnail{border-color:#ebccd1}.form-group.has-success .fileinput .fileinput-preview{color:#3c763d}.form-group.has-success .fileinput .thumbnail{border-color:#d6e9c6}.input-group-addon:not(:first-child){border-left:0}

#nprogress{pointer-events:none;}
#nprogress .bar{background:#29d;position:fixed;z-index:1031;top:0;left:0;width:100%;height:2px;}
#nprogress .peg{display:block;position:absolute;right:0px;width:100px;height:100%;box-shadow:0 0 10px #29d, 0 0 5px #29d;opacity:1.0;-webkit-transform:rotate(3deg) translate(0px, -4px);-ms-transform:rotate(3deg) translate(0px, -4px);transform:rotate(3deg) translate(0px, -4px);}
#nprogress .spinner{display:block;position:fixed;z-index:1031;top:15px;right:15px;}
#nprogress .spinner-icon{width:18px;height:18px;box-sizing:border-box;border:solid 2px transparent;border-top-color:#29d;border-left-color:#29d;border-radius:50%;-webkit-animation:nprogress-spinner 400ms linear infinite;animation:nprogress-spinner 400ms linear infinite;}
.nprogress-custom-parent{overflow:hidden;position:relative;}
.nprogress-custom-parent #nprogress .spinner,
.nprogress-custom-parent #nprogress .bar{position:absolute;}
@-webkit-keyframes nprogress-spinner{0%{-webkit-transform:rotate(0deg);}
100%{-webkit-transform:rotate(360deg);}
}
@keyframes nprogress-spinner{0%{transform:rotate(0deg);}
100%{transform:rotate(360deg);}
}
.mfp-bg{top:0;left:0;width:100%;height:100%;z-index:99;overflow:hidden;position:fixed;background:#000;opacity:0.3;filter:alpha(opacity=30);}
.mfp-wrap{top:0;left:0;width:100%;height:100%;z-index:1043;position:fixed;outline:none !important;-webkit-backface-visibility:hidden;}
.mfp-container{text-align:center;position:absolute;width:100%;height:100%;left:0;top:0;padding:0 8px;-webkit-box-sizing:border-box;-moz-box-sizing:border-box;box-sizing:border-box;}
.mfp-container:before{content:'';display:inline-block;height:100%;vertical-align:middle;}
.mfp-align-top .mfp-container:before{display:none;}
.mfp-content{position:relative;display:inline-block;vertical-align:middle;margin:0 auto;text-align:left;z-index:1045;}
.mfp-inline-holder .mfp-content, .mfp-ajax-holder .mfp-content{width:100%;cursor:auto;}
.mfp-ajax-cur{cursor:progress;}
.mfp-zoom-out-cur, .mfp-zoom-out-cur .mfp-image-holder .mfp-close{cursor:-moz-zoom-out;cursor:-webkit-zoom-out;cursor:zoom-out;}
.mfp-zoom{cursor:pointer;cursor:-webkit-zoom-in;cursor:-moz-zoom-in;cursor:zoom-in;}
.mfp-auto-cursor .mfp-content{cursor:auto;}
.mfp-close, .mfp-arrow, .mfp-preloader, .mfp-counter{-webkit-user-select:none;-moz-user-select:none;user-select:none;}
.mfp-loading.mfp-figure{display:none;}
.mfp-hide{display:none !important;}
.mfp-preloader{color:#CCC;position:absolute;top:50%;width:auto;text-align:center;margin-top:-0.8em;left:8px;right:8px;z-index:1044;}
.mfp-preloader a{color:#CCC;}
.mfp-preloader a:hover{color:#FFF;}
.mfp-s-ready .mfp-preloader{display:none;}
.mfp-s-error .mfp-content{display:none;}
button.mfp-close, button.mfp-arrow{overflow:visible;cursor:pointer;background:transparent;border:0;-webkit-appearance:none;display:block;outline:none;padding:0;z-index:1046;-webkit-box-shadow:none;box-shadow:none;}
button::-moz-focus-inner{padding:0;border:0;}
.mfp-close{width:44px;height:44px;line-height:44px;position:absolute;right:0;top:0;text-decoration:none;text-align:center;opacity:0.65;filter:alpha(opacity=65);padding:0 0 18px 10px;color:#FFF;font-style:normal;font-size:28px;font-family:Arial, Baskerville, monospace;}
.mfp-close:hover, .mfp-close:focus{opacity:1;filter:alpha(opacity=100);}
.mfp-close:active{top:1px;}
.mfp-close-btn-in .mfp-close{color:#333;}
.mfp-image-holder .mfp-close, .mfp-iframe-holder .mfp-close{color:#FFF;right:-6px;text-align:right;padding-right:6px;width:100%;}
.mfp-counter{position:absolute;top:0;right:0;color:#CCC;font-size:12px;line-height:18px;white-space:nowrap;}
.mfp-arrow{position:absolute;opacity:0.65;filter:alpha(opacity=65);margin:0;top:50%;margin-top:-55px;padding:0;width:90px;height:110px;-webkit-tap-highlight-color:rgba(0, 0, 0, 0);}
.mfp-arrow:active{margin-top:-54px;}
.mfp-arrow:hover, .mfp-arrow:focus{opacity:1;filter:alpha(opacity=100);}
.mfp-arrow:before, .mfp-arrow:after, .mfp-arrow .mfp-b, .mfp-arrow .mfp-a{content:'';display:block;width:0;height:0;position:absolute;left:0;top:0;margin-top:35px;margin-left:35px;border:medium inset transparent;}
.mfp-arrow:after, .mfp-arrow .mfp-a{border-top-width:13px;border-bottom-width:13px;top:8px;}
.mfp-arrow:before, .mfp-arrow .mfp-b{border-top-width:21px;border-bottom-width:21px;opacity:0.7;}
.mfp-arrow-left{left:0;}
.mfp-arrow-left:after, .mfp-arrow-left .mfp-a{border-right:17px solid #FFF;margin-left:31px;}
.mfp-arrow-left:before, .mfp-arrow-left .mfp-b{margin-left:25px;border-right:27px solid #3F3F3F;}
.mfp-arrow-right{right:0;}
.mfp-arrow-right:after, .mfp-arrow-right .mfp-a{border-left:17px solid #FFF;margin-left:39px;}
.mfp-arrow-right:before, .mfp-arrow-right .mfp-b{border-left:27px solid #3F3F3F;}
.mfp-iframe-holder{padding-top:40px;padding-bottom:40px;}
.mfp-iframe-holder .mfp-content{line-height:0;width:100%;max-width:900px;}
.mfp-iframe-holder .mfp-close{top:-40px;}
.mfp-iframe-scaler{width:100%;height:0;overflow:hidden;padding-top:56.25%;}
.mfp-iframe-scaler iframe{position:absolute;display:block;top:0;left:0;width:100%;height:100%;box-shadow:0 0 8px rgba(0, 0, 0, 0.6);background:#000;}
img.mfp-img{width:auto;max-width:100%;height:auto;display:block;line-height:0;-webkit-box-sizing:border-box;-moz-box-sizing:border-box;box-sizing:border-box;padding:40px 0 40px;margin:0 auto;}
.mfp-figure{line-height:0;}
.mfp-figure:after{content:'';position:absolute;left:0;top:40px;bottom:40px;display:block;right:0;width:auto;height:auto;z-index:-1;box-shadow:0 0 8px rgba(0, 0, 0, 0.6);background:#444;}
.mfp-figure small{color:#BDBDBD;display:block;font-size:12px;line-height:14px;}
.mfp-figure figure{margin:0;}
.mfp-bottom-bar{margin-top:-36px;position:absolute;top:100%;left:0;width:100%;cursor:auto;}
.mfp-title{text-align:left;line-height:18px;color:#F3F3F3;word-wrap:break-word;padding-right:36px;}
.mfp-image-holder .mfp-content{max-width:100%;}
.mfp-gallery .mfp-image-holder .mfp-figure{cursor:pointer;}
@media screen and (max-width:800px) and (orientation:landscape), screen and (max-height:300px){.mfp-img-mobile .mfp-image-holder{padding-left:0;padding-right:0;}
.mfp-img-mobile img.mfp-img{padding:0;}
.mfp-img-mobile .mfp-figure:after{top:0;bottom:0;}
.mfp-img-mobile .mfp-figure small{display:inline;margin-left:5px;}
.mfp-img-mobile .mfp-bottom-bar{background:rgba(0, 0, 0, 0.6);bottom:0;margin:0;top:auto;padding:3px 5px;position:fixed;-webkit-box-sizing:border-box;-moz-box-sizing:border-box;box-sizing:border-box;}
.mfp-img-mobile .mfp-bottom-bar:empty{padding:0;}
.mfp-img-mobile .mfp-counter{right:5px;top:3px;}
.mfp-img-mobile .mfp-close{top:0;right:0;width:35px;height:35px;line-height:35px;background:rgba(0, 0, 0, 0.6);position:fixed;text-align:center;padding:0;}
}
@media all and (max-width:900px){.mfp-arrow{-webkit-transform:scale(0.75);transform:scale(0.75);}
.mfp-arrow-left{-webkit-transform-origin:0;transform-origin:0;}
.mfp-arrow-right{-webkit-transform-origin:100%;transform-origin:100%;}
.mfp-container{padding-left:6px;padding-right:6px;}
}
.mfp-ie7 .mfp-img{padding:0;}
.mfp-ie7 .mfp-bottom-bar{width:600px;left:50%;margin-left:-300px;margin-top:5px;padding-bottom:5px;}
.mfp-ie7 .mfp-container{padding:0;}
.mfp-ie7 .mfp-content{padding-top:44px;}
.mfp-ie7 .mfp-close{top:0;right:0;padding-top:0;}
</style>
<style>
<?php if ($stikers_settings['last_color']) { ?>
.image .stiker_last {color: #<?php echo $stikers_settings['last_color_text']; ?>; background-color: #<?php echo $stikers_settings['last_color']; ?>; }
<?php } ?>
<?php if ($stikers_settings['best_color']) { ?>
.image .stiker_best {color: #<?php echo $stikers_settings['best_color_text']; ?>; background-color: #<?php echo $stikers_settings['best_color']; ?>; }
<?php } ?>
<?php if ($stikers_settings['spec_color']) { ?>
.image .stiker_spec {color: #<?php echo $stikers_settings['spec_color_text']; ?>; background-color: #<?php echo $stikers_settings['spec_color']; ?>; }
<?php } ?>
<?php if ($stikers_settings['netu_color']) { ?>
.image .stiker_netu {color: #<?php echo $stikers_settings['netu_color_text']; ?>; background-color: #<?php echo $stikers_settings['netu_color']; ?>; }
<?php } ?>
<?php if ($stikers_settings['user_color']) { ?>
.image .stiker_user {color: #<?php echo $stikers_settings['user_color_text']; ?>; background-color: #<?php echo $stikers_settings['user_color']; ?>; }
<?php } ?>
#top7 {background-color: #<?php echo $b_color_home_blog; ?>;}
.rev_slider.rev_blog_mod h3 {background-color: #<?php echo $b_color_home_blog; ?>;}
.rev_slider.rev_blog_mod .owl-pagination {background-color: #<?php echo $b_color_home_blog; ?>;}
.rev_slider.rev_blog_mod .vertical-sreview {margin-bottom: 2px;}
<?php if ($b_color_home_blog != 'FFFFFF') { ?>
.rev_slider.rev_blog_mod .vertical-sreview {border: none;}
#top7 {padding: 30px 0 15px 0; margin-bottom: 20px;}
<?php } ?>
<?php if ($b_color_home_blog == 'FFFFFF') { ?>
.rev_slider.rev_blog_mod {margin-top: 0;}
<?php } ?>
<?php if ($b_color_home_slideshow) { ?>
#top4 {background-color: #<?php echo $b_color_home_slideshow; ?>;}
<?php } ?>
<?php if ($color_selecta) { ?>
::selection {background-color: #<?php echo $color_selecta; ?>;}
<?php } ?>
<?php if ($setting_all_settings['color_all_document']) { ?>
body,#all_document,header,#top,#top2,.rev_slider .owl-pagination,.rev_slider h3,#product_products .owl-pagination,#product_products h3,.nav-tabs>li.active>a, .nav-tabs>li.active>a:focus, .nav-tabs>li.active>a:hover {background-color: #<?php echo $setting_all_settings['color_all_document']; ?>;}
<?php } ?>
<?php if (!$setting_all_settings['all_document_width']) { ?>
@media (min-width: 768px) {#all_document {width: 750px;margin: 0 auto;box-shadow: 0 0 15px rgba(0,0,0,0.2);}}
@media (min-width: 992px) {#all_document {width: 970px;}}
@media (min-width: 1200px) {#all_document {width: 1170px;}}
#top .container {border-bottom: 1px solid #eeeeee;}
<?php } else { ?>
#top {border-bottom: 1px solid #eeeeee;}
<?php } ?>
<?php if (!$setting_all_settings['all_document_width'] && $setting_all_settings['all_document_margin']) { ?>
@media (min-width: 768px) {#all_document {margin-top: 20px;margin-bottom: 20px;border-radius: 4px;}}
<?php } ?>
<?php if (!$setting_all_settings['all_document_width'] && $setting_all_settings['all_fon_image']) { ?>
body {
background: url('../../../../../../image/<?php echo $setting_all_settings['all_fon_image']; ?>')
<?php echo (isset($setting_all_settings['all_fon_image_css_1'])) ? 'repeat' : 'no-repeat'; ?> <?php echo (isset($setting_all_settings['all_fon_image_css_2'])) ? 'fixed' : ''; ?> <?php echo (isset($setting_all_settings['all_fon_image_css_3'])) ? 'center' : ''; ?>;
<?php echo (isset($setting_all_settings['all_fon_image_css_4'])) ? 'background-size: contain;' : ''; ?>
}
<?php } ?>
<?php if ($setting_all_settings['all_document_width']) { ?>
#top3,#top3.affix {width: 100%;}
#top .container {border-bottom: none;}
#top {border-bottom: 1px solid #eeeeee;}
<?php } ?>
<?php if (!$setting_all_settings['all_document_width']) { ?>
.map-wrapper .contact-info {padding: 0 50px;}
<?php } ?>
<?php if (!$setting_all_settings['all_document_width'] && $setting_all_settings['all_document_h_f_width']) { ?>
#top3,#top3.affix {width: 100%;}
<?php } ?>
<?php if ($revtheme_header_popupphone['under_phone'] && !$dop_contacts) { ?>
#top2 .tel .s22:hover {cursor: default !important;}
<?php if ($header_phone_text != '' && $header_phone_text2 == '') { ?>
#top2 .tel .header_phone_image {vertical-align: top; padding-top: 15px;}
<?php } else if ($header_phone_text != '' && $header_phone_text2 != '') { ?>
#top2 .tel .header_phone_image {vertical-align: top; padding-top: 30px;}
<?php } else { ?>
#top2 .tel .header_phone_image {vertical-align: top; padding-top: 0;}
<?php } ?>
<?php } ?>
<?php if ($setting_all_settings['color_href']) { ?>
a,.list-group a,.pagination>li>a, .pagination>li>span {color: #<?php echo $setting_all_settings['color_href']; ?>;}
.btn-primary,.pagination>.active>a, .pagination>.active>a:focus, .pagination>.active>a:hover, .pagination>.active>span, .pagination>.active>span:focus, .pagination>.active>span:hover,
#popup-view-wrapper .popup-footer a {background-color: #<?php echo $setting_all_settings['color_href']; ?>; border-color: #<?php echo $setting_all_settings['color_href']; ?>;}
<?php } ?>
<?php if ($setting_all_settings['color_href_hover']) { ?>
a:hover,.list-group a:hover,.pagination>li>a:hover, .pagination>li>span:hover,.top-links.verh a:hover,.top-links.verh .span-a:hover:hover,.product-info .btn-plus button:hover, .product-info .btn-minus button:hover,.product-info .pop_ico:hover, .product-info .compare .fa:hover, .product-info .wishlist .fa:hover,.product-info input[type='radio']:checked + label span.option_price, .product-info input[type='checkbox']:checked + label span.option_price,.home_block a:hover, .home_block a:hover .image > .fa,#menu2 ul.lastul li a:hover,#menu2 a:hover,#menu2 li.glavli a:hover,#menu .nav > li .dropdown-menu li .dropdown-menu ul li a:hover,#menu .nav > li > div > .dropdown-menu > div > ul > li > a:hover,.display-products-cart .btn-plus button:hover, .display-products-cart .btn-minus button:hover,.dropdown-menu li > a:hover, .dropdown-menu li > a:hover i,.search .search_button:hover,.search .change_category_button:hover,.popup_notification .mfp-close:hover,#popup-order-okno .mfp-close:hover, #popup-okno .mfp-close:hover,#popup-view-wrapper .mfp-close:hover,.wwicons a:hover,.cd-products-comparison-table .in_wishlist .fa-border, .cd-products-comparison-table .in_compare .fa-border,.cd-products-comparison-table .fa-border:hover,.product-info .in_wishlist .fa, .product-info .in_compare .fa,.well.well-sm .btn-group-justified .btn-default:hover,.dropdown-menu li > a:hover, .dropdown-menu li > a:hover i,.search .dropdown-menu > li > a:hover .name,.table-revolution .btn-plus button:hover, .table-revolution .btn-minus button:hover,.owl-carousel .owl-buttons div i:hover,.product-thumb .fa-border:hover {color: #<?php echo $setting_all_settings['color_href_hover']; ?>;}
.btn-primary:hover,#popup-view-wrapper .popup-footer a:hover,#popup-view-wrapper .popup-footer a:hover,.btn-primary.active.focus, .btn-primary.active:focus, .btn-primary.active:hover, .btn-primary:active.focus, .btn-primary:active:focus, .btn-primary:active:hover, .open>.dropdown-toggle.btn-primary.focus, .open>.dropdown-toggle.btn-primary:focus, .open>.dropdown-toggle.btn-primary:hover,#popup-view-wrapper .popup-footer a:hover {background-color: #<?php echo $setting_all_settings['color_href_hover']; ?>; border-color: #<?php echo $setting_all_settings['color_href_hover']; ?>;}
<?php } ?>
<?php if ($setting_all_settings['color_cart']) { ?>
#top2 .tel .s22,#top2 .tel .s22:hover i,.rating .fa-star,.rat-star.active,.rat-star.checked,.rating .fa-star + .fa-star-o,.product-info input[type='radio']:checked + label .fa, .product-info input[type='checkbox']:checked + label .fa,.product-info .form-group .list-unstyled .update_price, .product-info .form-group .list-unstyled .update_special,.product-thumb .price-new {color: #<?php echo $setting_all_settings['color_cart']; ?> !important;}
.product-info #button-cart,#cart:hover button.cart,.popup_notification .popup-footer a, #popup-order-okno .popup-footer a, #popup-okno .popup-footer a,.btn-danger {background-color: #<?php echo $setting_all_settings['color_cart']; ?>;}
.product-thumb .fa-border.fa-shopping-basket {background-color: #<?php echo $setting_all_settings['color_cart']; ?>; border-color: #<?php echo $setting_all_settings['color_cart']; ?>;}
.product-info input[type='radio']:checked + label, .product-info input[type='checkbox']:checked + label,.product-info input[type='radio']:hover + label, .product-info input[type='checkbox']:hover + label {box-shadow: 0px 0px 1px 1px #<?php echo $setting_all_settings['color_cart']; ?>;}
.product-info .radio .btn-default:active {border-color: #<?php echo $setting_all_settings['color_cart']; ?>;}
<?php } ?>
<?php if ($setting_all_settings['color_cart_hover']) { ?>
.product-info #button-cart:hover,.popup-phone-wrapper,.popup_notification .popup-footer a:hover, #popup-order-okno .popup-footer a:hover, #popup-okno .popup-footer a:hover,.btn-danger:hover {background-color: #<?php echo $setting_all_settings['color_cart_hover']; ?>;}
.product-thumb .fa-border.fa-shopping-basket:hover {background-color: #<?php echo $setting_all_settings['color_cart_hover']; ?>; border-color: #<?php echo $setting_all_settings['color_cart_hover']; ?>;}
<?php } ?>
<?php if ($setting_all_settings['color_amazon']) { ?>
#menu2_button .box-heading {background-color: #<?php echo $setting_all_settings['color_amazon']; ?>;}
<?php } ?>
<?php if ($setting_all_settings['color_top3']) { ?>
#top3 {background-color: #<?php echo $setting_all_settings['color_top3']; ?>;}
<?php } ?>
<?php if ($setting_all_settings['color_top3_cart']) { ?>
#cart button.cart {background-color: #<?php echo $setting_all_settings['color_top3_cart']; ?>;}
<?php } ?>
<?php if ($setting_all_settings['color_footer']) { ?>
footer .footer {background-color: #<?php echo $setting_all_settings['color_footer']; ?>;}
<?php } ?>
<?php if (!$setting_all_settings['all_document_width']) { ?>
#map-wrapper .contact-info {padding-left: 2% !important;}
<?php } ?>
<?php if ($mobile_home_slideshow) { ?>
@media (max-width: 767px) {#top4, #top5 {display: block;margin-bottom: -10px;min-height: initial !important;}}
<?php } ?>
<?php if ($razmiv_cont) { ?>
.razmiv #revslideshow,.razmiv #top6,.razmiv #content,.razmiv .rev_slider,.razmiv .hcarousel,.razmiv #vk_groups,.razmiv .breadcrumb,.razmiv .razmivcont,.razmiv #top3_links .top-links,.razmiv .home_h1,.razmiv #column-left,.razmiv #column-right,.razmiv #top7,.razmiv footer {-webkit-filter: blur(1px);filter: blur(1px);-webkit-transition: all 50ms linear;-moz-transition: all 50ms linear;-ms-transition: all 50ms linear;-o-transition: all 50ms linear;transition: all 50ms linear;}
.razmiv2 #top,.razmiv2 #revslideshow,.razmiv2 #menu2_button,.razmiv2 #top6,.razmiv2 #content,.razmiv2 .rev_slider,.razmiv2 .hcarousel,.razmiv2 #vk_groups,.razmiv2 .breadcrumb,.razmiv2 #top3_links .top-links,.razmiv2 .home_h1,.razmiv2 #column-left,.razmiv2 #column-right,.razmiv2 #top7,.razmiv2 #top2,.razmiv2 #top3,.razmiv2 footer {-webkit-filter: blur(1px);filter: blur(1px);-webkit-transition: all 50ms linear;-moz-transition: all 50ms linear;-ms-transition: all 50ms linear;-o-transition: all 50ms linear;transition: all 50ms linear;}
.iexpl .razmiv #revslideshow,.iexpl .razmiv #top6,.iexpl .razmiv #content,.iexpl .razmiv .rev_slider,.iexpl .razmiv .hcarousel,.iexpl .razmiv #vk_groups,.iexpl .razmiv .breadcrumb,.iexpl .razmiv .razmivcont,.iexpl .razmiv #top3_links .top-links,.iexpl .razmiv .home_h1,.iexpl .razmiv #column-left,.iexpl .razmiv #column-right,.iexpl .razmiv #top7,.iexpl .razmiv footer {filter: none;-webkit-transition: all 50ms linear;-moz-transition: all 50ms linear;-ms-transition: all 50ms linear;-o-transition: all 50ms linear;transition: all 50ms linear;}
.iexpl .razmiv2 #top,.iexpl .razmiv2 #revslideshow,.iexpl .razmiv2 #menu2_button,.iexpl .razmiv2 #top6,.iexpl .razmiv2 #content,.iexpl .razmiv2 .rev_slider,.iexpl .razmiv2 .hcarousel,.iexpl .razmiv2 #vk_groups,.iexpl .razmiv2 .breadcrumb,.iexpl .razmiv2 #top3_links .top-links,.iexpl .razmiv2 .home_h1,.iexpl .razmiv2 #column-left,.iexpl .razmiv2 #column-right,.iexpl .razmiv2 #top7,.iexpl .razmiv2 #top2,.iexpl .razmiv2 #top3,.iexpl .razmiv2 footer {filter: none;-webkit-transition: all 50ms linear;-moz-transition: all 50ms linear;-ms-transition: all 50ms linear;-o-transition: all 50ms linear;transition: all 50ms linear;}
<?php } ?>
<?php if ($revtheme_cat_attributes['description_in_grid']) { ?>
.product-grid .product-thumb .description, .rev_slider .product-thumb .description {display: block;}
<?php } ?>
<?php if ($revtheme_cat_attributes['options_in_grid']) { ?>
.product-grid .product-thumb .well-sm.product-info, .rev_slider .product-thumb .well-sm.product-info {display: block;}
<?php } ?>
<?php if (!$revtheme_product_all['opt_price']) { ?>
span.option_price {display: none;}
<?php } ?>
<?php if (!$setting_catalog_all['ch_quantity']) { ?>
.rev_slider .product-thumb .price, .product-grid .product-thumb .price {float: left; margin-bottom: 0;}
<?php } ?>
<?php if (!$setting_catalog_all['chislo_ryad']) { ?>
@media (min-width: 1200px) {.product-layout.col-lg-3 {width: 20%;}.product-layout.col-lg-4 {width: 25%;}}
<?php } ?>
<?php if ($header_phone_text != '' && $header_phone_text2 == '') { ?>
#top2 .search {margin-top: 22px;}
#top2 #logo {margin-top: 8px;}
<?php } else if ($header_phone_text != '' && $header_phone_text2 != '') { ?>
#top2 .search {margin-top: 35px;}
#top2 #logo {margin-top: 20px;}
<?php } ?>
<?php if ($user_styles) { ?>
<?php echo $user_styles; ?>
<?php } ?>
<?php if ($image_in_ico) { ?>
#menu .mmmenu .dropdown-menu:before {display: none;}
<?php } ?>
</style>
<?php /* Отключаем подгрузку скриптов для Google Page Speed */ if( FALSE === strpos($_SERVER ['HTTP_USER_AGENT'],"Google Page Speed" ) ) { ?>

<?php foreach ($styles as $style) { ?>
<link href="<?php echo $style['href']; ?>" type="text/css" rel="<?php echo $style['rel']; ?>" media="<?php echo $style['media']; ?>" />
<?php } ?>
<script src="catalog/view/javascript/jquery/jquery-2.1.1.min.js" type="text/javascript"></script>
<?php foreach ($links as $link) { ?>
<link href="<?php echo $link['href']; ?>" rel="<?php echo $link['rel']; ?>" />
<?php } ?>
<?php foreach ($scripts as $script) { ?>
<script src="<?php echo $script; ?>" type="text/javascript"></script>
<?php } ?>
<?php foreach ($analytics as $analytic) { ?>
<?php echo $analytic; ?>
<?php } ?>
<?php }?>
</head>
<body>
<?php if ($microdata_status) { ?>
	<div itemscope itemtype="http://schema.org/Organization" style="display:none;">
		<meta itemprop="name" content="<?php echo $name; ?>" />
		<link itemprop="url" href="<?php echo $og_url; ?>" />
		<link itemprop="logo" href="<?php echo $logo; ?>" />
		<?php if($description) { ?>
			<meta itemprop="description" content="<?php echo $description; ?>" />
		<?php } ?>
		<?php if ($microdata_postcode && $microdata_city && $microdata_adress) { ?>
			<div itemprop="address" itemscope itemtype="http://schema.org/PostalAddress">
				<meta itemprop="postalCode" content="<?php echo $microdata_postcode; ?>" />
				<meta itemprop="addressLocality" content="<?php echo $microdata_city; ?>" />
				<meta itemprop="streetAddress" content="<?php echo $microdata_adress; ?>" />
			</div>
		<?php } ?>
		<?php if ($microdata_phones){ ?>
			<?php foreach($microdata_phones as $microdata_phone){ ?>
				<meta itemprop="telephone" content="<?php echo $microdata_phone; ?>" />
			<?php } ?>
		<?php } ?>
		<meta itemprop="email" content="<?php echo $microdata_email; ?>" />	
		<?php if ($microdata_social){ ?>
		<?php foreach($microdata_social as $microdata_soc){ ?>
		<link itemprop="sameAs" href="<?php echo $microdata_soc; ?>" />
		<?php } ?>
		<?php } ?>
	</div>
<?php } ?>
<div id="pagefader"></div>
<div id="pagefader2" class="ustr"></div>
<!--noindex-->
<div class="hidden-md hidden-lg">
	<nav class="mobilemenu navmenu mobcats navmenu-default navmenu-fixed-left offcanvas">
		<div class="collapse navbar-collapse navbar-ex1-collapse">
			<ul class="nav navbar-nav">
				<li><button data-toggle="offcanvas" data-target=".mobcats" data-canvas="body"><?php echo $text_header_back; ?><i class="fa fa-chevron-right"></i></button></li>
				<?php $c_idc=1; foreach ($categories as $category) { ?>
					<li>
						<a href="<?php echo $category['href']; ?>" rel="nofollow"><?php echo $category['name']; ?><?php if ($category['children']) { ?><span class="chevrond" href="#rsubmenu1<?php echo $c_idc; ?>" data-toggle="collapse"><i class="fa fa-chevron-down"></i></span><?php } ?></a>
						<?php if ($category['children']) { ?>
							<div class="collapse list-group-submenu" id="rsubmenu1<?php echo $c_idc; ?>">
								<ul class="list-unstyled">
									<?php $c_id=1; foreach ($category['children'] as $child) { ?>
										<li>
											<a href="<?php echo $child['href']; ?>" rel="nofollow"><?php echo $child['name']; ?><?php if ($tri_level && $child['children']) { ?><span class="chevrond" href="#rsubmenu2<?php echo $c_idc . $c_id; ?>" data-toggle="collapse" data-parent="#rsubmenu1<?php echo $c_idc; ?>"><i class="fa fa-chevron-down"></i></span><?php } ?></a>
											<?php if ($tri_level && $child['children']) { ?>
												<div class="collapse list-group-submenu" id="rsubmenu2<?php echo $c_idc . $c_id; ?>">
													<ul class="list-unstyled">
														<?php foreach ($child['children'] as $child) { ?>
															<li><a href="<?php echo $child['href']; ?>" rel="nofollow">- <?php echo $child['name']; ?></a></li>
														<?php } ?>
													</ul>
												</div>
											<?php } ?>
										</li>
									<?php $c_id++; } ?>
								</ul>
							</div>
						<?php } ?>
					</li>
				<?php $c_idc++; } ?>
				<?php if ($manuf_status) { ?>
					<?php if ($categories_m) { ?>
						<li>
							<a href="<?php echo $url_revmenu_manufs; ?>" rel="nofollow"><?php echo $text_revmenu_manufs; ?><span class="chevrond" href="#rsubmenumanuf" data-toggle="collapse"><i class="fa fa-chevron-down"></i></a></span>
							<div class="collapse list-group-submenu" id="rsubmenumanuf">
								<ul class="list-unstyled">
									<?php foreach ($categories_m as $category) { ?>
											<?php if ($category['manufacturer']) { ?>
												<?php foreach ($category['manufacturer'] as $manufacturers) { ?>
													<li><a href="<?php echo $manufacturers['href']; ?>" rel="nofollow"><?php echo $manufacturers['name']; ?></a></li>
												<?php } ?>
											<?php } ?>
									<?php } ?>
								</ul>
							</div>
						</li>
					<?php } ?>
				<?php } ?>
			</ul>
		</div>
	</nav>
	<nav class="mobilemenu navmenu moblinks navmenu-default navmenu-fixed-left offcanvas">
		<div class="collapse navbar-collapse navbar-ex1-collapse">
		  <ul class="nav navbar-nav">
			<li><button data-toggle="offcanvas" data-target=".moblinks" data-canvas="body"><?php echo $text_header_back; ?><i class="fa fa-chevron-right"></i></button></li>
			<?php foreach ($informations as $information) { ?>
				<li><a href="<?php echo $information['href']; ?>" rel="nofollow"><?php echo $information['title']; ?></a></li>
			<?php } ?>
			<?php if ($revtheme_header_links) { ?>
				<?php foreach ($revtheme_header_links as $revtheme_header_link) { ?>
					<li><a href="<?php echo $revtheme_header_link['link']; ?>" rel="nofollow"><?php echo $revtheme_header_link['title']; ?></a></li>
				<?php } ?>
			<?php } ?>
			<li class="foroppro_mob" style="display:none;"></li>
		  </ul>
		</div>
	</nav>
</div>
<!--/noindex-->
<?php if (!$setting_all_settings['all_document_width'] && !$setting_all_settings['all_document_h_f_width']) { ?>
<div id="all_document">
<?php } ?>
<header>
	<?php if ($informations || $revtheme_header_links || $rev_lang || $rev_curr || $rev_srav || $rev_wish || $rev_acc) { ?>
	<div id="top">
		<div class="container">
			<?php if ($informations || $revtheme_header_links) { ?>
			<div class="hidden-sm hidden-md hidden-lg mobile_info">
				<div class="navbar navbar-default pull-left">
					<button type="button" class="navbar-toggle" data-toggle="offcanvas"
					data-target=".navmenu.moblinks" data-canvas="body">
					<i class="fa fa-info" aria-hidden="true"></i>
					<span class="hidden-xs"><?php echo $text_header_information; ?></span>
					<i class="fa fa-chevron-left"></i>
					</button>
				</div>
			</div>
			<div class="top-links hidden-xs verh nav pull-left text-center">			
				<?php foreach ($informations as $information) { ?>
					<a href="<?php echo $information['href']; ?>"><?php echo $information['title']; ?></a>
				<?php } ?>
				<?php if ($revtheme_header_links) { ?>
					<?php foreach ($revtheme_header_links as $revtheme_header_link) { ?>
						<a href="<?php echo $revtheme_header_link['link']; ?>"><?php echo $revtheme_header_link['title']; ?></a>
					<?php } ?>
				<?php } ?>
				<span class="foroppro" style="display:none;"></span>
			</div>
			<?php } ?>
			<?php if ($rev_lang || $rev_curr || $rev_srav || $rev_wish || $rev_acc) { ?>
			<div class="top-links verh nav pull-right <?php if ((count($informations) + count($revtheme_header_links)) > 4) { ?>text_ico_skrit<?php } ?>">
				<ul class="list-inline">
					<?php if ($rev_lang) { ?>
					<?php echo $language; ?>
					<?php } ?>
					<?php if ($rev_curr) { ?>
					<?php echo $currency; ?>
					<?php } ?>
					<?php if ($rev_srav) { ?>
					<li>
					<a href="<?php echo $compare; ?>" class="dropdown-toggle"><span id="compare-total"><?php echo $text_compare; ?></span></a>
					</li>
					<?php } ?>
					<?php if ($rev_wish) { ?>
					<li>
					<a href="<?php echo $wishlist; ?>" class="dropdown-toggle"><span id="wishlist-total"><?php echo $text_wishlist; ?></span></a>
					</li>
					<?php } ?>
					<?php if ($rev_acc) { ?>
					<li class="dropdown"><a href="<?php echo $account; ?>" title="<?php echo $text_account; ?>" class="dropdown-toggle" data-toggle="dropdown"><i class="fa fa-user"></i> <span class="hidden-xs hidden-sm"><?php echo $text_account; ?></span><i class="fa fa-chevron-down strdown"></i></a>
						<ul class="dropdown-menu dropdown-menu-right">
						<?php if ($logged) { ?>
							<li><a href="<?php echo $account; ?>"><?php echo $text_account; ?></a></li>
							<li><a href="<?php echo $order; ?>"><?php echo $text_order; ?></a></li>
							<li><a href="<?php echo $transaction; ?>"><?php echo $text_transaction; ?></a></li>
							<li><a href="<?php echo $download; ?>"><?php echo $text_download; ?></a></li>
							<li><a href="<?php echo $logout; ?>"><?php echo $text_logout; ?></a></li>
						<?php } else { ?>
							<?php if ($popup_login) { ?>
								<li><a onclick="get_revpopup_login();"><?php echo $text_login; ?></a></li>
							<?php } else { ?>
								<li><a href="<?php echo $login; ?>"><?php echo $text_login; ?></a></li>
							<?php } ?>
							<li><a href="<?php echo $register; ?>"><?php echo $text_register; ?></a></li>
						<?php } ?>
						</ul>
					<li><div class="prmn-cmngr"></div></li>
					</li>
					<?php } ?>
				</ul>
			</div>
			<?php } ?>
		</div>
	</div>
	<?php } ?>
	<div id="top2">
	  <div class="container">
		<div class="row">
		<div class="col-xs-12 col-sm-6 col-md-3">
			<div id="logo">
			  <?php if ($logo) { ?>
				<?php if ($home == $og_url) { ?>
				  <img src="<?php echo $logo; ?>" title="<?php echo $name; ?>" alt="<?php echo $name; ?>" class="img-responsive" />
				<?php } else { ?>
				  <a href="<?php echo $home; ?>"><img src="<?php echo $logo; ?>" title="<?php echo $name; ?>" alt="<?php echo $name; ?>" class="img-responsive" /></a>
				<?php } ?>
			  <?php } else { ?>
				<h1><a href="<?php echo $home; ?>"><?php echo $name; ?></a></h1>
			  <?php } ?>
			</div>
		</div>
		<?php if ($header_phone_number != '' || $header_phone_text != '') { ?>
			<div class="hidden-xs hidden-sm bigsearch col-xs-12 col-sm-6 col-md-6"><?php echo $search; ?></div>
			<div class="col-xs-12 col-sm-6 col-md-3">
				<div class="header_conts t-ar">
					<div class="tel">
						<?php if ($header_phone_number != '' || $header_phone_number2 != '') { ?>
							<span class="header_phone_image"><?php echo $header_phone_image; ?></span>
						<?php } ?>
						<div class="header_phone_nomer">
							<?php if ($header_phone_text != '') { ?>
								<span class="s11"><?php echo $header_phone_text; ?></span>
								<?php if ($header_phone_text2) { ?>
									<span class="s12"><?php echo $header_phone_text2; ?></span>
								<?php } ?>
							<?php } ?>
							<?php if ($header_phone_number != '' || $header_phone_number2 != '') { ?>
								<?php if ($revtheme_header_popupphone['status'] && !$revtheme_header_popupphone['under_phone'] || $dop_contacts) { ?>
								<button type="button" class="dropdown-toggle" data-toggle="dropdown" aria-expanded="true">
								<?php } ?>
									<span class="s22">
										<?php if ($header_phone_cod) { ?>
											<span class="telefon"><?php echo $header_phone_cod; ?></span> 
										<?php } ?>
										<?php echo $header_phone_number; ?><?php if ($header_phone_number2) { ?><br>
											<?php if ($header_phone_cod2) { ?>
												<span class="telefon"><?php echo $header_phone_cod2; ?></span> 
											<?php } ?>
											<?php echo $header_phone_number2; ?>
										<?php } ?>
										<?php if ($revtheme_header_popupphone['status'] && !$revtheme_header_popupphone['under_phone'] || $dop_contacts) { ?>
										<i class="fa fa-chevron-down"></i>
										<?php } ?>
									</span>
								<?php if ($revtheme_header_popupphone['status'] || $dop_contacts) { ?>	
								</button>
								<?php } ?>
							<?php } ?>
							<?php if ($revtheme_header_popupphone['status'] && !$revtheme_header_popupphone['under_phone'] || $dop_contacts) { ?>
								<ul class="dropdown-menu dropdown-menu-right dop_contss">
									<?php if ($revtheme_header_popupphone['status'] && !$revtheme_header_popupphone['under_phone']) { ?>
									<li>
										<a onclick="get_revpopup_phone();"><i class="fa fa-reply-all" aria-hidden="true"></i><?php echo $text_header_revpopup_phone; ?></a>
									</li>
									<?php } ?>
									<?php if ($revtheme_header_popupphone['status'] && !$revtheme_header_popupphone['under_phone'] && $dop_contacts) { ?>
									<li class="divider"></li>
									<?php } ?>
									<?php if ($dop_contacts) { ?>
										<?php foreach ($dop_contacts as $dop_contact) { ?>
											<?php if ($dop_contact['href']) { ?>
												<li><a href="<?php echo $dop_contact['href']; ?>"><span><i class="fa <?php echo $dop_contact['icon']; ?>" aria-hidden="true"></i><span><?php echo $dop_contact['number']; ?></span></span></a></li>
											<?php } else { ?>
												<li><span><i class="fa <?php echo $dop_contact['icon']; ?>" aria-hidden="true"></i><span><?php echo $dop_contact['number']; ?></span></span></li>
											<?php } ?>
										<?php } ?>
									<?php } ?>
								</ul>	
							<?php } ?>
						</div>
					</div>
					<?php if ($revtheme_header_popupphone['status'] && $revtheme_header_popupphone['under_phone']) { ?>
						<span class="header_under_phone"><a onclick="get_revpopup_phone();"><i class="fa fa-reply-all" aria-hidden="true"></i><?php echo $text_header_revpopup_phone; ?></a></span>
					<?php } ?>
				</div>
			</div>
		<?php } else { ?>
			<div class="hidden-xs hidden-sm bigsearch col-xs-12 col-sm-6 col-md-9"><?php echo $search; ?></div>
		<?php } ?>
		<div class="hidden-md hidden-lg mobsearch col-xs-12 col-sm-12"><?php echo $search; ?></div>
		</div>
	  </div>
	</div>  
	<!--noindex-->
	<div id="top3_links" class="clearfix hidden-md hidden-lg">
		<div class="container">
			<div class="row">
				<div class="top-links col-xs-12">
						<ul class="list-inline">
							<?php foreach ($informations2 as $information) { ?>
								<li><a href="<?php echo $information['href']; ?>" rel="nofollow"><?php echo $information['title']; ?></a></li>
							<?php } ?>
							<?php if ($revtheme_header_links2) { ?>
								<?php foreach ($revtheme_header_links2 as $revtheme_header_link2) { ?>
									<li><a href="<?php echo $revtheme_header_link2['link']; ?>" rel="nofollow"><?php echo $revtheme_header_link2['title']; ?></a></li>
								<?php } ?>
								<li><a href="/documents/price.pdf" target="_blank">Прайс-лист</a></li>
							<?php } ?>
						</ul>
				</div>
			</div>
		</div>
	</div>
	<!--/noindex-->
	<div id="top3" class="clearfix">
		<div class="container">
			<div class="row image_in_ico_row">
				<?php if ($amazon) { ?>
				<div class="col-xs-6 col-md-3">
					<?php echo $revmenu; ?>
				</div>
				<div class="top-links nav razmivcont hidden-xs hidden-sm col-md-6">
					<ul class="list-inline">
						<?php foreach ($informations2 as $information) { ?>
							<li><a href="<?php echo $information['href']; ?>"><?php echo $information['title']; ?></a></li>
						<?php } ?>
						<?php if ($revtheme_header_links2) { ?>
							<?php foreach ($revtheme_header_links2 as $revtheme_header_link2) { ?>
								<li><a href="<?php echo $revtheme_header_link2['link']; ?>"><?php echo $revtheme_header_link2['title']; ?></a></li>
							<?php } ?>
							<li><a href="/documents/price.pdf" target="_blank">Прайс-лист</a></li>
						<?php } ?>
					</ul>	
				</div>
				<?php } else { ?>
					<div class="col-xs-6 hidden-md hidden-lg">
						<div id="menu2_button" class="page-fader inhome">
							<div class="box-heading" data-toggle="offcanvas" data-target=".navmenu.mobcats" data-canvas="body"><i class="fa fa-bars"></i><?php echo $text_header_menu2_heading; ?><span class="icorightmenu"><i class="fa fa-chevron-down"></i></span></div>
						</div>
					</div>
					<div class="hidden-xs hidden-sm col-md-9">
						<nav id="menu">
							<div class="collapse navbar-collapse navbar-ex1-collapse">
							  <ul class="nav navbar-nav">
							    <?php if ($cats_status) { ?>
									<?php foreach ($categories as $category) { ?>
										<?php if ($category['children']) { ?>
											<li><a href="<?php echo $category['href']; ?>"><?php if ($category['category_image']) { echo $category['category_image']; } ?><?php echo $category['name']; ?><span class="icorightmenu"><i class="fa fa-chevron-down"></i></span></a>
											<span class="dropdown-toggle visible-xs visible-sm"><i class="fa fa-plus"></i><i class="fa fa-minus"></i></span>
											  <div class="mmmenu" <?php if ($image_in_ico) { echo 'style="position: initial"';} ?>>
												  <div class="dropdown-menu">
													<div class="dropdown-inner">
													<?php if ($image_in_ico) { ?>
														<div class="image_in_ico_<?php echo $category['category_id']; ?> refine_categories clearfix">
															<?php foreach ($category['children'] as $child) { ?>
																<a class="col-sm-2 col-lg-2" href="<?php echo $child['href']; ?>">
																	<img src="<?php echo $child['thumb']; ?>" title="<?php echo $child['name']; ?>" alt="<?php echo $child['name']; ?>" /><span><?php echo $child['name']; ?></span>
																</a>
															<?php } ?>
														</div>
													<?php } else { ?>
														<?php foreach (array_chunk($category['children'], ceil(count($category['children']) / $category['column'])) as $children) { ?>
															<ul class="list-unstyled <?php if ($category['column']) { echo 'column';} ?>">
															<?php foreach ($children as $child) { ?>
															<li><a href="<?php echo $child['href']; ?>"><?php if ($child['category_image']) { echo $child['category_image']; } ?><?php echo $child['name']; ?></a>
																<?php if ($tri_level && $child['children']) { ?>
																<span class="visible-xs visible-sm"><i class="fa fa-plus"></i><i class="fa fa-minus"></i></span>
																	<div class="dropdown-menu">
																	<div class="dropdown-inner">
																	<ul class="list-unstyled">
																	<?php foreach ($child['children'] as $child) { ?>
																		<li><a href="<?php echo $child['href']; ?>"><i class="fa fa-minus"></i><?php echo $child['name']; ?></a></li>
																	<?php } ?>
																	</ul>
																	</div>
																	</div>
																<?php } ?>
															</li>
															<?php } ?>
															</ul>
														<?php } ?>
													<?php } ?>  
													<?php if ($category['thumb2']) { ?>
														<img class="img_sub" src="<?php echo $category['thumb2']; ?>" alt="<?php echo $category['name']; ?>" />	
													<?php } ?>
													</div>
													</div>
												</div>
											</li>
										<?php } else { ?>
											<li><a href="<?php echo $category['href']; ?>"><?php echo $category['name']; ?></a></li>
										<?php } ?>
									<?php } ?>
								<?php } ?>
								<?php if ($manuf_status) { ?>
									<?php if ($categories_m) { ?>
										<?php if ($image_in_ico_m) { ?>
											<li><a href="<?php echo $url_revmenu_manufs; ?>"><?php echo $text_revmenu_manufs; ?><span class="icorightmenu"><i class="fa fa-chevron-down"></i></span></a>
											<span class="dropdown-toggle visible-xs visible-sm"><i class="fa fa-plus"></i><i class="fa fa-minus"></i></span>
											  <div class="mmmenu" style="position: initial">
													<div class="dropdown-menu">
														<div class="dropdown-inner">
															<div class="image_in_ico_manufacturers refine_categories clearfix">
																<?php foreach (array_chunk($categories_m, ceil(count($categories_m) / $n_column)) as $categorys) { ?>
																	<?php foreach ($categorys as $category) { ?>
																		<?php if ($category['manufacturer']) { ?>
																			<?php foreach ($category['manufacturer'] as $manufacturers) { ?>
																				<a class="col-sm-2 col-lg-2" href="<?php echo $manufacturers['href']; ?>">
																					<img src="<?php echo $manufacturers['thumb']; ?>" title="<?php echo $manufacturers['name']; ?>" alt="<?php echo $manufacturers['name']; ?>" /><span><?php echo $manufacturers['name']; ?></span>
																				</a>
																			<?php } ?>
																		<?php } ?>
																	<?php } ?>
																<?php } ?>
															</div>
														</div>
													</div>
												</div>
											</li>
										<?php } else { ?>
											<li><a href="<?php echo $url_revmenu_manufs; ?>"><?php echo $text_revmenu_manufs; ?><span class="icorightmenu"><i class="fa fa-chevron-down"></i></span></a>
											<span class="dropdown-toggle visible-xs visible-sm"><i class="fa fa-plus"></i><i class="fa fa-minus"></i></span>
											  <div class="mmmenu">
												  <div class="dropdown-menu">
													<div class="dropdown-inner">
														<?php foreach (array_chunk($categories_m, ceil(count($categories_m) / $n_column)) as $categorys) { ?>
															<ul class="list-unstyled">
																<?php foreach ($categorys as $category) { ?>
																	<li><span class="manuf_in_menu"><?php echo $category['name']; ?></span>
																		<?php if ($category['manufacturer']) { ?>
																			<span class="visible-xs visible-sm"><i class="fa fa-plus"></i><i class="fa fa-minus"></i></span>
																			<div class="dropdown-menu">
																				<div class="dropdown-inner">
																					<ul class="list-unstyled">
																					<?php foreach ($category['manufacturer'] as $manufacturers) { ?>
																						<li><a href="<?php echo $manufacturers['href']; ?>"><i class="fa fa-minus"></i><?php echo $manufacturers['name']; ?></a></li>
																					<?php } ?>
																					</ul>
																				</div>
																			</div>
																		<?php } ?>
																	</li>
																<?php } ?>
															</ul>
														<?php } ?>
													</div>
													</div>
												</div>
											</li>
										<?php } ?>
									<?php } ?>
								<?php } ?>
								<?php foreach ($informations2 as $information) { ?>
									<li><a href="<?php echo $information['href']; ?>"><?php echo $information['title']; ?></a></li>
								<?php } ?>
								<?php if ($revtheme_header_links2) { ?>
									<?php foreach ($revtheme_header_links2 as $revtheme_header_link2) { ?>
										<li><a href="<?php echo $revtheme_header_link2['link']; ?>"><?php echo $revtheme_header_link2['title']; ?></a></li>
									<?php } ?>
									<li><a href="/documents/price.pdf" target="_blank">Прайс-лист</a></li>
								<?php } ?>		
							  </ul>
							</div>
						</nav>
						<script type="text/javascript"><!--
						$(function () {
						  $("#menu .nav > li .mmmenu").mouseenter(function(){
								$('#pagefader').fadeIn(70);
								$('body').addClass('razmiv');
						   });
							$("#menu .nav > li .mmmenu").mouseleave(function(){
								$('#pagefader').fadeOut(70);
								$('body').removeClass('razmiv');
						   });
						});
						<?php if ($image_in_ico) { ?>
							$('#menu .nav > li .dropdown-menu').css('display', 'block');
							<?php foreach ($categories as $category) { ?>
								var div = '#menu .image_in_ico_<?php echo $category['category_id']; ?>.refine_categories > a span';
								var maxheight = 0;
								$(div).each(function(){
									$(this).removeAttr('style');
									if($(this).height() > maxheight) {
										maxheight = $(this).height();
									}
								});
								$(div).height(maxheight-17);
							<?php } ?>
							<?php if ($manuf_status) { ?>
								var div = '.image_in_ico_manufacturers.refine_categories span';
								var maxheight = 0;
								$(div).each(function(){
									$(this).removeAttr('style');
									if($(this).height() > maxheight) {
										maxheight = $(this).height();
									}
								});
								$(div).height(maxheight);
							<?php } ?>
							$('#menu .nav > li .dropdown-menu').css('display', 'none');
						<?php } ?>
						//--></script>
					</div>
				<?php } ?>
				<div class="razmivcont col-xs-6 col-md-3">
					<?php echo $cart; ?>
				</div>		
			</div>
		</div>
	</div>
</header>
<?php if (!$setting_all_settings['all_document_width'] && $setting_all_settings['all_document_h_f_width']) { ?>
<div id="all_document">
<?php } ?>
<section class="main-content">