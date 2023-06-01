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
<title>图书列表</title>
<link rel="stylesheet" type="text/css" href="<%=basePath%>css/frontcss/goodslist.css">
<script type="text/javascript" src="<%=basePath%>js/jQuery/jquery-3.2.1.js"></script>
<script type="text/javascript" src="<%=basePath%>js/frontjs/goodslist.js"></script>
</head>
<body>
	<jsp:include page ="header.jsp" />
	<div class="container">
		<div class="goodlist">
			<h3>图书种类</h3>
			<form action ="goodslist" id="forms" method="POST">
			<div class="form-horizontal checkgoods">
				<div class="form-group col-sm-6">
	                <div class="col-sm-4">
	                	<input type="hidden" value="1" name="currentPage" />
				    	<select id="typeid" name="typeid" class="form-control">
				    		<option value="">全部</option>
				    		<c:forEach items="${goodstypelist}" var="goodstype">
					    		<option value="${goodstype.id }">${goodstype.goodstype }</option>
					    	</c:forEach>
				    	</select>   
	                </div>
	                <div class="col-sm-2">
	                	<input type="submit" value="查询" class="btn btn-primary" />
	                </div>
		        </div>
			</div>
			</form>
			<div class="clearfix"></div>	
			<h3>图书列表</h3>
			<hr>
			<div class="goods">
				<c:forEach items="${goodslist.list}" var="goods"> 
				  <div class="goodslist">
		             <dl>
		               <dt>
		                 <a href="goodsdetails?id=${goods.id }"><img src="/onlinestemp/upload/image/${goods.photourl}" width="220" height="220" border="1"/></a>
		               </dt>
		               <dd class="dd_name">${goods.name }</dd> 
		               <dd class="dd_city">价格:￥ ${goods.price }</dd> 
		             </dl>
		          </div>
				</c:forEach>
			</div>
			<div class="clearfix"></div>
			<hr/>
			<div style="float:right;font-size: 16px;">
			    <a href="goodslist?currentPage=${1}&typeid=${typeid}">首页</a>
			    <c:if test="${goodslist.currentPage>1 }">
			        <a href="goodslist?currentPage=${goodslist.currentPage-1}&typeid=${typeid}">上一页</a>
			    </c:if>
			    
			    <c:if test="${goodslist.totalPage>6 }">
			    	<c:if test="${goodslist.currentPage<5 }">
			    		<c:forEach begin="1" end="6" step="1" var="i">
					        <c:if test="${goodslist.currentPage==i }">
					            <a href="goodslist?currentPage=${i}&typeid=${typeid}"><font color="#ff0000">${i}</font></a>
					        </c:if>
					        <c:if test="${goodslist.currentPage!=i }">
					            <a href="goodslist?currentPage=${i}&typeid=${typeid}">${i}</a>
					        </c:if>
					    </c:forEach>
					    <span>...</span>
			    		<a href="goodslist?currentPage=${goodslist.totalPage}&typeid=${typeid}">${goodslist.totalPage}</a>
			    	</c:if>
			    	<c:if test="${goodslist.currentPage>=5 }">
			    		<c:if test="${goodslist.currentPage<goodslist.totalPage-3 }">
			    			<c:forEach begin="${goodslist.currentPage-2}" end="${goodslist.currentPage+3}" step="1" var="i">
						        <c:if test="${goodslist.currentPage==i }">
						            <a href="goodslist?currentPage=${i}&typeid=${typeid}"><font color="#ff0000">${i}</font></a>
						        </c:if>
						        <c:if test="${goodslist.currentPage!=i }">
						            <a href="goodslist?currentPage=${i}&typeid=${typeid}">${i}</a>
						        </c:if>
						    </c:forEach>
						    <span>...</span>
				    		<a href="goodslist?currentPage=${goodslist.totalPage}&typeid=${typeid}">${goodslist.totalPage}</a>
			    		</c:if>
			    		<c:if test="${goodslist.currentPage>=goodslist.totalPage-3 }">
			    			<a href="goodslist?currentPage=${1}&typeid=${typeid}">1</a>
			    			<span>...</span>
			    			<c:forEach begin="${goodslist.totalPage-4}" end="${goodslist.totalPage}" step="1" var="i">
						        <c:if test="${goodslist.currentPage==i }">
						            <a href="goodslist?currentPage=${i}&typeid=${typeid}"><font color="#ff0000">${i}</font></a>
						        </c:if>
						        <c:if test="${goodslist.currentPage!=i }">
						            <a href="goodslist?currentPage=${i}&typeid=${typeid}">${i}</a>
						        </c:if>
						    </c:forEach>
			    		</c:if>
			    	</c:if>
			    </c:if>
			    <c:if test="${goodslist.totalPage<=6 }">
			    	<c:forEach begin="1" end="${goodslist.totalPage }" step="1" var="i">
				        <c:if test="${goodslist.currentPage==i }">
				            <a href="goodslist?currentPage=${i}&typeid=${typeid}"><font color="#ff0000">${i}</font></a>
				        </c:if>
				        <c:if test="${goodslist.currentPage!=i }">
				            <a href="goodslist?currentPage=${i}&typeid=${typeid}">${i}</a>
				        </c:if>
				    </c:forEach>
			    </c:if>
			    
			    <c:if test="${goodslist.currentPage< goodslist.totalPage }">
			        <a href="goodslist?currentPage=${goodslist.currentPage+1}&typeid=${typeid}">下一页</a>
			    </c:if>
			    <a href="goodslist?currentPage=${goodslist.totalPage}&typeid=${typeid}">末页</a>
			    <span class='totalPages'> 共<span>${goodslist.totalPage }</span>页</span><span>, </span>
			    <span class='totalSize'><span>${goodslist.totalCount }</span>条记录 </span>
			</div>
			<div class="clearfix"></div>	
			<div style="height:90px;width:auto;"></div>
		</div>
	</div>
</body>
</html>