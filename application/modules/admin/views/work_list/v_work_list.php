<style>
	th,td {
		    text-align: center;
	}
</style>
<div class="row">
	<div class="col-md-12">
		<div class="box box-primary">
			<div class="box-header">
				<a href="work_list/create" type="button" style="width:100px;" class="btn btn-block btn-primary"><i class="fa fa-plus" aria-hidden="true"></i> Add</a>
				
				
				<form class="form-horizontal">
				  <div class="box-body">
					<div class="form-group">
					  <label for="inputEmail3" class="col-sm-2 control-label">ฝ่าย</label>

					  <div class="col-md-4">
						<select class="form-control" onchange="window.location.assign('work_list/index/'+this.value);">
							<option value="0">ทั้งหมด</option>
							<?PHP foreach($cotton as $row) { ?>
								<option value="<?PHP echo $row->id;?>" <?PHP if($key_id == $row->id) echo "selected";?>><?PHP echo $row->name;?></option>
							<?PHP } ?>
						  </select>
					  </div>
					</div>
				  </div>
				  <!-- /.box-body -->
				
				</form>
				
				
			</div>
			
			
			
			<div class="box-body">
				<table class="table table-striped table-bordered " id="example" cellspacing="0" width="100%">
					<thead>
						<tr>
							<th>รายละเอียด</th>
							
							<th>สถานะ</th>
							
							<th>ฝ่าย</th>
							
							<th>Admin</th>
							
							<th>Actions</th>
						</tr>
					</thead>
					<tbody>
					<?PHP
						foreach($data_cat as $row){
					?>
						<tr>
						
							<td style="text-align: left;"><?PHP echo $row->work_detail;?></td>
							
							<td><?PHP if($row->work_status==1) echo "เปิดการใช้งาน"; else echo "ปิดการใช้งาน";?></td>
							
							<td><?PHP echo $row->name;?></td>
							
							<td><?PHP echo $row->first_name;?></td>
							
							<td>
								<a href="work_list/create/<?PHP echo $row->work_id;?>">
									<i class="fa fa-pencil-square-o" aria-hidden="true"></i>
								</a>
								|
								<a href="work_list/deletes/<?PHP echo $row->work_id;?>" onclick="return confirm('Are you sure you want to delete this item?');">
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
<script>
	$(document).ready(function() {
		$('#example').DataTable( {
			"order": [[ 3, "desc" ]]
		} );
	} );
</script>