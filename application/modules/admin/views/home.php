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
   <?PHP if($this->keyadmin !== false || $this->keywebmaster !== false){?>
   <div class="col-md-6">
	
		<div class="box box-info">
			<div class="box-header with-border">
              <h3 class="box-title">Report</h3>
			  
			  <div class="box-header">
					เดือน : 
					<input  type="text" readonly="readonly" id="datepicker" onchange="window.location.assign('<?PHP echo base_url("admin/home/index/"); ?>'+this.value)" name="date" value="<?PHP if(!empty($date)) echo $date;?>" >
					<script>
						$("#datepicker").datepicker( {
							format: "mm-yyyy",
							viewMode: "months", 
							minViewMode: "months"
						});
					</script>
				</div>
			  
			</div>
			
			<div class="box-body">
			  <!-- small box -->
			  <div class="small-box bg-yellow">
				<div class="inner">
				  <h3><?PHP echo $work_late;?></h3>

				  <p>งานล่าช้า</p>
				</div>
				<div class="icon">
				  <i class="ion ion-pie-graph"></i>
				</div>
				<a href="<?PHP echo base_url("admin/report/late/".$date); ?>" class="small-box-footer">More info <i class="fa fa-arrow-circle-right"></i></a>
			  </div>
			</div>
			
			<div class="box-body">
			  <!-- small box -->
			  <div class="small-box bg-green">
				<div class="inner">
				  <h3><?PHP echo $work_nows;?></h3>

				  <p>กำลังดำเนินการ</p>
				</div>
				<div class="icon">
				  <i class="ion ion-pie-graph"></i>
				</div>
				<a href="<?PHP echo base_url("admin/report/now/".$date); ?>" class="small-box-footer">More info <i class="fa fa-arrow-circle-right"></i></a>
			  </div>
			</div>
			
			<!-- <div class="box-body">
			  <div class="small-box bg-red">
				<div class="inner">
				  <h3><?PHP echo $work_prom;?></h3>

				  <p>งานมีปัญหา</p>
				</div>
				<div class="icon">
				  <i class="ion ion-pie-graph"></i>
				</div>
				<a href="<?PHP echo base_url("admin/report/problem/".$date); ?>" class="small-box-footer">More info <i class="fa fa-arrow-circle-right"></i></a>
			  </div>
			</div>-->
			
			<div class="box-body">
			  <!-- small box -->
			  <div class="small-box bg-aqua">
				<div class="inner">
				  <h3><?PHP echo $work_ss;?></h3>

				  <p>เสร็จสิ้น</p>
				</div>
				<div class="icon">
				  <i class="ion ion-pie-graph"></i>
				</div>
				<a href="<?PHP echo base_url("admin/report/success/".$date); ?>" class="small-box-footer">More info <i class="fa fa-arrow-circle-right"></i></a>
			  </div>
			</div>
			
		</div>
	</div>
	
   <?PHP } ?>
   
   
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
