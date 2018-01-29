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


					เดือน :


					<input  type="text" readonly="readonly" id="datepicker" onchange="window.location.assign('<?PHP echo base_url("admin/report/".$link."/"); ?>'+this.value)" name="date" value="<?PHP if(!empty($date)) echo $date;?>" >


					<script>


						$("#datepicker").datepicker( {


							format: "mm-yyyy",


							viewMode: "months",


							minViewMode: "months"


						});


					</script>


					<a href="<?PHP echo base_url("admin/report/".$link."?all=1"); ?>"><button type="button" class="btn btn-info btn-md pull-right">แสดงข้อมูลทั้งหมด</button></a>


				</div>





			</div>


			<input type="hidden" name="<?PHP echo $this->security->get_csrf_token_name();?>" value="<?PHP echo $this->security->get_csrf_hash();?>" id="token-ke">


			<div class="box-body">


				<table class="table table-striped table-bordered table-autosort" id="datatable_serverside" cellspacing="0" width="100%">


					<thead>


						<tr>


							<th style="display:none;">No.</th>





							<th>เลขที่เอกสาร</th>





							<th>สถานะ</th>





							<th>ความคืบหน้า</th>





							<th>หมายเหตุ</th>





							<th>เพิ่มหมายเหตุ</th>





							<th>Actions</th>


						</tr>


					</thead>
					<tbody>
					<!-- <?PHP
					$i=0;
					if(!empty($data_cat)){
						foreach($data_cat as $row){
							$date1 = date('Y-m-d',strtotime("+3 days"));
					?>
						<tr id="roder-ol-<?PHP echo $row->order_id;?>" style="<?PHP if($date1>=$row->order_datelate && $row->status==1){ echo "background-color: rgba(231, 243, 58, 0.45);";}?>">
							<td style="display:none;"><?PHP echo $i++;?></td>
							<td style="text-align:left;">
							<?PHP
								echo "เลขที่ : ".$row->code_id."</br>";
								echo "สินค้า : ".$row->name_order."</br>";
								echo "ลูกค้า : ".$row->name_customer."</br>";
								echo "เซล : ".$row->first_name." ".$row->last_name."</br>";
								echo "ประเภท : "; if($row->type_order==0) echo "งานแบรนด์"; else echo "งานกิโลกรัม";  echo"</br>";
								echo "เริ่ม : ".splitDateDb3($row->order_date,'/')."</br>";
								if($row->order_workcount!=0)
									echo "กำหนด : ".splitDateDb3($row->order_datelate,'/')."</br>";
								if($row->status==3)
									echo "เสร็จ : ".splitDateDb3($row->order_datelate,'/')."</br>";
							?>
							</td>
							<td>
								<select name="status" class="form-control" onchange="change_status_work_now_del('<?PHP echo $row->order_id;?>','<?php echo base_url("admin/report/change_status");?>',this.value);">
								  <option value="1" <?PHP if(!empty($row->status)){ if($row->status==1){ echo "selected";}} ?>>กำลังดำเนินงาน</option>
								  <option value="2" <?PHP if(!empty($row->status)){ if($row->status==2){ echo "selected";}} ?>>งานมีปัญหา</option>
								  <option value="3" <?PHP if(!empty($row->status)){ if($row->status==3){ echo "selected";}} ?>>เสร็จสิ้น</option>
								</select>
							</td>
							<td style="width: 20%;">
								<button type="button" class="btn btn-success btn-md" data-toggle="modal" data-target="#exampleModal_qa" data-whatever="<?PHP echo $row->order_id;?>">QA</button>
								<button type="button" class="btn btn-success btn-md" data-toggle="modal" data-target="#exampleModal_qc" data-whatever="<?PHP echo $row->order_id;?>">QC Lab</button>
								<button type="button" class="btn btn-info btn-md"    data-toggle="modal" data-target="#exampleModal"    data-whatever="<?PHP echo $row->order_id;?>">ความคืบหน้า</button>
							</td>
							<td style="max-width: 150px;" id="comment-<?PHP echo $row->order_id;?>">
								<button type="button" class="btn btn-info btn-md"    data-toggle="modal" data-target="#exampleModal_comment"    data-whatever="<?PHP echo $row->order_id;?>">ดูหมายเหตุ</button>
							</td>
							<td>
									<textarea rows="2" cols="15" name="detail" id="text_ar-<?PHP echo $row->order_id;?>" ></textarea></br>
									<input type="hidden" name="order_id" value="<?PHP echo $row->order_id;?>" >
									<button type="button" onclick="comment_save('<?PHP echo $row->order_id;?>','<?PHP echo $this->session->userdata("username");?>','<?php echo base_url("admin/report/comment"); ?>','<?php echo base_url("admin/report/delete_comment");?>','<?PHP echo base_url();?>assets/uploads/users/<?PHP if(!empty($coms->img)) echo $coms->img; else echo "sales-icon-32.png";?>')" class="btn btn-success">Submit</button>
							</td>
							<td>
								<a href="report/showall/<?PHP echo $row->order_id."/".$link;?>">
									<i class="fa fa-list-alt" aria-hidden="true"></i>
								</a>
							</td>
						</tr>
					<?PHP
						}
					}
					?> -->
					</tbody>
				</table>
			</div>
		</div>
	</div>
</div>






<div class="modal fade" id="exampleModal_qc" role="dialog" aria-labelledby="exampleModal_qc">


  <div class="modal-dialog" role="document">


	<div class="modal-content">


	  <div class="modal-header">


		  <button type="button" class="close" data-dismiss="modal">&times;</button>


		  <h4 class="modal-title">ผลการทดสอบ (QC Lab)</h4>


		</div>








		<div class="" id="module_qc" style="text-align: left;position: relative;padding: 15px;">


		</div>


	  <div class="modal-footer">


		<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>


	  </div>





	</div>


  </div>


</div>








<div class="modal fade" id="exampleModal_qa" role="dialog" aria-labelledby="exampleModal_qa">


  <div class="modal-dialog" role="document">


	<div class="modal-content">


	  <div class="modal-header">


		  <button type="button" class="close" data-dismiss="modal">&times;</button>


		  <h4 class="modal-title">ผลการทดสอบ (QA)</h4>


		</div>








		<div class="" id="module_qa" style="text-align: left;position: relative;padding: 15px;">





		</div>


	  <div class="modal-footer">


		<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>


	  </div>





	</div>


  </div>


</div>





<div class="modal fade" id="exampleModal_comment" role="dialog" aria-labelledby="exampleModal_comment">


  <div class="modal-dialog" role="document">


	<div class="modal-content">


	  <div class="modal-header">


		  <button type="button" class="close" data-dismiss="modal">&times;</button>


		  <h4 class="modal-title">หมายเหตุ</h4>


		</div>








		<div class="" id="module_comment" style="text-align: left;position: relative;padding: 15px;">


		</div>


	  <div class="modal-footer">


		<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>


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


				<p style="text-align: left;"></p>


				<div class="progress progress-sm active">


					<div class="progress-bar progress-bar-success progress-bar-striped" role="progressbar" aria-valuenow="20" aria-valuemin="0" aria-valuemax="100" style="width: 20%;color: #000;">





					</div>


			</div>





			</div>


		  <div class="modal-footer">


			<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>


		  </div>





		</div>


	  </div>


</div>



<script>

		var datatable_serverside = $('#datatable_serverside').DataTable({
			"lengthMenu": [[10, 25, 50, -1], [10, 25, 50, "All"]],
			"processing" : true,
			"serverSide" : true,
			"ajax" : {
				"url" : "<?php echo base_url('admin/report/datatable_now') ?>/<?=$link ?>?month="+$("#datepicker").val(),
				"dataType": "json",
			    "type": "POST",
			    // "data":{  '<?php echo $this->security->get_csrf_token_name(); ?>' : '<?php echo $this->security->get_csrf_hash(); ?>' }
			    "data":function (d){
			    	d.<?php echo $this->security->get_csrf_token_name(); ?> = '<?php echo $this->security->get_csrf_hash(); ?>';
		    		d.month = $("#datepicker").val();
			    }
			},
		    "columns": [
			          { "data": "order_id" },
			          { "data": "title"},
			          { "data": "btn", orderable :false},
			          { "data": "note", orderable :false},
			          { "data": "detail", orderable :false},
			          { "data": "view", orderable :false},
			       ]
		});
		$("#datepicker").datepicker( {
			format: "mm-yyyy",
			viewMode: "months",
			minViewMode: "months"
		});

		$('body').on('change','#datepicker',function(){
			if($(this).val()){
				datatable_serverside.ajax.reload();
			}
		});

</script>




<script>


	$('#exampleModal').on('show.bs.modal', function (vals) {


		  var button = $(vals.relatedTarget);


		 // console.log(button.data('whatever'));





		  $.ajax({


			 type: "GET",


			 url: "<?PHP echo base_url('admin/report/persen_all_group_ajax/');?>"+button.data('whatever')+"/null/<?PHP echo $link;?>",


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





	$('#exampleModal_qc').on('show.bs.modal', function (vals) {


		  var button = $(vals.relatedTarget);


		 // console.log(button.data('whatever'));





		  $.ajax({


			 type: "GET",


			 url: "<?PHP echo base_url('admin/report/get_qc_comment/');?>"+button.data('whatever'),


			 dataType: "text",


			 cache:false,


			 beforeSend: function() {


				$('#module_qc').html("");


			 },


			 success:


				  function(data){


					//alert(data);  //as a debugging message.


					//var modal = $(".modal-body");


					$('#module_qc').html(data);


					//console.log(data);


				  }


			  });








	})





	$('#exampleModal_qa').on('show.bs.modal', function (vals) {


		  var button = $(vals.relatedTarget);


		 // console.log(button.data('whatever'));





		  $.ajax({


			 type: "GET",


			 url: "<?PHP echo base_url('admin/report/get_qa_comment/');?>"+button.data('whatever'),


			 dataType: "text",


			 cache:false,


			 beforeSend: function() {


				$('#module_qa').html("");


			 },


			 success:


				  function(data){


					//alert(data);  //as a debugging message.


					//var modal = $(".modal-body");


					$('#module_qa').html(data);


					//console.log(data);


				  }


			  });








	})





	$('#exampleModal_comment').on('show.bs.modal', function (vals) {


		  var button = $(vals.relatedTarget);


		 // console.log(button.data('whatever'));





		  $.ajax({


			 type: "GET",


			 url: "<?PHP echo base_url('admin/report/get_comment_ajax/');?>"+button.data('whatever'),


			 dataType: "text",


			 cache:false,


			 beforeSend: function() {


				$('#module_comment').html("");


			 },


			 success:


				  function(data){


					//alert(data);  //as a debugging message.


					//var modal = $(".modal-body");


					$('#module_comment').html(data);


					//console.log(data);


				  }


			  });








	})





</script>