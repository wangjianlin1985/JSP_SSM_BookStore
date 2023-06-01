<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    <title>后台登录</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<link rel="stylesheet" type="text/css" href="<%=basePath%>css/backcss/login.css">
	<link href="<%=basePath%>js/bootstrap/css/bootstrap.css" rel="stylesheet">
	<link href="<%=basePath%>js/bootstrap3-dialog/css/bootstrap-dialog.css" rel="stylesheet">
	
	<script type="text/javascript" src="<%=basePath%>js/jQuery/jquery-3.2.1.js"></script>
	<script type="text/javascript" src="<%=basePath%>js/bootstrap/js/bootstrap.js"></script>
	<script type="text/javascript" src="<%=basePath%>js/bootstrap3-dialog/js/bootstrap-dialog.js"></script>

	<script type="text/javascript" src="<%=basePath%>js/backjs/login.js"></script>
	<script type="text/javascript">

</script>
  </head>
  <body>
      <div class="container">
      	<div class="login1">
    		<h3 class="loginh3">管理员登录</h3>
    		<br/>
    		<div class="form-horizontal">
    			<div class="form-group">
		        	<label class="col-lg-3 control-label">用户名：</label>
		        	<div class="col-lg-7">
		        		<input type="text" id="username" name="username" value="" class="form-control" placeholder="请输入用户名" />
		        	</div>
	        	</div>
		        <div class="form-group">
		        	<label class="col-lg-3 control-label">密码：</label>
		        	<div class="col-lg-7">
		        		<input type="password" id="password" name="password" value="" class="form-control" placeholder="请输入密码" />
		        	</div>
		        </div>
    		</div>
    		<br/>
   			<div style="padding-left: 95px;">
   				<button type="button" class="btn btn-primary" onclick="login()">登录</button>&nbsp;
 				<button type="reset" class="btn btn-danger"  onclick="resetSelectCase()">重置</button>
   			</div>
	     </div>
	   </div>
  </body>
</html>
