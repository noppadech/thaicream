<style>

    @media print{.visible-print{display:block!important}table.visible-print{display:table}tr.visible-print{display:table-row!important}th.visible-print,td.visible-print{display:table-cell!important}.hidden-print,tr.hidden-print,th.hidden-print,td.hidden-print{display:none!important}}
    @media print{
        .content-header {
            display: block !important;
            padding: 0px !important;
            margin: 0px !important;
        }
        .content-wrapper{
            padding: 0px !important;
            margin: 0px !important;
        }


        *{
            font-size:9px;
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
            <th class="text-center" style="width: 200px; vertical-align: middle;">
                ผู้จัดจำหน่ายวัตถุดิบ<br/>
                (Supplier Name)
            </th>
            <th class="text-center" style="width: 200px; vertical-align: middle;">
                ชื่อเคมี<br/>
                (Chemical Name)
            </th>
            <th class="text-center" style="width: 200px; vertical-align: middle;">
                ชื่อการค้า<br/>
                (Ingredient INCI Name)
            </th>
            <th class="text-center" style="width: 200px; vertical-align: middle;">
                หน้าที่<br/>
                (Function of Ingredient)
            </th>
            <th class="text-center" style="vertical-align: middle;">
                สารประกอบ/ปริมาณที่ใช้<br/>
                (Concentration %w/w)
            </th>
            <th class="text-center" style="vertical-align: middle;">
                ปริมาณ สารประกอบ(%)
            </th>
            <th class="text-center" style="vertical-align: middle;">
                ปริมาณ(%)
            </th>
        </tr>
    </thead>
    <tbody>
        <?php
        $i = 1;
        $summary = 0;
        foreach ($formula_selected as $key_selected => $value_selected) {
            $result_path_details = $this->data->get_formula_path_details($value_selected->id);
            foreach ($result_path_details as $key_path_details => $value_path_details) {
                $result_materials = $this->data->get_material_details($value_path_details->path_materials_code);
                $result_material_master = $this->data->get_material_master($value_path_details->path_materials_code);
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
                    <th>
                        <?php
                        echo $result_material_master->material_supplier;
                        ?>
                    </th>
                    <th colspan="">
                        <?php
                        echo $result_material_master->material_trade_name;
                        ?>
                    </th>
                    <th colspan="">
                        <?php
                        echo $result_material_master->material_trade_name_2;
                        ?>
                    </th>
                    <th colspan="">
                        <?php
                        //role
//                        dd($result_material_master);
//                        if (!empty($result_material_master->role))
                            echo $result_material_master->role;
//                        else
//                            echo $result_materials->material_function;
                        ?>
                    </th>
                    <th class="text-right">
                        <?php
                        echo number_format($value_path_details->path_materials_quantity, 2);
                        ?>
                    </th>
                    <th colspan="2"></th> 
                </tr>
                <?php
                foreach ($result_materials as $key_materials => $value_materials) {
                    //dd($value_materials);
                    ?> 
                    <tr>
                        <td class="text-center" colspan="5"><?php // echo $i++;       ?></td>
                        <td class="text-center"><?php echo $value_materials->material_function; ?></td>
                        <td><?php echo $value_materials->material_inci_name ?></td>
                        <td class="text-right">
                            <?php echo $value_materials->material_quantity ?>
                        </td>
                        <td class="text-right">
                            <?php
                            $percent = (($value_path_details->path_materials_quantity * $value_materials->material_quantity) / 100);
                            $summary += $percent;
                            echo number_format($percent, 4);
                            ?> %
                        </td>
                    </tr>
                    <?php
                }
//                echo "<hr/>";
            }
        }
        ?>
        <tr>
   <!-- <td colspan="7"></td>-->
            <td class="text-center" colspan="8"><b>รวม</b></td>
            <td class="text-right">
                <b>
                    <?php
                    echo number_format($summary, 0);
                    echo " %";
                    ?>
                </b>
            </td>
        </tr>
    </tbody>
    <tfoot class="hidden-print">
        <tr>
            <td colspan="8"></td>
            <td class="text-right">
                <button class="btn btn-info" onclick="window.print();">
                    Print
                </button>
            </td>
        </tr>
    </tfoot>
</table>
<?php echo modules::run('adminlte/widget/box_content_close'); ?>