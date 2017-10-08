<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>修改密码</title>
</head>
<body>
<%@include file="../common/userTopNav.jsp" %>
<div class="container-fluid">
	<div class="row">
		<div class="col-md-2">
			<%@include file="../common/userCenterLefNav.jsp" %>
		</div>
		<script type="text/javascript">
			function checkPass(pass) {
				console.log(pass.value);
				$.post(getContextPath()+"/user/checkPassword",{userPass:pass.value},function(result){
					if(checkLogin(result)){
						if(result.result=="yes"){
							$(".check").html("");
							$("#newPass").html('<label> 新密码 </label>'+
									'<input class="form-control" name="userPass" id="userPass" type="text" onblur="rePass(this)"/>')
						}
						else{
							$(".check").html("密码错误，请重新输入");
							
						}
					}
				});
			}
			var newPass;
			function rePass(pass) {
				if(pass.value!=null&&pass.value!=""){
					newPass=pass.value;
					$("#rePass").html('<label> 确认密码 </label>'+
							'<input class="form-control" name="userPass2" id="userPass2" type="text" onblur="checkRePass(this)"/>')
		
					}
			}
			function checkRePass(pass2) {
				
				console.log("newPass:"+newPass);
				console.log("pass2:"+pass2.value);
				if(pass2.value==newPass){
					$("#passspan").html("");
					$("#btn").html('<button class="btn btn-primary" type="submit">修改</button>  '+
						'<button class="btn btn-primary" type="reset">重置</button>')
					}else{
						$("#passspan").html("密码不一致");
						}
			}

			
			
		</script>
		<div class="col-md-10">
				<form action="${pageContext.request.contextPath}/user/updatePassword" method="POST">
				<div class="form-group">
						<label> 原密码 </label> 
						<input class="form-control" name="oldPass" id="oldPass" type="text" onblur="checkPass(this)"/>
						<span class ="check"></span>
				</div>
				
				<div class="form-group" id="newPass">
						
				</div>
				<div class="form-group" id= "rePass">
						<span id="passspan"></span>
				</div>
				<div class="form-group" id= "btn">
						
				</div>
				</form>
		</div>
		
	</div>

</div>
<%@include file="../common/userFooter.jsp" %>
</body>
</html>