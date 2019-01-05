<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<%
	pageContext.setAttribute("APP_PATH", request.getContextPath());
%>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="viewport"
	content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=no">

<title>商品页面</title>

<link href="${APP_PATH}/static/css/admin.css" rel="stylesheet"
	type="text/css" />
<link href="${APP_PATH}/static/css/amazeui.css" rel="stylesheet"
	type="text/css" />
<link href="${APP_PATH}/static/css/demo.css" rel="stylesheet"
	type="text/css" />
<link type="text/css" href="${APP_PATH}/static/css/optstyle.css"
	rel="stylesheet" />
<link type="text/css" href="${APP_PATH}/static/css/style.css"
	rel="stylesheet" />

<script type="text/javascript"
	src="${APP_PATH }/static/js/jquery-1.11.1.min.js"></script>
<script type="text/javascript"
	src="${APP_PATH}/static/js/quick_links.js"></script>

<script type="text/javascript" src="${APP_PATH}/static/js/amazeui.js"></script>
<script type="text/javascript"
	src="${APP_PATH}/static/js/jquery.imagezoom.min.js"></script>
<script type="text/javascript"
	src="${APP_PATH}/static/js/jquery.flexslider.js"></script>
<script type="text/javascript" src="${APP_PATH}/static/js/list.js"></script>
<script type="text/javascript">
	$(function() {
		$("#LikBasket").click(function() {
			var goodid = $(this).attr("title");
			$.ajax({
				url : "${APP_PATH}/addToCart/" + goodid,
				type : "GET",
			});
		});
	});

	$(function() {

		$("#coupon1").click(
				function() {
					
					var couponValue = $("#coupon1").val();
					var coupon = $("#coupon1").text();
					// 			alert($("#coupon1").val());
					var username = $("#username").text();
					if (username == "") {
						alert("您还没有登录，不能领取优惠券");
						return false;
					}
					$.ajax({
						url : "${APP_PATH}/setCoupon?Couponvalue="
								+ couponValue + "&Coupon=" + coupon,
						type : "GET",
						success : function(result) {
							alert("领取成功,欢迎选购");
						}
					});
				});
		$("#coupon2").click(
				function() {
					var couponValue = $("#coupon2").val();
					var coupon = $("#coupon2").text();
					// 			alert($("#coupon1").val());
					var username = $("#username").text();
					if (username == "") {
						alert("您还没有登录，不能领取优惠券");
						return false;
					}
					$.ajax({
						url : "${APP_PATH}/setCoupon?Couponvalue="
								+ couponValue + "&Coupon=" + coupon,
						type : "GET",
						success : function(result) {
							alert("领取成功,欢迎选购");
						}
					});
				});
		$("#coupon3").click(
				function() {
					var couponValue = $("#coupon3").val();
					var coupon = $("#coupon3").text();
					// 			alert($("#coupon1").val());
					var username = $("#username").text();
					if (username == "") {
						alert("您还没有登录，不能领取优惠券");
						return false;
					}
					$.ajax({
						url : "${APP_PATH}/setCoupon?Couponvalue="
								+ couponValue + "&Coupon=" + coupon,
						type : "GET",
						success : function(result) {
							alert("领取成功,欢迎选购");
						}
					});
				});
	});
</script>
</head>

<body>


	<!--顶部导航条 -->
	<div class="am-container header">
		<ul class="message-l">
			<div class="topMessage">
				<div class="menu-hd">

					<c:if test="${sessionScope.username==null }">
						<a href="login.jsp" target="_top" class="h">亲，请登录</a>
						<a href="regist.jsp" target="_top">免费注册</a>
					</c:if>
					<c:if test="${sessionScope.username!=null }">
						<a target="_top" class="h" style="color:green">您好，${sessionScope.username}</a>&nbsp;
						<a target="_top" class="h" id="logout_link" href="logout">退出登录</a>
					</c:if>
				</div>
			</div>
		</ul>
		<ul class="message-r">
			<div class="topMessage home">
				<div class="menu-hd">
					<a href="index.jsp" target="_top" class="h">商城首页</a>
				</div>
			</div>
			<div class="topMessage my-shangcheng">
				
			<div class="topMessage mini-cart">
			
				<div class="menu-hd">
					<a id="mc-menu-hd"
						href="shopcart.jsp?pageNum=${param.pageNum }&type=${param.type}&sales=${param.sales}&pricea=${param.pricea}&priced=${param.priced}"
						target="_top"><i class="am-icon-shopping-cart  am-icon-fw"></i><span>购物车</span><strong
						id="J_MiniCartNum" class="h">${sessionScope.ShoppingCart.goodsNumber }</strong></a>
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
	<b class="line"></b>
	<div class="listMain">

		<!--分类-->
		<div class="nav-table">
			<div class="long-title">
				<span class="all-goods">衣服详情</span>
			</div>
			<div class="nav-cont">

				<div class="nav-extra" style="color: red">
					<i class="am-icon-user-secret am-icon-md nav-user"></i><b></b>我的福利
					<i class="am-icon-angle-right" style="padding-left: 10px;"></i>
				</div>
			</div>
		</div>
		<ol class="am-breadcrumb am-breadcrumb-slash">
			<li><a href="#">首页</a></li>
			<li><a href="#">分类</a></li>
			<li class="am-active">内容</li>
		</ol>
		<script type="text/javascript">
			$(function() {
			});
			$(window).load(function() {
				$('.flexslider').flexslider({
					animation : "slide",
					start : function(slider) {
						$('body').removeClass('loading');
					}
				});
			});
		</script>


		<!--放大镜-->

		<div class="item-inform">
			<div class="clearfixLeft" id="clearcontent">

				<div class="box">
					<script type="text/javascript">
						$(document).ready(
								function() {
									$(".jqzoom").imagezoom();
									$("#thumblist li a").click(
											function() {
												$(this).parents("li").addClass(
														"tb-selected")
														.siblings()
														.removeClass(
																"tb-selected");
												$(".jqzoom").attr(
														'src',
														$(this).find("img")
																.attr("mid"));
												$(".jqzoom").attr(
														'rel',
														$(this).find("img")
																.attr("big"));
											});
								});
					</script>

					<div style="margin-left: 80px; margin-top: 40px">
						<img src="${APP_PATH }${good.img}" />
					</div>

				</div>

				<div class="clear"></div>
			</div>

			<div class="clearfixRight">

				<!--规格属性-->
				<!--名称-->
				<div class="tb-detail-hd">
					<h1>商品名：${good.name }</h1>
				</div>
				<div class="tb-detail-list">
					<!--价格-->
					<div class="tb-detail-price">
						<li class="price iteminfo_price">
							<dt>促销价</dt>
							<dd>
								<em>¥</em><b class="sys_item_price">${good.price }</b>
							</dd>
						</li>
						<li class="price iteminfo_mktprice">
							<dt>原价</dt>
							<dd>
								<em>¥</em><b class="sys_item_mktprice">98.00</b>
							</dd>
						</li>
						<div class="clear"></div>
					</div>

					<!--地址-->
					<dl class="iteminfo_parameter freight">
						<dt>配送至</dt>
						<div class="iteminfo_freprice">
							<div class="am-form-content address">
								<select data-am-selected>
									<option value="a">浙江省</option>
									<option value="b">湖北省</option>
								</select> <select data-am-selected>
									<option value="a">温州市</option>
									<option value="b">武汉市</option>
								</select> <select data-am-selected>
									<option value="a">瑞安区</option>
									<option value="b">洪山区</option>
								</select>
							</div>
							<div class="pay-logis">
								快递<b class="sys_item_freprice">10</b>元
							</div>
						</div>
					</dl>
					<div class="clear"></div>

					<!--销量-->
					<ul class="tm-ind-panel">
						<li class="tm-ind-item tm-ind-sellCount canClick">
							<div class="tm-indcon">
								<span class="tm-label">销量</span><span class="tm-count">${good.salesamount }</span>
							</div>
						</li>
						<li class="tm-ind-item tm-ind-sumCount canClick">
							<div class="tm-indcon">
								<span class="tm-label">库存</span><span class="tm-count">${good.storenumber }</span>
							</div>
						</li>
						<li class="tm-ind-item tm-ind-reviewCount canClick tm-line3">
							<div class="tm-indcon">
								<span class="tm-label">类型：</span><span class="tm-count">${good.remark }</span>
							</div>
						</li>
					</ul>
					<div class="clear"></div>

					<!--各种规格-->
					<dl class="iteminfo_parameter sys_item_specpara">
						<dt class="theme-login">
							<div class="cart-title">
								可选规格<span class="am-icon-angle-right"></span>
							</div>
						</dt>
						<dd>
							<!--操作页面-->

							<div class="theme-popover-mask"></div>

							<div class="theme-popover">
								<div class="theme-span"></div>
								<div class="theme-poptit">
									<a href="javascript:;" title="关闭" class="close">×</a>
								</div>
								<div class="theme-popbod dform">
									<form class="theme-signin" name="loginform" action=""
										method="post">

										<div class="theme-signin-left">

											<div class="theme-options">
												<div class="cart-title number">数量：</div>
												<dd>
													<span id="Stock" class="tb-hidden">库存<span
														class="stock">${good.storenumber }</span>件
													</span>
												</dd>

											</div>
											<div class="clear"></div>

											<div class="btn-op">
												<div class="btn am-btn am-btn-warning">确认</div>
												<div class="btn close am-btn am-btn-warning">取消</div>
											</div>
										</div>
										<div class="theme-signin-right">
											<div class="img-info">
												<img src="${APP_PATH}/static/images/songzi.jpg" />
											</div>
											<div class="text-info">
												<span class="J_Price price-now">¥39.00</span> <span
													id="Stock" class="tb-hidden">库存<span class="stock">1000</span>件
												</span>
											</div>
										</div>

									</form>
								</div>
							</div>

						</dd>
					</dl>
					<div class="clear"></div>
					<!--活动	-->
					<div class="shopPromotion gold">
						<div class="hot">
							<dt class="tb-metatit">店铺优惠</dt>
							<div class="gold-list">
								<p>
									购物满2件打8折，满3件7折<span>点击领券<i class="am-icon-sort-down"></i></span>
								</p>
							</div>
						</div>
						<div class="clear"></div>
						<div class="coupon">
							<dt class="tb-metatit">优惠券</dt>
							<div class="gold-list">
								<ul>
									<li id="coupon1" value="5" name="20减5">20减5</li>
									<li id="coupon2" value="10" name="40减10">40减10</li>
									<li id="coupon3" value="15" name="50减15">50减15</li>
								</ul>
							</div>
						</div>
					</div>
				</div>

				<div class="pay">
					<div class="pay-opt">
						<a href="home.html"><span class="am-icon-home am-icon-fw">首页</span></a>
						<a><span class="am-icon-heart am-icon-fw">收藏</span></a>

					</div>
					<li>
						<div class="clearfix tb-btn tb-btn-buy theme-login">
							<a
								href="goods2?pn=${param.pageNum }&type=${param.type}&sales=${param.sales}&pricea=${param.pricea}&priced=${param.priced}"><i></i>继续购物</a>
						</div>
					</li>
					<li>
						<div class="clearfix tb-btn tb-btn-basket theme-login">
							<a id="LikBasket" title="${good.goodsid }" href=""
								name="${good.name }"><i></i>加入购物车</a>
						</div>
					</li>
				</div>

			</div>

			<div class="clear"></div>

		</div>
		<br> <br>

		<!-- 
		introduce-->

		<div class="introduce">
			<div class="browse">
				<div class="mc">
					<ul>
						<div class="mt">
							<h2>看了又看</h2>
						</div>

						<li class="first">
							<div class="p-img">
								<a href="#"> <img class=""
									src="${APP_PATH }/static/images/mm1.jpg">
								</a>
							</div>
							<div class="p-name">
								<a href="#"> 冬季保暖黑色裤子男</a>
							</div>
							<div class="p-price">
								<strong>￥69.90</strong>
							</div>
						</li>
						<li>
							<div class="p-img">
								<a href="#"> <img class=""
									src="${APP_PATH }/static/images/mm2.jpg">
								</a>
							</div>
							<div class="p-name">
								<a href="#"> 休闲哈伦裤 </a>
							</div>
							<div class="p-price">
								<strong>￥77.90</strong>
							</div>
						</li>
						<li>
							<div class="p-img">
								<a href="#"> <img class=""
									src="${APP_PATH}/static/images/m7.jpg">
								</a>
							</div>
							<div class="p-name">
								<a href="#"> 2017秋装新品两面穿夹 </a>
							</div>
							<div class="p-price">
								<strong>￥129.90</strong>
							</div>
						</li>
						<li>
							<div class="p-img">
								<a href="#"> <img class=""
									src="${APP_PATH}/static/images/m6.jpg">
								</a>
							</div>
							<div class="p-name">
								<a href="#">冬季新品</a>
							</div>
							<div class="p-price">
								<strong>￥128.90</strong>
							</div>
						</li>

					</ul>
				</div>
			</div>
			<div class="introduceMain">
				<div class="am-tabs" data-am-tabs>
					<ul class="am-avg-sm-3 am-tabs-nav am-nav am-nav-tabs">
						<li class="am-active"><a href="#"> <span
								class="index-needs-dt-txt">宝贝详情</span></a></li>

						<li><a href="#"> <span class="index-needs-dt-txt">全部评价</span></a>

						</li>
					</ul>

					<div class="am-tabs-bd">

						<div class="am-tab-panel am-fade am-in am-active">
							<div class="J_Brand">

								<div class="attr-list-hd tm-clear">
									<h4>产品参数：</h4>
								</div>
								<div class="clear"></div>
								<ul id="J_AttrUL">
									<li title="">产品类型:&nbsp;服装类</li>
									<li title="">原料产地:&nbsp;青岛</li>
									<li title="">产地:&nbsp;山东省青岛市</li>
									<li title="">产品规格:&nbsp;1.5kg</li>
									<li title="">产品标准号:&nbsp;GB/T 22165</li>
									<li title="">生产许可证编号：&nbsp;QS4201 1801 0226</li>
								</ul>
								<div class="clear"></div>
							</div>

							<div class="details">
								<div class="attr-list-hd after-market-hd">
									<h4>商品细节</h4>
								</div>
								<div class="twlistNews">
									<img src="${APP_PATH}${good.img}" />
								</div>
							</div>
							<div class="clear"></div>

						</div>

						<div class="am-tab-panel am-fade">

							<div class="actor-new">
								<div class="rate">
									<strong>100<span>%</span></strong><br> <span>好评度</span>
								</div>
								<dl>
									<dt>买家印象</dt>
									<dd class="p-bfc">
										<q class="comm-tags"><span>质量不错</span><em>(2177)</em></q> <q
											class="comm-tags"><span>穿上舒服</span><em>(1860)</em></q> <q
											class="comm-tags"><span>手感好</span><em>(1823)</em></q> <q
											class="comm-tags"><span>商品不错</span><em>(1689)</em></q> <q
											class="comm-tags"><span>款式新颖</span><em>(1488)</em></q> <q
											class="comm-tags"><span>很保暖</span><em>(1392)</em></q> <q
											class="comm-tags"><span>价格便宜</span><em>(1119)</em></q> <q
											class="comm-tags"><span>特价买的</span><em>(865)</em></q>
									</dd>
								</dl>
							</div>
							<div class="clear"></div>
							<div class="tb-r-filter-bar">
								<ul class=" tb-taglist am-avg-sm-4">
									<li class="tb-taglist-li tb-taglist-li-current">
										<div class="comment-info">
											<span>全部评价</span> <span class="tb-tbcr-num">(32)</span>
										</div>
									</li>

									<li class="tb-taglist-li tb-taglist-li-1">
										<div class="comment-info">
											<span>好评</span> <span class="tb-tbcr-num">(32)</span>
										</div>
									</li>

									<li class="tb-taglist-li tb-taglist-li-0">
										<div class="comment-info">
											<span>中评</span> <span class="tb-tbcr-num">(32)</span>
										</div>
									</li>

									<li class="tb-taglist-li tb-taglist-li--1">
										<div class="comment-info">
											<span>差评</span> <span class="tb-tbcr-num">(32)</span>
										</div>
									</li>
								</ul>
							</div>
							<div class="clear"></div>

							<ul class="am-comments-list am-comments-list-flip">
								<li class="am-comment">
									<!-- 评论容器 --> <a href=""> <img
										class="${APP_PATH}/static/am-comment-avatar"
										src="${APP_PATH}/static/images/hwbn40x40.jpg" /> <!-- 评论者头像 -->
								</a>

									<div class="am-comment-main">
										<!-- 评论内容容器 -->
										<header class="am-comment-hd">
											<!--<h3 class="am-comment-title">评论标题</h3>-->
											<div class="am-comment-meta">
												<!-- 评论元数据 -->
												<a href="#link-to-user" class="am-comment-author">b***1
													(匿名)</a>
												<!-- 评论者 -->
												评论于
												<time datetime="">2015年11月02日 17:46</time>
											</div>
										</header>

										<div class="am-comment-bd">
											<div class="tb-rev-item " data-id="255776406962">
												<div class="J_TbcRate_ReviewContent tb-tbcr-content ">
													摸起来丝滑柔软，不厚，没色差，颜色好看！买这个衣服还接到诈骗电话，我很好奇他们是怎么知道我买了这件衣服，并且还知道我的电话的！
												</div>
												<div class="tb-r-act-bar">颜色分类：柠檬黄&nbsp;&nbsp;尺码：S</div>
											</div>

										</div>
										<!-- 评论内容 -->
									</div>
								</li>
								<li class="am-comment">
									<!-- 评论容器 --> <a href=""> <img class="am-comment-avatar"
										src="${APP_PATH}/static/images/hwbn40x40.jpg" /> <!-- 评论者头像 -->
								</a>

									<div class="am-comment-main">
										<!-- 评论内容容器 -->
										<header class="am-comment-hd">
											<!--<h3 class="am-comment-title">评论标题</h3>-->
											<div class="am-comment-meta">
												<!-- 评论元数据 -->
												<a href="#link-to-user" class="am-comment-author">l***4
													(匿名)</a>
												<!-- 评论者 -->
												评论于
												<time datetime="">2015年10月28日 11:33</time>
											</div>
										</header>

										<div class="am-comment-bd">
											<div class="tb-rev-item " data-id="255095758792">
												<div class="J_TbcRate_ReviewContent tb-tbcr-content ">
													没有色差，很暖和……美美的</div>
												<div class="tb-r-act-bar">颜色分类：蓝调灰&nbsp;&nbsp;尺码：2XL</div>
											</div>

										</div>
										<!-- 评论内容 -->
									</div>
								</li>
								<li class="am-comment">
									<!-- 评论容器 --> <a href=""> <img class="am-comment-avatar"
										src="${APP_PATH}/static/images/hwbn40x40.jpg" /> <!-- 评论者头像 -->
								</a>

									<div class="am-comment-main">
										<!-- 评论内容容器 -->
										<header class="am-comment-hd">
											<!--<h3 class="am-comment-title">评论标题</h3>-->
											<div class="am-comment-meta">
												<!-- 评论元数据 -->
												<a href="#link-to-user" class="am-comment-author">b***1
													(匿名)</a>
												<!-- 评论者 -->
												评论于
												<time datetime="">2015年11月02日 17:46</time>
											</div>
										</header>

										<div class="am-comment-bd">
											<div class="tb-rev-item " data-id="255776406962">
												<div class="J_TbcRate_ReviewContent tb-tbcr-content ">
													摸起来丝滑柔软，不厚，没色差，颜色好看！买这个衣服还接到诈骗电话，我很好奇他们是怎么知道我买了这件衣服，并且还知道我的电话的！
												</div>
												<div class="tb-r-act-bar">颜色分类：柠檬黄&nbsp;&nbsp;尺码：S</div>
											</div>

										</div>
										<!-- 评论内容 -->
									</div>
								</li>
								<li class="am-comment">
									<!-- 评论容器 --> <a href=""> <img class="am-comment-avatar"
										src="${APP_PATH}/static/images/hwbn40x40.jpg" /> <!-- 评论者头像 -->
								</a>

									<div class="am-comment-main">
										<!-- 评论内容容器 -->
										<header class="am-comment-hd">
											<!--<h3 class="am-comment-title">评论标题</h3>-->
											<div class="am-comment-meta">
												<!-- 评论元数据 -->
												<a href="#link-to-user" class="am-comment-author">h***n
													(匿名)</a>
												<!-- 评论者 -->
												评论于
												<time datetime="">2015年11月25日 12:48</time>
											</div>
										</header>

										<div class="am-comment-bd">
											<div class="tb-rev-item " data-id="258040417670">
												<div class="J_TbcRate_ReviewContent tb-tbcr-content ">
													式样不错，初冬穿</div>
												<div class="tb-r-act-bar">颜色分类：柠檬黄&nbsp;&nbsp;尺码：L</div>
											</div>
										</div>
										<!-- 评论内容 -->
									</div>
								</li>

								<li class="am-comment">
									<!-- 评论容器 --> <a href=""> <img class="am-comment-avatar"
										src="${APP_PATH}/static/images/hwbn40x40.jpg" /> <!-- 评论者头像 -->
								</a>

									<div class="am-comment-main">
										<!-- 评论内容容器 -->
										<header class="am-comment-hd">
											<!--<h3 class="am-comment-title">评论标题</h3>-->
											<div class="am-comment-meta">
												<!-- 评论元数据 -->
												<a href="#link-to-user" class="am-comment-author">b***1
													(匿名)</a>
												<!-- 评论者 -->
												评论于
												<time datetime="">2015年11月02日 17:46</time>
											</div>
										</header>

										<div class="am-comment-bd">
											<div class="tb-rev-item " data-id="255776406962">
												<div class="J_TbcRate_ReviewContent tb-tbcr-content ">
													摸起来丝滑柔软，不厚，没色差，颜色好看！买这个衣服还接到诈骗电话，我很好奇他们是怎么知道我买了这件衣服，并且还知道我的电话的！
												</div>
												<div class="tb-r-act-bar">颜色分类：柠檬黄&nbsp;&nbsp;尺码：S</div>
											</div>

										</div>
										<!-- 评论内容 -->
									</div>
								</li>
								<li class="am-comment">
									<!-- 评论容器 --> <a href=""> <img class="am-comment-avatar"
										src="${APP_PATH}/static/images/hwbn40x40.jpg" /> <!-- 评论者头像 -->
								</a>

									<div class="am-comment-main">
										<!-- 评论内容容器 -->
										<header class="am-comment-hd">
											<!--<h3 class="am-comment-title">评论标题</h3>-->
											<div class="am-comment-meta">
												<!-- 评论元数据 -->
												<a href="#link-to-user" class="am-comment-author">l***4
													(匿名)</a>
												<!-- 评论者 -->
												评论于
												<time datetime="">2015年10月28日 11:33</time>
											</div>
										</header>

										<div class="am-comment-bd">
											<div class="tb-rev-item " data-id="255095758792">
												<div class="J_TbcRate_ReviewContent tb-tbcr-content ">
													没有色差，很暖和……美美的</div>
												<div class="tb-r-act-bar">颜色分类：蓝调灰&nbsp;&nbsp;尺码：2XL</div>
											</div>

										</div>
										<!-- 评论内容 -->
									</div>
								</li>
								<li class="am-comment">
									<!-- 评论容器 --> <a href=""> <img class="am-comment-avatar"
										src="${APP_PATH}/static/images/hwbn40x40.jpg" /> <!-- 评论者头像 -->
								</a>

									<div class="am-comment-main">
										<!-- 评论内容容器 -->
										<header class="am-comment-hd">
											<!--<h3 class="am-comment-title">评论标题</h3>-->
											<div class="am-comment-meta">
												<!-- 评论元数据 -->
												<a href="#link-to-user" class="am-comment-author">b***1
													(匿名)</a>
												<!-- 评论者 -->
												评论于
												<time datetime="">2015年11月02日 17:46</time>
											</div>
										</header>

										<div class="am-comment-bd">
											<div class="tb-rev-item " data-id="255776406962">
												<div class="J_TbcRate_ReviewContent tb-tbcr-content ">
													摸起来丝滑柔软，不厚，没色差，颜色好看！买这个衣服还接到诈骗电话，我很好奇他们是怎么知道我买了这件衣服，并且还知道我的电话的！
												</div>
												<div class="tb-r-act-bar">颜色分类：柠檬黄&nbsp;&nbsp;尺码：S</div>
											</div>

										</div>
										<!-- 评论内容 -->
									</div>
								</li>
								<li class="am-comment">
									<!-- 评论容器 --> <a href=""> <img class="am-comment-avatar"
										src="${APP_PATH}/static/images/hwbn40x40.jpg" /> <!-- 评论者头像 -->
								</a>

									<div class="am-comment-main">
										<!-- 评论内容容器 -->
										<header class="am-comment-hd">
											<!--<h3 class="am-comment-title">评论标题</h3>-->
											<div class="am-comment-meta">
												<!-- 评论元数据 -->
												<a href="#link-to-user" class="am-comment-author">h***n
													(匿名)</a>
												<!-- 评论者 -->
												评论于
												<time datetime="">2015年11月25日 12:48</time>
											</div>
										</header>

										<div class="am-comment-bd">
											<div class="tb-rev-item " data-id="258040417670">
												<div class="J_TbcRate_ReviewContent tb-tbcr-content ">
													式样不错，初冬穿</div>
												<div class="tb-r-act-bar">颜色分类：柠檬黄&nbsp;&nbsp;尺码：L</div>
											</div>
										</div>
										<!-- 评论内容 -->
									</div>
								</li>
								<li class="am-comment">
									<!-- 评论容器 --> <a href=""> <img class="am-comment-avatar"
										src="${APP_PATH}/static/images/hwbn40x40.jpg" /> <!-- 评论者头像 -->
								</a>

									<div class="am-comment-main">
										<!-- 评论内容容器 -->
										<header class="am-comment-hd">
											<!--<h3 class="am-comment-title">评论标题</h3>-->
											<div class="am-comment-meta">
												<!-- 评论元数据 -->
												<a href="#link-to-user" class="am-comment-author">b***1
													(匿名)</a>
												<!-- 评论者 -->
												评论于
												<time datetime="">2015年11月02日 17:46</time>
											</div>
										</header>

										<div class="am-comment-bd">
											<div class="tb-rev-item " data-id="255776406962">
												<div class="J_TbcRate_ReviewContent tb-tbcr-content ">
													摸起来丝滑柔软，不厚，没色差，颜色好看！买这个衣服还接到诈骗电话，我很好奇他们是怎么知道我买了这件衣服，并且还知道我的电话的！
												</div>
												<div class="tb-r-act-bar">颜色分类：柠檬黄&nbsp;&nbsp;尺码：S</div>
											</div>

										</div>
										<!-- 评论内容 -->
									</div>
								</li>
								<li class="am-comment">
									<!-- 评论容器 --> <a href=""> <img class="am-comment-avatar"
										src="${APP_PATH}/static/images/hwbn40x40.jpg" /> <!-- 评论者头像 -->
								</a>

									<div class="am-comment-main">
										<!-- 评论内容容器 -->
										<header class="am-comment-hd">
											<!--<h3 class="am-comment-title">评论标题</h3>-->
											<div class="am-comment-meta">
												<!-- 评论元数据 -->
												<a href="#link-to-user" class="am-comment-author">l***4
													(匿名)</a>
												<!-- 评论者 -->
												评论于
												<time datetime="">2015年10月28日 11:33</time>
											</div>
										</header>

										<div class="am-comment-bd">
											<div class="tb-rev-item " data-id="255095758792">
												<div class="J_TbcRate_ReviewContent tb-tbcr-content ">
													没有色差，很暖和……美美的</div>
												<div class="tb-r-act-bar">颜色分类：蓝调灰&nbsp;&nbsp;尺码：2XL</div>
											</div>

										</div>
										<!-- 评论内容 -->
									</div>
								</li>
								<li class="am-comment">
									<!-- 评论容器 --> <a href=""> <img class="am-comment-avatar"
										src="${APP_PATH}/static/images/hwbn40x40.jpg" /> <!-- 评论者头像 -->
								</a>

									<div class="am-comment-main">
										<!-- 评论内容容器 -->
										<header class="am-comment-hd">
											<!--<h3 class="am-comment-title">评论标题</h3>-->
											<div class="am-comment-meta">
												<!-- 评论元数据 -->
												<a href="#link-to-user" class="am-comment-author">b***1
													(匿名)</a>
												<!-- 评论者 -->
												评论于
												<time datetime="">2015年11月02日 17:46</time>
											</div>
										</header>

										<div class="am-comment-bd">
											<div class="tb-rev-item " data-id="255776406962">
												<div class="J_TbcRate_ReviewContent tb-tbcr-content ">
													摸起来丝滑柔软，不厚，没色差，颜色好看！买这个衣服还接到诈骗电话，我很好奇他们是怎么知道我买了这件衣服，并且还知道我的电话的！
												</div>
												<div class="tb-r-act-bar">颜色分类：柠檬黄&nbsp;&nbsp;尺码：S</div>
											</div>

										</div>
										<!-- 评论内容 -->
									</div>
								</li>
								<li class="am-comment">
									<!-- 评论容器 --> <a href=""> <img class="am-comment-avatar"
										src="${APP_PATH}/static/images/hwbn40x40.jpg" /> <!-- 评论者头像 -->
								</a>

									<div class="am-comment-main">
										<!-- 评论内容容器 -->
										<header class="am-comment-hd">
											<!--<h3 class="am-comment-title">评论标题</h3>-->
											<div class="am-comment-meta">
												<!-- 评论元数据 -->
												<a href="#link-to-user" class="am-comment-author">h***n
													(匿名)</a>
												<!-- 评论者 -->
												评论于
												<time datetime="">2015年11月25日 12:48</time>
											</div>
										</header>

										<div class="am-comment-bd">
											<div class="tb-rev-item " data-id="258040417670">
												<div class="J_TbcRate_ReviewContent tb-tbcr-content ">
													式样不错，初冬穿</div>
												<div class="tb-r-act-bar">颜色分类：柠檬黄&nbsp;&nbsp;尺码：L</div>
											</div>
										</div>
										<!-- 评论内容 -->
									</div>
								</li>

							</ul>

							<div class="clear"></div>

							<!--分页 -->
							<ul class="am-pagination am-pagination-right">
								<li class="am-disabled"><a href="#">&laquo;</a></li>
								<li class="am-active"><a href="#">1</a></li>
								<li><a href="#">2</a></li>
								<li><a href="#">3</a></li>
								<li><a href="#">4</a></li>
								<li><a href="#">5</a></li>
								<li><a href="#">&raquo;</a></li>
							</ul>
							<div class="clear"></div>

							<div class="tb-reviewsft">
								<div class="tb-rate-alert type-attention">
									购买前请查看该商品的 <a href="#" target="_blank">购物保障</a>，明确您的售后保障权益。
								</div>
							</div>

						</div>

						<div class="am-tab-panel am-fade">
							<div class="like">
								<ul class="am-avg-sm-2 am-avg-md-3 am-avg-lg-4 boxes">
									<li>
										<div class="i-pic limit">
											<img src="${APP_PATH}/static/images/imgsearch1.jpg" />
											<p>
												【良品铺子_开口松子】零食坚果特产炒货 <span>东北红松子奶油味</span>
											</p>
											<p class="price fl">
												<b>¥</b> <strong>298.00</strong>
											</p>
										</div>
									</li>
									<li>
										<div class="i-pic limit">
											<img src="${APP_PATH}/static/images/imgsearch1.jpg" />
											<p>
												【良品铺子_开口松子】零食坚果特产炒货 <span>东北红松子奶油味</span>
											</p>
											<p class="price fl">
												<b>¥</b> <strong>298.00</strong>
											</p>
										</div>
									</li>
									<li>
										<div class="i-pic limit">
											<img src="${APP_PATH}/static/images/imgsearch1.jpg" />
											<p>
												【良品铺子_开口松子】零食坚果特产炒货 <span>东北红松子奶油味</span>
											</p>
											<p class="price fl">
												<b>¥</b> <strong>298.00</strong>
											</p>
										</div>
									</li>
									<li>
										<div class="i-pic limit">
											<img src="${APP_PATH}/static/images/imgsearch1.jpg" />
											<p>
												【良品铺子_开口松子】零食坚果特产炒货 <span>东北红松子奶油味</span>
											</p>
											<p class="price fl">
												<b>¥</b> <strong>298.00</strong>
											</p>
										</div>
									</li>
									<li>
										<div class="i-pic limit">
											<img src="${APP_PATH}/static/images/imgsearch1.jpg" />
											<p>
												【良品铺子_开口松子】零食坚果特产炒货 <span>东北红松子奶油味</span>
											</p>
											<p class="price fl">
												<b>¥</b> <strong>298.00</strong>
											</p>
										</div>
									</li>
									<li>
										<div class="i-pic limit">
											<img src="${APP_PATH}/static/images/imgsearch1.jpg" />
											<p>
												【良品铺子_开口松子】零食坚果特产炒货 <span>东北红松子奶油味</span>
											</p>
											<p class="price fl">
												<b>¥</b> <strong>298.00</strong>
											</p>
										</div>
									</li>
									<li>
										<div class="i-pic limit">
											<img src="${APP_PATH}/static/images/imgsearch1.jpg" />
											<p>
												【良品铺子_开口松子】零食坚果特产炒货 <span>东北红松子奶油味</span>
											</p>
											<p class="price fl">
												<b>¥</b> <strong>298.00</strong>
											</p>
										</div>
									</li>
									<li>
										<div class="i-pic limit">
											<img src="${APP_PATH}/static/images/imgsearch1.jpg" />
											<p>
												【良品铺子_开口松子】零食坚果特产炒货 <span>东北红松子奶油味</span>
											</p>
											<p class="price fl">
												<b>¥</b> <strong>298.00</strong>
											</p>
										</div>
									</li>
									<li>
										<div class="i-pic limit">
											<img src="${APP_PATH}/static/images/imgsearch1.jpg" />
											<p>
												【良品铺子_开口松子】零食坚果特产炒货 <span>东北红松子奶油味</span>
											</p>
											<p class="price fl">
												<b>¥</b> <strong>298.00</strong>
											</p>
										</div>
									</li>
									<li>
										<div class="i-pic limit">
											<img src="${APP_PATH}/static/images/imgsearch1.jpg" />
											<p>
												【良品铺子_开口松子】零食坚果特产炒货 <span>东北红松子奶油味</span>
											</p>
											<p class="price fl">
												<b>¥</b> <strong>298.00</strong>
											</p>
										</div>
									</li>
									<li>
										<div class="i-pic limit">
											<img src="${APP_PATH}/static/images/imgsearch1.jpg" />
											<p>
												【良品铺子_开口松子】零食坚果特产炒货 <span>东北红松子奶油味</span>
											</p>
											<p class="price fl">
												<b>¥</b> <strong>298.00</strong>
											</p>
										</div>
									</li>
									<li>
										<div class="i-pic limit">
											<img src="${APP_PATH}/static/images/imgsearch1.jpg" />
											<p>
												【良品铺子_开口松子】零食坚果特产炒货 <span>东北红松子奶油味</span>
											</p>
											<p class="price fl">
												<b>¥</b> <strong>298.00</strong>
											</p>
										</div>
									</li>
								</ul>
							</div>
							<div class="clear"></div>

							<!--分页 -->
							<ul class="am-pagination am-pagination-right">
								<li class="am-disabled"><a href="#">&laquo;</a></li>
								<li class="am-active"><a href="#">1</a></li>
								<li><a href="#">2</a></li>
								<li><a href="#">3</a></li>
								<li><a href="#">4</a></li>
								<li><a href="#">5</a></li>
								<li><a href="#">&raquo;</a></li>
							</ul>
							<div class="clear"></div>

						</div>

					</div>

				</div>

				<div class="clear"></div>

				<div class="footer">
					<div class="footer-hd">
						<p>
							<a href="#">恒望科技</a> <b>|</b> <a href="#">商城首页</a> <b>|</b> <a
								href="#">支付宝</a> <b>|</b> <a href="#">物流</a>
						</p>
					</div>
					<div class="footer-bd">
						<p>
							<a href="#">关于恒望</a> <a href="#">合作伙伴</a> <a href="#">联系我们</a> <a
								href="#">网站地图</a> <em>© 2015-2025 Hengwang.com 版权所有</em>
						</p>
					</div>
				</div>
			</div>

		</div>
	</div>
	<!--菜单 -->
	<div class=tip>
		<div id="sidebar">
			<div id="wrap">
				<div id="prof" class="item">
					<a href="#"> <span class="setting"></span>
					</a>
					<div class="ibar_login_box status_login">
						<div class="avatar_box">
							<p class="avatar_imgbox">
								<img src="${APP_PATH}/static/images/no-img_mid_.jpg" />
							</p>
							<ul class="user_info">
								<li>用户名：sl1903</li>
								<li>级&nbsp;别：普通会员</li>
							</ul>
						</div>
						<div class="login_btnbox">
							<a href="#" class="login_order">我的订单</a> <a href="#"
								class="login_favorite">我的收藏</a>
						</div>
						<i class="icon_arrow_white"></i>
					</div>

				</div>
				<div id="shopCart" class="item">
					<a href="#"> <span class="message"></span>
					</a>
					<p>购物车</p>
					<p class="cart_num">0</p>
				</div>
				<div id="asset" class="item">
					<a href="#"> <span class="view"></span>
					</a>
					<div class="mp_tooltip">
						我的资产 <i class="icon_arrow_right_black"></i>
					</div>
				</div>

				<div id="foot" class="item">
					<a href="#"> <span class="zuji"></span>
					</a>
					<div class="mp_tooltip">
						我的足迹 <i class="icon_arrow_right_black"></i>
					</div>
				</div>

				<div id="brand" class="item">
					<a href="#"> <span class="wdsc"><img
							src="${APP_PATH}/static/images/wdsc.png" /></span>
					</a>
					<div class="mp_tooltip">
						我的收藏 <i class="icon_arrow_right_black"></i>
					</div>
				</div>

				<div id="broadcast" class="item">
					<a href="#"> <span class="chongzhi"><img
							src="${APP_PATH}/static/images/chongzhi.png" /></span>
					</a>
					<div class="mp_tooltip">
						我要充值 <i class="icon_arrow_right_black"></i>
					</div>
				</div>

				<div class="quick_toggle">
					<li class="qtitem"><a href="#"><span class="kfzx"></span></a>
						<div class="mp_tooltip">
							客服中心<i class="icon_arrow_right_black"></i>
						</div></li>
					<!--二维码 -->
					<li class="qtitem"><a href="#none"><span
							class="mpbtn_qrcode"></span></a>
						<div class="mp_qrcode" style="display: none;">
							<img src="${APP_PATH}/static/images/weixin_code_145.png" /><i
								class="icon_arrow_white"></i>
						</div></li>
					<li class="qtitem"><a href="#top" class="return_top"><span
							class="top"></span></a></li>
				</div>

				<!--回到顶部 -->
				<div id="quick_links_pop" class="quick_links_pop hide"></div>

			</div>

		</div>
		<div id="prof-content" class="nav-content">
			<div class="nav-con-close">
				<i class="am-icon-angle-right am-icon-fw"></i>
			</div>
			<div>我</div>
		</div>
		<div id="shopCart-content" class="nav-content">
			<div class="nav-con-close">
				<i class="am-icon-angle-right am-icon-fw"></i>
			</div>
			<div>购物车</div>
		</div>
		<div id="asset-content" class="nav-content">
			<div class="nav-con-close">
				<i class="am-icon-angle-right am-icon-fw"></i>
			</div>
			<div>资产</div>

			<div class="ia-head-list">
				<a href="#" target="_blank" class="pl">
					<div class="num">0</div>
					<div class="text">优惠券</div>
				</a> <a href="#" target="_blank" class="pl">
					<div class="num">0</div>
					<div class="text">红包</div>
				</a> <a href="#" target="_blank" class="pl money">
					<div class="num">￥0</div>
					<div class="text">余额</div>
				</a>
			</div>

		</div>
		<div id="foot-content" class="nav-content">
			<div class="nav-con-close">
				<i class="am-icon-angle-right am-icon-fw"></i>
			</div>
			<div>足迹</div>
		</div>
		<div id="brand-content" class="nav-content">
			<div class="nav-con-close">
				<i class="am-icon-angle-right am-icon-fw"></i>
			</div>
			<div>收藏</div>
		</div>
		<div id="broadcast-content" class="nav-content">
			<div class="nav-con-close">
				<i class="am-icon-angle-right am-icon-fw"></i>
			</div>
			<div>充值</div>
		</div>
	</div>
	<!--引导 -->
	<div class="navCir">
		<li><a href="home.html" id="username"><i
				class="am-icon-home "></i>${sessionScope.username }</a></li>
		<li><a href="sort.html" id="isempty"><i class="am-icon-list"></i>${sessionScope.ShoppingCart.goodsNumber }</a></li>
		<li class="active"><a href="shopcart.html"><i
				class="am-icon-shopping-basket"></i>购物车</a></li>
		<li><a href="person/index.html"><i class="am-icon-user"></i>我的</a></li>
	</div>
</body>

</html>