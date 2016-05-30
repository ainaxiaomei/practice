<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8" isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>
<!DOCTYPE html>
<html>
    <head>
        <title>App Resource Server Config</title>
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
                                <h1>App Resource Server</h1>
                            </div>
                        </div>
                    </div>

                    <div class="row">
                        <div class="col-lg-12">
                            <div class="panel panel-default bootstrap-admin-no-table-panel">
                                <div class="panel-heading">
                                    <div class="text-muted bootstrap-admin-box-title">App Resource Server Information</div>
                                </div>
                                <div class="bootstrap-admin-no-table-panel-content bootstrap-admin-panel-content collapse in">
                                    <form class="form-horizontal" role="form" id="appResForm">
					                    <fieldset>
					                       <div class="form-group">
					                          <input class="form-control" id="id" name="id" type="text"  style="display:none"/>
					                          <label class="col-sm-1 control-label" >App Id</label>
					                          <div class="col-sm-3">
					                             <input class="form-control" id="appid" name="appid" type="text" readonly="true"/><a href="#" onclick="selectAppId()">select</a>
					                          </div>
					                          <label class="col-sm-1 control-label" >Room Id</label>
					                          <div class="col-sm-3">
					                             <input class="form-control" id="roomid" name="roomid" value="0" type="text"/>
					                          </div>
					                          <label class="col-sm-1 control-label" >Group Type</label>
					                          <div class="col-sm-3"   >
					                              <select class="form-control" id="gpType" name="gpType"> 
											      <option value="0">Mcu Group</option> 
											      <option value="1">Audio Group</option> 
											      </select>
					                          </div>
					                       </div>
					                       <div class="form-group">
					                          <label class="col-sm-1 control-label" >Group Left Id</label>
					                          <div class="col-sm-3">
					                             <input class="form-control"  id="gpLeftId" name="gpLeftId" type="text" readonly="true"/><a href="#" onclick="selectgpLeftId()">select</a>
					                          </div>
					                          <label class="col-sm-1 control-label" >Group Right Id</label>
					                          <div class="col-sm-3">
					                             <input class="form-control"  id="gpRightId" name="gpRightId" type="text" readonly="true" value="0"/><a id="rightGroupSelect" style="display:none" href="#" onclick="selectgpRightId()">select</a>
					                          </div>
					                           <label class="col-sm-1 control-label" >Description</label>
					                          <div class="col-sm-3">
					                             <input class="form-control"  id="description" name="description" type="text" />
					                          </div>
					                       </div>
					                    </fieldset> 
					                    <div >   
					                     <button id="saveButton" type="button"  class="btn btn-primary">Save</button>
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
	        	//增加下拉框事件
	        	$("#gpType").change(groupTypeChange);
	        	var param=window.dialogArguments;
	        	if(param.action=="MODIFY"){
	        		//是修改界面
	        		//改变单击事件
	        		$("#saveButton").click(modifyAppRes);
	        		//填充表单
	        		  var columns= [
  							"id" ,
  							 "appid" ,
  			                 "roomid",
  			                "gpLeftId" ,
  			                 "gpRightId" ,
  			                 "gpType" ,
  			                 "description"
  			                
  			            ];
	        		for(var i=0;i<columns.length;i++){
	        			var a=$("#"+columns[i]);
	        			a.val(param[columns[i]]);
	        		}
	        	}else{
	        		//是新增页面
	        		//改变单击事件
	        		$("#saveButton").click(saveAppRes);
	        	}
	        });
           var groupSelectUrl="<%=path%>/groupMcu";
           function groupTypeChange(){
        	  var selectValue=$(this).children('option:selected').val();
        	  if(selectValue==1){
        		  //audio group
        		  groupSelectUrl="<%=path%>/groupAudio";
        		  //audio 有rightgroup
        		  $("#rightGroupSelect").show();
        	  }else if(selectValue==0){
        		  //mcu group
        		  groupSelectUrl="<%=path%>/groupMcu";
        		  //mcu 没有rightgroup
        		  $("#rightGroupSelect").hide();
        	  }
           }
           function selectAppId(){
        	 //传参
	        	var object=new Object();
	        	object.action="SELECT";
	        	var returnVal=window.showModalDialog("<%=path%>/appList?action=SELECT",object,"dialogWidth=1500px;dialogHeight=600px");
	        	//将返回值填到表单
	        	$("#appid").val(returnVal);
           }
           function selectgpLeftId(){
        	 //传参
	        	var object=new Object();
	        	object.action="SELECT";
	        	var returnVal=window.showModalDialog(groupSelectUrl,object,"dialogWidth=1000px;dialogHeight=900px");
	        	//将返回值填到表单
	        	$("#gpLeftId").val(returnVal);
           }
           function selectgpRightId(){
        	 //传参
	        	var object=new Object();
	        	object.action="SELECT";
	        	var returnVal=window.showModalDialog(groupSelectUrl,object,"dialogWidth=1000px;dialogHeight=900px");
	        	//将返回值填到表单
	        	$("#gpLeftId").val(returnVal);
           }
           function saveAppRes(){
        	   $.ajax(
                 		{ type:"POST",
                 		  url:"<%=path%>/saveAppRes",
                 		  data:$("#appResForm").serialize(),
                 		  success:function(){
                 		  alert("Add Success");
                 		 window.returnValue = "success";  //返回值
                 		  window.close();
                 			  },
                 		  error:function(msg){
                 			  alert("error!"+msg);
                 			 window.returnValue = "error";  //返回值
                    		  window.close();
                 		  	}
                 		 }
                 		  
                 		  
                 	  );
           }
           function modifyAppRes(){
        	   $.ajax(
                		{ type:"POST",
                		  url:"<%=path%>/appResModify",
                		  data:$("#appResForm").serialize(),
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
        </script>
    </body>
</html>
