<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8" isELIgnored="false" %>
<!DOCTYPE html>
<html>
<head>
  <title>AppResource Server Config</title>
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
        AppResource Server Configuration
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
          <h3 class="box-title">Search Condtion</h3>

          <div class="box-tools pull-right">
            <button type="button" class="btn btn-box-tool" data-widget="collapse"><i class="fa fa-minus"></i></button>
            <button type="button" class="btn btn-box-tool" data-widget="remove"><i class="fa fa-remove"></i></button>
          </div>
        </div>
        <!-- /.box-header -->
					<div class="box-body">
						<form class="form-horizontal" role="form" id="searchForm">
							<fieldset>
					                       <div class="form-group">
					                          <label class="col-sm-1 control-label" >Id</label>
					                          <div class="col-sm-3">
					                             <input class="form-control" name="id" type="text" />
					                          </div>
					                          <label class="col-sm-1 control-label" >App Id</label>
					                          <div class="col-sm-3">
					                             <input class="form-control" name="appid" type="text"/>
					                          </div>
					                          <label class="col-sm-1 control-label" >Room Id</label>
					                          <div class="col-sm-3">
					                             <input class="form-control" name="roomid" type="text"/>
					                          </div>
					                       </div>
					                       <div class="form-group">
					                          <label class="col-sm-1 control-label" >Group Left Id</label>
					                          <div class="col-sm-3">
					                             <input class="form-control"  name="gpLeftId" type="text" />
					                          </div>
					                          <label class="col-sm-1 control-label" >Group Right Id</label>
					                          <div class="col-sm-3">
					                             <input class="form-control"  name="gpRightId" type="text"/>
					                          </div>
					                          <label class="col-sm-1 control-label" >Group Type</label>
					                          <div class="col-sm-3">
					                             <input class="form-control"  name="gpType" type="text"/>
					                          </div>
					                       </div>
					                       <div class="form-group">
					                          <label class="col-sm-1 control-label" >Description</label>
					                          <div class="col-sm-3">
					                             <input class="form-control"  name="description" type="text" />
					                          </div>
					                       </div>
					          </fieldset> 
							<div>
								<button type="button" onclick="serachMcu()"
									class="btn btn-primary">Search</button>
							</div>
						</form>
					</div>
					<!-- /.box-body -->
        <div class="box-footer">
        </div>
      </div>
      <!-- /.box -->
      <div class="row">
        <div class="col-xs-12">
          <div class="box">
            <div class="box-header">
              <h3 class="box-title">AppResource Table</h3>
            </div>
            <!-- /.box-header -->
            <div class="box-body">
              <table id="appRresource" class="table table-bordered table-hover">
                <thead>
                   <tr>
                     <th> Id</th>
                     <th>App Id</th>
                     <th>Room Id</th>
                     <th>Group Left Id</th>
                     <th>Group Right Id</th>
                     <th>Group Type</th>
                     <th>Description</th>
                    </tr>
                 </thead>
                <tbody>
                                           
                </tbody>
                <tfoot>
                
                </tfoot>
              </table>
		        <button type="button" onclick="addAppRes()" class="btn btn-primary">Add</button>
				<button type="button" onclick="modifyAppRes()" class="btn btn-primary">Modify</button>
			    <button type="button" onclick="deleteAppRes()" class="btn btn-primary">Delete</button>
            </div>
            <!-- /.box-body -->
          </div>
          <!-- /.box -->
 
		 
        </div>
        <!-- /.col -->
      </div>
      <!-- /.row -->
      
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
           var curSelectIndex=-1;
            var appRresource;
            /**
              	将查询条件转化为字符串发送到服务端
            **/
            function condition2Json(){
            	//获取查询条件
            	var data=$("#searchForm").serialize();
            	return data;
            }
            $(function() {
            	//设置sidebar
            	$("#tables #appResources").attr("class","active");
            	//初始化表格
            	    appRresource=$('#appRresource').dataTable( {
					select:true,
					searching:false,
					paging: true,
					ajax: {
						"url": "<%=path%>/appResourceSearch",
					    "type": "POST",
					    "dataSrc": "",
					    "data":condition2Json
					    
					},
					"columns": [
								{ "data": "id" },
								{ "data": "appid" },
				                { "data": "roomid" },
				                { "data": "gpLeftId" },
				                { "data": "gpRightId" },
				                { "data": "gpType" },
				                { "data": "description" }
				                
				            ]
				} );
            	  //表格选择
            	    var table = $('#appRresource').DataTable();
                	table.on( 'select', function ( e, dt, type, indexes ) {
                	    if ( type === 'row' ) {
                	    	curSelectIndex=indexes;
                	    }
                	} );

            })
           function serachMcu(){
            	var table=$('#appRresource').DataTable(); 
            	table.ajax.reload();
            }  
            function addAppRes(){
         	   var returnVal=window.showModalDialog("<%=path%>/appResAdd","","dialogWidth=1000px;dialogHeight=600px");
	         	  if(returnVal="success"){
	       		   //刷新表格
	       		   var table=$('#appRresource').DataTable(); 
	            	  table.ajax.reload();
	       	   }
            }
            function modifyAppRes(){
            	 if(curSelectIndex<0){
          		   alert("Please Select A Row !");
          		   return;
          	   }
          	   var object=new Object();
          	   object.action="MODIFY";
          	   var table = $('#appRresource').DataTable();
          	   var Tnode=table.row(curSelectIndex).node();
          	   var cells=Tnode.cells;
          	   var columns= [
  							"id" ,
  							 "appid" ,
  			                 "roomid",
  			                "gpLeftId" ,
  			                 "gpRightId" ,
  			                 "gpType" ,
  			                 "description"
  			                
  			            ];
   			   for(var i=0;i<cells.length;i++){
   				  object[columns[i]]=cells[i].innerText;
   			      
   			  }
          	   var returnVal=window.showModalDialog("<%=path%>/appResAdd",object,"dialogWidth=1000px;dialogHeight=600px");
          	   if(returnVal="success"){
          		   //刷新表格
          		   var table=$('#appRresource').DataTable(); 
               	  table.ajax.reload();
          	   }
            }
            function sendHttpMsg(dataArray,msg){
	        	var progressbar = $( "#progressbar" ).progressbar({
	        		 max: dataArray.length
	        	    });
	        	$( "#dialog" ).dialog({
	        		close: function( event, ui ) {
	        			 var table=$('#appRresource').DataTable(); 
	                 	  table.ajax.reload();
	                	  //清空消息
	                	  $("#pragessMsg").text("");
	                	  //清空进度条
	                	  $( "#progressbar" ).progressbar( "value", 0 );
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
            function deleteAppRes(){
            	if(curSelectIndex<0){
         		   alert("Please Select A Row !");
         		   return;
         	   }
         	   if(!confirm("Are You Sure To Delete ?")){
          		  return;
          	  }
         	   
         	 //获取table对象
          	  var table = $('#appRresource').DataTable();
          	  var Tnode=table.row(curSelectIndex).node();
          	  var id= Tnode.cells[0].firstChild.nodeValue;
          	 $.ajax(
               		{ type:"POST",
               		  url:"<%=path%>/appResDelete",
               		  data:"Id="+id,
               		  success:function(data){
               			var dataArray=$.parseJSON(data); 
                     	  sendHttpMsg(dataArray,"cmd=mcugroup_change&id="+$("#groupId").val()+"&act=0");
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
