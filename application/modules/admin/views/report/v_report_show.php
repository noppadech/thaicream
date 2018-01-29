<style>
	th,td{
		text-align: center;
	}
</style>
<input type="hidden" name="<?PHP echo $this->security->get_csrf_token_name();?>" value="<?PHP echo $this->security->get_csrf_hash();?>" id="token-ke">
<div class="row">
	<div class="col-md-12">
<?PHP foreach($group_work as $row_main){ ?>
	<div class="col-md-6">
		<div class="box box-primary">
			<div class="box-header">
				<h3 class="box-title"><?PHP echo $row_main->name;?></h3>
				<?PHP $persen = number_format((float)modules::run('admin/report/persen',$order_id,$row_main->id,$link), 2, '.', '');
				?>
				<div class="progress progress-sm active">
					<div class="progress-bar progress-bar-success progress-bar-striped" role="progressbar" aria-valuenow="20" aria-valuemin="0" aria-valuemax="100" style="width: <?PHP echo $persen;?>%;color: #000;">
					  <?PHP echo $persen;?>%
					</div>
				</div>
			</div>

<?PHP $data_cat = modules::run('admin/report/work_now_data',$order_id,$row_main->id,$link);?>
			<div class="box-body">
				<table class="table table-striped table-bordered table-autosort set-table table-autosort-serverside" cellspacing="0" width="100%">
					<thead>
						<tr>
							<th>No.</th>
							
							<th>รายการ</th>
							
							<th>สถานะ</th>
							
							<th>หมายเหตุ</th>
							
							<th>เพิ่มหมายเหตุ</th>
						</tr>
					</thead>
					<tbody>
					<?PHP
						$i=0;
						foreach($data_cat as $row){
					?>
						<tr>
							
							<td style="display:none;"><?PHP echo $i++;?></td>
							
							<td><?PHP echo $row->work_now_detail;?></td>
							
							<td><?PHP 
										if(!empty($row->work_now_status)){ 
											if($row->work_now_status==1){
												echo "กำลังดำเนินงาน";
											}else if($row->work_now_status==2){
												echo "งานมีปัญหา";
											}else if($row->work_now_status==3){
												echo "เสร็จสิ้น";
											}
										} 
								?>
							</td>
							
							<td style="width: 25%; text-align:left;" id="comment-<?PHP echo $row->work_now_id;?>">
							
							<?php  $comment_all = modules::run('admin/report/get_comment_work',$row->work_now_id); 
							
									foreach($comment_all as $coms){
							?>
									
									<div class="direct-chat-msg right" id="show_com-<?PHP echo $coms->work_comment_id;?>">
									  <img class="direct-chat-img" src="<?PHP echo base_url();?>assets/uploads/users/<?PHP if(!empty($coms->img)) echo $coms->img; else echo "sales-icon-32.png";?>" alt="message user image">
									  
									  <div class="direct-chat-text">
									  <span class="direct-chat-timestamp pull-right"><?PHP echo $coms->first_name;?></span>
									  <span class="direct-chat-timestamp pull-left"><?PHP echo splitDateTime($coms->comment_date);?></span></br>
										<?PHP echo $coms->work_comment_detail;?>
										<a role="button" onclick="comment_delete('<?PHP echo $coms->work_comment_id;?>','<?php echo base_url("admin/report/delete_comment_work");?>')">
												<i class="fa fa-times-circle" aria-hidden="true"></i>
										</a>
									  </div>
									  
									</div>
									<?PHP } ?>
							</td>
							
							<td>
									<textarea rows="2" cols="15" name="detail" id="text_ar-<?PHP echo $row->work_now_id;?>" ></textarea></br>
									<input type="hidden" name="work_now_id" value="<?PHP echo $row->work_now_id;?>" >
									<button type="button" onclick="comment_save('<?PHP echo $row->work_now_id;?>','<?PHP echo $this->session->userdata("username");?>','<?php echo base_url("admin/report/comment_work"); ?>','<?php echo base_url("admin/report/delete_comment_work");?>','<?PHP echo base_url();?>assets/uploads/users/<?PHP if(!empty($coms->img)) echo $coms->img; else echo "sales-icon-32.png";?>')" class="btn btn-success">Submit</button>
								
							</td>
						</tr>
					<?PHP 
						} 
					?>
					</tbody>
				</table>
			</div>
		</div>
	</div>
	<?PHP } ?>
</div></div>

<script>
$(document).ready( function() {
  $('.set-table').dataTable( {
    "aLengthMenu": [[5, 10, 15, -1], [5, 10, 15, "All"]]
  } );
} );


</script>
