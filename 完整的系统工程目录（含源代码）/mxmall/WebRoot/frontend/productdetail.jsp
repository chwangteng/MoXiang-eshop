<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="com.wt.po.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="zh">
<head>
<jsp:include page="htmlhead.jsp"></jsp:include>
<title>${product.productname}</title>
</head>
<!--/head-->

<body>
	<jsp:include page="header.jsp"></jsp:include>

	<section>
	<div class="container">
		<div class="row">
			<div class="col-sm-3">
				<jsp:include page="leftbar.jsp"></jsp:include>
			</div>

			<div class="col-sm-9 padding-right">

				<div class="product-details">
					<!--product-details-->
					<div class="col-sm-5">
						<div class="view-product">
							<img src="images/products/${product.productid}/thumbnail.jpg"
								alt="" />
						</div>
					</div>
					<div class="col-sm-7">
						<div class="product-information">
							<!--/product-information-->

							<c:set var="producttag" value="${product.producttag}" />
							<c:set var="official" value="自营" />
							<c:if test="${producttag==official}">
								<img src="images/official.png" class="new" alt="" />
							</c:if>
							
							<h2>${product.productname}</h2>
							<p>库存：${product.productstock}件</p>
							<span> <span>¥${product.productprice}</span>


							<form action="../addCart.action" method=post>
								<div class="col-sm-12" style="margin-left:0px;padding-left:0px;">
									<label>数量:</label>
									<input name="productid" value="${product.productid}" type="hidden"> 
									<input name="oderitemquantity" type="text" value="1" />
								</div>
								
								<div class="col-sm-12" style="margin-left:0px;padding-left:0px;">
								<button type="submit" style="margin-left:0px;margin-top:20px;"
									class="btn btn-fefault cart">
									<i class="fa fa-shopping-cart"></i> 添加到购物车
								</button>
								</div>
							</form>
								
							</span>

						</div>
						<!--/product-information-->
					</div>
				</div>
				<!--/product-details-->

				<div class="category-tab shop-details-tab">
					<!--category-tab-->
					<div class="col-sm-12">
						<ul class="nav nav-tabs">
							<li class="active"><a href="#details" data-toggle="tab">商品详情</a></li>
							<li><a href="#reviews" data-toggle="tab">留言(  ${fn:length(messagelist)}  )</a></li>
						</ul>
					</div>
					<div class="tab-content">
						<div class="tab-pane fade active in" id="details">
							<div class="col-sm-12">
								<img style="width:100%;" alt=""
									src="images/products/${product.productid}/detail.jpg" />
							</div>
						</div>

						<div class="tab-pane fade" id="reviews">
							<div class="col-sm-12">
							
							
							
							
							<c:forEach var="message" items="${messagelist}" varStatus="status">
								<ul>
									<li><a href=""><i class="fa fa-user"></i>${message.user.username}</a></li>
									<li><a href=""><i class="fa fa-clock-o"></i>${message.messagetime}</a></li>
								</ul>
								<p>${message.messagecontent}</p>
							</c:forEach>

								
								
								<p>
									<b>发表新留言</b>
								</p>
								<form action="../addMessage.action" id="contentform" method="post" role="form">
									<input name="productid" value="${product.productid}" type="hidden">
									<textarea name="content" placeholder="与世界分享你的知识、经验和见解"></textarea>
									<button type="button" class="btn btn-default pull-right" id="contentsubmit">
										提交</button>
								</form>
							</div>
						</div>

					</div>
				</div>
				<!--/category-tab-->

				<jsp:include page="recommended_items.jsp"></jsp:include>
			</div>
		</div>
	</div>
	</section>
	<jsp:include page="footer.jsp"></jsp:include>
</body>
<script>
	$(document).ready(function() {

		$("#contentsubmit").click(function() {
			$("#contentform").submit();
			//window.location.reload();
		});
	});



</script>
</html>