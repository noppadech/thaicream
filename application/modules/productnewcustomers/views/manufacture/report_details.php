<style>
    @media print{
        .table-bordered>tbody>tr>td, .table-bordered>tbody>tr>th, .table-bordered>tfoot>tr>td, .table-bordered>tfoot>tr>th, .table-bordered>thead>tr>td, .table-bordered>thead>tr>th{
            border: 1px solid #000 !important;
        }
        .table>tbody>tr>td, .table>tbody>tr>th, .table>tfoot>tr>td, .table>tfoot>tr>th, .table>thead>tr>td, .table>thead>tr>th {
            padding: 8px;
            line-height: 1.42857143;
            vertical-align: middle;
            border-top: 0px solid #ddd;
        }
    }
</style>
<?php echo modules::run('adminlte/widget/box_content_open', $style = 'primary', FALSE); ?>
<table class="table table-bordered">
    <thead> 
        <tr>
            <th class="text-center" style="width: 100px; vertical-align: middle;">
                ลำดับที่
            </th>
            <th class="text-center" style="width: 200px; vertical-align: middle;">
                รหัสวัตถุดิบ<br/>
                (Raw Material Code)
            </th>
<!--            <th class="text-center" style="width: 200px; vertical-align: middle;">
                ผู้จัดจำหน่ายวัตถุดิบ<br/>
                (Ingredient INCI Name)
            </th>-->
<!--            <th class="text-center" style="width: 200px; vertical-align: middle;">
                ชื่อเคมี<br/>
                (Chemical Name)
            </th>-->
            <th class="text-center" style="vertical-align: middle;">
                ชื่อการค้า<br/>
                (Ingredient Trade Name)
            </th>
<!--            <th class="text-center" style="width: 200px; vertical-align: middle;">
                หน้าที่<br/>
                (Function of Ingredient)
            </th>-->
            <th class="text-center" style="vertical-align: middle; max-width: 100px;">
                สารประกอบ/ปริมาณที่ใช้<br/>
                (Concentration %w/w)
            </th> 
            <th class="text-center" style="vertical-align: middle; max-width: 100px;">
                ปริมาณ(%) 
                <br/>
                <?php echo $manufacture->manufacture_qty . ' kg.' ?>
            </th>
        </tr>
    </thead>
    <tbody>
        <?php
        $i = 1;
        $summary = 0;

//        dd($formula_details);
        foreach ($formula_selected as $key_selected => $value_selected) {
//            dd($value_selected);
            $result_path_details = $this->fda_document->get_formula_path_details($value_selected->id);
            ?>
            <tr>
                <th class="text-left" colspan="5">
                    <?php
                    echo $value_selected->path_name;
                    ?>
                </th> 
            </tr> 
            <?php
            foreach ($result_path_details as $key_path_details => $value_path_details) {
//            dd($value_path_details);
                $result_materials = $this->fda_document->get_material_details($value_path_details->path_materials_code);
                $result_material_master = $this->fda_document->get_material_master($value_path_details->path_materials_code);
                if ($key_selected == 0 and $key_path_details == 0) {
//                    dd($result_materials);
//                echo "<hr>";
//                    dd($result_material_master);
                }
                ?>
                <tr>
                    <th class="text-center">
                        <?php
                        echo $i++;
                        ?>
                    </th>
                    <th>
                        <?php
                        echo $result_material_master->material_code;
                        ?>
                    </th>
<!--                    <th>
                        <?php
                        echo $result_material_master->material_supplier;
                        ?>
                    </th>-->
<!--                    <th colspan="">
                        <?php
                        echo $result_material_master->material_trade_name;
                        ?>
                    </th>-->
                    <th colspan="">
                        <?php
                        echo $result_material_master->material_trade_name_2;
                        ?>
                    </th>
<!--                    <th colspan="">
                        <?php
                        echo $result_material_master->role;
                        ?>
                    </th>-->
                    <th class="text-right">
                        <?php
                        echo number_format($value_path_details->path_materials_quantity, 2);
                        ?>
                    </th>
                    <th class="text-right">
                        <?php
                        echo ($value_path_details->path_materials_quantity * $manufacture->manufacture_qty) / 100;
                        ?>
                    </th> 
                </tr> 
                <?php
            }
        }
        ?>
    </tbody>
    <tfoot>
        <tr>
            <td colspan="5">
                <?php echo $formula_details->formula_remark;?>
            </td>
        </tr>
        <tr class="hidden-print">
            <td colspan="4"></td>
            <td class="text-right">
                <button class="btn btn-info" onclick="window.print();">
                    Print
                </button>
            </td>
        </tr>
    </tfoot>
</table>
<?php echo modules::run('adminlte/widget/box_content_close.'); ?>