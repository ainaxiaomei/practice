<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8" isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>
<!DOCTYPE html>
<html>
    <head>
        <title>Membdb Server Config</title>
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
        <div class="container">
            <!-- left, vertical navbar & content -->
            <div class="row">
                <!-- left, vertical navbar -->


                <!-- content -->
                <div class="col-md-10">
                    <div class="row">
                        <div class="col-lg-12">
                            <div class="page-header">
                                <h1>Membdb Server</h1>
                            </div>
                        </div>
                    </div>

                    <div class="row">
                        <div class="col-lg-12">
                            <div class="panel panel-default bootstrap-admin-no-table-panel">
                                <div class="panel-heading">
                                    <div class="text-muted bootstrap-admin-box-title">Membdb Server Information</div>
                                </div>
                                <div class="bootstrap-admin-no-table-panel-content bootstrap-admin-panel-content collapse in">
                                    <form class="form-horizontal" role="form" id="indexDbForm">
					                    <fieldset>
					                       <div class="form-group">
					                          <label class="col-sm-1 control-label" >Server Id</label>
					                          <div class="col-sm-3">
					                             <input class="form-control" id="serverId" name="serverId" type="text" />
					                          </div>
					                          <label class="col-sm-1 control-label" >Appids</label>
					                          <div class="col-sm-3">
					                             <input class="form-control"  id="appids" name="appids" type="text" readonly="true"/><a href="#" onclick="selectAppids()">select</a>
					                          </div>
					                          <label class="col-sm-1 control-label" >Server Name</label>
					                          <div class="col-sm-3">
					                             <input class="form-control" id="serverName" name="serverName" type="text"/>
					                          </div>
					                       </div>
					                       <div class="form-group">
					                          <label class="col-sm-1 control-label" >SVC Url</label>
					                          <div class="col-sm-3">
					                             <input class="form-control"  id="svcUrl" name="svcUrl" type="text" />
					                          </div>
					                          <label class="col-sm-1 control-label" >Http Url</label>
					                          <div class="col-sm-3">
					                             <input class="form-control"  id="httpUrl" name="httpUrl" type="text"/>
					                          </div>
					                          <label class="col-sm-1 control-label" >Valid</label>
					                          <div class="col-sm-3">
					                             <select class="form-control" id="valid" name="valid"> 
											      <option value="0">false</option> 
											      <option value="1">true</option> 
											      </select>
					                          </div>
					                       </div>
					                       <div class="form-group">
					                          <label class="col-sm-1 control-label" >RoomMin</label>
					                          <div class="col-sm-3">
					                             <input class="form-control"  id="roomidMin" name="roomidMin" type="text" />
					                          </div>
					                          <label class="col-sm-1 control-label" >RoomMax</label>
					                          <div class="col-sm-3">
					                             <input class="form-control"  id="roomidMax" name="roomidMax" type="text"/>
					                          </div>
					                          <label class="col-sm-1 control-label" >Dsp Number</label>
					                          <div class="col-sm-3">
					                              <select class="form-control" id="dspnum" name="dspnum"> 
											      <option value="1">1</option> 
											      <option value="2">2</option> 
											      <option value="3">3</option> 
											      <option value="4">4</option> 
											      </select>
					                          </div>
					                       </div>
					                    </fieldset> 
					                    <div >   
					                     <button type="button" id="saveButton"  class="btn btn-primary">Save</button>
					                    </div>
					                </form>
                                </div>
                            </div>
                        </div>
                    </div>
                   

                </div>
            </div>
        </div>

       <jsp:include page="common/commonFooter.jsp"></jsp:include>

       

        <script type="text/javascript">
	        $(function() {
	        	var param=window.dialogArguments;
	        	if(param.action=="MODIFY"){
	        		//是修改界面
	        		$("#roomidMin").attr("readonly",true);
	        		$("#roomidMax").attr("readonly",true);
	        		//改变单击事件
	        		$("#saveButton").click(modifyIndexDb);
	        		//填充表单
	        		 var columns= [
	   							"serverId" ,
	   							 "serverName" ,
	   			                 "dspnum",
	   			                "svcUrl" ,
	   			                 "httpUrl" ,
	   			                 "appids" ,
	   			                 "roomidMin" ,
	   			                 "roomidMax" ,
	   			                 "valid" 
	   			                
	   			            ];
	        		for(var i=0;i<columns.length;i++){
	        			var a=$("#"+columns[i]);
	        			a.val(param[columns[i]]);
	        		}
	        	}else{
	        		//是新增页面
	        		//改变单击事件
	        		$("#saveButton").click(saveIndexDb);
	        	}
	        })
	       function modifyIndexDb(){
	        	$.ajax(
                 		{ type:"POST",
                 		  url:"<%=path%>/indexDbServerModify",
                 		  data:$("#indexDbForm").serialize(),
                 		  success:function(){
                 		  alert("Modify Success");
                 		  window.returnValue = "success";  //返回值
                 		  window.close();
                 			  },
                 		  error:function(msg){
                 			  alert("error!"+msg);
                 			 window.returnValue = "error";  //返回值
                 		  	}
                 		 }
                 		  
                 		  
                 	  );
	        }
           function saveIndexDb(){
        	   $.ajax(
                 		{ type:"POST",
                 		  url:"<%=path%>/saveIndexDbServer",
                 		  data:$("#indexDbForm").serialize(),
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
           function selectAppids(){
        	 //传参
	        	var object=new Object();
	        	object.action="SELECT";
	        	var returnVal=window.showModalDialog("<%=path%>/app",object,"dialogWidth=1200px;dialogHeight=800px");
	        	//将返回值填到表单
	        	$("#appids").val(returnVal);
	        
           }
        </script>
    </body>
</html>
