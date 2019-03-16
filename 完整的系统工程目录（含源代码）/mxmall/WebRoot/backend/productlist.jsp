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
<script type="text/javascript">
	jQuery(document).ready(function() {
		// dynamic table

		jQuery('#dyntable2').dataTable({
			"bScrollInfinite" : true,
			"bScrollCollapse" : true,
			"sScrollY" : "600px"
		});

	});
</script>

</head>
<body>
	<div class="mainwrapper">

		<jsp:include page="header.jsp"></jsp:include>
		<jsp:include page="leftpanel.jsp"></jsp:include>

		<div class="rightpanel">

			<div class="maincontent">
				<div class="maincontentinner">
					<h4 class="widgettitle">商品列表</h4>
					
					<table class="table table-bordered table-infinite" id="dyntable2">
						<colgroup>
							<col class="con0" style="align: center; width: 20%" />
							<col class="con1" />
							<col class="con0" />
							<col class="con1" />
							<col class="con0" />
							<col class="con1" />
						</colgroup>
						<thead>
							<tr>
								<th class="head0 nosort">商品名称</th>
								<th class="head0">商品价格</th>
								<th class="head1">商品库存</th>
								<th class="head0">商品分类</th>
								<th class="head1">所属用户</th>
								<th class="head0">商品标签</th>
								<th class="head1">操作</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach var="product" items="${productlist}" varStatus="status">
								<tr class="gradeX">
									<td class="aligncenter">${product.productname}</td>
									<td>${product.productprice}</td>
									<td>${product.productstock}</td>
									<td>${product.category.categoryname}</td>
									<td>${product.user.username}</td>
									<td>${product.producttag}</td>
									<td class="center"><a
										href="../prepareupdateproduct.action?productid=${product.productid}">
											<span class="iconfa-pencil"></span>
									</a> &nbsp&nbsp <span class="center"> <a
											href="../deleteproduct.action?productid=${product.productid}"><span
												class="iconsweets-trashcan"></span></a>
									</span></td>
								</tr>
							</c:forEach>
						</tbody>
					</table>

					<jsp:include page="footer.jsp"></jsp:include>

				</div>
				<!--maincontentinner-->

			</div>
		</div>

	</div>
</body>
</html>