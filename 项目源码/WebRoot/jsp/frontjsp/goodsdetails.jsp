<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>图书详情</title>
<link rel="stylesheet" type="text/css" href="<%=basePath%>css/frontcss/goodsdetails.css">
<script type="text/javascript" src="<%=basePath%>js/jQuery/jquery-3.2.1.js"></script>
<script type="text/javascript" src="<%=basePath%>js/frontjs/goodsdetails.js"></script>
</head>
<body>
	<jsp:include page ="header.jsp" />
	<c:if test="${RESULT == 'SUCCESS' }">
		<div class="container">
			<div class="goods">
				<div class="row">
					<div class="col-lg-5">
						<img src="/onlinestemp/upload/image/${goods.photourl}" width="425" height="425"/>
					</div>
					<div class="col-lg-6 goodstitle">
						<input type="hidden" id="price" value="${goods.price }"/>
						<input type="hidden" id="goodsid" value="${goods.id }"/>
						<input type="hidden" id="userid" value="${sessionScope.user.id }"/>
						<p><span class="bold">图书简介：&nbsp;</span>${goods.name }&nbsp;${goods.title}</p>
						<p><span class="bold">价格：&nbsp;</span>￥${goods.price }</p>
						<p><span class="bold">重量：&nbsp;</span>${goods.weight }kg</p>
						<p><span class="bold">累计销量：&nbsp;</span>${goods.total }件</p>
						<p><span class="bold">剩余件数：&nbsp;</span>${goods.count }件</p>
						<p>
							<span class="bold">购买数量：&nbsp;</span>
							<input class="addBtn" id="min" type="button" style="width:20px;" value="-" />
							<input class="join-money" id="join-money" type="text" style="width:40px;" value="1">
							<input class="addBtn" id="add" type="button" style="width:20px;" value="+" />
						</p>
						<p><button type="button" class="btn btn-primary" onclick="addshoppingcart()">加入购物车</button></p>
					</div>
				</div>
				<div class="goodsmessage">
					<h3>图书详情</h3>
					<div class="row">
						<div class="col-lg-3"><span class="bold">商品名称：&nbsp;</span>${goods.name }</div>
						<div class="col-lg-3"><span class="bold">商品类型：&nbsp;</span>${goods.typename }</div>
						<div class="col-lg-3"><span class="bold">商品重量：&nbsp;</span>${goods.weight }</div>
						<div class="col-lg-3"><span class="bold">商品价格：&nbsp;</span>${goods.price }</div>
					</div>
					<div class="row">
						<div class="col-lg-12"><span class="bold">商品详情：&nbsp;</span>${goods.descript }</div>
					</div>
					<h3>图书介绍</h3>
					<div class="row">
						<div class="col-lg-12"><img src="/onlinestemp/upload/image/${goods.messageurl }" width="1000px"/></div>
					</div>
				</div>
			</div>
		</div>
	</c:if>
	<c:if test="${RESULT == 'FAILURE' }">
		<div class="container">
			<div style="width:1140px;margin:0 auto;">
				<h3>抱歉，商品信息有误，请返回首页</h3>
			</div>
		</div>
	</c:if>
</body>
</html>