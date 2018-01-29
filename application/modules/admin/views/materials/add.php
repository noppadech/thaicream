
<?php
echo Modules::run('adminlte/Widget/box_open', '', $style = 'primary', $solid = FALSE);
$attributes = array(
    'class' => 'form-horizontal'
);
echo form_open(site_url('admin/materials/create/process'), $attributes);
?>
<div class="col-md-6">
	<div class="alert alert-danger alert-dismissible" style="display:none;" id="status_check">
		<button type="button" class="close" data-dismiss="alert" aria-hidden="true">×</button>
		<h4><i class="icon fa fa-ban"></i> Alert!</h4>
		รหัสวัตถุดิบ มีการใช้งานในฐานข้อมูลแล้ว
	  </div>
    <div class="form-group">
        <label class="col-md-3 control-label">รหัสวัตถุดิบภายใน</label>  
        <div class="col-md-9">
            <input name="material_code" id="material_code" type="text" placeholder="รหัสวัตถุดิบภายใน" class="form-control input-md" onkeyup="check_material_code();" />
        </div>
    </div>  
    <div class="form-group">
        <label class="col-md-3 control-label">ผู้จำหน่าย วัตถุดิบ</label>  
        <div class="col-md-9">
            <input name="material_supplier" type="text" placeholder="ผู้จำหน่าย วัตถุดิบ" class="form-control input-md" />
        </div>
    </div> 
    <div class="form-group">
        <label class="col-md-3 control-label">TRADE NAME</label>  
        <div class="col-md-9">
            <input name="material_trade_name" type="text" placeholder="TRADE NAME" class="form-control input-md" />
        </div>
    </div> 
    <div class="form-group">
        <label class="col-md-3 control-label">TRADE NAME 2</label>  
        <div class="col-md-9">
            <input name="material_trade_name_2" type="text" placeholder="TRADE NAME 2" class="form-control input-md" />
        </div>
    </div> 
	<div class="form-group">
        <label class="col-md-3 control-label">หน้าที่</label>  
        <div class="col-md-9">
            <input name="role" type="text" placeholder="หน้าที่" class="form-control input-md">
        </div>
    </div>
</div>  
<div class="col-md-6">
    <div class="row">
        <label class="col-md-12" >ข้อมูลสารประกอบ</label>  
    </div>
    <div class="row">
        <div class="col-md-12">
            <table class="table table-bordered" >
                <thead>
                    <tr>
                        <th style="width: 50px;">จัดการ</th>
                        <th >INCI NAME</th>
                        <th >CAS</th>
                        <th >FUNCTION</th>
                        <th class="text-center" style="width: 100px;">ปริมาณ %</th>
                    </tr>
                </thead>
                <tbody id="tab_logic1">
                    <tr class="compound" id="addone0">
                        <td class="text-center" style="vertical-align: middle;"> 
                            -
                        </td>
                        <td>
                            <input type="text" class="form-control" name="material_inci_name[]" placeholder="INCI NAME" />
                        </td> 
                        <td>
                            <input type="text" class="form-control" name="material_cas[]" placeholder="CAS" />
                        </td> 
                        <td>
                            <input type="text" class="form-control" name="material_function[]" placeholder="FUNCTION" />
                        </td> 
                        <td>
                            <input type="number" class="form-control text-center" name="material_quantity[]" placeholder="0" min="0" step="0.01" maxlength="6" />
                        </td> 
                    </tr>
                </tbody>
            </table>
            <button type="button" onclick="return add_row_compound();" class="btn btn-info pull-left"><i class="fa fa-plus"></i></button> 

            <button type="button" class="btn btn-warning pull-right" onclick="history.back();">ย้อนกลับ</button>
            <button type="reset" class="btn btn-danger pull-right" style="margin-right: 5px;">ยกเลิก</button>
            <button type="submit" class="btn btn-success pull-right" style="margin-right: 5px;">บันทึก</button>
        </div>
    </div>
</div>
<?php
echo form_close();
echo Modules::run('adminlte/Widget/box_close');
?>
<script type="text/javascript">
    var i = $(".compound").length;
    function add_row_compound() {
        console.log(i);
        var html = '<td class="text-center" style="vertical-align: middle;">\n\
                        <a onclick="deleterow1(' + i + ')" class="btn btn-danger"><i class="fa fa-minus "></i> ลบ</a>\n\
                    </td>\n\
                    <td>\n\
                        <input type="text" class="form-control" name="material_inci_name[]" placeholder="INCI NAME" />\n\
                    </td>\n\
                    <td>\n\
                        <input type="text" class="form-control" name="material_cas[]" placeholder="CAS" />\n\
                    </td>\n\
                    <td>\n\
                        <input type="text" class="form-control" name="material_function[]" placeholder="FUNCTION" />\n\
                    </td> \n\
                    <td>\n\
                        <input type="number" class="form-control text-center" name="material_quantity[]" placeholder="0" min="0" step="0.01" maxlength="6" />\n\
                    </td>';
        $('#tab_logic1').append('<tr class="compound"  id="addone' + i + '">' + html + '</tr>');
        i++;
        return true;
    }
    function deleterow1(i) {
        $("#addone" + (i)).remove();
    }
</script>

<script>
function check_material_code() {
    var material_code = $("#material_code").val();
	
	jQuery.ajax({
		type: "GET",
		url: "<?PHP echo base_url('admin/materials/check_material_code/');?>"+material_code,
		dataType: 'json',
		success: function(res) {
			if(res.status){
				$("#status_check").attr("style","display:block;");
			}else{
				$("#status_check").attr("style","display:none;");
			}
		}
	});
	
}
</script>
