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


					<!--<a href="work_now/create" type="button" class="btn btn-block btn-primary" style="width: 100px;"><i class="fa fa-plus" aria-hidden="true"></i> Add</a>-->














				</div>


			</div>


			<input type="hidden" name="<?PHP echo $this->security->get_csrf_token_name();?>" value="<?PHP echo $this->security->get_csrf_hash();?>" id="token-ke">


			<div class="box-body">


				<table class="table table-striped table-bordered table-autosort" id="datatable_serverside" cellspacing="0" width="100%">


					<thead>


						<tr>


							<th style="display:none;">No.</th>





							<th>เอกสาร</th>


							<!--


							<th>เลขที่เอกสาร</th>





							<th>ชื่อสินค้า</th>





							<th>ชื่อลูกค้า</th>


							-->


							<th>สถานะ</th>





							<th>ความคืบหน้า</th>





							<th>หมายเหตุ</th>





						<!--	<th>เพิ่มหมายเหตุ</th>








							<th>ผู้ดำเนินการ</th>





							<th>ผู้เพิ่ม/แก้ไข</th>-->





							<th>Actions</th>


						</tr>


					</thead>


					<tbody>
					<!-- <?PHP
					$i=0;
						foreach($data_cat as $row){
							$date1 = date('Y-m-d',strtotime("+3 days"));
					?>
						<tr style="<?PHP if($date1>=$row->order_datelate && $row->status==1){ echo "background-color: rgba(231, 243, 58, 0.45);";}?>">
							<td style="display:none;"><?PHP echo $i++;?></td>
							<td style="text-align:left;">
							<?PHP echo "เลขที่ : ".$row->code_id."</br>";?>
							<?PHP echo "สินค้า : ".$row->name_order."</br>";?>
							<?PHP echo "ลูกค้า : ".$row->name_customer."</br>";?>
							<?PHP echo "เซล : ".$row->first_name." ".$row->last_name."</br>";?>
							<?PHP echo "ประเภท : "; if($row->type_order==0) echo "งานแบรนด์"; else echo "งานกิโลกรัม";  echo"</br>"; ?>
							<?PHP echo "เริ่ม : ".splitDateDb3($row->order_date,'/')."</br>";?>
							<?PHP echo "กำหนด : ".splitDateDb3($row->order_datelate,'/');?>
							</td>
							<td>
								<?PHP if(!empty($row->status)){
										if($row->status==1){ echo "กำลังดำเนินงาน";}
										else if($row->status==2){ echo "งานมีปัญหา";}
										else if($row->status==3){ echo "เสร็จสิ้น";}
								} ?>
							</td>
							<td style="width: 20%;">
								 <button type="button" class="btn btn-success btn-md" onclick="change_status_all('<?PHP echo $row->order_id;?>');">เสร็จทั้งหมด</button>
								  <button type="button" class="btn btn-info btn-md" data-toggle="modal" data-target="#exampleModal" data-whatever="<?PHP echo $row->order_id;?>">ดูรายละเอียด</button>
							</td>
							<td style="max-width: 150px; text-align:left;" id="comment-<?PHP echo $row->order_id;?>">
							<?php  $comment_all = modules::run($this->config->item('ci_bootstrap')['link_module'].'/work_now/get_comment_com',$row->order_id);
									foreach($comment_all as $coms){
							?>
									<?PHP
									?>
									<div class="direct-chat-msg right" id="show_com-<?PHP echo $coms->comment_id;?>">
									  <img class="direct-chat-img" src="<?PHP echo base_url();?>assets/uploads/users/<?PHP if(!empty($coms->img)) echo $coms->img; else echo "sales-icon-32.png";?>" alt="message user image">
									  <div class="direct-chat-text">
									  <span class="direct-chat-timestamp pull-right"><?PHP echo $coms->first_name;?></span>
									  <span class="direct-chat-timestamp pull-left"><?PHP echo splitDateTime($coms->comment_date);?></span></br>
										<?PHP echo $coms->detail;?>
									  </div>
									</div>
									<?PHP } ?>
						</td>
							<td>
								<a href="javascript:void(0)" onclick="change_status_all('<?PHP echo $row->order_id;?>');">
									<i class="fa fa-check-square-o" aria-hidden="true"></i>
								</a>
								|
								<a href="work_now/showall/<?PHP echo $row->order_id;?>">
									<i class="fa fa-list-alt" aria-hidden="true"></i>
								</a>
							</td>
						</tr>
					<?PHP
						}
					?> -->
					</tbody>


				</table>


			</div>


		</div>


	</div>


</div>





<div class="modal fade" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel">


	  <div class="modal-dialog" role="document">


		<div class="modal-content">


		  <div class="modal-header">


			  <button type="button" class="close" data-dismiss="modal">&times;</button>


			  <h4 class="modal-title">ความคืบหน้า</h4>


			</div>








			<div class="modal-body">


				<p style="text-align: left;</p>


				<div class="progress progress-sm active">


					<div class="progress-bar progress-bar-success progress-bar-striped" role="progressbar" aria-valuenow="20" aria-valuemin="0" aria-valuemax="100" style="width: 20%;color: #000;">





					</div>


				</div>





		  <div class="modal-footer">


			<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>


		  </div>


		  </div>


		</div>


	  </div>



<script>
	$(document).ready(function(){
		$('#datatable_serverside').DataTable({
			"processing" : true,
			"serverSide" : true,
			"ajax" : {
				"url" : "<?php echo base_url('stickerscompany/work_now/datatable_now') ?>",
				"dataType": "json",
			    "type": "POST",
			    "data":{  '<?php echo $this->security->get_csrf_token_name(); ?>' : '<?php echo $this->security->get_csrf_hash(); ?>' }
			},
		    "columns": [
			          { "data" : "order_id" },
			          { "data" : "status"},
			          { "data" : "btn",orderable :false},
			          { "data" : "note",orderable :false},
			          { "data" : "view",orderable :false},
			          // { "data" : "view"},
			       ]
		});
	});
</script>




<script>


	$('#exampleModal').on('show.bs.modal', function (event) {


		  var button = $(event.relatedTarget);


		 // console.log(button.data('whatever'));





		  $.ajax({


			 type: "GET",


			 url: "<?PHP echo base_url($this->config->item('ci_bootstrap')['link_module'].'/work_now/persen_all_group_ajax/');?>"+button.data('whatever'),


			 dataType: "text",


			 cache:false,


			 beforeSend: function() {


				$('.modal-body').html("");


			 },


			 success:


				  function(data){


					//alert(data);  //as a debugging message.


					//var modal = $(".modal-body");


					$('.modal-body').html(data);


					//console.log(data);


				  }


			  });








	})





	function change_status_all(order_id){





		if (confirm("คุณต้องการเปลี่ยนสถานะของงานทั้งหมดเป็น เสร็จสิ้น ?")) {


			$.ajax({


				url: "<?PHP echo base_url($this->config->item('ci_bootstrap')['link_module']."/work_now/change_status_all/");?>"+order_id,


				success: function(result){


					if(result)


						alert("สถานะของงานถูกเปลี่ยนเรียบร้อยแล้ว");


				}


			});


		}


	}


</script>