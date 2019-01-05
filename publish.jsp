<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transi
tional//EN
">
<html>
<head lang="en">
<meta charset="UTF-8">

<title>已发布商品页面</title>
<%
	pageContext.setAttribute("APP_PATH", request.getContextPath());
%>

<link href="${APP_PATH}/static/css/amazeui.css" rel="stylesheet"
	type="text/css" />
<link href="${APP_PATH}/static/css/demo.css" rel="stylesheet"
	type="text/css" />
<link href="${APP_PATH}/static/css/cartstyle.css" rel="stylesheet"
	type="text/css" />
<link href="${APP_PATH}/static/css/optstyle.css" rel="stylesheet"
	type="text/css" />
<script type="text/javascript"
	src="${APP_PATH }/static/js/jquery-1.11.1.min.js"></script>
<link
	href="${APP_PATH }/static/bootstrap-3.3.7-dist/css/bootstrap.min.css"
	rel="stylesheet">
<script
	src="${APP_PATH }/static/bootstrap-3.3.7-dist/js/bootstrap.min.js"></script>
<script type="text/javascript">
	$(function() {

		Mypublish();

		//点击确认修改按钮
		$("#edit_btn").click(function() {
			var goodsid = $(this).attr("goodsid");

			//验证表单数据
			if (!validate_add_form()) {
				return false;
			}

			//alert($("#editModal form").serialize());
			//jquery获取input file文件名
			var file = $("#img_input").val();
			var fileName = getFileName(file);
			function getFileName(o) {
				var pos = o.lastIndexOf("\\");
				return o.substring(pos + 1);
			}
			$.ajax({
				url : "${APP_PATH}/edit_publish?goodsid=" + goodsid,
				data : $("#editModal form").serialize() + "&img=" + fileName,
				type : "POST",
				success : function(result) {
					console.log(result);
					alert("修改商品成功");
					$("#editModal").modal('hide');
					location.replace(location);
				}
			});
		});
		//点击修改按钮弹出模态框
		$("#edit").click(function() {
			var goodsid = $(this).attr("name");
			getGoods(goodsid);
			//将goodsid传给确认修改按钮
			$("#edit_btn").attr("goodsid", goodsid);
			$("#editModal").modal({
				backdrop : "static"
			});
		});

		//全选删除按钮
		$("#check_all").click(function() {
			$(".check_item").prop("checked", $(this).prop("checked"));
		});
		$(".check_item").click(function() {
			var flag = $(".check_item:checked").length == $(".check_item").length;
			$("#check_all").prop("checked", flag);
		});


		//商品后边的删除按钮
		$(".delete").click(function() {
			//先获取商品名字
			var goodName = $(this).attr("id");
			//获取商品id
			var goodid = $(this).attr("name");
			if (confirm("确认删除【" + goodName + "】吗？")) {
				//确认，发送ajax请求删除即可
				$.ajax({
					url : "${APP_PATH}/delPublish?goodsid=" + goodid,
					type : "DELETE",
					success : function(result) {
						location.replace(location);
					}
				});
			}
		});

		//点击全部删除，就批量删除
		$("#deleteBatch").click(function() {
			var del_idstr = "";
			$.each($(".check_item:checked"), function() {
				//组装商品id字符串
				del_idstr += $(this).attr("name") + "-";
			});
			//去除删除的id多余的-
			del_idstr = del_idstr.substring(0, del_idstr.length - 1);
			if (confirm("确认删除 选中项 吗？")) {
				//发送ajax请求删除
				$.ajax({
					url : "${APP_PATH}/delPublish_all?del_idstr=" + del_idstr,
					type : "DELETE",
					success : function() {
						location.replace(location);
					}
				});
			}
		});
	});

	//根据username查询出用户发布的商品
	function Mypublish() {
		var username = $("#span_username").attr("class");
		$.ajax({
			url : "getPublish?username=" + username,
			type : "GET",
			success : function(result) {
				console.log(result);
			}
		});
	}

	function getGoods(goodsid) {
		$.ajax({
			url : "${APP_PATH}/getGoods?goodsid=" + goodsid,
			type : "GET",
			success : function(result) {
				console.log(result);
				var goodData = result.extend.good;
				$("#name_input").val(goodData.name);
				$("#remark_input").val(goodData.remark);
				$("#price_input").val(goodData.price);
				$("#storenumber_input").val(goodData.storenumber);
				$("#editModal input[name=type]").val([ goodData.type ]);
				$("#editModal input[name=important]").val([ goodData.important ]);
				$("#editModal select").val([ goodData.news ]);
			}
		});
	}

	function validate_add_form() {
		var name = $("#name_input").val();
		var remark = $("#remark_input").val();
		var price = $("#price_input").val();
		var storenumber = $("#storenumber_input").val();
		var img = $("#img_input").val();

		if (name == "") {
			show_validate_msg("#name_input", "error", "商品名称不能为空");
			return false;
		} else {
			show_validate_msg("#name_input", "success", "");
		}
		if (remark == "") {
			show_validate_msg("#remark_input", "error", "商品描述不能为空");
			return false;
		} else {
			show_validate_msg("#remark_input", "success", "");
		}
		if (price == "") {
			show_validate_msg("#price_input", "error", "请输入商品价格");
			return false;
		} else {
			show_validate_msg("#price_input", "success", "");
		}
		if (storenumber == "") {
			show_validate_msg("#storenumber_input", "error", "请输入库存");
			return false;
		} else {
			show_validate_msg("#storenumber_input", "success", "");
		}
		if (img == "") {
			show_validate_msg("#img_input", "error", "请上传商品图片");
			return false;
		} else {
			show_validate_msg("#img_input", "success", "");
		}
		return true;
	}
	//显示错误（红色）成功（绿色）提示
	function show_validate_msg(ele, status, msg) {
		//清除之前验证状态
		$(ele).parent().removeClass("has-success has-error");

		if ("success" == status) {
			$(ele).parent().addClass("has-success");
			$(ele).next("span").text(msg);
		} else if ("error" == status) {
			$(ele).parent().addClass("has-error");
			$(ele).next("span").text(msg);
		}
	}

	function fresh() {
		window.location.reload();
	}
</script>
</head>

<body>

	<div class="modal fade" id="editModal" tabindex="-1" role="dialog"
		aria-labelledby="myModalLabel">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
					<h4 class="modal-title">修改商品</h4>
				</div>

				<div class="modal-body">
					<span class="help-block" style=color:red></span>
					<form class="form-horizontal">

						<div class="form-group">
							<label class="col-sm-2 control-label">商品名称</label>
							<div class="col-sm-10">
								<input type="text" name="name" class="form-control"
									id="name_input" placeholder="不可超过8个字符" maxlength="8"> <span
									class="help-block"></span>
							</div>
						</div>

						<div class="form-group">
							<label class="col-sm-2 control-label">商品描述</label>
							<div class="col-sm-10">
								<input type="text" name="remark" class="form-control"
									id="remark_input" placeholder="不可超过12个字符" maxlength="12">
								<span class="help-block"></span>
							</div>
						</div>

						<div class="form-group">
							<label class="col-sm-2 control-label">价格(元)</label>
							<div class="col-sm-10">
								<input style=width:130px type="text" name="price"
									class="form-control" id="price_input" placeholder="请输入商品价格">
								<span class="help-block"></span>
							</div>
						</div>

						<div class="form-group">
							<label class="col-sm-2 control-label">库存(件)</label>
							<div class="col-sm-10">
								<input style=width:130px type="text" name="storenumber"
									class="form-control" id="storenumber_input"
									placeholder="请输入商品库存"> <span class="help-block"></span>
							</div>
						</div>

						<div class="form-group">
							<label class="col-sm-2 control-label">几成新</label>
							<div class="col-sm-10">
								<select class="form-control" style=width:80px name="news">
									<option>1</option>
									<option>2</option>
									<option>3</option>
									<option>4</option>
									<option>5</option>
									<option>6</option>
									<option>7</option>
									<option>8</option>
									<option>9</option>
									<option>10</option>
								</select>
							</div>
						</div>

						<div class="form-group">
							<label class="col-sm-2 control-label">更改图片</label>
							<div class="col-sm-10">
								<input type="file" name="img" class="form-control"
									id="img_input" placeholder="上传商品图片"
									accept="image/gif, image/jpeg"> <span
									class="help-block"></span>
							</div>
						</div>

						<div class="form-group">
							<label class="col-sm-2 control-label">商品类型</label>
							<div class="col-sm-10">
								<label class="radio-inline"> <input type="radio"
									name="type" id="type_input" value="m" checked="checked">
									男装
								</label> <label class="radio-inline"> <input type="radio"
									name="type" id="type_input" value="f"> 女装
								</label>
							</div>
						</div>

						<div class="form-group">
							<label class="col-sm-2 control-label">更改为重要商品</label>
							<div class="col-sm-10">
								<label class="radio-inline"> <input type="radio"
									name="important" id="important_input" value="1"
									checked="checked"> 是
								</label> <label class="radio-inline"> <input type="radio"
									name="important" id="important_input" value="0"> 否
								</label>
							</div>
						</div>

					</form>
					<button id="edit_btn" style=float:right;margin-right:60px>确认修改</button>
				</div>
			</div>
		</div>
	</div>




	<span class="${sessionScope.username }" id="span_username"></span>

	<!--顶部导航条 -->
	<div class="am-container header">
		
		<ul class="message-r">
			<div class="topMessage home">
				<div class="menu-hd">
					<a href="index.jsp" target="_top" class="h">商城首页</a>
				</div>
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

	<!--购物车 -->
	<div class="concent">
		<div id="cartTable">
			<div class="cart-table-th">
				<div class="wp">
					<div class="th th-chk">
						<div id="J_SelectAll1" class="select-all J_SelectAll"></div>
					</div>
					<div class="th th-item">
						<div class="td-inner">商品信息</div>
					</div>
					<div class="th th-price">
						<div class="td-inner">单价</div>
					</div>
					<div class="th th-sum">
						<div class="td-inner">库存</div>
					</div>
					<div class="th th-op">
						<div class="td-inner">操作</div>
					</div>
				</div>
			</div>
			<div class="clear"></div>

			<tr class="item-list">
				<div class="bundle  bundle-last ">
					<div class="bundle-hd">
						<div class="bd-promos">
							<div class="bd-has-promo">
								<span class="bd-has-promo-content"></span>&nbsp;&nbsp;
							</div>
						</div>
					</div>
					<div class="clear"></div>
					<div class="bundle-main">



						<c:forEach items="${sessionScope.goodsList }" var="item">
							<ul class="item-content clearfix">
								<li class="td td-chk">
									<div class="cart-checkbox ">
										<input class="check_item" id="J_CheckBox_170037950254"
											name="${item.goodsid } " value="170037950254" type="checkbox">
										<label for="J_CheckBox_170037950254"></label>
									</div>
								</li>
								<li class="td td-item">
									<div class="item-pic">
										<a target="_blank" class="J_MakePoint"> <img
											src="${APP_PATH }${item.img}" width="63" height="80"
											class="itempic J_ItemImg"></a>
									</div>
									<div class="item-info">
										<div class="item-basic-info">
											<a target="_blank" class="item-title J_MakePoint"
												data-point="tbcart.8.11">${item.name }</a>
										</div>
										<div class="item-basic-info">
											<a target="_blank" class="item-title J_MakePoint"
												data-point="tbcart.8.11" name="" id="imp"></a>
										</div>
									</div>
								</li>
								<li class="td td-info">
									<div class="item-props item-props-can">
										<span>描述：${item.remark }</span> <span class="sku-line">包装：箱装</span>
										<span tabindex="0" class="btn-edit-sku theme-login"></span> <i
											class="theme-login am-icon-sort-desc"></i>
									</div>
								</li>
								<li class="td td-price">
									<div class="item-price price-promo-promo">
										<div class="price-content">
											<div class="price-line">
												<em class="J_Price price-now" tabindex="0">${item.price }</em>
											</div>
										</div>
									</div>
								</li>

								<li class="td td-sum">
									<div class="td-inner">
										<em tabindex="0" class="J_ItemSum number">${item.storenumber }</em>
									</div>
								</li>
								<li class="td td-op">
									<div class="td-inner">
										<a class="btn-fav" href="#" id="edit" name="${item.goodsid }">
											修改</a> <a href="" id="${item.name }" name="${item.goodsid }"
											data-point-url="#" class="delete" style=color:red> 删除</a>
									</div>
								</li>
							</ul>
						</c:forEach>




					</div>
				</div>
			</tr>


		</div>
		<div class="clear"></div>

		<div class="float-bar-wrapper">
			<div id="J_SelectAll2" class="select-all J_SelectAll">
				<div class="cart-checkbox">
					<input class="check-all check" id="check_all" name="select-all"
						value="true" type="checkbox"> <label for="J_SelectAllCbx2"></label>
				</div>
				<span>全选</span>
			</div>
			<div class="operations">
				<a href="#" hidefocus="true" id="deleteBatch">删除选中项</a>
			</div>
			<div class="float-bar-right">
				<div class="amount-sum">
					<span class="txt"></span> <em id="J_SelectedItemsCount"></em><span
						class="txt"></span>
					<div class="arrow-box">
						<span class="selected-items-arrow"></span> <span class="arrow"></span>
					</div>
				</div>

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

	<!--操作页面-->

	<div class="theme-popover-mask"></div>

	<div class="theme-popover">
		<div class="theme-span"></div>
		<div class="theme-poptit h-title">
			<a href="javascript:;" title="关闭" class="close">×</a>
		</div>
		<div class="theme-popbod dform">
			<form class="theme-signin" name="loginform" action="" method="post">

				<div class="theme-signin-left">

					<li class="theme-options">
						<div class="cart-title">颜色：</div>
						<ul>
							<li class="sku-line selected">12#川南玛瑙<i></i></li>
							<li class="sku-line">10#蜜橘色+17#樱花粉<i></i></li>
						</ul>
					</li>
					<li class="theme-options">
						<div class="cart-title">包装：</div>
						<ul>
							<li class="sku-line selected">包装：裸装<i></i></li>
							<li class="sku-line">两支手袋装（送彩带）<i></i></li>
						</ul>
					</li>
					<div class="theme-options">
						<div class="cart-title number">数量</div>
						<dd>
							<input class="min am-btn am-btn-default" name="" type="button"
								value="-" /> <input class="text_box" name="" type="text"
								value="1" style="width:30px;" /> <input
								class="add am-btn am-btn-default" name="" type="button"
								value="+" /> <span class="tb-hidden">库存<span
								class="stock">1000</span>件
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
					<div class="img-info"></div>
					<div class="text-info">
						<span class="J_Price price-now">¥39.00</span> <span id="Stock"
							class="tb-hidden">库存<span class="stock">1000</span>件
						</span>
					</div>
				</div>

			</form>
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