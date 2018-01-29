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
            onStepChanging: function (event, currentIndex, newIndex) {
                if (currentIndex === 2) {
                    console.log($('textarea[name^=comment]').val());
                    if ($('textarea[name^=comment]').val() === "") {
                        alert('กรุณากรอกข้อมูล Comment');
                        return false;
                    } else {
                        return true;
                    }
                } else {
                    return true;
                }
            },
            onFinished: function (event, currentIndex) {
                if ($('textarea[name^=comment]').val() === "") {
                    alert('กรุณากรอกข้อมูล Comment');
                } else if ($('textarea[name^=revise]').val() === "") {
                    alert('กรุณากรอกข้อมูล Revise');
                } else {
//                    console.log('submit');
                    $('#order').submit();
                }
            }
        });
    });
</script>
<style type="text/css">
    .wizard > .steps > ul > li{
        width: 25%;
    }
    .wizard > .content > .body{
        width: 100%;
    }
</style>
<?php
//dd($result);
$attributes = array(
    'class' => 'form-horizontal',
    'id' => 'order'
);
echo form_open_multipart(site_url('sales/invoice_brand/edit/' . $result->order_brand_id), $attributes);
?>
<div class="row"> 
    <div class="col-md-12">
        <?php
        echo Modules::run('adminlte/Widget/box_open', 'ข้อมูลทั่วไป', 'primary', FALSE);
        ?>
        <div id="step_setup">
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
//                                        dd($value_customer);
                                        ?>
                                        <option value="<?php echo $value_customer->id ?>" <?php echo ($value_customer->id == $result->order_brand_customer_id) ? "selected" : "" ?>><?php echo $value_customer->customer_name ?></option>
                                        <?PHP
                                    }
                                    ?>
                                </select> 
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-md-4 control-label" for="customer_tax_id_number">เลขประจำตัวผู้เสียภาษี</label>  
                            <div class="col-md-8">
                                <input id="customer_tax_id_number" name="customer_tax_id_number" type="text" value="<?php echo $result->order_brand_customer_tax_id_number; ?>" class="form-control input-md">
                                <span class="help-block"></span>  
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-md-4 control-label" for="customer_address">ที่อยู่</label>  
                            <div class="col-md-8">
                                <input id="customer_address" name="customer_address" type="text" value="<?php echo $result->order_brand_customer_address; ?>" class="form-control input-md">
                                <span class="help-block"></span>  
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-md-4 control-label" for="customer_telephone">เบอร์ติดต่อ</label>  
                            <div class="col-md-8">
                                <input id="customer_telephone" name="customer_telephone" type="text" value="<?php echo $result->order_brand_customer_telephone; ?>" class="form-control input-md">
                                <span class="help-block"></span>  
                            </div>
                        </div>
                    </fieldset>
                </div>
                <div class="col-md-6">
                    <fieldset>
                        <legend>ข้อมูล แบรนด์</legend>
                        <div class="form-group">
                            <label class="col-md-12">ชื่อแบรนด์ภาษาไทย</label>  
                            <div class="col-md-12">
                                <input id="" name="brand_th" type="text" value="<?php echo $result->order_brand_brand_th; ?>" class="form-control input-md">
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-md-12">ชื่อแบรนด์ภาษาอังกฤษ</label>  
                            <div class="col-md-12">
                                <input id="" name="brand_en" type="text" value="<?php echo $result->order_brand_brand_en; ?>" class="form-control input-md">
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-md-12" for="">รายละเอียด</label>  
                            <div class="col-md-12">
                                <textarea name="brand_details" class="form-control" style="resize: vertical;"><?php echo $result->order_brand_brand_details; ?></textarea>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-md-12" for="">รูปที่เกี่ยวข้อง</label>  
                            <div class="col-md-12">
                                <input type="file" name="do_upload[]" multiple="" />
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-md-12 text-danger">เลือกเพื่อลบ</label> 
                            <?php
                            foreach ($result_img as $key => $value) {
                                if ($value->order_brand_img_name != "<p>You did not select a file to upload.</p>") {
                                    ?>
                                    <label class="col-md-2 text-center" for="check_img_<?php echo $key; ?>" >
                                        <img class="img-responsive" src="<?php echo site_url('uploads/' . $value->order_brand_img_name); ?>" />
                                        <!--<br/>-->
                                        <input type="checkbox" id="check_img_<?php echo $key; ?>" name="remove_img[]" value="<?php echo $value->order_brand_img_id ?>" />
                                    </label>
                                    <?php
                                }
                            }
                            ?>
                        </div>

                    </fieldset>
                </div>
            </section>
            <!--Tab 2-->
            <h2>รายการสินค้า</h2>
            <section>
                <div class="row">
                    <div class="col-xs-12">
                        <table class="table table-bordered">
                            <thead>
                                <tr>
                                    <th rowspan="2" class="text-center" style="vertical-align: middle;">No.</th>
                                    <th rowspan="2" class="text-center" style="vertical-align: middle;">ต้นแบบที่</th>
                                    <th rowspan="2" class="text-center" style="vertical-align: middle;">รายละเอียดสินค้า</th>
                                    <th class="text-center" style="vertical-align: middle;">จำนวนสั่ง</th>
                                    <th colspan="2" class="text-center" style="vertical-align: middle;">ขนาดบรรจุ</th>
                                    <th class="text-center" style="vertical-align: middle;">ประเภทของบรรจุภัณฑ์</th> 
                                    <th class="text-center" style="vertical-align: middle;">ประเภทของสติ๊กเกอร์</th> 
                                </tr>
                                <tr>
                                    <!--<th>No.</th>-->
                                    <!--<th>ต้นแบบที่</th>-->
                                    <!--<th>รายละเอียดสินค้า</th>-->
                                    <th style="width: 10%;" class="text-center">โล</th>
                                    <th style="width: 10%;" class="text-center">package</th>
                                    <th style="width: 10%;" class="text-center">บรรจุได้</th>
                                    <th style="width: 15%;" class="text-center">type of package</th> 
                                    <th style="width: 15%;" class="text-center">type of sticker</th> 
                                </tr>
                            </thead>
                            <tbody>
                                <?php
//                                dd($result_details);
                                foreach ($result_details as $key => $value) {
//                                    dd($value);
                                    ?>
                                    <tr>
                                        <td class="text-center" style="vertical-align: middle;"><?php echo $key + 1; ?></td>
                                        <td style="vertical-align: middle;">
                                            <input type="hidden" name="master_id[<?php echo $key; ?>]" value="<?php echo $value->order_brand_detail_id; ?>" />
                                            <textarea name="master[<?php echo $key; ?>]" class="form-control" style="resize: vertical"><?php echo $value->order_brand_detail_master; ?></textarea>
                                        </td>
                                        <td style="vertical-align: middle;">
                                            <textarea name="master_details[<?php echo $key; ?>]" class="form-control" style="resize: vertical"><?php echo $value->order_brand_detail_master_details; ?></textarea>
                                        </td>
                                        <td style="vertical-align: middle;">
                                            <input type="text" name="qty[<?php echo $key; ?>]" value="<?php echo $value->order_brand_detail_qty; ?>" class="form-control" />
                                        </td>
                                        <td style="vertical-align: middle;">
                                            <input type="text" name="package[<?php echo $key; ?>]" value="<?php echo $value->order_brand_detail_package; ?>" class="form-control" />
                                        </td>
                                        <td style="vertical-align: middle;">
                                            <input type="text" name="real_qty[<?php echo $key; ?>]" value="<?php echo $value->order_brand_detail_real_qty; ?>" class="form-control" />
                                        </td>
                                        <td style="vertical-align: middle;">
                                            <textarea name="type_of_package[<?php echo $key; ?>]" class="form-control" style="resize: vertical"><?php echo $value->order_brand_detail_type_of_package; ?></textarea>
                                        </td>
                                        <td style="vertical-align: middle;">
                                            <textarea name="type_of_sticker[<?php echo $key; ?>]" class="form-control" style="resize: vertical"><?php echo $value->order_brand_detail_type_of_sticker; ?></textarea>
                                        </td>
                                    </tr>
                                    <?php
                                }
                                for ($i = ($key + 1); $i < 10; $i++) {
                                    ?>
                                    <tr>
                                        <td class="text-center" style="vertical-align: middle;"><?php echo $i + 1; ?></td>
                                        <td style="vertical-align: middle;">
                                            <input type="hidden" name="master_id[<?php echo $i; ?>]" value="new" />
                                            <textarea name="master[<?php echo $i; ?>]" class="form-control" style="resize: vertical"></textarea>
                                        </td>
                                        <td style="vertical-align: middle;">
                                            <textarea name="master_details[<?php echo $i; ?>]" class="form-control" style="resize: vertical"></textarea>
                                        </td>
                                        <td style="vertical-align: middle;">
                                            <input type="text" name="qty[<?php echo $i; ?>]" class="form-control" />
                                        </td>
                                        <td style="vertical-align: middle;">
                                            <input type="text" name="package[<?php echo $i; ?>]" class="form-control" />
                                        </td>
                                        <td style="vertical-align: middle;">
                                            <input type="text" name="real_qty[<?php echo $i; ?>]" class="form-control" />
                                        </td>
                                        <td style="vertical-align: middle;">
                                            <textarea name="type_of_package[<?php echo $i; ?>]" class="form-control" style="resize: vertical"></textarea>
                                        </td>
                                        <td style="vertical-align: middle;">
                                            <textarea name="type_of_sticker[<?php echo $i; ?>]" class="form-control" style="resize: vertical"></textarea>
                                        </td>
                                    </tr>
                                    <?php
                                }
                                ?>
                            </tbody>
                        </table>
                    </div>
                </div>
            </section>

            <!--Tab 3-->
            <h2>Comment</h2>
            <section>
                <div class="col-md-6">
                    <label class="col-md-12">เพิ่ม Comment</label> 
                    <textarea name="comment" rows="10" class="form-control required" style="resize: vertical; min-height: 250px;"></textarea>
                </div>
                <div class="col-md-6">
                    <?php
                    $comment_check =  count($result_comment);
                    foreach ($result_comment as $key => $value) {
                        echo "ครั้งที่ ";
                        echo $comment_check--;
                        echo " : ";
                        echo $value->order_brand_comment_date;
                        echo " : ";
                        echo $value->order_brand_comment;
                        echo "<br/>";
                    }
                    ?>
                </div>
            </section>
            <!--Tab 4-->
            <h2>Revise</h2>
            <section>
                <div class="col-md-6">
                    <label class="col-md-12">เพิ่ม Revise</label> 
                    <textarea name="revise" rows="10" class="form-control required" style="resize: vertical;"></textarea>
                </div>
                <div class="col-md-6">
                    <?php
                    $revise_check =  count($result_revise);
                    foreach ($result_revise as $key => $value) {
                        echo "ครั้งที่ ";
                        echo $revise_check--;
                        echo " : ";
                        echo $value->order_brand_revise_date;
                        echo " : ";
                        echo $value->order_brand_revise;
                        echo "<br/>";
                    }
                    ?>
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
                                    $(function () {
                                        $(".select2").select2();
                                    });
                                    function get_customer_details(obj) {
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