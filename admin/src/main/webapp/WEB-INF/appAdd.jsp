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
        GroupMcu  Configuration
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
          <h3 class="box-title">GroupMcu Information</h3>

          <div class="box-tools pull-right">
            <button type="button" class="btn btn-box-tool" data-widget="collapse"><i class="fa fa-minus"></i></button>
            <button type="button" class="btn btn-box-tool" data-widget="remove"><i class="fa fa-remove"></i></button>
          </div>
        </div>
        <!-- /.box-header -->
					<div class="box-body">
						<form class="form-horizontal" role="form" id="appForm">
					                   <fieldset>
					                       <div class="form-group">
					                          <label class="col-sm-1 control-label" >App Id</label>
					                          <div class="col-sm-3">
					                             <input class="form-control" id="appid" name="appid" type="text" />
					                          </div>
					                          <label class="col-sm-1 control-label" >Company Id</label>
					                          <div class="col-sm-3">
					                             <input class="form-control" id="companyId" name="companyId" type="text" readonly="true"/><a href="#" onclick="selectCompany()">select</a>
					                             
					                          </div>
					                          <label class="col-sm-1 control-label" >Begin Uid</label>
					                          <div class="col-sm-3">
					                             <input class="form-control" id="beginUid" name="beginUid" type="text"/>
					                          </div>
					                       </div>
					                       <div class="form-group">
					                          <label class="col-sm-1 control-label" >End Uid</label>
					                          <div class="col-sm-3">
					                             <input class="form-control" id="endUid"  name="endUid" type="text" />
					                          </div>
					                          <label class="col-sm-1 control-label" >Current Uid</label>
					                          <div class="col-sm-3">
					                             <input class="form-control"  id="curUid" name="curUid" type="text" readonly="true"/>
					                          </div>
					                          <label class="col-sm-1 control-label" >Description</label>
					                          <div class="col-sm-3">
					                             <input class="form-control"  id="description" name="description" type="text"/>
					                          </div>
					                       </div>
					                       <div class="form-group">
					                          <label class="col-sm-1 control-label" >Contacts</label>
					                          <div class="col-sm-3">
					                             <input class="form-control"  id="contacts" name="contacts" type="text" />
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
	    	    $("#appForm").validate({
				    rules: {
				    	appid: {
				    		"required":true,
				    		"number":true
				    	},
				    	beginUid: {
				    		"required":true,
				    		"number":true,
				    		"beginUid":true
				    	},
				    	endUid: {
				    		"endUid":true,
				    		"required":true,
				    		"number":true
				    	},
				    	companyId: "required",
				      },
	    	    });
	        	var param=window.dialogArguments;
	        	if(param.action=="MODIFY"){
	        		//是修改界面
	        		//改变单击事件
	        		$("#saveButton").click(modifyApp);
	        		//填充表单
	        		 var columns= [
							"appid" ,
							 "companyId" ,
			                 "contacts",
			                "description" ,
			                 "beginUid" ,
			                 "endUid" ,
			                 "curUid"
			                
			            ];
	        		$("#appid").attr("readonly",true);
	        		$("#companyId").attr("readonly",true);
	        		$("#beginUid").attr("readonly",true);
	        		$("#curUid").attr("readonly",true);
	        		$("#endUid").attr("readonly",true);
	        		for(var i=0;i<columns.length;i++){
	        			var a=$("#"+columns[i]);
	        			a.val(param[columns[i]]);
	        		}
	        	}else{
	        		//是新增页面
	        		//改变单击事件
	        		$("#saveButton").click(saveApp);
	        		var param=window.dialogArguments;
	        		$("#beginUid").val(param.beginUid);
	        		//增加校验
	        		jQuery.validator.addMethod("beginUid", function(value, element) {
		    	    	  return this.optional(element) || value>=param.beginUid;
		    	    	}, "BeginUid Can Not Smaller Than "+param.beginUid);
	        		//增加校验
	        		jQuery.validator.addMethod("endUid", function(value, element) {
		    	    	  return this.optional(element) || Number(value)>=Number($("#beginUid").val());
		    	    	}, "EndUid Must Larger Than "+$("#beginUid").val());
	        	}
	        })
	        function selectCompany(){
	        	//传参
	        	var object=new Object();
	        	object.action="SELECT";
	        	var returnVal=window.showModalDialog("<%=path%>/company",object,"dialogWidth=1200px;dialogHeight=900px");
	        	//将返回值填到表单
	        	$("#companyId").val(returnVal);
	        }
	       function modifyApp(){
	        	$.ajax(
                 		{ type:"POST",
                 		  url:"<%=path%>/appModify",
                 		  data:$("#appForm").serialize(),
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
           function saveApp(){
        	 if($("#appForm").valid()){
        		 $.ajax(
                  		{ type:"POST",
                  		  url:"<%=path%>/saveApp",
                  		  data:$("#appForm").serialize(),
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
        	   
           }
        </script>
</body>
</html>
