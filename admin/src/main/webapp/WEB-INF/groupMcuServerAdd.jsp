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
        GroupMcuServer  Configuration
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
          <h3 class="box-title">GroupMcuServer Information</h3>

          <div class="box-tools pull-right">
            <button type="button" class="btn btn-box-tool" data-widget="collapse"><i class="fa fa-minus"></i></button>
            <button type="button" class="btn btn-box-tool" data-widget="remove"><i class="fa fa-remove"></i></button>
          </div>
        </div>
        <!-- /.box-header -->
					<div class="box-body">
						 <form class="form-horizontal" role="form" id="groupMcuServer">
					                     <fieldset>
					                       <div class="form-group">
					                          <input class="form-control" id="id" name="id" type="text" style="display:none"/>
					                          <label class="col-sm-1 control-label" >Server Id</label>
					                          <div class="col-sm-3">
					                             <input class="form-control" id="serverId" name="serverId" type="text" readOnly="true"/><a href="#" onclick="selectServerId()">select</a>
					                          </div>
					                          <label class="col-sm-1 control-label" >Group Id</label>
					                          <div class="col-sm-3">
					                             <input class="form-control" id="groupId" name="groupId" type="text" readOnly="true"/><a href="#" onclick="selectGroupId()">select</a>
					                          </div>
					                          <label class="col-sm-1 control-label" >Level</label>
					                          <div class="col-sm-3">
					                             <input class="form-control"  id="level" name="level" type="text" />
					                          </div>
					                       </div>
					                       <div class="form-group">
					                          <label class="col-sm-1 control-label" >Left Parent Id</label>
					                          <div class="col-sm-3">
					                             <input class="form-control"  id="leftParentId" name="leftParentId" type="text" readOnly="true"/><a href="#" onclick="selectLeftParent()">select</a>
					                          </div>
					                          <label class="col-sm-1 control-label" >Right Parent Id</label>
					                          <div class="col-sm-3">
					                             <input class="form-control"  id="rightParentId" name="rightParentId" type="text" readOnly="true"/><a href="#" onclick="selectRightParent()">select</a>
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
	        		$("#saveButton").click(modifyGroupMcuServer);
	        		//填充表单
	        		 var columns= [
							"id" ,
							 "serverId" ,
			                 "groupId",
			                "leftParentId" ,
			                 "rightParentId" ,
			                 "level" 
			                
			            ];
	        		for(var i=0;i<columns.length;i++){
	        			var a=$("#"+columns[i]);
	        			a.val(param[columns[i]]);
	        		}
	        	}else{
	        		//是新增页面
	        		//改变单击事件
	        		$("#saveButton").click(saveMcuGroupServer);
	        	}
	        });
	        
	       function selectServerId(e){
	        	//传参
	        	var object=new Object();
	        	object.action="SELECT";
	        	var returnVal=window.showModalDialog("<%=path%>/mcuServer",object,"dialogWidth=1200px;dialogHeight=900px");
	        	//将返回值填到表单
	        	$("#serverId").val(returnVal);
	        }
	       function selectGroupId(e){
	        	//传参
	        	var object=new Object();
	        	object.action="SELECT";
	        	var returnVal=window.showModalDialog("<%=path%>/groupMcu",object,"dialogWidth=1200px;dialogHeight=900px");
	        	//将返回值填到表单
	        	$("#groupId").val(returnVal);
	        }
	       function selectParent(e){
	        	//传参
	        	var object=new Object();
	        	object.action="SELECT";
	        	var returnVal=window.showModalDialog("<%=path%>/mcuServer",object,"dialogWidth=1200px;dialogHeight=900px");
	        	//将返回值填到表单
	        	$("#parentId").val(returnVal);
	        }
	       function selectLeftParent(e){
	        	//传参
	        	var object=new Object();
	        	object.action="SELECT";
	        	var returnVal=window.showModalDialog("<%=path%>/mcuServer",object,"dialogWidth=1200px;dialogHeight=900px");
	        	//将返回值填到表单
	        	$("#leftParentId").val(returnVal);
	        }
	       function selectRightParent(e){
	        	//传参
	        	var object=new Object();
	        	object.action="SELECT";
	        	var returnVal=window.showModalDialog("<%=path%>/mcuServer",object,"dialogWidth=1200px;dialogHeight=900px");
	        	//将返回值填到表单
	        	$("#rightParentId").val(returnVal);
	        }
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
	       function modifyGroupMcuServer(){
	        	$.ajax(
                 		{ type:"POST",
                 		  url:"<%=path%>/groupMcuServerModify",
                 		  data:$("#groupMcuServer").serialize(),
                 		  success:function(data){
                 			 var dataArray=$.parseJSON(data); 
                   	      sendHttpMsg(dataArray,"cmd=mcugroup_change&id="+$("#groupId")+"&act=1");
                 			  },
                 		  error:function(msg){
                 			  alert("error!"+msg.responseText);
                 			 window.returnValue = "error";  //返回值
                 		  	}
                 		 }
                 		  
                 		  
                 	  );
	        }
           function saveMcuGroupServer(){
        	   $.ajax(
                 		{ type:"POST",
                 		  url:"<%=path%>/saveGroupMcuServer",
                 		  data:$("#groupMcuServer").serialize(),
                 		  success:function(data){
                 			 var dataArray=$.parseJSON(data); 
                   	      sendHttpMsg(dataArray,"cmd=mcugroup_change&id="+$("#groupId")+"&act=2");
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
