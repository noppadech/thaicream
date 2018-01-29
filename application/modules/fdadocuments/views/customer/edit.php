<div class="row">
    <div class="col-md-8">
        <?php
        $attributes = array('class' => 'form-horizontal');
        echo modules::run('adminlte/widget/box_content_open', $style = 'primary', FALSE);
        echo form_open('', $attributes);
        ?>
        <div class="form-group">
            <label class="col-md-3 control-label" for="customer_name">ชื่อ</label>  
            <div class="col-md-9">
                <input id="customer_name" name="customer_name" value="<?php echo $result->customer_name; ?>" type="text" class="form-control input-md" />
                <span class="text-danger"><?php echo form_error('customer_name'); ?></span>
            </div>
        </div>
        <div class="form-group">
            <label class="col-md-3 control-label" for="customer_tax_id_number">เลขที่เสียภาษี</label>  
            <div class="col-md-9">
                <input id="customer_tax_id_number" name="customer_tax_id_number" value="<?php echo $result->customer_tax_id_number; ?>" type="text" class="form-control input-md">
                <span class="text-danger"><?php echo form_error('customer_tax_id_number'); ?></span>
            </div>
        </div>
        <div class="form-group">
            <label class="col-md-3 control-label" for="customer_address">ที่อยู่</label>  
            <div class="col-md-9">
                <input id="customer_address" name="customer_address" value="<?php echo $result->customer_address; ?>" type="text" class="form-control input-md">
                <span class="text-danger"><?php echo form_error('customer_address'); ?></span>
            </div>
        </div>
        <div class="form-group">
            <label class="col-md-3 control-label" for="customer_address">ประเภทลูกค้า</label>  
            <div class="col-md-9">
                <label class="radio-inline" for="customer_type-0">
                    <input type="radio" name="customer_type" id="radios-0" value="P" <?php echo ($result->customer_type=="P")?"checked=\"\"":"";?> />
                    บุคคลธรรมดา
                </label> 
                <label class="radio-inline" for="customer_type-1">
                    <input type="radio" name="customer_type" id="radios-1" value="C" <?php echo ($result->customer_type=="C")?"checked=\"\"":"";?> />
                    บริษัท
                </label> 
                <span class="text-danger"><?php echo form_error('customer_type'); ?></span>
            </div>
        </div>
        <div class="form-group">
            <label class="col-md-3 control-label" for="customer_telephone">เบอร์ติดต่อ</label>  
            <div class="col-md-9">
                <input id="customer_telephone" name="customer_telephone" value="<?php echo $result->customer_telephone; ?>" type="text" class="form-control input-md" />
                <span class="text-danger"><?php echo form_error('customer_telephone'); ?></span>
            </div>
        </div>
        <div class="form-group">
            <label class="col-md-3 control-label" for="customer_status">สถานะ</label>  
            <div class="col-md-9">
                <?php
                $checked1 = "";
                $checked2 = "";
                if ($result->customer_status == 0) {
                    $checked1 = "checked=\"checked\"";
                } else {
                    $checked2 = "checked=\"checked\"";
                }
                ?>
                <label class="radio-inline" for="close">
                    <input type="radio" name="customer_status" id="close" value="0" <?php echo $checked1; ?> />
                    ปิด
                </label>
                <label class="radio-inline" for="open">
                    <input type="radio" name="customer_status" id="open" value="1" <?php echo $checked2; ?> />
                    เปิด
                </label> 
            <!--<input id="customer_status" name="customer_status" type="text" class="form-control input-md">-->
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