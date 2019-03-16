<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="com.wt.po.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="/struts-tags" prefix="s"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="zh">
<head>
<title>登录摸象</title>
<script src="js/jquery.js"></script>
<script src="js/bootstrap.min.js"></script>
<script src="js/jquery.scrollUp.min.js"></script>
<script src="js/price-range.js"></script>
<script src="js/jquery.prettyPhoto.js"></script>
<script src="js/main.js"></script>
<link rel="stylesheet" href="style/login/style.css" type="text/css">
<style>
.footer {
	clear: both;
	text-align: center;
	margin-top: 30px;
}

.footer_links a {
	padding: 0px 10px 0px 10px;
	text-decoration: none;
	font-size: 13px;
	color: #666;
	font-family: 微软雅黑;
}

.copyright {
	padding: 20px 0;
	font-size: 13px;
	color: #666;
	font-family: 微软雅黑;
}
</style>
</head>
<!--/head-->

<body>

	<div class="wrap">
		<div id="logo">
			<a href="index.jsp"><img width="298" height="60" alt="摸象"
				src="images/logowithwelcome.png"></a>
		</div>
	</div>
	<div id="content">
		<div class="login_wrap">
			<div class="login_banner">
				<div class="mask"></div>
				<div class="slogan"></div>
				<video src="videos/login_video.mp4" width="1366" height="476"
					loop="" autoplay="">浏览器不支持MPEG4视频</video>
				<div class="login_part" style="height:280px;">
					<div class="login_form">
						<form action="../login.action" role="form" method="post"
							id="loginform">
							<h1>
								登录摸象
								<h1>
									<div class="name">
										<label class="name_label"></label> <input class="text"
											type="text" name="username" id="username" placeholder="用户名" />
									</div>
									<div class="psd">
										<label class="psd_label"></label> <input class="text"
											type="password" name="userpassword" id="password"
											placeholder="密码" />
									</div>
									<div class="button">
										<div class="button_bg">
											<input type="submit" value="登&nbsp;&nbsp;&nbsp;&nbsp;录" />
										</div>
									</div>
									<div class="tips" id="warning"></div>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>


	<div class="wrap">
		<div class="footer">
			<div class="footer_links">
				<a href="#" target="_blank">关于我们</a>| <a href="#" target="_blank">联系我们</a>|
				<a href="#" target="_blank">人才招聘</a>| <a href="#" target="_blank">商家入驻</a>|
				<a href="#" target="_blank">手机商城</a>| <a href="#" target="_blank">电商联盟</a>|
				<a href="#" target="_blank">广告服务</a>| <a href="//www.jd.com"
					target="_blank">友情链接</a>| <a href="#" target="_blank">English
					Site</a>
			</div>
			<div class="copyright">Copyright©2016 摸象MX.com 版权所有</div>
		</div>
	</div>
</body>

<script>
	$(document).ready(function() {

		//服务器端检测登录表单是否成功
		$("#loginform").submit(function() {
			var submitable = false;
			//异步通信
			$.ajax({
				type : "POST",
				url : "../login.action",
				data : $('#loginform').serialize(),
				error : function(request) {
					alert("与服务器通信异常，请稍后再试");
				},
				success : function(data) {
					if (data != "") {
						//alert(data);
						$("#warning").text(data);
						$("#warning").css("visibility", "visible");
						$("#warning").fadeTo("normal", 0.3);
						$("#warning").fadeTo("normal", 1);
					} else {
						//alert("登录成功");
						submitable = true;
						window.location = "../FeaturesAction.action"
					}
				}
			});
			return submitable;
		});

	});
</script>

</html>