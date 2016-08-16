<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8" isELIgnored="false" %>
<!DOCTYPE html>
<html>
<head>
  <title>ConfigServer Config</title>
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
        ConfigServer Configuration
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
          <h3 class="box-title">Config Information</h3>

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
					                 <label class="col-sm-1 control-label" >ServerId</label>
					                  <div class="col-sm-3">
					                        <input class="form-control" id="serverId" name="serverId" type="text" />
					                  </div>
					                        <label class="col-sm-1 control-label" >ServerName</label>
					                  <div class="col-sm-3">
					                        <input class="form-control" id="serverName" name="serverName" type="text"/>
					                   </div>
					                   <label class="col-sm-1 control-label" >DspNum</label>
					                  <div class="col-sm-3">
					                        <input class="form-control" id="dspnum" name="dspnum" type="text"/>
					                   </div>
					              </div>
					             <div class="form-group">
					                 <label class="col-sm-1 control-label" >Svc URL</label>
					                  <div class="col-sm-3">
					                        <input class="form-control" id="svcUrl" name="svcUrl" type="text" />
					                  </div>
					                        <label class="col-sm-1 control-label" >Http URL</label>
					                  <div class="col-sm-3">
					                        <input class="form-control" id="httpUrl" name="httpUrl" type="text"/>
					                   </div>
					                   <label class="col-sm-1 control-label" >Valid</label>
					                  <div class="col-sm-3">
					                        <input class="form-control" id="valid" name="valid" type="text"/>
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
	        		$("#serverId").attr("readonly",true);
	        		//是修改界面
	        		//改变单击事件
	        		$("#saveButton").click(modifyConfigServer);
	        		$("#closeButton").click(closeWindow);
	        		//填充表单
	        		  var columns= [
	    							"serverId" ,
	   							 "serverName",
	   							 "dspnum",
	   							 "svcUrl",
	   							 "httpUrl",
	   							 "valid"
	   			            ];
	        		for(var i=0;i<columns.length;i++){
	        			var a=$("#"+columns[i]);
	        			a.val(param[columns[i]]);
	        		}
	        	}else{
	        		//是新增页面
	        		//改变单击事件
	        		$("#saveButton").click(saveConfigServer);
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
	       function modifyConfigServer(){
	        	$.ajax(
                 		{ type:"POST",
                 		  url:"<%=path%>/configServerModify",
                 		  data:$("#deviceForm").serialize(),
                 		  success:function(data){
                 			 window.returnValue = "success";
                 			 window.close();
                 			  },
                 		  error:function(msg){
                 			  alert("error!"+msg.responseText);
                 			 window.returnValue = "error";  //返回值
                 		  	}
                 		 }
                 		  
                 		  
                 	  );
	        }
	       
           function saveConfigServer(){
        	   $.ajax(
                 		{ type:"POST",
                 		  url:"<%=path%>/saveConfigServer",
                 		  data:$("#deviceForm").serialize(),
                 		  success:function(){
                 			window.returnValue = "success";
                 			window.close();
                 			  },
                 		  error:function(msg){
                 		 window.returnValue = "error";  //返回值
                 			  alert("error!"+msg.responseText);
                 		  	}
                 		 }
                 		  
                 		  
                 	  );
           }
        </script>
</body>
</html>
