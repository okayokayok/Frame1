<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
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
		  

          <h2 class="sub-header">添加商品</h2>
          <div class="col-sm-6 col-sm-offset-3 col-md-8 col-md-offset-2">
            
         	<form class="form" role="form" action="${pageContext.request.contextPath }/admin/goods/doHandleGoods" method="post" enctype="multipart/form-data">
					
					
					<div class="form-group">
					<label for="cateId">  所属商品类别</label> 
					<select class="form-control input-sm" name="cateId" id="cateId">
					  	 <c:forEach var="value" items="${cates}">  
                                <option value="${value.cateId}">  
                                ${value.cateName}  
                                </option>  
                                </c:forEach>  
					</select>
					</div>
					<div class="form-group">
						<label for="goodsName"> 商品名称 </label> 
						<input class="form-control" name="goodsName" id="goodsName" value="" type="text"  placeholder="商品名称" required/>
					</div>
					<div class="form-group">
						<label for="goodsDisc"> 商品描述 </label> 
						<textarea class="form-control" name="goodsDisc" id="goodsDisc" rows="3" placeholder="商品描述" required></textarea>
					</div>
					<div class="form-group">
						<label for="goodsPrice"> 商品原价</label> 
						<input class="form-control" name="goodsPrice" id="goodsPrice" value="" type="text"  placeholder="商品原价" required/>
					</div>
					<div class="form-group">
						<label for="goodsDiscount"> 商品折后价格 </label> 
						<input class="form-control" name="goodsDiscount" id="goodsDiscount" value="" type="text"  placeholder="商品折后价格" required/>
					</div>
					<div class="form-group">
						<label for="goodsStock"> 商品库存 </label> 
						<input class="form-control" name="goodsStock" id="goodsStock" value="0" type="number"  placeholder="商品库存" disabled required/>
					</div>
					<div class="form-group">
						<label for="goodsOrigin"> 商品产地 </label> 
						<input class="form-control" name="goodsOrigin" id="goodsOrigin" value="" type="text"  placeholder="商品产地" required/>
					</div>
					<div class="form-group">
						<label for="goodsMaterial"> 商品材质</label> 
						<input class="form-control" name="goodsMaterial" id="goodsMaterial" value="" type="text"  placeholder="商品材质" required/>
					</div>
					 <div class="form-group">
						<label for="goodsPostalfee"> 商品运费</label> 
						<input class="form-control" name="goodsPostalfee" id="goodsPostalfee" value="" type="number"  placeholder="商品运费" required/>
					</div>
					<div class="form-group">
						<label for="goodsDate"> 商品入货日期（格式yyyy-mm-dd，如2016-01-01）</label> 
						
						<input class="form-control" name="goodsDate" id="goodsDate" 
						value="2017-09-01"
						type="date"  placeholder="商品入货日期" />
					</div>
					<div class="form-group">
						<label for="goodsSales"> 商品销量</label> 
						<input class="form-control" name="goodsSales" id="goodsSales" value="0" type="number"  placeholder="商品销量" disabled required/>
					</div>
					<div class="form-group" id="goodsPicDiv">
						<label for="goodsPic"> 商品图片（图片规格：242*200）</label> 
						
						<input class="form-control" name="goodsPicFile" id="goodsPicFile" type="file"  required/>
						
					
					</div>
		
				<input class="btn btn-primary" type="submit"  value="提交">
				<button class="btn btn-default" type="reset" >重置</button>
			
			</form>
		   </div>
        </div>
	</div>
	</div>


<%@include file="../common/adminFooter.jsp" %>
</body>
</html>