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
    <title>摸象mx.com</title>
</head><!--/head-->

<body>
	<jsp:include page="header.jsp"></jsp:include>
	<jsp:include page="slider.jsp"></jsp:include>
	
	
	<section>
		<div class="container">
			<div class="row">
				<div class="col-sm-3">
					<jsp:include page="leftbar.jsp"></jsp:include>
				</div>
				
				<div class="col-sm-9 padding-right">
					<div class="features_items"><!--features_items-->
						<h2 class="title text-center">热销特卖</h2>
						
						<c:forEach var="product" items="${featureslist}" varStatus="status">
						<div class="col-sm-4">
							<div class="product-image-wrapper">
								<div class="single-products">
										<div class="productinfo text-center">
										
											<a href="../displayProductDetail.action?productid=${product.productid}">
											<img src="images/products/${product.productid}/thumbnail.jpg" alt="" />
											</a>
											
											<h2>¥${product.productprice}</h2>
											<p>${product.productname}</p>
											<a href="../addCart?productid=${product.productid}&oderitemquantity=1" class="btn btn-default add-to-cart">
												<i class="fa fa-shopping-cart"></i>加入购物车
											</a>
										</div>
										<c:set var="producttag" value="${product.producttag}"/>
										<c:set var="official" value="自营"/>
										<c:if test="${producttag==official}">
											<img src="images/official.png" class="new" alt="" />
										</c:if>
								</div>
							</div>
						</div>
						</c:forEach>
						
					</div><!--features_items-->
					<jsp:include page="recommended_items.jsp"></jsp:include>
				</div>
			</div>
		</div>
	</section>
	<jsp:include page="footer.jsp"></jsp:include>
</body>
</html>