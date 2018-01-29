<style>
/* Center the loader */
#loader {
  position: absolute;
  left: 50%;
  top: 50%;
  z-index: 1;
  width: 150px;
  height: 150px;
  margin: -75px 0 0 -75px;
  border: 16px solid #f3f3f3;
  border-radius: 50%;
  border-top: 16px solid #3498db;
  width: 120px;
  height: 120px;
  -webkit-animation: spin 2s linear infinite;
  animation: spin 2s linear infinite;
}

@-webkit-keyframes spin {
  0% { -webkit-transform: rotate(0deg); }
  100% { -webkit-transform: rotate(360deg); }
}

@keyframes spin {
  0% { transform: rotate(0deg); }
  100% { transform: rotate(360deg); }
}

/* Add animation to "page content" */
.animate-bottom {
  position: relative;
  -webkit-animation-name: animatebottom;
  -webkit-animation-duration: 1s;
  animation-name: animatebottom;
  animation-duration: 1s
}

@-webkit-keyframes animatebottom {
  from { bottom:-100px; opacity:0 } 
  to { bottom:0px; opacity:1 }
}

@keyframes animatebottom { 
  from{ bottom:-100px; opacity:0 } 
  to{ bottom:0; opacity:1 }
}

#myDivload {
  display: block;
}
</style>

<div id="loader" style="display: none;"></div>


<div class="row" id="myDivload">
<?PHP
	$attributes = array('class' => '',"role"=>"form");
	echo form_open("",$attributes); 
?>
	<div class="col-md-6 form-horizontal">
		<div class="box box-primary">
			<div class="box-header">
				<h3 class="box-title"></h3>
				<?PHP if(!empty(validation_errors())){ ?>
				<div class="callout callout-danger">
				  <h4>Warning!</h4>

				  <p><?php echo validation_errors(); ?></p>
				</div>
				<?PHP } ?>
			</div>
			<div class="box-body">
			
					<div class="alert alert-danger alert-dismissible" id="check-code_id" style="display: none;">
						<button type="button" class="close" data-dismiss="alert" aria-hidden="true">×</button>
						<h4><i class="icon fa fa-ban"></i> เลขที่เอกสารนี้มีอยู่แล้วในระบบ!</h4>
					</div>
				
					<div class="form-group">
					  <label class="col-sm-2 control-label">เลขที่เอกสาร</label>
					  <div class="col-sm-10">
						<input type="text" name="code_id" class="form-control" placeholder="เลขที่เอกสาร" onchange="check_code_id(this.value)" value="<?PHP if(!empty($order[0]->code_id)) echo $order[0]->code_id; else echo set_value('code_id');?>">
					  </div>
					</div>
					
					<script>
						function check_code_id(code_id){
							$.ajax({
								url: "<?PHP echo base_url("supportsales/order/ajax_check_code_id/");?>"+code_id, 
								success: function(result){
									if(result){
										$("#check-code_id").attr("style","display: block;");
									}else{
										$("#check-code_id").attr("style","display: none;");
									}
								}
							});
						}
					</script>
					
					<div class="form-group">
					  <label class="col-sm-2 control-label">ชื่อสินค้า </label>
					  <div class="col-sm-10">
						<input type="text" name="name_order" class="form-control" placeholder="ชื่อสินค้า" value="<?PHP if(!empty($order[0]->name_order)) echo $order[0]->name_order; else echo set_value('name_order');?>">
					  </div>
					</div>
					
					<div class="form-group">
					  <label class="col-sm-2 control-label">ชื่อลุกค้า </label>
					  <div class="col-sm-10">
						<input type="text" name="name_customer" class="form-control" placeholder="ชื่อลุกค้า" value="<?PHP if(!empty($order[0]->name_customer)) echo $order[0]->name_customer; else echo set_value('name_customer');?>">
					  </div>
					</div>
					
					<div class="form-group">
					  <label class="col-sm-2 control-label">งานของ </label>
					  <div class="col-sm-10">
						<select class="form-control" name="sales_id">
							<option value="0">------กรุณาเลือกเซล------</option>
							<?PHP 
							foreach($sales_name as $sale_names){
							?>
							<option value="<?PHP echo $sale_names->id;?>" <?PHP if(!empty($order[0]->sales_id) && $order[0]->sales_id==$sale_names->id) echo "selected"; else if(set_value('sales_id')==$sale_names->id) echo "selected";?> ><?PHP echo $sale_names->first_name." ".$sale_names->last_name; ?></option>
							<?PHP } ?>
						</select>
					  </div>
					</div>
					
					<!--
					value="<?PHP if(!empty($order[0]->order_date)) echo $order[0]->order_date; else echo set_value('order_date');?>"
					<div class="form-group">
					  <label class="col-sm-2 control-label">วันที่สั่งงาน </label>
					  <div class="col-sm-10">
						<input type="text" name="order_date" class="form-control datepicker" placeholder="วันที่สั่งงาน" >
					  </div>
					</div>-->
					
					<div class="form-group">
					  <label class="col-sm-2 control-label">ระยะเวลา </label>
					  <div class="col-sm-10">
						<input type="text" name="order_workcount" class="form-control" placeholder="ระยะเวลา" value="<?PHP if(!empty($order[0]->order_workcount)) echo $order[0]->order_workcount; else echo set_value('order_workcount');?>">
					  </div>
					</div>
					
					<div class="form-group">
					  <label class="col-sm-2 control-label">วันสั่งงาน </label>
					  <div class="col-sm-10">
						<input type="text" name="order_date" id="datepicker-th" class="form-control" placeholder="วันสั่งงาน" value="<?PHP if(!empty($order[0]->order_date)) echo splitDateForm4($order[0]->order_date,"/"); else echo set_value('order_date');?>">
					  </div>
					</div>
					
					<script>
						$( document ).ready(function() {
							$('#datepicker-th').datepicker({ format: 'dd/mm/yyyy' });
						});
					</script>
					
					<!-- order_date
					<div class="form-group">
					  <label class="col-sm-2 control-label">สถานะ</label>
					  <div class="col-sm-4">
						<input type="text" name="status" class="form-control" placeholder="Status" value="<?PHP if(!empty($order[0]->status)) echo $order[0]->status;?>">
						
						<select name="status" class="form-control">
						  <option value="1" <?PHP if(!empty($order[0]->status)){ if($order[0]->status==1){ echo "selected";}} else if(set_value('status')==1) echo "selected"; ?>>กำลังดำเนินงาน</option>
						  <option value="2" <?PHP if(!empty($order[0]->status)){ if($order[0]->status==2){ echo "selected";}} else if(set_value('status')==2) echo "selected"; ?>>งานมีปัญหา</option>
						  <option value="3" <?PHP if(!empty($order[0]->status)){ if($order[0]->status==3){ echo "selected";}} else if(set_value('status')==3) echo "selected"; ?>>เสร็จสิ้น</option>
						</select>
						
					  </div>
					</div>-->
					
					<div class="box-footer">
						<button type="submit" class="btn btn-info pull-right" onclick="showPage();" >Submit</button>
						<input type="hidden" name="order_id" value="<?PHP if(!empty($order[0]->order_id)) echo $order[0]->order_id;?>">
						<input type="hidden" name="status" value="<?PHP if(!empty($order[0]->status)) echo $order[0]->status;?>">
						<!--<input type="hidden" name="order_date" value="<?PHP if(!empty($order[0]->order_date)) echo $order[0]->order_date;?>">-->
						<input type="hidden" name="type_order" value="<?PHP echo $type_order;?>">
					</div>
				
			</div>
		</div>
	</div>
	
	<?PHP if(!empty($cotton)){ ?>
	<div class="col-md-6">
		<div class="box box-primary">
			<div class="box-body">
			
				<div class="form-group">
				<?PHP foreach($cotton as $row){ 
				
						if(!empty($cotton_array)){
							
				?>
							  <div class="checkbox">
								<label>
								  <input type="checkbox" <?PHP if(array_search($row->id,$cotton_array)!== false){ echo "checked";}?> name="<?PHP echo $row->id; ?>" value="1">
								  <?PHP echo $row->name;?>
								</label>
							  </div>
				<?PHP 		 
						}else{?>
						<div class="checkbox">
							<label>
							  <input type="checkbox" checked name="<?PHP echo $row->id; ?>" value="1">
							  <?PHP echo $row->name;?>
							</label>
						  </div>
						<?PHP
						}
					}?>  
                </div>
			
			</div>
		</div>
	</div>
	<?PHP } ?>
	
	<?php echo form_close(); ?>	
</div>	

<script>

function showPage() {
  document.getElementById("loader").style.display = "block";
  document.getElementById("myDivload").style.display = "none";
}
</script>

			