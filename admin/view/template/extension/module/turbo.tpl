<?php echo $header; ?><?php echo $column_left; ?>
<div id="content">
  <div class="page-header">
    <div class="container-fluid">
      <div class="pull-right">
        <button type="submit" form="form-turbo" data-toggle="tooltip" title="<?php echo $button_save; ?>" class="btn btn-primary"><i class="fa fa-save"></i></button>
        <a href="<?php echo $cancel; ?>" data-toggle="tooltip" title="<?php echo $button_cancel; ?>" class="btn btn-default"><i class="fa fa-reply"></i></a></div>
      <h1><?php echo $heading_title; ?></h1>
      <ul class="breadcrumb">
        <?php foreach ($breadcrumbs as $breadcrumb) { ?>
        <li><a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a></li>
        <?php } ?>
      </ul>
    </div>
  </div>
  <div class="container-fluid">
    <?php if ($error_warning) { ?>
    <div class="alert alert-danger"><i class="fa fa-exclamation-circle"></i> <?php echo $error_warning; ?>
      <button type="button" class="close" data-dismiss="alert">&times;</button>
    </div>
    <?php } ?>
    <div class="panel panel-default">
      <div class="panel-heading">
        <h3 class="panel-title"><i class="fa fa-pencil"></i> <?php echo $text_edit; ?></h3>
      </div>
      <div class="panel-body">
        <form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data" id="form-turbo" class="form-horizontal">
          <div class="form-group">
            <label class="col-sm-2 control-label" for="input-status"><?php echo $entry_status; ?></label>
            <div class="col-sm-6">
              <select name="turbo_status" id="input-status" class="form-control">
                <?php if ($turbo_status) { ?>
                <option value="1" selected="selected"><?php echo $text_enabled; ?></option>
                <option value="0"><?php echo $text_disabled; ?></option>
                <?php } else { ?>
                <option value="1"><?php echo $text_enabled; ?></option>
                <option value="0" selected="selected"><?php echo $text_disabled; ?></option>
                <?php } ?>
              </select>
            </div>
			 <div class="col-sm-4">
			 <button id="clear_cache" class="btn-primary btn-lg" data-url="<?php echo $clear_href; ?>"><?php echo $text_clear; ?></button>
			 </div>
          </div>
		  <div class="col-sm-2"></div>
		  <div class="col-sm-10">
		  <ul class="nav nav-tabs nav-justified" id="turbotabs">
		      <li role="presentation" class="active"><a href="#basic" aria-controls="basic" role="tab" data-toggle="tab"><?php echo $text_basic;?></a></li>
			  <li role="presentation"><a href="#global"><?php echo $text_global;?></a></li>
			  <li role="presentation"><a href="#image"><?php echo $text_image;?></a></li>
			  <li role="presentation"><a href="#experimental"><?php echo $text_experimental;?></a></li>
		  <ul>
		  <div id="TurboTabContent" class="tab-content"> 
		  <div role="tabpanel" class="tab-pane active" id="basic">
		   <div class="form-group">
		   <div>
		   <div class="table-responsive">
		   <h2><?php echo $text_tab_basic_header;?></h2>
			  <table id="base_options" class="table">
				<thead>
				<tr>
				<td><?php echo $text_type;?></td>
					<td><input type="checkbox" id="select_all"></td>
				</tr>	
				</thead>
				<tbody>
				<tr>
				<td><?php echo $entry_top_menu;?></td>
				  <?php if ($turbo_topmenu) { ?>
					<td><input name="turbo_topmenu" type="checkbox" checked></td>
				 <?php } else { ?>
					<td><input name="turbo_topmenu" type="checkbox"></td>
				 <?php } ?>
				</tr>					
				<tr>
				<td><?php echo $entry_category_list;?></td>
				  <?php if ($turbo_subcategory) { ?>
					<td><input name="turbo_subcategory" type="checkbox" checked></td>
				 <?php } else { ?>
					<td><input name="turbo_subcategory" type="checkbox"></td>
				 <?php } ?>
				</tr>					
				<tr>
				<td><?php echo $entry_footer_information;?></td>
				  <?php if ($turbo_information) { ?>
					<td><input name="turbo_information" type="checkbox" checked></td>
				 <?php } else { ?>
					<td><input name="turbo_information" type="checkbox"></td>
				 <?php } ?>
				</tr>				
				<tr>
				<td><?php echo $entry_category_module;?></td>
				  <?php if ($turbo_category_module) { ?>
					<td><input name="turbo_category_module" type="checkbox" checked></td>
				 <?php } else { ?>
					<td><input name="turbo_category_module" type="checkbox"></td>
				 <?php } ?>
				</tr>
				<tr>				
				<td><?php echo $entry_bestseller_module;?></td>
				  <?php if ($turbo_bestseller_module) { ?>
					<td><input name="turbo_bestseller_module" type="checkbox" checked></td>
				 <?php } else { ?>
					<td><input name="turbo_bestseller_module" type="checkbox"></td>
				 <?php } ?>
				</tr>				
				<tr>				
				<td><?php echo $entry_special_module;?></td>
				  <?php if ($turbo_special_module) { ?>
					<td><input name="turbo_special_module" type="checkbox" checked></td>
				 <?php } else { ?>
					<td><input name="turbo_special_module" type="checkbox"></td>
				 <?php } ?>
				</tr>				
				<tr>				
				<td><?php echo $entry_latest_module;?></td>
				  <?php if ($turbo_latest_module) { ?>
					<td><input name="turbo_latest_module" type="checkbox" checked></td>
				 <?php } else { ?>
					<td><input name="turbo_latest_module" type="checkbox"></td>
				 <?php } ?>
				</tr>
				<tr>				
				<td><?php echo $entry_featured_module;?></td>
				  <?php if ($turbo_featured_module) { ?>
					<td><input name="turbo_featured_module" type="checkbox" checked></td>
				 <?php } else { ?>
					<td><input name="turbo_featured_module" type="checkbox"></td>
				 <?php } ?>
				</tr>				
				<tbody>	
			  </table>
		  </div>
		  </div>
		  </div>
		  </div>
		  <div class="tab-pane" id="global">
	      <div class="form-group">
		   <div>
		   <div class="table-responsive">
		   <h2><?php echo $text_tab_global;?></h2>
			  <table class="table">
				<thead>
				<tr>
				<td><?php echo $text_settings;?></td>
				</tr>	
				</thead>
				<tbody>				
				<tr>
				<td>
				<?php echo $entry_status; ?></td>
				  <?php if ($turbo_global_cache_status) { ?>
					<td><input name="turbo_global_cache_status" type="checkbox" checked></td>
				 <?php } else { ?>
					<td><input name="turbo_global_cache_status" type="checkbox"></td>
				 <?php } ?>
				</tr>					
				<tr>
				<td><?php echo $entry_cache_expires; ?></td>
				 <td>
				 <input type="text" name="turbo_global_cache_expires" value="<?php echo $turbo_global_cache_expires; ?>" placeholder="<?php echo $entry_cache_expires; ?>"  class="form-control" />
				 </td>
				</tr>					
				<tr>			
				<td><?php echo $entry_skipped_words; ?></td>
				 <td>
					<textarea name="turbo_skipped_words" rows="5" id="input-code" class="form-control"><?php echo $turbo_skipped_words; ?></textarea>
				 </td>
				</tr>	
				<tr>
				<td><?php echo $entry_mobile_detect; ?></td>
				  <?php if ($turbo_global_cache_mobile_detect) { ?>
					<td><input name="turbo_global_cache_mobile_detect" type="checkbox" checked></td>
				 <?php } else { ?>
					<td><input name="turbo_global_cache_mobile_detect" type="checkbox"></td>
				 <?php } ?>
				</tr>						
				<tr>
				<td><?php echo $entry_turborate_monitor; ?></td>
				  <?php if ($turbo_global_cache_monitor) { ?>
					<td><input name="turbo_global_cache_monitor" type="checkbox" checked></td>
				 <?php } else { ?>
					<td><input name="turbo_global_cache_monitor" type="checkbox"></td>
				 <?php } ?>
				</tr>				
				<tbody>	
			  </table>
		  </div>
		  </div>
		  </div>
		   </div>		   
		 <div class="tab-pane" id="image">	 
		    <div class="form-group">
		   <div>
		   <div class="table-responsive">
		   <h2><?php echo $text_tab_image; ?></h2>
		   <h4><?php echo $text_tab_image_h4; ?></h4>
			  <table class="table">
				<thead>
				<tr>
				<td><?php echo $text_settings;?></td>
				</tr>	
				</thead>
				<tbody>								
				<tr>
				<td><?php echo $entry_jpg_image;?></td>
				 <td>
				 <input type="text" name="turbo_global_jpg_image" value="<?php echo $turbo_global_jpg_image; ?>" placeholder="<?php echo $entry_jpg_image;?>"  class="form-control" />
				 </td>
				</tr>									
				<tr>
				<td><?php echo $entry_png_image;?></td>
				 <td>
				 <input type="text" name="turbo_global_png_image" value="<?php echo $turbo_global_png_image; ?>" placeholder="<?php echo $entry_png_image;?>"  class="form-control" />
				 </td>
				</tr>							
				<tbody>	
			  </table>
		  </div>		  
		  <div class="bg-primary" style="padding: 15px;"> 
		 <?php echo $text_tab_image_info;?>
		  </div>
		  </div>
		  </div>		  
		 </div>		 		   
		     <div class="tab-pane" id="experimental">
			  <div class="form-group">
				<div class="col-sm-10 col-xs-6">
					<?php echo $entry_tab_module;?>
				 </div>
				 <div class="col-sm-2 col-xs-6">
				  <?php if ($turbo_product_tab) { ?>
					<input name="turbo_product_tab" type="checkbox" checked>
				 <?php } else { ?>
					<input name="turbo_product_tab" type="checkbox">
				 <?php } ?>
			  </div>	
			 </div>				 
			 <div class="form-group">
				<div class="col-sm-10 col-xs-6">
					<?php echo $entry_сount_off;?>
				 </div>
				 <div class="col-sm-2 col-xs-6">
				  <?php if ($turbo_count_off) { ?>
					<input name="turbo_count_off" type="checkbox" checked>
				 <?php } else { ?>
					<input name="turbo_count_off" type="checkbox">
				 <?php } ?>
			  </div>	
			 </div>				 			 
			</div>				 
		 </div>  
        </form>
      </div>
      </div>
    </div>
  </div>
</div>
<script>
	$(document).ready( function() {
  
	$('#turbotabs a').click(function (e) {
		  e.preventDefault()
			 $(this).tab('show')
		})
	
	$('#turbotabs li:first-child a').ready(function (e) {
			 $(this).tab('show')
	})	

	$("#select_all").on('click', function() {
		$('#base_options [name*=\'turbo\']').prop('checked', this.checked);
	});
	
	

	
	$('#clear_cache').click(function (e) {
	  e.preventDefault();
			
		url_data = $(this).attr('data-url');
		
		$.ajax({
			url: url_data,
			type: "POST",
			dataType: "json",
			success: function(json) {

			
				if (json["error"]) {
					$(".cache-panel").remove();
					$("body").append("<div class=\"cache-panel alert alert-danger\" role=\"alert\">" + json["error"] +  "</div>");
				}

				if (json["success"]) {
					$(".alert").remove();
					$(".container-fluid:eq(1)").prepend('<div class="alert alert-success"><i class="fa fa-check-circle"></i> ' + json["success"] +  '<button type="button" class="close" data-dismiss="alert">×</button></div>');
				}
			}
		});
	});


});

</script>
<?php echo $footer; ?>