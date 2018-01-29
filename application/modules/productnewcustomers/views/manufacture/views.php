<div class="row">
    <div class="col-md-12">
        <div class="box box-primary">
            <div class="box-header">
                <div class="box-header">
                    <a href="manufacture/create" type="button" class="btn btn-block btn-primary" style="width: 100px;"><i class="fa fa-plus" aria-hidden="true"></i> Add</a>
                </div>
            </div>
            <div class="box-body">
                <input type="hidden" name="<?PHP echo $this->security->get_csrf_token_name(); ?>" value="<?PHP echo $this->security->get_csrf_hash(); ?>" id="token-ke">
                <table class="table table-striped table-bordered table-autosort" cellspacing="0" width="100%">
                    <thead>
                        <tr>
                            <th style="width: 50px;"> No.</th> 
                            <th style="width: 100px;">รหัสการผลิต</th>
                            <th style="width: 50px;">เครื่อง</th>
                            <th>สินค้า</th>
                            <th>ลูกค้า</th>
                            <th style="width: 1จ0px;">ประเภทลูกค้า</th>
                            <th style="width: 50px;">สถานะ</th>
                            <th style="width: 150px;">จัดการ</th>
                        </tr>
                    </thead>
                    <tbody>
                        <?php
                        foreach ($result as $key => $value) {
                            $return_fda = $this->fda->get_by_id($value->fda_id);
                            $return_customer = $this->customer->get_by_id($value->customer_id);
                            ?> 
                            <tr>
                                <td class="text-center"><?php echo $key + 1; ?></td>
                                <td><?php echo $value->manufacture_code; ?></td>
                                <td><?php echo $value->manufacture_machine; ?></td>
                                <td><?php echo $return_fda->formula_master; ?></td>
                                <td><?php echo $return_customer->customer_name; ?></td>
                                <td>
                                    <?php
                                    switch ($value->manufacture_customer_type) {
                                        case 0:
                                            echo "ลูกค้าเก่า";
                                            break;
                                        case 1:
                                            echo "ลูกค้าใหม่";
                                            break;
                                        default:
                                            echo "NAN";
                                            break;
                                    }
                                    ?> 
                                </td>
                                <td class="text-center">
                                    <?php
                                    switch ($value->manufacture_status) {
                                        case 0:
                                            echo "รอการผลิต";
                                            break;
                                        case 1:
                                            echo "ผลิตแล้ว";
                                            break;
                                        case 2:
                                            echo "เสีย";
                                            break;
                                        default:
                                            echo "NAN";
                                            break;
                                    }
                                    ?> 
                                </td>
                                <td class="text-center">
                                    <?php
//                                    dd($return_fda);
//                                    dd($value);
                                    ?>
                                    <a class="fa fa-search" style="cursor: pointer"
                                       data-fda-id="<?php echo $return_fda->id; ?>"
                                       data-manufacture-id="<?php echo $value->id; ?>"
                                       href="<?php echo site_url($mModule . '/manufacture/views/' . $value->id.'/'.$return_fda->product_id);?>"
                                       >
                                    </a>
                                    <a class="fa fa-edit" style="cursor: pointer"
                                       data-manufacture-id="<?php echo $value->id; ?>"
                                       href="<?php echo site_url($mModule . '/manufacture/edit/' . $value->id); ?>"
                                       >
                                    </a>
                                    <a class="fa fa-trash" style="cursor: pointer"
                                       onclick="return confirm('Are you sure you want to delete this item?');"
                                       data-manufacture-id="<?php echo $value->id; ?>"
                                       href="<?php echo site_url($mModule . '/manufacture/trash/' . $value->id); ?>"
                                       >
                                    </a>
                                </td>
                            </tr> 
                            <?php
                        }
                        ?>
                    </tbody>
                </table>
            </div>
        </div>
    </div>
</div>