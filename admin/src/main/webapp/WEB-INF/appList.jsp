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
                <div class="col-md-2 bootstrap-admin-col-left">
                    <ul class="nav navbar-collapse collapse bootstrap-admin-navbar-side">
                        <li>
                            <a href="about.html"><i class="glyphicon glyphicon-chevron-right"></i> About</a>
                        </li>
                        <li>
                            <a href="dashboard.html"><i class="glyphicon glyphicon-chevron-right"></i> Dashboard</a>
                        </li>
                        <li class="disabled">
                            <a href="#"><i class="glyphicon glyphicon-chevron-right"></i> Calendar</a><!-- calendar.html -->
                        </li>
                        <li class="disabled">
                            <a href="#"><i class="glyphicon glyphicon-chevron-right"></i> Statistics (Charts)</a><!-- stats.html -->
                        </li>
                        <li>
                            <a href="forms.html"><i class="glyphicon glyphicon-chevron-right"></i> Forms</a>
                        </li>
                        <li class="active">
                            <a href="tables.html"><i class="glyphicon glyphicon-chevron-right"></i> Tables</a>
                        </li>
                        <li>
                            <a href="buttons-and-icons.html"><i class="glyphicon glyphicon-chevron-right"></i> Buttons &amp; Icons</a>
                        </li>
                        <li>
                            <a href="wysiwyg-editors.html"><i class="glyphicon glyphicon-chevron-right"></i> WYSIWYG Editors</a>
                        </li>
                        <li>
                            <a href="ui-and-interface.html"><i class="glyphicon glyphicon-chevron-right"></i> UI &amp; Interface</a>
                        </li>
                        <li>
                            <a href="error-pages.html"><i class="glyphicon glyphicon-chevron-right"></i> Error pages</a>
                        </li>
                        <li>
                            <a href="forms.html"><i class="glyphicon glyphicon-chevron-down"></i> Submenu</a>
                            <ul class="nav navbar-collapse bootstrap-admin-navbar-side">
                                <li><a href="about.html"><i class="glyphicon glyphicon-chevron-right"></i> Submenu 1</a></li>
                                <li><a href="about.html"><i class="glyphicon glyphicon-chevron-right"></i> Submenu 2</a></li>
                                <li><a href="about.html"><i class="glyphicon glyphicon-chevron-right"></i> Submenu 3</a></li>
                            </ul>
                        </li>
                        <li>
                            <a href="#"><span class="badge pull-right">731</span> Orders</a>
                        </li>
                        <li>
                            <a href="#"><span class="badge pull-right">812</span> Invoices</a>
                        </li>
                        <li>
                            <a href="#"><span class="badge pull-right">27</span> Clients</a>
                        </li>
                        <li>
                            <a href="#"><span class="badge pull-right">1,234</span> Users</a>
                        </li>
                        <li>
                            <a href="#"><span class="badge pull-right">2,221</span> Messages</a>
                        </li>
                        <li>
                            <a href="#"><span class="badge pull-right">11</span> Reports</a>
                        </li>
                        <li>
                            <a href="#"><span class="badge pull-right">83</span> Errors</a>
                        </li>
                        <li>
                            <a href="#"><span class="badge pull-right">4,231</span> Logs</a>
                        </li>
                    </ul>
                </div>

                <!-- content -->
                <div class="col-md-10">
                    <div class="row">
                        <div class="col-lg-12">
                            <div class="page-header">
                                <h1>Tables</h1>
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
                                    <table class="table table-striped table-bordered" id="example">
                                        <thead>
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
	                                                <td><input type="text" name="appid" style="width:100px" value=${app.appid} readonly="true"></td>
	                                                <td><input type="text" name="company[0].companyId" style="width:100px" readonly="true" value=${app.company[0].companyId}></td>
	                                                <td><input type="text" name="company[0].companyName" style="width:100px" value=${app.company[0].companyName}></td>
	                                                <td><input type="text" name="company[0].contacts" style="width:100px" value=${app.company[0].contacts}></td>
	                                                <td><input type="text" name="curUid" style="width:100px" value=${app.curUid}></td>
	                                                <td><input type="text" name="beginUid" style="width:100px" value=${app.beginUid}></td>
	                                                <td><input type="text" name="endUid" style="width:100px" value=${app.endUid}></td>
	                                                <td><input type="text" name="contacts" style="width:100px" value=${app.contacts}></td>
	                                                <td><input type="text" name="description" style="width:100px" value=${app.description}></td>
	                                                <td><a href="javascript:saveApp()">save</a>&nbsp<a href="javascript:deleteApp()">delete</a></td>
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
            }
         );
          function saveApp(){
        	  if(!confirm("Are You Sure To Modify ?")){
        		  return;
        	  }
        	  //获取table对象
        	  var table = $('#example').DataTable();
        	  var Trnode=table.row(curSelectIndex).node();
        	  var datas=row2jason(Trnode);
        	 // var datas={"appid":123,"scompany[0].companyId":123,"company[0].companyName":123};
        	  sendData(datas,"<%=path%>/modifyApp");
          }
          function deleteApp(){
        	  if(!confirm("Are You Sure To Delete ?")){
        		  return;
        	  }
        	  //获取table对象
        	  var table = $('#example').DataTable();
        	  var Trnode=table.row(curSelectIndex).node();
        	  var datas=row2jason(Trnode);
        	  sendData(datas,"<%=path%>/deleteApp");
          }
          function row2jason(Trnode){
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