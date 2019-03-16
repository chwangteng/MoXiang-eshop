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
<title>增加商品</title>
</head>
<!--/head-->

<body>
	<jsp:include page="header.jsp"></jsp:include>

	<div class="container">
		<div class="row">
			<div class="col-sm-8 col-sm-offset-2">
				<form role="form" enctype="multipart/form-data" method="post" action="../addProduct.action">
					<div class="form-group">
						<label for="exampleInputEmail1">商品名称</label> <input type="text"
							class="form-control" name="productname"
							placeholder="商品名称包含的关键词越多越容易被搜索到">
					</div>
					<div class="form-group">
						<input type="hidden"
							class="form-control" name="userid"
							value="${user.userid}">
					</div>
					<div class="form-group">
						<label for="exampleInputEmail1">商品分类</label> <select
							class="form-control" name="categoryid">
							<option value="1">家用电器</option>
							<option value="2">手机/ 运营商/ 数码</option>
							<option value="3">电脑办公</option>
							<option value="4">家居/ 家具/ 家装/ 厨具</option>
							<option value="5">男装/ 女装/ 童装/ 内衣</option>
							<option value="6">个护化妆/ 清洁用品/ 宠物</option>
							<option value="7">鞋靴/ 箱包/ 珠宝/ 奢侈品</option>
							<option value="8">运动/ 户外/ 钟表</option>
							<option value="9">汽车/ 汽车用品</option>
							<option value="10">母婴/ 玩具乐器</option>
							<option value="11">食品/ 酒类/ 生鲜/ 特产</option>
							<option value="12">医药保健</option>
							<option value="13">图书/ 音像/ 电子书</option>
							<option value="14">机票/ 酒店/ 旅游/ 生活</option>
							<option value="15">理财/ 众筹/ 白条/ 保险</option>
						</select>
					</div>
					<div class="form-group">
						<label for="exampleInputPassword1">商品价格</label> <input type="text"
							class="form-control" name="productprice"
							placeholder="商品价格适中更容易吸引人气哦">
					</div>
					<div class="form-group">
						<label for="exampleInputPassword1">商品库存</label> <input type="text"
							class="form-control" name="productstock"
							placeholder="商品库存适中更容易吸引人气哦">
					</div>
					<div class="form-group">
						<label for="exampleInputPassword1">商品描述</label>
						<textarea type="text" class="form-control" name="productdetail"
							rows="3" placeholder="商品描述中肯更容易吸引人气哦"></textarea>
					</div>
					<div class="form-group">
						<label for="exampleInputFile">缩略图</label> <input type="file"
							 name="file" id="thumbnail">
						<p class="help-block">商品缩略图请220px*220px以上且保持方形</p>
					</div>
					<div class="form-group">
						<label for="exampleInputFile">详情图片</label> <input type="file"
							 name="file" id="detail">
						<p class="help-block">商品缩略图请600px*2000px以上且保持清晰</p>
					</div>
					<button type="submit" class="btn btn-default">新建商品</button>
				</form>
			</div>
		</div>
	</div>



	<jsp:include page="footer.jsp"></jsp:include>
</body>
</html>