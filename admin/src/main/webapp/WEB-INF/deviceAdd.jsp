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
 <div class="modal fade" id="waitModal" tabindex="-1" role="dialog" 
   aria-labelledby="myModalLabel" aria-hidden="true">
   <div class="modal-dialog">
      <div class="modal-content">
         <div class="modal-header">
            <button type="button" class="close" 
               data-dismiss="modal" aria-hidden="true">
                  &times;
            </button>
            <h4 class="modal-title" id="myModalLabel">
               Send Message To Server
            </h4>
         </div>
         <div class="modal-body">
            <img id="imgLoading"src="/admin/images/loader.gif" style="padding-left:45%"/>
            <div id="opSuccess" style="display:none">
                 Operation Success
            </div>  
            <div id="opError" style="display:none">
                 Not All Server Received The Message...
            </div>  
         </div>
         <div class="modal-footer">
            <button type="button" class="btn btn-default" 
               data-dismiss="modal">关闭
            </button>
            <button type="button" style="display:none" class="btn btn-primary" 
               data-dismiss="modal" onclick="showSideControl()" id="detail">详情
            </button>
         </div>
      </div><!-- /.modal-content -->
</div><!-- /.modal -->
<!-- page script -->
           <script type="text/javascript">
	        $(function() {
	        	var param=window.dialogArguments;
	        	if(param.action=="MODIFY"){
	        		$("#devtype").attr("readonly",true);
	        		//是修改界面
	        		//改变单击事件
	        		$("#saveButton").click(modifyMcu);
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
	        function sendHttpMsg(dataArray){
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
	        		process(a,dataArray);
	        	},80);
        		
	        	
	        }
	        function process(a,dataArray){
        		var httpurl="http://"+dataArray[a].httpUrl;
        		$.ajax(
                 		{ type:"POST",
                 		  url:httpurl,
                 		  data:"cmd=deviceparams_change",
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
        				process(++a,dataArray)
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
                 		  url:"<%=path%>/deviceModify",
                 		  data:$("#deviceForm").serialize(),
                 		  success:function(data){
                 			 //var dataArray=$.parseJSON( data ); 
                 			 //sendHttpMsg(dataArray);
                 			 
                 			 $("#waitModal").modal({
                 			      keyboard: true,
                 			     backdrop:"static"
                 			   });
                 			 notifyServer({"ips":"","msg":"cmd=deviceparams_change","type":"GATE"});
                 			  },
                 		  error:function(msg){
                 			  alert("error!"+msg);
                 			 window.returnValue = "error";  //返回值
                 		  	}
                 		 }
                 		  
                 		  
                 	  );
	        }
	       function notifyServer(msg){
	    	   $.ajax(
                		{ type:"POST",
                		  url:"<%=path%>/sendMessage",
                		  data:msg,
                		  //contentType:"application/json",
                		  success:function(data){
                			  var dataArray=$.parseJSON(data);
                			  if(!dataArray.length||dataArray.lehgth<=0){
                				  //没有发送失败
                				  $("#imgLoading").hide();
                				  $("#opSuccess").show();
                			  }else{
                				  //设置失败url列表
                				  $.each(dataArray,function (id,value){
                					  $("#failUrls").append(
                     					     '<li><a href="javascript:resend(\"'+value+'\")"><i class="menu-icon fa fa-user bg-yellow"></i>'
     										 +'<div class="menu-info"><h4 class="control-sidebar-subheading">'
                     			              + value
                     			              +'</div></a></li>'); 
                				  })
                				  $("#imgLoading").hide();
                				  $("#opError").show();
                				  $("#detail").show();
                				  
                				  
                				  
                			  }
                			  //alert(data);
                			  /*
                			 setTimeout(function(){
                				 $('#waitModal').modal('hide');
                  			},1000);*/
                			  },
                		  error:function(data){
                			  /*
                			  setTimeout(function(){
                 				 $('#waitModal').modal('hide');
                   			},1000);*/
                   			  $("#imgLoading").hide();
          				      $("#opError").show();
          				      $("#detail").show();
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
