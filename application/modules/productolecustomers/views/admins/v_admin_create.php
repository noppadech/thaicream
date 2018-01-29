
			<div class="row">
	<div class="col-md-12">
		<div class="box box-primary">
			<div class="box-header">
				<h3 class="box-title"></h3>
				
				
				<?PHP if(!empty($errors)){ ?>
				<div class="callout callout-danger">
				  <h4>Errors!</h4>

				  <p><?php echo $errors; ?></p>
				</div>
				<?PHP } ?>
				
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
					echo form_open_multipart("",$attributes); 
				?>
				
					<div class="form-group">
					  <label class="col-sm-2 control-label">E-mail</label>
					  <div class="col-sm-9">
						<input type="text" name="email" class="form-control" placeholder="name@mail.com" value="<?php echo set_value('email'); ?>">
					  </div>
					</div>
					
					<div class="form-group">
					  <label class="col-sm-2 control-label">User Name</label>
					  <div class="col-sm-9">
						<input type="text" name="username" class="form-control" placeholder="User Name" value="<?php echo set_value('username'); ?>">
					  </div>
					</div>
					
					<div class="form-group">
					  <label class="col-sm-2 control-label">Password</label>
					  <div class="col-sm-9">
						<input type="password" name="password" class="form-control" placeholder="Password" value="">
					  </div>
					</div>
					
					<div class="form-group">
					  <label class="col-sm-2 control-label">Retype Password</label>
					  <div class="col-sm-9">
						<input type="password" name="password_re" class="form-control" placeholder="Retype Password" value="">
					  </div>
					</div>
					
					<div class="form-group">
					  <label class="col-sm-2 control-label">ชื่อ</label>
					  <div class="col-sm-9">
						<input type="text" name="first_name" class="form-control" placeholder="ชื่อ" value="<?php echo set_value('first_name'); ?>">
					  </div>
					</div>
					
					<div class="form-group">
					  <label class="col-sm-2 control-label">นามสกุล</label>
					  <div class="col-sm-9">
						<input type="text" name="last_name" class="form-control" placeholder="นามสกุล" value="<?php echo set_value('last_name'); ?>">
					  </div>
					</div>
					
					<div class="form-group">
					  <label class="col-sm-2 control-label">กลุ่ม</label>
					  <div class="col-sm-9">
							<?PHP foreach($groups as $row){ ?>
								<div class="checkbox">
									<label>
									  <input type="checkbox" name="groups[]" value="<?PHP echo $row->id; ?>">
									  <?PHP echo $row->description; ?>
									</label>
								  </div>
							<?PHP } ?>
					  </div>
					</div>
					
					<div class="form-group">
					  <label class="col-sm-2 control-label">ฝ่าย</label>
					  <div class="col-sm-9">
						  <?PHP foreach($cotton as $row){ ?>
								<div class="checkbox">
									<label>
									  <input type="checkbox" name="cotton[]" value="<?PHP echo $row->id; ?>">
									  <?PHP echo $row->description; ?>
									</label>
								  </div>
							<?PHP } ?>
					  </div>
					</div>
					
					<div class="form-group">
						<label class="col-sm-2 control-label">Image</label>
						<div class="col-sm-9">
							<!--<input type="text" name="img" class="form-control" placeholder="News image" value="<?PHP if(!empty($admin[0]->img)) echo $admin[0]->img;?>">-->
							<input type="file" class="btn btn-default" name="img" value="<?PHP if(!empty($admin[0]->img)) echo $admin[0]->img;?>"/>
							<?php 
								if(!empty($admin[0]->admin)){
									echo "<img style='width:200px;height:100px;' src = '".base_url ('assets/uploads/admin/'.$admin[0]->img)."'>";
								}
							?>
						</div>
					</div>
					
					<div class="box-footer">
						<button type="submit" class="btn btn-info pull-right">Submit</button>
					</div>
				<?php echo form_close(); ?>	
			</div>
		</div>
	</div>
</div>	
			