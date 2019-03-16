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
<title>所有页面的基本框架</title>
</head>
<!--/head-->

<body>
	<jsp:include page="header.jsp"></jsp:include>

	<section>
	<div class="row">
		<div class="col-sm-1"></div>
		<div class="col-sm-10" style="height:500px;">
			<div class="tabbable" id="tabs-863255">
				<ul class="nav nav-tabs">
					<li class="active"><a href="#panel-406509" data-toggle="tab">收货人</a>
					</li>
					<li><a href="#panel-215955" data-toggle="tab">新建收货人</a></li>
				</ul>
				<div class="tab-content">
					<div class="tab-pane active" id="panel-406509">
						<p>
							以下是您已有的收货信息
							<c:forEach var="consignee" items="${user.consignees}"
								varStatus="status">
								<div class="thumbnail col-sm-4 " style="margin:20px;">
									<ul>
										<li><i class="fa fa-user"></i>收件人：${consignee.consigneename}</li>
										<li><i class="fa fa-clock-o"></i>电话：${consignee.consigneephone}</li>
										<li><i class="fa fa-clock-o"></i>地址：${consignee.consigneeaddress}</li>
									</ul>
								</div>
							</c:forEach>
						</p>
					</div>
					<div class="tab-pane" id="panel-215955">
						<p>
						
						<form role="form" enctype="multipart/form-data" method="post"
							action="../addconsignee.action">
							<div class="form-group">
								<label for="exampleInputEmail1">收件人</label> <input type="text"
									class="form-control" name="consigneename"
									placeholder="请输入收件人姓名">
							</div>
							<div class="form-group">
								<label for="exampleInputEmail1">电话</label> <input type="text"
									class="form-control" name="consigneephone"
									placeholder="请输入联系电话">
							</div>
							<div class="form-group">
								<label for="exampleInputEmail1">地址</label> <input type="text"
									class="form-control" name="consigneeaddress"
									placeholder="请输入详细地址">
							</div>
							<button type="submit" class="btn btn-default">保存收货人</button>
						</form>
						</p>
					</div>
				</div>
			</div>
		</div>
		<div class="col-sm-1"></div>
	</div>
	</section>

	<jsp:include page="footer.jsp"></jsp:include>
</body>
</html>