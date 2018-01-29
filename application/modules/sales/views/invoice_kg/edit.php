<link rel="stylesheet" href="<?php echo base_url('assets/dist/admin/step/demo/css/jquery.steps.css?v=' . date('ymdhis')); ?>" />
<script src="<?php echo base_url('assets/dist/admin/step/build/jquery.steps.js'); ?>"></script>
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
            onFinished: function (event, currentIndex) {
                console.log('submit');
                $('#order').submit();
            }
        });
    });</script>
<?php
$attributes = array(
    'id' => "order",
    'class' => 'form-horizontal'
);

//dd($result);
echo form_open(site_url('sales/invoice_kg/edit/'.$result->order_kg_id), $attributes);
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
                        <input type="text" id="emp_name" name="emp_id" value="<?php echo $result->order_kg_emp_id; ?>" class="form-control" />
                    </div>
                </div>
                <div class="form-group">
                    <label class="col-md-4 control-label" for="inv_id">เลขที่ใบเสนอราคา</label>  
                    <div class="col-md-8">
                        <input type="text" name="inv_id" value="<?php echo $result->order_kg_inv_id; ?>" class="form-control" />
                    </div>
                </div>
                <div class="form-group">
                    <label class="col-md-4 control-label" for="sent_type">ข้อมูลการจัดส่ง</label>  
                    <div class="col-md-8">
                        <select name="sent_type" class="form-control select2">
                            <option value="มารับสินค้าหน้าร้าน" <?php echo ($result->order_kg_inv_id=="มารับสินค้าหน้าร้าน")?"selected":""; ?> >มารับสินค้าหน้าร้าน</option>
                            <option value="จัดส่งโดยบริษัทขนส่งหรือไปรษณีย์" <?php echo ($result->order_kg_inv_id=="จัดส่งโดยบริษัทขนส่งหรือไปรษณีย์")?"selected":""; ?> >จัดส่งโดยบริษัทขนส่งหรือไปรษณีย์</option>
                            <option value="แมสเซ็นเจอร์ส่งให้" <?php echo ($result->order_kg_inv_id=="แมสเซ็นเจอร์ส่งให้")?"selected":""; ?> >แมสเซ็นเจอร์ส่งให้</option>
                            <option value="มารับสินค้าเองที่บริษัทขนส่ง" <?php echo ($result->order_kg_inv_id=="มารับสินค้าเองที่บริษัทขนส่ง")?"selected":""; ?> >มารับสินค้าเองที่บริษัทขนส่ง</option>
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
                            <label class="col-md-4 control-label" for="customer_id">ชื่อลูกค้า</label>  
                            <div class="col-md-8">
                                <select name="customer_id" onchange="get_customer_details(this);" class="form-control select2">
                                    <option value="">----- Select ------</option>
                                    <?PHP
                                    foreach ($customer as $key_customer => $value_customer) {
                                        ?>
                                        <option value="<?php echo $value_customer->id ?>" <?php echo ($result->order_kg_customer_id == $value_customer->id) ? "selected" : "" ?> >
                                            <?php echo $value_customer->customer_name ?>
                                        </option>
                                        <?PHP
                                    }
                                    ?>
                                </select> 
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-md-4 control-label" for="customer_tax_id_number">เลขประจำตัวผู้เสียภาษี</label>  
                            <div class="col-md-8">
                                <input id="customer_tax_id_number" name="customer_tax_id_number" type="text" value="<?php echo $result->order_kg_customer_tax_id_number; ?>" class="form-control input-md">
                                <span class="help-block"></span>  
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-md-4 control-label" for="customer_address">ที่อยู่</label>  
                            <div class="col-md-8">
                                <input id="customer_address" name="customer_address" type="text" value="<?php echo $result->order_kg_customer_address; ?>" class="form-control input-md">
                                <span class="help-block"></span>  
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-md-4 control-label" for="customer_telephone">เบอร์ติดต่อ</label>  
                            <div class="col-md-8">
                                <input id="customer_telephone" name="customer_telephone" type="text" value="<?php echo $result->order_kg_customer_telephone; ?>" class="form-control input-md">
                                <span class="help-block"></span>  
                            </div>
                        </div>
                    </fieldset>
                </div>
                <div class="col-md-6">
                    <fieldset>
                        <legend>ข้อมูลสถานที่จัดส่งสินค้า</legend>
                        <div class="form-group">
                            <label class="col-md-4 control-label" for="customer_order_name">ชื่อผู้รับ</label>  
                            <div class="col-md-8">
                                <input id="customer_order_name" name="customer_order_name" type="text" value="<?php echo $result->order_kg_customer_order_name; ?>" class="form-control input-md">
                                <span class="help-block"></span>  
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-md-4 control-label" for="customer_order_address">ที่อยู่ผู้รับ</label>  
                            <div class="col-md-8">
                                <input id="customer_order_address" name="customer_order_address" type="text" value="<?php echo $result->order_kg_customer_order_address; ?>" class="form-control input-md">
                                <span class="help-block"></span>  
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-md-4 control-label" for="customer_order_telephone">เบอร์ติดต่อผู้รับ</label>  
                            <div class="col-md-8">
                                <input id="customer_order_telephone" name="customer_order_telephone" value="<?php echo $result->order_kg_customer_order_telephone; ?>" type="text" class="form-control input-md">
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
                                <input id="payment_type" name="payment_type" type="text" value="<?php echo $result->order_kg_payment_type; ?>" class="form-control input-md">
                                <span class="help-block"></span>  
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-md-4 control-label" for="payment_tax">ใบกำกับภาษี</label>  
                            <div class="col-md-8">
                                <input id="payment_tax" name="payment_tax" type="text" value="<?php echo $result->order_kg_payment_tax; ?>" class="form-control input-md">
                                <span class="help-block"></span>  
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-md-4 control-label" for="payment_details">รายละเอียดการชำระ</label>  
                            <div class="col-md-8">
                                <input id="payment_details" name="payment_details" type="text" value="<?php echo $result->order_kg_payment_details; ?>" class="form-control input-md">
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
                                <input id="email_info" name="email_info" type="text" value="<?php echo $result->order_kg_email_info; ?>" class="form-control input-md">
                                <span class="help-block"></span>  
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-md-3 control-label" for="facebook_info">ชื่อ Facebook ลูกค้า</label>  
                            <div class="col-md-9">
                                <input id="facebook_info" name="facebook_info" type="text" value="<?php echo $result->order_kg_facebook_info; ?>" class="form-control input-md">
                                <span class="help-block"></span>  
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-md-3 control-label" for="line_info">ชื่อ Line ลูกค้า</label>  
                            <div class="col-md-9">
                                <input id="line_info" name="line_info" type="text" value="<?php echo $result->order_kg_line_info; ?>" class="form-control input-md">
                                <span class="help-block"></span>  
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-md-3 control-label" for="order_info">วิธีการสั่งสินค้า</label>  
                            <div class="col-md-9">
                                <input id="order_info" name="order_info" type="text" value="<?php echo $result->order_kg_order_info; ?>" class="form-control input-md">
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
                                    <th>Description</th>
                                    <th style="width:10%;">Quantity</th>
                                    <th style="width:10%;">Unit </th>
                                    <th style="width:10%;">Unit Price</th>
                                    <th class="text-center" style="width:15%;">Amount</th> 
                                </tr>
                            </thead>
                            <tbody>
                                <?php
                                foreach ($result_details as $key => $value) {
                                    ?>
                                    <tr>
                                        <td class="text-center" style="vertical-align: middle;"><?php echo $key + 1; ?></td>
                                        <td style="vertical-align: middle;">
                                            <?php // dd($value); ?>
                                            <input type="hidden" name="product_id[<?php echo $key; ?>]" value="<?php echo $value->id; ?>" />
                                            <input class="form-control" type="text" name="product_description[<?php echo $key; ?>]" value="<?php echo $value->product_description; ?>" />
                                        </td>
                                        <td style="vertical-align: middle;">
                                            <input onkeyup="check_bill();" class="form-control text-right" type="text" name="product_qty[<?php echo $key; ?>]" value="<?php echo $value->product_qty; ?>" />
                                        </td>
                                        <td style="vertical-align: middle;">
                                            <input onkeyup="check_bill();" class="form-control text-right" type="text" name="product_unit[<?php echo $key; ?>]" value="<?php echo $value->product_unit; ?>" />
                                        </td>
                                        <td style="vertical-align: middle;">
                                            <input onkeyup="check_bill();" class="form-control text-right" type="text" name="product_unit_price[<?php echo $key; ?>]" value="<?php echo $value->product_unit_price; ?>" />
                                        </td>
                                        <td style="vertical-align: middle;">
                                            <input onkeyup="check_bill();" class="form-control text-right" type="text" name="product_amount[<?php echo $key; ?>]" value="<?php echo $value->product_amount; ?>" readonly="" />
                                        </td>
                                    </tr>
                                    <?php
                                }
                                for ($i = 1; $i <= (10 - count($result_details)); $i++) {
                                    ?>
                                    <tr>
                                        <td class="text-center" style="vertical-align: middle;"><?php echo $i + count($result_details); ?></td>
                                        <td style="vertical-align: middle;">
                                            
                                            <input type="hidden" name="product_id[<?php echo (count($result_details) + $i) - 1; ?>]" value="new" />
                                            <input class="form-control" type="text" name="product_description[<?php echo (count($result_details) + $i) - 1; ?>]" />
                                        </td>
                                        <td style="vertical-align: middle;">
                                            <input onkeyup=check_bill();" class="form-control text-right" type="text" name="product_qty[<?php echo (count($result_details) + $i) - 1; ?>]" />
                                        </td>
                                        <td style="vertical-align: middle;">
                                            <input onkeyup="check_bill();" class="form-control text-right" type="text" name="product_unit[<?php echo (count($result_details) + $i) - 1; ?>]" />
                                        </td>
                                        <td style="vertical-align: middle;">
                                            <input onkeyup="check_bill();" class="form-control text-right" type="text" name="product_unit_price[<?php echo (count($result_details) + $i) - 1; ?>]" />
                                        </td>
                                        <td style="vertical-align: middle;">
                                            <input onkeyup="check_bill();" class="form-control text-right" type="text" name="product_amount[<?php echo (count($result_details) + $i) - 1; ?>]" readonly="" />
                                        </td>
                                    </tr>
                                    <?php
                                }
                                ?>
                            </tbody>
                            <tfoot>
                                <tr>
                                    <td class="text-center" style="vertical-align: middle;"></td>
                                    <td style="vertical-align: middle;">ค่าขนส่ง</td>
                                    <td style="vertical-align: middle;">
                                        <input class="form-control text-right" onkeyup="check_bill();" type="text" name="sent_qty" value="<?php echo $result->order_kg_sent_qty; ?>" />
                                    </td>
                                    <td style="vertical-align: middle;">
                                        <input class="form-control text-right" type="text" name="sent_unit" value="<?php echo $result->order_kg_sent_unit; ?>" />
                                    </td>
                                    <td style="vertical-align: middle;">
                                        <input class="form-control text-right" onkeyup="check_bill();" type="text" name="sent_unit_price" value="<?php echo $result->order_kg_sent_unit_price; ?>" />
                                    </td>
                                    <td style="vertical-align: middle;">
                                        <input class="form-control text-right" type="text" name="sent_amount" value="<?php echo $result->order_kg_sent_amount; ?>" readonly="" />
                                    </td>
                                </tr>
                                <tr>
                                    <td rowspan="5" style="vertical-align: middle;"></td>
                                    <td colspan="4" style="vertical-align: middle;">ภาษีมูลค่าเพิ่ม(VAT 7%)</td>
                                    <td style="vertical-align: middle;">
                                        <input class="form-control text-right" type="text" name="vat" value="<?php echo $result->order_kg_vat; ?>" readonly="" />
                                    </td>
                                </tr>
                                <tr>
                                    <td colspan="4" style="vertical-align: middle;">จำนวนเงินรวม</td>
                                    <td style="vertical-align: middle;">
                                        <input class="form-control text-right" type="text" name="total" value="<?php echo $result->order_kg_total; ?>" readonly="" />
                                    </td>
                                </tr>
                                <tr>
                                    <td colspan="4" style="vertical-align: middle;">ตัดเงินมัดจำ</td>
                                    <td style="vertical-align: middle;">
                                        <input class="form-control text-right" onkeyup="check_bill();" type="text" name="deposit" value="<?php echo $result->order_kg_deposit; ?>" />
                                    </td>
                                </tr>
                                <tr>
                                    <td colspan="4" style="vertical-align: middle;">คงเหลือชำระ</td>
                                    <td style="vertical-align: middle;">
                                        <input class="form-control text-right" type="text" name="balance" value="<?php echo $result->order_kg_balance; ?>" readonly="" />
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
<link rel="stylesheet" href="<?php echo base_url('assets/dist/admin/select2/select2.css?v=' . date('ymdhis')); ?>" />
<script type="text/javascript" src="<?php echo base_url('assets/dist/admin/select2/select2.full.min.js'); ?>"></script>
<script type="text/javascript" src="<?php echo base_url('assets/dist/admin/mustache-master/mustache.min.js'); ?>"></script>
<script type="text/javascript">
                                            function check_bill() {
                                                var product_qty = $('input[name^=product_qty]');
//                                                var product_unit_price = $('input[name^=product_unit_price]');
//                                                var product_amount = $('input[name^=product_amount]');
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
//                                                console.log("------------------------------------------");
                                                var sent_qty = $('input[name^="sent_qty"]').val();
                                                var sent_unit_price = $('input[name^="sent_unit_price"]').val();
                                                var sent_total = sent_qty * sent_unit_price;
//                                                var sent_amount = 
                                                var cal_vat = (sum * 7) / 100;
                                                var cal_total = sum + sent_total + cal_vat;
                                                var deposit = $('input[name^="deposit"]').val();
                                                var balance = cal_total - deposit;
                                                $('input[name^="sent_amount"]').val(sent_total);
                                                $('input[name^="vat"]').val(cal_vat);
                                                $('input[name^="total"]').val(cal_total);
                                                $('input[name^="balance"]').val(balance);
                                            }
                                            $(function () {
                                                $(".select2").select2();
                                            });
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
                                                        console.log(data);
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