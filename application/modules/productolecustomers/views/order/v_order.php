
<div class="row">
	<div class="col-md-12">
		<div class="box box-primary">
			<div class="box-header">
				<div class="box-header">
					<a href="order/create" type="button" class="btn btn-block btn-primary" style="width: 100px;"><i class="fa fa-plus" aria-hidden="true"></i> Add</a>
				</div>
			</div>
			<div class="box-body">
				<input type="hidden" name="<?PHP echo $this->security->get_csrf_token_name();?>" value="<?PHP echo $this->security->get_csrf_hash();?>" id="token-ke">
				<table class="table table-striped table-bordered table-autosort" cellspacing="0" width="100%">
					<thead>
						<tr>
							<th style="display:none;text-align: center;"> No.</th>
							
							<th style="text-align: center;">เลขที่เอกสาร</th>
							
							<th style="text-align: center;">ชื่อสินค้า</th>
							
							<th style="text-align: center;">ชื่อลุกค้า</th>
							
							<th style="text-align: center;">Status</th>
							
							<th style="text-align: center;">ผู้ดำเนินการ</th>
							
							<th style="text-align: center;">วันที่เริ่ม</th>
							
							<th style="text-align: center;">หมายเหตุ</th>
							
							<th style="text-align: center;">เพิ่มหมายเหตุ</th>
							
							<th style="text-align: center;">Actions</th>
						</tr>
					</thead>
					<tbody>
					<?PHP
					$i=0;
						foreach($data_cat as $row){
					?>
						<tr>
						
							<td style="display:none;"><?PHP $i++;?></td>
							
							<td><?PHP echo $row->code_id;?></td>
							
							<td><?PHP echo $row->name_order;?></td>
							
							<td><?PHP echo $row->name_customer;?></td>
							
							<td style="text-align: center;"><?PHP if($row->status==1) echo "กำลังดำเนินงาน"; else if($row->status==2) echo "งานมีปัญหา"; else if($row->status==3) echo "เสร็จสิ้น";?></td>
							
							<td style="text-align: center;"><?PHP echo $row->first_name;?></td>
							
							<td style="text-align: center;"><?PHP echo fullDate2($row->order_date);?></td>
							<!--
							
							<td  style="max-width: 100px;">
							<?php  $comment_all = modules::run('supportsales/order/get_comment',$row->order_id); 
							
									foreach($comment_all as $coms){
							?>
									<ul>
										<li>
											
											<?PHP echo $coms->detail." by ".$coms->first_name;?>
											<a href="order/delete_comment/<?PHP echo $coms->comment_id;?>" onclick="return confirm('Are you sure you want to delete this item?');">
												<i class="fa fa-times-circle" aria-hidden="true"></i>
											</a>
											
										</li>
									</ul>
									<?PHP } ?>
							</td>-->
							
							
							
							<td style="max-width: 100px; text-align:left;" id="comment-<?PHP echo $row->order_id;?>">
							
							<?php  $comment_all = modules::run('supportsales/order/get_comment',$row->order_id); 
							
									foreach($comment_all as $coms){
							?>
									<ul id="show_com-<?PHP echo $coms->comment_id;?>">
										<li>
											
											<?PHP echo $coms->detail." by ".$coms->first_name; ?>
											<a role="button" onclick="comment_delete('<?PHP echo $coms->comment_id;?>','<?php echo base_url("supportsales/order/delete_comment");?>')">
												<i class="fa fa-times-circle" aria-hidden="true"></i>
											</a>
											
										</li>
									</ul>
									<?PHP } ?>
							</td>
							
							
							
							
							
							
							<!--
							<td style="text-align: center;">
							
								<?PHP
									$attributes = array('class' => 'form-horizontal',"role"=>"form");
									echo form_open("supportsales/order/comment",$attributes); 
								?>
									<textarea rows="4" cols="25" name="detail"></textarea></br>
									<input type="hidden" name="order_id" value="<?PHP echo $row->order_id;?>" >
									<button type="submit" class="btn btn-success">Submit</button>
								<?PHP 
									echo form_close();
								?>
							</td>-->
							
							<td style="text-align:center;">
									<textarea rows="4" cols="25" name="detail" id="text_ar-<?PHP echo $row->order_id;?>" ></textarea></br>
									<input type="hidden" name="order_id" value="<?PHP echo $row->order_id;?>" >
									<button type="button" onclick="comment_save('<?PHP echo $row->order_id;?>','<?PHP echo $this->session->userdata("username");?>','<?php echo base_url("supportsales/order/comment"); ?>','<?php echo base_url("supportsales/order/delete_comment");?>')" class="btn btn-success">Submit</button>
								
							</td>
							
							
							
							
							<td style="text-align: center;">
								<a href="order/create/<?PHP echo $row->order_id;?>">
									<i class="fa fa-pencil-square-o" aria-hidden="true"></i>
								</a>
								|
								<a href="order/deletes/<?PHP echo $row->order_id;?>" onclick="return confirm('Are you sure you want to delete this item?');">
									<i class="fa fa-times-circle" aria-hidden="true"></i>
								</a>
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
</div>