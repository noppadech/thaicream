<?php
echo Modules::run('adminlte/Widget/box_open', '', $style = 'primary', $solid = FALSE);
?>
<div class="row">
    <div class="col-md-6 hidden-print"> 
        <?php
        $attributes = array(
            "id" => "form-upload",
            "class" => "form-horizontal",
        );
        echo form_open_multipart("", $attributes);
        ?>
        <fieldset>
            <!-- Form Name -->
            <legend>Upload Files</legend>
            <!-- File Button --> 
            <div class="form-group">
                <label class="col-md-4 control-label" for="filebutton">เลือกไฟล์</label>
                <div class="col-md-4">
                    <input id="filebutton" name="file_upload" class="input-file" type="file">
                </div>
            </div>
            <!-- Button -->
            <div class="form-group">
                <label class="col-md-4 control-label" for="singlebutton"></label>
                <div class="col-md-4">
                    <button id="btn-upload" class="btn btn-primary">Upload</button>
                </div>
            </div>
        </fieldset>
        <?php echo form_close(); ?>
        <script type="text/javascript">
            $('#form-upload').on('submit', uploadFiles);
            function isEmpty(val) {
                return (val === undefined || val === null || val.length == 0) ? true : false;
            }
            function uploadFiles(e) {
                e.stopPropagation();
                e.preventDefault();
//                        $('#btn-upload').hide();
                var formdata = new FormData($('#form-upload')[0]);
                $.ajaxSetup({
                    url: "<?php echo site_url('fdadocuments/upload_files/process'); ?>",
                    type: 'POST',
                    data: formdata,
                    async: false,
                    cache: false,
                    processData: false,
                    contentType: false
                });
                $.ajax({
                    xhr: function () {
                        var myXhr = $.ajaxSettings.xhr();
                        return myXhr;
                    },
                    beforeSend: function (xhr) {

                    },
                    success: function (data, textStatus, jqXHR) {
                        var res = JSON.parse(data);
                        console.log(res.status);
                        if (res.status) {
                            $('input[name^=csrf_test_name]').val(res.crsf);
                            alert('Upload Success.');
                        } else {
                            alert('Upload Error.');
                        }
                    },
                    error: function (jqXHR, textStatus, errorThrown) {
                        alert('Upload Error.');
//                        console.log(textStatus);
//                        console.log(jqXHR);
                    },
                    complete: function (jqXHR, textStatus) {
                        location.reload();
                    }
                });
            }
        </script>
    </div>
    <div class="col-md-6 hidden-print">
        <?php
//                dd($result_files);
        ?>
        <table class="table table-bordered table-autsort">
            <thead>
                <tr>
                    <th>No.</th>
                    <th>File Name</th>
                    <th>Upload By</th>
                    <th>Upload Date</th>
                </tr>
            </thead>
            <tbody>
                <?php
                foreach ($result_files as $key => $value) {
                    ?>
                    <tr>
                        <td><?php echo $key + 1; ?></td>
                        <td>
                            <a href="<?php echo site_url('uploads/' . $value->file_name); ?>" download="<?php echo $value->flie_name_original; ?>">
                                <?php echo $value->flie_name_original; ?>
                            </a>
                        </td>
                        <td><?php echo $value->file_create_by; ?></td>
                        <td><?php echo $value->file_create_date; ?></td>
                    </tr>
                    <?php
                }
                ?>
            </tbody>
        </table>
    </div>
</div>
<?php
echo Modules::run('adminlte/Widget/box_close');
?>
<div class="row">
    <div class="col-md-8">
        <?php
//        dd($formula);
        $attributes = array('class' => 'form-horizontal');
        echo modules::run('adminlte/widget/box_content_open', $style = 'primary', FALSE);
        echo form_open('', $attributes);
        ?>
        <div class="form-group">
            <label class="col-md-3 control-label" for="product_id">สูตรสินค้า</label>  
            <div class="col-md-9">
                <input type="hidden" name="" value="<?php echo $formula->product_id; ?>" />
                <select id="product_id" class="form-control" disabled="">
                    <option value="">--Selected--</option>
                    <?php
                    foreach ($product as $key => $value) {
                        $selected = "";
                        if ($formula->product_id == $value->id) {
                            $selected = "selected=\"\"";
                        }
                        echo "<option value=\"" . $value->id . "\" $selected >" . $value->FDA_thai . " | " . $value->FDA_english . "</option>";
                    }
                    ?>
                </select>
            </div>
        </div>
        <div class="form-group">
            <label class="col-md-3 control-label" for="formula_master">ชื่อการค้า</label>  
            <div class="col-md-9">
                <input id="formula_master" name="formula_master" value="<?php echo (!empty($formula->formula_master)) ? $formula->formula_master : ""; ?>" type="text" class="form-control input-md" required="">
            </div>
        </div>
        <div class="form-group">
            <label class="col-md-3 control-label" for="fda_product_type">ประเภทผลิตภัณฑ์</label>  
            <div class="col-md-9">
                <input id="fda_product_type" name="fda_product_type" value="<?php echo (!empty($formula->fda_product_type)) ? $formula->fda_product_type : ""; ?>" type="text" class="form-control input-md" required="">
            </div>
        </div>
        <div class="form-group">
            <label class="col-md-3 control-label" for="fda_product_appearance">ลักษณประเภทผลิตภัณฑ์</label>  
            <div class="col-md-9">
                <input id="fda_product_appearance" name="fda_product_appearance" value="<?php echo (!empty($formula->fda_product_appearance)) ? $formula->fda_product_appearance : ""; ?>" type="text" class="form-control input-md" required="">
            </div>
        </div>
        <div class="form-group">
            <label class="col-md-3 control-label" for="fda_name_th">ชื่อสินค้าจดแจ้ง อย. ภาษาไทย</label>  
            <div class="col-md-9">
                <input id="fda_name_th" name="fda_name_th" value="<?php echo (!empty($formula->fda_name_th)) ? $formula->fda_name_th : ""; ?>" type="text" class="form-control input-md" required="">
            </div>
        </div>
        <div class="form-group">
            <label class="col-md-3 control-label" for="fda_name_en">ชื่อสินค้าจดแจ้ง อย. อังกฤษ</label>  
            <div class="col-md-9">
                <input id="fda_name_en" name="fda_name_en" value="<?php echo (!empty($formula->fda_name_en)) ? $formula->fda_name_en : ""; ?>" type="text" class="form-control input-md" required="">
            </div>
        </div> 

        <div class="form-group">
            <label class="col-md-3 control-label" for="fda_sent_date">วันที่ขอ อย.</label>  
            <div class="col-md-9">
                <input id="fda_sent_date" name="fda_sent_date" value="<?php echo (!empty($formula->fda_sent_date)) ? date('m/d/Y', strtotime($formula->fda_sent_date)) : ""; ?>" type="text" class="form-control input-md datepicker">
            </div>
        </div>
        <div class="form-group">
            <label class="col-md-3 control-label" for="fda_get_date">วันที่ได้รับ อย.</label>  
            <div class="col-md-9">
                <input id="fda_get_date" name="fda_get_date" value="<?php echo (!empty($formula->fda_get_date)) ? date('m/d/Y', strtotime($formula->fda_get_date)) : ""; ?>" 				type="text" class="form-control input-md datepicker"				onchange="date_process(this)"				>
            </div>			
            <script type="text/javascript">
                function date_process(obj) {
                    var fda_date_expire = $('#fda_date_expire');
                    var date_add = new Date($(obj).val());
                    date_add.setFullYear(date_add.getFullYear() + 3);
                    fda_date_expire.val((date_add.getMonth() + 1) + "/" + date_add.getDate() + "/" + date_add.getFullYear());
                }
            </script>
        </div>
        <div class="form-group">
            <label class="col-md-3 control-label" for="fda_no">เลขทะเบียน อย.</label>  
            <div class="col-md-9">
                <input id="fda_no" name="fda_no" value="<?php echo (!empty($formula->fda_no)) ? $formula->fda_no : ""; ?>" type="text" class="form-control input-md">
            </div>
        </div>
        <div class="form-group">
            <label class="col-md-3 control-label" for="fda_date_expire">วันที่หมด อายุ อย.</label>  
            <div class="col-md-9">
                <input id="fda_date_expire" name="fda_date_expire" value="<?php echo (!empty($formula->fda_date_expire)) ? date('m/d/Y', strtotime($formula->fda_date_expire)) : ""; ?>" type="text" class="form-control input-md datepicker">
            </div>
        </div>
        <div class="form-group">
            <label class="col-md-3 control-label" for="fda_status">สถานะ อย.</label>  
            <div class="col-md-9">
                <?php
                $checked1 = "";
                $checked2 = "";
                if ($formula->fda_status == 1) {
                    $checked1 = "checked=\"checked\"";
                } else {
                    $checked2 = "checked=\"checked\"";
                }
                ?>
                <label class="radio-inline" for="close">
                    <input type="radio" name="fda_status" id="close" value="1" <?php echo $checked1; ?> />
                    ได้
                </label>
                <label class="radio-inline" for="open">
                    <input type="radio" name="fda_status" id="open" value="0" <?php echo $checked2; ?> />
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