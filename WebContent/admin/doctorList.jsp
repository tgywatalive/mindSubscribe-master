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
      <div class="title_names">?????????????????????</div>
      <ul class="search_content clearfix">
      <form action="${pageContext.request.contextPath }/doctor/DoctorServlet?m=listDoctor" method="post">
      
            <li><label class="l_f">?????????????????????</label><input name="name" type="text"  class="text_add" placeholder="???????????????????????????" value="${search.name }" /></li>

            <li><label class="l_f">???&nbsp;&nbsp;???&nbsp;&nbsp;&nbsp;&nbsp;</label>
            <input name="sex" type="radio"  class="ace" value="1" ${search.sex eq 1 ? "checked='checked'":"" }/><span class="lbl">???</span>
            <input name="sex" type="radio"  class="ace" value="0" ${search.sex eq 0 ? "checked='checked'":""}/><span class="lbl">???</span>
            </li>
            
           
            <li><label class="l_f">????????????</label><input style="width:90px;" name="startAge" type="number" step="1" min="0" class="text_add" placeholder="????????????" value="${search.startAge }" /></li>
            <li><label class="l_f">???</label><input style="width:90px;" name="endAge" type="number" step="1" min="0" class="text_add" placeholder="????????????"  value="${search.endAge }"/>???</li>
            <li><label class="l_f">??????</label><input name="phone" type="text"  class="text_add" placeholder="??????"  value="${search.phone }"/></li>
            <li><label class="l_f">??????</label><input name="email" type="text"  class="text_add" placeholder="??????"  value="${search.email }"/></li>
       		<li ><button type="submit" class="btn_search"><i class="icon-search"></i>??????</button></li>
      
      </form>

      </ul>
    </div>
     <!---->
     <div class="border clearfix">
       <span class="l_f">
        <a href="javascript:void()" id="member_add" class="btn btn-warning"><i class="icon-plus"></i>?????????????????????</a>
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
				<th width="100">????????????</th>
				<th width="100">????????????</th>
				<th width="100">??????</th>
				<th width="80">??????</th>
				<th width="80">??????</th>
				<th width="120">??????</th>
				<th width="150">??????</th>
				<th width="">????????????????????????</th>
                <th width="100">??????</th>
				<th width="70">??????</th>                
				<th width="250">??????</th>
			</tr>
		</thead>
	<tbody>
	<c:forEach items="${doctorList }" var="doctor">
	
		<tr>
          <td><label><input type="checkbox" class="ace" value="${doctor.doctorId }" checkedName="${doctor.name }"><span class="lbl"></span></label></td>
          
          <td>${doctor.doctorName }</td>
          
          <td>
          <c:if test="${ empty doctor.img }">
          <img src="${pageContext.request.contextPath }/mutualResource/images/image.png"  width="77.7px" height="77.7px"/>
          </c:if>
          <c:if test="${not empty doctor.img }">

          <img src="/mind_upload/${doctor.img}"  width="77.7px" height="77.7px"/>

          </c:if>
          
          </td>
          
          <td><u style="cursor:pointer" class="text-primary" onclick="member_show(${doctor.doctorId })">${doctor.name }</u></td>
          
          <td>${doctor.sex eq 1 ? "???":"???" }</td>
          
          <td>${doctor.age }</td>
          
          <td>${doctor.phone }</td>
          
          <td>${doctor.email }</td>
          
          <td class="text-l">${doctor.place }</td>
          
          
          <td>${doctor.level }</td>
          
          <td class="td-status">
          
          <c:if test="${doctor.isActive eq 1}">
          	<span class="label label-success radius">?????????</span>
          	</td>
          
          	<td class="td-manage">
          		<a onClick="member_stop(this,${doctor.doctorId })"  href="javascript:;" title="??????"  class="btn btn-xs btn"><i class="icon-ok bigger-120"></i></a> 
          		<a title="??????" onclick="member_edit(${doctor.doctorId })" href="javascript:;"  class="btn btn-xs btn-info" ><i class="icon-edit bigger-120"></i></a> 
          		<a title="??????" href="javascript:;"  onclick="member_del(this,${doctor.doctorId })" class="btn btn-xs btn-warning" ><i class="icon-trash  bigger-120"></i></a>
          	
          	<a style="text-decoration:none"
								onClick="sendMessage(this,'${doctor.doctorId }','${doctor.name }','doctor')"
											href="javascript:;" title="????????????"
											class="btn btn-xs btn-success">??????</a>
          	
          	</td>
          	
          </c:if>
          <c:if test="${doctor.isActive eq 0}">
          
          	<span class="label label-defaunt radius">?????????</span>
         	 
         	 <td class="td-manage">
          		<a style="text-decoration:none" onClick="member_start(this,${doctor.doctorId })"  href="javascript:;" title="??????"  class="btn btn-xs btn-success"><i class="icon-ok bigger-120"></i></a> 
          		<a title="??????" onclick="member_edit(${doctor.doctorId })" href="javascript:;"  class="btn btn-xs btn-info" ><i class="icon-edit bigger-120"></i></a> 
          		<a title="??????" href="javascript:;"  onclick="member_del(this,${doctor.doctorId })" class="btn btn-xs btn-warning" ><i class="icon-trash  bigger-120"></i></a>
          	
          	
          	<a style="text-decoration:none" onClick="sendMessage(this,'${doctor.doctorId }','${doctor.name }','doctor')"
											href="javascript:;" title="????????????"
											class="btn btn-xs btn-success">??????</a>
          	
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
<!--??????????????????-->
<div class="add_menber" id="add_menber_style" style="display:none">
  <form action="" method="post" enctype="multipart/form-data" id="doctorEdit">
    <ul class=" page-content">
     <li><label class="label_name">?????????</label><span class="add_name"><input name="name" type="text" id="name"  class="text_add"/></span><div class="prompt r_f"></div></li>
     <li><label class="label_name">??????</label><span class="add_name"><input  name="age" id="age" type="number" step="1" min="0"  class="text_add"/></span><div class="prompt r_f"></div></li>
     
     <li><label class="label_name">???&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;??????</label><span class="add_name">
     <label><input name="sex" type="radio" value="1"  class="ace" id="sex1"><span class="lbl">???</span></label>&nbsp;&nbsp;&nbsp;
     <label><input name="sex" type="radio" value="0"  class="ace" id="sex0"><span class="lbl">???</span></label>&nbsp;&nbsp;&nbsp;
     </span>
     <div class="prompt r_f" id="sexDiv"></div>
     </li>
     <li><label class="label_name">?????????</label><span class="add_name"><input name="email" id="email" type="text"  class="text_add" "/></span><div class="prompt r_f"></div></li>
     <li><label class="label_name">?????????</label><span class="add_name"><input name="phone" id="phone" type="text"  class="text_add" "/></span><div class="prompt r_f"></div></li>
     
     
     <li><label class="label_name">?????????</label>
     <span class="add_name">
     <select name="level">
     	<option value="??????" id="level0">??????</option>
     	<option value="????????????" id="level1" >????????????</option>
     	<option value="????????????" id="level2">????????????</option>
     	<option value="???????????????" id="level3">???????????????</option>
        <option value="????????????" id="level4">????????????</option>
     </select>
     </span>
     <div class="prompt r_f" id="levleDiv"></div>
     </li>
     
     
     <li ><label class="label_name">???????????????</label><span class="add_name"><input name="place" id="place" type="text"  class="text_add"  /></span> <div class="prompt r_f"></div> </li>
     
     <li ><label class="label_name">????????????</label><span class="add_name"><input name="skill" id="skill" type="text"  class="text_add" /></span> <div class="prompt r_f"></div> </li>
     
     <!-- ?????? -->
     <li >
     <label class="label_name">????????????</label>
     <span class="add_name" id="img">
     <input name="imgPath" type="hidden"/>
     <img src="${pageContext.request.contextPath }/mutualResource/images/image.png" width="77.7" height="77.7" />
     </span>
     </li>
     <li>
     <input id="img" name="img" type="file"  class="text_add" style=" width:350px"/>
     </span>
     </li>
    
     
     <li class="adderss"></li>
     
     <li><label class="label_name">???&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;??????</label><span class="add_name">
     <label><input name="isActive" value="1" type="radio" id="isActive1" class="ace"><span class="lbl">??????</span></label>&nbsp;&nbsp;&nbsp;
     <label><input name="isActive" value="0" type="radio" id="isActive0"  class="ace"><span class="lbl">??????</span></label></span><div class="prompt r_f" id="isActiveDiv"></div></li>
    </ul>
    
   </form>
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
				
				
				
				
				
				/**
				*???????????????????????????
				*/
				$("#doctorEdit :input").each(function(){
					
					var thisElement = $(this);
					
					/* $(this).blur(function(){ 
					    //????????????????????????
						isAbleCheckOne(thisElement);

					});	 */
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
    	checkedsName += $(this).attr("checkedName") + ",";
		
	});
    
    checkeds = checkeds.slice(0, checkeds.length - 1);
    
    layer.confirm('????????????:' + checkedsName + '   ????????????',function(index){
    	
    	$.ajax({
			type : "GET",
			url : "${pageContext.request.contextPath}/doctor/DoctorServlet?m=deletDoctor&checkeds=" + checkeds,
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
	 
	 //?????????
	 toggleEdit(true);
	 
	 //???????????????
	 removeForm();
	 
    layer.open({
        type: 1,
        title: '????????????',
		maxmin: true, 
		shadeClose: false, //?????????????????????
        area : ['800px' , ''],
        content:$('#add_menber_style'),
		btn:['??????','??????'],
		yes:function(index,layero){	
			
			var msg = "";
			
			if(isAbleD(true)){
				//??????????????????
				
				//ajax??????
				var formData = new FormData($(layero).find('form')[0]);
			     $.ajax({  
			          url: '${pageContext.request.contextPath }/doctor/DoctorServlet?m=updateDoctor' ,  
			          type: 'POST',  
			          data: formData,  
			          async: false,  
			          cache: false,  
			          contentType: false,  
			          processData: false,  
			          success: function (data) { 
			        	  
			        	  if(data.isSuccess){
			        		  msg = "??????????????????????????????123456???";
			        	  }else{
			        		  msg = data.msg;
			        	  }
			          },  
			          error: function (returndata) {  
			        	  msg = "????????????????????????";  
			          }  
			     }); 
			     
			     layer.alert(msg,{
	 	               title: '?????????',				
	 				icon:1,		
	 				  },function(){
	 					 window.location.reload();
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


/*??????-??????*/
function member_show(id){
	
	//????????????
	$('#add_menber_style').find("div[class='prompt r_f']").text("");
	
	//?????????????????????
	selectedDoctor(id);
	
	//????????????
	toggleEdit(false);
	
	
	//??????????????????
	  layer.open({
      type: 1,
      title: '???????????????????????????',
		maxmin: true, 
		shadeClose:false, //?????????????????????
      area : ['800px' , ''],
      content:$('#add_menber_style'),
		btn:['????????????'],
		yes:function(index,layero){	
			layer.close(index);				
		}
  });
}
/*??????-??????*/
function member_stop(obj,id){
	layer.confirm('?????????????????????',function(index){
		
		//ajax
		$.ajax({
		type : "GET",
		url : "${pageContext.request.contextPath}/doctor/DoctorServlet?m=updateActive&action=0&id="+id,
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
		url : "${pageContext.request.contextPath}/doctor/DoctorServlet?m=updateActive&action=1&id="+id,
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
/*??????-??????*/
function member_edit(id){
	
	//???????????????
	 $('#add_menber_style').find("div[class='prompt r_f']").text("");
	
	
	//?????????????????????
	selectedDoctor(id);
	
	//????????????????????????
	toggleEdit(true);
	
	
	
	//??????????????????
	  layer.open({
        type: 1,
        title: '????????????',
		maxmin: true, 
		shadeClose:false, //?????????????????????
        area : ['800px' , ''],
        content:$('#add_menber_style'),
		btn:['??????','??????'],
		yes:function(index,layero){	
			
			var msg = "";
			
			if(!isAbleD(true)){
				return;
			}
			
			//ajax??????
			var formData = new FormData($(layero).find('form')[0]);
		     $.ajax({  
		          url: "${pageContext.request.contextPath }/doctor/DoctorServlet?m=updateDoctor&id="+id ,  
		          type: 'POST',  
		          data: formData,  
		          async: false,  
		          cache: false,  
		          contentType: false,  
		          processData: false,  
		          success: function (data) { 
		        	  
		        	  if(data.isSuccess){
		        		  msg = "???????????????";
		        	  }else{
		        		  msg = data.msg;
		        	  }
		          },  
		          error: function (returndata) {  
		        	  msg = "????????????????????????";  
		          }  
		     }); 
		     
		     layer.alert(msg,{
 	               title: '?????????',				
 				icon:1,		
 				  },function(){
 					 window.location.reload();
 				  });
		     layer.close(index);
		}
    });
}
/*??????-??????*/
function member_del(obj,id){
	layer.confirm('?????????????????????',function(index){
		
		$.ajax({
			type : "GET",
			url : "${pageContext.request.contextPath}/doctor/DoctorServlet?m=deletDoctor&id="+id,
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
 * ???????????????Doctor??????
 */
function selectedDoctor(id){
	
	//ajax
	$.ajax({
	type : "GET",
	url : "${pageContext.request.contextPath}/doctor/DoctorServlet?m=selecteDoctor&id="+id,
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
 * ???Doctor????????????
 */
function addDate(doctor){
	
	$("input[name='name']").val(doctor.name);
	$("input[name='age']").val(doctor.age);
	
	$("input[name='skill']").val(doctor.skill);
	
		
	$("input:radio[name='sex'][value='" + doctor.sex + "']").attr('checked','checked');
	
	
	$("input[name='email']").val(doctor.email);
	$("input[name='phone']").val(doctor.phone);
	
	if(doctor.level){
		$("select[name='level']").find("option[value='" + doctor.level + "']").attr("selected",true);
		
	}else{//?????????????????????
		$("select[name='level']").find("option[value='??????']").attr("selected",true);
	}
	 
	
	$("input[name='place']").val(doctor.place);
	
	$("input:radio[name='isActive'][value='" + doctor.isActive + "']").attr('checked','checked');
	
	var imgPath = $("input[name='imgPath']");
	$(imgPath).val(doctor.img);
	if(doctor.img){
		$(imgPath).next().attr("src","/mind_upload/"+doctor.img);
	}else{
		$(imgPath).next().attr("src","${pageContext.request.contextPath }/admin/images/icon_error_s.png");
	}
}

/**
 * ????????????????????????
 */
 function isAbleD(){
	
	var isOk = true;
	
	 $("#doctorEdit :input").each(function(){
		 
		 //????????????????????????
		 if( !isAbleCheckOne($(this))){
			 isOk = false;
		 }
		 
	 });
	 
	 return isOk;
	
}

 function isAbleCheckOne(thisElement){
	 
	 var isOk = true;
	 
	//????????????
	 if($(thisElement).is("input[name='name']")){
		 
		 var nameVal = $.trim($(thisElement).val()); 
         var regName = /[~#^$@%&!*()<>:;'"{}??????  ]/;
         if(nameVal == "" || nameVal.length > 6 || regName.test(nameVal)){
        	 
             var errorMsg = " ??????????????????????????????6???????????????????????????????????????";
             
             $(thisElement).parent().next("div").attr("style","color:red");
             
             $(thisElement).parent().next("div").html(errorMsg);
             
             isOk = false;
             
         }else{
        	 
        	 $(thisElement).parent().next("div").attr("style","color:green");
        	 
        	 $(thisElement).parent().next("div").html("??????");
         }
         
	 }
	 
	 //????????????
		if($(thisElement).is("input[name='age']")){
		 
		 var nameVal = $.trim($(thisElement).val()); 
		 
         var regName = /^((1[0-5])|[1-9])?\d$/;
         
         var msg = "";
         
         if(nameVal == "" || ! regName.test(nameVal)){
        	 
             var msg = " ?????????0-159??????????????????????????????";
             
             $(thisElement).parent().next("div").attr("style","color:red");
             
             
             isOk = false;
             
         }else{
        	 
        	 $(thisElement).parent().next("div").attr("style","color:green");
        	 msg = "??????";
        	 
         }
         $(thisElement).parent().next("div").html(msg);
		 
	 }
	 
		//???????????? ??? ?????????????????????????????????
		if($(thisElement).is("input[name='sex']")){
			
			var msg = "";
			
			if( $("input[name='sex']:checked").val() == null){
				
				msg = "????????????";
				$("#sexDiv").attr("style","color:red");
				
				isOk = false;
				
			}else{
				
				$("#sexDiv").attr("style","color:green");
				msg = "??????";
				
			}
			
			//????????????
			$("#sexDiv").html(msg);
			
		}
		
		//???????????????????????????????????????
		if($(thisElement).is("input[name='isActive']")){
			
			var msg = "";
			
			if( $("input[name='isActive']:checked").val() == null){
				
				msg = "????????????";
				$("#isActiveDiv").attr("style","color:red");
				
				isOk = false;
				
			}else{
				
				$("#isActiveDiv").attr("style","color:green");
				msg = "??????";
				
			}
			
			//????????????
			$("#isActiveDiv").html(msg);
			
		}
	 
		//????????????
		if($(thisElement).is("input[name='email']")){
		 
		 
		 var nameVal = $.trim($(thisElement).val()); 
		 
         var regName = /^(\w-*\.*)+@(\w-?)+(\.\w{2,})+$/;
         
         var msg = "";
         
         if(nameVal == "" || ! regName.test(nameVal)){
        	 
             var msg = " ?????????????????????????????????????????????";
             
             $(thisElement).parent().next("div").attr("style","color:red");
             
             isOk = false;
             
         }else{
        	 
        	 $(thisElement).parent().next("div").attr("style","color:green");
        	 msg = "??????";
        	 
         }
         $(thisElement).parent().next("div").html(msg);
		
	 }
		
		//????????????
		if($(thisElement).is("input[name='phone']")){
		 
		 
		 var nameVal = $.trim($(thisElement).val()); 
		 
         var regName = /^1[3456789]\d{9}$/;
         
         var msg = "";
         
         if(nameVal == "" || ! regName.test(nameVal)){
        	 
             var msg = " ??????????????????????????????11??????";
             
             $(thisElement).parent().next("div").attr("style","color:red");
             
             isOk = false;
             
         }else{
        	 
        	 $(thisElement).parent().next("div").attr("style","color:green");
        	 msg = "??????";
        	 
         }
         $(thisElement).parent().next("div").html(msg);
		 
	 }
		
		
		//??????????????????????????????????????????
		if($(thisElement).is("select[name='level']")){
			
			var msg = "";
			
			//?????????????????????????????????
			if($(thisElement).val() ==""){
				
				msg = "??????????????????";
				$("#levleDiv").attr("style","color:red");
				
				isOk = false;
				
			}else{
				
				$("#levleDiv").attr("style","color:green");
				msg = "??????";
				
			}
			
			//????????????
			$("#levleDiv").html(msg);
			
			
		}
		
		//????????????????????????????????????????????????200????????????
		if($(thisElement).is("input[name='place']") || $(thisElement).is("input[name='skill']")){
		 
		 
		var nameVal = $.trim($(thisElement).val()); 
        
        var msg = "";
        
        if(nameVal == "" || ! nameVal.length >200){
       	 
            var msg = " ???????????????????????????200????????????";
            
            $(thisElement).parent().next("div").attr("style","color:red");
            
            isOk = false;
            
        }else{
       	 
       	 	$(thisElement).parent().next("div").attr("style","color:green");
       	 	msg = "??????";
       	 
        }
        	$(thisElement).parent().next("div").html(msg);
			
		}
		
		//???????????????????????????
	 
		return isOk;
 }

 /**
 * 	?????????????????????
 */
function toggleEdit(isAble){
	
	
	$("#doctorEdit :input").each(function(){
		
		if(isAble=="1"){
			//??????????????????disabled=
			$(this).removeAttr("disabled");
		}else{
			
			$(this).attr("disabled","disabled");
		}

	});
	 
	
}

 /**
 * ????????????????????????
 */
function removeForm(){
	
	$("input:radio:checked").removeAttr('checked');
	 
	  $("select[name='level']").find("option:selected").removeAttr('selected');
	  
	  $("#name,#age,#email,#phone,#place,#skill,#img").val("");
	  $('#add_menber_style').find("div[class='prompt r_f']").text("");
	
}


/* laydate({
    elem: '#start',
    event: 'focus' 
}); */

</script>