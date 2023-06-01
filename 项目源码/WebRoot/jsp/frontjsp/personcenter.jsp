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
<title>个人中心</title>
<link rel="stylesheet" type="text/css" href="<%=basePath%>css/frontcss/personcenter.css">
<script type="text/javascript" src="<%=basePath%>js/jQuery/jquery-3.2.1.js"></script>
<script type="text/javascript" src="<%=basePath%>js/frontjs/personcenter.js"></script>
</head>
<body>
	<jsp:include page ="header.jsp" />
	<div class="container">
		<div class="person">
			<h3>个人资料</h3>
			<ul class="nav nav-pills uls">
            	<li class="active lis"><a href="javascript:void(0);">基本资料</a></li>
                <li class="lis"><a href="javascript:void(0);">地址管理</a></li>
            </ul>
            <div class="rows">
            	<div class="usermessage">
            		<form action="updateuser" method="POST">
            		<div class="form-horizontal">
	      				<div class="form-group firsttop">
				        	<label class="col-lg-2 control-label">性别：</label>
				        	<div class="col-lg-4">
				        		<c:if test="${users.sex == 1 }">
				        			<input type="radio" name="sex" id="secret_radio" value="0">保密
									<input type="radio" name="sex" id="man_radio"  value="1" checked="checked">男
									<input type="radio" name="sex" id="woman_radio" value="2">女
				        		</c:if>
				        		<c:if test="${users.sex == 2 }">
				        			<input type="radio" name="sex" id="secret_radio" value="0">保密
									<input type="radio" name="sex" id="man_radio"  value="1">男
									<input type="radio" name="sex" id="woman_radio" value="2" checked="checked">女
				        		</c:if>
				        		<c:if test="${users.sex eq null}">
				        			<input type="radio" name="sex" id="secret_radio" value="0">保密
									<input type="radio" name="sex" id="man_radio"  value="1">男
									<input type="radio" name="sex" id="woman_radio" value="2">女
				        		</c:if>
				        	</div>
				        </div>
				        <c:if test="${userupdate == 'SUCCESS' }">
				        	<script type="text/javascript">
				        	BootstrapDialog.show({
				                title : '操作提示',
				                message : "更新成功"
				            });
				        	</script>
				        </c:if>
				        <c:if test="${userupdate == 'FAILURE' }">
				        	<script type="text/javascript">
				        	BootstrapDialog.show({
				                title : '操作提示',
				                message : "更新失败"
				            });
				        	</script>
				        </c:if>
				        <div class="form-group">
				        	<label class="col-lg-2 control-label">邮箱：</label>
				        	<div class="col-lg-4">
				        		<input type="text" id="email" name="email" value="${users.email}" />
				        	</div>
				        </div>
				        <div class="form-group">
				        	<label class="col-lg-2 control-label">年龄：</label>
				        	<div class="col-lg-4">
				                <input id="age" type="text" name="age" class="form-control" value="${users.age }"/>
				        	</div>
				        </div>
				        <div class="form-group">
				        	<label class="col-lg-2 control-label">手机号：</label>
				        	<div class="col-lg-4">
				                <input id="mobile" type="text" name="mobile" class="form-control" value="${users.mobile }"/>
				        	</div>
				        </div>
				        <div class="form-group">
				        	<label class="col-lg-2 control-label">个性签名：</label>
				        	<div class="col-lg-4">
				                <input id="mobile" type="text" name="usersign" class="form-control" value="${users.usersign }"/>
				        	</div>
				        </div>
				        <input type="hidden" name="userid" value="${sessionScope.user.id }" />
	      			</div>
		      		<div style="padding-left: 490px;padding-top:10px;">
		      			<button type="submit" class="btn btn-primary" >提交</button>
		      		</div>
		      		</form>
            	</div>
            </div>
            <div class="rows">
            	<div class="addressmessage">
            	<h4 style="padding-top:30px;margin-left:110px; font-weight: bold;">添加地址</h4>
            	<form action="insertaddress" method="POST" id="addressform">
            		<div class="form-horizontal">
	      				<div class="form-group firsttop">
	      					<label class="col-lg-2 control-label">地址：</label>
				        	<div class="col-lg-4">
				                <input id="address" type="text" name="address" class="form-control"/>
				                <input type="hidden" name="userid" value="${sessionScope.user.id }" />
				        	</div>
				        	<div class="col-lg-1">
				        	<button type="button" class="btn btn-primary" onclick="checkAddress()">提交</button>
				        	</div>
	      				</div>
	      			</div>
            	</form>
            	<c:if test="${insertaddress == 'SUCCESS' }">
            		<script type="text/javascript">
			        	BootstrapDialog.show({
			                title : '操作提示',
			                message : "新增地址成功"
			            });
		        	</script>
            	</c:if>
            	<c:if test="${insertaddress == 'FAILURE' }">
            		<script type="text/javascript">
			        	BootstrapDialog.show({
			                title : '操作提示',
			                message : "新增地址失败"
			            });
		        	</script>
            	</c:if>
            	<c:if test="${count8 == 'SUCCESS' }">
            		<script type="text/javascript">
			        	BootstrapDialog.show({
			                title : '操作提示',
			                message : "地址最多存8个，请删除其中一个再试"
			            });
		        	</script>
            	</c:if>
            	<h4 style="padding-top:30px;margin-left:110px; font-weight: bold;">地址列表</h4>
	            	<div class="addresslist">
	            		<table class=" table table-bordered">
	            		<tr>
	            			<td>地址名称</td>
	            			<td>添加时间</td>
	            			<td>操作</td>
	            		</tr>
	            		<c:forEach items="${adresslist}" var="address">
	            			<tr>
	            				<td>${address.address }</td>
	            				<td>${address.createdate }</td>
	            				<td><a href="deleteaddressbyid?userid=${address.userid }&id=${address.id}">删除</a></td>
	            			</tr>
	            		</c:forEach>
	            		</table>
	            	</div>
	            	<c:if test="${deleteaddress == 'SUCCESS' }">
	            		<script type="text/javascript">
			        	BootstrapDialog.show({
			                title : '操作提示',
			                message : "地址删除成功"
			            });
		        	</script>
	            	</c:if>
	            	<c:if test="${deleteaddress == 'FAILURE' }">
	            		<script type="text/javascript">
			        	BootstrapDialog.show({
			                title : '操作提示',
			                message : "地址删除失败"
			            });
		        	</script>
	            	</c:if>
            	</div>
            </div>
		</div>
	</div>
</body>
</html>
