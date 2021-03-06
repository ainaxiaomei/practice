<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8" isELIgnored="false" %>
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <!-- Tell the browser to be responsive to screen width -->
  <meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport">
  <%String path=getServletContext().getContextPath();%>
  <!-- DataTables -->
  <link rel="stylesheet" media="screen" href="<%=path%>/common/plugins/datatables/css/dataTables.bootstrap.css">
  <!-- Bootstrap 3.3.6 -->
  <link rel="stylesheet" href="<%=path%>/common/bootstrap/css/bootstrap.min.css">
  <!-- Font Awesome -->
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.5.0/css/font-awesome.min.css">
  <!-- Ionicons -->
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/ionicons/2.0.1/css/ionicons.min.css">
  <!-- Theme style -->
  <link rel="stylesheet" href="<%=path%>/common/dist/css/AdminLTE.min.css">
  <!-- AdminLTE Skins. Choose a skin from the css/skins
       folder instead of downloading all of them to reduce the load. -->
  <link rel="stylesheet" href="<%=path%>/common/dist/css/skins/_all-skins.min.css">
  <!-- jquery Ui -->
  <link rel="stylesheet" media="screen" href="vendors/jquery-ui-1.12.0-rc.2/jquery-ui.css">
  <!-- js tree -->
  <link rel="stylesheet" media="screen" href="<%=path%>/common/plugins/jstree/vakata-jstree-7a976d1/dist/themes/default/style.min.css">
  <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
  <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
  <!--[if lt IE 9]>
  <script src="https://oss.maxcdn.com/html5shiv/3.7.3/html5shiv.min.js"></script>
  <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
  <![endif]-->
  
  <!-- jQuery 2.2.0 -->
<script src="<%=path%>/common/plugins/jQuery/jQuery-2.2.0.min.js"></script>
<!-- Bootstrap 3.3.6 -->
<script src="<%=path%>/common/bootstrap/js/bootstrap.js"></script>
<!-- DataTables -->
<script src="<%=path%>/common/plugins/datatables/js/jquery.dataTables.min.js"></script>
<script src="<%=path%>/common/plugins/datatables/js/dataTables.bootstrap.min.js"></script>
<script src="<%=path%>/common/plugins/datatables/extensions/Select/js/dataTables.select.min.js"></script>

<!-- SlimScroll -->
<script src="<%=path%>/common/plugins/slimScroll/jquery.slimscroll.min.js"></script>
<!-- FastClick -->
<script src="<%=path%>/common/plugins/fastclick/fastclick.js"></script>
<!-- AdminLTE App -->
<script src="<%=path%>/common/dist/js/app.min.js"></script>
<!-- AdminLTE for demo purposes -->
<script src="<%=path%>/common/dist/js/demo.js"></script>
 <!-- jquery Ui validate -->
<script type="text/javascript" charset="utf8" src="<%=path%>/vendors/jquery-validation-1.14.0/dist/jquery.validate.js"></script>
<!-- jquery Ui -->
<script type="text/javascript" src="<%=path%>/vendors/jquery-ui-1.12.0-rc.2/jquery-ui.js"></script>
<!-- js tree -->
<script type="text/javascript" src="<%=path%>/common/plugins/jstree/vakata-jstree-7a976d1/dist/jstree.js"></script>
<style>
 
  table.dataTable tbody tr.selected {
  background-color: #B0BED9;
  
}
</style>
<style>
			.error{
				color:red;
			}
</style>
<script>
	function getUrlParam(name) { 
		var reg = new RegExp("(^|&)" + name + "=([^&]*)(&|$)", "i"); 
		var r = window.location.search.substr(1).match(reg); 
		if (r != null) return unescape(r[2]); return null; 
		} 
	function showDialog(url,json){
		   var param=encodeURI(json);
	 	   var iframe=$("#modelFrame");
	 	   iframe.attr("src",url+"?param="+param);
		   var model=$(document.getElementById('model'));
		   model.modal({backdrop: 'static', keyboard: false});
		   model.attr("class","modal fade in");
 		   model.attr("style","display:block");
 		   $(".modal-backdrop,.fade,.in",window.parent.document).attr("style","display:block");
	   }
	function showSideControl(){
		$('#ctlSideBar').addClass("control-sidebar-open");
	}
	//重发消息
	function resend(val,id){
		//显示等待
		$("#i-"+id).show();
		 $.ajax(
         		{ type:"POST",
         		  url:"<%=path%>/sendMessage",
         		  data:{"ips":val,"msg":"","type":""},
         		  //contentType:"application/json",
         		  success:function(data){
         			  var dataArray=$.parseJSON(data);
         			  if(!dataArray.length||dataArray.lehgth<=0){
         				  alert("success!");
         				 $("#li-"+id).remove();
         			  }else{
         				  alert("fail");
         				 $("#i-"+id).hide();
         			    }
         			  },
         		  error:function(data){
         			     alert("error");
         		  	}
         		 }
         		  
         		  
         	  );
    }
	function notifyServer(msg){
		 $("#waitModal").modal({
		      keyboard: true,
		     backdrop:"static"
		   });
 	   $.ajax(
         		{ type:"POST",
         		  url:"<%=path%>/sendMessage",
         		  data:msg,
         		  //contentType:"application/json",
         		  success:function(data){
         			  var dataArray=$.parseJSON(data);
         			  if(!dataArray.length||dataArray.lehgth<=0){
         				  //没有发送失败
         				  $("#imgLoading").hide();
         				  $("#opSuccess").show();
         			  }else{
         				  //设置失败url列表
         				  $.each(dataArray,function (id,value){
         					  $("#failUrls").append(
              					     '<li id=li-'+id+'>'+'<a href="javascript:resend('+'\''+value+'\''+","+'\''+id+'\''+')"><i class="menu-icon fa fa-user bg-yellow"></i>'
										 +'<div class="menu-info"><h4 class="control-sidebar-subheading">'
              			              + value
              			              +'<i id="i-'+id+'"'+' class="fa fa-refresh fa-spin" style="display:none"></i>'+'</div></a></li>'); 
         				  });
         				  $("#imgLoading").hide();
         				  $("#opError").show();
         				  $("#detail").show();
         				  
         				  
         				  
         			  }
         			  //alert(data);
         			  /*
         			 setTimeout(function(){
         				 $('#waitModal').modal('hide');
           			},1000);*/
         			  },
         		  error:function(data){
         			  /*
         			  setTimeout(function(){
          				 $('#waitModal').modal('hide');
            			},1000);*/
            		  $("#imgLoading").hide();
   				      $("#opError").show();
   				      $("#detail").show();
         		  	}
         		 }
         		  
         		  
         	  );
    }
</script>

        