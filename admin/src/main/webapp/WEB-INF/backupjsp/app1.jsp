<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8" isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>
<!DOCTYPE html>
<html>
    <head>
        <title>App </title>
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
                                <h1>App</h1>
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
                                    <div class="text-muted bootstrap-admin-box-title">App</div>
                                </div>
                                <div class="bootstrap-admin-panel-content" style="width:auto">
                                    <table class="table  table-bordered" id="appTable">
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
                                    </table>
                                    <div >   
					                 </div>
					                     <button type="button" onclick="addApp()"  id="addButton" class="btn btn-primary">Add</button>
					                     <button type="button" onclick="modifyApp()" id="modifyButton" class="btn btn-primary">Modify</button>
					                     <button type="button" onclick="deleteApp()" id="deleteButton" class="btn btn-primary">Delete</button>
					                     <button type="button" onclick="selectApp()" id="selectButton" class="btn btn-primary">Select</button>
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
					"sDom": "<'row'<'col-md-6'l><'col-md-6'f>r>t<'row'<'col-md-6'i><'col-md-6'p>>",
					"sPaginationType": "bootstrap",
					"oLanguage": {
						"sLengthMenu": "_MENU_ records per page"
					}
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
