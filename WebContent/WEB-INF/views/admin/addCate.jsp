<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>添加分类</title>
</head>
<body>
<%@include file="../common/setReferUrl.jsp" %>
<%@include file="../common/adminTopNav.jsp" %>


    <div class="container-fluid">
      <div class="row">
        <div class="col-sm-3 col-md-2 sidebar">
          <%@include file="../common/adminLeftNav.jsp" %>
        </div>
        <div class="col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-2 main">


				<h2 class="sub-header">添加商品分类</h2>
				<div class="col-sm-4 col-sm-offset-3 col-md-5 col-md-offset-2">
					
					<form class="form" role="form" id="addrForm" method="post"
						action="${pageContext.request.contextPath }/admin/doAddCate"
						enctype="multipart/form-data">

						<input type="hidden" id="cateId" name="cateId"
							value="0" />
						<div class="form-group">
							<label for="cateName"> 商品分类名称 </label> <input
								class="form-control" name="cateName" id="cateName"
								value="" type="text" placeholder="商品分类名称"
								required />
						</div>
						<div class="form-group" id="catePicDiv">
							<label for="catePic"> 商品分类图片（图片规格：171*180）</label>
							
								<input class="form-control" name="catePicFile" id="catePicFile"
									type="file" required />
							
							
							<input type="hidden" name="catePic" value="" />
						</div>

						<button class="btn btn-primary" type="submit">确定</button>
						<button class="btn btn-default" type="reset">重置</button>

					</form>
				</div>
			</div>
        </div>
      </div>
    </div>

<%@include file="../common/adminFooter.jsp" %>
</body>
</html>