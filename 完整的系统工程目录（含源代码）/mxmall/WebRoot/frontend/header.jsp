<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="com.wt.po.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="/struts-tags" prefix="s"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<header id="header"><!--header-->
<div class="header_middle">
	<!--header_top-->
	<div class="container">
		<div class="row">
			<div class="col-sm-4">
				<div class="shop-menu pull-left" style="padding-top:10px;">
					欢迎您，${user.username}</div>
			</div>
			<div class="col-sm-8">
				<div class="shop-menu pull-right">
					<ul class="nav navbar-nav">
						<li><a href="../displayPurchase.action"><i
								class="fa fa-user"></i> 我买到的</a></li>


						<c:set var="username" value="${user.username}" />
						<c:set var="logout" value="游客" />
						<c:if test="${username!=logout}">
							<li><a href="../displaySold.action"><i
									class="fa fa-star"></i> 我卖出的</a></li>
							<li><a href="../displayonsale.action"><i
									class="fa fa-star"></i> 我在售的</a></li>
							<li><a href="consignee.jsp"><i
									class="fa fa-star"></i> 收货地址</a></li>
						</c:if>


						<!--  
						<li><a href="../preparecheckout.action"><i class="fa fa-crosshairs"></i>
								结算</a></li>
						-->
						<li><a href="cart.jsp"><i class="fa fa-shopping-cart"></i>
								购物车( ${fn:length(cart)} )</a></li>
								
								
						<c:if test="${username==logout}">
						<li><a href="login.jsp"><i class="fa fa-key"></i> 登录</a></li>
						<li><a href="register.jsp"><i class="fa fa-edit"></i> 注册</a></li>
						</c:if>
						
						
						
						<c:if test="${username!=logout}">
						<li>
							<a href="../logout.action"><i class="fa fa-lock"></i>注销</a>
						</li>
						<li>
							<a href="javascript:void(0)"><i class="fa fa-coin"></i>积分：${user.userpoint}</a>
						</li>
						</c:if>
					</ul>
				</div>
			</div>
		</div>
	</div>
</div>
<!--/header_top-->


<div class="header-middle">
	<!--header-middle-->
	<div class="container">
		<div class="row">
			<div class="col-sm-4">
				<div class="logo pull-left">
					<a href="../"> <!-- <span>在线</span>-Shop</a> --> <img
						alt="摸象商城" src="images/logo.jpg" height="55px">
				</div>
				<div class="btn-group pull-right">
					<div class="btn-group">
						<button type="button" class="btn btn-default dropdown-toggle usa"
							data-toggle="dropdown">
							浙江 <span class="caret"></span>
						</button>
						<ul class="dropdown-menu">
							<li><a href="javascript:void(0)">江苏</a></li>
							<li><a href="javascript:void(0)">上海</a></li>
							<li><a href="javascript:void(0)">海外</a></li>
						</ul>
					</div>

					<div class="btn-group">
						<button type="button" class="btn btn-default dropdown-toggle usa"
							data-toggle="dropdown">
							简体中文 <span class="caret"></span>
						</button>
						<ul class="dropdown-menu">
							<li><a href="javascript:void(0)">繁體中文</a></li>
							<li><a href="javascript:void(0)">English</a></li>
						</ul>
					</div>

				</div>
			</div>
			<form action="../search.action">
			<div class="col-sm-7">
				<div class="mysearch_box pull-right">
					<input type="text" placeholder="输入商品名称..." name="keyword"/>
				</div>
			</div>
			<div class="col-sm-1">
				<div class="mysearch_box_button pull-right">
					<input type="submit" value="搜索" />
				</div>
			</div>
			</form>
		</div>
	</div>
</div>
<!--/header-middle--> </header>
<!--/header-->