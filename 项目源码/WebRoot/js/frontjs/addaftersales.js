function checkaftersales(){
	var type= $("#type").val();
	var cause= $("#cause").val();
	if(type.length==0){  
        BootstrapDialog.show({
            title : '操作提示',
            message : "售后类型不可为空"
        });
        return;
	}
	if(cause.length==0){  
        BootstrapDialog.show({
            title : '操作提示',
            message : "售后原因不可为空"
        });
        return;
	}
	document.getElementById("forms").submit();
}