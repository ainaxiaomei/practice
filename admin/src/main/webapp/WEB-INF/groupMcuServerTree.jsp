<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8" isELIgnored="false" %>
<!DOCTYPE html>
<html>
<head>
  <title>GroupMcuServer  Config</title>
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
          <h3 class="box-title">GroupMcuServerTree</h3>

          <div class="box-tools pull-right">
            <button type="button" class="btn btn-box-tool" data-widget="collapse"><i class="fa fa-minus"></i></button>
            <button type="button" class="btn btn-box-tool" data-widget="remove"><i class="fa fa-remove"></i></button>
          </div>
        </div>
        <!-- /.box-header -->
		<div class="box-body" id="mcuTree">
		</div>
					<!-- /.box-body -->
        <div class="box-footer">
        </div>
      </div>
      <!-- /.box -->
      
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
<!-- dialog -->
<div class="modal fade " id="model" tabindex="-1"  aria-labelledby="myModalLabel" aria-hidden="true">
	<div class="modal-dialog" style="width:1200px;height:850px">
	      <div class="modal-content" style="width:1200px;height:850px">
	         <div class="modal-header">
	            <button type="button" class="close" 
	               data-dismiss="modal" aria-hidden="true">
	                  &times;
	            </button>
	         </div>
	         <div class="modal-body" id="modalBody" style="width:1200px;height:800px;padding:0px" >
	           <iframe id="modelFrame"  width="100%" height="100%" frameborder="no" border="0" marginwidth="0" marginheight="0" scrolling="true" allowtransparency="yes"></iframe>
	         </div>
	      </div>
     </div>
</div>
<!-- page script -->
 <script type="text/javascript">
   $(function () { 
	  $("#tables #mcuConfig").attr("class","active");
   	  $("#tables #groupMcuServers").attr("class","active");
      $('#mcuTree').jstree({
    	  "core" : {
    		"check_callback" : true,
    		"data" : {
  				"url" : "<%=path%>/GroupMcuServerTree",
  			}
  		},
  		"contextmenu":{
  			items : function (o, cb) { // Could be an object directly
  				return {
  					"create" : {
  						"separator_before"	: false,
  						"separator_after"	: true,
  						"_disabled"			: false, //(this.check("create_node", data.reference, {}, "last")),
  						"label"				: "Create",
  						"action"			: function (data) {
  							var inst = $.jstree.reference(data.reference),
  								obj = inst.get_node(data.reference);
  						     //获取当前组id
  						     var id=obj.id;
  							//获取当前层级
  							 var level=obj.li_attr.level;
  							//获取当前的serverId作为子层级的leftParent
  							 var group=obj.li_attr.group;
  							//关闭菜单
  							$.vakata.context.hide();
  						    //打开新增的页面
  						    var object=new Object();
  						    object.serverId=id;
  						    object.level=level;
  						    object.group=group;
  						    var json="{\"serverId\":"+id+",\"level\":"+level+",\"group\":"+group+"}";
  						    var param=encodeURI(json);
  							//var returnVal=window.showModalDialog("<%=path%>/groupMcuServerAdd",object,"dialogWidth=1000px;dialogHeight=600px");
  			        	    var iframe=$("#modelFrame");
  			        	    iframe.attr("src","<%=path%>/groupMcuServerAdd?param="+param);
      						$('#model').modal({backdrop: 'static', keyboard: false});
  							if(returnVal=="success"){
  			        		   //创建成功
  			        		// inst.create_node(obj, {}, "last", function (new_node) {
   							//	setTimeout(function () { inst.edit(new_node); },0);
   							// });
  			        		inst.refresh(); 
  			        	   }
  							
  						}
  					},//end create
  					"remove" : {
  						"separator_before"	: false,
  						"icon"				: false,
  						"separator_after"	: false,
  						"_disabled"			: false, //(this.check("delete_node", data.reference, this.get_parent(data.reference), "")),
  						"label"				: "Delete",
  						"action"			: function (data) {
  							var inst = $.jstree.reference(data.reference),
  								obj = inst.get_node(data.reference);
  							deleteGroupMcuServer(obj);
  							/*
  							if(inst.is_selected(obj)) {
  								inst.delete_node(inst.get_selected());
  							}
  							else {
  								inst.delete_node(obj);
  							}*/
  						}
  					}//end remove
  			    }
  			}
  		},
  		 "plugins" : [ "contextmenu" ]
      
      }); 
     
        	});
   function sendHttpMsg(dataArray,msg){
   	var progressbar = $( "#progressbar" ).progressbar({
   		 max: dataArray.length
   	    });
   	$( "#dialog" ).dialog({
   		close: function( event, ui ) {
           	  //清空消息
           	  $("#pragessMsg").text("");
           	  //清空进度条
           	  $( "#progressbar" ).progressbar( "value", 0 );
           	  //刷新
           	$.jstree.reference($('#mcuTree')).refresh();
           	 
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
   //删除
   function deleteGroupMcuServer(object){
	   if(!confirm("Are You Sure To Delete ?")){
 		  return;
 	  }
	 //获取groupServerId
	 var serverId=object.id;
	 //获取groupId
	 var group=object.li_attr.group;
	 var id=object.id;
		//获取当前层级
     var level=object.li_attr.level;
	 //root不能删除
	 if(group==-1||id=="root"||level==-1){
		 alert("Root Can Not Delete!");
		 return;
	 }
	//关闭菜单
		$.vakata.context.hide();
 	 $.ajax(
      		{ type:"POST",
      		  url:"<%=path%>/groupMcuServerDelete",
      		  data:"Id="+serverId,
      		  success:function(data){
      			  var dataArray=$.parseJSON(data); 
               	  sendHttpMsg(dataArray,"cmd=mcugroup_change&id="+group+"&act=0");
      		 
      			  },
      		  error:function(msg){
      			  alert("error!"+msg);
      		  	}
      		 }
      		  
      		  
      	  );
   }
  </script>
</body>
</html>
