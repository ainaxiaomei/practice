<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8" isELIgnored="false" %>
<!DOCTYPE html>
<html>
<head>
  <title>Dictionary Server Config</title>
  <%String path=getServletContext().getContextPath();%>
  <jsp:include page="common/common-head.jsp"></jsp:include>
</head>
<body class="hold-transition skin-blue sidebar-mini">
<div class="wrapper">
<jsp:include page="common/common-menu.jsp"></jsp:include>
    <!-- Left side column. contains the logo and sidebar -->
  
<jsp:include page="common/common-sidebar.jsp"></jsp:include>

  <!-- Content Wrapper. Contains page content -->
  <div class="content-wrapper">
    <!-- Content Header (Page header) -->
    <section class="content-header">
      <h1>
       AppResource  Configuration
      </h1>
      <ol class="breadcrumb">
        <li><a href="#"><i class="fa fa-dashboard"></i> Home</a></li>
        <li><a href="#">Tables</a></li>
        <li class="active">Data tables</li>
      </ol>
    </section>

    <!-- Main content -->
    <section class="content">
      <div class="box box-default">
        <div class="box-header with-border">
          <h3 class="box-title">AppResource Information</h3>

          <div class="box-tools pull-right">
            <button type="button" class="btn btn-box-tool" data-widget="collapse"><i class="fa fa-minus"></i></button>
            <button type="button" class="btn btn-box-tool" data-widget="remove"><i class="fa fa-remove"></i></button>
          </div>
        </div>
        <!-- /.box-header -->
					<div class="box-body">
						 <form class="form-horizontal" role="form" id="appResForm">
					                    <fieldset>
					                       <div class="form-group">
					                          <input class="form-control" id="id" name="id" type="text"  style="display:none"/>
					                          <label class="col-sm-1 control-label" >App Id</label>
					                          <div class="col-sm-3">
					                             <input class="form-control" id="appid" name="appid" type="text" readonly="true"/><a href="#" onclick="selectAppId()">select</a>
					                          </div>
					                          <label class="col-sm-1 control-label" >Room Id</label>
					                          <div class="col-sm-3">
					                             <input class="form-control" id="roomid" name="roomid" value="0" type="text"/>
					                          </div>
					                          <label class="col-sm-1 control-label" >Group Type</label>
					                          <div class="col-sm-3"   >
					                              <select class="form-control" id="gpType" name="gpType"> 
											      <option value="0">Mcu Group</option> 
											      <option value="1">Audio Group</option> 
											      </select>
					                          </div>
					                          
					                       </div>
					                       <div class="form-group">
					                          <label class="col-sm-1 control-label" >Group Left Id</label>
					                          <div class="col-sm-3">
					                             <input class="form-control"  id="gpLeftId" name="gpLeftId" type="text" readonly="true"/><a href="#" onclick="selectgpLeftId()">select</a>
					                          </div>
					                          <label class="col-sm-1 control-label" >Group Right Id</label>
					                          <div class="col-sm-3">
					                             <input class="form-control"  id="gpRightId" name="gpRightId" type="text" readonly="true" value="0"/><a id="rightGroupSelect" style="display:none" href="#" onclick="selectgpRightId()">select</a>
					                          </div>
					                           <label class="col-sm-1 control-label" >Description</label>
					                          <div class="col-sm-3">
					                             <input class="form-control"  id="description" name="description" type="text" />
					                          </div>
					                       </div>
					                    </fieldset> 
					                    <div >   
					                     <button id="saveButton" type="button"  class="btn btn-primary">Save</button>
					                    </div>
					     </form>
					</div>
					<!-- /.box-body -->
        <div class="box-footer">
        </div>
      </div>
     
      
    </section>
    <!-- /.content -->
  </div>
  <!-- /.content-wrapper -->
   <jsp:include page="common/common-footer.jsp"></jsp:include>

  <!-- Control Sidebar -->
     <jsp:include page="common/common-control.jsp"></jsp:include>
  <!-- Add the sidebar's background. This div must be placed
       immediately after the control sidebar -->
  <div class="control-sidebar-bg"></div>
</div>
<!-- ./wrapper -->
 <div id="dialog" title="Sending Message To HttpServer" style="display:none">
   <div id="progressbar"></div><span id="min">0<span>/<id="max" span>0</span>
     <div id="pragessMsg">
             
     </div>
 </div>
<!-- page script -->
         <script type="text/javascript">
	        $(function() {
	        	//增加下拉框事件
	        	$("#gpType").change(groupTypeChange);
	        	var param=window.dialogArguments;
	        	if(param.action=="MODIFY"){
	        		//是修改界面
	        		//改变单击事件
	        		$("#saveButton").click(modifyAppRes);
	        		//填充表单
	        		  var columns= [
  							"id" ,
  							 "appid" ,
  			                 "roomid",
  			                "gpLeftId" ,
  			                 "gpRightId" ,
  			                 "gpType" ,
  			                 "description"
  			                
  			            ];
	        		for(var i=0;i<columns.length;i++){
	        			var a=$("#"+columns[i]);
	        			a.val(param[columns[i]]);
	        		}
	        	}else{
	        		//是新增页面
	        		//改变单击事件
	        		$("#saveButton").click(saveAppRes);
	        	}
	        	//对话框
	        	$('#waitModal').on('hide.bs.modal', function () {
                 //恢复弹出框的状态
	        	  $("#imgLoading").show();
   				  $("#opError").hide();
   				  $("#opSuccess").hide();
   				  $("#detail").hide();
                 });
	        });
           var groupSelectUrl="<%=path%>/groupMcu";
           function groupTypeChange(){
        	  var selectValue=$(this).children('option:selected').val();
        	  if(selectValue==1){
        		  //audio group
        		  groupSelectUrl="<%=path%>/groupAudio";
        		  //audio 有rightgroup
        		  $("#rightGroupSelect").show();
        	  }else if(selectValue==0){
        		  //mcu group
        		  groupSelectUrl="<%=path%>/groupMcu";
        		  //mcu 没有rightgroup
        		  $("#rightGroupSelect").hide();
        	  }
           }
           function selectAppId(){
        	 //传参
	        	var object=new Object();
	        	object.action="SELECT";
	        	var returnVal=window.showModalDialog("<%=path%>/app?action=SELECT",object,"dialogWidth=1500px;dialogHeight=600px");
	        	//将返回值填到表单
	        	$("#appid").val(returnVal);
           }
           function selectgpLeftId(){
        	 //传参
	        	var object=new Object();
	        	object.action="SELECT";
	        	var returnVal=window.showModalDialog(groupSelectUrl,object,"dialogWidth=1000px;dialogHeight=900px");
	        	//将返回值填到表单
	        	$("#gpLeftId").val(returnVal);
           }
           function selectgpRightId(){
        	 //传参
	        	var object=new Object();
	        	object.action="SELECT";
	        	var returnVal=window.showModalDialog(groupSelectUrl,object,"dialogWidth=1000px;dialogHeight=900px");
	        	//将返回值填到表单
	        	$("#gpLeftId").val(returnVal);
           }
           function saveAppRes(){
        	   $.ajax(
                 		{ type:"POST",
                 		  url:"<%=path%>/saveAppRes",
                 		  data:$("#appResForm").serialize(),
                 		  success:function(data){
                 			 window.returnValue = "success";
                 			 var appid=$("#appid").val();
                   			 notifyServer({"ips":"","msg":"cmd=appres_change&id="+appid+"&act=1","type":"DB"});
                 			  },
                 		  error:function(msg){
                 			  alert("error!"+msg.responseText);
                 			 window.returnValue = "error";  //返回值
                 		  	}
                 		 }
                 		  
                 		  
                 	  );
           }
           function modifyAppRes(){
        	   $.ajax(
                		{ type:"POST",
                		  url:"<%=path%>/appResModify",
                		  data:$("#appResForm").serialize(),
                		  success:function(data){
                			  window.returnValue = "success";
                			  var appid=$("#appid").val();
                    			 notifyServer({"ips":"","msg":"cmd=appres_change&id="+appid+"&act=2","type":"DB"});
                			  },
                		  error:function(msg){
                			  alert("error!"+msg.responseText);
                			 window.returnValue = "error";  //返回值
                		  	}
                		 }
                		  
                		  
                	  );
           }
        </script>
</body>
</html>
