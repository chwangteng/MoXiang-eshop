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
<title>我在售的</title>
</head>
<!--/head-->

<body>
	<jsp:include page="header.jsp"></jsp:include>

	<c:set var="username" value="${user.username}" />
	<c:set var="logout" value="游客" />
	<c:if test="${username==logout}">
		<div class="row">
				<div class="col-sm-12">
					<div style="width:300px; height:250px;"></div>
					<h2 class="title text-center">
						<strong>游客不能销售，快去<a href="login.jsp" >注册</a>吧</strong>
					</h2>
					<div style="width:300px; height:250px;"></div>
				</div>
			</div>
	</c:if>



	<c:set var="username" value="${user.username}" />
	<c:set var="logout" value="游客" />
	<c:if test="${username!=logout}">

		<div class="container">
			<div class="row">
				<div class="col-sm-2">
					<button type="button" class="btn btn-success " onclick="window.location('frontend/addProduct.jsp')"><a style="color:#fff">增加商品</a></button>
				</div>
			</div>
		</div>


		<c:if test="${fn:length(onsalelist)==0}">
			<div class="row">
				<div class="col-sm-12">
					<div style="width:300px; height:250px;"></div>
					<h2 class="title text-center">
						<strong>您没有销售商品</strong>
					</h2>
					<div style="width:300px; height:250px;"></div>
				</div>
			</div>
		</c:if>



		<c:if test="${fn:length(onsalelist)!=0}">
		<section>
		<div class="container">
			<div class="row">
				<div class="col-sm-12 padding-right">
					<div class="features_items">
						<!--features_items-->
						<h2 class="title text-center">我销售的商品</h2>

						<c:forEach var="product" items="${onsalelist}" varStatus="status">
							<div class="col-sm-3">
								<div class="product-image-wrapper">
									<div class="single-products">
										<div class="productinfo text-center">

											<a
												href="../displayProductDetail.action?productid=${product.productid}">
												<img
												src="images/products/${product.productid}/thumbnail.jpg"
												alt="" />
											</a>

											<h2>¥${product.productprice}</h2>
											<p>${product.productname}</p>
											
											
											<!--  
											<a style="background:#dbffff;} href="
												../editproduct.action?productid=${product.productid
											}
												" class="btn btn-default add-to-cart"> <i
												class="fa fa-pencil"></i>编辑
											</a> <a style="background:#f69b9c;}"
												href="../deleteproduct.action?productid=${product.productid}"
												class="btn btn-default add-to-cart"> <i
												class="fa fa-trash-o"></i>删除
											</a>
											-->
											
										</div>
										<c:set var="producttag" value="${product.producttag}" />
										<c:set var="official" value="自营" />
										<c:if test="${producttag==official}">
											<img src="images/official.png" class="new" alt="" />
										</c:if>
									</div>
								</div>
							</div>
						</c:forEach>
					</div>
					<!--features_items-->
				</div>
			</div>
		</div>
		</section>
		</c:if>
	</c:if>
	<!-- 不是游客就显示新增商品按钮和在售商品按钮 -->





	<jsp:include page="footer.jsp"></jsp:include>
</body>
</html>