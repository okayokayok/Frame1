<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>个人中心</title>
</head>
<body>
<%@include file="../common/userTopNav.jsp" %>
<div class="container-fluid">
	<div class="row">
		<div class="col-md-2">
			<%@include file="../common/userCenterLefNav.jsp" %>
		</div>
		
		<div class="col-md-10">
			<div class="span12">
				<div class="alert alert-success">
					 <button type="button" class="close" data-dismiss="alert">×</button>
					<h4>
						个人中心
					</h4> <strong>欢迎来到个人中心，您可以修改个人信息、密码和管理收货地址!</strong>
				</div>
			</div>
		</div>
		
	</div>

</div>
<%@include file="../common/userFooter.jsp" %>
</body>
</html>