
			<div class="row">
	<div class="col-md-6">
		<div class="box box-primary">
			<div class="box-header">
				<h3 class="box-title"></h3>
			</div>
			<div class="box-body">
				<?PHP
					$attributes = array('class' => 'form-horizontal',"role"=>"form");
					echo form_open("",$attributes); 
					

				?>
				<!--	<div class="form-group">
					  <label class="col-sm-2 control-label">เลขที่เอกสาร</label>
					  <div class="col-sm-10">-->
						<input type="hidden" name="order_id" class="form-control" placeholder="เลขที่เอกสาร" value="<?PHP if(!empty($work_now[0]->order_id)) echo $work_now[0]->order_id; else echo $order_id;?>">
		<!--			  </div>
					</div>-->
					
					<div class="form-group">
					  <label class="col-sm-2 control-label">รายการ</label>
					  <div class="col-sm-10">
						<input type="text" name="work_now_detail" class="form-control" placeholder="รายการ" value="<?PHP if(!empty($work_now[0]->work_now_detail)) echo $work_now[0]->work_now_detail; else echo set_value('work_now_detail');?>">
					  </div>
					</div>
					
					<div class="form-group">
					  <label class="col-sm-2 control-label">สถานะ</label>
					  <div class="col-sm-5">
						<!--<input type="text" name="work_now_status" class="form-control" placeholder="สถานะ" value="<?PHP if(!empty($work_now[0]->work_now_status)) echo $work_now[0]->work_now_status;?>">-->
						
						<select name="work_now_status" class="form-control">
						  <option value="1" <?PHP if(!empty($work_now[0]->work_now_status)){ if($work_now[0]->work_now_status==1){ echo "selected";}} else if(set_value('work_now_status')==1) echo "selected"; ?>>กำลังดำเนินงาน</option>
						  <option value="2" <?PHP if(!empty($work_now[0]->work_now_status)){ if($work_now[0]->work_now_status==2){ echo "selected";}} else if(set_value('work_now_status')==2) echo "selected"; ?>>งานมีปัญหา</option>
						  <option value="3" <?PHP if(!empty($work_now[0]->work_now_status)){ if($work_now[0]->work_now_status==3){ echo "selected";}} else if(set_value('work_now_status')==3) echo "selected"; ?>>เสร็จสิ้น</option>
						</select>
						
					  </div>
					</div>
					
					<div class="box-footer">
						<button type="submit" class="btn btn-info pull-right">Submit</button>
						<input type="hidden" name="work_now_id" value="<?PHP if(!empty($work_now[0]->work_now_id)) echo $work_now[0]->work_now_id;?>">
					</div>
				<?php echo form_close(); ?>	
			</div>
		</div>
	</div>
</div>	
			