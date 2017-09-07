<?php if ($action == 'loadjs' && isset($product_id) && (int)$product_id>0) { ?>
<?php

$selectorTab			= "$('#content .nav-tabs')";
$selectorContainer	= "$('#content .tab-content')";

?>
	<script type="text/javascript">
	$(document).ready(function() {
		$.ajax({
			url: '<?php echo str_replace('&amp;', '&', $product_url); echo (strpos($product_url, '?')===false)?'?':'&'; ?>_rnd='+Math.random().toString(36).substr(2),
			dataType: 'json',
			method: 'post',
			data: 'cr_documentation_action=load_list',
			beforeSend: function() {
				if (<?php echo $selectorTab; ?>.find('#tab-documentation-li').length===0) {
					documentationTab = $('<li>').attr('id','tab-documentation-li')
							<?php if (!$show_tab_always) { ?>
							.hide()
							<?php } ?>
							.append($('<a>')
								.attr('href','#tab-documentation')
								.attr('data-toggle','tab')
								.append($('<i>')
									.attr('id','tab-documentation-icon')
									<?php if ($tab_documentation_icon_default) { ?>
									.addClass('fa fa-fw fa-<?php echo $tab_documentation_icon_default; ?>')
									<?php } ?>
									)
								.append($('<span>')
									.attr('id','tab-documentation-title')
									.html('<?php echo ($tab_documentation_icon_default) ? '&nbsp;&nbsp;' : '';?><?php echo ($tab_documentation_title)?$tab_documentation_title:$tab_documentation_title_default; ?>')
									.addClass('hidden-xs'))
								.append('&nbsp;')
								.append($('<span>')
									.attr('id','tab-documentation-count')
									.html('<i class="fa fa-spinner fa-spin"></i>'))
								)
							;
					<?php echo $selectorTab; ?>.append(documentationTab);
				}
				if (<?php echo $selectorContainer; ?>.find('#tab-documentation').length===0) {
					documentationTab = $('<div>')
										.attr('id','tab-documentation')
										.addClass('tab-pane')
										.html('<?php echo $text_loading; ?>');
					<?php echo $selectorContainer; ?>.append(documentationTab);
				}
			},
			success: function(json) {
				if (json.documentation) {
					<?php /*
					if you want to show SUM of documents in folders (not distinct)
					use
					json.count_all
					instead
					json.count
					*/ ?>
					if (!<?php echo $selectorTab; ?>.find('#tab-documentation-li').is(':visible') && json.count_all>0) {
						<?php echo $selectorTab; ?>.find('#tab-documentation-li').show();
					}
					if (json.tab_icon) {
						<?php echo $selectorTab; ?>.find('#tab-documentation-icon').replaceWith('<i id="tab-documentation-icon" class="fa fa-fw fa-' + json.tab_icon + '"></i>');
					}
					if (json.tab_title) {
						tab_title = json.tab_title;
						if (json.tab_icon) {
							tab_title = '&nbsp;&nbsp;' + tab_title;
						}
						<?php echo $selectorTab; ?>.find('#tab-documentation-title').html(tab_title);
					}
					<?php echo $selectorTab; ?>.find('#tab-documentation-count').text('('+json.count_all+')');
					<?php echo $selectorContainer; ?>.find('#tab-documentation').html(json.documentation);
				}
			}
		});
	});
	</script>
	<style type="text/css">
		.docext {
			position: relative;
			padding: 8px 8px 8px 46px;
			display: block;
		}
		.docext:before {
			content: "\f0f6";
			font-family: 'FontAwesome';
			position: absolute;
			margin-top: -6px;
			margin-left: -34px;
			font-size: 28px;
		}
		.docext-pdf:before {
			content: "\f1c1";
		}
		.docext-doc:before,
		.docext-docx:before {
			content: "\f1c2";
		}
		.docext-xls:before,
		.docext-xlsx:before,
		.docext-csv:before {
			content: "\f1c3";
		}
		.docext-ppt:before {
			content: "\f1c4";
		}
		.docext-jpg:before,
		.docext-jpeg:before,
		.docext-png:before,
		.docext-gif:before,
		.docext-bmp:before,
		.docext-psd:before,
		.docext-ico:before,
		.docext-pcx:before,
		.docext-pbm:before,
		.docext-ppm:before,
		.docext-raw:before,
		.docext-tga:before,
		.docext-tif:before {
			content: "\f1c5";
		}
		.docext-7z:before,
		.docext-arj:before,
		.docext-gz:before,
		.docext-rar:before,
		.docext-tar:before,
		.docext-zip:before {
			content: "\f1c6";
		}
		.docext-wav:before,
		.docext-mp3:before {
			content: "\f1c7";
		}
		.docext-avi:before,
		.docext-mp4:before {
			content: "\f1c8";
		}
		.docext-htm:before,
		.docext-html:before,
		.docext-xml:before,
		.docext-fb2:before,
		.docext-css:before,
		.docext-js:before,
		.docext-c:before,
		.docext-vbs:before,
		.docext-sh:before {
			content: "\f1c9";
		}
		.docext-exe:before,
		.docext-msi:before {
			content: "\f016";
		}

		.docext-container .title {
			font-size: 120%;
		}

		.docext-container .labels {
			font-size: 95%;
		}

		.docext-container .labels {
			font-size: 95%;
		}
		.docext-container .label {
			display: inline-block;
			padding: .2em .4em;
		}
		.docext-container .absolute {
			position: absolute;
			margin-left: 7px;
			top: 35px;
		}
		.doc-lnk {
			display: block;
		}
		.table>tbody>tr>td.docext-container {
			padding: 0;
			position: relative;
		}
		#tab-documentation .fa {
			font-size: inherit;
		}
		#tab-documentation .panel-group .panel-heading {
			cursor: pointer;
		}
		#tab-documentation .panel-group .panel-heading .panel-title {
			font-size: 13px;
		}
		#tab-documentation .panel-group .panel-heading+.panel-collapse>.panel-body {
			padding: 5px 0 5px;
		}
		#tab-documentation .panel-group .panel-heading+.panel-collapse>.panel-body .table>tbody>tr:first-child>td {
			border-top: none;
		}
		#tab-documentation .panel-collapse>.panel-body .table {
			margin-bottom: 0;
		}
		#tab-documentation .panel-default>.panel-heading .badge {
			font-size: 0.7em;
			padding: 2px 5px;
			margin: -2px 0 0 3px;
			background-color: #23a1d1;
		}
		td.noleftborder {
			border-left: none!important;
		}
		td.norightborder {
			border-right: none!important;
		}
		tr[data-documentation-id] {
			cursor: pointer;
		}
		tr[data-documentation-id]:hover a {
			color: #23527c;
		}
		#tab-documentation .panel-heading[aria-expanded="false"] .docfolder-caret:before {
			content: "\f0d7";
		}
		#tab-documentation .panel-heading[aria-expanded="true"] .docfolder-caret:before {
			content: "\f0d8";
		}

	</style>
<?php } elseif ($action == 'loadtabcontent' && isset($documentationRows) && $documentationRows && $folders) { ?>
	<?php if (count($folders)>1) { ?>
	<div class="panel-group" id="files-accordion" role="tablist" aria-multiselectable="true">
		<?php $f = 0; foreach($folders as $folderData) { ?>
		<div class="panel panel-default">
			<div class="panel-heading" role="tab" id="heading-folder-<?php echo $folderData['folder_id']; ?>" data-toggle="collapse" data-parent="#files-accordion" data-target="#collapse-folder-<?php echo $folderData['folder_id']; ?>" aria-expanded="<?php echo ($f == 0)?'true':'false'; ?>" aria-controls="collapse-folder-<?php echo $folderData['folder_id']; ?>">
				<h4 class="panel-title folder-<?php echo ($folderData['data']['class'])?$folderData['data']['class']:'simple'; ?>"><i class="fa fa-fw fa-<?php echo ($folderData['data']['icon'])?$folderData['data']['icon']:'bars'; ?>"></i> <?php echo $folderData['data']['name']; ?> <span class="badge"><?php echo count($folderData['documents']); ?></span><i class="fa docfolder-caret fa-pull-right"></i></h4>
			</div>
		<div id="collapse-folder-<?php echo $folderData['folder_id']; ?>" class="panel-collapse collapse <?php echo ($f == 0)?'in':''; ?>" role="tabpanel" aria-labelledby="heading-folder-<?php echo $folderData['folder_id']; ?>">
			<div class="panel-body table-responsive">
			<table class="table table-striped table-borderless documentation-list">
				<tbody>
			<?php foreach ($folderData['documents'] as $documentation_id) { ?>
			<?php 	$documentation = $documentationRows[$documentation_id]; ?>
					<tr data-documentation-id="<?php echo $documentation_id; ?>">
						<td class="docext-container norightborder documentation-download"><span class="label label-info absolute"><?php echo $documentation['ext']; ?></span><a <?php echo ($documentation['href'])?'href="'.$documentation['href'].'" target="_blank"':''; ?> class="doc-lnk docext docext-<?php echo $documentation['ext']; ?>"><div class="title"><?php echo $documentation['title']; ?></div><div class="labels"><span class="label label-default"><?php echo $documentation['date_modified_short']; ?></span> <span class="label label-success"><?php echo $documentation['size']; ?></span></div></a></td>
						<td class="text-right noleftborder documentation-download">
							<a <?php echo ($documentation['href'])?'href="'.$documentation['href'].'" target="_blank"':''; ?> class="doc-lnk">
								<div class="btn-group">
									<button type="button" class="btn btn-primary btn-sm"><i class="fa fa-download"></i><span class="hidden-xs hidden-sm"> <?php echo $button_download; ?></span></button>
								</div>
							</a>
						</td>
					</tr>
			<?php } ?>
				</tbody>
			</table>
			</div>
		</div>
		</div>
		<?php $f++; } ?>
	</div>
	<?php } else { ?>
		<?php foreach($folders as $folderData) { ?>
			<div class="table-responsive">
			<table class="table table-striped table-bordered documentation-list">
				<tbody>
			<?php foreach ($folderData['documents'] as $documentation_id) { ?>
			<?php 	$documentation = $documentationRows[$documentation_id]; ?>
					<tr data-documentation-id="<?php echo $documentation_id; ?>">
						<td class="docext-container norightborder documentation-download"><span class="label label-info absolute"><?php echo $documentation['ext']; ?></span><a <?php echo ($documentation['href'])?'href="'.$documentation['href'].'" target="_blank"':''; ?> class="doc-lnk docext docext-<?php echo $documentation['ext']; ?>"><div class="title"><?php echo $documentation['title']; ?></div><div class="labels"><span class="label label-default"><?php echo $documentation['date_modified_short']; ?></span> <span class="label label-success"><?php echo $documentation['size']; ?></span></div></a></td>
						<td class="text-right noleftborder documentation-download">
							<a <?php echo ($documentation['href'])?'href="'.$documentation['href'].'" target="_blank"':''; ?> class="doc-lnk">
								<div class="btn-group">
									<button type="button" class="btn btn-primary btn-sm"><i class="fa fa-download"></i><span class="hidden-xs hidden-sm"> <?php echo $button_download; ?></span></button>
								</div>
							</a>
						</td>
					</tr>
			<?php } ?>
				</tbody>
			</table>
			</div>
		<?php } ?>
	<?php } ?>
	<script type="text/javascript">
		$(document).ready(function() {
			$('.doc-lnk').on('click',function(e){
				e.preventDefault();
			});
			$('.documentation-download').on('click',function(){
				var documentation_id = $(this).closest('tr').data('documentation-id');
				$('<form>')
				.attr('id','documentation-download-form')
				.attr('method','POST')
				.attr('target','_blank')
				.attr('action','<?php echo str_replace('&amp;', '&', $product_url); ?>')
				.append($("<input>")
					.attr("type", "hidden")
					.attr("name", "cr_documentation_action")
					.val("download")
				)
				.append($("<input>")
					.attr("type", "hidden")
					.attr("name", "documentation_id")
					.val(documentation_id)
				)
				.appendTo('body').submit().remove();
			});
		});
	</script>
<?php } elseif ($action == 'loadtabcontent' && isset($text_no_docs)) { ?>
	<div class="table-responsive">
		<table class="table table-striped table-bordered documentation-list">
			<tbody>
				<tr>
					<td>
						<?php echo $text_no_docs; ?>
					</td>
				</tr>
			</tbody>
		</table>
	</div>
<?php } ?>
