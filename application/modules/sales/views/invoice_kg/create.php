<link rel="stylesheet" href="<?php echo base_url('assets/dist/admin/step/demo/css/jquery.steps.css?v=' . date('ymdhis')); ?>" />
<script src="<?php echo base_url('assets/dist/admin/step/build/jquery.steps.js'); ?>"></script>
<link rel="stylesheet" href="<?php echo base_url('assets/dist/admin/select2/select2.css?v=' . date('ymdhis')); ?>" />
<script type="text/javascript" src="<?php echo base_url('assets/dist/admin/select2/select2.full.min.js'); ?>"></script>

<script>
    $(function ()
    {
        $("#step_setup").steps({
            headerTag: "h2",
            bodyTag: "section",
            enableAllSteps: true,
            enablePagination: true,
            transitionEffect: "slideLeft",
            autoFocus: true,
            onStepChanged: function (event, currentIndex, newIndex)
            {
                $(function () {
                    $(".select2").select2();
                });
            },
            onFinished: function (event, currentIndex) {
                console.log('submit');
                $('#order').submit();
            }
        });
        $(function () {
            $(".select2").select2();
        });
    });
</script>
<?php
$attributes = array(
    'id' => "order",
    'class' => 'form-horizontal'
);
echo form_open(site_url('sales/invoice_kg/create/process'), $attributes);
?>
<div class="row">

    <div class="col-md-12">
        <?php
        echo Modules::run('adminlte/Widget/box_open', 'ข้อมูลทั่วไป', 'primary', FALSE);
        ?>
        <div id="step_setup">
            <!--Tab 0-->
            <h2>ข้อมูลทั่วไป</h2>
            <section>
                <div class="form-group">
                    <label class="col-md-4 control-label" for="emp_id">รหัสพนักงาน(เซลล์)ผู้รับผิดชอบ</label>  
                    <div class="col-md-8">
                        <select id="emp_id" name="emp_id" class="form-control select2" onchange="get_inv_code(this);">
                            <option value="">------ กรุณาเลือกพนักงาน ------</option>
                            <?php
                            foreach ($sale_department as $key => $value) {
                                ?>
                                <option value="<?PHP echo $value->admin_id ?>" data-username="<?PHP echo $value->username ?>">
                                    <?PHP echo $value->first_name ?>
                                    &nbsp;
                                    <?PHP echo $value->last_name ?>
                                    &nbsp;
                                    ( <?PHP echo $value->username ?> )
                                </option>
                                <?php
                            }
                            ?>
                        </select>
                    </div>
                </div>
                <div class="form-group">
                    <label class="col-md-4 control-label" for="inv_code_id">เลขที่ใบเสนอราคา</label>  
                    <div class="col-md-8">
                        <input type="text" id="inv_code_id" name="inv_code_id" class="form-control" />
                    </div>
                </div>
                <div class="form-group">
                    <label class="col-md-4 control-label" for="customer_id">ข้อมูลการจัดส่ง</label>  
                    <div class="col-md-8">
                        <select name="sent_type" class="form-control select2">
                            <option value="มารับสินค้าหน้าร้าน">มารับสินค้าหน้าร้าน</option>
                            <option value="จัดส่งโดยบริษัทขนส่งหรือไปรษณีย์">จัดส่งโดยบริษัทขนส่งหรือไปรษณีย์</option>
                            <option value="แมสเซ็นเจอร์ส่งให้">แมสเซ็นเจอร์ส่งให้</option>
                            <option value="มารับสินค้าเองที่บริษัทขนส่ง">มารับสินค้าเองที่บริษัทขนส่ง</option>
                        </select>
                    </div>
                </div>
            </section>
            <!--Tab 1-->
            <h2>ข้อมูลลูกค้า</h2>
            <section> 
                <div class="col-md-6">
                    <fieldset>
                        <legend>ข้อมูลลูกค้า</legend>
                        <div class="form-group">
                            <label class="col-md-4 control-label" for="customer_type">ประเภทลูกค้า</label>
                            <div class="col-md-4"> 
                                <div class="radio">
                                    <label for="customer_type_old">
                                        <input type="radio" name="radios" id="customer_type_old" value="old" checked="checked" />
                                        ลูกค้าใหม่
                                    </label> 
                                    <label for="customer_type_new">
                                        <input type="radio" name="radios" id="customer_type_new" value="new" />
                                        ลูกค้าเก่า
                                    </label>
                                </div>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-md-4 control-label" for="customer_id">ชื่อลูกค้า</label>  
                            <div class="col-md-8">
                                <select name="customer_id" onchange="get_customer_details(this);" class="form-control select2">
                                    <option value="">----- Select ------</option>
                                    <?PHP
                                    foreach ($customer as $key_customer => $value_customer) {
                                        ?>
                                        <option value="<?php echo $value_customer->id ?>"><?php echo $value_customer->customer_name ?></option>
                                        <?PHP
                                    }
                                    ?>
                                </select> 
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-md-4 control-label" for="customer_id">ชื่อลูกค้าใหม่</label>  
                            <div class="col-md-8">
                                <input type="text" name="new_customer" class="form-control"/>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-md-4 control-label" for="customer_tax_id_number">เลขประจำตัวผู้เสียภาษี</label>  
                            <div class="col-md-8">
                                <input id="customer_tax_id_number" name="customer_tax_id_number" type="text" class="form-control input-md">
                                <span class="help-block"></span>  
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-md-4 control-label" for="customer_address">ที่อยู่</label>  
                            <div class="col-md-8">
                                <input id="customer_address" name="customer_address" type="text" class="form-control input-md">
                                <span class="help-block"></span>  
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-md-4 control-label" for="customer_telephone">เบอร์ติดต่อ</label>  
                            <div class="col-md-8">
                                <input id="customer_telephone" name="customer_telephone" type="text" class="form-control input-md">
                                <span class="help-block"></span>  
                            </div>
                        </div>
                        <!--                        <div class="form-group">
                                                    <label class="col-md-4 control-label" for="customer_type">ประเภทลูกค้า</label>  
                                                    <div class="col-md-8">
                                                        <label class="radio-inline" for="customer_type-0">
                                                            <input type="radio" name="customer_type" id="radios-0" value="P">
                                                            บุคคลธรรมดา
                                                        </label> 
                                                        <label class="radio-inline" for="customer_type-1">
                                                            <input type="radio" name="customer_type" id="radios-1" value="C">
                                                            บริษัท
                                                        </label>
                                                        <input id="customer_type" name="customer_type" type="text" class="form-control input-md">
                                                        <span class="help-block"></span>  
                                                    </div>
                                                </div>-->
                    </fieldset>
                </div>
                <div class="col-md-6">
                    <fieldset>
                        <legend>ข้อมูลสถานที่จัดส่งสินค้า</legend>
                        <div class="form-group">
                            <label class="col-md-4 control-label" for="customer_order_name">ชื่อผู้รับ</label>  
                            <div class="col-md-8">
                                <input id="customer_order_name" name="customer_order_name" type="text" class="form-control input-md">
                                <span class="help-block"></span>  
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-md-4 control-label" for="customer_order_address">ที่อยู่ผู้รับ</label>  
                            <div class="col-md-8">
                                <input id="customer_order_address" name="customer_order_address" type="text" class="form-control input-md">
                                <span class="help-block"></span>  
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-md-4 control-label" for="customer_order_telephone">เบอร์ติดต่อผู้รับ</label>  
                            <div class="col-md-8">
                                <input id="customer_order_telephone" name="customer_order_telephone" type="text" class="form-control input-md">
                                <span class="help-block"></span>  
                            </div>
                        </div>
                    </fieldset>
                </div>
            </section>
            <!--Tab 2-->
            <h2>วิธีการชำระเงิน & ข้อมูลออนไลน์</h2>
            <section>
                <div class="col-md-6">
                    <fieldset>
                        <legend>วิธีการชำระเงิน</legend>
                        <div class="form-group">
                            <label class="col-md-4 control-label" for="payment_type">วิธีการชำระเงิน</label>  
                            <div class="col-md-8">
                                <input id="payment_type" name="payment_type" type="text" class="form-control input-md">
                                <span class="help-block"></span>  
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-md-4 control-label" for="payment_tax">ใบกำกับภาษี</label>  
                            <div class="col-md-8">
                                <input id="payment_tax" name="payment_tax" type="text" class="form-control input-md">
                                <span class="help-block"></span>  
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-md-4 control-label" for="payment_details">ชื่อลูกค้า</label>  
                            <div class="col-md-8">
                                <input id="payment_details" name="payment_details" type="text" class="form-control input-md">
                                <span class="help-block"></span>  
                            </div>
                        </div>
                    </fieldset>
                </div>
                <div class="col-md-6">
                    <fieldset>
                        <legend>ข้อมูลออนไลน์</legend>
                        <div class="form-group">
                            <label class="col-md-3 control-label" for="email_info">ชื่ออีเมล์ลูกค้า</label>  
                            <div class="col-md-9">
                                <input id="email_info" name="email_info" type="text" class="form-control input-md">
                                <span class="help-block"></span>  
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-md-3 control-label" for="facebook_info">ชื่อ Facebook ลูกค้า</label>  
                            <div class="col-md-9">
                                <input id="facebook_info" name="facebook_info" type="text" class="form-control input-md">
                                <span class="help-block"></span>  
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-md-3 control-label" for="line_info">ชื่อ Line ลูกค้า</label>  
                            <div class="col-md-9">
                                <input id="line_info" name="line_info" type="text" class="form-control input-md">
                                <span class="help-block"></span>  
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-md-3 control-label" for="order_info">วิธีการสั่งสินค้า</label>  
                            <div class="col-md-9">
                                <input id="order_info" name="order_info" type="text" class="form-control input-md">
                                <span class="help-block"></span>  
                            </div>
                        </div>
                    </fieldset>
                </div>
            </section>
            <!--Tab 3-->
            <h2>รายการสินค้า</h2>
            <section>
                <div class="row">
                    <div class="col-xs-12">
                        <table class="table table-bordered">
                            <thead>
                                <tr>
                                    <th>No.</th>
                                    <th>Code</th>
                                    <th>Description</th>
                                    <th style="width:10%;">Quantity</th>
                                    <th style="width:10%;">Unit </th>
                                    <th style="width:10%;">Unit Price</th>
                                    <th class="text-center" style="width:15%;">Amount</th> 
                                </tr>
                            </thead>
                            <tbody>
                                <?php
                                for ($i = 0; $i < 10; $i++) {
                                    ?>
                                    <tr>
                                        <td class="text-center" style="vertical-align: middle;"><?php echo $i + 1; ?></td>
                                        <td style="vertical-align: middle;">
                                            <input class="form-control" type="text" name="product_food_and_drug[<?php echo $i; ?>]" value="" />
                                        </td>
                                        <td style="vertical-align: middle;">
                                            <input class="form-control" type="text" name="product_description[<?php echo $i; ?>]" value="" />
                                        </td>
                                        <td style="vertical-align: middle;">
                                            <input class="form-control text-right" onkeyup="check_bill();" type="text" name="product_qty[<?php echo $i; ?>]" value="" />
                                        </td>
                                        <td style="vertical-align: middle;">
                                            <input class="form-control text-right" type="text" name="product_unit[<?php echo $i; ?>]" value="" />
                                        </td>
                                        <td style="vertical-align: middle;">
                                            <input class="form-control text-right" onkeyup="check_bill();" type="text" name="product_unit_price[<?php echo $i; ?>]" value="" />
                                        </td>
                                        <td style="vertical-align: middle;">
                                            <input class="form-control text-right" type="text" name="product_amount[<?php echo $i; ?>]" value="" />
                                        </td>
                                    </tr>
                                    <?php
                                }
                                ?>
                            </tbody>
                            <tfoot>
                                <tr>
                                    <td class="text-center" style="vertical-align: middle;"></td>
                                    <td colspan="2" style="vertical-align: middle;">ค่าขนส่ง</td>
                                    <td style="vertical-align: middle;">
                                        <input class="form-control text-right" onkeyup="check_bill();" type="text" name="sent_qty" />
                                    </td>
                                    <td style="vertical-align: middle;">
                                        <input class="form-control text-right" type="text" name="sent_unit" />
                                    </td>
                                    <td style="vertical-align: middle;">
                                        <input class="form-control text-right" onkeyup="check_bill();" type="text" name="sent_unit_price" />
                                    </td>
                                    <td style="vertical-align: middle;">
                                        <input class="form-control text-right" type="text" name="sent_amount" />
                                    </td>
                                </tr>
                                <tr>
                                    <td rowspan="5" style="vertical-align: middle;"></td>
                                    <td colspan="5" style="vertical-align: middle;">ภาษีมูลค่าเพิ่ม(VAT 7%)</td>
                                    <td style="vertical-align: middle;">
                                        <input class="form-control text-right" type="text" name="vat" />
                                    </td>
                                </tr>
                                <tr>
                                    <td colspan="5" style="vertical-align: middle;">จำนวนเงินรวม</td>
                                    <td style="vertical-align: middle;">
                                        <input class="form-control text-right" type="text" name="total" value="" />
                                    </td>
                                </tr>
                                <tr>
                                    <td colspan="5" style="vertical-align: middle;">ตัดเงินมัดจำ</td>
                                    <td style="vertical-align: middle;">
                                        <input class="form-control text-right" onkeyup="check_bill();" type="text" name="deposit" value="" />
                                    </td>
                                </tr>
                                <tr>
                                    <td colspan="5" style="vertical-align: middle;">คงเหลือชำระ</td>
                                    <td style="vertical-align: middle;">
                                        <input class="form-control text-right" type="text" name="balance" value="" />
                                    </td>
                                </tr>
                            </tfoot>
                        </table>
                    </div>
                </div>
            </section>
        </div>
        <?php
        echo Modules::run('adminlte/Widget/box_close');
        ?>
    </div>
</div>

<?php
echo form_close();
?>
<script type="text/javascript" src="<?php echo base_url('assets/dist/admin/mustache-master/mustache.min.js'); ?>"></script>
<script type="text/javascript">
    function get_inv_code(obj) {
        console.log($(obj).val());
        console.log($(obj).find(':selected').data('username'));
        var user_id = $(obj).val();
        var user = $(obj).find(':selected').data('username');
        $.ajax({
            url: "invoice_kg/get_inv_code",
            type: 'POST',
//            dataType: 'json',
            data:{
                user_id:user_id,
                user:user,
                csrf_test_name: $('input[name^=csrf_test_name]').val()
            },
            success: function (data, textStatus, jqXHR) {
                console.log(data);
            },
            error: function (jqXHR, textStatus, errorThrown) {
                console.log(textStatus);
            },
            complete: function (jqXHR, textStatus) {

            }

        });
    }
    function check_bill() {
        var product_qty = $('input[name^=product_qty]');
        var sum = 0;
        var val_product_qty = 0;
        var val_product_unit_price = 0;
        var summary = 0;
        product_qty.each(function (index, value) {
            val_product_qty = parseFloat($('input[name^="product_qty[' + index + ']"]').val());
            val_product_unit_price = parseFloat($('input[name^="product_unit_price[' + index + ']"]').val());
            summary = parseFloat(val_product_qty * val_product_unit_price);
            if (!isNaN(val_product_qty) && !isNaN(val_product_unit_price)) {
                if (!isNaN(summary)) {
                    $('input[name^="product_amount[' + index + ']"]').val(summary);
                    sum += summary;
                }
            }
        });
        var sent_qty = $('input[name^="sent_qty"]').val();
        var sent_unit_price = $('input[name^="sent_unit_price"]').val();
        var sent_total = sent_qty * sent_unit_price;
        var cal_vat = (sum * 7) / 100;
        var cal_total = sum + sent_total + cal_vat;
        var deposit = $('input[name^="deposit"]').val();
        var balance = cal_total - deposit;
        $('input[name^="sent_amount"]').val(sent_total);
        $('input[name^="vat"]').val(cal_vat);
        $('input[name^="total"]').val(cal_total);
        $('input[name^="balance"]').val(balance);
    }
    function get_customer_details(obj) {
        console.log($(obj).val());
        var res = "";
        $.ajax({
            url: "<?php echo site_url('sales/invoice_kg/get_customer_details') ?>",
            type: 'POST',
            dataType: 'json',
            async: true,
            data: {
                customer_id: $(obj).val(),
                csrf_test_name: $('input[name^=csrf_test_name]').val()
            },
            success: function (data, textStatus, jqXHR) {
                //                                                        console.log(data);
                res = data;
            },
            complete: function (jqXHR, textStatus) {
                $('#customer_address').val(res.customer_address);
                $('#customer_tax_id_number').val(res.customer_tax_id_number);
                $('#customer_telephone').val(res.customer_telephone);
            }
        });
    }
</script>