function getContextPath() {
    var pathName = document.location.pathname;
    var index = pathName.substr(1).indexOf("/");
    var result = pathName.substr(0,index+1);
    return result;
}

function addactives(){
	var theme = $("#theme").val();
    var message = $("#message").val();
   
    if(theme.length==0){  
         BootstrapDialog.show({
             title : '操作提示',
             message : "标题不可为空"
         });
         return;
    }
    if(message.length==0){  
    	BootstrapDialog.show({
            title : '操作提示',
            message : "内容不可为空"
        });
        return;
    }
	document.getElementById("addactives").submit();
}

function reset(){
	$("#theme").val("");
	$("#message").val("");
	
}

