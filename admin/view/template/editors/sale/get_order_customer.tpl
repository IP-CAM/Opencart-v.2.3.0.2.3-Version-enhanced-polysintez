<tr>
 <td style="width: 1%;"><button data-toggle="tooltip" title="<?php echo $text_customer; ?>" class="btn btn-info btn-xs"><i class="fa fa-user fa-fw"></i></button></td>
 <td><?php if ($customer) { ?>
	<?php echo $firstname; ?> <?php echo $lastname; ?>
    <?php } else { ?>
    <?php echo $firstname; ?> <?php echo $lastname; ?>
    <?php } ?>
  </td>
</tr>
<tr>
  <td><button data-toggle="tooltip" title="<?php echo $text_customer_group; ?>" class="btn btn-info btn-xs"><i class="fa fa-group fa-fw"></i></button></td>
  <td><?php echo $customer_group; ?></td>
</tr>
<tr>
  <td><button data-toggle="tooltip" title="<?php echo $text_email; ?>" class="btn btn-info btn-xs"><i class="fa fa-envelope-o fa-fw"></i></button></td>
  <td><?php echo $email; ?></td>
</tr>
<?php if ($telephone) { ?>
<tr>
  <td><button data-toggle="tooltip" title="<?php echo $text_telephone; ?>" class="btn btn-info btn-xs"><i class="fa fa-phone fa-fw"></i></button></td>
  <td><?php echo $telephone; ?></td>
</tr>
<?php } ?>