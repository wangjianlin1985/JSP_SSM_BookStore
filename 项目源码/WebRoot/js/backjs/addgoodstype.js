function getContextPath() {
    var pathName = document.location.pathname;
    var index = pathName.substr(1).indexOf("/");
    var result = pathName.substr(0,index+1);
    return result;
}

function addgoodstype(){
	var goodstype = $("#goodstype").val();
    
    if(goodstype.length==0){  
         BootstrapDialog.show({
             title : '操作提示',
             message : "商品种类不可为空"
         });
         return;
    }
	document.getElementById("addgoodstype").submit();
}

function reset(){
	$("#goodstype").val("");
}

