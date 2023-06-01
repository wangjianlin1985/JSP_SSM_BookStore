<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib uri="http://www.opensymphony.com/sitemesh/decorator" prefix="decorator" %>
<%@ taglib uri="http://www.opensymphony.com/sitemesh/page" prefix="page" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">  
<html>  
<head>   
    <title><decorator:title default="装饰器页面..." /></title>   
    <decorator:head />   
    <link rel="stylesheet" type="text/css" href="<%=basePath%>css/backcss/main.css">
    <link href="<%=basePath%>js/bootstrap/css/bootstrap.css" rel="stylesheet">
	<link href="<%=basePath%>js/bootstrap3-dialog/css/bootstrap-dialog.css" rel="stylesheet">
	
	<script type="text/javascript" src="<%=basePath%>js/jQuery/jquery-3.2.1.js"></script>
	<script type="text/javascript" src="<%=basePath%>js/bootstrap/js/bootstrap.js"></script>
	<script type="text/javascript" src="<%=basePath%>js/bootstrap3-dialog/js/bootstrap-dialog.js"></script>
  </head>   
  <body>  
   
  <page:applyDecorator name="header"/>  
  <div id="content">
  	  <page:applyDecorator name="menu"/>
	  <div id="contright">
	  	<decorator:body/>
	  </div>
  </div>
  </body>   
</html>  