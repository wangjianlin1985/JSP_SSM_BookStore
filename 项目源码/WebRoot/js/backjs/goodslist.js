function getContextPath() {
    var pathName = document.location.pathname;
    var index = pathName.substr(1).indexOf("/");
    var result = pathName.substr(0,index+1);
    return result;
}


function updategoodsbyId(goodsid){
/*	var showView = $('#showView');
	showView.modal("show");*/
	$.ajax({
        url : 'selectgoodsbyId',
        data : 
        {
        	goodsid : goodsid
        },
        type : 'POST',
        dataType : 'JSON',
        success : function(data, textStatus) {
            if (data.RESULT == 'FAILURE') {
            	BootstrapDialog.show({
                    title : '操作提示',
                    message : data.message
                });
            }else if(data.RESULT == 'SUCCESS'){
            	$("#price").val(data.goods.price);
            	$("#goodsid").val(data.goods.id);
            	$("#goodsname").val(data.goods.name);
            	$("#title").val(data.goods.title);
            	$("#descript").val(data.goods.descript);
            	$("#photourl").attr("src",'/onlinestemp/upload/image/'+data.goods.photourl);
            	var showView = $('#showView');
            	showView.modal("show");
            }
        }
    });
}

function savegoods(){
	var price = $("#price").val();
    var goodsname = $("#goodsname").val();
    var title = $("#title").val();
	var descript = $("#descript").val();
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
	document.getElementById("savegoods").submit();
}

