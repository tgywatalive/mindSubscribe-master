<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
      <form action="${pageContext.request.contextPath }/client/ClientServlet?m=listClient" method="post">
      
            <li><label class="l_f">??????</label><input style="width:70px;" name="name" type="text"  class="text_add" placeholder="???????????????" value="${search.name }" /></li>
            
            <li><label class="l_f">???&nbsp;&nbsp;???&nbsp;&nbsp;&nbsp;&nbsp;</label>
            <input name="sex" type="radio"  class="ace" value="1" ${search.sex eq 1 ? "checked='checked'":"" }/><span class="lbl">???</span>
            <input name="sex" type="radio"  class="ace" value="0" ${search.sex eq 0 ? "checked='checked'":""}/><span class="lbl">???</span>
            </li>
            
           
            <li><label class="l_f">????????????</label><input style="width:70px;" name="startAge" type="number" step="1" min="0"  class="text_add" placeholder="????????????" value="${search.startAge }" /></li>
            <li><label class="l_f">???</label><input style="width:70px;" name="endAge" type="number" step="1" min="0"  class="text_add" placeholder="????????????"  value="${search.endAge }"/>???</li>
            
            <li></li>
            <li></li>
            
            <li><label class="l_f">??????</label><input name="phone" type="text"  class="text_add" placeholder="??????"  value="${search.phone }"/></li>
            <li><label class="l_f">??????</label><input name="email" type="text"  class="text_add" placeholder="??????"  value="${search.email }"/></li>
       		
       		<li><label class="l_f">??????????????????</label><input style="width:120px;" id="startRegionTime" name="startRegionTime" type="text"  class="inline laydate-icon" placeholder="????????????" value="${search.startRegionTime }" /></li>
            <li><label class="l_f">???</label><input style="width:120px;" id="endRegionTime" name="endRegionTime" type="text"  class="inline laydate-icon" placeholder="?????????"  value="${search.endRegionTime }"/>???</li>
       		
       		
       		
       		<li ><button type="submit" class="btn_search"><i class="icon-search"></i>??????</button></li>
      
      </form>

      </ul>
    </div>
     
     <!-- ?????? -->
     <div class="table_menu_list">
       <table class="table table-striped table-bordered table-hover" id="sample-table">
		<thead>
		 <tr>
				<th><label><input type="checkbox" class="ace"><span class="lbl"></span></label></th>
 				<th >????????????</th>
				<th>??????</th>
				<th>??????</th>
				<th>??????</th>
				<th>??????</th>
				<th>??????</th>
				<th >????????????</th>
				<th >??????</th>                
				<th >??????</th>
			</tr>
		</thead>
	<tbody>
	<c:forEach items="${clientList }" var="client">
	
		<tr>
           <td><label><input type="checkbox" class="ace" value="${client.clientId }" checkedName="${client.name }"><span class="lbl"></span></label></td>
           
          <td>${client.clientName }</td>
          
          <td>${client.name }</td>
          
          <td>${client.sex eq 1 ? "???":"???" }</td>
          
          <td>${client.age }</td>
          
          <td>${client.phone }</td>
          
          <td>${client.email }</td>
          
          <td class="text-l"><fmt:formatDate value="${client.regionTime }" pattern="yyyy-MM-dd HH:mm:ss" /></td>
          
          
          <td class="td-status">
          
          
          <c:if test="${client.isActive eq 1}">
          	<span class="label label-success radius">?????????</span>
          	</td>
          
          	<td class="td-manage">
          	
          	 <a onClick="member_stop(this,${client.clientId })"  href="javascript:;" title="??????"  class="btn btn-xs btn"><i class="icon-ok bigger-120"></i></a> 
          	
          	<a style="text-decoration:none"
								onClick="sendMessage(this,'${client.clientId }','${client.name }','client')"
											href="javascript:;" title="????????????"
											class="btn btn-xs btn-success">????????????</a>
          	</td>
          	
          </c:if>
          <c:if test="${client.isActive eq 0}">
          
          	<span class="label label-defaunt radius">?????????</span>
         	 
         	 <td class="td-manage">
         	 
         	 <a style="text-decoration:none" onClick="member_start(this,${client.clientId })"  href="javascript:;" title="??????"  class="btn btn-xs btn-success"><i class="icon-ok bigger-120"></i></a> 
         	 
         	 
         	 <a style="text-decoration:none"
								onClick="sendMessage(this,'${client.clientId }','${client.name }','client')"
											href="javascript:;" title="????????????"
											class="btn btn-xs btn-success">????????????</a>
          	</td>
          </c:if>
          
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
				"aaSorting": [[ 1, "desc" ]],//?????????????????????
		"bStateSave": true,//????????????
		"aoColumnDefs": [
		  //{"bVisible": false, "aTargets": [ 3 ]} //????????????????????????
		  {"orderable":false,"aTargets":[0,8,9]}// ????????????????????????
		] } );
				
				
				$('table th input:checkbox').on('click' , function(){
					var that = this;
					$(this).closest('table').find('tr > td:first-child input:checkbox')
					.each(function(){
						this.checked = that.checked;
						$(this).closest('tr').toggleClass('selected');
					});
						
				});
			
			
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
				
				
			});
  

/*??????-??????*/
function member_stop(obj,id){
	layer.confirm('?????????????????????',function(index){
		
		//ajax
		$.ajax({
		type : "GET",
		url : "${pageContext.request.contextPath}/client/ClientServlet?m=updateActive&action=0&id="+id,
		dataType : "json",
		success : function(data) {
			
			if (data['isSuccess'] == true) {
				$(obj).parents("tr").find(".td-manage").prepend('<a style="text-decoration:none" class="btn btn-xs btn-success " onClick="member_start(this,' + id +')" href="javascript:;" title="??????"><i class="icon-ok bigger-120"></i></a>');
				$(obj).parents("tr").find(".td-status").html('<span class="label label-defaunt radius">?????????</span>');
				$(obj).remove();
				layer.msg('?????????!',{icon: 5,time:1000});
			}else{
				layer.msg('????????????! '+data['msg'],{icon: 0,time:1000});
			}
		}
	});
		
	});
}

/*??????-??????*/
function member_start(obj,id){
	layer.confirm('?????????????????????',function(index){
		
		//ajax
		$.ajax({
		type : "GET",
		url : "${pageContext.request.contextPath}/client/ClientServlet?m=updateActive&action=1&id="+id,
		dataType : "json",
		success : function(data) {
			
			if (data['isSuccess'] == true) {
				$(obj).parents("tr").find(".td-manage").prepend('<a style="text-decoration:none" class="btn btn-xs btn" onClick="member_stop(this,' + id +')" href="javascript:;" title="??????"><i class="icon-ok bigger-120"></i></a>');
				$(obj).parents("tr").find(".td-status").html('<span class="label label-success radius">?????????</span>');
				$(obj).remove();
				layer.msg('?????????!',{icon: 6,time:1000});
			}else{
				layer.msg('????????????! '+data['msg'],{icon: 0,time:1000});
			}
		}
	});
		
	});
}

 laydate({
    elem: '#startRegionTime',
    event: 'focus' 
}); 
 laydate({
	    elem: '#endRegionTime',
	    event: 'focus' 
	}); 

</script>