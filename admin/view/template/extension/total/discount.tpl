<?php echo $header; ?><?php echo $column_left; ?>
<div id="content">
    <div class="page-header">
        <div class="container-fluid">
            <div class="pull-right">
                <button type="submit" form="form-discount" data-toggle="tooltip" title="<?php echo $button_save; ?>" class="btn btn-primary"><i class="fa fa-save"></i></button>
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
        <form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data" id="form-discount" class="form-horizontal">
            <table class='table table-bordered'>
                <thead>
                    <tr>
						<td><?= $entry_incentive_program;?></td>
                        <td><?= $entry_from_summ;?></td>
                        <td><?= $entry_to_summ;?></td>
                        <td><?= $entry_discount_value;?></td>
                        <td><?= $entry_discount_type;?></td>
						<td><?= $entry_customer_group;?></td>
                        <td><?= $entry_delete_discount;?></td>
						
                    </tr>
                </thead>
                <tbody>
                    <?php
                    $len=count($discount_value);
                    for($i=0;$i<$len;$i++):
                    ?>
                    <tr>
					    <td>
                            <select class='form-control' name='discount_incentive_program[]'>
                                <option value='accumulation' <?php if($discount_incentive_program[$i]=='accumulation') echo $html_option_selected;;?>><?= $entry_incentive_program_accamulation;?></option>
                                <option value='summ_current_order' <?php if($discount_incentive_program[$i]=='summ_current_order') echo $html_option_selected;;?>><?= $entry_incentive_program_summ_current_order;?>
                                </option>
                            </select>
                        </td>
                        <td><input class='form-control' name='discount_from_summ[]' value='<?= $discount_from_summ[$i];?>'></td>
                        <td><input class='form-control' name='discount_to_summ[]' value='<?= $discount_to_summ[$i];?>'></td>
                        <td><input class='form-control' name='discount_value[]' value='<?= $discount_value[$i];?>'></td>
                        <td>
                            <select class='form-control' name='discount_type[]'>
                                <option value='precent' <?php if($discount_type[$i]=='precent') echo $html_option_selected;;?>><?= $entry_discount_type_precent;?></option>
                                <option value='fixed_summ' <?php if($discount_type[$i]=='fixed_summ') echo $html_option_selected;;?>><?= $entry_discount_type_fixed_summ;?>
                                </option>
                            </select>
                        </td>
						<td>
                            <select class='form-control' name='discount_customer_group[]'>
							<option value='all' 
							<?php
								if($discount_customer_group[$i]=='all')
									echo $html_option_selected;
								?>>
							<?php echo $text_all_group;?>	
							</option>
							
							<option value='guests' 
							<?php
								if($discount_customer_group[$i]=='guests')
									echo $html_option_selected;
								?>>
							<?php echo $text_guests;?>	
							</option>
							
                            <?php foreach($customer_groups as $group):?>
								<option value='<?= $group['customer_group_id'];?>'
								<?php
									if($discount_customer_group[$i]==$group['customer_group_id'])
										echo $html_option_selected;
								?>>
								<?= $group['name'];?></option>
							<?php endforeach;?>
                            </select>
                        </td>
                        <td><div  class='text-center' onclick="removeRow(this);"><i class="fa fa-times fa-2x" aria-hidden="true"></i></div></td>
                    </tr>

                    <?php endfor;?>
                </tbody>
                <tfoot>
                    <tr>
                        <td colspan='7' class='text-center'><div onclick='addRow(this);'><i class="fa fa-plus-circle fa-2x" aria-hidden="true"></i></div></td>
                    </tr>
                </tfoot>
            </table>

            <div class="form-group">
                <label class="col-sm-2 control-label" for="discount-status"><?php echo $entry_status; ?></label>
                <div class="col-sm-10">
                    <select name="discount_status" id="discount-status" class="form-control">
                        <?php if ($discount_status) { ?>
                        <option value="1" selected="selected"><?php echo $text_enabled; ?></option>
                        <option value="0"><?php echo $text_disabled; ?></option>
                        <?php } else { ?>
                        <option value="1"><?php echo $text_enabled; ?></option>
                        <option value="0" selected="selected"><?php echo $text_disabled; ?></option>
                        <?php } ?>
                    </select>
                </div>
            </div>
            <div class="form-group">
                <label class="col-sm-2 control-label" for="discount_exclude_ids"><?php echo $entry_exclude_ids; ?></label>
                <div class="col-sm-10">
                    <input type="text" name="discount_exclude_ids" value="<?php echo $discount_exclude_ids; ?>" id="discount_exclude_ids" class="form-control" />
                </div>
            </div>
            <div class="form-group">
                <label class="col-sm-2 control-label" for="discount_promotional_items"><?php echo $entry_exclude_promotional_items; ?></label>
                <div class="col-sm-10">
                    <input type="checkbox" name="discount_promotional_items" id="discount_promotional_items" class="form-control" 
                    <?php if($discount_promotional_items)
                        echo "checked";
                    ; ?>
                    />
                </div>
            </div>
            <div class="form-group">
                <label class="col-sm-2 control-label" for="discount-sort-order"><?php echo $entry_sort_order; ?></label>
                <div class="col-sm-10">
                    <input type="text" name="discount_sort_order" value="<?php echo $discount_sort_order; ?>" id="discount-sort-order" class="form-control" />
                </div>
            </div>
        </form>
    </div>

</div>
<script>
    function addRow(el)
    {
        $(el).parents('table').find('tbody').append("<tr><td><select class='form-control' name='discount_incentive_program[]'><option value='accumulation'><?= $entry_incentive_program_accamulation;?></option><option value='summ_current_order'><?= $entry_incentive_program_summ_current_order;?></option></select></td><td><input class='form-control' name='discount_from_summ[]'></td><td><input class='form-control' name='discount_to_summ[]' ></td><td><input class='form-control' name='discount_value[]'></td><td><select class='form-control' name='discount_type[]'><option value='precent'><?= $entry_discount_type_precent;?></option><option value='fixed_summ'><?= $entry_discount_type_fixed_summ;?></option></select></td><td><select class='form-control' name='discount_customer_group[]'><?= $customer_groups_html;?>	</select></td><td><div  class='text-center' onclick='removeRow(this);'><i class='fa fa-times fa-2x' aria-hidden='true'></i></div></td></tr>");
        return false;
    }
    function removeRow(el)
    {
        $(el).parents('tr').remove();
        return false;

    }
</script>
<?php echo $footer; ?>



