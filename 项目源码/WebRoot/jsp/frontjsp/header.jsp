<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>首页</title>
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	
	<link href="<%=basePath%>js/bootstrap/css/bootstrap.css" rel="stylesheet">
	<link href="<%=basePath%>js/bootstrap3-dialog/css/bootstrap-dialog.css" rel="stylesheet">
	<script type="text/javascript" src="<%=basePath%>js/jQuery/jquery-3.2.1.js"></script>
	<script type="text/javascript" src="<%=basePath%>js/bootstrap/js/bootstrap.js"></script>
	<script type="text/javascript" src="<%=basePath%>js/bootstrap3-dialog/js/bootstrap-dialog.js"></script>
	
	<script src="<%=basePath%>js/frontjs/jquery-1.11.1.min.js"></script>
	<script src="<%=basePath%>js/frontjs/unslider.min.js"></script>
	
	<link rel="stylesheet" type="text/css" href="<%=basePath%>css/frontcss/header.css">
	<script type="text/javascript" src="<%=basePath%>js/frontjs/header.js"></script>
	
  </head>
  <body>
	  <div class="header">
	  	<div class="headertop">
	  		<div class="rightlogin">
	  			<c:if var="result" test="${empty sessionScope.user.username }">
		    	<p>
		    		<a class="denglu" href="<%=basePath%>jsp/frontjsp/register.jsp">注册</a>&nbsp;
		    		<a class="denglu" href="<%=basePath%>jsp/frontjsp/login.jsp">请登录</a>&nbsp;
		    	</p>
			    </c:if>
			    <c:if test="${!result }">
			    	<span class="denglu">
			    	欢迎，${sessionScope.user.username }&nbsp;&nbsp;
			    	<a href="personcenter?userid=${sessionScope.user.id }">个人中心</a>&nbsp;&nbsp;
			    	<a href="shoppingcartlist?userid=${sessionScope.user.id }">购物车</a>&nbsp;&nbsp;
			    	<a href="logout?userid=${sessionScope.user.id }">注销</a>
			    	</span>
			    </c:if>
	  		</div>
	  	</div>
	  	<div class="container">
	  		<div class="headercenter">
	  			<h1>网上购书商城</h1>
	  		</div>
	  	</div>
	  	<div class="container">
	  		<div class="headerbar">
	  			<nav class="navbar navbar-default headback">  
				  <div class="container-fluid">
				    <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
				      <ul class="nav navbar-nav">
				        <li><a href="contentindex">首页</a></li>
				        <li><a href="goodslist?currentPage=1">图书列表</a></li>
				        <li><a href="orderlist?currentPage=1&userid=${sessionScope.user.id }">订单详情</a></li>
				      </ul>
				    </div>
				  </div>
			   </nav>
	  		</div>
	  	</div>
	  </div>
  </body>
</html>
