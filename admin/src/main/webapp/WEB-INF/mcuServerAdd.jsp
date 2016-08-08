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
        GroupMcu  Configuration
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
          <h3 class="box-title">GroupMcu Information</h3>

          <div class="box-tools pull-right">
            <button type="button" class="btn btn-box-tool" data-widget="collapse"><i class="fa fa-minus"></i></button>
            <button type="button" class="btn btn-box-tool" data-widget="remove"><i class="fa fa-remove"></i></button>
          </div>
        </div>
        <!-- /.box-header -->
					<div class="box-body">
						 <form class="form-horizontal" role="form" id="mcuForm">
					                    <fieldset>
					                       <div class="form-group">
					                          <label class="col-sm-1 control-label" >Server Name</label>
					                          <div class="col-sm-3">
					                             <input class="form-control" id="serverId" name="serverId" type="text" style="display:none"/>
					                             <input class="form-control" id="serverName" name="serverName" type="text"/>
					                          </div>
					                          <label class="col-sm-1 control-label" >Dsp Number</label>
					                          <div class="col-sm-3">
					                             <input class="form-control" id="dspnum" name="dspnum" type="text"/>
					                          </div>
					                          <label class="col-sm-1 control-label" >SVC Url</label>
					                          <div class="col-sm-3">
					                             <input class="form-control" id="svcUrl" name="svcUrl" type="text" />
					                          </div>
					                       </div>
					                       <div class="form-group">
					                          <label class="col-sm-1 control-label" >Http Url</label>
					                          <div class="col-sm-3">
					                             <input class="form-control"  id="httpUrl" name="httpUrl" type="text"/>
					                          </div>
					                          <label class="col-sm-1 control-label" >Com Url</label>
					                          <div class="col-sm-3">
					                             <input class="form-control"  id="comUrl" name="comUrl" type="text"/>
					                          </div>
					                          <label class="col-sm-1 control-label" >Valid</label>
					                          <div class="col-sm-3">
					                             <input class="form-control"  id="valid" name="valid" type="text"/>
					                          </div>
					                       </div>
					                    </fieldset> 
					                    <div >   
					                     <button type="button" id="saveButton"  class="btn btn-primary">Save</button>
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
	        	var param=window.dialogArguments;
	        	if(param.action=="MODIFY"){
	        		//是修改界面
	        		//改变单击事件
	        		$("#saveButton").click(modifyMcu);
	        		//填充表单
	        		 var columns= [
	   							"serverId" ,
	   							 "serverName" ,
	   			                 "dspnum",
	   			                "svcUrl" ,
	   			                 "httpUrl" ,
	   			                 "comUrl" ,
	   			                 "valid" 
	   			                 
	   			                
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
	        })
	         function sendHttpMsg(dataArray,msg){
	        	var progressbar = $( "#progressbar" ).progressbar({
	        		 max: dataArray.length
	        	    });
	        	$( "#dialog" ).dialog({
	        		close: function( event, ui ) {
	        			  window.returnValue = "success";  //返回值
                		  window.close();
	        		}
	        	});
	        	var a=0;
	        	
	        	setTimeout(function (){
	        		process(a,dataArray,msg);
	        	},80);
        		
	        	
	        }
	        function process(a,dataArray,msg){
        		var httpurl=dataArray[a].httpUrl;
        		$.ajax(
                 		{ type:"POST",
                 		  url:httpurl,
                 		  data:msg,
                 		   async :false,
                 		  success:function(){
          	        		setProgress(httpurl,"success");
                 			  },
                 		  error:function(msg){
                 		     //发送服务器失败网路问题
                 			setProgress(httpurl,"error");
                 		  	}
                 		 }
                 		  
                 		  
                 	  );
        		if(a<dataArray.length){
        			setTimeout(function(){
        				process(++a,dataArray,msg)
        			},80);
        		}
        	}
	        function setProgress(url,status){
	        	var progressbar = $( "#progressbar" );
	        	 var val = progressbar.progressbar( "value" ) || 0;
    		      progressbar.progressbar( "value", val + 1 );
    		     $("#pragessMsg").append("<span>Sending Message to "+url+"...</span><span style='color:red'>"+status+"</span><br/>");
	        }
	       function modifyMcu(){
	        	$.ajax(
                 		{ type:"POST",
                 		  url:"<%=path%>/mcuServerModify",
                 		  data:$("#mcuForm").serialize(),
                 		  success:function(data){
                 			 if(data&&data=="send"){
                				  //发送消息
                				 var gid=$("#groupId").val();
                      			notifyServer({"ips":"","msg":"cmd=mcugroup_change&id="+gid+"&act=2","type":"DB"});
                			  }else{
                				  //不需要发送消息
                				 alert("Modify Success But Do Not Need To Send Message!");
                				 window.returnValue = "success";  //返回值
                      		     window.close();
                			     }
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
                 		  url:"<%=path%>/saveMcuServer",
                 		  data:$("#mcuForm").serialize(),
                 		  success:function(){
                 		  alert("Add Success");
                 		 window.returnValue = "success";  //返回值
                 		  window.close();
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
