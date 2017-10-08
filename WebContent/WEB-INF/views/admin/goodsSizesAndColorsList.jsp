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
         <div class="row">
        	<div class="col-md-10">
            <form class="form-inline" role="form" id="searchForm"  method="post" 
          action="SearchGoods">			
				<div class="form-group">
					<label for="cateId">  商品类别</label> 
					<select class="form-control input-sm" name="cateId" id="cateId">
					  <option value="0">---所有类别---</option>
					  
					  <c:forEach var="value" items="${cates}">  
                                <option value="${value.cateId}">  
                                ${value.cateName}  
                                </option>  
                                </c:forEach>  
					  
					</select>
				</div>
				<div class="form-group">
					<label for="goodsName"> 商品名称</label> 
					<input class="form-control input-sm" name="goodsName" id="goodsName" value="" type="text" placeholder="商品名称" />
				</div>
				<div class="form-group">
					<label for="price"> 价格 </label> 
					<input class="form-control input-sm" name="startPrice" id="startPrice" value="" type="number" placeholder="起始价格" />-
					<input class="form-control input-sm" name="endPrice" id="endPrice" value="" type="number" placeholder="终止价格" />
				</div>	
				<button class="btn btn-primary btn-sm" type="submit">搜索</button>
			</form>
			</div>
			<div class="col-md-2">
			<div class="dropdown">
			  <button class="btn btn-default dropdown-toggle btn-sm" type="button" id="dropdownMenu1" data-toggle="dropdown" aria-haspopup="true" aria-expanded="true">
			    	排序
			    <span class="caret"></span>
			  </button>
			 
			  </div>
			  </div>
			  <h2 class="sub-header">商品信息列表</h2>
			   <div class="table-responsive ">
          	
          		<table class="table table-striped">
              <thead>
                <tr>
                  <th>#</th>
                  <th>商品名称</th>
                  <th>商品图片</th>
                  <th>商品价格</th>
                  <th>商品折后价格</th>
                  <th>操作</th>
                </tr>
              </thead>
              <tbody>
              	
              	<c:forEach var="good" items="${goods }" varStatus="vs">
              	
                <tr>
                  <td>${vs.index+1 }</td>
                  <td>${good.goodsName }</td>
                  <td><img src="${pageContext.request.contextPath }/${good.goodsPic}" width="50" height="50"></td>
                  <td>${good.goodsPrice }</td>
                  <td>${good.goodsDiscount }</td>
                  <td>
                  	<a class="btn btn-primary" href="${pageContext.request.contextPath }/admin/goods/handleGoodsSizes?goodsId=${good.goodsId }">添加商品尺寸和颜色</a> 
                  	
				  </td>
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