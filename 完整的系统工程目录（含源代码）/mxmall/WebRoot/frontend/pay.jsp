<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="com.wt.po.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="/struts-tags" prefix="s"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="zh">
<head>
<jsp:include page="htmlhead.jsp"></jsp:include>
<title>付款</title>
</head>
<!--/head-->

<body>
	<jsp:include page="header.jsp"></jsp:include>

	<div class="container">
	<div class="row">
		<div class="col-sm-4">
		</div>
		<div class="col-sm-4">
			<div class="hero-unit">
				<h1>您将支付${order.orderpricereal}元</h1>
				<p>验证码不能告诉任何人！告诉你去其他网站支付的都是骗子！</p>
				<p>验证码不能告诉任何人！告诉你去其他网站支付的都是骗子！</p>
				<p>验证码不能告诉任何人！告诉你去其他网站支付的都是骗子！</p>
				<p>
					<a class="btn btn-primary btn-large"
						href="../displayPurchase.action">查看订单</a> 
					<a
						class="btn btn-primary btn-large"
						href="../pay.action?orderid=${order.orderid}">确认付款</a>
				</p>
			</div>
		</div>
		<div class="col-sm-4">
		</div>
	</div>
</div>
	<jsp:include page="footer.jsp"></jsp:include>
</body>
</html>