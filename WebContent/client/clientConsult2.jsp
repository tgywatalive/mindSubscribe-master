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
     
     <!-- ?????? -->
     <div class="table_menu_list">
       <table class="table table-striped table-bordered table-hover" id="sample-table">
		<thead>
		 <tr>
 				<th >???????????????</th>
				<th>????????????</th>
				<th>??????????????????</th>
				<th>??????????????????</th>
				<th>????????????</th>
				<th>????????????</th>
<%--				<th >??????</th>--%>
			</tr>
		</thead>
	<tbody>
	<c:forEach items="${clientArchiveList }" var="clientArchive">
	
		<tr>
           
          <td>${clientArchive.doctor.name }</td>
          
          <td><fmt:formatDate value="${clientArchive.applyTime }" pattern="yyyy-MM-dd HH:mm:ss" /></td>
          
          <td><fmt:formatDate value="${clientArchive.startDatetime }" pattern="yyyy-MM-dd HH:mm:ss" /></td>
          
          <td><fmt:formatDate value="${clientArchive.endDatetime }" pattern="yyyy-MM-dd HH:mm:ss" /></td>
          
          <td>
          <c:if test="${not empty clientArchive.docPath}">
                    <u style="cursor:pointer" class="text-primary" onclick="javascript:window.location='${pageContext.request.contextPath}/DownloadFile?m=downloadSubDoc&subDocPath=${clientArchive.docPath }&filename=${clientArchive.doctor.name}_${LOGIN_CLIENT.name }'">${clientArchive.doctor.name}_${LOGIN_CLIENT.name }</u>

          </c:if>
          <c:if test="${empty clientArchive.docPath }">
          ???????????????????????????????????????
          </c:if>
          </td>
          
          <td>
          	${clientArchive.secondQuestionContext}
          </td>
          
          <%--<td class="td-manage">
          <a style="text-decoration:none" class="btn btn-xs btn-success" onclick="sendMessage(this,'${clientArchive.doctor.doctorId}','${clientArchive.doctor.name}','doctor')">?????????????????????</a>
          <a style="text-decoration:none" class="btn btn-xs btn-success" onclick="evaluateSub(${clientArchive.archivesId})">????????????</a>
          </td>--%>
          
		</tr>
	
	
	</c:forEach>
	
        
         
      </tbody>
	</table>
   </div>
  </div>
 </div>
</div>
<%@include file="/mutualResource/form/SendMessageForm.jsp"%>

<!--?????????????????? -->
<div class="add_menber" id="evaluateSubDiv" style="display:none">
<form id="evaluateSubForm">
	<ul class=" page-content">

		<li><label class="label_name">????????????:</label> <textarea
				name="context" id="context" class="textarea"
				onKeyUp="textarealength(this,200)" cols="50" rows="8"></textarea>
			<p class="textarea-numberbar">
				<em class="textarea-length">0</em>/200
			</p>
			<div style="color:red" class="prompt r_f" id="evaluateSubFormDiv"></div></li>
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
function evaluateSub(archivesId){
	
	layer.open({
        type: 1,
        title: '?????????????????????',
		maxmin: true, 
		shadeClose: false, //?????????????????????
        area : ['430px' , '390px'],
        content:$('#evaluateSubDiv'),
		btn:['??????','??????'],
		yes:function(index,layero){	
			
			var msg = "";
			
			if(isAble()){
				//??????????????????
				
				//ajax??????
			     $.ajax({  
			          url: '${pageContext.request.contextPath }/client/ClientSubServlet?m=evaluateSub&archivesId='+archivesId ,  
			          type: 'POST',  
			          dataType:'json', 
			          data: $("#evaluateSubForm").serialize(),  
			          cache: false,  
			          success: function (data) { 
			        	  
			        	  if(data.isSuccess){
			        		  
			        		  msg = "???????????????";
			        		  
			        		  $('#evaluateSubFormDiv').val("");
			        		  layer.alert(msg,
						    		  
			   	 	               {title: '?????????',				
			   	 					icon:1,	}	,
			   	 					function(){
			   	 						location.reload();
			   	 				  }); 
			        		  
			        	  }else{
			        		  msg = data.msg;
			        		  layer.alert(msg,
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
	
	
}
/**
 * ????????????????????????
 */
 function isAble(){
	
	var isOk = true;
	
	var text = $.trim($("#evaluateSubForm").find("#context").val());

	if(text.length > 200 || text ==""){
		isOk = false;
		$("#evaluateSubFormDiv").html("???????????????1-200??????");
	}
	 
	 return isOk;
	
}

</script>