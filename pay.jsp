<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transi
tional//EN">
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head lang="en">
<meta charset="UTF-8">
<title>结算</title>
<%
	pageContext.setAttribute("APP_PATH", request.getContextPath());
%>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="viewport"
	content="width=device-width, initial-scale=1.0 ,minimum-scale=1.0, maximum-scale=1.0, user-scalable=no">

<title>结算页面</title>
<link href="${APP_PATH }/static/css/amazeui.css" rel="stylesheet"
	type="text/css" />
<link href="${APP_PATH }/static/css/demo.css" rel="stylesheet"
	type="text/css" />
<link href="${APP_PATH }/static/css/cartstyle.css" rel="stylesheet"
	type="text/css" />
<link href="${APP_PATH }/static/css/jsstyle.css" rel="stylesheet"
	type="text/css" />
<script type="text/javascript" src="${APP_PATH }/static/js/address.js"></script>
<script type="text/javascript"
	src="${APP_PATH }/static/js/jquery-1.11.1.min.js"></script>
<link
	href="${APP_PATH }/static/bootstrap-3.3.7-dist/css/bootstrap.min.css"
	rel="stylesheet">
<script
	src="${APP_PATH }/static/bootstrap-3.3.7-dist/js/bootstrap.min.js"></script>

</head>

<body>
	<!-- 支付页面模态框 -->
	<div class="modal fade" id="payModal2" tabindex="-1" role="dialog"
		aria-labelledby="myModalLabel">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
					<h4 class="modal-title">支付</h4>
				</div>
				<div class="modal-body">
					<span class="help-block" style=color:red></span>
					<form class="form-horizontal">
						<div class="form-group">
							<label class="col-sm-2 control-label">用户名</label>
							<div class="col-sm-10">
								<p class="form-control-static" id="username_static">${sessionScope.username }</p>
							</div>
						</div>
						<div class="form-group">
							<label class="col-sm-2 control-label">支付密码</label>
							<div class="col-sm-10">
								<input type="password" name="paypwd" class="form-control"
									id="paypwd_input" placeholder="请输入支付密码">
							</div>
						</div>
					</form>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
					<button type="button" class="btn btn-primary" id="pay_btn">支付</button>
				</div>
			</div>
		</div>
	</div>




	<!--顶部导航条 -->
	<div class="am-container header">
		<ul class="message-l">
			<div class="topMessage">
				<div class="menu-hd"></div>
			</div>
		</ul>
		<ul class="message-r">
			<div class="topMessage home">
				<div class="menu-hd">
					<a href="index.jsp" target="_top" class="h">商城首页</a>
				</div>
			</div>
			<div class="topMessage my-shangcheng">
				<div class="menu-hd MyShangcheng">
					<a href="#" target="_top"><i class="am-icon-user am-icon-fw"></i>个人中心</a>
				</div>
			</div>
			
			<div class="topMessage favorite">
				<div class="menu-hd">
					<a href="#" target="_top"><i class="am-icon-heart am-icon-fw"></i><span>收藏夹</span></a>
				</div>
		</ul>
	</div>

	<!--悬浮搜索框-->

	<div class="nav white">
		<div class="logo">
			<img src="${APP_PATH}/static/images/logo.png" />
		</div>
		<div class="logoBig">
			<li><img src="${APP_PATH}/static/images/logobig.png" /></li>
		</div>

		<div class="search-bar pr">
			<a name="index_none_header_sysc" href="#"></a>
			<form>
				<input id="searchInput" name="index_none_header_sysc" type="text"
					placeholder="搜索" autocomplete="off"> <input
					id="ai-topsearch" class="submit am-btn" value="搜索" index="1"
					type="submit">
			</form>
		</div>
	</div>

	<div class="clear"></div>
	<div class="concent">
		<!--地址 -->
		<div class="paycont">
			<div class="address">
				<h3>确认收货地址</h3>
				<div class="control">
					<div class="tc-btn createAddr theme-login am-btn am-btn-danger">使用新地址</div>
				</div>
				<div class="clear"></div>
				<ul>
					<div class="per-border"></div>
					<li class="user-addresslist defaultAddr">

						<div class="address-left">
							<div class="user DefaultAddr">

								<span class="buy-address-detail"> <span class="buy-user">${sessionScope.username }
								</span> <span class="buy-phone">17864293318</span>
								</span>
							</div>
							<div class="default-address DefaultAddr">
								<span class="buy-line-title buy-line-title-type">收货地址：</span> <span
									class="buy--address-detail"> <span class="province">山东</span>省
									<span class="city">青岛</span>市 <span class="dist">崂山</span>区 <span
									class="street">宁夏路667号(青岛大学)</span>
								</span> </span>
							</div>
							<ins class="deftip">默认地址</ins>
						</div>
						<div class="address-right">
							<a href="person/address.html"> <span
								class="am-icon-angle-right am-icon-lg"></span></a>
						</div>
						<div class="clear"></div>

						<div class="new-addr-btn">
							<a href="#" class="hidden">设为默认</a> <span
								class="new-addr-bar hidden">|</span> <a href="#">编辑</a> <span
								class="new-addr-bar">|</span> <a href="javascript:void(0);"
								onclick="delClick(this);">删除</a>
						</div>

					</li>
					<div class="per-border"></div>
					<li class="user-addresslist">
						<div class="address-left">
							<div class="user DefaultAddr">

								<span class="buy-address-detail"> <span class="buy-user">${sessionScope.username }
								</span> <span class="buy-phone">15871145629</span>
								</span>
							</div>
							<div class="default-address DefaultAddr">
								<span class="buy-line-title buy-line-title-type">收货地址：</span> <span
									class="buy--address-detail"> <span class="province">山东</span>省
									<span class="city">济南</span>市 <span class="dist">历下</span>区 <span
									class="street">经十路华春碧云天3号楼2单元301</span>
								</span> </span>
							</div>
							<ins class="deftip hidden">默认地址</ins>
						</div>
						<div class="address-right">
							<span class="am-icon-angle-right am-icon-lg"></span>
						</div>
						<div class="clear"></div>

						<div class="new-addr-btn">
							<a href="#">设为默认</a> <span class="new-addr-bar">|</span> <a
								href="#">编辑</a> <span class="new-addr-bar">|</span> <a
								href="javascript:void(0);" onclick="delClick(this);">删除</a>
						</div>

					</li>

				</ul>

				<div class="clear"></div>
			</div>
			<!--物流 -->
			<div class="logistics">
				<h3>选择物流方式</h3>
				<ul class="op_express_delivery_hot">
					<li data-value="yuantong" class="OP_LOG_BTN  "><i
						class="c-gap-right" style="background-position:0px -468px"></i>圆通<span></span></li>
					<li data-value="shentong" class="OP_LOG_BTN  "><i
						class="c-gap-right" style="background-position:0px -1008px"></i>申通<span></span></li>
					<li data-value="yunda" class="OP_LOG_BTN  "><i
						class="c-gap-right" style="background-position:0px -576px"></i>韵达<span></span></li>
					<li data-value="zhongtong"
						class="OP_LOG_BTN op_express_delivery_hot_last "><i
						class="c-gap-right" style="background-position:0px -324px"></i>中通<span></span></li>
					<li data-value="shunfeng"
						class="OP_LOG_BTN  op_express_delivery_hot_bottom"><i
						class="c-gap-right" style="background-position:0px -180px"></i>顺丰<span></span></li>
				</ul>
			</div>
			<div class="clear"></div>

			<!--支付方式-->
			<div class="logistics">
				<h3>选择支付方式</h3>
				<ul class="pay-list">
					<li class="pay card"><img
						src="${APP_PATH}/static/images/wangyin.jpg" />银联<span></span></li>
					<li class="pay qq"><img
						src="${APP_PATH}/static/images/weizhifu.jpg" />微信<span></span></li>
					<li class="pay taobao"><img
						src="${APP_PATH}/static/images/zhifubao.jpg" />支付宝<span></span></li>
				</ul>
			</div>
			<div class="clear"></div>



			<!--留言-->
			<div class="order-extra">
				<div class="order-user-info">
					<div id="holyshit257" class="memo">
						<label>买家留言：</label> <input type="text"
							title="选填,对本次交易的说明（建议填写已经和卖家达成一致的说明）"
							placeholder="选填,建议填写和卖家达成一致的说明"
							class="memo-input J_MakePoint c2c-text-default memo-close">
						<div class="msg hidden J-msg">
							<p class="error">最多输入500个字符</p>
						</div>
					</div>
				</div>

			</div>
			<!--优惠券 -->
			<div class="buy-agio">
				<li class="td td-coupon"><span class="coupon-title">优惠券</span>
					<select id="data-am-selected" onchange="show_payee();">
						<option value="1">
											<div class="c-price">
												<strong>￥8</strong>
											</div>
											<div class="c-limit">
												【消费满95元可用】
											</div>
										</option>
						<option value="2" selected>
											<div class="c-price">
												<strong>￥3</strong>
											</div>
											<div class="c-limit">
												
											</div>
										</option>
									<c:forEach  var="item" items="${sessionScope.couponslist}" >
										
											<option value="${item.couponvalue}">
											${item.coupon}
										</option>
									</c:forEach>
										
										
										
				</select></li>

				<li class="td td-bonus"><span class="bonus-title">红包</span> <select
					data-am-selected>
						<option value="a">
											<div class="item-info">
												¥50.00<span>元</span>
											</div>
											<div class="item-remainderprice">
												<span>还剩</span>10.40<span>元</span>
											</div>
										</option>
						<option value="b" selected>
											<div class="item-info">
												¥50.00<span>元</span>
											</div>
											<div class="item-remainderprice">
												<span>还剩</span>50.00<span>元</span>
											</div>
										</option>
				</select></li>

			</div>
			<div class="clear"></div>
		</div>



		<!--信息 -->
		<div class="order-go clearfix">
			<div class="pay-confirm clearfix">
				<div class="box">
					<div tabindex="0" id="holyshit267" class="realPay">
						<em class="t">实付款：</em> <span class="price g_price "> <span>¥</span>
							<em class="style-large-bold-red " id="J_ActualFee">${sessionScope.ShoppingCart.totalMoney }</em>
						</span>
					</div>

					<div id="holyshit268" class="pay-address">

						<p class="buy-footer-address">
							<span class="buy-line-title buy-line-title-type">寄送至：</span> <span
								class="buy--address-detail"> <span class="province">山东</span>省
								<span class="city">青岛</span>市 <span class="dist">崂山</span>区 <span
								class="street">香港中路667号(青岛大学)</span>
							</span> </span>
						</p>
						<p class="buy-footer-address">
							<span class="buy-line-title">收货人：</span> <span
								class="buy-address-detail"> <span class="buy-user">${sessionScope.username }
							</span> <span class="buy-phone">17864293318</span>
							</span>
						</p>
					</div>
				</div>

				<div id="holyshit269" class="submitOrder">
					<div class="go-btn-wrap">
						<a id="submit" class="btn-go" tabindex="0" title="点击此按钮，提交订单">提交订单</a>
					</div>
				</div>
				<div class="clear"></div>
			</div>
		</div>
	</div>

	<div class="clear"></div>
	</div>
	</div>
	<div class="footer">
		<div class="footer-hd">
			<p>
				<a href="#">青岛大学</a> <b>|</b> <a href="#">商城首页</a> <b>|</b> <a
					href="#">支付宝</a> <b>|</b> <a href="#">物流</a>
			</p>
		</div>
		<div class="footer-bd">
			<p>
				<a href="#">关于我们</a> <a href="#">合作伙伴</a> <a href="#">联系我们</a> <a
					href="#">网站地图</a> <em></em>
			</p>
		</div>
	</div>
	</div>
	<div class="theme-popover-mask"></div>
	<div class="theme-popover">

		<!--标题 -->
		<div class="am-cf am-padding">
			<div class="am-fl am-cf">
				<strong class="am-text-danger am-text-lg">新增地址</strong> / <small>Add
					address</small>
			</div>
		</div>
		<hr />

		<div class="am-u-md-12">
			<form class="am-form am-form-horizontal">

				<div class="am-form-group">
					<label for="user-name" class="am-form-label">收货人</label>
					<div class="am-form-content">
						<input type="text" id="user-name" placeholder="收货人">
					</div>
				</div>

				<div class="am-form-group">
					<label for="user-phone" class="am-form-label">手机号码</label>
					<div class="am-form-content">
						<input id="user-phone" placeholder="手机号必填" type="email">
					</div>
				</div>

				<div class="am-form-group">
					<label for="user-phone" class="am-form-label">所在地</label>
					<div class="am-form-content address">
						<select data-am-selected>
							<option value="a">浙江省</option>
							<option value="b">山东省</option>
						</select> <select data-am-selected>
							<option value="a">金华市</option>
							<option value="b">青岛市</option>
						</select> <select data-am-selected>
							<option value="a">婺城区</option>
							<option value="b">崂山区</option>
						</select>
					</div>
				</div>

				<div class="am-form-group">
					<label for="user-intro" class="am-form-label">详细地址</label>
					<div class="am-form-content">
						<textarea class="" rows="3" id="user-intro" placeholder="输入详细地址"></textarea>
						<small>100字以内写出你的详细地址...</small>
					</div>
				</div>

				<div class="am-form-group theme-poptit">
					<div class="am-u-sm-9 am-u-sm-push-3">
						<div class="am-btn am-btn-danger">保存</div>
						<div class="am-btn am-btn-danger close">取消</div>
					</div>
				</div>
			</form>
		</div>

	</div>

	<div class="clear"></div>
</body>



<script type="text/javascript">



$(function() {
	$("#data-am-selected").click(function() {
		var a = $("#data-am-selected").val();
		var b = parseInt(${sessionScope.ShoppingCart.totalMoney} );
		var c = b-a;
// 		document.getElementById('#J_ActualFee').innerHtml = c;
		 $("#J_ActualFee").text(c);
		
	})
})





	$(function() {
		//点击提交订单按钮弹出模态框。
		$("#submit").click(function() {
			$("#payModal2").modal('show');
		});

		//点击支付按钮发送ajax请求
		$("#pay_btn").click(function() {
			var username = $("#username_static").text();
			var paypwd = $("#paypwd_input").val();
			var test2=$("#J_ActualFee").html();
			//ajax发送验证
			$.ajax({
				url : "${APP_PATH}/pay?username=" + username + "&paypwd=" + paypwd +"&payprice=" + test2,
				type : "GET",
				success : function(result) {
					if (result.extend.errors != null) {
						$(".help-block").text(result.extend.errors);
						return;
					}
					$("#payModal2").modal('hide');
					location.reload();
			
					window.location.href = "success.jsp?totalMoney=${sessionScope.pay.Payprice}&type=${param.type}";
				}
			});
		});
	});
</script>











</html>










