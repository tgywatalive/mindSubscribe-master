<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<link
	href="${pageContext.request.contextPath }/mutualResource/assets/css/bootstrap.min.css"
	rel="stylesheet" />
<link rel="stylesheet"
	href="${pageContext.request.contextPath }/mutualResource/css/style.css" />
<link
	href="${pageContext.request.contextPath }/mutualResource/assets/css/codemirror.css"
	rel="stylesheet">
	<link rel="stylesheet"
		href="${pageContext.request.contextPath }/mutualResource/assets/css/ace.min.css" />
	<link rel="stylesheet"
		href="${pageContext.request.contextPath }/mutualResource/assets/css/font-awesome.min.css" />
	<!--[if IE 7]>
		  <link rel="stylesheet" href="${pageContext.request.contextPath }/mutualResource/assets/css/font-awesome-ie7.min.css" />
		<![endif]-->
	<!--[if lte IE 8]>
		  <link rel="stylesheet" href="${pageContext.request.contextPath }/mutualResource/assets/css/ace-ie.min.css" />
		<![endif]-->
	<script
		src="${pageContext.request.contextPath }/mutualResource/assets/js/jquery.min.js"></script>

	<!-- <![endif]-->

	<!--[if IE]>
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.10.2/jquery.min.js"></script>
<![endif]-->

	<!--[if !IE]> -->

	<script type="text/javascript">
			window.jQuery || document.write("<script src='${pageContext.request.contextPath }/mutualResource/assets/js/jquery-2.0.3.min.js'>"+"<"+"/script>");
		</script>

	<!-- <![endif]-->

	<!--[if IE]>
<script type="text/javascript">
 window.jQuery || document.write("<script src='${pageContext.request.contextPath }/mutualResource/assets/js/jquery-1.10.2.min.js'>"+"<"+"/script>");
</script>
<![endif]-->

	<script type="text/javascript">
			if("ontouchend" in document) document.write("<script src='${pageContext.request.contextPath }/mutualResource/assets/js/jquery.mobile.custom.min.js'>"+"<"+"/script>");
		</script>
	<script
		src="${pageContext.request.contextPath }/mutualResource/assets/js/bootstrap.min.js"></script>
	<script
		src="${pageContext.request.contextPath }/mutualResource/assets/js/typeahead-bs2.min.js"></script>
	<!-- page specific plugin scripts -->
	<script
		src="${pageContext.request.contextPath }/mutualResource/assets/js/jquery.dataTables.min.js"></script>
	<script
		src="${pageContext.request.contextPath }/mutualResource/assets/js/jquery.dataTables.bootstrap.js"></script>
	<script type="text/javascript"
		src="${pageContext.request.contextPath }/mutualResource/js/H-ui.js"></script>
	<script type="text/javascript"
		src="${pageContext.request.contextPath }/mutualResource/js/H-ui.admin.js"></script>
	<script
		src="${pageContext.request.contextPath }/mutualResource/assets/layer/layer.js"
		type="text/javascript"></script>
	<script
		src="${pageContext.request.contextPath }/mutualResource/assets/laydate/laydate.js"
		type="text/javascript"></script>
</head>

<body>
	<div class="page-content clearfix">
		<div id="Member_Ratings">
			<div class="d_Confirm_Order_style">
				<div class="search_style">
					<div class="title_names">??????????????????</div>
					<ul class="search_content clearfix">
						<form
							action="${pageContext.request.contextPath }/board/MessageBoardServlet?m=listMessageBoard"
							method="post">

							<li><label class="l_f">?????????</label><input name="creater"
								type="text" class="text_add" placeholder="?????????"
								value="${search.creater }" /></li>

							<li><label class="l_f">??????</label><input name="context"
								type="text" class="text_add" placeholder="????????????"
								value="${search.context }" /></li>
							<li><label class="l_f">??????????????????</label><input
								style="width: 120px;" id="startTime" name="startTime"
								type="text" class="inline laydate-icon" placeholder="???????????????"
								value="${search.startTime }" /></li>
							<li><label class="l_f">???</label><input style="width: 120px;"
								id="endTime" name="endTime" type="text"
								class="inline laydate-icon" placeholder="?????????"
								value="${search.endTime }" />???</li>


							<li><button type="submit" class="btn_search">
									<i class="icon-search"></i>??????
								</button></li>

						</form>

					</ul>
				</div>
				
				<!---->
				<c:if test="${not empty LOGIN_CLIENT }">
				<div class="border clearfix">
					<span class="l_f"> <a href="javascript:void()"
						id="member_add" class="btn btn-warning"><i class="icon-plus"></i>??????</a>
					</span> <span class="r_f">??????<b>${listSize }</b>???
					</span>
				</div>
				
				</c:if>
				
				
				<!---->
				
				<div class="table_menu_list">
					<table class="table table-striped table-bordered table-hover"
						id="sample-table">

						<thead>
							<tr>
								<th width=>???????????????</th>
								<th>????????????</th>
								<th width=>????????????</th>
							</tr>
						</thead>
						<tbody>

							<c:forEach items="${messageBoardList }" var="messageBoard">
							
							<c:if test="${messageBoard.isActive eq 1 }">
							
							<tr>

									<td>${messageBoard.client.name }</td>


									<td class="text-l">${messageBoard.context }</td>

									<td>
									<fmt:formatDate value="${messageBoard.createTime }" pattern="yyyy-MM-dd HH:mm:ss" />
									</td>

							</tr>
							
							
							
							</c:if>

								


							</c:forEach>



						</tbody>
					</table>
				</div>
			</div>
		</div>
	</div>
<!--??????????????????-->
	<div class="add_menber" id="add_menber_style" style="display: none">
		<form id="messageBoardForm">
			<ul class=" page-content">

				<li><label class="label_name">????????????:</label> <textarea
						name="context" id="context" class="textarea"
						onKeyUp="textarealength(this,1000)" cols="100" rows="10"></textarea>
					<p class="textarea-numberbar">
						<em class="textarea-length">0</em>/1000
					</p>
					<div class="prompt r_f" id="contextDiv"></div></li>

			</ul>

		</form>
	</div>
</body>
</html>
<script>
jQuery(function($) {
	
	
				
	var oTable1 = $('#sample-table').dataTable( {
		 "bSort" : true, //???????????????????????????????????????  
		"bStateSave": true,//????????????
		"bPaginate" : true, 
		 "bInfo" : true, //???????????????????????????DataTables??????????????????????????????  
		"searching": true//?????????????????????
		
	} );
			
			
				$('[data-rel="tooltip"]').tooltip({placement: tooltip_placement});
				function tooltip_placement(context, source) {
					var $source = $(source);
					var $parent = $source.closest('table')
					var off1 = $parent.offset();
					var w1 = $parent.width();
			
					var off2 = $source.offset();
					var w2 = $source.width();
			
					if( parseInt(off2.left) < parseInt(off1.left) + parseInt(w1 / 2) ) return 'right';
					return 'left';
				}
				
				
				
				/**
				*???????????????????????????
				*/
				$("#messageBoardForm :input").each(function(){
					
					var thisElement = $(this);
					
					//???????????????????????????????????????
					$(this).change(function(){ 
						
						isAbleCheck(thisElement);

					});	
				})
				
			});

/*??????-??????*/
$('#member_add').on('click', function(){
	 
   layer.open({
       type: 1,
       title: '??????',
		maxmin: true, 
		shadeClose: false, //?????????????????????
       area : ['800px' , '400px'],
       content:$('#add_menber_style'),
		btn:['??????','??????'],
		yes:function(index,layero){	
			
			var msg = "";
			
			if(isAbleCheck()){
				//??????????????????
				
				//ajax??????
			     $.ajax({  
			          url: '${pageContext.request.contextPath }/board/MessageBoardServlet?m=addMessageBoard' ,  
			          type: 'POST',  
			          dataType:'json', 
			          data: $("#messageBoardForm").serialize(),  
			          cache: false,  
			          success: function (data) { 
			        	  
			        	  if(data.isSuccess){
			        		  
			        		  //??????
			        		  $("#context").val("");
			        		  $('#add_menber_style').find("div[class='prompt r_f']").text("");
			        		  
			        		  layer.alert(data.msg,
			   	 	               {title: '?????????',				
			   	 					icon:1,	}	,
			   	 					function(){
			   	 					window.location.reload();
			   	 				  }); 
			        		  
			        	  }else{
			        		  layer.alert(data.msg,
			   	 	               {title: '?????????',				
			   	 					icon:1,	}
			   	 					);
			        	  }
			          },  
			          error: function (returndata) {  
			        	  msg = "????????????????????????"; 
			        	  layer.alert(msg,
					    		  
				 	               {title: '?????????',				
				 					icon:1,	}
				 					);
			        	  
			          }  
			     }); 
				
			     layer.close(index);
			     
				
			}else{
				
				layer.alert("???????????????????????????",{
	 	               title: '?????????',				
	 				icon:1,		
	 				  });
				
			}
		     
		}
   });
});

function isAbleCheck(){
	
	
	var len = $("#context").val().length;
	if(len > 1000 || len < 1){
		
		$("#contextDiv").html("<font style='color:red'>???????????????1-1000?????????</fong>");
		
		return false;
		
	}else{
		
		$("#contextDiv").html("<font style='color:green'>??????</fong>");
		
		return true;
		
	}
	
	
}


 laydate({
    elem: '#startTime',
    event: 'focus' 
}); 
 laydate({
	    elem: '#endTime',
	    event: 'focus' 
	}); 

</script>