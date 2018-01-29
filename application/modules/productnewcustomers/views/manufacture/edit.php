<div class="row">
    <div class="col-md-6">
        <div class="box box-primary"> 
            <div class="box-body">
                <?PHP
//                dd($manufacture);
//                dd($fda);
                $attributes = array('class' => 'form-horizontal', "role" => "form");
                echo form_open("", $attributes);
                ?>
                <div class="form-group">
                    <label class="col-sm-3 control-label">ลูกค้า</label>
                    <div class="col-sm-9">
                        <select class="form-control select2" id="customer_id" name="customer_id" onchange="customer_selected(this);">
                            <option value="">------ ลูกค้า ------</option>
                            <?php
                            foreach ($customer as $key => $value) {
                                ?>
                                <option value="<?php echo $value->id; ?>" <?php echo ($manufacture->customer_id == $value->id) ? "selected=\"\"" : ""; ?> ><?php echo $value->customer_name; ?></option>
                                <?php
                            }
                            ?>
                        </select>
                    </div>
                </div>
                <div class="form-group">
                    <label class="col-sm-3 control-label">สินค้าที่ผลิต</label>
                    <div class="col-sm-9">
                        <select id="product" class="form-control select2" name="fda_id" onchange="generate_create_code();">
                            <option value="">------ สินค้า ------</option>
                            <?php
                            foreach ($fda as $key => $value) {
                                ?>
                                <option value="<?php echo $value->id;?>"<?php echo ($manufacture->fda_id == $value->id) ? "selected=\"\"" : ""; ?> ><?php echo $value->formula_master;?></option>
                                <?php
                            }
                            ?>
                        </select>
                    </div>
                </div>
                <div class="form-group">
                    <label class="col-sm-3 control-label">รหัสการผลิต</label>
                    <div class="col-sm-9">
                        <input type="text" id="create_code" name="create_code" class="form-control" value="<?php echo $manufacture->manufacture_code;?>">
                    </div>
                </div>
                <div class="form-group">
                    <label class="col-sm-3 control-label">วันที่ผลิต</label>
                    <div class="col-sm-9">
                        <input type="text" name="create_date" class="form-control datepicker" placeholder="" value="<?php echo $manufacture->manufacture_create_date;?>">
                    </div>
                </div>
                <div class="form-group">
                    <label class="col-sm-3 control-label">Lot.</label>
                    <div class="col-sm-9">
                        <input type="text" name="lot" class="form-control" placeholder="" value="<?php echo $manufacture->manufacture_lot;?>">
                    </div>
                </div>
                <div class="form-group">
                    <label class="col-sm-3 control-label">เครื่อง</label>
                    <div class="col-sm-9">
                        <input type="text" name="machain" class="form-control" placeholder="" value="<?php echo $manufacture->manufacture_machine;?>">
                    </div>
                </div>
                <div class="form-group">
                    <label class="col-sm-3 control-label">หม้อที่</label>
                    <div class="col-sm-9">
                        <input type="text" name="boit" class="form-control" placeholder="" value="<?php echo $manufacture->manufacture_pot;?>">
                    </div>
                </div>
                <div class="form-group">
                    <label class="col-sm-3 control-label">จำนวน</label>
                    <div class="col-sm-9">
                        <div class="input-group">
                            <input type="text" name="qty" class="form-control" placeholder="" value="<?php echo $manufacture->manufacture_qty;?>">
                            <span class="input-group-addon">kg.</span>
                        </div>
                    </div>
                </div>
                <div class="form-group">
                    <label class="col-sm-3 control-label">สถานะการผลิต</label>
                    <div class="col-sm-9"> 

                        <label class="radio-inline" for="radios-1">
                            <input type="radio" name="status" id="radios-1" <?php echo ($manufacture->manufacture_status == 0)?"checked=\"\"":"";?> value="0">
                            รอการผลิต
                        </label> 

                        <label class="radio-inline" for="radios-2">
                            <input type="radio" name="status" id="radios-2" <?php echo ($manufacture->manufacture_status == 1)?"checked=\"\"":"";?> value="1">
                            ผลิตแล้ว
                        </label> 

                        <label class="radio-inline" for="radios-3">
                            <input type="radio" name="status" id="radios-3" <?php echo ($manufacture->manufacture_status == 2)?"checked=\"\"":"";?> value="2">
                            เสีย
                        </label>
                    </div>
                </div>
                <div class="box-footer">
                    <button type="submit" class="btn btn-info pull-right">แก้ไข</button>
                </div>
                <input id="csrf_protection" type="hidden" name="<?php echo $this->security->get_csrf_token_name(); ?>" value="<?php echo $this->security->get_csrf_hash(); ?>" />
                <?php echo form_close(); ?>	
            </div>
        </div>
    </div>
</div>
<script type="text/javascript">
    function generate_create_code() {
        var customer_id = $('#customer_id').val();
        var product = $('#product').val();
        $('#create_code').val('tc-' + ("000" + customer_id).slice(-3) + ("000" + product).slice(-3) + "<?php echo date('my'); ?>");
    }
    function customer_selected(obj) {
        var customer_id = $(obj).val();
        var csrf_protection_val = $('#csrf_protection').val();
        var result = "";
        $.ajax({
            url: "<?PHP echo site_url('productolecustomers/manufacture/get_product'); ?>",
            type: 'POST',
            data: {customer_id: customer_id,<?php echo $this->security->get_csrf_token_name(); ?>: csrf_protection_val},
            dataType: 'json',
            success: function (data, textStatus, jqXHR) {
                result = data;
                $('#csrf_protection').val(data.<?php echo $this->security->get_csrf_token_name(); ?>);
            },
            error: function (jqXHR, textStatus, errorThrown) {
                console.log(textStatus);
            },
            complete: function (jqXHR, textStatus) {
                var html = '<option value="">------ สินค้า ------</option>';
                $.each(result, function (index, value) {
                    if (index !== "csrf_test_name") {
                        html += '<option value="' + value.id + '">' + value.formula_master + '</option>';
                    }
                });
                $('#product').html(html);
            }
        });
    }
</script>