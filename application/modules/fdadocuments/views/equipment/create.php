<div class="row">
    <div class="col-md-8">
        <?php
        $attributes = array('class' => 'form-horizontal');
        echo modules::run('adminlte/widget/box_content_open', $style = 'primary', FALSE);
        echo form_open('', $attributes);
        ?>
        <div class="form-group">
            <label class="col-md-4 control-label" for="equipment_code">รหัสเครื่องมือ/อุปกรณ์</label>  
            <div class="col-md-4">
                <input id="equipment_code" name="equipment_code" type="text" placeholder="รหัสเครื่องมือ/อุปกรณ์" class="form-control input-md">
                <!--<span class="help-block">help</span>-->  
            </div>
        </div>
        <div class="form-group">
            <label class="col-md-4 control-label" for="equipment_title">ชื่อเครื่องมือ/อุปกรณ์</label>  
            <div class="col-md-4">
                <input id="equipment_title" name="equipment_title" type="text" placeholder="ชื่อเครื่องมือ/อุปกรณ์" class="form-control input-md">
                <!--<span class="help-block">help</span>-->  
            </div>
        </div>
        <div class="form-group">
            <label class="col-md-4 control-label" for="equipment_detail">รายละเอียดเครื่องมือ/อุปกรณ์</label>  
            <div class="col-md-4">
                <input id="equipment_detail" name="equipment_detail" type="text" placeholder="รายละเอียดเครื่องมือ/อุปกรณ์" class="form-control input-md">
                <!--<span class="help-block">help</span>-->  
            </div>
        </div>
        <div class="form-group">
            <label class="col-md-4 control-label"></label>
            <div class="col-md-8">
                <button type="submit" class="btn btn-success">Submit</button>
                <button type="button" onclick="history.back();" class="btn btn-danger">Back</button>
            </div>
        </div>
        <?php
        echo form_close();
        echo modules::run('adminlte/widget/box_content_close');
        ?>
    </div>
</div>
<link rel="stylesheet" href="<?php echo base_url('assets/dist/admin/select2/select2.css?v=' . date('ymdhis')); ?>">
<script type="text/javascript" src="<?php echo base_url('assets/dist/admin/select2/select2.full.min.js'); ?>"></script>
<script type="text/javascript">
    $(function () {
        $(".select2").select2();
    });
</script>