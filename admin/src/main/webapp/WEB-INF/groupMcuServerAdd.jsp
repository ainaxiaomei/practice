<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8" isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>
<!DOCTYPE html>
<html>
    <head>
        <title>Group MCU Server Config</title>
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
                                <h1>Group MCU Server</h1>
                            </div>
                        </div>
                    </div>

                    <div class="row">
                        <div class="col-lg-12">
                            <div class="panel panel-default bootstrap-admin-no-table-panel">
                                <div class="panel-heading">
                                    <div class="text-muted bootstrap-admin-box-title">Group MCU Server Information</div>
                                </div>
                                <div class="bootstrap-admin-no-table-panel-content bootstrap-admin-panel-content collapse in">
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
	        	var returnVal=window.showModalDialog("<%=path%>/mcuServer",object,"dialogWidth=1000px;dialogHeight=900px");
	        	//将返回值填到表单
	        	$("#serverId").val(returnVal);
	        }
	       function selectGroupId(e){
	        	//传参
	        	var object=new Object();
	        	object.action="SELECT";
	        	var returnVal=window.showModalDialog("<%=path%>/groupMcu",object,"dialogWidth=1000px;dialogHeight=900px");
	        	//将返回值填到表单
	        	$("#groupId").val(returnVal);
	        }
	       function selectParent(e){
	        	//传参
	        	var object=new Object();
	        	object.action="SELECT";
	        	var returnVal=window.showModalDialog("<%=path%>/mcuServer",object,"dialogWidth=1000px;dialogHeight=900px");
	        	//将返回值填到表单
	        	$("#parentId").val(returnVal);
	        }
	       function selectLeftParent(e){
	        	//传参
	        	var object=new Object();
	        	object.action="SELECT";
	        	var returnVal=window.showModalDialog("<%=path%>/mcuServer",object,"dialogWidth=1000px;dialogHeight=900px");
	        	//将返回值填到表单
	        	$("#leftParentId").val(returnVal);
	        }
	       function selectRightParent(e){
	        	//传参
	        	var object=new Object();
	        	object.action="SELECT";
	        	var returnVal=window.showModalDialog("<%=path%>/mcuServer",object,"dialogWidth=1000px;dialogHeight=900px");
	        	//将返回值填到表单
	        	$("#rightParentId").val(returnVal);
	        }
	       function modifyGroupMcuServer(){
	        	$.ajax(
                 		{ type:"POST",
                 		  url:"<%=path%>/groupMcuServerModify",
                 		  data:$("#groupMcuServer").serialize(),
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
           function saveMcuGroupServer(){
        	   $.ajax(
                 		{ type:"POST",
                 		  url:"<%=path%>/saveGroupMcuServer",
                 		  data:$("#groupMcuServer").serialize(),
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
        </script>
    </body>
</html>
