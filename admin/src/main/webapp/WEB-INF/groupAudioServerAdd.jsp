<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8" isELIgnored="false" %>
<!DOCTYPE html>
<html>
<head>
  <title>Dictionary Server Config</title>
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
        GroupAudioServer  Configuration
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
          <h3 class="box-title">GroupAudioServer Information</h3>

          <div class="box-tools pull-right">
            <button type="button" class="btn btn-box-tool" data-widget="collapse"><i class="fa fa-minus"></i></button>
            <button type="button" class="btn btn-box-tool" data-widget="remove"><i class="fa fa-remove"></i></button>
          </div>
        </div>
        <!-- /.box-header -->
					<div class="box-body">
						 <form class="form-horizontal" role="form" id="groupAudioServer">
					                     <fieldset>
					                       <div class="form-group">
					                          <input style="display:none" class="form-control" id="action" name="action" type="text" />
					                          <input class="form-control" id="id" name="id" type="text" style="display:none"/>
					                          <label class="col-sm-1 control-label" >Server Id</label>
					                          <div class="col-sm-3">
					                             <input class="form-control" id="serverId" name="serverId" type="text" readOnly="true" /><a href="#" id="serveridSelect" onclick="selectServerId()">select</a>
					                          </div>
					                          <label class="col-sm-1 control-label" >Group Id</label>
					                          <div class="col-sm-3">
					                             <input class="form-control" id="groupId" name="groupId" type="text" readOnly="true" /><a href="#" id="groupIdSelect" onclick="selectGroupId()">select</a>
					                          </div>
					                          <label class="col-sm-1 control-label" >Level</label>
					                          <div class="col-sm-3">
					                             <input class="form-control"  id="level" name="level" type="text" readonly="true"/>
					                          </div>
					                       </div>
					                       <div class="form-group" id="parentsDiv">
					                          <label class="col-sm-1 control-label" >Left Parent Id</label>
					                          <div class="col-sm-3">
					                             <input class="form-control"  id="leftParentId" name="leftParentId" type="text" readOnly="true" /><a href="#" style="display:none" onclick="selectLeftParent()">select</a>
					                          </div>
					                       </div>
					                    </fieldset>  
					                    <div >   
					                     <button type="button" id="saveButton"  class="btn btn-primary">Save</button>
					                    </div>
					                </form>
					</div>
					<!-- /.box-body -->
        <div class="box-footer">
        </div>
      </div>
     
      
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
	        $(function() {
	        	//校验规则
	    	    $("#groupAudioServer").validate({
				    rules: {
				    	serverId: {
				    		"required":true,
				    		"number":true
				    	},
				    	groupId: {
				    		"required":true,
				    		"number":true
				    	},
				    	level: {
				    		"required":true,
				    		"number":true
				    	}
				    }	
	    	    });
	    	   //增加校验,左父亲右父亲不能相同
	    	   /*
        		jQuery.validator.addMethod("NotSame", function(value, element) {
	    	    	  return this.optional(element) || $("#leftParentId").val()!=$("#rightParentId").val();
	    	    	}, "left and right parent can't be same");*/
	        	var param=window.dialogArguments;
	        	if(param.action=="MODIFY"){
	        		//是修改界面
	        		//改变单击事件
	        		$("#saveButton").click(modifyGroupAudioServer);
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
	        		//serverId不修改
	        		$("#serveridSelect").hide();
	        		//层级不可修改
	        		$("#level").attr("readonly",true);
	        		//groupId不可修改
	        		
	        		$("#groupIdSelect").hide();
	        	}else{
	        		//是新增页面
	        		//改变单击事件
	        		$("#saveButton").click(saveAudioGroupServer);
	        		//传入参数
	        		var leftParent=param.serverId;
	        	    var level=Number(param.level)+1;
	        		var group=param.group;
	        		$("#level").val(level);
	        		if(level==0){
	        			//gruop可以选择
	        			$("#groupIdSelect").show();
	        			//没有leftparent
	        			$("#parentsDiv").hide();
	        		}else{
	        			$("#groupIdSelect").hide();
	        			$("#parentsDiv").show();
	        			$("#leftParentId").val(leftParent);
	        			$("#groupId").val(group);
	        			
	        		}
	        	}
	        });
	       function setLevel(){
	    	   //如果是level不能选层级
	    	   var level=$("#level").val();
	    	   if(level==0||level=="0"){
	    		   $("#parentsDiv").hide();
	    		   $("#leftParentId").val("");
	    		   $("#rightParentId").val("");
	    	   }else{
	    		   $("#parentsDiv").show();
	    	   }
	       }
	       function selectServerId(e){
	        	//传参
	        	var object=new Object();
	        	object.action="SELECT";
	        	var returnVal=window.showModalDialog("<%=path%>/audioServer",object,"dialogWidth=1200px;dialogHeight=900px");
	        	//将返回值填到表单
	        	$("#serverId").val(returnVal);
	        }
	       function selectGroupId(e){
	        	//传参
	        	var object=new Object();
	        	object.action="SELECT";
	        	var returnVal=window.showModalDialog("<%=path%>/groupAudio",object,"dialogWidth=1200px;dialogHeight=900px");
	        	//将返回值填到表单
	        	$("#groupId").val(returnVal);
	        }
	       function selectParent(){
	        	//传参
	        	var object=new Object();
	        	object.action="SELECT";
	        	var returnVal=window.showModalDialog("<%=path%>/audioServer",object,"dialogWidth=1200px;dialogHeight=900px");
	        	//将返回值填到表单
	        	$("#parentId").val(returnVal);
	        }
	       function selectLeftParent(e){
	    	    //判断是否填写level
	    	    if($("#level").val()==""){
	    	    	alert("Please Input Level First !");
	    	    	return;
	    	    }
	    	    
	        	//传参
	        	var object=new Object();
	        	object.action="SELECT";
	        	object.level=$("#level").val();
	        	var returnVal=window.showModalDialog("<%=path%>/groupAudioServer",object,"dialogWidth=1200px;dialogHeight=900px");
	        	//将返回值填到表单
	        	$("#leftParentId").val(returnVal);
	        }
	       function selectRightParent(e){
	    	    //判断是否填写level
	    	    if($("#level").val()==""){
	    	    	alert("Please Input Level First !");
	    	    	return;
	    	    }
	        	//传参
	        	var object=new Object();
	        	object.action="SELECT";
	        	object.level=$("#level").val();
	        	var returnVal=window.showModalDialog("<%=path%>/groupAudioServer",object,"dialogWidth=1200px;dialogHeight=900px");
	        	//将返回值填到表单
	        	$("#rightParentId").val(returnVal);
	        }
	       function modifyGroupAudioServer(){
	        	$.ajax(
                 		{ type:"POST",
                 		  url:"<%=path%>/groupAudioServerModify",
                 		  data:$("#groupAudioServer").serialize(),
                 		  success:function(data){
                 			 var dataArray=$.parseJSON(data); 
                    	      sendHttpMsg(dataArray,"cmd=audiogroup_change&id="+$("#groupId")+"&act=1");
                 			  },
                 		  error:function(msg){
                 			  alert("error!"+msg.responseText);
                 			 window.returnValue = "error";  //返回值
                 		  	}
                 		 }
                 		  
                 		  
                 	  );
	        }
           function saveAudioGroupServer(){
        	   if($("#groupAudioServer").valid()){
        		   if($("#level").val()==0){
        			   //对于组来说是新增
        			   $("#action").val("1");
        		   }else{
        			   //对于组来说是修改
        			   $("#action").val("2");
        		   }
        		   $.ajax(
                    		{ type:"POST",
                    		  url:"<%=path%>/saveGroupAudioServer",
                    		  data:$("#groupAudioServer").serialize(),
                    		  success:function(data){
                    			  alert("Add Success!");
                    			  window.returnValue = "success"
                    			  window.close();
                    		  },
                    		  error:function(msg){
                    		 window.returnValue = "error";  //返回值
                    			  alert("error!"+msg.responseText);
                    		  	}
                    		 }
                    		  
                    		  
                    	  );
        	   }
        	  
           }
        </script>
</body>
</html>
