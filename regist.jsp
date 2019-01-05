<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title></title>
<%
	pageContext.setAttribute("APP_PATH", request.getContextPath());
%>
<!-- web路径：
不以/开始的相对路径，找资源，以当前资源的路径为基准，经常容易出问题。
以/开始的相对路径，找资源，以服务器的路径为标准(http://localhost:3306)；需要加上项目名
		http://localhost:3306/crud
 -->
<script type="text/javascript"
	src="${APP_PATH }/static/js/jquery-1.11.1.min.js"></script>
<link
	href="${APP_PATH }/static/bootstrap-3.3.7-dist/css/bootstrap.min.css"
	rel="stylesheet">
<script
	src="${APP_PATH }/static/bootstrap-3.3.7-dist/js/bootstrap.min.js"></script>

<style type="text/css">
@charset "utf-8";
/* track base Css */
.container {
	margin-top: 15px;
}

.red {
	color: red;
}

#ehong-code-input {
	width: 42px;
	letter-spacing: 2px;
	margin: 0px 8px 0px 0px;
}

.ehong-idcode-val {
	position: relative;
	padding: 1px 4px 1px 4px;
	top: 0px;
	*top: -3px;
	letter-spacing: 4px;
	display: inline;
	cursor: pointer;
	font-size: 16px;
	font-family: "Courier New", Courier, monospace;
	text-decoration: none;
	font-weight: bold;
}

.ehong-idcode-val0 {
	border: solid 1px #A4CDED;
	background-color: #ECFAFB;
}

.ehong-idcode-val1 {
	border: solid 1px #A4CDED;
	background-color: #FCEFCF;
}

.ehong-idcode-val2 {
	border: solid 1px #6C9;
	background-color: #D0F0DF;
}

.ehong-idcode-val3 {
	border: solid 1px #6C9;
	background-color: #DCDDD8;
}

.ehong-idcode-val4 {
	border: solid 1px #6C9;
	background-color: #F1DEFF;
}

.ehong-idcode-val5 {
	border: solid 1px #6C9;
	background-color: #ACE1F1;
}

.ehong-code-val-tip {
	font-size: 12px;
	color: #1098EC;
	top: 0px;
	*top: -3px;
	position: relative;
	margin: 0px 0px 0px 4px;
	cursor: pointer;
}
</style>
<script type="text/javascript" src="${APP_PATH}/static/js/login.js"></script>

<script type="text/javascript">
	$(function() {

		//后端验证用户名是否重复
		$("#username_input").change(function() {
			var username = this.value;
			//发送ajax请求到服务端
			$.ajax({
				url : "${APP_PATH}/checkuser",
				type : "POST",
				data : "username=" + username,
				success : function(result) {
					console.log(result);
					if (result.code == 100) {
						show_validate_msg("#username_input", "success", "用户名可用");
						//为了解决用户名不可用也会保存问题，给保存按钮添加一个属性，若可用添加success，若不可用添加error
						$("#regist_btn").attr("ajax-va", "success");
					} else {
						show_validate_msg("#username_input", "error", result.extend.va_msg);
						$("#regist_btn").attr("ajax-va", "error");
					}
				}
			});
		});

		//点击注册按钮提交数据到数据库
		$("#regist_btn").click(function() {
			//1.先验证表单数据是否符合规则
			if (!validate_add_form()) {
				return false;
			}
			//2.验证保存按钮的属性来确定 用户名是否可用
			if ($(this).attr("ajax-va") == "error") {
				alert("用户名已存在");
				return false;
			}
			var formstr = "username=" + $("#username_input").val() + "&password=" + $("#password_input").val()
			+ "&email=" + $("#email_input").val() + "&paypwd=" + $("#paypwd_input").val();
			//如果验证全部通过，发送ajax保存注册信息到数据库
			$.ajax({
				url : "${APP_PATH}/emp",
				type : "POST",
				data : formstr,
				success : function(result) {
					if (result.code == 100) {
						alert("恭喜您，注册成功！");
						//注册成功后重置表单内容
						reset();
					}
				}
			});
		});

		//前端验证密码
		$("#password_input").change(function() {
			var password = $(this).val();

			if (password.length < 8) {
				show_validate_msg("#password_input", "error", "密码太短，不能少于8个字符");
			} else if (atLeastTwo(password) < 2) {
				show_validate_msg("#password_input", "error", "密码中至少包含字母、数字、特殊字符的两种");
			} else {
				show_validate_msg("#password_input", "success", "密码可用");
			}
		});

		//前端验证确认密码
		$("#passwordConfirm_input").change(function() {
			if (($(this).val() == $("#password_input").val()) & ($("#password_input").val() != "")) {
				show_validate_msg("#passwordConfirm_input", "success", "密码一致");
			} else {
				show_validate_msg("#passwordConfirm_input", "error", "密码不能为空或两次输入密码不一致");
			}
		});

		//前端验证支付密码
		$("#paypwd_input").change(function() {
			var password = $(this).val();

			if (password.length < 8) {
				show_validate_msg("#paypwd_input", "error", "密码太短，不能少于8个字符");
			} else if (atLeastTwo(password) < 2) {
				show_validate_msg("#paypwd_input", "error", "密码中至少包含字母、数字、特殊字符的两种");
			} else {
				show_validate_msg("#paypwd_input", "success", "密码可用");
			}
		});

		//前端验证确认支付密码
		$("#paypwdConfirm_input").change(function() {
			if (($(this).val() == $("#paypwd_input").val()) & ($("#paypwd_input").val() != "")) {
				show_validate_msg("#paypwdConfirm_input", "success", "密码一致");
			} else {
				show_validate_msg("#paypwdConfirm_input", "error", "密码不能为空或两次输入密码不一致");
			}
		});

		//前端验证邮箱
		$("#email_input").change(function() {
			var email = $("#email_input").val();
			//正则表达式
			var regEmail = /^([a-z0-9_\.-]+)@([\da-z\.-]+)\.([a-z\.]{2,6})$/;
			if (!regEmail.test(email)) {
				//alert("邮箱格式不正确");
				show_validate_msg("#email_input", "error", "邮箱格式不正确");
			} else {
				show_validate_msg("#email_input", "success", "");
			}
		});

		//点击重置按钮清除所有input验证状态
		$("#reset_btn").click(function() {
			$("#username_input").parent().removeClass("has-success has-error");
			$("#password_input").parent().removeClass("has-success has-error");
			$("#passwordConfirm_input").parent().removeClass("has-success has-error");
			$("#email_input").parent().removeClass("has-success has-error");
			$("#paypwd_input").parent().removeClass("has-success has-error");
			$("#paypwdConfirm_input").parent().removeClass("has-success has-error");
			$(".help-block").text("");
		});

	});

	//重置节点内容
	function reset() {
		$("#username_input").parent().removeClass("has-success has-error");
		$("#password_input").parent().removeClass("has-success has-error");
		$("#passwordConfirm_input").parent().removeClass("has-success has-error");
		$("#email_input").parent().removeClass("has-success has-error");
		$("#paypwd_input").parent().removeClass("has-success has-error");
		$("#paypwdConfirm_input").parent().removeClass("has-success has-error");
		$(".help-block").text("");
		$("#username_input").val("");
		$("#password_input").val("");
		$("#passwordConfirm_input").val("");
		$("#email_input").val("");
		$("#paypwd_input").val("");
		$("#paypwdConfirm_input").val("");
	}

	//点击注册按钮时调用此方法验证各input是否都合法
	function validate_add_form() {
		var username = $("#username_input").val();
		var password = $("#password_input").val();
		var passwordConfirm = $("#passwordConfirm_input").val();
		var email = $("#email_input").val();
		var paypwd = $("#paypwd_input").val();
		var paypwdConfirm = $("#paypwdConfirm_input").val();

		//验证用户名
		var reg = /(^[a-zA-Z0-9_-]{6,16}$)|(^[\u2E80-\u9FFF]{2,5})/;
		
		if (username == "") {
			show_validate_msg("#username_input", "error", "用户名不能为空");
			return false;
		}

		//验证密码
		if (password == "") {
			show_validate_msg("#password_input", "error", "密码不能为空");
			return false;
		} else if (password.length < 8) {
			show_validate_msg("#password_input", "error", "密码太短，不能少于8个字符");
			return false;
		} else if (atLeastTwo(password) < 2) {
			show_validate_msg("#password_input", "error", "密码中至少包含字母、数字、特殊字符的两种");
			return false;
		} else {
			show_validate_msg("#password_input", "success", "密码可用");
		}

		//验证确认密码
		if (passwordConfirm == "") {
			show_validate_msg("#passwordConfirm_input", "error", "请再次输入密码");
			return false;
		} else if (passwordConfirm == password) {
			show_validate_msg("#passwordConfirm_input", "success", "密码一致");
		} else {
			show_validate_msg("#passwordConfirm_input", "error", "密码不一致");
			return false;
		}

		//验证支付密码
		if (paypwd == "") {
			show_validate_msg("#paypwd_input", "error", "密码不能为空");
			return false;
		} else if (paypwd.length < 8) {
			show_validate_msg("#paypwd_input", "error", "密码太短，不能少于8个字符");
			return false;
		} else if (atLeastTwo(paypwd) < 2) {
			show_validate_msg("#paypwd_input", "error", "密码中至少包含字母、数字、特殊字符的两种");
			return false;
		} else {
			show_validate_msg("#paypwd_input", "success", "密码可用");
		}

		//验证确认支付密码
		if (paypwdConfirm == "") {
			show_validate_msg("#paypwdConfirm_input", "error", "请再次输入密码");
			return false;
		} else if (paypwdConfirm == paypwd) {
			show_validate_msg("#paypwdConfirm_input", "success", "密码一致");
		} else {
			show_validate_msg("#paypwdConfirm_input", "error", "密码不一致");
			return false;
		}

		//验证邮箱
		if (email == "") {
			show_validate_msg("#email_input", "error", "邮箱不能为空");
			return false;
		} else
			var regEmail = /^([a-z0-9_\.-]+)@([\da-z\.-]+)\.([a-z\.]{2,6})$/;
		if (!regEmail.test(email)) {
			//alert("邮箱格式不正确");
			show_validate_msg("#email_input", "error", "邮箱格式不正确");
			return false;
		} else {
			show_validate_msg("#email_input", "success", "");
		}

		return true;
	}

	// 密码匹配:
	// 匹配字母、数字、特殊字符至少两种的函数
	function atLeastTwo(password) {
		//密码规则
		var regPasswordSpecial = /[~!@#%&=;':",./<>_\}\]\-\$\(\)\*\+\.\[\?\\\^\{\|]/;
		var regPasswordAlpha = /[a-zA-Z]/;
		var regPasswordNum = /[0-9]/;

		var a = regPasswordSpecial.test(password) ? 1 : 0;
		var b = regPasswordAlpha.test(password) ? 1 : 0;
		var c = regPasswordNum.test(password) ? 1 : 0;
		return a + b + c;
	}


	//显示错误（红色）成功（绿色）提示
	function show_validate_msg(ele, status, msg) {
		//清除之前验证状态
		$(ele).parent().removeClass("has-success has-error");

		if ("success" == status) {
			$(ele).parent().addClass("has-success");
			$(ele).parent().next("span").text(msg);
		} else if ("error" == status) {
			$(ele).parent().addClass("has-error");
			$(ele).parent().next("span").text(msg);
		}
	}
</script>
</head>

<body>
	<div class="container">
		<div class="col-md-6 col-md-offset-3">
			<form id="form">
				<div class="form-group has-feedback">
					<label for="username">用户名</label>
					<div class="input-group">
						<span class="input-group-addon"><span
							class="glyphicon glyphicon-user"></span></span> <input
							id="username_input" name="username" class="form-control"
							placeholder="请输入用户名" maxlength="20" type="text">
					</div>
					<span class="help-block"></span>
				</div>

				<div class="form-group has-feedback">
					<label for="password">密码</label>
					<div class="input-group">
						<span class="input-group-addon"><span
							class="glyphicon glyphicon-lock"></span></span> <input
							id="password_input" name="password" class="form-control"
							placeholder="请输入密码" maxlength="20" type="password">
					</div>
					<span class="help-block"></span>
				</div>

				<div class="form-group has-feedback">
					<label for="passwordConfirm">确认密码</label>
					<div class="input-group">
						<span class="input-group-addon"><span
							class="glyphicon glyphicon-lock"></span></span> <input
							id="passwordConfirm_input" class="form-control"
							placeholder="请再次输入密码" maxlength="20" type="password">
					</div>
					<span class="help-block"></span>
				</div>


				<div class="form-group has-feedback">
					<label for="password">支付密码</label>
					<div class="input-group">
						<span class="input-group-addon"><span
							class="glyphicon glyphicon-usd"></span></span> <input id="paypwd_input"
							name="paypwd" class="form-control" placeholder="请输入支付密码"
							maxlength="20" type="password">
					</div>
					<span class="help-block"></span>
				</div>

				<div class="form-group has-feedback">
					<label for="passwordConfirm">确认支付密码</label>
					<div class="input-group">
						<span class="input-group-addon"><span
							class="glyphicon glyphicon-usd"></span></span> <input
							id="paypwdConfirm_input" class="form-control"
							placeholder="请再次输入支付密码" maxlength="20" type="password">
					</div>
					<span class="help-block"></span>
				</div>



				<div class="form-group has-feedback">
					<label for="email">邮箱</label>
					<div class="input-group">
						<span class="input-group-addon"><span
							class="glyphicon glyphicon-envelope"></span></span> <input
							id="email_input" name="email" class="form-control"
							placeholder="请输入邮箱" maxlength="21" type="text">
					</div>
					<span class="help-block"></span>
				</div>
				<br>
				<div class="form-group">
					<input class="form-control btn btn-primary" id="regist_btn"
						value="立&nbsp;&nbsp;即&nbsp;&nbsp;注&nbsp;&nbsp;册">
				</div>

				<div class="form-group">
					<input value="重&nbsp;&nbsp;置" id="reset_btn"
						class="form-control btn btn-danger" type="reset">
				</div>

				<div class="form-group">
					<a class="form-control btn  btn-success" href="login.jsp"
						role="button">返&nbsp;&nbsp;回&nbsp;&nbsp;登&nbsp;&nbsp;录</a>
				</div>
			</form>
		</div>
	</div>
</body>
</html>
