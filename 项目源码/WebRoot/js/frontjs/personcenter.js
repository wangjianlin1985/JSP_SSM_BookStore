$(function(){
	$('.lis').click(function(){
		$(this).addClass('active');	
		$('.lis').not($(this)).removeClass('active');
		id = $(this).index('.lis');
		$('.rows').eq(id).show();
		$('.rows').not($('.rows').eq(id)).hide();
	});
	$('.rows').eq(0).show();
	$('.rows').eq(1).hide();
	
});




function checkAddress(){
	if($("#address").val() == ""){
		BootstrapDialog.show({
            title : '操作提示',
            message : "收货地址不能为空"
        });
		return ;
	}
	document.getElementById("addressform").submit();
}