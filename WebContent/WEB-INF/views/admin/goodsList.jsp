<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<script type="text/javascript">

/* function submitSearch(){
	var cateId= $.trim($('#cateId').val());
	var goodsName= $.trim($('#goodsName').val());
	var startPrice= $.trim($('#startPrice').val());
	var endPrice= $.trim($('#endPrice').val());
	console.log(cateId);
	console.log(goodsName);
	console.log(startPrice);
	console.log(endPrice);
	
	if(goodsName == null || goodsName==""){
		goodsName="所有";
	}
	if(startPrice == null || startPrice==""){
		startPrice=0;
	}
	if(endPrice == null || endPrice==""){
		endPrice=1000;
	}
	
	console.log("--"+cateId);
	console.log("--"+goodsName);
	console.log("--"+startPrice);
	console.log("--"+endPrice);
	
	document.getElementById("searchForm").action="";
	document.getElementById("searchForm").submit();
	
} */

function selGoodsBut(formName,cbName){
	if($("#selAllGoods").is(":checked"))
		selectAll(formName,cbName);
	else
		unSelectAll(formName,cbName);
}
function check(){
	if(!validateCheckbox("goodsIds","请至少选中一个商品"))
		return false;
	else
		return confirm("确实要删除选中的所有商品吗？");
}
</script>
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
          action="getSearchGoods">			
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
			  <ul class="dropdown-menu" aria-labelledby="dropdownMenu1">
			    
					<li>
						<a href="/springmvc_mybatis/admin/goods/getAdminGoods?cateId=0&goodsName=&startPrice=3&endPrice=&sort=1">按价格从低到高</a>
					</li>
					<li>
						<a href="/springmvc_mybatis/admin/goods/getAdminGoods?cateId=0&goodsName=&startPrice=3&endPrice=&sort=2">按价格从高到低</a>
					</li>								
					<li class="divider">
					</li>
					<li>
						<a href="/springmvc_mybatis/admin/goods/getAdminGoods?cateId=0&goodsName=&startPrice=3&endPrice=&sort=3">按销量从高到低</a>
					</li>
					<li>
						<a href="/springmvc_mybatis/admin/goods/getAdminGoods?cateId=0&goodsName=&startPrice=3&endPrice=&sort=4">按销量从低到高</a>
					</li>
				
			  </ul>
			  </div>
			  </div>
			  <h2 class="sub-header">商品信息列表</h2>
			   <div class="table-responsive ">
          	<form name="goodsForm" method="post" action="/springmvc_mybatis/admin/goods/delGoodsByIds" onsubmit="return check()">
          	<button class="btn btn-primary" type="submit">批量删除</button>		
            <table class="table table-striped">
              <thead>
              
              
                <tr>
                  <th><input type="checkbox" id="selAllGoods" onchange="selGoodsBut('goodsForm', 'goodsIds')"/> 全选</th>
                  <th>#</th>
                  <th>商品名称</th>
                  <th>商品图片</th>
                  <th>商品价格</th>
                  <th>商品折后价格</th>
                  <th>商品库存</th>
                  <th>商品材质</th>
                  <th>商品运费</th>
                  <th>商品销量</th>
                  <th>操作</th>
                </tr>
              </thead>
              <tbody>
              	
              	 <c:forEach var="good" items="${goods}" varStatus="vs"> 
                <tr>
                  <td><input type="checkbox" name="goodsIds" value="35"/></td>
                  <td>${vs.index+1}</td>
                  <td>${good.goodsName }</td>
                  <td><img src="${pageContext.request.contextPath }/${good.goodsPic}" width="50" height="50"></td>
                  <td>${good.goodsPrice }</td>
                  <td>${good.goodsDiscount }</td>
                  <td>${good.goodsStock}</td>
                  <td>${good.goodsMaterial}</td>
                  <td>${good.goodsPostalfee}</td>
                  <td>${good.goodsSales }</td>
                  <td>
                  	<a href="${pageContext.request.contextPath }/admin/goods/updateGoods?goodsId=${good.goodsId }">修改</a> |
                  	<a href="${pageContext.request.contextPath }/admin/goods/delGoods?goodsId=${good.goodsId }" onclick="return confirm('确定要删除这个商品吗？')">删除</a>   
				  </td>
                </tr>
                </c:forEach>
      
              </tbody>
            </table>
            </form>
			  
			  
		    </div>
		    </div>
		  </div>
		  
        
        
        
        
        
        
        
        
        
        
        </div>
</div>
<%@include file="../common/adminFooter.jsp" %>
</body>
</html>