<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8" isELIgnored="false" %>
<!DOCTYPE html>
<html>
<head>
  <title>Device Server Config</title>
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
        Device Server Configuration
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
          <h3 class="box-title">Device Information</h3>

          <div class="box-tools pull-right">
            <button type="button" class="btn btn-box-tool" data-widget="collapse"><i class="fa fa-minus"></i></button>
            <button type="button" class="btn btn-box-tool" data-widget="remove"><i class="fa fa-remove"></i></button>
          </div>
        </div>
        <!-- /.box-header -->
					<div class="box-body">
						<form class="form-horizontal" role="form" id="deviceForm">
					                     <fieldset>
					                       <div class="form-group">
					                          <label class="col-sm-1 control-label" >Dev Type</label>
					                          <div class="col-sm-3">
					                             <input class="form-control" id="devtype" name="devtype" type="text" />
					                          </div>
					                          <label class="col-sm-1 control-label" >AudioParams</label>
					                          <div class="col-sm-3">
					                             <input class="form-control" id="audioParams" name="audioParams" type="text"/>
					                          </div>
					                       </div>
					                    </fieldset>
					                    <div >   
					                     <button type="button" id="saveButton"  class="btn btn-primary">Save</button>
					                     <button type="button" id="closeButton" style="display:none" class="btn btn-primary">Close</button>
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
</style>  

<!-- page script -->
           <script type="text/javascript">
	        $(function() {
	        	var param=window.dialogArguments;
	        	if(param.action=="MODIFY"){
	        		$("#devtype").attr("readonly",true);
	        		//是修改界面
	        		//改变单击事件
	        		$("#saveButton").click(modifyMcu);
	        		$("#closeButton").click(closeWindow);
	        		//填充表单
	        		  var columns= [
							"devtype" ,
							 "audioParams" 
			                
			            ];
	        		for(var i=0;i<columns.length;i++){
	        			var a=$("#"+columns[i]);
	        			a.val(param[columns[i]]);
	        		}
	        	}else{
	        		//是新增页面
	        		//改变单击事件
	        		$("#saveButton").click(saveMcu);
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
	        function closeWindow(){
	        	window.close();
	        }
	       function modifyMcu(){
	        	$.ajax(
                 		{ type:"POST",
                 		  url:"<%=path%>/deviceModify",
                 		  data:$("#deviceForm").serialize(),
                 		  success:function(data){
                 			 //var dataArray=$.parseJSON( data ); 
                 			 //sendHttpMsg(dataArray);
                 			 window.returnValue = "success";
                 			 notifyServer({"ips":"","msg":"cmd=deviceparams_change","type":"GATE"});
                 			  },
                 		  error:function(msg){
                 			  alert("error!"+msg);
                 			 window.returnValue = "error";  //返回值
                 		  	}
                 		 }
                 		  
                 		  
                 	  );
	        }
	       
           function saveMcu(){
        	   $.ajax(
                 		{ type:"POST",
                 		  url:"<%=path%>/saveDevice",
                 		  data:$("#deviceForm").serialize(),
                 		  success:function(){
                 			window.returnValue = "success";
                 			notifyServer({"ips":"","msg":"cmd=deviceparams_change","type":"GATE"});
                 			  },
                 		  error:function(msg){
                 		 window.returnValue = "error";  //返回值
                 			  alert("error!"+msg);
                 		  	}
                 		 }
                 		  
                 		  
                 	  );
           }
        </script>
</body>
</html>
