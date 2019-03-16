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
<title>我的订单</title>
</head>
<!--/head-->

<body>
	<jsp:include page="header.jsp"></jsp:include>

	<c:if test="${fn:length(orderlist)==0}">
		<div class="row">
			<div class="col-sm-12">
				<div style="width:300px; height:250px;"></div>
				<h2 class="title text-center">
					<strong>您还没有购买商品</strong>
				</h2>
				<div style="width:300px; height:250px;"></div>
			</div>
		</div>
		</div>
	</c:if>



	<c:forEach var="order" items="${orderlist}" varStatus="status">
		<section id="cart_items">
		<div class="container">
			<div class="table-responsive cart_info">
				<table class="table table-condensed">
					<thead>
						<tr class="cart_menu">
							<td class="image">---商品概要---</td>
							<td class="description" width="40%">下单时间:${order.ordertime}</td>
							<td class="price">商品单价</td>
							<td class="quantity">商品数量</td>
							<td class="total">金额小记</td>

							<td></td>
						</tr>
					</thead>
					<tbody>


						<c:forEach var="item" items="${order.oderitems}"
							varStatus="status">
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
							</tr>
						</c:forEach>

						<tr>
							<td colspan="4">
								<table class="table table-condensed total-result">
									<tr>
										<td>收件人</td>
										<td>${order.consignee.consigneename}</td>
									</tr>
									<tr>
										<td>电话</td>
										<td>${order.consignee.consigneephone}</td>
									</tr>
									<tr>
										<td>配送地址</td>
										<td>${order.consignee.consigneeaddress}</td>
									</tr>
									<tr>
										<td><span>订单状态</span></td>
										<td><c:if test="${order.orderstate.orderstateid==4}">
												<span style="color:#449d44">${order.orderstate.orderstatename}</span>
											</c:if> <c:if test="${order.orderstate.orderstateid!=4}">
												<span>${order.orderstate.orderstatename}</span>
											</c:if> <c:if test="${order.orderstate.orderstateid==1}">
												<buttton type="button" class="btn btn-success"
													style="margin-left:20px;"> <a style="color:#fff"
													href="../preparepay.action?orderid=${order.orderid}">
													去支付 </a> </buttton>
													<buttton type="button" class="btn btn-danger"
													style="margin-left:20px;"> <a style="color:#fff"
													href="../cancalorder.action?orderid=${order.orderid}">
													取消订单 </a> </buttton>
											</c:if> <c:if test="${order.orderstate.orderstateid==3}">
												<buttton type="button" class="btn btn-info"
													style="margin-left:20px;"> <a style="color:#fff"
													href="../confirmReceived.action?orderid=${order.orderid}">
													确认收货 </a></buttton>
											</c:if></td>
									</tr>
								</table>
							</td>
							<td colspan="2">
								<table class="table table-condensed total-result">
									<tr>
										<td>订单金额</td>
										<td>¥<span id="totalmoney">${order.orderpricetotal}</span></td>
									</tr>
									<tr>
										<td>使用积分</td>
										<td>${order.orderpricepoint}</td>
									</tr>
									<tr class="shipping-cost">
										<td>运费</td>
										<td>¥0</td>
									</tr>
									<tr>
										<td>实际金额</td>
										<td>¥<span id="money">${order.orderpricereal}</span></td>
									</tr>
								</table>
							</td>
						</tr>

					</tbody>
				</table>
			</div>
		</div>
		</section>
		<!--/#cart_items-->


	</c:forEach>

	<jsp:include page="footer.jsp"></jsp:include>
</body>
</html>