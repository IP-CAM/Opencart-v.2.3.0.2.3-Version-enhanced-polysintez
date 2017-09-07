<?php
/*
 * Shoputils
 *
 * ПРИМЕЧАНИЕ К ЛИЦЕНЗИОННОМУ СОГЛАШЕНИЮ
 *
 * Этот файл связан лицензионным соглашением, которое можно найти в архиве,
 * вместе с этим файлом. Файл лицензии называется: LICENSE.2.3.x.RUS.TXT
 * Так же лицензионное соглашение можно найти по адресу:
 * https://opencart.market/LICENSE.2.3.x.RUS.TXT
 * 
 * =================================================================
 * OPENCART/ocStore 2.3.x ПРИМЕЧАНИЕ ПО ИСПОЛЬЗОВАНИЮ
 * =================================================================
 *  Этот файл предназначен для Opencart/ocStore 2.3.x. Shoputils не
 *  гарантирует правильную работу этого расширения на любой другой 
 *  версии Opencart/ocStore, кроме Opencart/ocStore 2.3.x. 
 *  Shoputils не поддерживает программное обеспечение для других 
 *  версий Opencart/ocStore.
 * =================================================================
*/
?>
<?php if ($type == 'voucher') { ?>
<div class="help-block" style="text-align:center;"><b><?php echo $entry_voucher_ft; ?></b></div>
<table class="table table-bordered table-hover table-striped">
    <tr><td><span class="help">{voucher_code}</span></td><td><span class="help left"><?php echo $text_voucher_code_ft; ?></span></td></tr>
    <tr><td><span class="help">{voucher_from_name}</span></td><td><span class="help left"><?php echo $text_voucher_from_name_ft; ?></span></td></tr>
    <tr><td><span class="help">{voucher_from_email}</span></td><td><span class="help left"><?php echo $text_voucher_from_email_ft; ?></span></td></tr>
    <tr><td><span class="help">{voucher_to_name}</span></td><td><span class="help left"><?php echo $text_voucher_to_name_ft; ?></span></td></tr>
    <tr><td><span class="help">{voucher_to_email}</span></td><td><span class="help left"><?php echo $text_voucher_to_email_ft; ?></span></td></tr>
    <tr><td><span class="help">{voucher_message}</span></td><td><span class="help left"><?php echo $text_voucher_message_ft; ?></span></td></tr>
    <tr><td><span class="help">{voucher_amount}</span></td><td><span class="help left"><?php echo $text_voucher_amount_ft; ?></span></td></tr>
    <tr><td><span class="help">{voucher_image}</span></td><td><span class="help left"><?php echo $text_voucher_image_ft; ?></span></td></tr>
    <tr><td><span class="help">{voucher_name}</span></td><td><span class="help left"><?php echo $text_voucher_name_ft; ?></span></td></tr>
    <tr><td><span class="help">{voucher_theme}</span></td><td><span class="help left"><?php echo $text_voucher_theme_ft; ?></span></td></tr>
</table>
<?php } ?>
<div class="help-block" style="text-align:center;"><b><?php echo $entry_general_ft; ?></b></div>
<table class="table table-bordered table-hover table-striped">
    <tr><td><span class="help">{order_id}</span></td><td><span class="help left"><?php echo $text_order_id_ft; ?></span></td></tr>
    <tr><td><span class="help">{order_status}</span></td><td><span class="help left"><?php echo $text_order_status_ft; ?></span></td></tr>
    <tr><td><span class="help">{order_link}</span></td><td><span class="help left"><?php echo $text_order_link_ft; ?></span></td></tr>
    <tr><td><span class="help">{comment}</span></td><td><span class="help left"><?php echo $text_comment_ft; ?></span></td></tr>
    <tr><td><span class="help">{admin_comment}</span></td><td><span class="help left"><?php echo $text_admin_comment_ft; ?></span></td></tr>
    <tr><td><span class="help">{ip}</span></td><td><span class="help left"><?php echo $text_ip_ft; ?></span></td></tr>
    <tr><td><span class="help">{date_added}</span></td><td><span class="help left"><?php echo $text_date_added_ft; ?></span></td></tr>
    <tr><td><span class="help">{date_modified}</span></td><td><span class="help left"><?php echo $text_date_modified_ft; ?></span></td></tr>
    <tr><td><span class="help">{firstname}</span></td><td><span class="help left"><?php echo $text_firstname_ft; ?></span></td></tr>
    <tr><td><span class="help">{lastname}</span></td><td><span class="help left"><?php echo $text_lastname_ft; ?></span></td></tr>
    <tr><td><span class="help">{group}</span></td><td><span class="help left"><?php echo $text_group_ft; ?></span></td></tr>
    <tr><td><span class="help">{email}</span></td><td><span class="help left"><?php echo $text_email_ft; ?></span></td></tr>
    <tr><td><span class="help">{telephone}</span></td><td><span class="help left"><?php echo $text_telephone_ft; ?></span></td></tr>
    <tr><td><span class="help">{products}</span></td><td><span class="help left"><?php echo $text_products_ft; ?></span></td></tr>
    <tr><td><span class="help">{totals}</span></td><td><span class="help left"><?php echo $text_totals_ft; ?></span></td></tr>
    <tr><td><span class="help">{total}</span></td><td><span class="help left"><?php echo $text_total_ft; ?></span></td></tr>
    <tr><td><span class="help">{shipping_total}</span></td><td><span class="help left"><?php echo $text_shipping_total_ft; ?></span></td></tr>
    <tr><td><span class="help">{product_first}</span></td><td><span class="help left"><?php echo $text_product_first_ft; ?></span></td></tr>
    <tr><td><span class="help">{product_last}</span></td><td><span class="help left"><?php echo $text_product_last_ft; ?></span></td></tr>
</table>
<div class="help-block" style="text-align:center;"><b><?php echo $entry_payment_ft; ?></b></div>
<table class="table table-bordered table-hover table-striped">
    <tr><td><span class="help">{payment_firstname}</span></td><td><span class="help left"><?php echo $text_payment_firstname_ft; ?></span></td></tr>
    <tr><td><span class="help">{payment_lastname}</span></td><td><span class="help left"><?php echo $text_payment_lastname_ft; ?></span></td></tr>
    <tr><td><span class="help">{payment_company}</span></td><td><span class="help left"><?php echo $text_payment_company_ft; ?></span></td></tr>
    <tr><td><span class="help">{payment_address_1}</span></td><td><span class="help left"><?php echo $text_payment_address_1_ft; ?></span></td></tr>
    <tr><td><span class="help">{payment_address_2}</span></td><td><span class="help left"><?php echo $text_payment_address_2_ft; ?></span></td></tr>
    <tr><td><span class="help">{payment_city}</span></td><td><span class="help left"><?php echo $text_payment_city_ft; ?></span></td></tr>
    <tr><td><span class="help">{payment_postcode}</span></td><td><span class="help left"><?php echo $text_payment_postcode_ft; ?></span></td></tr>
    <tr><td><span class="help">{payment_country}</span></td><td><span class="help left"><?php echo $text_payment_country_ft; ?></span></td></tr>
    <tr><td><span class="help">{payment_zone}</span></td><td><span class="help left"><?php echo $text_payment_zone_ft; ?></span></td></tr>
    <tr><td><span class="help">{payment_method}</span></td><td><span class="help left"><?php echo $text_payment_method_ft; ?></span></td></tr>
</table>
<div class="help-block" style="text-align:center;"><b><?php echo $entry_shipping_ft; ?></b></div>
<table class="table table-bordered table-hover table-striped">
    <tr><td><span class="help">{shipping_firstname}</span></td><td><span class="help left"><?php echo $text_shipping_firstname_ft; ?></span></td></tr>
    <tr><td><span class="help">{shipping_lastname}</span></td><td><span class="help left"><?php echo $text_shipping_lastname_ft; ?></span></td></tr>
    <tr><td><span class="help">{shipping_company}</span></td><td><span class="help left"><?php echo $text_shipping_company_ft; ?></span></td></tr>
    <tr><td><span class="help">{shipping_address_1}</span></td><td><span class="help left"><?php echo $text_shipping_address_1_ft; ?></span></td></tr>
    <tr><td><span class="help">{shipping_address_2}</span></td><td><span class="help left"><?php echo $text_shipping_address_2_ft; ?></span></td></tr>
    <tr><td><span class="help">{shipping_city}</span></td><td><span class="help left"><?php echo $text_shipping_city_ft; ?></span></td></tr>
    <tr><td><span class="help">{shipping_postcode}</span></td><td><span class="help left"><?php echo $text_shipping_postcode_ft; ?></span></td></tr>
    <tr><td><span class="help">{shipping_country}</span></td><td><span class="help left"><?php echo $text_shipping_country_ft; ?></span></td></tr>
    <tr><td><span class="help">{shipping_zone}</span></td><td><span class="help left"><?php echo $text_shipping_zone_ft; ?></span></td></tr>
    <tr><td><span class="help">{shipping_method}</span></td><td><span class="help left"><?php echo $text_shipping_method_ft; ?></span></td></tr>
</table>
<?php if ($simple_fields) { ?>
<div class="help-block" style="text-align:center;"><b><?php echo $entry_simple_fields_ft; ?></b></div>
<table class="table table-bordered table-hover table-striped">
    <?php foreach ($simple_fields as $id => $value) { ?>
    <tr><td><span class="help"><?php echo $id; ?></span></td><td><span class="help left"><?php echo $value; ?></span></td></tr>
    <?php } ?>
</table>
<?php } ?>
<?php if ($type == 'update_order') { ?>
<div class="help-block" style="text-align:center;"><b><?php echo $entry_others_ft; ?></b></div>
<table class="table table-bordered table-hover table-striped">
    <tr><td><span class="help">{trackcode}</span></td><td><span class="help left"><?php echo $text_trackcode_ft; ?></span></td></tr>
    <tr><td><span class="help">{trackcode_link}</span></td><td><span class="help left"><?php echo $text_trackcode_link_ft; ?></span></td></tr>
    <tr><td><span class="help">{trackcode_link2}</span></td><td><span class="help left"><?php echo $text_trackcode_link2_ft; ?></span></td></tr>
</table>
<?php } ?>
