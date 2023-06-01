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
<title>添加商品种类</title>
<link rel="stylesheet" type="text/css" href="<%=basePath%>css/backcss/addgoods.css">
<script type="text/javascript" src="<%=basePath%>js/jQuery/jquery-3.2.1.js"></script>
<script type="text/javascript" src="<%=basePath%>js/backjs/addgoodstype.js"></script>
</head>
<body>
	<div class="addgoods">
		<h3>添加商品种类</h3>
		<form action ="<%=basePath%>back/addgoodstype" id="addgoodstype" method="POST">
		<div class="form-horizontal checkgoods">
		<c:if test="${roleactivelistfailure== 'SUCCESS' }">
			<script>
			  	BootstrapDialog.show({
                    title : '操作提示',
                    message : '添加商品种类失败'
                });
		  	</script>
		</c:if>
       		<div class="col-sm-12">
       			<div class="form-group col-sm-12">
	                <label class="col-sm-2 control-label">商品种类:</label>
	                <div class="col-sm-9">
	                    <input class="form-control" name="goodstype" id="goodstype" />
	                </div>
	            </div>
       		</div>
		</div>
		<div class="clearfix"></div>
		<div class="" style="padding-left: 130px;">
				<button type="button" onclick="addgoodstype()" class="btn btn-primary" >提交</button>&nbsp;&nbsp;
				<button type="button" onclick="reset()" class="btn btn-danger" >重置</button>
		</div>
		</form>
	</div>	
</body>
</html>

