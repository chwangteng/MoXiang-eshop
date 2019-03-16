<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<div class="leftpanel">
	<div class="leftmenu">
		<ul class="nav nav-tabs nav-stacked">
			<li class="nav-header">导航</li>
			<li><a href="welcome.jsp"><span class="iconfa-laptop"></span>欢迎</a></li>
			<li class="dropdown"><a href=""><span class="iconfa-pencil"></span>用户管理</a>
				<ul>
					<li><a href="../displayalluser.action">编辑/删除用户</a></li>
				</ul></li>
			<li class="dropdown"><a href=""><span class="iconfa-pencil"></span>商品管理</a>
				<ul>
					<li><a href="../displayallproduct.action">编辑/删除商品</a></li>
				</ul></li>
			<li class="dropdown"><a href=""><span class="iconfa-pencil"></span>订单管理</a>
				<ul>
					<li><a href="../displayallorder.action">订单发货/取消</a></li>
				</ul>
			</li>
			<li class="dropdown"><a href=""><span class="iconfa-pencil"></span>留言管理</a>
				<ul>
					<li><a href="../displayallmessage.action">删除留言</a></li>
				</ul>
			</li>
		</ul>
	</div>
	<!--leftmenu-->
</div>
<!-- leftpanel -->