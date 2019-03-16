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
						<h4 class="widgettitle">编辑用户</h4>
						<div class="widgetcontent nopadding">
							<form class="stdform stdform2" method="post"
								action="../updateuser.action?userid=${user.userid}">
								

								<p>
									<label>密码</label> <span class="field"><input type="text"
										name="userpassword" id="firstname2" class="input-xxlarge"
										value="${user.userpassword}" /></span>
								</p>
								
								<p>
									<label>积分</label> <span class="field"><input type="text"
										name="userpoint" id="firstname2" class="input-xxlarge"
										value="${user.userpoint}" /></span>
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