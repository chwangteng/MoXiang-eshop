<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="com.wt.po.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="/struts-tags" prefix="s"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>摸象商城后台管理</title>
<jsp:include page="htmlhead.jsp"></jsp:include>

    
    <link href="../frontend/css/font-awesome.min.css" rel="stylesheet">
    <link href="../frontend/css/prettyPhoto.css" rel="stylesheet">
    <link href="../frontend/css/price-range.css" rel="stylesheet">
    <link href="../frontend/css/animate.css" rel="stylesheet">
	<link href="../frontend/css/main.css" rel="stylesheet">
	<link href="../frontend/css/responsive.css" rel="stylesheet">
	
    <!--[if lt IE 9]>
    <script src="../js/html5shiv.js"></script>
    <script src="../js/respond.min.js"></script>
    <![endif]-->       
    
    
	
	<script src="../frontend/js/jquery.scrollUp.min.js"></script>
	<script src="../frontend/js/price-range.js"></script>
    <script src="../frontend/js/jquery.prettyPhoto.js"></script>
    <script src="../frontend/js/main.js"></script>



</head>
<body>
	<div class="mainwrapper">

		<jsp:include page="header.jsp"></jsp:include>
		<jsp:include page="leftpanel.jsp"></jsp:include>

		<div class="rightpanel">
			<div class="maincontent">
				<div class="maincontentinner">
				
					<c:forEach var="order" items="${orderlist}" varStatus="status">
						<section id="cart_items">
						<div >
							<div class="table-responsive cart_info">
								<table class="table table-condensed">
									<thead>
										<tr class="cart_menu">
											<td class="image">---商品概要---</td>
											<td class="description" width="40%">下单时间:${order.ordertime}&nbsp买家:${order.user.username}</td>
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
														src="../frontend/images/products/${item.product.productid}/thumbnail.jpg"
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
														<label style="padding-left:20px;"
															class="cart_quantity_input">${item.oderitemquantity}</label>
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
															</c:if> <c:if test="${order.orderstate.orderstateid<3}">
																<buttton type="button" class="btn btn-danger"
																	style="margin-left:20px;"> <a
																	style="color:#fff"
																	href="../cancalorderbyadmin.action?orderid=${order.orderid}">
																	取消买家订单 </a> </buttton>
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
				</div>
			</div>
		</div>
	</div>
</body>
</html>