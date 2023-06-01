function getContextPath() {
    var pathName = document.location.pathname;
    var index = pathName.substr(1).indexOf("/");
    var result = pathName.substr(0,index+1);
    return result;
}


function addshoppingcart(){
	var str = "";
    $("input[type='checkbox']:checked").each(function(){ 
        var s = (this.value).toString();
        if(str ==""){
        	str = s;
        }else{
        	str = str+','+s;
        }
    })
	if(str == ""){
		BootstrapDialog.show({
            title : '操作提示',
            message : "请选择一件商品结算"
        });
		return ;
	}else{
		if($("#address").val() == ""){
			BootstrapDialog.show({
	            title : '操作提示',
	            message : "请选择商品收货地址"
	        });
			return ;
		}
		$.ajax({
	        url : 'addorder',
	        data : 
	        {
	        	userid : $("#userid").val(),
	        	goodslist : str,
	        	address : $("#address").val()
	        },
	        type : 'POST',
	        dataType : 'JSON',
	        success : function(data, textStatus) {
	            if (data.RESULT == 'FAILURE') {
	            	BootstrapDialog.show({
	                    title : '操作提示',
	                    message : data.MESSAGE
	                });
	            }else if(data.RESULT == 'SUCCESS'){
	            	BootstrapDialog.show({
	                    title : '操作提示',
	                    message : data.MESSAGE
	                });
	                location.href= getContextPath()+'/shoppingcartlist?userid='+$("#userid").val()+'';     
	            }
	        }
	    });
	}	
}

$(function(){
	$.ajax({
	    url : 'selectaddressbyid',
	    data : 
	    {
	    	userid : $("#userid").val(),
	    },
	    type : 'POST',
	    dataType : 'JSON',
	    success : function(data, textStatus) {
	        if(data.RESULT == 'SUCCESS'){
	        	var addresslist = data.addresslist;
				for (var i = 0; i < addresslist.length; i ++) {
					var sel = undefined;
					sel = $("#address");
					if (sel != undefined) {
						sel.append("<option value='"+addresslist[i].id+"'>"+addresslist[i].address+"</option>");
					}
				}
	        }
	    }
	});
});