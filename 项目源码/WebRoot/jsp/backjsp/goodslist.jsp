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
<title>商品列表</title>
<link rel="stylesheet" type="text/css" href="<%=basePath%>css/backcss/goodslist.css">
<script type="text/javascript" src="<%=basePath%>js/jQuery/jquery-3.2.1.js"></script>
<script type="text/javascript" src="<%=basePath%>js/backjs/goodslist.js"></script>
</head>
<body>
		<div class="goodlist">
			<h3>商品种类</h3>
			
			<form action ="<%=basePath%>back/rolegoodslist" id="forms" method="POST">
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
			<h3>商品列表</h3>
			<c:if test="${!empty goodslist.list}">
				<div class="centeralign">
				<table class="table table-bordered userlist">
				<tr style="height:30px;">
				<td>商品名</td>
				<td>商品类型</td>
				<td>商品价格</td>
				<td>剩余数量</td>
				<td>累计销量</td>
				<td>状态</td>
				<td>入库时间</td>
				<td>操作</td>
				</tr>
				<c:forEach items="${goodslist.list}" var="goods">
				<tr>
				  <td class="cen">${goods.name }</td>
				  <td class="cen">${goods.typename }</td>
				  <td class="cen">${goods.price }</td>	
				  <td class="cen">${goods.count }</td>
				  <td class="cen">${goods.total }</td>
				  <c:if test="${goods.tuijian == 1 }">
				  <td class="cen">推荐</td>
				  </c:if>
				  <c:if test="${goods.tuijian == 0 }">
				  <td class="cen">普通</td>
				  </c:if>
				  <td class="cen">${goods.createdate }</td>
				  <td class="cen">
				  <c:if test="${goods.tuijian == 1 }">
				  <a href="<%=basePath%>back/updategoodstui?id=${goods.id }&tuijian=0" class="btn btn-primary">设为普通</a>&nbsp;&nbsp;<button onclick="updategoodsbyId(${goods.id})" class="btn btn-primary">修改</button>&nbsp;&nbsp;<a href="<%=basePath%>back/deletegoodsbyid?id=${goods.id }" class="btn btn-danger">删除</a>
				  </c:if>
				  <c:if test="${goods.tuijian == 0 }">
				  <a href="<%=basePath%>back/updategoodstui?id=${goods.id }&tuijian=1" class="btn btn-primary">设为推荐</a>&nbsp;&nbsp;<button onclick="updategoodsbyId(${goods.id})"  class="btn btn-primary">修改</button>&nbsp;&nbsp;<a href="<%=basePath%>back/deletegoodsbyid?id=${goods.id }" class="btn btn-danger">删除</a>
				  </c:if>
				  </td>
				</tr>
				</c:forEach>
				</table>
				</div>
				<div class="clearfix"></div>
				
				<div style="float:right;font-size: 16px;">
					<a href="<%=basePath%>back/rolegoodslist?currentPage=${1}&typeid=${typeid}">首页</a>
			    <c:if test="${goodslist.currentPage>1 }">
			        <a href="<%=basePath%>back/rolegoodslist?currentPage=${goodslist.currentPage-1}&typeid=${typeid}">上一页</a>
			    </c:if>
			    
			    <c:if test="${goodslist.totalPage>6 }">
			    	<c:if test="${goodslist.currentPage<5 }">
			    		<c:forEach begin="1" end="6" step="1" var="i">
					        <c:if test="${goodslist.currentPage==i }">
					            <a href="<%=basePath%>back/rolegoodslist?currentPage=${i}&typeid=${typeid}"><font color="#ff0000">${i}</font></a>
					        </c:if>
					        <c:if test="${goodslist.currentPage!=i }">
					            <a href="<%=basePath%>back/rolegoodslist?currentPage=${i}&typeid=${typeid}">${i}</a>
					        </c:if>
					    </c:forEach>
					    <span>...</span>
			    		<a href="<%=basePath%>back/rolegoodslist?currentPage=${goodslist.totalPage}&typeid=${typeid}">${goodslist.totalPage}</a>
			    	</c:if>
			    	<c:if test="${goodslist.currentPage>=5 }">
			    		<c:if test="${goodslist.currentPage<goodslist.totalPage-3 }">
			    			<c:forEach begin="${goodslist.currentPage-2}" end="${goodslist.currentPage+3}" step="1" var="i">
						        <c:if test="${goodslist.currentPage==i }">
						            <a href="<%=basePath%>back/rolegoodslist?currentPage=${i}&typeid=${typeid}"><font color="#ff0000">${i}</font></a>
						        </c:if>
						        <c:if test="${goodslist.currentPage!=i }">
						            <a href="<%=basePath%>back/rolegoodslist?currentPage=${i}&typeid=${typeid}">${i}</a>
						        </c:if>
						    </c:forEach>
						    <span>...</span>
				    		<a href="<%=basePath%>back/rolegoodslist?currentPage=${goodslist.totalPage}&typeid=${typeid}">${goodslist.totalPage}</a>
			    		</c:if>
			    		<c:if test="${goodslist.currentPage>=goodslist.totalPage-3 }">
			    			<a href="<%=basePath%>back/rolegoodslist?currentPage=${1}&typeid=${typeid}">1</a>
			    			<span>...</span>
			    			<c:forEach begin="${goodslist.totalPage-4}" end="${goodslist.totalPage}" step="1" var="i">
						        <c:if test="${goodslist.currentPage==i }">
						            <a href="<%=basePath%>back/rolegoodslist?currentPage=${i}&typeid=${typeid}"><font color="#ff0000">${i}</font></a>
						        </c:if>
						        <c:if test="${goodslist.currentPage!=i }">
						            <a href="<%=basePath%>back/rolegoodslist?currentPage=${i}&typeid=${typeid}">${i}</a>
						        </c:if>
						    </c:forEach>
			    		</c:if>
			    	</c:if>
			    </c:if>
			    <c:if test="${goodslist.totalPage<=6 }">
			    	<c:forEach begin="1" end="${goodslist.totalPage }" step="1" var="i">
				        <c:if test="${goodslist.currentPage==i }">
				            <a href="<%=basePath%>back/rolegoodslist?currentPage=${i}&typeid=${typeid}"><font color="#ff0000">${i}</font></a>
				        </c:if>
				        <c:if test="${goodslist.currentPage!=i }">
				            <a href="<%=basePath%>back/rolegoodslist?currentPage=${i}&typeid=${typeid}">${i}</a>
				        </c:if>
				    </c:forEach>
			    </c:if>
			    
			    <c:if test="${goodslist.currentPage< goodslist.totalPage }">
			        <a href="<%=basePath%>back/rolegoodslist?currentPage=${goodslist.currentPage+1}&typeid=${typeid}">下一页</a>
			    </c:if>
			    <a href="<%=basePath%>back/rolegoodslist?currentPage=${goodslist.totalPage}&typeid=${typeid}">末页</a>
			    <span class='totalPages'> 共<span>${goodslist.totalPage }</span>页</span><span>, </span>
			    <span class='totalSize'><span>${goodslist.totalCount }</span>条记录 </span>
				</div>
			</c:if>
			<c:if test="${empty goodslist.list}">
				<h3 style="margin-top:30px;">还未有商品信息</h3>
			</c:if>
			</div>
			
<div class="modal fade" id="showView" tabindex="-1" role="dialog" >
    <div class="modal-dialog modal-lg" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                <h4 class="modal-title">修改商品信息</h4>
            </div>
            <div class="modal-body">
            <div class="form-horizontal">
            <form action="savegoods" method="post" id="savegoods" enctype="multipart/form-data">
        		<div class="col-sm-12">
        			<div class="form-group col-sm-6">
        				<input type="hidden" id="goodsid" name="id" value="">
		                <label class="col-sm-4 control-label">商品名称:</label>
		                <div class="col-sm-8">
		                    <input class="form-control" type="text" name="name" id = "goodsname">
		                </div>
		            </div>
		            <div class="form-group col-sm-6">
		                <label class="col-sm-4 control-label">价格:</label>
		                <div class="col-sm-8">
		                    <input class="form-control" type="text" name="price" id="price" >
		                </div>
		            </div>
        		</div>
        		<div class="col-sm-12">
        			<div class="form-group col-sm-12">
		                <label class="col-sm-2 control-label">简介:</label>
		                <div class="col-sm-9">
		                    <input class="form-control" type="text" name="title" id = "title">
		                </div>
		            </div>
        		</div>
        		<div class="col-sm-12">
        			<div class="form-group col-sm-12">
		                <label class="col-sm-2 control-label">描述:</label>
		                <div class="col-sm-9">
		                    <textarea class="form-control" name="descript" id="descript"></textarea>
		                </div>
		            </div>
        		</div>
				<div class="col-sm-12">
        			<div class="form-group col-sm-6">
		                <label class="col-sm-4 control-label">商品图片:</label>
		                <div class="col-sm-8">
		                    <input class="form-control" type="file" name="item_pic"/>
		                </div>
		            </div>
        		</div>
        		<div class="col-sm-12">
        			<div class="form-group col-sm-6">
		                <div class="col-sm-8" id="imgs" style="margin-left:130px;">
		                    <img src="" id="photourl" width="100px" height="100px"/>
		                </div>
		            </div>
        		</div>
        	</form>
        	</div>	 
        	<div class="clearfix"></div>
        	<c:if test="${savegoodss == 'SUCCESS' }">
	        	<script type="text/javascript">
	        	BootstrapDialog.show({
	                title : '操作提示',
	                message : "商品信息更新成功"
	            });
	        	</script>
	        </c:if>
	        <c:if test="${addgoodss == 'SUCCESS' }">
	        	<script type="text/javascript">
	        	BootstrapDialog.show({
	                title : '操作提示',
	                message : "商品信息添加成功"
	            });
	        	</script>
	        </c:if>
	        <c:if test="${deletegoodsbyidd == 'SUCCESS' }">
	        	<script type="text/javascript">
	        	BootstrapDialog.show({
	                title : '操作提示',
	                message : "商品信息删除成功"
	            });
	        	</script>
	        </c:if>
            </div>
            <div class="panel-footer" style="text-align: center">
				<div class="" style="padding-left: 10px;">
					<button type="button" onclick="savegoods()" class="btn btn-primary" >提交</button>&nbsp;&nbsp;
					<button type="button" class="btn btn-danger" data-dismiss="modal" aria-hidden="true">关闭</button>
				</div>
			</div>
        </div>
    </div>
</div>

</body>
</html>

