
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
					<div class="form-group">
					  <label class="col-sm-2 control-label">Order_id</label>
					  <div class="col-sm-10">
						<input type="text" name="order_id" class="form-control" placeholder="Order_id" value="<?PHP if(!empty($commentorder[0]->order_id)) echo $commentorder[0]->order_id;?>">
					  </div>
					</div>
					
					<div class="form-group">
					  <label class="col-sm-2 control-label">Admin_id</label>
					  <div class="col-sm-10">
						<input type="text" name="admin_id" class="form-control" placeholder="Admin_id" value="<?PHP if(!empty($commentorder[0]->admin_id)) echo $commentorder[0]->admin_id;?>">
					  </div>
					</div>
					
					<div class="form-group">
					  <label class="col-sm-2 control-label">Detail</label>
					  <div class="col-sm-10">
						<input type="text" name="detail" class="form-control" placeholder="Detail" value="<?PHP if(!empty($commentorder[0]->detail)) echo $commentorder[0]->detail;?>">
					  </div>
					</div>
					
					<div class="box-footer">
						<button type="submit" class="btn btn-info pull-right">Submit</button>
						<input type="hidden" name="comment_id" value="<?PHP if(!empty($commentorder[0]->comment_id)) echo $commentorder[0]->comment_id;?>">
					</div>
				<?php echo form_close(); ?>	
			</div>
		</div>
	</div>
</div>	
			