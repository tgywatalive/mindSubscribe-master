<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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
					<div class="title_names">????????????????????????${search.receiver}</div>
					<ul class="search_content clearfix">
						<form
							action="${pageContext.request.contextPath }/message/MessageServlet?m=listSendMessage&reqeustUser=admin"
							method="post">

							<li><label class="l_f">???????????????</label>
							<select name="receiver" value="${search.receiver}">
								<option value="">??????</option>
								<option value="admin" ${search.receiver eq "admin" ? "selected":""}>?????????</option>
								<option value="doctor" ${search.receiver eq "doctor" ? "selected":""}>???????????????</option>
								<option value="client" ${search.receiver eq "client" ? "selected":""}>????????????</option>
							</select>
							</li>
							
							<li><label class="l_f">??????</label><input name="receiverName"
								type="text" class="text_add" placeholder="???????????????"
								value="${search.receiverName }" /></li>

							<li><label class="l_f">??????</label><input name="context"
								type="text" class="text_add" placeholder="????????????"
								value="${search.context }" /></li>
								
								
							<li>
								<label class="l_f">????????????</label>
								<select name="isRead">
								<option value="">??????</option>
								<option value="1" ${search.isRead eq 1 ? "selected" : "" }>??????</option>
								<option value="0" ${search.isRead eq 0 ? "selected" : "" }>??????</option>
							</select>                                     
							</li>	
							<li><label class="l_f">??????????????????</label><input
								 id="startSendTime" name="startSendTime"
								type="text" class="inline laydate-icon" placeholder="???????????????"
								value="${search.startSendTime }" /></li>
							<li><label class="l_f">???</label><input 
								id="endSendTime" name="endSendTime" type="text"
								class="inline laydate-icon" placeholder="????????????"
								value="${search.endSendTime }" />???</li>


							<li><button type="submit" class="btn_search">
									<i class="icon-search"></i>??????
								</button></li>

						</form>

					</ul>
				</div>
				<!---->
				<%-- <div class="border clearfix">
					<span class="l_f"> <a href="javascript:void()"
						id="member_add" class="btn btn-warning"><i class="icon-plus"></i>????????????</a>
					</span> <span class="r_f">??????<b>${listSize }</b>???
					</span>
				</div> --%>
				<!---->
				<div class="table_menu_list">
					<table class="table table-striped table-bordered table-hover"
						id="sample-table">

						<thead>
							<tr>
								<th width="100">?????????</th>
								<th>??????</th>
								<th width="110">????????????</th>
								<th width="70">????????????</th>
								<th width="250">??????</th>
							</tr>
						</thead>
						<tbody>

							<c:forEach items="${messageList }" var="message">

								<tr>

									<td>${message.receiverName}</td>

									<td class="text-l">${message.context }</td>

									<td>
									<fmt:formatDate value="${message.sendTime }" pattern="yyyy-MM-dd HH:mm:ss" />
									</td>

									<c:if test="${message.isRead eq 0}">
										<td class="td-status"><span
											class="label label-success radius">??????</span>
										</td>

									</c:if>
									<c:if test="${message.isRead eq 1}">
										<td class="td-status"><span
											class="label label-defaunt radius">??????</span></td>
										
									</c:if>
									
									<td>
									<a style="text-decoration:none"
											onClick="sendMessage(this,'${message.receiverId }','${message.receiverName }','${message.receiver }')"
											href="javascript:;" title="????????????"
											class="btn btn-xs btn-success">????????????</a>
									</td>

								</tr>

							</c:forEach>



						</tbody>
					</table>
				</div>
			</div>
		</div>
	</div>
	
<%@include file="/mutualResource/form/SendMessageForm.jsp"%>

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
				$("#announcementForm :input").each(function(){
					
					var thisElement = $(this);
					
					//???????????????????????????????????????
					$(this).change(function(){ 
						
						isAbleCheckOne(thisElement);

					});	
				})
				
			});
 



 laydate({
    elem: '#startSendTime',
    event: 'focus' 
}); 
 laydate({
	    elem: '#endSendTime',
	    event: 'focus' 
	}); 

</script>