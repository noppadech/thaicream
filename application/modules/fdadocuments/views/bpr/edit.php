<?php
$attributes = array(
    'id' => "order",
    'class' => 'form-horizontal'
);
echo form_open(site_url('fdadocuments/bpr/edit/' . $result->bpr_id), $attributes);
?>
<div class="row">

    <div class="col-md-12">
        <?php
        echo Modules::run('adminlte/Widget/box_content_open', '', 'primary', FALSE);
//        dd($result);
        ?>
        <!--step_setup-->
        <div id="">
            <!--Tab 1-->
            <h3>ข้อมูลผลิตภัณฑ์</h3>
            <section class="row">
                <div class="col-md-6"> 
                    <div class="form-group">
                        <label class="col-md-4 control-label" for="trading_name">ชื่อการค้า</label>  
                        <div class="col-md-8">
                            <input id="trading_name" name="trading_name" value="<?php echo $result->trading_name; ?>" type="text" placeholder="ชื่อการค้า" class="form-control input-md">
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-md-4 control-label" for="fda_name_th">ชื่อสินค้าจด อย.แจ้งภาษาไทย</label>  
                        <div class="col-md-8">
                            <input id="fda_name_th" name="fda_name_th" value="<?php echo $result->fda_name_th; ?>" type="text" placeholder="ชื่อสินค้าจด อย.แจ้งภาษาไทย" class="form-control input-md">
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-md-4 control-label" for="fda_name_en">ชื่อสินค้าจด อย.แจ้งภาษาอังกฤษ</label>  
                        <div class="col-md-8">
                            <input id="fda_name_en" name="fda_name_en" value="<?php echo $result->fda_name_en; ?>" type="text" placeholder="ชื่อสินค้าจด อย.แจ้งภาษาอังกฤษ" class="form-control input-md">
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-md-4 control-label" for="registered_number">เลขที่จดแจ้ง</label>  
                        <div class="col-md-8">
                            <input id="registered_number" name="registered_number" value="<?php echo $result->registered_number; ?>" type="text" placeholder="เลขที่จดแจ้ง" class="form-control input-md">
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-md-4 control-label" for="product_category">ประเภทผลิตภัณฑ์</label>  
                        <div class="col-md-8">
                            <input id="product_category" name="product_category" value="<?php echo $result->product_category; ?>" type="text" placeholder="ประเภทผลิตภัณฑ์" class="form-control input-md">
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-md-4 control-label" for="product_type">ลักษณะประเภทผลิตภัณฑ์</label>  
                        <div class="col-md-8">
                            <input id="product_type" name="product_type" value="<?php echo $result->product_type; ?>" type="text" placeholder="ลักษณะประเภทผลิตภัณฑ์" class="form-control input-md">
                        </div>
                    </div> 
                </div>
                <div class="col-md-6"> 
                    <div class="form-group">
                        <label class="col-md-3 control-label" for="mix_room">ห้องผสม</label>  
                        <div class="col-md-9">
                            <input id="mix_room" name="mix_room" value="<?php echo $result->mix_room; ?>" type="text" placeholder="ห้องผสม" class="form-control input-md">
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-md-3 control-label" for="customer_name">ชื่อลูกค้า</label>  
                        <div class="col-md-9">
                            <input id="customer_name" name="customer_name" value="<?php echo $result->customer_name; ?>" type="text" placeholder="ชื่อลูกค้า" class="form-control input-md">
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-md-3 control-label" for="production_date">วันที่ผลิต</label>  
                        <div class="col-md-9">
                            <input id="production_date" name="production_date" value="<?php echo $result->production_date; ?>" type="text" placeholder="วันที่ผลิต" class="form-control input-md">
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-md-3 control-label" for="lot">Lot</label>  
                        <div class="col-md-9">
                            <input id="lot" name="lot" value="<?php echo $result->lot; ?>" type="text" placeholder="Lot" class="form-control input-md">
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-md-3 control-label" for="machine">เครื่อง</label>  
                        <div class="col-md-9">
                            <input id="machine" name="machine" value="<?php echo $result->machine; ?>" type="text" placeholder="เครื่อง" class="form-control input-md">
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-md-3 control-label" for="pot">หม้อที่</label>  
                        <div class="col-md-9">
                            <input id="pot" name="pot" value="<?php echo $result->pot; ?>" type="text" placeholder="หม้อที่" class="form-control input-md">
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-md-3 control-label" for="quantity_kg">จำนวน/kg</label>  
                        <div class="col-md-9">
                            <input id="quantity_kg" name="quantity_kg" value="<?php echo $result->quantity_kg; ?>" type="text" placeholder="จำนวน/kg" class="form-control input-md">
                        </div>
                    </div>
                </div>
            </section>
            <!--Tab 2-->
            <h3>ขั้นตอนการผสม</h3>
            <section class="row">
                <div class="col-md-12">
                    <textarea name="mix_process" id="mix_process_1" rows="10" cols="80"><?php echo $result->mix_process; ?></textarea>
                    <script type="text/javascript">
<?PHP $this->load->helper('editor'); ?>
<?PHP echo ckeditor_render('mix_process', '1', 650, 300, 'custom') ?>
                    </script>
                    <br/>
                    <div class="form-group">
                        <label class="col-md-12 control-label">ชั่งน้ำหนักรวมของถัง+ผลิตภัณฑ์</label>
                    </div>
                    <div class="form-group">
                        <label class="col-md-3 control-label" for="total_weight">น้ำหนักรวม(Kg)</label>  
                        <div class="col-md-9">
                            <input id="total_weight" name="total_weight" value="<?php echo $result->total_weight; ?>" type="text" placeholder="น้ำหนักรวม(Kg)" class="form-control input-md">
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-md-3 control-label" for="tank_weight">น้ำหนักถัง(Kg)</label>  
                        <div class="col-md-9">
                            <input id="tank_weight" name="tank_weight" value="<?php echo $result->tank_weight; ?>" type="text" placeholder="น้ำหนักถัง(Kg)" class="form-control input-md">
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-md-3 control-label" for="net_weight">น้ำหนักสุทธิ(Kg)</label>  
                        <div class="col-md-9">
                            <input id="net_weight" name="net_weight" value="<?php echo $result->net_weight; ?>" type="text" placeholder="น้ำหนักสุทธิ(Kg)" class="form-control input-md">
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-md-3 control-label" for="percentage">ผลผลิตที่ผสมได้คิดเป็นร้อยละ</label>  
                        <div class="col-md-9">
                            <input id="percentage" name="percentage" value="<?php echo $result->percentage; ?>" type="text" placeholder="ผลผลิตที่ผสมได้คิดเป็นร้อยละ" class="form-control input-md">
                        </div>
                    </div>
                </div>
            </section>
            <!--Tab 3-->
            <h3>อุปกรณ์ที่ใช้ในการผลิต</h3>
            <section class="row"> 
                <div class="col-xs-12">
                    <div class="form-group"> 
                        <div class="col-xs-12 col-md-6 col-lg-4">
                            <select name="equipment" class="form-control select2" >
                                <option value="">กรุณาเลือกอุปกรณ์การผลิต</option>
                                <?php
                                foreach ($equipment as $key => $value) {
                                    ?>
                                    <option value="<?php echo $value->equipment_id; ?>">
                                        <?php echo $value->equipment_title; ?> / <?php echo $value->equipment_detail; ?>
                                    </option>
                                    <?php
                                }
                                ?>
                            </select>
                        </div>
                        <div class="col-xs-2">
                            <button type="button" onclick="add_equipment();" class="btn btn-success">ADD</button>
                        </div>
                    </div>
                </div>
                <div class="col-xs-12">
                    <table id="equipment" class="table table-bordered">
                        <thead>
                            <tr>
                                <th>รหัสเครื่องมือ/อุปกรณ์</th>
                                <th>ชื่อเครื่องมือ/อุปกรณ์</th>
                                <th>รายละเอียดเครื่องมือ/อุปกรณ์</th>
                                <th class="text-center">Remove</th>
                            </tr>
                        </thead>
                        <tbody>
                            <?php
                            foreach ($result_equipment as $key => $value) {
                                $get_equipment = $this->bpr->get_equipment_id($value->ref_equipment_id);
                                ?>
                                <tr>
                                    <td style='vertical-align: middle;'>
                                        <?php
//                                        dd($value);
//                                        dd($get_equipment);
                                        ?>
                                        <?php echo $get_equipment->equipment_code ?>
                                        <input type='hidden' name='equipment_new[]' value='0' />
                                        <input type='hidden' name='equipment_id[]' value='<?php echo $get_equipment->equipment_id ?>' />
                                    </td>
                                    <td style='vertical-align: middle;'><?php echo $get_equipment->equipment_title ?></td>
                                    <td style='vertical-align: middle;'><?php echo $get_equipment->equipment_detail ?></td>
                                    <td style='vertical-align: middle;' class="text-center">
                                        <input type="checkbox" name="equipment_remove[]" value="<?php echo $value->bpr_equipment_id ?>" />
                                    </td>
                                </tr>
                            <?php } ?>
                        </tbody>
                    </table>
                </div>
            </section>
            <!--Tab 4-->
            <h3>ข้อแนะนำ/ข้อควรระวัง</h3>
            <section>
                <div class="row">
                    <div class="col-xs-12"> 
                        <textarea name="guideline" id="guideline_1" rows="10" cols="80">
                            <?php echo $result->guideline; ?>
                        </textarea>
                        <script type="text/javascript">
<?PHP $this->load->helper('editor'); ?>
<?PHP echo ckeditor_render('guideline', '1', 650, 300, 'custom') ?>
                        </script>
                    </div>
                </div>
            </section>
            <div class="row">
                <div class="col-xs-12 text-center" style="padding-top: 20px;"> 
                    <button class="btn btn-success" type="submit" >บันทึกข้อมูล</button>
                    <button class="btn btn-danger" type="button" onclick="location.reload();" >เคลียร์ข้อมูล</button>
                </div>
            </div>
        </div>
        <?php
        echo Modules::run('adminlte/Widget/box_content_close');
        ?>
    </div>
</div>
<?php echo form_close(); ?>
<link rel="stylesheet" href="<?php echo base_url('assets/dist/admin/select2/select2.css?v=' . date('ymdhis')); ?>">
<script type="text/javascript" src="<?php echo base_url('assets/dist/admin/select2/select2.full.min.js'); ?>"></script>
<script type="text/javascript">
                        function get_product_formula(obj) {
                            $.ajax({
                                url: "<?php echo site_url('fdadocuments/bpr/get_formula_details'); ?>",
                                type: 'POST',
                                async: true,
                                dataType: 'json',
                                data: {id: $(obj).val(), csrf_test_name: $('input[name^=csrf_test_name]').val()},
                                success: function (data, textStatus, jqXHR) {
                                    console.log($(obj).val());
                                    $('#formula_name').val(data.formula_name);
                                    $('#formula_details').html(data.html);
                                    $('input[name^="csrf_test_name"]').val(data.hash);
                                }, complete: function (jqXHR, textStatus) {
                                    calculate_master();
                                    calculate_custom();
                                }
                            });
                        }
                        function calculate_master() {
                            var wight = parseInt($('input[name^="master_weight_value"]').val());
                            var per = 0;
                            var sum = 0;
                            $.each($('input[name^="standard_weight[]"'), function (index, value) {
                                $(value).attr('name', "standard_weight[" + index + "]");
                            });
                            $.each($('input[name^="custom_weight[]"'), function (index, value) {
                                $(value).attr('name', "custom_weight[" + index + "]");
                            });
                            $.each($('input[name^="path_materials_quantity[]"'), function (index, value) {
                                per += parseFloat($(value).val());
                                var cal = 0;
                                cal = ((parseFloat($(value).val()) * wight) / 100);
                                sum += cal;
                                $('input[name^="standard_weight[' + index + ']"').val(cal);
                            });
                            $('#sum').html(Math.round(per));

                            $('#total_1').html(sum);
                        }
                        function calculate_custom() {
                            var wight = parseInt($('input[name^="custom_weight_value"]').val());
                            var per = 0;
                            var sum = 0;
                            $.each($('input[name^="standard_weight[]"'), function (index, value) {
                                $(value).attr('name', "standard_weight[" + index + "]");
                            });
                            $.each($('input[name^="custom_weight[]"'), function (index, value) {
                                $(value).attr('name', "custom_weight[" + index + "]");
                            });
                            $.each($('input[name^="path_materials_quantity[]"'), function (index, value) {
//                                console.log(index);
//                                console.log(wight);
//                                console.log($(value).val());
                                per += parseFloat($(value).val());
                                var cal = 0;
                                cal = ((parseFloat($(value).val()) * wight) / 100);
                                sum += cal;
                                if (!isNaN(cal)) {
                                    $('input[name^="custom_weight[' + index + ']"').val(cal);
                                } else {
                                    $('input[name^="custom_weight[' + index + ']"').val(0);
                                }
                            });
                            $('#sum').html(Math.round(per));
                            $('#total_2').html(sum);
                        }
                        function add_equipment() {

                            var equipment_id = $('select[name^="equipment"]').val();
                            console.log($('select[name^="equipment"]').val());
                            $.ajax({
                                url: "<?php echo site_url('fdadocuments/bpr/get_equipment'); ?>",
                                type: 'POST',
                                async: true,
                                dataType: 'json',
                                data: {id: equipment_id, csrf_test_name: $('input[name^=csrf_test_name]').val()},
                                success: function (data, textStatus, jqXHR) {
//                                    console.log(data);
                                    $('#equipment > tbody').append("<tr>\n\
                                                                            <td style='vertical-align: middle;'>" + data.result.equipment_code + "\n\
                                                                            <input type='hidden' name='equipment_new[]' value='1' />\n\
                                                                            <input type='hidden' name='equipment_id[]' value='" + data.result.equipment_id + "' />\n\
                                                                            </td>\n\
                                                                            <td style='vertical-align: middle;'>" + data.result.equipment_title + "</td>\n\
                                                                            <td style='vertical-align: middle;'>" + data.result.equipment_detail + "</td>\n\
                                                                            <td style='vertical-align: middle;'><button class='btn btn-danger' onclick='equipment_remove(this)'>Remove</button></td>\n\
                                                                        </tr>");
                                    $('input[name^="csrf_test_name"]').val(data.hash);
                                }, complete: function (jqXHR, textStatus) {
                                }
                            });
                        }
                        function equipment_remove(obj) {
                            $(obj).closest('tr').remove();
                        }
                        $(function () {
                            $(".select2").select2();
                        });
</script>