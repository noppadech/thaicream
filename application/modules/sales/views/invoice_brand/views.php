<?php echo Modules::run('adminlte/Widget/box_open', '<a href="' . site_url('sales/invoice_brand/create') . '" class="fa fa-plus btn btn-info"> เพิ่ม</a>', 'primary', FALSE); ?>
<table class="table table-bordered table-autosort">
    <thead>
        <tr>
            <th style="width: 50px;">No.</th>
            <th>ลูกค้า</th>
            <th style="width: 200px;">Action</th>
        </tr>
    </thead>
    <tbody>
        <?php
        foreach ($result as $key => $value) {
            ?>
            <tr>
                <td class="text-center" style="vertical-align: middle;"><?php echo $key + 1; ?></td>
                <td style="vertical-align: middle;">
                    <?php
//                    dd($value);
                    echo Modules::run('sale/invoice_brand/get_customer_id', $value->order_brand_customer_id);
                    ?>
                </td>
                <td class="text-center" style="vertical-align: middle;">
                    <a href="<?php echo site_url('sales/invoice_brand/printer/'.$value->order_brand_id); ?>" class="fa fa-edit btn btn-primary"> พิมพ์</a>
                    <a href="<?php echo site_url('sales/invoice_brand/edit/'.$value->order_brand_id); ?>" class="fa fa-edit btn btn-info"> แก้ไข</a>
                    <a href="<?php echo site_url('sales/invoice_brand/trash/'.$value->order_brand_id); ?>" onclick="confirm('กรุณายืนยันก่อนลบข้อมูล')" class="fa fa-trash btn btn-danger"> ลบ</a>
                </td>
            </tr>
            <?php
        }
        ?>
    </tbody>
</table>
<?php echo Modules::run('adminlte/Widget/box_close'); ?>