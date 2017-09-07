<tr>
 <td style="width: 1%;"><button data-toggle="tooltip" title="<?php echo $text_customer; ?>" class="btn btn-info btn-xs"><i class="fa fa-user fa-fw"></i></button></td>
 <td>
   <?php if ($customer) { ?>
      <a href="<?php echo $customer; ?>" target="_blank"><?php echo $firstname; ?> <?php echo $lastname; ?></a>
      <?php } else { ?>
      <?php echo $firstname; ?> <?php echo $lastname; ?>
    <?php } ?>
  </td>
  <td><a onclick="updateOrderData('<?php echo $order_id; ?>', 'customer');" data-toggle="tooltip" title="<?php echo $button_edit; ?>" class="btn btn-primary btn-xs"><i class="fa fa-pencil fa-fw"></i></a></td>
</tr>
<tr>
  <td><button data-toggle="tooltip" title="<?php echo $text_customer_group; ?>" class="btn btn-info btn-xs"><i class="fa fa-group fa-fw"></i></button></td>
  <td><?php echo $customer_group; ?></td>
  <td style="width: 1%;"></td>
</tr>
<tr>
  <td><button data-toggle="tooltip" title="<?php echo $text_email; ?>" class="btn btn-info btn-xs"><i class="fa fa-envelope-o fa-fw"></i></button></td>
  <td><a href="mailto:<?php echo $email; ?>"><?php echo $email; ?></a></td>
  <td></td>
</tr>
<?php if ($telephone) { ?>
<tr>
  <td><button data-toggle="tooltip" title="<?php echo $text_telephone; ?>" class="btn btn-info btn-xs"><i class="fa fa-phone fa-fw"></i></button></td>
  <td><?php echo $telephone; ?></td>
  <td></td>
</tr>
<?php } ?>