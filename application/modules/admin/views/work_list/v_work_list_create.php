
			<div class="row">
	<div class="col-md-6">
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
				<?PHP
					$attributes = array('class' => 'form-horizontal',"role"=>"form");
					echo form_open("",$attributes); 
				?>
					<div class="form-group">
					  <label class="col-sm-2 control-label">รายละเอียด</label>
					  <div class="col-sm-10">
						<input type="text" name="work_detail" class="form-control" placeholder="รายละเอียด" value="<?PHP if(!empty($work_list[0]->work_detail)) echo $work_list[0]->work_detail; else echo set_value('work_detail');?>">
					  </div>
					</div>
					
					<div class="form-group">
					  <label class="col-sm-2 control-label">สถานะ</label>
					  <div class="col-sm-10">
					<!--	<input type="text" name="work_status" class="form-control" placeholder="Work_status" value="<?PHP if(!empty($work_list[0]->work_status)) echo $work_list[0]->work_status; else echo set_value('work_status');?>">-->
						
						<select name="work_status" class="form-control">
						  <option value="1" <?PHP if(!empty($work_list[0]->work_status)){ if($work_list[0]->work_status==1){ echo "selected";}} else if(set_value('work_status')==1) echo "selected"; ?>>เปิดการใช้งาน</option>
						  <option value="2" <?PHP if(!empty($work_list[0]->work_status)){ if($work_list[0]->work_status==2){ echo "selected";}} else if(set_value('work_status')==2) echo "selected"; ?>>ปิดการใช้งาน</option>
						</select>
						
					  </div>
					</div>
					
					<div class="form-group">
					  <label class="col-sm-2 control-label">ฝ่าย</label>
					  <div class="col-sm-10">
						<!--<input type="text" name="group_module_id" class="form-control" placeholder="Group_module_id" value="<?PHP if(!empty($work_list[0]->group_module_id)) echo $work_list[0]->group_module_id; else echo set_value('group_module_id');?>">-->
					  
						<select name="group_module_id" class="form-control">
							<?PHP foreach($cotton as $row){ ?>
								<option value="<?PHP echo $row->id;?>" <?PHP if(!empty($work_list[0]->group_module_id)){ if($work_list[0]->group_module_id==$row->id){ echo "selected";}} else if(set_value('group_module_id')==$row->id) echo "selected"; ?>><?PHP echo $row->name;?></option>
							<?PHP } ?>
						</select>
						
					  </div>
					</div>
					
					<div class="box-footer">
						<button type="submit" class="btn btn-info pull-right">Submit</button>
						<input type="hidden" name="work_id" value="<?PHP if(!empty($work_list[0]->work_id)) echo $work_list[0]->work_id;?>">
					</div>
				<?php echo form_close(); ?>	
			</div>
		</div>
	</div>
</div>	

<script>
	
</script>
			