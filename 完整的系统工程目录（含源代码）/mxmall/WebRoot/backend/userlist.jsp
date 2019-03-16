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
					<h4 class="widgettitle">用户列表</h4>
					
					<table class="table table-bordered table-infinite" id="dyntable2">
						<colgroup>
							<col class="con0" style="align: center; width: 4%" />
							<col class="con1" />
							<col class="con0" />
							<col class="con1" />
						</colgroup>
						<thead>
							<tr>
								<th class="head0 nosort">用户名</th>
								<th class="head0">密码</th>
								<th class="head1">积分</th>
								<th class="head0">编辑</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach var="user" items="${userlist}" varStatus="status">
								<tr class="gradeX">
									<td class="aligncenter">${user.username}</td>
									<td>${user.userpassword}</td>
									<td>${user.userpoint}</td>
									<td class="center"><a
										href="../prepareupdateuser.action?userid=${user.userid}">
											<span class="iconfa-pencil"></span>
									</a> &nbsp&nbsp <span class="center"> <a
											href="../deleteuser.action?userid=${user.userid}"><span
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