<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>库存管理</title>
</head>
<body>
<%@include file="../common/setReferUrl.jsp" %>
<%@include file="../common/adminTopNav.jsp" %>
<script type="text/javascript">
function updateStock(stockId,goodsId){
	$('#postInfoFormModal').modal();
	$("#ok").click(function(){
		
		var goodsStock=$("#goodsStock").val();
		$.post(getContextPath()+"/admin/goods/updateStock",{stockId:stockId,stockNum:goodsStock,goodsId:goodsId},function(result){
			if(checkLogin(result)){
				if(result.handle=="success"){
					location.href="";
				}else if(result.handle=="failure"){
					$("#msgTitle").html("操作失败");
					$("#msgBody").html("抱歉，目前的库存无法进行此操作");
					$("#msgModal").modal();
				}
				else{
					$("#msgTitle").html("操作失败");
					$("#msgBody").html("操作库存失败");
					$("#msgModal").modal();
				}

				
			}
		});
	});

	
	
}
</script>
<div class="modal fade" id="postInfoFormModal" role="dialog" aria-hidden="true" aria-labelledby="myModalLabel">
	<div class="modal-dialog">
		<div class="modal-content">
			<form class="form-inline" role="form" id="postForm"  method="post" action="">
			<div class="modal-header">
				<button class="close" aria-hidden="true" type="button" data-dismiss="modal">×</button>
				<h4 class="modal-title" id="myModalLabel">添加库存信息</h4>
			</div>
			<div class="modal-body">
					<div class="form-group">
						<label for="orderPostname"> 库存数量 </label> 
						<input class="form-control" name="goodsStock" id="goodsStock" type="number"  placeholder="库存数量" min=1 required/>
					</div>
			</div>
			<div class="modal-footer">
				<button class="btn btn-primary" type="button" data-dismiss="modal" id="ok" >确定</button>
				<button class="btn btn-default" type="button" data-dismiss="modal">关闭窗口</button>
			</div>
			</form>
		</div>

	</div>

</div>
    <div class="container-fluid">
      <div class="row">
        <div class="col-sm-3 col-md-2 sidebar">
          <%@include file="../common/adminLeftNav.jsp" %>
        </div>
        <div class="col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-2 main">
		  

          <h2 class="sub-header">管理商品库存</h2>
          <div class="col-sm-6 col-sm-offset-3 col-md-8 col-md-offset-2">
            
            
  				<div class="table-responsive ">
	            <table class="table table-striped">
	              <thead>
	                <tr>
	                  <th>#</th>
	                  <th>商品名称</th>
	                  <th>商品尺寸</th>
	                  <th>商品颜色</th>
	                  <th>商品库存量</th>
	                  <th>商品销售量</th>
	                  <th>操作</th>
	                </tr>
	              </thead>
	              <tbody>
	              	 <c:forEach items="${stocks }" var ="s" varStatus="vs">          	
	                <tr>
	                  <td>${vs.index+1 }</td>
	                  <td>${s.goodsName }</td>
	                  <td>${s.sizeName }</td>
	                  <td>${s.colorName }</td>
	                  <td>${s.stockNum }</td>
	                  <td>${s.salesNum }</td>
	                  <td><button class="btn btn-primary" id="update" type="button" onclick="updateStock(${s.stockId},${s.goodsId })">修改</button></td>
	                </tr>
	               	</c:forEach>   
	              </tbody>
	            </table>
					     
	               	
	          	</div>
			
			
			
			
		   </div>
		   
		   
        </div>
      </div>
    </div>

<%@include file="../common/adminFooter.jsp" %>
</body>
</html>