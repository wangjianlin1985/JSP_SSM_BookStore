<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>  
<%@ taglib uri="http://www.opensymphony.com/sitemesh/decorator" prefix="decorator" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>  
    <title>  
        <decorator:title default="默认包装器。。。"/>  
    </title>  
    <decorator:head/>  
    <link rel="stylesheet" type="text/css" href="<%=basePath%>css/backcss/header.css">
  </head>
<body>
	<div id="header">
		<h3 style="padding:10px 0 0 20px;float:left">网上购书商城后台</h3>
		<p style="float:right;margin:20px 20px 0 0;">
		<span style="color:#FFFFFF;">您好，${sessionScope.roleuser.username }</span>&nbsp;&nbsp;
		<a href="<%=basePath%>rolelogout?userid=${sessionScope.roleuser.id }">注销</a>
		</p>
	</div>
</body>
</html>