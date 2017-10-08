<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<style>
.box {
	margin: 20px auto;
	width: 900px;
	/* border: 1px solid red; */
}

h3 {
	border-bottom: 5px solid #555;
	font-weight: bold;
}
</style>
<body>
	<%@include file="../common/userTopNav.jsp"%>

	<div class="container-fluid">
		<div class="row">
			<div class="col-md-12">
				<div class="row">

					<div class="box">
						<h3>添加类别</h3>
						<!-- 表单部分  -->
						<form action="${pageContext.request.contextPath}/cate/addType"
							method="post" class="form-horizontal" role="form">
							<div class="form-group">
								<label for="cateName" class="col-md-2 control-label">商品名称</label>

								<div class="col-md-10">
									<input type="text" class="form-control" name="cateName" placeholder="cateName">
								</div>

							</div>
							<div class="form-group">

								<label for="cateDc" class="col-md-2 control-label">商品档次</label>

								<div class="col-md-10">
									<input type="text" class="form-control" name="cateDc" placeholder="cateDc">
								</div>

							</div>
							<div class="form-group">
								<div class="col-sm-offset-2 col-sm-10">
									<button type="submit" class="btn btn-primary">提交</button>
								</div>
							</div>
						</form>
						<hr />
						<h3>编辑类别</h3>
						<!-- 将map中的数据遍历显示到页面上  -->
						<div>
							<table class="table table-hover">
								<thead>
									<tr>
										<th>ID</th>
										<th>TypeName</th>
										<th>TypeImg</th>
										<th>TypeDc</th>
										<th>Update</th>
										<th>Delete</th>
									</tr>
								</thead>
								<tbody>
									<c:if test="${empty cates}">
										<tr>
											<td>抱歉！无分类信息</td>
										</tr>
									</c:if>
									<c:if test="${!empty cates}">
										<c:forEach items="${cates}" var="c">
											<tr>
												<td>${c.cateId }</td>
												<td>${c.cateName }</td>
												<td>${c.catePic }</td>
												<td>${c.cateDc }</td>
												<td><a href="" data-toggle="modal"
													data-target="#myModal" onclick="update('${c.cateId}')">update</a></td>
												<td><a
													href="${pageContext.request.contextPath}/cate/delete?cateId=${c.cateId}">delete</a></td>
											</tr>
										</c:forEach>
									</c:if>
								</tbody>

							</table>
						</div>
						<hr />
					</div>

				</div>
			</div>
		</div>
	</div>

	<%@include file="../common/userFooter.jsp"%>

	<!-- 模态框 -->
	
	<!-- 点击update以后如何将对应数据绑定到模态框上 -->
	<div class="modal fade" id="myModal" tabindex="-1" role="dialog"
		aria-labelledby="myModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal">
						<span aria-hidden="true">&times;</span><span class="sr-only">Close</span>
					</button>
					<h4 class="modal-title" id="myModalLabel">Update</h4>
				</div>
				<form action="${pageContext.request.contextPath}/cate/updateType"
					method="post" class="form-horizontal" role="form">
				<div class="modal-body">

					<div>
							<input type="hidden" name="cateId" id="cateId"/>
							<div class="form-group">
								<label for="cateName" class="col-md-2 control-label">商品名称</label>

								<div class="col-md-10">
									<input type="text" class="form-control" name="cateName"
										id="cateName" placeholder="cateName">
								</div>

							</div>
							<div class="form-group">

								<label for="cateDc" class="col-md-2 control-label">商品档次</label>

								<div class="col-md-10">
									<input type="text" class="form-control" id="cateDc"
										name="cateDc" placeholder="cateDc">
								</div>

							</div>
						
					</div>


				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
					<button type="submit" class="btn btn-primary">Save</button>
				</div>
				
				</form>
			</div>
		</div>
	</div>
	
	<script type="text/javascript">
		function update(id){
			$.get(getContextPath()+"/cate/finId?cateId="+id,
				function(result){//result返回的结果
				
					$("#cateName").val(result.cateName);
					$("#cateDc").val(result.cateDc);
					$("#cateId").val(result.cateId);
				});
		}
	</script>
	
</body>
</html>