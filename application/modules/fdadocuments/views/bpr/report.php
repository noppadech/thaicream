<style media="print">
    @page {
    size: landscape;
    margin-top: 1cm;
    margin-bottom: 1cm;
    }
    body{
        font-size: 8px!important;
    }
    h3{
        font-size: 11px!important;
    }
    .box{
        border-top: 0px solid #d2d6de;
        margin-bottom: 5px;
    }
    .box-header{
        padding: 0px 10px;
    }
    th{
        vertical-align: middle;
        font-size: 10px!important;
    }
    tr{
        vertical-align: middle;
        font-size: 9px!important;
    }
    .page-break{
        page-break-after: always
    }
    .visible-print{
     display: block;   
    }
</style>
<style media="screen">
    
    .visible-print{
     display: none;   
    }
</style>
<div class="box">
    <div class="box-header text-center">
        <h3 class="box-title">Batch Processing Record (บันทึกการผลิต)</h3>
    </div>
    <!-- /.box-header -->
    <div class="box-body">
        <table class="table table-condensed">
            <tbody> 
                <tr>
                    <td style="width: 20%;">ชื่อการค้า</td>
                    <td><?php echo $result->trading_name; ?></td>
                    <td style="width: 15%;">ห้องผสม</td>
                    <td><?php echo $result->mix_room; ?></td>
                </tr>
                <tr>
                    <td>ชื่อสินค้าจด อย.แจ้งภาษาไทย</td>
                    <td><?php echo $result->fda_name_th; ?></td>
                    <td>ชื่อลูกค้า</td>
                    <td><?php echo $result->customer_name; ?></td>
                </tr>
                <tr>
                    <td>ชื่อสินค้าจด อย.แจ้งภาษาอังกฤษ</td>
                    <td><?php echo $result->fda_name_en; ?></td>
                    <td>วันที่ผลิต</td>
                    <td><?php echo $result->production_date; ?></td>
                </tr>
                <tr>
                    <td>เลขที่จดแจ้ง</td>
                    <td><?php echo $result->registered_number; ?></td>
                    <td>Lot</td>
                    <td><?php echo $result->lot; ?></td>
                </tr>
                <tr>
                    <td>ประเภทผลิตภัณฑ์</td>
                    <td><?php echo $result->product_category; ?></td>
                    <td>เครื่อง</td>
                    <td><?php echo $result->machine; ?></td>
                </tr>
                <tr>
                    <td>ลักษณะประเภทผลิตภัณฑ์</td>
                    <td><?php echo $result->product_type; ?></td>
                    <td>หม้อที่</td>
                    <td><?php echo $result->pot; ?></td>
                </tr>
                <tr>
                    <td colspan="2"></td>
                    <td>จำนวน/kg</td>
                    <td><?php echo $result->quantity_kg; ?></td>
                </tr>
            </tbody>
        </table>
    </div>
</div>
<div class="box page-break">
    <div class="box-header">
        <h3 class="box-title">สูตรสินค้า</h3>
    </div>
    <!-- /.box-header -->
    <div class="box-body">
        <table class="table table-bordered">
            <tbody>
                <?php
                $result_path = $this->bpr->get_path($result->bpr_id);
                $total_path_materials_quantity = 0;
                $total_standard_weight = 0;
                $total_custom_weight = 0;
                foreach ($result_path as $key_path => $value_path) {
                    ?>
                    <tr>
                        <th rowspan="2" style="width:50px;">R/C No</th>
                        <th>PATH NAME</th>
                        <th colspan="1">
                            <?php echo $value_path->path_name; ?>
                        </th>
                        <th class="hidden-print">
                            <?php // echo ($key_path == 0) ? $result->master_weight_value : "";    ?>
                        </th>
                        <th><?php echo ($key_path == 0) ? $result->custom_weight_value : ""; ?></th>
                        <th colspan="2" class="text-center">ช่วงปริมาณการชั่ง</th>
                        <th rowspan="2" class="text-center" style="vertical-align: middle;">
                            ชั่งจริง ปริมาณ/กรัม
                        </th>
                        <!--<th rowspan="2" class="text-center" style="vertical-align: middle;">ชั่งจริง ปริมาณ/กรัม</th>-->
                        <th rowspan="2" class="text-center" style="vertical-align: middle;">ผู้ปฎิบัติ</th>
                        <th rowspan="2" class="text-center" style="vertical-align: middle;">ผู้ทวนสอบ</th>
                    </tr>
                    <tr>
                        <th>รหัส/ชื่อวัตถุดิบ</th>
                        <th></th>
                        <th class="text-center hidden-print">%</th>
                        <th class="text-center hidden-print visible-print">ปริมาณ/กรัม</th>
                        <th class="text-center">ปริมาณ/กรัม</th>
                        <th class="text-center">ต่ำสุด(Min.)</th>
                        <th class="text-center">สูงสุด(Max.)</th>
                        <?php // echo ($key_path != 0) ? "<th></th><th></th><th></th>" : ""; ?> 
                    </tr>
                    <?php
                    $result_material = $this->bpr->get_material($value_path->bpr_path_id);
                    foreach ($result_material as $key_material => $value_material) {

                        $total_path_materials_quantity += $value_material->path_materials_quantity;
                        $total_standard_weight += $value_material->standard_weight;
                        $total_custom_weight += $value_material->custom_weight;
                        ?>
                        <tr>
                            <td></td> 
                            <td><?php echo $value_material->material_code; ?></td>
                            <td><?php echo $value_material->material_name; ?></td>
                            <td class="text-right hidden-print"><?php echo $value_material->path_materials_quantity; ?></td>
                            <td class="text-right text-center hidden-print visible-print"><?php echo $value_material->standard_weight; ?></td>
                            <td class="text-right"><?php echo $value_material->custom_weight; ?></td>
                            <td></td>
                            <td></td> 
                            <td></td> 
                            <!--<td></td>--> 
                            <td></td> 
                            <td></td> 
                        </tr>
                        <?PHP
                    }
                }
                ?> 
                <tr>
                    <td></td>
                    <td></td>
                    <td class="text-right">
                        <span class="hidden-print">
                        <?php echo number_format($total_path_materials_quantity, 4); ?>    
                        </span>
                        
                    </td>
                    <td class="text-right hidden-print visible-print"><?php echo number_format($total_standard_weight, 2); ?></td>
                    <td class="text-right"><?php echo number_format($total_custom_weight, 2); ?></td>
                    <td></td>
                    <td></td>
                    <!--<td></td>-->
                    <td></td>
                    <td></td>
                    <td></td>
                </tr>
            </tbody>
        </table>
    </div>
</div>
<div class="box" style="border-top: 0px;">
    <div class="box-body">
        <table class="table table-bordered">
            <thead>
                <tr>
                    <th><h5 class="box-title">ขั้นตอนการผสม</h5></th>
                    <th>ผู้ปฎิบัติ</th>
                    <th>ผู้ตรวจสอบ</th>
                </tr>
            </thead>
            <tbody>
                <tr>
                    <td class="text-left"><?php echo $result->mix_process; ?></td>
                    <td></td>
                    <td></td>
                </tr>
            </tbody>
        </table>
    </div>
</div>
<div class="box">
    <div class="box-header">
        <h3 class="box-title">ชั่งน้ำหนักรวมของถัง+ผลิตภัณฑ์</h3>
    </div>
    <!-- /.box-header -->
    <div class="box-body">
        <table class="table table-bordered">
            <thead>
                <tr>
                    <th colspan="2" style="width: 50%;">
                        <h5 class="box-title">ชั่งน้ำหนักรวมของถัง+ผลิตภัณฑ์</h5>
                    </th>
                    <th style="width: 25%;">ผู้ปฎิบัติ</th>
                    <th style="width: 25%;">ผู้ตรวจสอบ</th>
                </tr>
            </thead>
            <tbody>
                <tr>
                    <td style="width: 25%;">น้ำหนักรวม(Kg) : </td>
                    <td class="text-right" style="width: 25%;"><?PHP echo $result->total_weight; ?></td>
                    <td></td>
                    <td></td>
                </tr>
                <tr>
                    <td>น้ำหนักถัง(Kg) : </td>
                    <td class="text-right"><?PHP echo $result->tank_weight; ?></td>
                    <td></td>
                    <td></td>
                </tr>
                <tr>
                    <td>น้ำหนักสุทธิ(Kg) : </td>
                    <td class="text-right"><?PHP echo $result->net_weight; ?></td>
                    <td></td>
                    <td></td>
                </tr>
                <tr>
                    <td>ผลผลิตที่ผสมได้คิดเป็นร้อยละ : </td>
                    <td class="text-right"><?PHP echo $result->percentage; ?></td>
                    <td></td>
                    <td></td>
                </tr>
            </tbody>
        </table>
    </div>
</div>
<div class="box">
    <div class="box-header">
        <h3 class="box-title">อุปกรณ์ที่ใช้ในการผลิต</h3>
    </div>
    <!-- /.box-header -->
    <div class="box-body"> 
        <ol>
            <?php
            $result_equipment = $this->bpr->get_equipment($result->bpr_id);
            foreach ($result_equipment as $key_equipment => $value_equipment) {
                $result_equipment_details = $this->bpr->get_equipment_id($value_equipment->ref_equipment_id);
                ?>
                <li><?php echo $result_equipment_details->equipment_detail; ?></li>
                <?php
            }
            ?> 
        </ol>
    </div>
</div>
<div class="box page-break">
    <div class="box-header">
        <h3 class="box-title">ข้อแนะนำ/ข้อควรระวัง</h3>
    </div>
    <!-- /.box-header -->
    <div class="box-body">
        <?php echo $result->guideline; ?>
    </div>
</div>
<div class="box">
    <!-- /.box-header -->
    <div class="box-body">
        <table class="table table-bordered">
            <tbody>
                <tr>
                    <td>ผู้เตรียม</td>
                    <td>ผู้อนุมัติ</td>
                </tr>
                <tr>
                    <td>
                        <br/><br/><br/>
                    </td>
                    <td></td>
                </tr>
                <tr>
                    <td>ตำแหน่ง พนักงานฝ่ายผลิต ( ______/______/______)</td>
                    <td>ตำแหน่ง ผู้จัดการฝ่ายผลิต ( ______/______/______)</td>
                </tr>
            </tbody>
        </table>
    </div>
</div>
<div class="box">
    <div class="box-header">
        <h3 class="box-title">การตรวจสอบผลิตภัณฑ์</h3>
    </div>
    <!-- /.box-header -->
    <div class="box-body">
        <table class="table table-bordered">
            <tbody>
                <tr>
                    <td style="width:15%;">หัวข้อ</td>
                    <td>ข้อกำหนด</td>
                    <td style="width:25%;">วิธีตรวจสอบ</td>
                    <td style="width:25%;">ผลการตรวจสอบ</td>
                </tr>
                <tr>
                    <td>
                        Appearance
                    </td>
                    <td></td>
                    <td></td>
                    <td></td>
                </tr>
                <tr>
                    <td>
                        Color
                    </td>
                    <td></td>
                    <td></td>
                    <td></td>
                </tr>
                <tr>
                    <td>
                        pH
                    </td>
                    <td></td>
                    <td></td>
                    <td></td>
                </tr>
                <tr>
                    <td>&nbsp; </td>
                    <td></td>
                    <td></td>
                    <td></td>
                </tr>
                <tr>
                    <td>ผู้ตรวจสอบ</td>
                    <td colspan="3">ฝ่ายควบคุมคุณภาพ ( ______/______/______)</td>
                </tr>
            </tbody>
        </table>
    </div>
</div>
<div class="box page-break">
    <div class="box-header">
        <h3 class="box-title">วิธีการรับรองการผลิต</h3>
    </div>
    <!-- /.box-header -->
    <div class="box-body"> 
        <table class="table table-bordered">
            <tbody>
                <tr>
                    <td colspan="2">
                        ได้ทำการผลิตตามวิธีการในบันทึกการผลิต (BPR) 
                        <input type="checkbox" /> ไม่มีการเบี่ยงเบน 
                        <input type="checkbox" /> มีการแก้ไขรายการ
                    </td>
                </tr>
                <tr>
                    <td colspan="2">
                        <input type="checkbox" /> มีการแก้ไขรายการ  ดังนี้______________________________________________
                    </td>
                </tr>
                <tr>
                    <td style="width: 50%;">ลงชื่อ </td>
                    <td>ผู้จัดการฝ่ายผลิต  ( ______/______/______)</td>
                </tr>
            </tbody>
        </table>
        
        <br/>
    </div>
</div>
<div class="box ">
    <div class="box-header">
        <h3 class="box-title">การอนุมัติจากฝ่ายควบคุมคุณภาพ</h3>
    </div>
    <!-- /.box-header -->
    <div class="box-body"> 
        <table class="table table-bordered">
            <tbody>
                <tr>
                    <td colspan="2">
                        ได้ทำการสุ่มตัวอย่างและทดสอบ ___________________________________________________
                    </td>
                </tr>
                <tr>
                    <td colspan="2">
                        เบอร์ผลิต________________________
                    </td>
                </tr>
                <tr>
                    <td colspan="2">
                        ผลการทดสอบ &nbsp;&nbsp; <input type="checkbox" /> อนุมัติ
                    </td>
                </tr>
                <tr>
                    <td style="width: 50%;">ลงชื่อ </td>
                    <td>ผู้จัดการฝ่ายผลิต  ( ______/______/______)</td>
                </tr>
            </tbody>
        </table>
        
        <br/>
    </div>
</div>
<center>
    <button class="hidden-print btn btn-success" onclick="window.print();" >Print</button>
    <button class="hidden-print btn btn-danger" onclick="history.back();" >Back</button>
</center>



