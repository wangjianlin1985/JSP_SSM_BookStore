function getContextPath() {
    var pathName = document.location.pathname;
    var index = pathName.substr(1).indexOf("/");
    var result = pathName.substr(0,index+1);
    return result;
}

function addgoods(){
	var price = $("#price").val();
    var goodsname = $("#goodsname").val();
    var title = $("#title").val();
	var descript = $("#descript").val();
	var weight=$("#weight").val();
	var typeid=$("#typeid").val();
	var item_pic=$("#item_pic").val();
	var message_item_pic=$("#message_item_pic").val();
	var count=$("#count").val();
    if(price.length==0){  
         BootstrapDialog.show({
             title : '操作提示',
             message : "价格不可为空"
         });
         return;
    }
    if(goodsname.length==0){  
    	BootstrapDialog.show({
            title : '操作提示',
            message : "商品名不可为空"
        });
        return;
    }
    if(title.length==0){  
    	BootstrapDialog.show({
            title : '操作提示',
            message : "简介不可为空"
        });
        return;
    }
    if(descript.length==0){  
    	BootstrapDialog.show({
            title : '操作提示',
            message : "描述不可为空"
        });
        return;
    }
    if(weight.length==0){  
    	BootstrapDialog.show({
            title : '操作提示',
            message : "商品重量不可为空"
        });
        return;
    }
    if(typeid.length==0){  
    	BootstrapDialog.show({
            title : '操作提示',
            message : "商品类型不可为空"
        });
        return;
    }
    if(item_pic.length==0){  
    	BootstrapDialog.show({
            title : '操作提示',
            message : "商品图片不可为空"
        });
        return;
    }
    if(message_item_pic.length==0){  
    	BootstrapDialog.show({
            title : '操作提示',
            message : "介绍图片不可为空"
        });
        return;
    }
    if(count.length==0){  
    	BootstrapDialog.show({
            title : '操作提示',
            message : "商品数量不可为空"
        });
        return;
    }
	document.getElementById("addgoodsforms").submit();
}

function reset(){
	$("#price").val("");
    $("#goodsname").val("");
    $("#title").val("");
	$("#descript").val("");
	$("#weight").val("");
	$("#typeid").val("");
	$("#item_pic").val("");
	$("#message_item_pic").val("");
	$("#count").val("");
}

