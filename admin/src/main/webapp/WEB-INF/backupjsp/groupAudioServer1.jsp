<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8" isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>
<!DOCTYPE html>
<html>
    <head>
        <title>Group Audio Server Config</title>
        <jsp:include page="common/commonHead.jsp"></jsp:include>
         <%String path=getServletContext().getContextPath();%>
    </head>
    <body class="bootstrap-admin-with-small-navbar">
        <!-- small navbar -->
        <nav class="navbar navbar-default navbar-fixed-top bootstrap-admin-navbar-sm" role="navigation">
            <div class="container">
                <div class="row">
                    <div class="col-lg-12">
                        <div class="collapse navbar-collapse">
                            <ul class="nav navbar-nav navbar-left bootstrap-admin-theme-change-size">
                                <li class="text">Change size:</li>
                                <li><a class="size-changer small">Small</a></li>
                                <li><a class="size-changer large active">Large</a></li>
                            </ul>
                            <ul class="nav navbar-nav navbar-right">
                                <li><a href="#">Link</a></li>
                                <li><a href="#">Link</a></li>
                                <li>
                                    <a href="#">Reminders <i class="glyphicon glyphicon-bell"></i></a>
                                </li>
                                <li>
                                    <a href="#">Settings <i class="glyphicon glyphicon-cog"></i></a>
                                </li>
                                <li>
                                    <a href="#">Go to frontend <i class="glyphicon glyphicon-share-alt"></i></a>
                                </li>
                                <li class="dropdown">
                                    <a href="#" role="button" class="dropdown-toggle" data-hover="dropdown"> <i class="glyphicon glyphicon-user"></i> Username <i class="caret"></i></a>
                                    <ul class="dropdown-menu">
                                        <li><a href="#">Action</a></li>
                                        <li><a href="#">Another action</a></li>
                                        <li><a href="#">Something else here</a></li>
                                        <li role="presentation" class="divider"></li>
                                        <li><a href="index.html">Logout</a></li>
                                    </ul>
                                </li>
                            </ul>
                        </div>
                    </div>
                </div>
            </div>
        </nav>

        <!-- main / large navbar -->
        <nav class="navbar navbar-default navbar-fixed-top bootstrap-admin-navbar bootstrap-admin-navbar-under-small" role="navigation">
            <div class="container">
                <div class="row">
                    <div class="col-lg-12">
                        <div class="navbar-header">
                            <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".main-navbar-collapse">
                                <span class="sr-only">Toggle navigation</span>
                                <span class="icon-bar"></span>
                                <span class="icon-bar"></span>
                                <span class="icon-bar"></span>
                            </button>
                            <a class="navbar-brand" href="about.html">Admin Panel</a>
                        </div>
                        <div class="collapse navbar-collapse main-navbar-collapse">
                            <ul class="nav navbar-nav">
                                <li class="active"><a href="#">Link</a></li>
                                <li><a href="#">Link</a></li>
                                <li class="dropdown">
                                    <a href="#" class="dropdown-toggle" data-hover="dropdown">Dropdown <b class="caret"></b></a>
                                    <ul class="dropdown-menu">
                                        <li role="presentation" class="dropdown-header">Dropdown header</li>
                                        <li><a href="#">Action</a></li>
                                        <li><a href="#">Another action</a></li>
                                        <li><a href="#">Something else here</a></li>
                                        <li role="presentation" class="divider"></li>
                                        <li role="presentation" class="dropdown-header">Dropdown header</li>
                                        <li><a href="#">Separated link</a></li>
                                        <li><a href="#">One more separated link</a></li>
                                    </ul>
                                </li>
                            </ul>
                        </div><!-- /.navbar-collapse -->
                    </div>
                </div>
            </div><!-- /.container -->
        </nav>

        <div class="container">
            <!-- left, vertical navbar & content -->
            <div class="row">
                <!-- left, vertical navbar -->
               <jsp:include page="common/commonNevagator.jsp"></jsp:include>                


                <!-- content -->
                <div class="col-md-10">
                    <div class="row">
                        <div class="col-lg-12">
                            <div class="page-header">
                                <h1>Group Audio Server</h1>
                            </div>
                        </div>
                    </div>

                    <div class="row">
                        <div class="col-lg-12">
                            <div class="panel panel-default bootstrap-admin-no-table-panel">
                                <div class="panel-heading">
                                    <div class="text-muted bootstrap-admin-box-title">Search Condition</div>
                                </div>
                                <div class="bootstrap-admin-no-table-panel-content bootstrap-admin-panel-content collapse in">
                                    <form class="form-horizontal" role="form" id="searchForm">
					                    <fieldset>
					                       <div class="form-group">
					                          <label class="col-sm-1 control-label" >Id</label>
					                          <div class="col-sm-3">
					                             <input class="form-control" name="id" type="text"/>
					                          </div>
					                          <label class="col-sm-1 control-label" >Server Id</label>
					                          <div class="col-sm-3">
					                             <input class="form-control" name="serverId" type="text" />
					                          </div>
					                          <label class="col-sm-1 control-label" >Group Id</label>
					                          <div class="col-sm-3">
					                             <input class="form-control" name="groupId" type="text"/>
					                          </div>
					                       </div>
					                       <div class="form-group">
					                         
					                          <label class="col-sm-1 control-label" >Left Parent Id</label>
					                          <div class="col-sm-3">
					                             <input class="form-control"  name="leftParentId" type="text"/>
					                          </div>
					                          <label class="col-sm-1 control-label" >Right Parent Id</label>
					                          <div class="col-sm-3">
					                             <input class="form-control"  name="rightParentId" type="text"/>
					                          </div>
					                          <label class="col-sm-1 control-label" >Level</label>
					                          <div class="col-sm-3">
					                             <input class="form-control"  name="level" type="text" />
					                          </div>
					                       </div>
					                      
					                    </fieldset> 
					                    <div >   
					                     <button type="button" onclick="serachMcu()" class="btn btn-primary">Search</button>
					                    </div>
					                </form>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-lg-12">
                            <div class="panel panel-default">
                                <div class="panel-heading">
                                    <div class="text-muted bootstrap-admin-box-title">Group Audio Server</div>
                                </div>
                                <div class="bootstrap-admin-panel-content" style="width:auto">
                                    <table class="table  table-bordered" id="groupMcuServerTable">
                                        <thead>
                                            <tr>
                                                <th>Id</th>
                                                <th>Server Id</th>
                                                <th>Group Id</th>
                                                
                                                <th>Left Parent Id</th>
                                                <th>Right Parent Id</th>
                                                <th>Level</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                           
                                        </tbody>
                                    </table>
                                    <div >   
					                 </div>
					                     <button type="button" id="" onclick="addGroupAudioServer()" class="btn btn-primary">Add</button>
					                     <button type="button" id="modifyButton" onclick="modifyGroupAudioServer()" class="btn btn-primary">Modify</button>
					                     <button type="button" id="deleteButton" onclick="deelteGroupAudioServer()" class="btn btn-primary">Delete</button>
					                     <button type="button" id="selectButton" onclick="selectGroupAudioServer()" class="btn btn-primary">Select</button>
                                    </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>

       <jsp:include page="common/commonFooter.jsp"></jsp:include>

       

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
            	    groupMcuServerTable=$('#groupMcuServerTable').dataTable( {
					select:true,
					searching:false,
					paging: true,
					ajax: {
						"url": "<%=path%>/groupAudioServerSearch",
					    "type": "POST",
					    "dataSrc": "",
					    "data":condition2Json
					    
					},
					"columns": [
								{ "data": "id" },
								{ "data": "serverId" },
								{ "data": "groupId" },
								
				                { "data": "leftParentId" },
				                { "data": "rightParentId" },
				                { "data": "level" }
				                
				            ],
					"sDom": "<'row'<'col-md-6'l><'col-md-6'f>r>t<'row'<'col-md-6'i><'col-md-6'p>>",
					"sPaginationType": "bootstrap",
					"oLanguage": {
						"sLengthMenu": "_MENU_ records per page"
					}
				} );
            	    var table = $('#groupMcuServerTable').DataTable();
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
            function selectGroupAudioServer(){
            	//获取serverId
           	  var table = $('#groupMcuTable').DataTable();
           	  var Tnode=table.row(curSelectIndex).node();
           	  var id= Tnode.cells[0].firstChild.nodeValue;
           	  //返回serverId
             window.returnValue = id;  //返回值
   		     window.close();
            }
            //查询
           function serachMcu(){
            	var table=$('#groupMcuServerTable').DataTable(); 
            	table.ajax.reload();
            } 
            //新增
           function addGroupAudioServer(){
        	   var returnVal=window.showModalDialog("<%=path%>/groupAudioServerAdd","","dialogWidth=1000px;dialogHeight=600px");
        	   if(returnVal="success"){
        		   //刷新表格
        		   var table=$('#groupMcuServerTable').DataTable(); 
             	  table.ajax.reload();
        	   }

           }
           //修改
           function modifyGroupAudioServer(){
        	   if(curSelectIndex<0){
        		   alert("Please Select A Row !");
        		   return;
        	   }
        	   var object=new Object();
        	   object.action="MODIFY";
        	   var table = $('#groupMcuServerTable').DataTable();
        	   var Tnode=table.row(curSelectIndex).node();
        	   var cells=Tnode.cells;
        	   var columns= [
							"id" ,
							 "serverId" ,
			                 "groupId",
			                
			                "leftParentId" ,
			                 "rightParentId" ,
			                 "level" 
			                
			            ];
 			   for(var i=0;i<cells.length;i++){
 				  object[columns[i]]=cells[i].innerText;
 			      
 			  }
        	   var returnVal=window.showModalDialog("<%=path%>/groupAudioServerAdd",object,"dialogWidth=1000px;dialogHeight=600px");
        	   if(returnVal="success"){
        		   //刷新表格
        		   var table=$('#groupMcuServerTable').DataTable(); 
             	  table.ajax.reload();
        	   }
           }
           //删除
           function deelteGroupAudioServer(){
        	   if(curSelectIndex<0){
        		   alert("Please Select A Row !");
        		   return;
        	   }
        	   if(!confirm("Are You Sure To Delete ?")){
         		  return;
         	  }
        	   
        	 //获取table对象
         	  var table = $('#groupMcuServerTable').DataTable();
         	  var Tnode=table.row(curSelectIndex).node();
         	  var id= Tnode.cells[0].firstChild.nodeValue;
         	 $.ajax(
              		{ type:"POST",
              		  url:"<%=path%>/groupAudioServerDelete",
              		  data:"Id="+id,
              		  success:function(){
              		  alert("Delete Success");
              		  var table=$('#groupMcuServerTable').DataTable(); 
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
