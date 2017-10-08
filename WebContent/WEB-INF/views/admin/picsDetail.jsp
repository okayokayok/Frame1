<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div class="container-fluid">
      <div class="row">
<%@include file="../common/setReferUrl.jsp" %>
<%@include file="../common/adminTopNav.jsp" %>

      <div class="col-sm-3 col-md-2 sidebar">
         <%@include file="../common/adminLeftNav.jsp" %>
      </div>
        
        
       <div class="col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-2 main">
        	 <div class="col-sm-6 col-sm-offset-3 col-md-8 col-md-offset-2">
         
         <c:forEach var="pic" items="${pics }">
  				<div class="row">
  				<div class="col-sm-6 col-md-7">
            	<img src="${pageContext.request.contextPath }/${pic.picUrl}" width="500" height="500">
            	</div>
            	<div class="col-sm-2 col-md-3 ">
            	<a href="${pageContext.request.contextPath }/admin/goods/delGoodsPics?picId=${pic.picId }&goodsId=${pic.goodsId}" class="btn btn-primary">删除图片</a>
            	</div>
            	</div>
			</c:forEach>
  			
            <form class="form" role="form" method="post" action="${pageContext.request.contextPath }/admin/goods/addGoodsPics" enctype="multipart/form-data">
            	<input type="hidden" name="goodsId" value="${goodsId}"/>
            	<div class="form-group" >
					<label for="goodsPic"> 商品图片（图片规格：500*500）</label> 
					<input class="form-control" name="goodsPicFile" type="file"  required/>					
				</div>
				<div class="form-group" >
					<label for="goodsPic"> 商品图片（图片规格：500*500）</label> 
					<input class="form-control" name="goodsPicFile" type="file"  />					
				</div>
				<div class="form-group" >
					<label for="goodsPic"> 商品图片（图片规格：500*500）</label> 
					<input class="form-control" name="goodsPicFile" type="file"  />					
				</div>
				<div class="form-group" >
					<label for="goodsPic"> 商品图片（图片规格：500*500）</label> 
					<input class="form-control" name="goodsPicFile" type="file"  />					
				</div>
				<div class="form-group" >
					<label for="goodsPic"> 商品图片（图片规格：500*500）</label> 
					<input class="form-control" name="goodsPicFile" type="file"  />					
				</div>
				<button class="btn btn-primary" type="submit" >添加图片</button>
				<button class="btn btn-primary" id="back" type="button" onclick="javascript:location.href='${pageContext.request.contextPath }/admin/goods/getGoodsPics'">返回列表</button>
			</form>
			
		   </div>
        	
		</div>

   </div>
</div>
<%@include file="../common/adminFooter.jsp" %>
</body>
</html>