function getContextPath() {
    var pathName = document.location.pathname;
    var index = pathName.substr(1).indexOf("/");
    var result = pathName.substr(0,index+1);
    return result;
}

$(document).ready(function(){
	$("#username").blur(function(){
		if($("#username").val().length<2){
			BootstrapDialog.show({
	             title : '操作提示',
	             message : "用户名长度太短,必须大于2个字母或者两个汉字"
	        });
			return;
		}
	});
	$("#passwordtwo").blur(function(){
		if($("#passwordtwo").val()!=$("#password").val()){
			BootstrapDialog.show({
	             title : '操作提示',
	             message : "前后输入的两次密码不同，请重新输入"
	        });
			return;
		}
	});
});

function resetSelectCase(){
	$("#username").val("");
	$("#password").val("");
	$("#passwordtwo").val("");
	$("#email").val(""); 
}

function register() {
    var username = $("#username").val();
    var password = $("#password").val();
    var passwordtwo = $("#passwordtwo").val();
    var email = $("#email").val();
    $("#username").blur(function(){
		if($("#username").val().length<2){
			BootstrapDialog.show({
	             title : '操作提示',
	             message : "用户名长度太短,必须大于2个字母或者两个汉字"
	        });
			return;
		}
	});
    $("#password").blur(function(){
    	if($("#username").val().length<4){
			BootstrapDialog.show({
	             title : '操作提示',
	             message : "密码太短，请重新输入"
	        });
			return;
		}
	});
	$("#passwordtwo").blur(function(){
		if($("#passwordtwo").val()!=$("#password").val()){
			BootstrapDialog.show({
	             title : '操作提示',
	             message : "前后输入的两次密码不同，请重新输入"
	        });
			return;
		}
	});
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
    if(passwordtwo.length==0){  
    	BootstrapDialog.show({
            title : '操作提示',
            message : "确认密码不可为空"
        });
        return;
    }
    if(email.length==0){  
    	BootstrapDialog.show({
            title : '操作提示',
            message : "邮箱不可为空"
        });
        return;
    }
    $.ajax({
        url : 'register',
        data : 
       {
        	username : username,
        	password : password,
        	passwordtwo : passwordtwo,
        	email : email
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
            	BootstrapDialog.show({
                    title : '操作提示',
                    message : "用户注册成功，请直接登录"
                });
            }
        }
    });
}