<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head lang="en">
<meta charset="UTF-8">
<title>登录</title>
<%
	pageContext.setAttribute("APP_PATH",request.getContextPath());
%>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=no">
<meta name="format-detection" content="telephone=no">
<meta name="renderer" content="webkit">
<meta http-equiv="Cache-Control" content="no-siteapp" />

<link rel="stylesheet" href="${APP_PATH}/static/css/amazeui.css" />
<link href="${APP_PATH}/static/css/dlstyle.css" rel="stylesheet"
	type="text/css">
<script type="text/javascript"
	src="${APP_PATH}/static/js/jquery-1.11.1.min.js"></script>

<script type="text/javascript">
	$(function() {
		//点击登录按钮校验用户名和密码匹配
		$("#submit_link").click(function() {

			//首先验证是否为空
			if (!check_not_empty()) {
				return false;
			}
			//发送ajax到数据库验证是否匹配
			$.ajax({
				url : "${APP_PATH}/checklogin",
				type : "POST",
				data : {
					username : $("#username_input").val(),
					password : $("#password_input").val()
				},
				success : function(result) {
					if (result.code == 100) {
						alert("登录成功");
						window.location.href = "${APP_PATH}/index.jsp";
					} else {
						alert("用户名和密码不匹配");
					}
				}
			});
		});
	});

	//验证不能为空
	function check_not_empty() {
		var username = $("#username_input").val();
		var password = $("#password_input").val();
		if (username == "") {
			alert("请输入用户名");
			return false;
		}
		if (password == "") {
			alert("请输密码");
			return false;
		}
		return true
	}
</script>
</head>
<body>
	
	<div class="login-boxtitle">
		<a href="#"><img alt="logo"
			src="${APP_PATH}/static/images/logobig.png" /></a>
	</div>

	<div class="login-banner">
		<div class="login-main">
			<div class="login-banner-bg">
				<span></span><img src="${APP_PATH}/static/images/big.jpg" />
			</div>
			<div class="login-box">
				<h3 class="title">登录</h3>
				<div class="clear"></div>
				<div class="login-form">
					<form>
						<div class="user-name">
							<label for="user"><i class="am-icon-user">&nbsp;</i></label> <input
								type="text" name="username" id="username_input"
								placeholder="用户名">
						</div>

						<div class="user-pass">
							<label for="password"><i class="am-icon-lock">&nbsp;</i></label>
							<input type="password" name="password" id="password_input"
								placeholder="请输入密码">
						</div>
					</form>
				</div>
				<div class="login-links">
					<label for="remember-me"><input id="remember-me"
						type="checkbox">记住密码</label> <a href="#" class="am-fr">忘记密码</a> <a
						href="regist.jsp" class="zcnext am-fr am-btn-default">注册</a> <br />
				</div>
				<div class="am-cf">
					<a class="am-btn am-btn-primary am-btn-xs" id="submit_link">登录</a>
				</div>
				<div class="partner">
					<h3>合作账号</h3>
					<div class="am-btn-group">
						<li><a href="#"><i class="am-icon-qq am-icon-sm">&nbsp;</i><span>QQ登录</span></a></li>
						<li><a href="#"><i class="am-icon-weibo am-icon-sm">&nbsp;</i><span>微博登录</span>
						</a></li>
						<li><a href="#"><i class="am-icon-weixin am-icon-sm">&nbsp;</i><span>微信登录</span>
						</a></li>
					</div>
				</div>

			</div>
		</div>
	</div>


	<div class="footer ">
		<div class="footer-hd ">
			<p>
				<a href="# ">青岛大学</a> <b>|</b> <a href="index.jsp" target="_top" class="h">商城首页</a> <b>|</b> <a
					href="# ">支付宝</a> <b>|</b> <a href="# ">物流</a>
			</p>
		</div>
		<div class="footer-bd ">
			<p>
				<a href="# ">关于我们</a> <a href="# ">合作伙伴</a> <a href="# ">联系我们</a> <a
					href="# ">网站地图</a>
			</p>
		</div>
	</div>
</body>

</html>