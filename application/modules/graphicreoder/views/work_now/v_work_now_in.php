<style>
	th,td{
		text-align: center;
	}
</style>
<div class="row">
	<div class="col-md-12">
		<div class="box box-primary">
			<div class="box-header">
				<div class="box-header">
					<?PHP if($this->keyadmin !==false || $this->keywebmaster !==false || $this->keymanager !==false){?>
						<a href="work_now/create/0/<?PHP echo $data_cat[0]->order_id;?>" type="button" class="btn btn-block btn-primary" style="width: 100px;">
							<i class="fa fa-plus" aria-hidden="true"></i> Add
						</a>
					<?PHP } ?>
				</div>
			</div>
			<input type="hidden" name="<?PHP echo $this->security->get_csrf_token_name();?>" value="<?PHP echo $this->security->get_csrf_hash();?>" id="token-ke">
			<div class="box-body">
				<table class="table table-striped table-bordered table-autosort" cellspacing="0" width="100%">
					<thead>
						<tr>
							<th style="display:none;">No.</th>
							
							<th>เอกสาร</th>
							
							<!--<th>ชื่อสินค้า</th>
							
							<th>ชื่อลูกค้า</th>-->
							
							<th>รายการ</th>
							
							<th>สถานะ</th>
							
							<th>หมายเหตุ</th>
							
							<th>เพิ่มหมายเหตุ</th>
							
						<!--	<th>ผู้ดำเนินการ</th>
							
							<th>ผู้เพิ่ม/แก้ไข</th>-->
							<?PHP if($this->keyadmin !==false || $this->keywebmaster !==false || $this->keymanager !==false){?>
							<th>Actions</th>
							<?PHP } ?>
						</tr>
					</thead>
					<tbody>
					<?PHP
						$i=0;
						foreach($data_cat as $row){
					?>
						<tr>
							
							<td style="display:none;"><?PHP echo $i++;?></td>
							
							<!--<td><?PHP echo $row->code_id;?></td>
							
							<td><?PHP echo $row->name_order;?></td>
							
							<td><?PHP echo $row->name_customer;?></td>-->
							
							<td><?PHP echo "เลขที่ : ".$row->code_id."</br>"
											."สินค้า : ".$row->name_order."</br>"
											."ลูกค้า : ".$row->name_customer;?></td>
							
							<td><?PHP echo $row->work_now_detail;?></td>
							
							<td><?PHP //echo $row->work_now_status;?>
								<select name="work_now_status" class="form-control" onchange="change_status_work_now('<?PHP echo $row->work_now_id;?>','<?php echo base_url($this->config->item('ci_bootstrap')['link_module']."/work_now/change_status");?>',this.value);">
								  <option value="1" <?PHP if(!empty($row->work_now_status)){ if($row->work_now_status==1){ echo "selected";}} ?>>กำลังดำเนินงาน</option>
								  <option value="2" <?PHP if(!empty($row->work_now_status)){ if($row->work_now_status==2){ echo "selected";}} ?>>งานมีปัญหา</option>
								  <option value="3" <?PHP if(!empty($row->work_now_status)){ if($row->work_now_status==3){ echo "selected";}} ?>>เสร็จสิ้น</option>
								</select>

								
							</td>
							
							<td style="max-width: 200px; text-align:left;" id="comment-<?PHP echo $row->work_now_id;?>">
							
							<?php  $comment_all = modules::run($this->config->item('ci_bootstrap')['link_module'].'/work_now/get_comment',$row->work_now_id); 
							
									foreach($comment_all as $coms){
							?>
									<!--<ul id="show_com-<?PHP echo $coms->work_comment_id;?>">
										<li>
											
											<?PHP echo $coms->work_comment_detail." by ".$coms->first_name; ?>
											<a role="button" onclick="comment_delete('<?PHP echo $coms->work_comment_id;?>','<?php echo base_url($this->config->item('ci_bootstrap')['link_module']."/work_now/delete_comment");?>')">
												<i class="fa fa-times-circle" aria-hidden="true"></i>
											</a>
											
										</li>
									</ul>-->
									
									
									<div class="direct-chat-msg right" id="show_com-<?PHP echo $coms->work_comment_id;?>">
									  <img class="direct-chat-img" src="<?PHP echo base_url();?>assets/uploads/users/<?PHP if(!empty($coms->img)) echo $coms->img; else echo "sales-icon-32.png";?>" alt="message user image">
									  
									  <div class="direct-chat-text">
									  <span class="direct-chat-timestamp pull-right"><?PHP echo $coms->first_name;?></span>
									  <span class="direct-chat-timestamp pull-left"><?PHP echo splitDateTime($coms->comment_date);?></span></br>
										<?PHP echo $coms->work_comment_detail;?>
										<?PHP if($this->keyadmin !==false || $this->keywebmaster !==false || $this->keymanager !==false){?>
										<a role="button" onclick="comment_delete('<?PHP echo $coms->work_comment_id;?>','<?php echo base_url($this->config->item('ci_bootstrap')['link_module']."/work_now/delete_comment");?>')">
												<i class="fa fa-times-circle" aria-hidden="true"></i>
										</a>
										<?PHP } ?>
									  </div>
									  
									</div>
									
									
									<?PHP } ?>
							</td>
							
							<td>
									<textarea rows="4" cols="25" name="detail" id="text_ar-<?PHP echo $row->work_now_id;?>" ></textarea></br>
									<input type="hidden" name="work_now_id" value="<?PHP echo $row->work_now_id;?>" >
									<button type="button" onclick="comment_save('<?PHP echo $row->work_now_id;?>','<?PHP echo $this->session->userdata("username");?>','<?php echo base_url($this->config->item('ci_bootstrap')['link_module']."/work_now/comment"); ?>','<?php echo base_url($this->config->item('ci_bootstrap')['link_module']."/work_now/delete_comment");?>','<?PHP echo base_url();?>assets/uploads/users/<?PHP if(!empty($coms->img)) echo $coms->img; else echo "sales-icon-32.png";?>')" class="btn btn-success">Submit</button>
								
							</td>
						<!--	
							<td><?PHP echo $row->admin_name;?></td>
							
							<td><?PHP echo $row->manager_name;?></td>-->
							<?PHP if($this->keyadmin !==false || $this->keywebmaster !==false || $this->keymanager !==false){?>
							<td>
								<a href="work_now/create/<?PHP echo $row->work_now_id."/".$row->order_id;?>">
									<i class="fa fa-pencil-square-o" aria-hidden="true"></i>
								</a>
								|
								<a href="work_now/deletes/<?PHP echo $row->work_now_id."/".$row->order_id;?>" onclick="return confirm('Are you sure you want to delete this item?');">
									<i class="fa fa-times-circle" aria-hidden="true"></i>
								</a>
								
							</td>
							<?PHP } ?>
						</tr>
					<?PHP 
						} 
					?>
					</tbody>
				</table>
			</div>
		</div>
	</div>
</div>