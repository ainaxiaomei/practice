<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8" isELIgnored="false" %>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <%String path=getServletContext().getContextPath();%>
        <link rel="stylesheet" media="screen" href="<%=path%>/vendors/datatables/css/jquery.dataTables.css">
        <!-- Bootstrap -->
        <link rel="stylesheet" media="screen" href="<%=path%>/css/bootstrap.min.css">
        <link rel="stylesheet" media="screen" href="<%=path%>/css/bootstrap-theme.min.css">

        <!-- Bootstrap Admin Theme -->
        <link rel="stylesheet" media="screen" href="<%=path%>/css/bootstrap-admin-theme.css">
        <link rel="stylesheet" media="screen" href="<%=path%>/css/bootstrap-admin-theme-change-size.css">
		 <!-- Vendors -->
        <link rel="stylesheet" media="screen" href="vendors/jquery-ui-1.12.0-rc.2/jquery-ui.css">
        <link rel="stylesheet" media="screen" href="vendors/bootstrap-datepicker/css/datepicker.css">
        <link rel="stylesheet" media="screen" href="css/datepicker.fixes.css">
        <link rel="stylesheet" media="screen" href="vendors/uniform/themes/default/css/uniform.default.min.css">
        <link rel="stylesheet" media="screen" href="css/uniform.default.fixes.css">
        <link rel="stylesheet" media="screen" href="vendors/chosen.min.css">
        <link rel="stylesheet" media="screen" href="vendors/selectize/dist/css/selectize.bootstrap3.css">
        <link rel="stylesheet" media="screen" href="vendors/bootstrap-wysihtml5-rails-b3/vendor/assets/stylesheets/bootstrap-wysihtml5/core-b3.css">
        <!-- Datatables -->
        <link rel="stylesheet" media="screen" href="<%=path%>/css/DT_bootstrap.css">
		<!-- 调整容器的大小以扩大表格 -->
		<style>
		   @media (min-width: 1200px) {
			  .container {
			    width: 1500px;
			  }
			}
		</style>
		<script>
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
		
		function resend(val){
	    	 alert(val);
	     }
		</script>
        <!-- HTML5 shim and Respond.js IE8 support of HTML5 elements and media queries -->
        <!--[if lt IE 9]>
           <script type="text/javascript" src="js/html5shiv.js"></script>
           <script type="text/javascript" src="js/respond.min.js"></script>
        <![endif]-->
         <script type="text/javascript" src="<%=path%>/vendors/datatables/js/jquery-2.2.3.min.js"></script>
         <script type="text/javascript" src="<%=path%>/vendors/jquery-ui-1.12.0-rc.2/jquery-ui.js"></script>
        <script type="text/javascript" src="<%=path%>/js/bootstrap.min.js"></script>
        <script type="text/javascript" src="<%=path%>/js/twitter-bootstrap-hover-dropdown.min.js"></script>
        <script type="text/javascript" src="<%=path%>/js/bootstrap-admin-theme-change-size.js"></script>
        <script type="text/javascript" src="<%=path%>/vendors/datatables/js/jquery.dataTables.min.js"></script>
        <script type="text/javascript" src="<%=path%>/js/DT_bootstrap.js"></script>
        <script type="text/javascript" src="<%=path%>/js/twitter-bootstrap-hover-dropdown.min.js"></script>
        <script type="text/javascript" src="<%=path%>/vendors/uniform/jquery.uniform.min.js"></script>
        <script type="text/javascript" src="<%=path%>/vendors/chosen.jquery.min.js"></script>
        <script type="text/javascript" src="<%=path%>/vendors/selectize/dist/js/standalone/selectize.min.js"></script>
        <script type="text/javascript" src="<%=path%>/vendors/bootstrap-datepicker/js/bootstrap-datepicker.js"></script>
        <script type="text/javascript" src="<%=path%>/vendors/bootstrap-wysihtml5-rails-b3/vendor/assets/javascripts/bootstrap-wysihtml5/wysihtml5.js"></script>
        <script type="text/javascript" src="<%=path%>/vendors/bootstrap-wysihtml5-rails-b3/vendor/assets/javascripts/bootstrap-wysihtml5/core-b3.js"></script>
        <script type="text/javascript" src="<%=path%>/vendors/twitter-bootstrap-wizard/jquery.bootstrap.wizard-for.bootstrap3.js"></script>
        <script type="text/javascript" src="<%=path%>/vendors/boostrap3-typeahead/bootstrap3-typeahead.min.js"></script>
        <script type="text/javascript" charset="utf8" src="<%=path%>/vendors/datatables/extensions/Select/js/dataTables.select.min.js"></script>
        <script type="text/javascript" charset="utf8" src="<%=path%>/vendors/jquery-validation-1.14.0/dist/jquery.validate.js"></script>
        