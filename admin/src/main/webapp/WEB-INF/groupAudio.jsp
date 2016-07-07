<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8" isELIgnored="false" %>
<!DOCTYPE html>
<html>
<head>
  <title>GroupAudio  Config</title>
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
        GroupAudio  Configuration
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
					                          <label class="col-sm-1 control-label" >Group Id</label>
					                          <div class="col-sm-3">
					                             <input class="form-control" name="groupId" type="text" />
					                          </div>
					                          <label class="col-sm-1 control-label" >Cur UserNum</label>
					                          <div class="col-sm-3">
					                             <input class="form-control" name="curUsernum" type="text"/>
					                          </div>
					                          <label class="col-sm-1 control-label" >Max UserNum</label>
					                          <div class="col-sm-3">
					                             <input class="form-control" name="maxUsernum" type="text"/>
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
              <h3 class="box-title">GroupAudio Table</h3>
            </div>
            <!-- /.box-header -->
            <div class="box-body">
              <table id="groupAudioTable" class="table table-bordered table-hover">
                <thead>
                    <tr>
                        <th>Group Id</th>
                        <th>Cur UserNum</th>
                        <th>Max UserNum</th>
                    </tr>
                 </thead>
                <tbody>
                                           
                </tbody>
                <tfoot>
                
                </tfoot>
              </table>
		         <button type="button" onclick="addGroupAudio()"  id="addButton"  class="btn btn-primary">Add</button>
			     <button type="button" onclick="modifyGroupAudio()" id="modifyButton"  class="btn btn-primary">Modify</button>
			     <button type="button" onclick="deelteGroupAudio()" id="deleteButton" class="btn btn-primary">Delete</button>
			     <button type="button" onclick="selectGroupAudio()" id="selectButton" class="btn btn-primary">Select</button>
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
            /**
              	将查询条件转化为字符串发送到服务端
            **/
            function condition2Json(){
            	//获取查询条件
            	var data=$("#searchForm").serialize();
            	return data;
            }
            $(function() {
            	$("#tables #audioConfig").attr("class","active");
            	$("#tables #groupAudios").attr("class","active");
            	//初始化表格
            	    groupAudioTable=$('#groupAudioTable').dataTable( {
					select:true,
					searching:false,
					paging: true,
					ajax: {
						"url": "<%=path%>/groupAudioSearch",
					    "type": "POST",
					    "dataSrc": "",
					    "data":condition2Json
					    
					},
					"columns": [
								{ "data": "groupId" },
								{ "data": "curUsernum" },
				                { "data": "maxUsernum" }
				            ]
				} );
            	    var table = $('#groupAudioTable').DataTable();
                	table.on( 'select', function ( e, dt, type, indexes ) {
                	    if ( type === 'row' ) {
                	    	curSelectIndex=indexes;
                	    }
                	} );
                	//样式处理
                	var param=window.dialogArguments;
    	        	if(param&&param.action=="SELECT"){
    	        		//选择页面
    	        		$("#modifyButton").hide();
    	        		$("#deleteButton").hide();
    	        	}else{
    	        		$("#selectButton").hide();
    	        	}

            })
            //选择
            function selectGroupAudio(){
            	//获取serverId
             	  var table = $('#groupAudioTable').DataTable();
             	  var Tnode=table.row(curSelectIndex).node();
             	  var id= Tnode.cells[0].firstChild.nodeValue;
             	  //返回serverId
               window.returnValue = id;  //返回值
     		     window.close();
            }
            //查询
           function serachMcu(){
            	var table=$('#groupAudioTable').DataTable(); 
            	table.ajax.reload();
            } 
            //新增
           function addGroupAudio(){
        	   var returnVal=window.showModalDialog("<%=path%>/groupAudioAdd","","dialogWidth=1000px;dialogHeight=600px");
        	   if(returnVal="success"){
        		   //刷新表格
        		   var table=$('#groupAudioTable').DataTable(); 
             	  table.ajax.reload();
        	   }

           }
           //修改
           function modifyGroupAudio(){
        	   if(curSelectIndex<0){
        		   alert("Please Select A Row !");
        		   return;
        	   }
        	   var object=new Object();
        	   object.action="MODIFY";
        	   var table = $('#groupAudioTable').DataTable();
        	   var Tnode=table.row(curSelectIndex).node();
        	   var cells=Tnode.cells;
        	   var columns= [
	   							"groupId" ,
	   							 "curUsernum" ,
	   			                 "maxUsernum"
	   			            ];
 			   for(var i=0;i<cells.length;i++){
 				  object[columns[i]]=cells[i].innerText;
 			      
 			  }
        	   var returnVal=window.showModalDialog("<%=path%>/groupAudioAdd",object,"dialogWidth=1000px;dialogHeight=600px");
        	   if(returnVal="success"){
        		   //刷新表格
        		   var table=$('#groupAudioTable').DataTable(); 
             	  table.ajax.reload();
        	   }
           }
           function sendHttpMsg(dataArray,msg){
	        	var progressbar = $( "#progressbar" ).progressbar({
	        		 max: dataArray.length
	        	    });
	        	$( "#dialog" ).dialog({
	        		close: function( event, ui ) {
	        			 var table=$('#groupAudioTable').DataTable(); 
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
           //删除
           function deelteGroupAudio(){
        	   if(curSelectIndex<0){
        		   alert("Please Select A Row !");
        		   return;
        	   }
        	   if(!confirm("Are You Sure To Delete ?")){
         		  return;
         	  }
        	   
        	 //获取table对象
         	  var table = $('#groupAudioTable').DataTable();
         	  var Tnode=table.row(curSelectIndex).node();
         	  var id= Tnode.cells[0].firstChild.nodeValue;
         	 $.ajax(
              		{ type:"POST",
              		  url:"<%=path%>/groupAudioDelete",
              		  data:"groupId="+id,
              		  success:function(data){
              		 // alert("Delete Success");
              		  var table=$('#groupAudioTable').DataTable(); 
	                	  table.ajax.reload();
              		 // var dataArray=$.parseJSON(data); 
                    	  //sendHttpMsg(dataArray,"cmd=audiogroup_change&id="+$("#groupId").val()+"&act=0");
              		 
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
