<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8" isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
    <head>
        <%String path=getServletContext().getContextPath();%>
        <title>Tables | Bootstrap 3.x Admin Theme</title>
        <jsp:include page="common/commonHead.jsp"></jsp:include>
       <script type="text/javascript" charset="utf8" src="<%=path%>/vendors/datatables/extensions/Select/js/dataTables.select.min.js"></script>
        <style type="text/css">
		input
		{
		  border-top:0px ;
		  border-left:0px ;
		  border-right:0px ;
		  border-bottom:0px ;
		  
		}
       </style> 
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
                                <h1>Application Config</h1>
                            </div>
                        </div>
                    </div>

                   
                    
                    <div class="row">
                        <div class="col-lg-12">
                            <div class="panel panel-default">
                                <div class="panel-heading">
                                    <div class="text-muted bootstrap-admin-box-title">Applications</div>
                                </div>
                                <div class="bootstrap-admin-panel-content" style="width:auto">
                                    <table class="table  table-bordered" id="example">
                                        <thead><a href="javascript:addAppRow()">add</a>
                                            <tr>
                                                <th>App Id</th>
                                                <th>Company Id</th>
                                                <th>Company Name</th>
                                                <th>Company Contacts</th>
                                                <th>Cur Uid</th>
                                                <th>Begin Uid</th>
                                                <th>End Uid</th>
                                                <th>App Contacts</th>
                                                <th>Description</th>
                                                <th>Action</th>
                                                
                                            </tr>
                                        </thead>
                                        <tbody>
                                           <c:forEach var="app"  items="${requestScope.apps}">
                                                <tr class="odd gradeX">
	                                                <td onclick="appDetail()" style="cursor:pointer"><input type="text" name="appid" style="width:100px;cursor:pointer" value=${app.appid} readonly="true" /></td>
	                                                <td><input type="text" name="company.companyId" style="width:100px" readonly="true" value=${app.company.companyId}></td>
	                                                <td><input type="text" name="company.companyName" style="width:100px" value=${app.company.companyName}></td>
	                                                <td><input type="text" name="company.contacts" style="width:100px" value=${app.company.contacts}></td>
	                                                <td><input type="text" name="curUid" style="width:100px" value=${app.curUid}></td>
	                                                <td><input type="text" name="beginUid" style="width:100px" value=${app.beginUid}></td>
	                                                <td><input type="text" name="endUid" style="width:100px" value=${app.endUid}></td>
	                                                <td><input type="text" name="contacts" style="width:100px" value=${app.contacts}></td>
	                                                <td><input type="text" name="description" style="width:100px" value=${app.description}></td>
	                                                <c:choose>
													   <c:when test="${requestScope.action=='SELECT'}">  
													    <td><a href="javascript:selectApp()">select</a></td>
													   </c:when>
													   <c:otherwise> 
													    <td><a href="javascript:saveApp()">save</a>&nbsp<a href="javascript:deleteApp()">delete</a></td>
													   </c:otherwise>
													</c:choose>
                                            	</tr>
										   </c:forEach>
                                        </tbody>
                                    </table>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <script>
          //当前选中的行号
          var curSelectIndex=-1;
          $(document).ready(
            //监听表格选中事件
            function(){
            	//获取table对象
          	    var table = $('#example').DataTable();
            	table.on( 'select', function ( e, dt, type, indexes ) {
            	    if ( type === 'row' ) {
            	    	curSelectIndex=indexes;
            	    }
            	} );
            	//根据类型处理页面
            	var param=window.dialogArguments;
	        	if(param&&param.action=="SELECT"){
	        		$("input").attr("readonly",true);
	        	}
            }
            
         );
          function selectApp(){
        	//获取appId
           	  var table = $('#example').DataTable();
           	  var Tnode=table.row(curSelectIndex).node();
           	  var id= Tnode.cells[0].firstChild.value;
        	  //返回appId
              window.returnValue = id;  //返回值
    		  window.close();
          }
          function appDetail(){
        	  window.location.href="<%=path%>/appDetail";
          }
          function addApp(){
        	  if(!confirm("Are You Sure To Save ?")){
        		  return;
        	  }
        	//获取table对象
        	  var table = $('#example').DataTable();
        	  var Trnode=table.row(curSelectIndex).node();
        	  var datas=row2json(Trnode);
        	 // var datas={"appid":123,"scompany[0].companyId":123,"company[0].companyName":123};
        	  sendData(datas,"<%=path%>/saveApp");
          }
          function deleteAppRow(){
        	//获取table对象
        	  var table = $('#example').DataTable();
        	  var row=table.row(curSelectIndex);
        	  row.remove().draw();
          }
          function saveApp(){
        	  if(!confirm("Are You Sure To Modify ?")){
        		  return;
        	  }
        	  //获取table对象
        	  var table = $('#example').DataTable();
        	  var Trnode=table.row(curSelectIndex).node();
        	  var datas=row2json(Trnode);
        	 // var datas={"appid":123,"scompany[0].companyId":123,"company[0].companyName":123};
        	  sendData(datas,"<%=path%>/modifyApp");
          }
          function addAppRow(){
        	//获取table对象
        	  var table = $('#example').DataTable();
        	  table.row.add(
        			  ['<input type="text" name="appid" style="width:100px"  >',
        		       '<input type="text" name="company.companyId"  style="width:100px" >',
        		       '<input type="text" name="company.companyName" style="width:100px" value=${app.company.companyName}>',
        		       '<input type="text" name="company.contacts" style="width:100px" value=${company.contacts}>',
        		       '<input type="text" name="curUid" readonly="true" style="width:100px" value=${app.curUid} >',
        		       '<input type="text" name="beginUid" style="width:100px" value=${app.beginUid}>',
        		       '<input type="text" name="endUid" style="width:100px" value=${app.endUid}>',
        		       '<input type="text" name="contacts" style="width:100px" value=${app.contacts}>',
        		       '<input type="text" name="description" style="width:100px" value=${app.description}>',
        		       '<a href="javascript:addApp()">save</a>&nbsp<a href="javascript:deleteAppRow()">delete</a>']).draw();
          }
          function deleteApp(){
        	  if(!confirm("Are You Sure To Delete ?")){
        		  return;
        	  }
        	  //获取table对象
        	  var table = $('#example').DataTable();
        	  var row=table.row(curSelectIndex);
        	  var Trnode =row.node();
        	  var datas=row2json(Trnode);
        	  $.ajax(
              		{ type:"POST",
              		  url:"<%=path%>/deleteApp",
              		  data:datas,
              		  success:function(){
              		  row.remove().draw();
              			  alert("success!");
              			 location.reload();sss
              			  },
              		  error:function(msg){
              			  alert("error!"+msg);
              		  	}
              		 }
              		  
              		  
              	  );
          }
          function row2json(Trnode){
        	  var data=new Object();
			  var cells=Trnode.cells;
			  for(var i=0;i<cells.length;i++){
				  data[cells[i].firstChild.name]=cells[i].firstChild.value
			      
			  }
			  return data;
          }
          	 
          
          function sendData(datas,url){
        	  $.ajax(
        		{ type:"POST",
        		  url:url,
        		  data:datas,
        		  success:function(){
        			  alert("success!");
        			  location.reload();
        			  },
        		  error:function(msg){
        			  alert("error!"+msg);
        		  	}
        		 }
        		  
        		  
        	  );
        	      
          }
        </script>
       <jsp:include page="common/commonFooter.jsp"></jsp:include>
    </body>
</html>