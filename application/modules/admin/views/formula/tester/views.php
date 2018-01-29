<style>
    table.table-bordered.dataTable tbody th, table.table-bordered.dataTable tbody td{
        vertical-align: middle;
    }
</style>
<?php
echo Modules::run('adminlte/Widget/box_open', '', $style = 'primary', $solid = FALSE);
?>
<div class="row">
    <div class="col-xs-12">
        <?php
//        if (is_null($result_master->formula_selected)) {
            $title = '<i class="fa fa-plus" aria-hidden="true"></i>เพิ่มสูตรทดลอง';
            $uri = "admin/formula/tester/add/" . $master_id;
            $attributes = "class='btn btn-primary pull-left'";
            echo anchor($uri, $title, $attributes);
//        }
        
        if (!is_null($result_master->formula_selected)) {
            if ($result_master->formula_status == 1) {
                $title = '<i class="fa fa-arrow-right" aria-hidden="true"></i> สั่งผลิต';
                $uri = "admin/formula/tester/sent_fda/" . $master_id;
                $attributes = "class='btn btn-success pull-right' style='margin-left:5px;'";
                echo anchor($uri, $title, $attributes);
                ?>
                <span class='btn btn-info pull-right' style='margin-left:5px;'>
                    ส่งเอกสารให้ อย. แล้ว
                </span>
                <?php
            } else {
                $title = '<i class="fa fa-arrow-right" aria-hidden="true"></i> ส่งสูตรให้กับ อย.';
                $uri = "admin/formula/tester/sent_fda/" . $master_id;
                $attributes = "class='btn btn-info pull-right'";
                echo anchor($uri, $title, $attributes);
            }
        }
        ?>
    </div>
</div> 
<br/>
<div class="row">
    <div class="col-xs-12">
        <table class="table table-bordered table-autosort">
            <thead>
                <tr>
                    <th style="width: 50px;">No.</th>
                    <th>Name</th>
                    <th style="width: 100px;">Create By</th>
                    <th style="width: 100px;">Edit By</th>
                    <th style="width: 170px;">Action</th>
                </tr>
            </thead>
            <tbody>
                <?php 
                foreach ($result as $key => $value) {
                    ?> 
                    <tr>
                        <td class="text-center"><?php echo $key + 1; ?></td>
                        <td><?php echo $value->formula_name; ?></td>
                        <td><?php echo $value->create_by; ?></td>
                        <td><?php echo $value->edit_by; ?></td>
                        <td class="text-center">
                            <?php
                            if ($result_master->formula_status == 0) {
//                                echo $value->id . " : " . $result_master->formula_selected;
//                                echo "<br/>";
                                if ($value->id == $result_master->formula_selected) {
                                    $tcolor = "text-black";
                                    $fa_icon = "fa fa-circle";
                                } else {
                                    $tcolor = "text-green";
                                    $fa_icon = "fa fa-circle-o";
                                }
                                ?>
                                <a class="<?PHP echo $tcolor; ?>" href="formula/tester/selected/<?php echo$master_id . '/' . $value->id; ?>"> 
                                    <i class="<?PHP echo $fa_icon; ?>" aria-hidden="true"></i> 
                                </a>
                                |
                                <a href="formula/tester/edit/<?php echo$master_id . '/' . $value->id; ?>"> 
                                    <i class="fa fa-pencil-square-o" aria-hidden="true"></i>
                                </a>
                                |
                                <a href="formula/tester/copy/<?php echo$master_id . '/' . $value->id; ?>"> 
                                    <i class="fa fa-copy" aria-hidden="true"></i>
                                </a>
                                |
                                <a onclick="return confirm('คุณต้องการลบข้อมูลหรือไม่');" href="formula/tester/trash/<?php echo$master_id . '/' . $value->id; ?>"> 
                                    <i class="fa fa-trash" aria-hidden="true"></i>
                                </a>
                                <?php
                            } else {
                                if ($value->id == $result_master->formula_selected) {
                                    echo '<i class="fa fa-check text-green" aria-hidden="true"></i> | ';
                                }
                                ?>
                                <a href="formula/tester/edit/<?php echo$master_id . '/' . $value->id; ?>"> 
                                    <i class="fa fa-search" aria-hidden="true"></i>
                                </a>
                                <?php
                            }
                            ?>

                        </td>
                    </tr>
                <?php }
                ?>
            </tbody>
        </table>
    </div>
</div>
<?php
echo Modules::run('adminlte/Widget/box_close');
?>