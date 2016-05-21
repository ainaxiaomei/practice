<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8" isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>
<!DOCTYPE html>
<html>
    <head>
        <title>MCU Server Config</title>
        <jsp:include page="common/commonHead.jsp"></jsp:include>
         <%String path=getServletContext().getContextPath();%>
    </head>
    <body >
       <a href="<%=path %>/appList">Application List</a><br>
       <a href="<%=path %>/mcuServer">MCU Server Config</a><br>
       <a href="<%=path %>/audioServer">Audio Server Config</a><br>
       <a href="<%=path %>/ftpServer">Ftp Server Config</a><br>
       <a href="<%=path %>/appResource">App Resource Config</a><br>

    </body>
</html>
