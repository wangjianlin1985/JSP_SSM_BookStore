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
<title>商品种类列表</title>
<link rel="stylesheet" type="text/css" href="<%=basePath%>css/backcss/roleactivelist.css">
<script type="text/javascript" src="<%=basePath%>js/jQuery/jquery-3.2.1.js"></script>
</head>
<body>
		<div class="goodlist">	
			<h3>商品种类列表</h3>
			<c:if test="${addgoodstypelist== 'SUCCESS' }">
				<script>
				  	BootstrapDialog.show({
	                    title : '操作提示',
	                    message : '添加商品种类成功'
	                });
			  	</script>
			</c:if>
			<c:if test="${deletegoodstypelist== 'SUCCESS' }">
				<script>
				  	BootstrapDialog.show({
	                    title : '操作提示',
	                    message : '删除商品种类成功'
	                });
			  	</script>
			</c:if>
			<c:if test="${!empty rolegoodstypelist.list}">
				<div class="centeralign">
				<table class="table table-bordered userlist">
				<tr style="height:30px;">
				<td>id</td>
				<td>商品种类</td>
				<td>添加时间</td>
				<td>操作</td>
				</tr>
				<c:forEach items="${rolegoodstypelist.list}" var="goodstype">
				<tr>
				  <td class="cen">${goodstype.id }</td>
				  <td class="cen">${goodstype.goodstype }</td>
				  <td class="cen">${goodstype.createdate }</td>	
				  <td>
				  <a href="<%=basePath%>back/deletegoodstype?id=${goodstype.id }" class="btn btn-danger">删除</a>
				  </td>
				</tr>
				</c:forEach>
				</table>
				</div>
				<div class="clearfix"></div>
				
				<div style="float:right;font-size: 16px;">
					<a href="<%=basePath%>back/rolegoodstypelist?currentPage=${1}">首页</a>
			    <c:if test="${rolegoodstypelist.currentPage>1 }">
			        <a href="<%=basePath%>back/rolegoodstypelist?currentPage=${rolegoodstypelist.currentPage-1}">上一页</a>
			    </c:if>
			    
			    <c:if test="${rolegoodstypelist.totalPage>6 }">
			    	<c:if test="${rolegoodstypelist.currentPage<5 }">
			    		<c:forEach begin="1" end="6" step="1" var="i">
					        <c:if test="${rolegoodstypelist.currentPage==i }">
					            <a href="<%=basePath%>back/rolegoodstypelist?currentPage=${i}"><font color="#ff0000">${i}</font></a>
					        </c:if>
					        <c:if test="${rolegoodstypelist.currentPage!=i }">
					            <a href="<%=basePath%>back/rolegoodstypelist?currentPage=${i}">${i}</a>
					        </c:if>
					    </c:forEach>
					    <span>...</span>
			    		<a href="<%=basePath%>back/rolegoodstypelist?currentPage=${rolegoodstypelist.totalPage}">${rolegoodstypelist.totalPage}</a>
			    	</c:if>
			    	<c:if test="${rolegoodstypelist.currentPage>=5 }">
			    		<c:if test="${rolegoodstypelist.currentPage<rolegoodstypelist.totalPage-3 }">
			    			<c:forEach begin="${rolegoodstypelist.currentPage-2}" end="${rolegoodstypelist.currentPage+3}" step="1" var="i">
						        <c:if test="${rolegoodstypelist.currentPage==i }">
						            <a href="<%=basePath%>back/rolegoodstypelist?currentPage=${i}"><font color="#ff0000">${i}</font></a>
						        </c:if>
						        <c:if test="${rolegoodstypelist.currentPage!=i }">
						            <a href="<%=basePath%>back/rolegoodstypelist?currentPage=${i}">${i}</a>
						        </c:if>
						    </c:forEach>
						    <span>...</span>
				    		<a href="<%=basePath%>back/rolegoodstypelist?currentPage=${rolegoodstypelist.totalPage}">${rolegoodstypelist.totalPage}</a>
			    		</c:if>
			    		<c:if test="${rolegoodstypelist.currentPage>=rolegoodstypelist.totalPage-3 }">
			    			<a href="<%=basePath%>back/rolegoodstypelist?currentPage=${1}">1</a>
			    			<span>...</span>
			    			<c:forEach begin="${rolegoodstypelist.totalPage-4}" end="${rolegoodstypelist.totalPage}" step="1" var="i">
						        <c:if test="${rolegoodstypelist.currentPage==i }">
						            <a href="<%=basePath%>back/rolegoodstypelist?currentPage=${i}"><font color="#ff0000">${i}</font></a>
						        </c:if>
						        <c:if test="${rolegoodstypelist.currentPage!=i }">
						            <a href="<%=basePath%>back/rolegoodstypelist?currentPage=${i}">${i}</a>
						        </c:if>
						    </c:forEach>
			    		</c:if>
			    	</c:if>
			    </c:if>
			    <c:if test="${rolegoodstypelist.totalPage<=6 }">
			    	<c:forEach begin="1" end="${rolegoodstypelist.totalPage }" step="1" var="i">
				        <c:if test="${rolegoodstypelist.currentPage==i }">
				            <a href="<%=basePath%>back/rolegoodstypelist?currentPage=${i}"><font color="#ff0000">${i}</font></a>
				        </c:if>
				        <c:if test="${rolegoodstypelist.currentPage!=i }">
				            <a href="<%=basePath%>back/rolegoodstypelist?currentPage=${i}">${i}</a>
				        </c:if>
				    </c:forEach>
			    </c:if>
			    
			    <c:if test="${rolegoodstypelist.currentPage< rolegoodstypelist.totalPage }">
			        <a href="<%=basePath%>back/rolegoodstypelist?currentPage=${rolegoodstypelist.currentPage+1}">下一页</a>
			    </c:if>
			    <a href="<%=basePath%>back/rolegoodstypelist?currentPage=${rolegoodstypelist.totalPage}">末页</a>
			    <span class='totalPages'> 共<span>${rolegoodstypelist.totalPage }</span>页</span><span>, </span>
			    <span class='totalSize'><span>${rolegoodstypelist.totalCount }</span>条记录 </span>
				</div>
			</c:if>
			<c:if test="${empty rolegoodstypelist.list}">
				<h3 style="margin-top:30px;">还未有商品种类</h3>
			</c:if>
			</div>

</body>
</html>

