<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<html>
<head>
<meta charset="utf-8">
<title>首页</title>
<link rel="stylesheet" type="text/css" href="<%=basePath%>css/frontcss/index.css">

</head>
  <body>
  	<jsp:include page ="header.jsp" />
  	<div class="container">
  		
  		<!-- 推荐商品 -->
		<div class="tuigoods">
			<h3>推荐图书</h3>
			<div class="goods">
				<c:forEach items="${goodslist}" var="goods"> 
				  <div class="goodslist">
		             <dl>
		               <dt>
		                 <a href="goodsdetails?id=${goods.id }"><img src="/onlinestemp/upload/image/${goods.photourl}" width="220" height="220" border="1"/></a>
		               </dt>
		               <dd class="dd_name">${goods.name }</dd> 
		               <dd>价格:￥<span class="dd_city"> ${goods.price }</span></dd> 
		             </dl>
		          </div>
				</c:forEach>
			</div>
		</div>
  		
		<div class="footer"></div>
	</div>
  </body>
</html>