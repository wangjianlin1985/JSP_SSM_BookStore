
function getContextPath() {
    var pathName = document.location.pathname;
    var index = pathName.substr(1).indexOf("/");
    var result = pathName.substr(0,index+1);
    return result;
}

function resetSelectCase(){
	$("#username").val("");
	$("#password").val(""); 
}

function login() {
    var username = $("#username").val();
    var password = $("#password").val();
    var code = $("#code").val(); 
    if(username.length==0){  
         BootstrapDialog.show({
             title : '操作提示',
             message : "用户名不可为空"
         });
         return;
    }
    if(password.length==0){  
    	BootstrapDialog.show({
            title : '操作提示',
            message : "密码不可为空"
        });
        return;
    }
    $.ajax({
        url : 'roleUserLogin',
        data : 
        {
        	username : username,
        	password : password,
        },
        type : 'POST',
        dataType : 'JSON',
        success : function(data, textStatus) {
            if (data.result == 'FAILURE') {
            	BootstrapDialog.show({
                    title : '操作提示',
                    message : data.message
                });
            }else if(data.result == 'SUCCESS'){
            	location.href= getContextPath()+'/jsp/backjsp/index.jsp';
            }
            //location.href = contextPath + "/main.jsp";
        }
    });
}
