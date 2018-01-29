<?php echo modules::run('adminlte/widget/box_content_open', $style = 'primary', FALSE); ?>
<div class="row" style="margin-bottom: 20px;">
    <div class="col-md-12">
        <a href="./customer/create" class="btn btn-primary pull-left">
            <i class="fa fa-plus" aria-hidden="true"></i>
            เพิ่มลูกค้า
        </a>
    </div>
</div>
<div class="row">
    <div class="col-md-12">
        <table class="table table-bordered table-autosort">
            <thead>
                <tr>
                    <th style="width: 50px;">No.</th>
                    <th>ลูกค้า</th>
                    <th style="width:100px;">เบอร์ติดต่อ</th>
                    <th style="width: 50px;">Action</th>
                </tr>
            </thead>
            <tbody>
                <?php
                foreach ($result as $key => $value) {
                    ?>
                    <tr>
                        <td class="text-center"><?php echo $key + 1; ?></td>
                        <td class="text-left"><?php echo $value->customer_name; ?></td>
                        <td class="text-center"><?php echo $value->customer_telephone; ?></td>
                        <td class="text-center">
                            <a href="<?php echo site_url($mModule."/product/index/".$value->id);?>" class="fa fa-search" title="ข้อมูลสินค้า"></a>
                            |
                            <a href="<?php echo site_url($mModule."/customer/edit/".$value->id);?>" class="fa fa-edit" title="แก้ไขข้อมูลลูกค้า"></a>
                        </td>
                    </tr>
                    <?php
                }
                ?>
            </tbody>
        </table>
    </div>
</div>
<?php echo modules::run('adminlte/widget/box_content_close'); ?>