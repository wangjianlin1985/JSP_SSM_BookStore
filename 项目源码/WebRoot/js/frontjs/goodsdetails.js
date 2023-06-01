$(function(){
	$("#add").click(function() {
		$(".join-money").val(parseInt($(".join-money").val()) + 1); //点击加号输入框数值加1
	});
	$("#min").click(function(){
		$(".join-money").val(parseInt($(".join-money").val()) - 1); //点击加号输入框数值加1
	    if($(".join-money").val() <=0){
	    	$(".join-money").val("1"); //最小值为1
	    }
	});
	$(".join-money").keyup(function(){
	    var c=$(this);
	    if(/[^\d]/.test(c.val())){//替换非数字字符
	        var amount=c.val().replace(/[^\d]/g,'');
	        $(this).val(amount);
	    }
	});
});

function addshoppingcart(){
	
	$.ajax({
        url : 'addshoppingcart',
        data : 
        {
        	userid : $("#userid").val(),
        	goodsid : $("#goodsid").val(),
        	price : $("#price").val(),
        	count : $("#join-money").val()
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
            }
        }
    });
	
}
