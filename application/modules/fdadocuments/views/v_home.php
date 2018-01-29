<div class="row">
<!--<input type="text" class="datepicker">
    <div class="col-md-4">
        <?php echo modules::run('adminlte/widget/box_open', 'Shortcuts'); ?>
		<?php echo modules::run('adminlte/widget/app_btn', 'fa fa-sign-out', 'Logout', 'panel/logout'); ?>
        <?php echo modules::run('adminlte/widget/box_close'); ?>
    </div>

    <div class="col-md-4"> -->
        <?php //echo modules::run('adminlte/widget/info_box', 'yellow', $count['users'], 'Users', 'fa fa-users', 'user'); ?>
   <!-- </div>data_cat
   -->
   
   
   <div class="col-md-6">
	
		<div class="box box-info">
			<div class="box-header with-border">
              <h3 class="box-title">งานปัจจุบัน</h3>
			</div>
			
			<div class="box-body">
			  <div class="small-box bg-green">
				<div class="inner">
				  <h3><?PHP echo $work_nows;?></h3>

				  <p>กำลังดำเนินการ</p>
				</div>
				<div class="icon">
				  <i class="ion ion-pie-graph"></i>
				</div>
				<a href="<?PHP echo base_url("fdadocuments/work_now/"); ?>" class="small-box-footer">More info <i class="fa fa-arrow-circle-right"></i></a>
			  </div>
			</div>
			
		</div>
	</div>
   
   
	<div class="col-md-6">
		<div class="box box-info">
			<div class="box-header with-border">
              <h3 class="box-title">System</h3>
            </div>
			
             <div class="box-body">
			  <?PHP foreach($data_cat as $row ){
						if(array_search($row->id,$this->session->userdata('cotton_us')) !== false){
				  ?>
                <a href="<?PHP echo base_url($row->module);?>" class="list-group-item">
					<i class="fa fa-cogs"></i> <?PHP echo $row->name;?>
					</span>
				</a>
						<?PHP } } ?>
            </div>
		</div>
	</div>
	
	

</div>
