/*-------注册验证-----------*/
$().ready(function() {
	 $("#signupForm").validate({
		rules: {
		   username:{
				required: true,
				rangelength:[6,20]
			   },
		   idcard:{
				required: true,
				rangelength:[18,18]
			   },
			telphone:{
				required: true,
				rangelength:[11,11],
				digits: "只能输入整数"
				},
			password: {
				required: true,
				rangelength:[8,20]
				},
			confirm_password: {
				required: true,
				equalTo: "#password",   
				rangelength:[8,20]
				}
			},
			messages: {
				username:{
					required: "请输入用户名！",
					rangelength: jQuery.format("用户名必须在6~20个字符之间"),
				},
				idcard:{
					required: "请输入身份证号码！",
					rangelength: jQuery.format("身份证号必须在18个字符"),
					creditcard:"您的输入有非法字符",
				},
				telphone:{
					required: "请输入手机号！",
					rangelength: jQuery.format("请输入正确的手机号"),
				},
				password: {
					required: "请输入密码！",
					rangelength: jQuery.format("密码在8~20个字符之间"),
				},
				confirm_password: {
				required: "请输入确认密码！",
				rangelength: jQuery.format("密码在8~20个字符之间"),
				equalTo: "两次输入密码不一致"
			}
		}
	});
});
