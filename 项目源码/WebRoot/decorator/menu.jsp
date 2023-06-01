<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>菜单</title>
<link rel="stylesheet" type="text/css" href="<%=basePath%>css/backcss/menu.css">

<script type="text/javascript">
//等待dom元素加载完毕.
$(document).ready(function(){
	$(".level1 > a").click(function(){
		$(this)   //给当前元素添加"current"样式
		.next().show()                //下一个元素显示
		.parent().siblings().children("a")       //父元素的兄弟元素的子元素<a>移除"current"样式
		.next().hide();                 //它们的下一个元素隐藏
	});
});
</script>

</head>
<body>
	<div id="contleft">
		<ul class="menu">
			<li class="level1">
			<a href="javascript:void(0)">用户管理</a>
				<ul class="level2">
	                <li><a href="<%=basePath%>back/roleuserlist?currentPage=1">用户列表</a></li>
                </ul>
			</li>
			<li class="level1">
			<a href="javascript:void(0)">商品类型管理</a>
				<ul class="level2">
	                <li><a href="<%=basePath%>back/addgoodstypev">添加商品种类</a></li>
	                <li><a href="<%=basePath%>back/rolegoodstypelist?currentPage=1">商品种类列表</a></li>
                </ul>
			</li>
			<li class="level1">
			<a href="javascript:void(0)">商品管理</a>
				<ul class="level2">
					<li><a href="<%=basePath%>back/rolegoodslist?currentPage=1">商品列表</a></li>
		   			<li><a href="<%=basePath%>back/goodstypelist">商品添加</a></li>
                </ul>
			</li>
			<li class="level1">
			<a href="javascript:void(0)">订单管理</a>
				<ul class="level2">
	                <li><a href="<%=basePath%>back/roleorderlist?currentPage=1">订单列表</a></li>
                </ul>
			</li>
			<li class="level1" style="display:none;">
			<a href="javascript:void(0)">售后管理</a>
				<ul class="level2">
	                <li><a href="<%=basePath%>back/roleaftersaleslist?currentPage=1">售后列表</a></li>
                </ul>
			</li>
		</ul>
		
	</div>
</body>
</html>