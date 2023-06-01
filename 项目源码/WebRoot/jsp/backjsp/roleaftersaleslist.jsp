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
<title>售后列表</title>
<link rel="stylesheet" type="text/css" href="<%=basePath%>css/backcss/goodslist.css">
<script type="text/javascript" src="<%=basePath%>js/jQuery/jquery-3.2.1.js"></script>
<script type="text/javascript" src="<%=basePath%>js/backjs/goodslist.js"></script>
</head>
<body>
			<div class="goodlist">
			<h3>售后状态</h3>
			<form action ="<%=basePath%>back/roleaftersaleslist" id="forms" method="POST">
			<div class="form-horizontal checkgoods">
				<div class="form-group col-sm-6">
	                <div class="col-sm-4">
	                	<input type="hidden" value="1" name="currentPage" />
				    	<select id="status" name="status" class="form-control">
				    		<option value="">全部</option>
				    		<option value="1">未处理</option>
				    		<option value="2">已完成</option>
				    	</select>   
	                </div>
	                <div class="col-sm-2">
	                	<input type="submit" value="查询" class="btn btn-primary" />
	                </div>
		        </div>
			</div>
			</form>
			<div class="clearfix"></div>	
				<h3>订单详情</h3>			
					<c:if test="${updateinstall == 'SUCCESS' }">
				  	   <script>
					  	  BootstrapDialog.show({
		                      title : '操作提示',
		                      message : '商品已售后完成'
		                  });
				  	   </script>
				    </c:if>	
					<c:if test="${!empty roleaftersaleslist.list}">
						<table class="table table-bordered orderlist">
						<tr>
						<td>商品</td>
						<td>订单号</td>
						<td>创建时间</td>
						<td>收货人</td>
						<td>售后类型</td>
						<td>售后原因</td>
						<td>进度</td>
						<td>操作</td>
						</tr>
						<c:forEach items="${roleaftersaleslist.list}" var="aftersales">
						<tr>
						  <td>
						  <div style="float:left;"><p>${aftersales.name }&nbsp;&nbsp;${aftersales.title }</p></div>
						  </td>
						  <td>${aftersales.ordernum }</td>
						  <td>${aftersales.createdate }</td>
						  <td>${aftersales.username }</td>
						  <c:if test="${aftersales.type==1 }">
						  	<td>换货</td>
						  </c:if>
						  <c:if test="${aftersales.type==2 }">
						  	<td>退货</td>
						  </c:if>
						  <td>${aftersales.cause }</td>
						  
						  <c:if test="${aftersales.status==1 }">
						  	<td>未处理</td>
						  </c:if>
						  <c:if test="${aftersales.status==2 }">
						  	<td>已完成</td>
						  </c:if>
						  <c:if test="${aftersales.status==1 }">
						  	<td><a href="<%=basePath%>back/roleupdateaftersales?type=${aftersales.type }&orderid=${aftersales.orderid }&userid=${aftersales.userid }&goodsid=${aftersales.goodsid}">售后完成</a></td>
						  </c:if>
						  <c:if test="${aftersales.status==2 }">
						  	<td>已完成售后</td>
						  </c:if>
						</tr>
						</c:forEach>
						</table>
						<div class="clearfix"></div>
						<div style="float:right;font-size: 16px;">
						    <a href="<%=basePath%>back/roleaftersaleslist?currentPage=${1}&status=${status}">首页</a>
						    <c:if test="${roleaftersaleslist.currentPage>1 }">
						        <a href="<%=basePath%>back/roleaftersaleslist?currentPage=${roleaftersaleslist.currentPage-1}&status=${status}">上一页</a>
						    </c:if>
						    
						    <c:if test="${roleaftersaleslist.totalPage>6 }">
						    	<c:if test="${roleaftersaleslist.currentPage<5 }">
						    		<c:forEach begin="1" end="6" step="1" var="i">
								        <c:if test="${roleaftersaleslist.currentPage==i }">
								            <a href="<%=basePath%>back/roleaftersaleslist?currentPage=${i}&status=${status}"><font color="#ff0000">${i}</font></a>
								        </c:if>
								        <c:if test="${roleaftersaleslist.currentPage!=i }">
								            <a href="<%=basePath%>back/roleaftersaleslist?currentPage=${i}&status=${status}">${i}</a>
								        </c:if>
								    </c:forEach>
								    <span>...</span>
						    		<a href="<%=basePath%>back/roleaftersaleslist?currentPage=${roleaftersaleslist.totalPage}&status=${status}">${roleaftersaleslist.totalPage}</a>
						    	</c:if>
						    	<c:if test="${roleaftersaleslist.currentPage>=5 }">
						    		<c:if test="${roleaftersaleslist.currentPage<roleaftersaleslist.totalPage-3 }">
						    			<c:forEach begin="${roleaftersaleslist.currentPage-2}" end="${roleaftersaleslist.currentPage+3}" step="1" var="i">
									        <c:if test="${roleaftersaleslist.currentPage==i }">
									            <a href="<%=basePath%>back/roleaftersaleslist?currentPage=${i}&status=${status}"><font color="#ff0000">${i}</font></a>
									        </c:if>
									        <c:if test="${roleaftersaleslist.currentPage!=i }">
									            <a href="<%=basePath%>back/roleaftersaleslist?currentPage=${i}&status=${status}">${i}</a>
									        </c:if>
									    </c:forEach>
									    <span>...</span>
							    		<a href="<%=basePath%>back/roleaftersaleslist?currentPage=${roleaftersaleslist.totalPage}&status=${status}">${roleaftersaleslist.totalPage}</a>
						    		</c:if>
						    		<c:if test="${roleaftersaleslist.currentPage>=roleaftersaleslist.totalPage-3 }">
						    			<a href="<%=basePath%>back/roleaftersaleslist?currentPage=${1}&status=${status}">1</a>
						    			<span>...</span>
						    			<c:forEach begin="${roleaftersaleslist.totalPage-4}" end="${roleaftersaleslist.totalPage}" step="1" var="i">
									        <c:if test="${roleaftersaleslist.currentPage==i }">
									            <a href="<%=basePath%>back/roleaftersaleslist?currentPage=${i}&status=${status}"><font color="#ff0000">${i}</font></a>
									        </c:if>
									        <c:if test="${roleaftersaleslist.currentPage!=i }">
									            <a href="<%=basePath%>back/roleaftersaleslist?currentPage=${i}&status=${status}">${i}</a>
									        </c:if>
									    </c:forEach>
						    		</c:if>
						    	</c:if>
						    </c:if>
						    <c:if test="${roleaftersaleslist.totalPage<=6 }">
						    	<c:forEach begin="1" end="${roleaftersaleslist.totalPage }" step="1" var="i">
							        <c:if test="${roleaftersaleslist.currentPage==i }">
							            <a href="<%=basePath%>back/roleaftersaleslist?currentPage=${i}&status=${status}"><font color="#ff0000">${i}</font></a>
							        </c:if>
							        <c:if test="${roleaftersaleslist.currentPage!=i }">
							            <a href="<%=basePath%>back/roleaftersaleslist?currentPage=${i}&status=${status}">${i}</a>
							        </c:if>
							    </c:forEach>
						    </c:if>
						    
						    <c:if test="${roleaftersaleslist.currentPage< roleaftersaleslist.totalPage }">
						        <a href="<%=basePath%>back/roleaftersaleslist?currentPage=${roleaftersaleslist.currentPage+1}&status=${status}">下一页</a>
						    </c:if>
						    <a href="<%=basePath%>back/roleaftersaleslist?currentPage=${roleaftersaleslist.totalPage}&status=${status}">末页</a>
						    <span class='totalPages'> 共<span>${roleaftersaleslist.totalPage }</span>页</span><span>, </span>
						    <span class='totalSize'><span>${roleaftersaleslist.totalCount }</span>条记录 </span>
						</div>
					</c:if>
					<c:if test="${empty roleaftersaleslist.list}">
						<h3 style="margin-top:30px;">还未有售后记录</h3>
					</c:if>
			</div>
</body>
</html>