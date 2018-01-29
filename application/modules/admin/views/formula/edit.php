<div class="row">
    <div class="col-sm-12 col-md-12 col-lg-12">
        <?php
        echo Modules::run('adminlte/Widget/box_open', '', $style = 'primary', $solid = FALSE);
        $attributes = array(
            'class' => 'form-horizontal'
        );
        echo form_open('admin/formula/edit/'.$master_id.'/process', $attributes);
        ?> 
        <div class="col-xs-12"> 
            <div class="form-group">
                <label class="col-md-3 control-label">ชื่อสินค้าจดแจ้ง อย ภาษาไทย</label>  
                <div class="col-md-9">
                    <input name="FDA_thai" type="text" 
                           placeholder="ชื่อสินค้าจดแจ้ง อย ภาษาไทย" 
                           class="form-control input-md" 
                           value="<?php echo $result->FDA_thai; ?>"
                           />
                </div>
            </div>  
        </div>
        <div class="col-xs-12"> 
            <div class="form-group">
                <label class="col-md-3 control-label">ชื่อสินค้าจดแจ้ง อย ภาษาอังกฤษ</label>  
                <div class="col-md-9">
                    <input name="FDA_english" type="text" 
                           placeholder="ชื่อสินค้าจดแจ้ง อย ภาษาอังกฤษ" 
                           class="form-control input-md" 
                           value="<?php echo $result->FDA_english; ?>"
                           />
                </div>
            </div>
        </div>
        <div class="col-xs-12">   
            <div class="form-group">
                <label class="col-md-3 control-label">ประเภทผลิตภัณฑ์</label>  
                <div class="col-md-9">
                    <input name="product_type" type="text" 
                           placeholder="ประเภทผลิตภัณฑ์" 
                           class="form-control input-md"
                           value="<?php echo $result->product_type; ?>"
                           />
                </div>
            </div>  
        </div>
        <div class="col-xs-12"> 
            <div class="form-group">
                <label class="col-md-3 control-label">ลักษณประเภทผลิตภัณฑ์</label>  
                <div class="col-md-9">
                    <input name="product_appearance" type="text" 
                           placeholder="ลักษณประเภทผลิตภัณฑ์" 
                           class="form-control input-md"
                           value="<?php echo $result->product_appearance; ?>"
                           />
                </div>
            </div>
        </div>
        <div class="col-md-12 text-center">
            <button type="button" onclick="history.back();" class="btn btn-warning pull-right">ย้อนกลับ</button>
            <button type="submit" class="btn btn-success pull-right">แก้ไขข้อมูล</button>
            <button type="reset" class="btn btn-danger pull-right">ยกเลิก</button>
        </div>
        <?php
        echo form_close();
        echo Modules::run('adminlte/Widget/box_close');
        ?>
    </div>
</div>