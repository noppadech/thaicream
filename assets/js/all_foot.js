$('body').on('click','.btn-action',function(){
	var order_id = $(this).data('order-id');
	var user = $(this).data('user');
	var comment = $(this).data('comment');
	var d_comment = $(this).data('d_comment');
	var img = $(this).data('img');
	comment_save(order_id,user,comment,d_comment,img);
});
$('body').on('change','.sel',function(){
	var s_id = $(this).data('s_id');
	var s_url = $(this).data('s_url');
	var s_value = $(this).val();
	change_status_work_now_del(s_id,s_url,s_value);
});
$('body').on('click','.del',function(){
	var d_id = $(this).data('d_id');
	var d_url = $(this).data('d_url');
	comment_delete(d_id,d_url);
});

	function comment_delete(id,url){

		if(confirm('Are you sure you want to delete this item?')){

			jQuery.ajax({

				type: "POST",

				url: url,

				dataType: 'json',

				data: {order_id: id , csrf_test_name : $("#token-ke").val()},

				success: function(res) {

					$("#token-ke").val(res.token);

					if(res.cks){

						var html = '';

						$("#show_com-"+id).html(html);

			

					}

				}

			});

		}

		return false;

	}

	function comment_save(id,name,url,url_d,img){

		jQuery.ajax({

			type: "POST",

			url: url,

			dataType: 'json',

			data: {order_id: id, detail: $("#text_ar-"+id).val(), csrf_test_name : $("#token-ke").val()},

			success: function(res) {

				$("#token-ke").val(res.token);

				if(res.cks){

					//var html = '<ul id="show_com-'+res.cks+'"><li>'+$("#text_ar-"+id).val()+' by '+name;

			

					//	html += '<a role="button" onclick="comment_delete(\''+res.cks+'\',\''+url_d+'\')">';

						

					//	html += '<i class="fa fa-times-circle" aria-hidden="true"></i></a></li></ul>';

						

						d = new Date();

						

						var html = '<div class="direct-chat-msg right" id="show_com-'+res.cks+'">';

						  

						 html += ' <img class="direct-chat-img" src="'+img+'" alt="message user image">';

						  

						 html += ' <div class="direct-chat-text">';

						 html += ' <span class="direct-chat-timestamp pull-right">'+name+'</span>';

						 html += ' <span class="direct-chat-timestamp pull-left">'+d.toLocaleString()+'</span></br>';

						html += '	'+$("#text_ar-"+id).val()+'';

						html += '	<a role="button" onclick="(\''+res.cks+'\',\''+url_d+'\')">';

						html += '		<i class="fa fa-times-circle" aria-hidden="true"></i>';

						html += '	</a>';

						html += '  </div>';

						  

						html += '</div>';

						

						

						

						

						

					$("#comment-"+id).append(html);

					$("#text_ar-"+id).val('');

				}

			}

		});

	}

	

	function change_status_work_now(id,url,value){

		//console.log(id+" "+value);

		if(confirm('Are you sure you want to change status this item?')){

			jQuery.ajax({

				type: "POST",

				url: url,

				dataType: 'json',

				data: {order_id: id, value: value , csrf_test_name : $("#token-ke").val()},

				success: function(res) {

					$("#token-ke").val(res.token);

					if(res.cks){

						

					}

				}

			});

		}

		return false;

	}

	

	function change_status_work_now_del(id,url,value){

		console.log(id+" "+value);

		if(confirm('Are you sure you want to change status this item?')){

			jQuery.ajax({

				type: "POST",

				url: url,

				dataType: 'json',

				data: {order_id: id, value: value , csrf_test_name : $("#token-ke").val()},

				success: function(res) {

					$("#token-ke").val(res.token);

					var html = '';

						$("#roder-ol-"+id).html(html);

					if(res.cks){

						

					}

				}

			});

		}

		return false;

	}

	

	function qc_comment_save(id,url){

		jQuery.ajax({

			type: "POST",

			url: url,

			dataType: 'json',

			data: {order_id: id, detail: CKEDITOR.instances['qc_lab'].getData(), csrf_test_name : $("#token-ke").val()},

			success: function(res) {

				

				$("#token-ke").val(res.token);

				alert("บันทึกเสร็จสิ้น");

			}

		});

	}

	

	function qa_comment_save(id,url){

		jQuery.ajax({

			type: "POST",

			url: url,

			dataType: 'json',

			data: {order_id: id, detail: CKEDITOR.instances['qa_lab'].getData(), csrf_test_name : $("#token-ke").val()},

			success: function(res) {

				

				$("#token-ke").val(res.token);

				alert("บันทึกเสร็จสิ้น");

			}

		});

	}

	$( document ).ready(function() {

		$('.form-horizontal').on('keyup keypress', function(e) {

		  var keyCode = e.keyCode || e.which;

		  if (keyCode === 13) { 

			e.preventDefault();

			return false;

		  }

		});

	});

	

	