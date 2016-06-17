<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8" isELIgnored="false" %>
<!DOCTYPE html>
<html>
<head>
  <title>GroupMcuServer  Config</title>
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
        GroupMcuServer  Configuration
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
          <h3 class="box-title">GroupMcuServerTree</h3>

          <div class="box-tools pull-right">
            <button type="button" class="btn btn-box-tool" data-widget="collapse"><i class="fa fa-minus"></i></button>
            <button type="button" class="btn btn-box-tool" data-widget="remove"><i class="fa fa-remove"></i></button>
          </div>
        </div>
        <!-- /.box-header -->
		<div class="box-body" id="mcuTree">
		</div>
					<!-- /.box-body -->
        <div class="box-footer">
        </div>
      </div>
      <!-- /.box -->
      
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
   $(function () { 
	  $("#tables #mcuConfig").attr("class","active");
   	  $("#tables #groupMcuServers").attr("class","active");
      $('#mcuTree').jstree({
    	  "core" : {
    		"check_callback" : true,
    		"data" : {
  				"url" : "<%=path%>/GroupMcuServerTree",
  			}
  		},
  		"contextmenu":{
  			items : function (o, cb) { // Could be an object directly
  				return {
  					"create" : {
  						"separator_before"	: false,
  						"separator_after"	: true,
  						"_disabled"			: false, //(this.check("create_node", data.reference, {}, "last")),
  						"label"				: "Create",
  						"action"			: function (data) {
  							var inst = $.jstree.reference(data.reference),
  								obj = inst.get_node(data.reference);
  							inst.create_node(obj, {}, "last", function (new_node) {
  								setTimeout(function () { inst.edit(new_node); },0);
  							});
  						}
  					},//end create
  					"remove" : {
  						"separator_before"	: false,
  						"icon"				: false,
  						"separator_after"	: false,
  						"_disabled"			: false, //(this.check("delete_node", data.reference, this.get_parent(data.reference), "")),
  						"label"				: "Delete",
  						"action"			: function (data) {
  							var inst = $.jstree.reference(data.reference),
  								obj = inst.get_node(data.reference);
  							if(inst.is_selected(obj)) {
  								inst.delete_node(inst.get_selected());
  							}
  							else {
  								inst.delete_node(obj);
  							}
  						}
  					}//end remove
  			    }
  			}
  		},
  		 "plugins" : [ "contextmenu" ]
      
      }); 
        	});
  </script>
</body>
</html>
