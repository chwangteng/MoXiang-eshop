<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>摸象商城后台管理</title>
<jsp:include page="htmlhead.jsp"></jsp:include>
</head>
<body>
	<div class="mainwrapper">

		<jsp:include page="header.jsp"></jsp:include>
		<jsp:include page="leftpanel.jsp"></jsp:include>

		<div class="rightpanel">
			<div class="maincontent">
				<div class="maincontentinner">

					<div class="widgetbox box-inverse">
						<h4 class="widgettitle">编辑商品</h4>
						<div class="widgetcontent nopadding">
							<form class="stdform stdform2" method="post"
								action="../updateproduct.action" role="form" enctype="multipart/form-data">

								<p>
									<label>商品名称</label> <span class="field"><input
										type="text" name="productname" id="firstname2"
										class="input-xxlarge" value="${product.productname}" /></span>
								</p>
								
									<input
										type="hidden" name="userid" id="firstname2"
										class="input-xxlarge" value="${product.user.userid}" />
									<input
										type="hidden" name="productid" id="firstname2"
										class="input-xxlarge" value="${product.productid}" />
								
								<p>
									<label for="exampleInputEmail1">商品分类</label> <span class="field"><select
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
									</select></span>


								</p>


								<p>
									<label>商品价格</label> <span class="field"><input
										type="text" name="productprice" id="firstname2"
										class="input-xxlarge" value="${product.productprice}" /></span>
								</p>
								<p>
									<label>商品库存</label> <span class="field"><input
										type="text" name="productstock" id="firstname2"
										class="input-xxlarge" value="${product.productstock}" /></span>
								</p>

								<p>
									<label>商品详情</label> <span class="field"><input
											type="text" name="productdetail" id="firstname2"
											class="input-xxlarge" value="${product.productdetail}"></input></span>
								</p>
								

								<p>
									<label for="exampleInputFile">缩略图</label> <input type="file"
										name="file" id="thumbnail">
								<p class="help-block">商品缩略图请220px*220px以上且保持方形</p>
								</p>
								<p>
									<label for="exampleInputFile">详情图片</label> <input type="file"
										name="file" id="detail">
								<p class="help-block">商品缩略图请600px*2000px以上且保持清晰</p>
								</p>



								<p class="stdformbutton">
									<button class="btn btn-primary">保存</button>
									<button type="reset" class="btn">重置</button>
								</p>
								${message}
							</form>
						</div>
						<!--widgetcontent-->
					</div>
					<!--widget-->
				</div>
			</div>
		</div>
	</div>
</body>
</html>