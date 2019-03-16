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

	<form action="../executeOrder.action" method="post" role="form" id="orderform">

	<section id="cart_items">
	<div class="container">
		<div class="row">
			<div class="col-sm-6">
				<div class="breadcrumbs">
					<h2>提交订单</h2>
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
						<td class="description" width="40%"></td>
						<td class="price">商品单价</td>
						<td class="quantity">商品数量</td>
						<td class="total">金额小记</td>

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
						</tr>
					</c:forEach>

					<tr>
						<td colspan="4">&nbsp;</td>
						<td colspan="2">
							<table class="table table-condensed total-result">
								<tr>
									<td>订单金额</td>
									<td>¥<span id="totalmoney">${order.orderpricetotal}</span></td>
								</tr>
								<tr>
									<td>可用积分</td>
									<td id="totalpoint">${user.userpoint}&nbsp&nbsp（每100积分抵扣1元）</td>
								</tr>
								<tr>
									<td>使用积分</td>
									<td>
										<div class="input-group">
											<input value="${order.orderpricepoint}" id="orderpricepoint"
												name="orderpricepoint" type="text" class="form-control">
											<span class="input-group-btn">
												<button class="btn btn-default" type="button" id="usepoint">使用</button>
											</span>
										</div> <!-- /input-group -->
									</td>

								</tr>
								<tr class="shipping-cost">
									<td>运费</td>
									<td>¥0</td>
								</tr>
								<tr>
									<td>需付款</td>
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


	<section id="do_action">
	<div class="container">

		<c:set var="username" value="${user.username}" />
		<c:set var="logout" value="游客" />
		<c:if test="${username!=logout}">
			<div class="row">
				<div class="col-sm-4">
					选择收件人<a href="consignee.jsp" class="btn">去新建收件人</a>
				</div>
				<div class="col-sm-8">
					<select class="form-control" name="consigneeid">
						<c:forEach var="consignee" items="${consigneelist}"
							varStatus="status">
							<option value="${consignee.consigneeid}">${consignee.consigneename}|${consignee.consigneephone}|${consignee.consigneeaddress}</option>
						</c:forEach>
					</select>
				</div>
			</div>
		</c:if>


		<c:if test="${username==logout}">
			<div class="row">
				<div class="col-sm-5">新收件人</div>
				<div class="col-sm-7">
					<div class="form-inline" role="form">
						<div class="form-group">
							<input name="consigneename" type="text" class="form-control" id="" placeholder="收件人">
						</div>
						<div class="form-group">
							<div class="input-group">
								<input name="consigneephone" class="form-control" type="text" placeholder="联系电话">
							</div>
						</div>
						<div class="form-group">
							<input name="consigneeaddress" type="text" class="form-control" id=""
								placeholder="收件地址">
						</div>
					</div>
				</div>
			</div>
		</c:if>


		<div class="row">
			<div class="col-sm-8"></div>
			<div class="col-sm-4">
				<a class="btn btn-default check_out pull-right" href="javascript:void(0)" id="subm">提交订单</a>
			</div>
		</div>
		
	</div>
	</section>
	<!--/#do_action-->


	</form>

	<jsp:include page="footer.jsp"></jsp:include>
</body>
<script>
	$(document).ready(function() {
		$("#usepoint").click(function() {

			var totalmoney = $("#totalmoney").text() - 0;
			var pointuse = $("#orderpricepoint").val() - 0;

			var totalpoint = $("#totalpoint").text() - 0;

			if (pointuse > totalpoint) {
				alert("使用的积分超出拥有数！");
				$("#orderpricepoint").val(0);
				$("#money").text(totalmoney);
				return false;
			}

			var result = totalmoney - (pointuse / 100);

			$("#money").text(result);
		});
		$("#subm").click(function() {
			$("#orderform").submit();
		});
	});
</script>
</html>