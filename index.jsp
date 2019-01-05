<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<%
	pageContext.setAttribute("APP_PATH", request.getContextPath());
%>
<head>
<meta charset="UTF-8">
<title>快乐购首页</title>

<link href="${APP_PATH}/static/css/demo.css" rel="stylesheet"
	type="text/css" />
<link rel="stylesheet" type="text/css"
	href="${APP_PATH}/static/css/head.css" />
<link rel="stylesheet" type="text/css"
	href="${APP_PATH}/static/css/index.css" />

<script type="text/javascript"
	src="${APP_PATH }/static/js/jquery-1.11.1.min.js"></script>
<link
	href="${APP_PATH }/static/bootstrap-3.3.7-dist/css/bootstrap.min.css"
	rel="stylesheet">
<script
	src="${APP_PATH }/static/bootstrap-3.3.7-dist/js/bootstrap.min.js"></script>
</head>

<script type="text/javascript">

	$(function() {
		//显示重要商品
		show_imp(1);

		<!--................................................................................................................................-->

		//轮播图效果
		var c = 0;
		//加一个时间事件
		function timer() {
			//获得序号
			c++;
			if (c == 6) {
				c = 0;
			}
			//让自己显示，兄弟元素隐藏
			$("#inBaner .big_eye_pic li").eq(c).stop().fadeIn(1800).siblings().fadeOut(800);
			//改变颜色
			$("#inBaner .btn ul li").eq(c).stop().addClass("cur").siblings().removeClass("cur");
		}
		time = setInterval(timer, 2000);
		//给图片添加一个移入移出效果
		$("#inBaner").hover(function() {
			//停止时间
			clearInterval(time);
		}, function() {
			//时间继续
			time = setInterval(timer, 2000);
		});
		//给色块添加一个移入移出事件
		$("#inBaner .btn ul li").mouseenter(function() {
			var n = $(this).index();
			//让第一个人图片显示 其余的隐藏
			$("#inBaner .big_eye_pic li").eq(n).stop().show().siblings().hide();
			//改变颜色
			$("#inBaner .btn ul li").eq(n).stop().addClass("cur").siblings().removeClass("cur");
		});
		//添加一个点击事件
		$(".her_top .her_title .her_menu li").click(function() {
			var n = $(this).index();
			//切换颜色
			$(".her_menu li").eq(n).addClass("current").siblings().removeClass("current");
			//切换商品
			$(".her_top .pro_con").eq(n).show().siblings(".pro_con").hide();
		})
		//搜索框下滑
		$(window).scroll(function() {
			//获得滚动条距离顶部距离
			var t = $(document).scrollTop();
			document.title = t;
			if (t > 530) {
				$("#nav").show();
			} else {
				$("#nav").hide();
			}
		});
		//显示重要商品
		function show_imp(pn) {
			$.ajax({
				url : "${APP_PATH}/goods_imp?pn=" + pn,
				type : "GET",
				success : function(result) {
					console.log(result);
				}
			});
		}

		//点击页码翻页
		$(".page_num").click(function() {
			var pn = $(this).text();

			show_imp(pn);
			location.reload();
			$(this).attr("style", "color:red;font-size:20px");
		});
		//首页
		$("#page_span_first").click(function() {
			show_imp(1);
			location.reload();
		});
		//末页
		$("#page_span_last").click(function() {
			show_imp(999);
			location.reload();
		});


		//我要发布商品链接
		$("#publish").click(function() {
			var username = $("#span_username").attr("class");
			if (username == "") {
				alert("请先登录");
			} else {
				$("#publishModal").modal('show');
			}
		});

		//前端验证价格是否为数字
		$("#price_input").change(function() {
			var price = $("#price_input").val();
			var reg = /^[0-9]*[1-9][0-9]*$/;
			if (!reg.test(price)) {
				show_validate_msg("#price_input", "error", "价格只能输入数字");
			} else {
				show_validate_msg("#price_input", "success", "");
			}
		});

		//前端验证库存是否为数字
		$("#storenumber_input").change(function() {
			var storenumber = $("#storenumber_input").val();
			var reg = /^[0-9]*[1-9][0-9]*$/;
			if (!reg.test(storenumber)) {
				show_validate_msg("#storenumber_input", "error", "库存只能输入数字");
			} else {
				show_validate_msg("#storenumber_input", "success", "");
			}
		});




		//点击确认发布商品
		$("#publish_btn").click(function() {

			var username = $("#span_username").attr("class");

			//验证表单数据
			if (!validate_add_form()) {
				return false;
			}

			//alert($("#publishModal form").serialize());
			//jquery获取input file文件名
			var file = $("#img_input").val();
			var fileName = getFileName(file);
			function getFileName(o) {
				var pos = o.lastIndexOf("\\");
				return o.substring(pos + 1);
			}
			//alert(fileName);
			$.ajax({
				url : "${APP_PATH}/publish?username=" + username,
				data : $("#publishModal form").serialize() + "&img=" + fileName,
				type : "POST",
				success : function(result) {
					console.log(result);
					alert("发布商品成功");
					$("#publishModal").modal('hide');
				}
			});
		});

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

	});
</script>
</head>
<body>
	<span id="span_username" class="${sessionScope.username }"></span>

	<div class="modal fade" id="publishModal" tabindex="-1" role="dialog"
		aria-labelledby="myModalLabel">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">

					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
					<h4 class="modal-title">发布商品</h4>
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
							<label class="col-sm-2 control-label">上传图片</label>
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
							<label class="col-sm-2 control-label">发布为重要商品</label>
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
					<button id="publish_btn" style=float:right;margin-right:60px>确认发布商品</button>
				</div>
			</div>
		</div>
	</div>







	<div class="hmtop">
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
						<a href="#" target="_top" class="h"></a>
					</div>
				</div>
				<div class="topMessage my-shangcheng">
					<div class="menu-hd MyShangcheng">
						<a id="publish" target="_top"><i
							class="am-icon-heart am-icon-fw"></i><span style=color:orange>我要发布商品</span></a>

					</div>
				</div>

				<div class="topMessage favorite">
					<div class="menu-hd">
						<a href="publish.jsp" target="_top" id="find_publish"><i
							class="am-icon-user am-icon-fw"></i>查看我发布的商品</a>
					</div>
			</ul>
		</div>
		<br> <br> <br>
		<div class="clear"></div>
		<!--菜单-->
		<div class="full_nav">
			<div class="w1200">
				<ul class="nav">
					<li class="li_all_type"><a href="">全部分类</a></li>
					<li class="home"><a href="">首页</a></li>
					<li><a href="">精选品牌</a></li>
					<li><a href="">全球购</a></li>
					<li><a href="">品牌馆</a></li>
				</ul>
			</div>
		</div>
		<br>
		<!--头部end-->
		<!--轮播区域-->
		<div class="full_big_eye">
			<!--菜单-->
			<div class="index_type">
				<ul class="index_type_ul">
					<li><a href="search.jsp?type=m" style=color:blue><span>二手男装<b>></b></span></a>
						<div class="nav_type_list" data="1"></div></li>
					<li><a href="search.jsp?type=f" style=color:blue><span>二手女装<b>></b></span></a>
						<div class="nav_type_list" data="1"></div></li>
					<li><span>长款羽绒<b>></b></span>
						<div class="nav_type_list" data="1"></div></li>
					<li><span>牛仔裤<b>></b></span>
						<div class="nav_type_list" data="1"></div></li>
					<li><span>针织衫<b>></b></span>
						<div class="nav_type_list" data="1"></div></li>
					<li><span>个性卫衣<b>></b></span>
						<div class="nav_type_list" data="1"></div></li>
					<li><span>夹克<b>></b></span>
						<div class="nav_type_list" data="1"></div></li>
					<li><span>棉服<b>></b></span>
						<div class="nav_type_list" data="1"></div></li>
					<li><span>风衣<b>></b></span>
						<div class="nav_type_list" data="1"></div></li>
					<li><span>西服<b>></b></span>
						<div class="nav_type_list" data="1"></div></li>
					<li><span>毛呢<b>></b></span>
						<div class="nav_type_list" data="1"></div></li>
					<li><span>马甲<b>></b></span>
						<div class="nav_type_list" data="1"></div></li>
				</ul>
			</div>
			<!--菜单-->
			<!--轮播图-->
			<div class="full_eye">
				<div id="inBaner">
					<ul class="big_eye_pic">
						<li style="display: block;"><a href="" class="img_box"> <img
								src="${APP_PATH }/static/images/pp1.jpg" />
						</a></li>
						<li><a href="" class="tpl"> <img
								src="${APP_PATH }/static/images/web-101-101-2.jpg" />
						</a></li>
						<li><a href="" class="tpl"> <img
								src="${APP_PATH }/static/images/web-101-101-3.jpg" />
						</a></li>
						<li><a href="" class="tpl"> <img
								src="${APP_PATH }/static/images/web-101-101-4.jpg" />
						</a></li>
						<li><a href="" class="tpl"> <img
								src="${APP_PATH }/static/images/web-101-101-5.jpg" />
						</a></li>
					</ul>
					<div class="btn">
						<ul>
							<li class="cur"></li>
							<li></li>
							<li></li>
							<li></li>
							<li></li>
						</ul>
					</div>
				</div>
			</div>
			<!--轮播图-->
		</div>
		<!--轮播区域-->
		<!--商品区-->
		<div class="w1200">
			<div class="her_top">
				<div class="her_title">
					<ul class="her_menu">
						<li class="current"><i class="today_zb_icon"></i> 重要商品 <i
							class="jx_icon_down"></i></li>
						<li><i class="yesto_icon"></i> 限时抢购 <i class="jx_icon_down"></i>
						</li>
					</ul>
				</div>
				<div class="pro_con" style="display: block;">
					<div class="P_left">
						<div class="groDiv">
							<div style="position: relative;overflow: hidden;">
								<ul class="groUlOut">

									<c:forEach items="${sessionScope.PageInfo.list }" var="item">
										<li style="float: left;width: 226px;"><a
											href="introduction?goodid=${ item.goodsid}&pageNum=${sessionScope.PageInfo.pageNum}"
											class="pro"> <img src="${APP_PATH }${item.img }" />
										</a>
											<p style=color:red;font-size:15px>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;${item.name }</p>
											<p>${item.remark }</p>
											<div class="price">
												<span class="bigfont">￥${item.price } </span> <br> <span
													class="bigfont">${item.news }成新 </span>
											</div></li>
									</c:forEach>

								</ul>
							</div>
						</div>
					</div>
				</div>
				<br>
				<!-- 分页信息 -->
				<div class="page_info_boot"
					style=float:left;margin-left:50px;color:orange;font-size:17px>第${sessionScope.PageInfo.pageNum }页，共${sessionScope.PageInfo.pages }页，共${sessionScope.PageInfo.total }件商品</div>
				<!-- 分页条 -->
				<div class="page_list_boot" style=float:right;margin-right:180px>
					<nav aria-label="Page navigation">
						<ul class="pagination" id="ul_pages">
							<li><span id="page_span_first">首页</span></li>
							<c:forEach items="${sessionScope.PageInfo.navigatepageNums }"
								var="item">
								<li><a class="page_num">${item }</a></li>
							</c:forEach>
							<li><span id="page_span_last">末页</span></li>
						</ul>
					</nav>
				</div>
</body>
</html>
