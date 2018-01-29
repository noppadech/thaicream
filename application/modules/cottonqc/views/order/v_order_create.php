
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
					  <label class="col-sm-2 control-label">เลขที่เอกสาร</label>
					  <div class="col-sm-10">
						<input type="text" name="code_id" class="form-control" placeholder="เลขที่เอกสาร" value="<?PHP if(!empty($order[0]->code_id)) echo $order[0]->code_id; else echo set_value('code_id');?>">
					  </div>
					</div>
					
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
					<!--
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
						<button type="submit" class="btn btn-info pull-right">Submit</button>
						<input type="hidden" name="order_id" value="<?PHP if(!empty($order[0]->order_id)) echo $order[0]->order_id;?>">
					</div>
				<?php echo form_close(); ?>	
			</div>
		</div>
	</div>
</div>	
			