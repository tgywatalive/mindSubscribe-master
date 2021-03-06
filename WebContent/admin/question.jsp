<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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

</head>

<body>
<div class="page-content clearfix">
    <div id="Member_Ratings">
      <div class="d_Confirm_Order_style">
    <div class="search_style">
      <div class="title_names">????????????</div>
      <ul class="search_content clearfix">
      <form action="${pageContext.request.contextPath }/question/QuestionServlet?m=listQuestion" method="post">
      
            <li><label class="l_f">?????????</label><input name="context" type="text"  class="text_add" placeholder="??????????????????" value="${param.context }" /></li>
       		<li ><button type="submit" class="btn_search"><i class="icon-search"></i>??????</button></li>
      
      </form>

      </ul>
    </div>
     <!---->
     <div class="border clearfix">
       <span class="l_f">
        <a href="javascript:void()" id="member_add" class="btn btn-warning"><i class="icon-plus"></i>????????????</a>
        <a href="javascript:void()" id="deleteList"class="btn btn-danger"><i class="icon-trash"></i>????????????</a>
       </span>
       <span class="r_f">??????<b>${listSize }</b>???</span>
     </div>
     <!---->
     <div class="table_menu_list">
       <table class="table table-striped table-bordered table-hover" id="sample-table">
		<thead>
		 <tr>
				<th width="25"><label><input type="checkbox" class="ace"><span class="lbl"></span></label></th>
				<th >??????</th>
				<th >????????????</th>
				<th >??????:???</th>
				<th >??????:???</th>
				<th >??????</th>
			</tr>
		</thead>
	<tbody>
	<c:forEach items="${questionList }" var="question">
	
		<tr>
          <td><label><input type="checkbox" class="ace" value="${question.questionId }" checkedName="${question.questionNum }"><span class="lbl"></span></label></td>
          
          <td>${question.questionNum }</td>
          
          <td>${question.context }</td>
          
          <td>${question.answerYesScore }</td>
          
          <td>${question.answerNoScore }</td>
          
          
          <td class="td-manage">
          	<a title="??????" onclick="member_edit(${question.questionId })" href="javascript:;"  class="btn btn-xs btn-info" ><i class="icon-edit bigger-120"></i></a> 
          	<a title="??????" href="javascript:;"  onclick="member_del(this,${question.questionId })" class="btn btn-xs btn-warning" ><i class="icon-trash  bigger-120"></i></a>
          </td>
          
		</tr>
	
	</c:forEach>
	
        
         
      </tbody>
	</table>
   </div>
  </div>
 </div>
</div>
<!--??????????????????-->
<div class="add_menber" id="add_menber_style" style="display:none">
  <form action="" method="post" id="questionEdit">
    <ul class=" page-content">

				<li ><label class="label_name">??????</label> <input
					name="questionNum" id="questionNum" type="number" step="1" min="0" max="1000" style="width:60px;" />
					
				</li>
					
				<li><div class="prompt r_f" id="questionNumDiv"></div></li>
				

				<li ><label class="label_name">"???"?????????</label> <span
					class="add_name"> <input  name="answerYesScore"
						id="answerYesScore" type="number" step="1" min="0" style="width:60px;"
						class="text_add" "/>
					</span>
					<div class="prompt r_f" id="answerYesScoreDiv"></div>
				</li>
					
				<li><label class="label_name">"???"?????????</label><span
					class="add_name"><input name="answerNoScore" style="width:60px;"
						id="answerNoScore" type="number" step="1" min="0" class="text_add" "/></span>
				<div class="prompt r_f" id="answerNoScoreDiv"></div></li>

				<li>????????????<div class="prompt r_f" id="contextDiv"></div>
				
					<textarea name="context" id="context" class="textarea"
						onKeyUp="textarealength(this,100)" cols="30" rows="4"></textarea>
					<p class="textarea-numberbar">
						<em class="textarea-length">0</em>/100
					</p>
					
					
				</li>


				
     
    </ul>
    
   </form>
 </div>
</body>
</html>
<script>
jQuery(function($) {
	
	
				var oTable1 = $('#sample-table').dataTable( {
				"aaSorting": [[ 1, "desc" ]],//?????????????????????
		"bStateSave": true,//????????????
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
				
				
				
				/**
				*???????????????????????????
				*/
				$("#add_menber_style :input").each(function(){
					
					var thisElement = $(this);
					//???????????????????????????????????????
					$(this).change(function(){ 
						
						isAbleCheckOne(thisElement);

					});	
				})
				
			});
/*????????????*/
$("#deleteList").on('click',function(){

    var checkeds = "";
    
    var checkedsName= "";
    
    $("#sample-table").find("input[type='checkbox']:checked").each(function(){
		
    	checkeds += $(this).val() + ",";
    	checkedsName += $(this).attr("checkedName") + "???,";
		
	});
    
    checkeds = checkeds.slice(0, checkeds.length - 1);
    
    layer.confirm('????????????:' + checkedsName + '   ????????????',function(index){
    	
    	$.ajax({
			type : "GET",
			url : "${pageContext.request.contextPath}/question/QuestionServlet?m=deletQuestion&checkeds=" + checkeds,
			dataType : "json",
			success : function(data) {
				
				if (data['isSuccess'] == true) {
					
					//??????????????????
					var objs = $("#sample-table").find("input[type='checkbox']:checked");
					for(var o = 0 ; o < objs.length; o++){
						
						$(objs[o]).parents("tr").remove();
						
					}
					
					layer.msg('?????????!',{icon:1,time:1000});
					
				}else{
					layer.msg(data['msg'],{icon: 0,time:1000});
				}
			}
		});
    	
    	layer.close(index);
    	
    });
    
 });  
			
/*??????-??????*/
 $('#member_add').on('click', function(){
	 
	 //???????????????
	 removeForm();
	 
    layer.open({
        type: 1,
        title: '????????????',
		maxmin: true, 
		shadeClose: false, //?????????????????????
        area : ['500px' , '400px'],
        content:$('#add_menber_style'),
		btn:['??????','??????'],
		yes:function(index,layero){	
			
			var msg = "";
			
			if(isAble()){
				//??????????????????
				
				//ajax??????$("#SendMessageForm").serialize()
				var formData = $($(layero).find('form')[0]).serialize();
			     $.ajax({  
			          url: '${pageContext.request.contextPath }/question/QuestionServlet?m=updateQuestion' ,  
			          type: 'POST',  
			          data: formData,  
			          dataType : "json",
			          success: function (data) { 
			        	  
			        	  layer.alert(data.msg,{
			 	               title: '?????????',				
			 				icon:1,		
			 				  },function(){
			 					 window.location.reload();
			 				  });
					     layer.close(index);
			        	  
			          },  
			           
			     }); 
			     
			     
				
				
				
			}else{
				
				layer.alert("???????????????????????????",{
	 	               title: '?????????',				
	 				icon:1,		
	 				  });
				
			}
			
			
		     
		}
    });
});


/*??????-??????*/
function member_edit(id){
	
	//???????????????
	 removeForm();
	
	//?????????????????????
	selectedDoctor(id);
	
	
	//??????????????????
	  layer.open({
        type: 1,
        title: '????????????',
		maxmin: true, 
		shadeClose:false, //?????????????????????
        area : ['500px' , '400px'],
        content:$('#add_menber_style'),
		btn:['??????','??????'],
		yes:function(index,layero){	
			
			var msg = "";
			
			if(isAble()){
				//??????????????????
			
				var msg = "";
				//ajax??????
				var formData = $($(layero).find('form')[0]).serialize();
			     $.ajax({  
			          url: "${pageContext.request.contextPath }/question/QuestionServlet?m=updateQuestion&id="+id ,  
			          type: 'POST',  
			          data: formData,  
			          cache: false, 
			          dataType : "json",
			          success: function (data) { 
			        	  
			        	  layer.alert(data.msg,{
			 	               title: '?????????',				
			 				icon:1,		
			 				  },function(){
			 					 window.location.reload();
			 				  });
					     layer.close(index);
			          },  
			     }); 
			     
				
			}else{
				
				layer.alert("???????????????????????????",{
	 	               title: '?????????',				
	 				icon:1,		
	 				  });
				
			}
		     
		     
		}
    });
}
/*??????-??????*/
function member_del(obj,id){
	layer.confirm('?????????????????????',function(index){
		
		$.ajax({
			type : "GET",
			url : "${pageContext.request.contextPath}/question/QuestionServlet?m=deletQuestion&id="+id,
			dataType : "json",
			success : function(data) {
				
				if (data['isSuccess'] == true) {
					
					//??????????????????
					$(obj).parents("tr").remove();
					
					layer.msg('?????????!',{icon:1,time:1000});
				}else{
					layer.msg(data['msg'],{icon: 0,time:1000});
				}
			}
		});
		
		//???????????????
		layer.close(index);
		
	});
}



/**
 * ???????????????Question??????
 */
function selectedDoctor(id){
	
	//ajax
	$.ajax({
	type : "GET",
	url : "${pageContext.request.contextPath}/question/QuestionServlet?m=selecteQuestion&id="+id,
	dataType : "json",
	success : function(data) {
		
		//????????????
		if (data['isSuccess'] == true) {
			
			addDate(data.dataList[0]);
		
		
		}else{
			layer.msg(data['msg'],{icon: 0,time:1000});
		}
	}
	});
	
	
}

/**
 * ???Question????????????
 */
function addDate(question){
	
	$("#questionNum").val(question.questionNum);
	$("#answerYesScore").val(question.answerYesScore);
	$("#answerNoScore").val(question.answerNoScore);
	$("#context").val(question.context);
	
}

/**
 * ????????????????????????
 */
 function isAble(){
	
	var isOk = true;
	
	 $("#add_menber_style :input").each(function(){
		 
		 //????????????????????????
		 if( !isAbleCheckOne($(this))){
			 isOk = false;
		 }
		 
	 });
	 
	 return isOk;
	
}

 function isAbleCheckOne(thisElement){
	 
	 var isOk = true;
	 
	//??????????????????
	 if($(thisElement).is("#context")){
		 
		 var nameVal = $.trim($(thisElement).val()); 
		 var msg = "";
         if(nameVal == "" || nameVal.length > 100){
        	 
        	 msg = " ???????????????1-100????????????";
             
             $("#contextDiv").attr("style","color:red");
             
             
             
             isOk = false;
             
         }else{
        	 
        	 $("#contextDiv").attr("style","color:green");
        	 
        	 msg = "??????";
         }
         $("#contextDiv").html(msg);
         
	 }
	 
	 //????????????
		if($(thisElement).is("#questionNum")){
		 
		 var nameVal = $.trim($(thisElement).val()); 
         
         var msg = "";
         
         if(nameVal < 1 || nameVal > 100){
        	 
             var msg = " ?????????1-100????????????";
             
             $("#questionNumDiv").attr("style","color:red");
             
             
             isOk = false;
             
         }else{
        	 
        	 $("#questionNumDiv").attr("style","color:green");
        	 msg = "??????";
        	 
         }
         $("#questionNumDiv").html(msg);
		 
	 }
	 
		//??????"???"??????
		if($(thisElement).is("#answerYesScore")){
		 
		 var nameVal = $.trim($(thisElement).val()); 
         
         var msg = "";
         
         if(nameVal == ""){
        	 
             var msg = "??????????????????";
             
             $("#answerYesScoreDiv").attr("style","color:red");
             
             
             isOk = false;
             
         }else{
        	 
        	 $("#answerYesScoreDiv").attr("style","color:green");
        	 msg = "??????";
        	 
         }
         $("#answerYesScoreDiv").html(msg);
		 
	 }
		
		//??????"???"??????
		if($(thisElement).is("#answerNoScore")){
		 
		 var nameVal = $.trim($(thisElement).val()); 
         
         var msg = "";
         
         if(nameVal == ""){
        	 
             var msg = "??????????????????";
             
             $("#answerNoScoreDiv").attr("style","color:red");
             
             
             isOk = false;
             
         }else{
        	 
        	 $("#answerNoScoreDiv").attr("style","color:green");
        	 msg = "??????";
        	 
         }
         $("#answerNoScoreDiv").html(msg);
		 
	 }
	 
		return isOk;
 }

 /**
 * ????????????????????????
 */
function removeForm(){
	  
	  $("#questionNum,#answerYesScore,#answerNoScore,#context").val("");
	  $('#add_menber_style').find("div[class='prompt r_f']").text("");
	
}


/* laydate({
    elem: '#start',
    event: 'focus' 
}); */

</script>