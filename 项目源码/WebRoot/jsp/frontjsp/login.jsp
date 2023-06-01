<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>登录页</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<link rel="stylesheet" type="text/css" href="<%=basePath%>css/frontcss/login.css">
	<script type="text/javascript" src="<%=basePath%>js/frontjs/login.js"></script>
	<script type="text/javascript">
    function changeImg() {        
        var imgSrc = $("#imgObj");    
        var src = imgSrc.attr("src");        
        imgSrc.attr("src", chgUrl(src));
    }
    
    // 时间戳
    // 为了使每次生成图片不一致，即不让浏览器读缓存，所以需要加上时间戳
    function chgUrl(url) {
        var timestamp = (new Date()).valueOf();
        url = url.substring(0, 23);//这个是截取字符串，因为不同的项目不同的名称，所以截取的长度也不同，所以需要每个项目都更改
        if ((url.indexOf("&") >= 0)) {
            url = url + "×tamp=" + timestamp;
        } else {
            url = url + "?timestamp=" + timestamp;
        }
        return url;
    }

</script>
  </head>
  <body>
  	<jsp:include page ="header.jsp" />
      <div class="container">
      	<div style="width:1140px;margin:0 auto;">
      		<div class="loginheader">
	      		<h2 class="loginh1">欢迎用户登录</h2>
	      	</div>
	      	<div class="row">
	      		<div class="col-lg-6 divbackground">
	      			<img src="<%=basePath%>image/loginleft.jpg" width="580" height="450px">
	      		</div>
	      		<div class="col-lg-6">
	      			<div class="divlogin">
		      			<h3 class="loginh3">账户登录</h3>
		      			<hr>
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
					        <div class="form-group">
					        	<label class="col-lg-3 control-label">验证码：</label>
					        	<div class="col-lg-3">
					        		<input type="text" id="code" name="code" value="" class="form-control"/>
					        	</div>
					        	<div class="col-lg-4">
					        		<img id="imgObj" alt="验证码" src="${pageContext.request.contextPath}/getCode">
					        	</div>
					        </div>
					        <div class="form-group">
					        	<label class="col-lg-3 control-label"></label>
					        	<div class="col-lg-3">
					        		<button class="btn btn-primary" onclick="changeImg()">换一张</button><br/><br/>
					        	</div>
					        </div>
		      			</div>
		      			<hr>
		      			<div style="padding-left: 95px;">
		      				<button type="button" class="btn btn-primary" onclick="login()">登录</button>&nbsp;
		    				<button type="reset" class="btn btn-danger"  onclick="resetSelectCase()">重置</button>
		      			</div>
	      			</div>
	      		</div>
	      	</div>
      	</div>
      </div> 
  </body>
</html>
