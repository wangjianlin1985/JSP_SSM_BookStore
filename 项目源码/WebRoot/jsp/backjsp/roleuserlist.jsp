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
    <title>用户列表</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<link rel="stylesheet" type="text/css" href="<%=basePath%>css/backcss/roleuserlist.css">
	<link href="<%=basePath%>js/bootstrap/css/bootstrap.css" rel="stylesheet">
	<link href="<%=basePath%>js/bootstrap3-dialog/css/bootstrap-dialog.css" rel="stylesheet">
	<script type="text/javascript">

</script>
  </head>
  <body>
      	<div class="login1">
    		<h3 class="loginh3">用户列表</h3>
    		<c:if test="${!empty roleuserlist.list}">
				<table class="table table-bordered userlist">
				<tr>
				<td>用户名</td>
				<td>邮箱</td>
				<td>性别</td>
				<td>年龄</td>
				<td>电话</td>
				<td>注册时间</td>
				</tr>
				<c:forEach items="${roleuserlist.list}" var="roleuser">
				<tr>
				  <td>${roleuser.username }</td>
				  <td>${roleuser.email }</td>
				  <c:if test="${roleuser.sex eq  null}">
				  <td></td>	
				  </c:if>
				  <c:if test="${roleuser.sex == ''}">
				  <td></td>	
				  </c:if>
				  <c:if test="${roleuser.sex == 1 }">
				  <td>男</td>	
				  </c:if>
				  <c:if test="${roleuser.sex == 2 }">
				  <td>女</td>	
				  </c:if>
				  <td>${roleuser.age }</td>
				  <td>${roleuser.mobile }</td>
				  <td>${roleuser.createdate }</td>
				</tr>
				</c:forEach>
				</table>
				<div class="clearfix"></div>
				
				<div style="float:right;font-size: 16px;">
				    <a href="<%=basePath%>back/roleuserlist?currentPage=${1}">首页</a>
				    <c:if test="${roleuserlist.currentPage>1 }">
				        <a href="<%=basePath%>back/roleuserlist?currentPage=${roleuserlist.currentPage-1}">上一页</a>
				    </c:if>
				    
				    <c:if test="${roleuserlist.totalPage>6 }">
				    	<c:if test="${roleuserlist.currentPage<5 }">
				    		<c:forEach begin="1" end="6" step="1" var="i">
						        <c:if test="${roleuserlist.currentPage==i }">
						            <a href="<%=basePath%>back/roleuserlist?currentPage=${i}"><font color="#ff0000">${i}</font></a>
						        </c:if>
						        <c:if test="${roleuserlist.currentPage!=i }">
						            <a href="<%=basePath%>back/roleuserlist?currentPage=${i}">${i}</a>
						        </c:if>
						    </c:forEach>
						    <span>...</span>
				    		<a href="<%=basePath%>back/roleuserlist?currentPage=${roleuserlist.totalPage}">${roleuserlist.totalPage}</a>
				    	</c:if>
				    	<c:if test="${roleuserlist.currentPage>=5 }">
				    		<c:if test="${roleuserlist.currentPage<roleuserlist.totalPage-3 }">
				    			<c:forEach begin="${roleuserlist.currentPage-2}" end="${roleuserlist.currentPage+3}" step="1" var="i">
							        <c:if test="${roleuserlist.currentPage==i }">
							            <a href="<%=basePath%>back/roleuserlist?currentPage=${i}"><font color="#ff0000">${i}</font></a>
							        </c:if>
							        <c:if test="${roleuserlist.currentPage!=i }">
							            <a href="<%=basePath%>back/roleuserlist?currentPage=${i}">${i}</a>
							        </c:if>
							    </c:forEach>
							    <span>...</span>
					    		<a href="<%=basePath%>back/roleuserlist?currentPage=${roleuserlist.totalPage}">${roleuserlist.totalPage}</a>
				    		</c:if>
				    		<c:if test="${roleuserlist.currentPage>=roleuserlist.totalPage-3 }">
				    			<a href="<%=basePath%>back/roleuserlist?currentPage=${1}">1</a>
				    			<span>...</span>
				    			<c:forEach begin="${roleuserlist.totalPage-4}" end="${roleuserlist.totalPage}" step="1" var="i">
							        <c:if test="${roleuserlist.currentPage==i }">
							            <a href="<%=basePath%>back/roleuserlist?currentPage=${i}"><font color="#ff0000">${i}</font></a>
							        </c:if>
							        <c:if test="${roleuserlist.currentPage!=i }">
							            <a href="<%=basePath%>back/roleuserlist?currentPage=${i}">${i}</a>
							        </c:if>
							    </c:forEach>
				    		</c:if>
				    	</c:if>
				    </c:if>
				    <c:if test="${roleuserlist.totalPage<=6 }">
				    	<c:forEach begin="1" end="${roleuserlist.totalPage }" step="1" var="i">
					        <c:if test="${roleuserlist.currentPage==i }">
					            <a href="<%=basePath%>back/roleuserlist?currentPage=${i}"><font color="#ff0000">${i}</font></a>
					        </c:if>
					        <c:if test="${roleuserlist.currentPage!=i }">
					            <a href="<%=basePath%>back/roleuserlist?currentPage=${i}">${i}</a>
					        </c:if>
					    </c:forEach>
				    </c:if>
				    
				    <c:if test="${roleuserlist.currentPage< roleuserlist.totalPage }">
				        <a href="<%=basePath%>back/roleuserlist?currentPage=${roleuserlist.currentPage+1}">下一页</a>
				    </c:if>
				    <a href="<%=basePath%>back/roleuserlist?currentPage=${roleuserlist.totalPage}">末页</a>
				    <span class='totalPages'> 共<span>${roleuserlist.totalPage }</span>页</span><span>, </span>
				    <span class='totalSize'><span>${roleuserlist.totalCount }</span>条记录 </span>
				</div>
			</c:if>
			<c:if test="${empty roleuserlist.list}">
				<h3 style="margin-top:30px;">还未有用户注册</h3>
			</c:if>
	    </div>
  </body>
</html>
