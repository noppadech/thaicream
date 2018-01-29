<?php echo modules::run('adminlte/widget/box_content_open', $style = 'primary', FALSE); ?>
<div class="row" style="margin-bottom: 20px;">
    <div class="col-md-12">
        <a href="./product/create/<?php echo $main_id; ?>" class="btn btn-primary pull-left">
            <i class="fa fa-plus" aria-hidden="true"></i>
            เพิ่มสินค้า
        </a>
    </div>
</div>
<div class="row">
    <div class="col-md-12">
        <table class="table table-bordered table-autosort">
            <thead>
                <tr>
                    <th style="width: 50px;">No.</th>
                    <th>ชื่อการค้า</th>
                    <th>เลข อย.</th>
                    <th>วันที่ได้รับ อย.</th>
                    <th>วันหมดอายุ อย.</th>
                    <th>Create By</th>
                    <th>Edit By</th>
                    <th></th>
                </tr>
            </thead>
            <tbody>
                <?php
                foreach ($result as $key => $value) {
                    ?>
                    <tr>
                        <td class="text-center" style="width: 50px;"><?php echo $key+1;?></td>
                        <td><?php echo $value->formula_master;?></td>
                        <td><?php echo $value->fda_no;?></td>
                        <td><?php echo $value->fda_get_date;?></td>
                        <td><?php echo $value->fda_date_expire;?></td>
                        <td class="text-center">
                            <?php echo $value->fda_create_by;?>
                            <br/>
                            <?php echo $value->fda_create_date;?>
                        </td>
                        <td class="text-center">
                            <?php echo $value->fda_edit_by;?>
                            <br/>
                            <?php echo $value->fda_edit_date;?>
                        </td>
                        <td class="text-center">
                            <a href="<?php echo site_url($mModule."/product/edit/".$main_id.'/'.$value->id); ?>">
                                <i class="fa fa-pencil-square-o" aria-hidden="true"></i>
                            </a>
                            <a href="<?php echo site_url($mModule."/product/report/".$main_id.'/'.$value->id); ?>">
                                <i class="fa fa-file-text" aria-hidden="true"></i>
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
<?php echo modules::run('adminlte/widget/box_content_close'); ?>