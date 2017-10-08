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
			<form action="${pageContext.request.contextPath}/user/updateUser" method="POST">
				<input type="hidden" name = "userId" id="userId" value="${user.userId }"/> 
				<div class="form-group">
						<label for="userName"> 用户名 </label> 
						<input class="form-control" name="userName" id="goodsName" value="${user.userName }" type="text"  readonly="readonly"/>
				</div>
				
				<div class="form-group">
						<label for="userEmail"> 邮箱 </label> 
						<input class="form-control" name="userEmail" id="userEmail" value="${user.userEmail }" type="email"  placeholder="邮箱" required/>
				</div>
				
				<div class="form-group">
						<label for="userAge"> 年龄 </label> 
						<input class="form-control" name="userAge" id="userAge" value="${user.userAge }" type="number" min='1' placeholder="年龄" required/>
				</div>
				
				<div class="form-group">
						<label for="userSex"> 性别 </label> 
						<div>
						<c:if test="${user.userSex==0 }">
						<input name="userSex" id="userSex" value="0" type="radio" checked="true"/>男
						<input name="userSex" id="userSex" value="1" type="radio" required/>女
						</c:if>
						<c:if test="${user.userSex==1 }">
						<input name="userSex" id="userSex" value="0" type="radio" />男
						<input name="userSex" id="userSex" value="1" type="radio" checked="true"/>女
						</c:if>
						</div>
				</div>
				<div class="form-group">
						<button class="btn btn-primary" type="submit">修改</button>
						<button class="btn btn-primary" type="reset">重置</button>
				</div>
				
			</form>
		</div>
		
	</div>

</div>
<%@include file="../common/userFooter.jsp" %>
</body>
</html>