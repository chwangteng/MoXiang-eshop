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
<title>我的购物车</title>
</head>
<!--/head-->

<body>
	<jsp:include page="header.jsp"></jsp:include>

	<section id="cart_items">
	<div class="container">
		<div class="row">
			<div class="col-sm-6">
				<div class="breadcrumbs">
					<h2>购物车中的商品</h2>
				</div>
			</div>
			<div class="col-sm-6">
				<a class="btn btn-default update pull-right"
					onclick="history.back()">返回上一页</a>
			</div>
		</div>
		<div class="table-responsive cart_info">
			<table class="table table-condensed">
				<thead>
					<tr class="cart_menu">
						<td class="image">---商品概要---</td>
						<td class="description" width="50%"></td>
						<td class="price">商品单价</td>
						<td class="quantity">商品数量</td>
						<td class="total">金额小记</td>
						<td class="total">操作</td>
						<td></td>
					</tr>
				</thead>
				<tbody>


					<c:forEach var="item" items="${cart}" varStatus="status">
						<tr>
							<td class="cart_product"><a
								href="../displayProductDetail.action?productid=${item.product.productid}">
									<img
									src="images/products/${item.product.productid}/thumbnail.jpg"
									alt="" style="width:110px;height:110px;">
							</a></td>
							<td class="cart_description">
								<h4>
									<a
										href="../displayProductDetail.action?productid=${item.product.productid}">
										${item.product.productname} </a>
								</h4>
								<p>${item.product.productdetail}</p>
							</td>
							<td class="cart_price">
								<p>¥${item.product.productprice}</p>
							</td>
							<td class="cart_quantity">
								<div class="cart_quantity_button">
									<label style="padding-left:20px;" class="cart_quantity_input">${item.oderitemquantity}</label>
								</div>
							</td>
							<td class="cart_total">
								<p class="cart_total_price">¥${item.orderitemprice}</p>
							</td>
							<td class="cart_delete"><a class="cart_quantity_delete"
								href="../removeCart?productid=${item.product.productid}"><i
									class="fa fa-times"></i></a></td>
						</tr>
					</c:forEach>


				</tbody>
			</table>
		</div>
	</div>
	</section>
	<!--/#cart_items-->


	<section id="do_action">
	<div class="container">
		<div class="row">
			<div class="col-sm-8"></div>
			<div class="col-sm-4">
			
			<c:if test="${fn:length(cart)>0}">
				<a class="btn btn-default check_out pull-right" href="../preparecheckout.action">去结算</a>
			</c:if>
			</div>
		</div>
	</div>
	</section>
	<!--/#do_action-->


	<jsp:include page="footer.jsp"></jsp:include>
</body>
</html>