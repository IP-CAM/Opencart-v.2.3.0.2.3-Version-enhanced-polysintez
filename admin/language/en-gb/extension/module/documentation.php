<?php
// Heading
$_['meta_title']            = 'Crear. File Downloads';
$_['heading_title']         = '<span style="color:green;font-weight:bold;">Crear.</span> File Downloads';

// Text
$_['text_module']           = 'Modules';
$_['text_success']          = 'Success: You have modified File Downloads module!';
$_['text_edit']             = 'Edit File Downloads Module';
$_['text_upload']           = 'File was successfully uploaded!';
$_['text_product_search']   = 'Search';
$_['text_file_filter']      = 'Filter';
$_['text_success_link']     = 'Success: Documents linked to product!';
$_['text_success_unlink']   = 'Success: Documents unlinked to product!';
$_['text_success_delete']   = 'Success: Documents deleted!';
$_['text_document_links']   = 'Total links: %d';
$_['text_files_processed']  = 'New files processed: %d';
$_['text_links_deleted']    = 'Broken links removed: %d';
$_['text_files_deleted']    = 'Unused files removed: %d';
$_['text_temp_deleted']     = 'Temporary files removed: %d';
$_['text_loading']          = '<i class=\'fa fa-spinner fa-spin\'></i>';
$_['text_file_exists']      = ' - OK';
$_['text_no_file']          = ' - File not found!';
$_['text_new_doc']          = 'Create New Document';
$_['text_edit_doc']         = 'Edit Document';
$_['text_not_logged']       = 'Not registered';
$_['text_all']              = '--- All ---';
$_['text_tab_name']         = 'Downloads';
$_['text_default_folder']   = 'Miscellaneous';
$_['text_on_top']           = 'Всегда первая';
$_['text_on_bot']           = 'Всегда последняя';

// Column
$_['column_name']           = 'Name';
$_['column_mask']           = 'Mask';
$_['column_date_added']     = 'Date modified';
$_['column_folders']        = 'Folders';
$_['column_customer_group'] = 'Customer Group';
$_['column_action']         = 'Action';
$_['column_folder_name']    = 'Folder Name';
$_['column_folder_class']   = 'CSS-class';
$_['column_folder_icon']    = 'FA Icon';
$_['column_folder_order']   = 'Sort Order';
$_['column_folder_status']  = 'Active';

// Entry
$_['entry_status']          = 'Status';
$_['entry_check_mime']      = 'Check MIME types';
$_['entry_delete_files']    = 'Delete file on document delete action';
$_['entry_name']            = 'Name';
$_['entry_filename']        = 'Filename';
$_['entry_mask']            = 'Mask';
$_['entry_products']        = 'Linked products';
$_['entry_customer_group']  = 'Customer Group';
$_['entry_product_search']  = 'Product';
$_['entry_file_filter']     = 'Documents';
$_['entry_filter_linked']   = 'Linked';
$_['entry_service_action']  = 'Service';
$_['entry_storage_dir']     = 'Work folder';
$_['entry_tmp_dir']         = 'Manual upload folder';
$_['entry_show_tab']        = 'Always show downloads on product page';
$_['entry_restricts']       = 'Restrict downloads for';
$_['entry_tab_name']        = 'Block Title';
$_['entry_folders']         = 'Folders';
$_['entry_default_folder']  = 'Default folder Title';
$_['entry_default_fclass']  = 'Default folder CSS-class';
$_['entry_default_ficon']   = 'Default folder FontAwesome Icon';
$_['entry_folder_title']    = 'Folder Title';
$_['entry_folder_class']    = 'Folder CSS-class';
$_['entry_folder_icon']     = 'Folder FontAwesome Icon';
$_['entry_folder_order']    = 'Sort Order';
$_['entry_link_folders']    = 'Show in folders';
$_['entry_public_link']     = 'Show document public link';
$_['entry_show_tab_icon']   = 'Show tab icon';
$_['entry_tab_fa_icon']     = 'Tab FA Icon';

// Tabs
$_['tab_list']              = 'Documents list';
$_['tab_settings']          = 'Settings';
$_['tab_service']           = 'Service';

// Buttons
$_['button_apply']          = 'Apply';
$_['button_return']         = 'Back to modules list';
$_['button_upload']         = 'Upload new file';
$_['button_link']           = 'Link selected documents to product';
$_['button_unlink']         = 'Unlink selected documents to product';
$_['button_clear_filter']   = 'Reset';
$_['button_upload_local']   = 'Process new files';
$_['button_remove_links']   = 'Delete broken links';
$_['button_remove_files']   = 'Delete unused files';
$_['button_download_link']  = 'Download Document';
$_['button_folder_remove']  = 'Delete folder';
$_['button_folder_add']     = 'Add folder';

// Help
$_['help_product_filter']   = 'Autocomplete. Select a product';
$_['help_name']             = 'Name of the anchor to file';
$_['help_filename']         = 'Real file name on the server';
$_['help_mask']             = 'File name displayed to client';
$_['help_products']         = 'Choose products to link to this document';
$_['help_customer_group']   = 'Available to all if not selected';
$_['help_storage_folder']   = 'Don\'t upload files to this folder directly, use interface or "Manual upload folder" instead';
$_['help_manuad_upload']    = 'Optional: Upload files by FTP to this folder and then use "Process new files" button at "Service" tab';
$_['help_folder_icon']      = 'Go to <a href="https://fortawesome.github.io/Font-Awesome/icons/" target="_blank">Font Awesome Icons</a> and write in field the name of selected icon';
$_['help_link_folders']     = 'Will be shown in Default Folder if not selected';

// Error
$_['error_permission']      = 'Warning: You do not have permission to modify File Downloads module!';
$_['error_link']            = 'Warning: You should select a product and document(-s)!';
$_['error_delete']          = 'Warning: You should select document(-s)!';
$_['error_name']            = 'Document Name must be between 3 and 128 characters!';
$_['error_upload']          = 'Upload required!';
$_['error_upload_size']     = 'Server error!';
$_['error_local_upload']    = 'Process errors (skipped):';
$_['error_run_locked']      = 'Processing now. Try later.';
$_['error_filename']        = 'Filename must be between 3 and 128 characters!';
$_['error_exists']          = 'File does not exist!';
$_['error_mask']            = 'Mask must be between 3 and 128 characters!';
$_['error_filetype']        = 'Invalid file type!';
$_['error_tmpdir_exists']   = 'Manual upload folder not exists!';
$_['error_storage_exists']  = 'Work folder not exists!';
$_['error_tmpdir_read']     = 'No access to read Manual upload folder!';
$_['error_tmpdir_write']    = 'No access to write into Manual upload folder!';
$_['error_storage_read']    = 'No access to read Work folder!';
$_['error_storage_write']   = 'No access to write into Work folder!';
$_['error_mkdir_storage']   = 'Failed to create Work folder!';
$_['error_mkdir_tmpdir']    = 'Failed to create Manual upload folder!';

//Confirm
$_['confirm_folder_del']    = 'Do you want to delete Folder?';