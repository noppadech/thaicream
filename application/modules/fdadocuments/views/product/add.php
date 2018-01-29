<div class="row">
    <div class="col-md-8">
        <?php
        $attributes = array('class' => 'form-horizontal');
        echo modules::run('adminlte/widget/box_content_open', $style = 'primary', FALSE);
        echo form_open('', $attributes);
        ?>
        <div class="form-group">
            <label class="col-md-3 control-label" for="product_id">สูตรสินค้า</label>  
            <div class="col-md-9">
                <select id="product_id" name="product_id" class="form-control select2" required="">
                    <?php
                    foreach ($product as $key => $value) {
                        echo "<option value=\"" . $value->id . "\">" . $value->FDA_thai . " | " . $value->FDA_english . "</option>";
                    }
                    ?>
                </select>
            </div>
        </div>
        <div class="form-group">
            <label class="col-md-3 control-label" for="formula_master">ชื่อการค้า</label>  
            <div class="col-md-9">
                <input id="formula_master" name="formula_master" value="<?php echo set_value('formula_master'); ?>" type="text" class="form-control input-md">
                <span class="text-danger"><?php echo form_error('formula_master'); ?></span>
            </div>
        </div>
        <div class="form-group">
            <label class="col-md-3 control-label" for="fda_product_type">ประเภทผลิตภัณฑ์</label>  
            <div class="col-md-9">
                <input id="fda_product_type" name="fda_product_type" value="<?php echo set_value('fda_product_type'); ?>" type="text" class="form-control input-md">
                <span class="text-danger"><?php echo form_error('fda_product_type'); ?></span>
            </div>
        </div>
        <div class="form-group">
            <label class="col-md-3 control-label" for="fda_product_appearance">ลักษณประเภทผลิตภัณฑ์</label>  
            <div class="col-md-9">
                <input id="fda_product_appearance" name="fda_product_appearance" value="<?php echo set_value('fda_product_appearance'); ?>" type="text" class="form-control input-md">
                <span class="text-danger"><?php echo form_error('fda_product_appearance'); ?></span>
            </div>
        </div>
        <div class="form-group">
            <label class="col-md-3 control-label" for="fda_name_th">ชื่อสินค้าจดแจ้ง อย. ภาษาไทย</label>  
            <div class="col-md-9">
                <input id="fda_name_th" name="fda_name_th" value="<?php echo set_value('fda_name_th'); ?>" type="text" class="form-control input-md">
                <span class="text-danger"><?php echo form_error('fda_name_th'); ?></span>
            </div>
        </div>
        <div class="form-group">
            <label class="col-md-3 control-label" for="fda_name_en">ชื่อสินค้าจดแจ้ง อย. อังกฤษ</label>  
            <div class="col-md-9">
                <input id="fda_name_en" name="fda_name_en" value="<?php echo set_value('fda_name_en'); ?>" type="text" class="form-control input-md">
                <span class="text-danger"><?php echo form_error('fda_name_en'); ?></span>
            </div>
        </div> 

        <div class="form-group">
            <label class="col-md-3 control-label" for="fda_sent_date">วันที่ขอ อย.</label>  
            <div class="col-md-9">
                <input id="fda_sent_date" name="fda_sent_date" value="<?php echo set_value('fda_sent_date'); ?>" type="text" class="form-control input-md datepicker">
                <span class="text-danger"><?php echo form_error('fda_sent_date'); ?></span>
            </div>
        </div>
        <div class="form-group">
            <label class="col-md-3 control-label" for="fda_get_date">วันที่ได้รับ อย.</label>  
            <div class="col-md-9">
                <input id="fda_get_date" name="fda_get_date" value="<?php echo set_value('fda_get_date'); ?>" onchange="date_process(this)" type="text" class="form-control input-md datepicker">
                <span class="text-danger"><?php echo form_error('fda_get_date'); ?></span>
            </div>			<script type="text/javascript">				function date_process(obj) {
                    var fda_date_expire = $('#fda_date_expire');
                    var date_add = new Date($(obj).val());
                    date_add.setFullYear(date_add.getFullYear() + 3);
                    fda_date_expire.val((date_add.getMonth() + 1) + "/" + date_add.getDate() + "/" + date_add.getFullYear());
                }</script>
        </div>
        <div class="form-group">
            <label class="col-md-3 control-label" for="fda_no">เลขทะเบียน อย.</label>  
            <div class="col-md-9">
                <input id="fda_no" name="fda_no" value="<?php echo set_value('fda_no'); ?>" type="text" class="form-control input-md">
                <span class="text-danger"><?php echo form_error('fda_no'); ?></span>
            </div>
        </div>
        <div class="form-group">
            <label class="col-md-3 control-label" for="fda_date_expire">วันที่หมด อายุ อย.</label>  
            <div class="col-md-9">
                <input id="fda_date_expire" name="fda_date_expire" value="<?php echo set_value('fda_date_expire'); ?>" type="text" class="form-control input-md datepicker">
                <span class="text-danger"><?php echo form_error('fda_date_expire'); ?></span>
            </div>
        </div>
        <div class="form-group">
            <label class="col-md-3 control-label" for="fda_status">สถานะ อย.</label>  
            <div class="col-md-9">
                <label class="radio-inline" for="close">
                    <input type="radio" name="fda_status" id="close" value="1">
                    ได้
                </label>
                <label class="radio-inline" for="open">
                    <input type="radio" name="fda_status" id="open" value="0" checked="checked">
                    ไม่ได้
                </label> 
            </div>
        </div>
        <div class="form-group">
            <label class="col-md-3 control-label" for="">หมายเหตุ</label>  
            <div class="col-md-9">
                <input id="" name="fda_remark" value="<?php echo set_value(''); ?>" type="text" class="form-control input-md">
                <span class="text-danger"><?php echo form_error(''); ?></span>
            </div>
        </div>
        <!--Button-->
        <div class="form-group">
            <!--<label class="col-md-4 control-label" for="button1id">Double Button</label>-->
            <div class="col-md-12 text-center">
                <button type="reset" class="btn btn-danger  pull-right"  style="margin-right: 5px;">ยกเลิก</button>
                <button type="submit" class="btn btn-success  pull-right"  style="margin-right: 5px;">บันทึกข้อมูล</button>
            </div>
        </div>
<?php
echo form_close();
echo modules::run('adminlte/widget/box_content_close');
?>
    </div>
</div>

<link rel="stylesheet" href="<?php echo base_url('assets/dist/admin/select2/select2.css?v=171010120507');?>">
<script type="text/javascript" src="<?php echo base_url('assets/dist/admin/select2/select2.full.min.js'); ?>"></script>
<script type="text/javascript" src="<?php echo base_url('assets/dist/admin/mustache-master/mustache.min.js'); ?>"></script>
<script type="text/javascript">
                $(function () {
                $(".select2").select2();
                });
</script>