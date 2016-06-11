<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8" isELIgnored="false" %>
<!DOCTYPE html>
<html>
<head>
  <title>App Config</title>
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
        App Configuration
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
					                          <label class="col-sm-1 control-label" >App Id</label>
					                          <div class="col-sm-3">
					                             <input class="form-control" id="appid" name="appid" type="text" />
					                          </div>
					                          <label class="col-sm-1 control-label" >Company Id</label>
					                          <div class="col-sm-3">
					                             <input class="form-control" name="companyId" type="text"/>
					                          </div>
					                          <label class="col-sm-1 control-label" >Begin Uid</label>
					                          <div class="col-sm-3">
					                             <input class="form-control" name="beginUid" type="text"/>
					                          </div>
					                       </div>
					                       <div class="form-group">
					                          <label class="col-sm-1 control-label" >End Uid</label>
					                          <div class="col-sm-3">
					                             <input class="form-control"  name="endUid" type="text" />
					                          </div>
					                          <label class="col-sm-1 control-label" >Current Uid</label>
					                          <div class="col-sm-3">
					                             <input class="form-control"  name="curUid" type="text"/>
					                          </div>
					                          <label class="col-sm-1 control-label" >Description</label>
					                          <div class="col-sm-3">
					                             <input class="form-control"  name="description" type="text"/>
					                          </div>
					                       </div>
					                       <div class="form-group">
					                          <label class="col-sm-1 control-label" >Contacts</label>
					                          <div class="col-sm-3">
					                             <input class="form-control"  name="contacts" type="text" />
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
              <h3 class="box-title">App Table</h3>
            </div>
            <!-- /.box-header -->
            <div class="box-body">
              <table id="appTable" class="table table-bordered table-hover">
                <thead>
                   <tr>
                     <th>App Id</th>
                     <th>Company Id</th>
                     <th>Begin Uid</th>
                     <th>End Uid</th>
                     <th>Current Uid</th>
                     <th>Contacts</th>
                     <th>Description</th>
                   </tr>
                 </thead>
                <tbody>
                                           
                </tbody>
                <tfoot>
                
                </tfoot>
              </table>
		         <button type="button" onclick="addApp()"  id="addButton" class="btn btn-primary">Add</button>
			     <button type="button" onclick="modifyApp()" id="modifyButton" class="btn btn-primary">Modify</button>
				 <button type="button" onclick="deleteApp()" id="deleteButton" class="btn btn-primary">Delete</button>
			     <button type="button" onclick="selectApp()" id="selectButton" class="btn btn-primary">Select</button>
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
            	//初始化表格
            	    appTable=$('#appTable').dataTable( {
					select:true,
					searching:false,
					paging: true,
					ajax: {
						"url": "<%=path%>/appSearch",
					    "type": "POST",
					    "dataSrc": "",
					    "data":condition2Json
					    
					},
					"columns": [
								{ "data": "appid" },
								{ "data": "companyId" },
				                { "data": "beginUid" },
				                { "data": "endUid" },
				                { "data": "curUid" },
				                { "data": "contacts" },
				                { "data": "description" }
				                
				            ],
				} );
            	    //表格选择
            	    var table = $('#appTable').DataTable();
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

            });
            //选择mcuServer
            function selectApp(){
              var id="";
              var rows=$("#appTable .selected");
           	  for(var a=0;a<rows.length;a++){
           		  if(id!=""){
           			id=id+","+rows[a].cells[0].firstChild.nodeValue; 
           		  }else{
           			  id=rows[a].cells[0].firstChild.nodeValue;
           		  }
           		 
           	  }
             window.returnValue = id;  //返回值
   		     window.close();
            }
            
            //查询
           function serachMcu(){
            	var table=$('#appTable').DataTable(); 
            	table.ajax.reload();
            } 
            //新增
           function addApp(){
            	var beginUid=100000;
            	//查询最大的beginUid
            	 $.ajax(
              		{ type:"POST",
              		  url:"<%=path%>/maxEndUid",
              		  data:"",
              		  success:function(data){
		              			var maxEndUid=Number(data)
		      			        if(maxEndUid){
		      			        	beginUid+=maxEndUid;
		      			        }else{
		      			        	alert("Get Begin Uid Error!");
		      			        }
		              			var object=new Object();
		                        object.beginUid=beginUid;
		                 	    var returnVal=window.showModalDialog("<%=path%>/appAdd",object,"dialogWidth=1000px;dialogHeight=600px");
		                 	    if(returnVal="success"){
		                 		   //刷新表格
		                 		   var table=$('#appTable').DataTable(); 
		                      	   table.ajax.reload();
		                 	   }
              			  },
              		  error:function(msg){
              			  alert("Get  Begin Uid Error!"+msg);
              			  return;
              		  	}
              		 }
              		  
              		  
              	  );
               

           }
           //修改
           function modifyApp(){
        	   if(curSelectIndex<0){
        		   alert("Please Select A Row !");
        		   return;
        	   }
        	   var object=new Object();
        	   object.action="MODIFY";
        	   var table = $('#appTable').DataTable();
        	   var Tnode=table.row(curSelectIndex).node();
        	   var cells=Tnode.cells;
        	   var columns= [
							"appid" ,
							 "companyId" ,
			                 "contacts",
			                "description" ,
			                 "beginUid" ,
			                 "endUid" ,
			                 "curUid"
			                
			            ];
 			   for(var i=0;i<cells.length;i++){
 				  object[columns[i]]=cells[i].innerText;
 			      
 			  }
        	   var returnVal=window.showModalDialog("<%=path%>/appAdd",object,"dialogWidth=1000px;dialogHeight=600px");
        	   if(returnVal="success"){
        		   //刷新表格
        		   var table=$('#appTable').DataTable(); 
             	  table.ajax.reload();
        	   }
           }
           //删除
           function deleteApp(){
        	   if(curSelectIndex<0){
        		   alert("Please Select A Row !");
        		   return;
        	   }
        	   if(!confirm("Are You Sure To Delete ?")){
         		  return;
         	  }
        	   
        	 //获取table对象
         	  var table = $('#appTable').DataTable();
         	  var Tnode=table.row(curSelectIndex).node();
         	  var id= Tnode.cells[0].firstChild.nodeValue;
         	 $.ajax(
              		{ type:"POST",
              		  url:"<%=path%>/deleteApp",
              		  data:"appId="+id,
              		  success:function(){
              		  alert("Delete Success");
              		  var table=$('#appTable').DataTable(); 
                	  table.ajax.reload();
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
