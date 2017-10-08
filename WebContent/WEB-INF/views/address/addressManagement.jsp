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

<script type="text/javascript">
function handleAddressForm(addrId){
	if(addrId){
		$.post(getContextPath()+"/address/getAddressById",{addrId:addrId},function(result){
			if(checkLogin(result)){
				if(result.addr){
					$("#addressFormModal").modal();
					$("#addrProvince").val(result.addr.addrProvince);
					$("#addrCity").val(result.addr.addrCity);
					$("#addrArea").val(result.addr.addrArea);
					$("#addrContent").val(result.addr.addrContent);
					$("#addrReceiver").val(result.addr.addrReceiver);
					$("#addrTel").val(result.addr.addrTel);
					$("#addrId").val(result.addr.addrId);		
				}
				else{
					$("#msgTitle").html("操作失败");
					$("#msgBody").html("未读到当前地址信息");
					$("#msgModal").modal();
				}
			}
		});
	}
	else{
		$("#addressFormModal").modal();
	}
	
}
function setDefault(addrId){
	$.post(getContextPath()+"/address/setDefaultAddress",{addrId:addrId},function(result){
		if(checkLogin(result)){
			if(result.setDefault=="success"){
				$("."+result.addrId).html("");
				$("."+addrId).html("默认地址");
			}
			else{
				$("#msgTitle").html("操作失败");
				$("#msgBody").html("设置默认收货地址失败");
				$("#msgModal").modal();
			}
		}	
	});
	
	
}
</script>
<div class="container-fluid">
	<div class="row">
		<div class="col-md-2">
			<%@include file="../common/userCenterLefNav.jsp" %>
		</div>
		
		<div class="col-md-10">
			<div><button class="btn btn-primary" type="submit" onclick="handleAddressForm()">添加收货地址</button></div>	
			<c:if test="${!empty addressList }">	
			<table class="table table-condensed table-hover">
			<thead>
					<tr>
						<th>#</th><th>省-市-区</th><th>街道</th><th>收件人</th><th>电话</th><th>默认地址</th><th>操作</th>
					</tr>
			</thead>
			
			<tbody>
				
				<c:forEach items="${addressList}" var="address" varStatus="vs">
				<tr>
					 <td>${vs.index+1}</td>
					 <td>
					 	${address.addrProvince} ${address.addrCity} ${address.addrArea} 
					 </td>
					 <td>
					 	${address.addrContent} </td>
					 <td>${address.addrReceiver} </td>
					 <td> 
					 	${address.addrTel}  
					 </td>
					 <td class="isDefault">
					 <span class = "${address.addrId}">
						 <c:if test="${address.addrIsdefault==1 }">
							 默认地址
						 </c:if>
					 </span>
					 
					 </td>
					 <td>
					 	<a href="#" onclick="handleAddressForm(${address.addrId} )">修改</a> | 
					 	<a href="${pageContext.request.contextPath}/address/delAddress?addrId=${address.addrId}" onclick="return confirm('确定要删除这个收货地址吗？')">删除</a>	| 
					 	<a href="#" onclick="setDefault(${address.addrId})">设为默认地址</a>				
					 </td>
				</tr>
				</c:forEach>
				
			</tbody>
			</table>
			</c:if>
		</div>
		
	</div>
	
	<div class="modal fade" id="addressFormModal" role="dialog" aria-hidden="true" aria-labelledby="myModalLabel">
	<div class="modal-dialog">
		<div class="modal-content">
			<form class="form-inline" role="form" id="addrForm"  method="post" action="${pageContext.request.contextPath}/address/handleAddress">
			<div class="modal-header">
				<button class="close" aria-hidden="true" type="button" data-dismiss="modal">×</button>
				<h4 class="modal-title" id="myModalLabel">添加/修改收货地址</h4>
			</div>
			<div class="modal-body">
				
					<div class="form-group">
						<label for="addrProvince"> 省 </label> 
						<input class="form-control" name="addrProvince" id="addrProvince" type="text"  placeholder="省" required/>
					</div>
					<div class="form-group">
						<label for="addrCity"> 市</label> 
						<input class="form-control" name="addrCity" id="addrCity" type="text" placeholder="市" required/>
					</div>
					<div class="form-group">
						<label for="addrArea"> 区 </label> 
						<input class="form-control" name="addrArea" id="addrArea" type="text" placeholder="区" required/>
					</div>	
					<div class="form-group"> 
						<label for="addrContent"> 街道</label>
						<input class="form-control" name="addrContent" id="addrContent" type="text" placeholder="街道" required/>
					</div>				
					<div class="form-group">
						<label for="addrReceiver"> 收件人 </label> 
						<input class="form-control" name="addrReceiver" id="addrReceiver" type="text" placeholder="收件人" required/>					
					</div>					
					<div class="form-group"> 
						<label for="addrTel">	联系电话</label>
						<input class="form-control" name="addrTel" id="addrTel" type="text" placeholder="联系电话" required/>
					</div>				
				

			</div>
			<div class="modal-footer">
				<button class="btn btn-primary" type="submit" >确定</button>
				<button class="btn btn-default" type="button" data-dismiss="modal">关闭窗口</button>
			</div>
			</form>
		</div>

	</div>

</div>

</div>
<%@include file="../common/userFooter.jsp" %>
</body>
</html>