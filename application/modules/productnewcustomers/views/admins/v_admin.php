
<div class="row">
	<div class="col-md-12">
		<div class="box box-primary">
			<div class="box-header col-md-1">
				<a href="panel/admin_user_create" type="button" class="btn btn-block btn-primary"><i class="fa fa-plus" aria-hidden="true"></i> Add</a>
			</div>
			<div class="box-body">
				<table class="table table-striped table-bordered table-autosort" cellspacing="0" width="100%">
					<thead>
						<tr>
							<th style="text-align: center;">User name</th>
							
							<th style="text-align: center;">ชื่อ</th>
							
							<th style="text-align: center;">นามสกุล</th>
							
							<th style="text-align: center;">Active</th>
							
							<th style="text-align: center;">Actions</th>
						</tr>
					</thead>
					<tbody>
					<?PHP
						foreach($data_cat as $row){
					?>
						<tr>
						
							<td><?PHP echo $row->username;?></td>
							
							<td><?PHP echo $row->first_name;?></td>
							
							<td><?PHP echo $row->last_name;?></td>
							
							<td style="text-align: center;"><?PHP if($row->active) echo "Active"; else echo "inactive";?></td>
							
							
							<td style="text-align: center;">
								<a href="panel/admin_user_edit/<?PHP echo $row->id;?>">
									<i class="fa fa-pencil-square-o" aria-hidden="true"></i>
								</a>
								|
								<a href="panel/admin_user_close/<?PHP echo $row->id;?>" style="<?PHP if($row->active) echo "color:green;"; else echo "color:red;";?>" onclick="return confirm('Are you sure you want to cheange active status this user?');">
									<!--<i class="fa fa-trash" aria-hidden="true"></i>-->
									<?PHP if($row->active) echo '<i class="fa fa-eye" aria-hidden="true"></i>'; else echo '<i class="fa fa-eye-slash" aria-hidden="true"></i>';?>
									
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