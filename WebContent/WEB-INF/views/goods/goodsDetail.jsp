<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script type="text/javascript" src="${pageContext.request.contextPath}/js/cart.js"></script>
<title>商品详情</title>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/cart.js"></script>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/flexslider.css" type="text/css" media="screen" />

</head>
<body>
<script type="text/javascript">
function add(){
	var num=$("#num").val();
	var btn=$(".btn-info");
	var size,color;
	for(var i=0;i<btn.length;i++){
		if($(btn[i]).attr("name")=="sizeButton")
			size=$(btn[i]).html();
		else if($(btn[i]).attr("name")=="colorButton")
			color=$(btn[i]).html();
	}
	//alert(num+","+size+","+color);
	addCart(num,size,color);
	$("#cartBadge").html(cart.getGoodsList().length);
}
</script>
<%@include file="../common/userTopNav.jsp" %>

<div class="container-fluid">
	<div class="row">
		<div class="col-md-12">
			<div class="row">
				
				<div class="col-md-2">		
					<%@include file="../common/userLeftNav.jsp" %>
				</div>	
				<form class="form-inline" role="form" action="${pageContext.request.contextPath}/order/buyGoods" method="post">	
				<input type="hidden" name="goodsId" value="${goodsDetail.goodsId}"/>
			    <input type="hidden" name="goodsName" value="${goodsDetail.goodsName}"/>
			    <input type="hidden" name="goodsPrice" value="${goodsDetail.goodsPrice}"/>
			    <input type="hidden" name="goodsDiscount" value="${goodsDetail.goodsDiscount}"/>
			    <input type="hidden" name="goodsPostalfee" value="${goodsDetail.goodsPostalfee}"/>	
				<div class="col-md-6">
					<div class="row">
					<div class="col-md-12">
					<div class="col-md-5 single-top">	
						<!-- start product_slider -->
				    <div class="flexslider">
							        <!-- FlexSlider -->
										<script src="${pageContext.request.contextPath}/js/imagezoom.js"></script>
										  <script defer src="${pageContext.request.contextPath}/js/jquery.flexslider.js"></script>
										<script>
										// Can also be used with $(document).ready()
										$(window).load(function() {
										  $('.flexslider').flexslider({
											animation: "slide",
											controlNav: "thumbnails"
										  });
										});
										</script>
									<!-- //FlexSlider-->

							  <ul class="slides">
							  <c:if test="${!empty goodsDetail }">
								<label class="sr-only" id="cateId">${goodsDetail.cateId}</label>
								<label class="sr-only" id="pic">${pageContext.request.contextPath}${goodsDetail.pics[0].picUrl}</label>
								<input type="hidden" name="pic" value="${pageContext.request.contextPath}${goodsDetail.pics[0].picUrl}"/>
									<c:forEach items="${goodsDetail.pics}" var="g" varStatus="vs">
								<li data-thumb="${pageContext.request.contextPath}${g.picUrl}">
									<div class="thumb-image"> <img src="${pageContext.request.contextPath}${g.picUrl}" data-imagezoom="true" class="img-responsive"> </div>
								</li>
									</c:forEach>
								</c:if>
							  </ul>
							<div class="clearfix"></div>
					</div>

					</div>	
						
					</div>
					<div class="col-md-12">
						<h3>商品详情</h3>
					</div>
					<div class="col-md-12">
						${goodsDetail.goodsDisc}
					</div>
					<c:forEach items="${goodsDetail.pics}" var="g" varStatus="vs">
						<div class="col-md-12">
						    <a href="#" class="thumbnail" >
						      <img src="${pageContext.request.contextPath}${g.picUrl}" alt="暂无图片" >
						    </a>
					  	</div>
					</c:forEach>
						
					</div>
					
					<c:if test="${empty goodsDetail}">
						<div class="alert alert-danger col-md-3" role="alert">对不起，暂无此商品信息</div>
					</c:if>			
				</div>
				<div class="col-md-3 col-md-offset-1 panel-pills" id="rightPanel" >
					
					<c:if test="${!empty goodsDetail && !empty goodsSizes && !empty goodsColors}">
					
					<div class="panel panel-info col-md-offset-1"  >
					  <!-- Default panel contents -->
					  
					  <label class="sr-only" id="goodsId">${param.goodsId }</label>
					  <div class="panel-heading text-success"><label id="goodsName">${goodsDetail.goodsName}</label></div>
					  <div class="panel-body">					 
					    <p><label>原价：</label><span class="glyphicon glyphicon-yen" aria-hidden="true"></span><label id="goodsPrice">${goodsDetail.goodsPrice}</label>
					    
						<span class="glyphicon glyphicon-hand-right" aria-hidden="true"></span>
						<label>现售：</label><span class="label label-pill label-info "><span class="glyphicon glyphicon-yen" aria-hidden="true"></span>
						<label id="goodsDiscount">${goodsDetail.goodsDiscount}</label></span>
						
						</p>
						<p><label>运费：</label><span class="glyphicon glyphicon-yen" aria-hidden="true"></span><label id="goodsPostalfee">${goodsDetail.goodsPostalfee}</label></p>
						<p>
							共售出${goodsDetail.goodsSales}件
						</p>
						<p>
							<label>尺寸选择：</label>
							<div class="btn-group" role="group">
							<c:forEach items="${goodsSizes.sizes }" var="s" varStatus="vs">
								<c:if test="${vs.first }">
									<input type="hidden" name="size" id="size" value="${s.sizeName}"/>
									
								</c:if>
								<button type="button" class="btn btn-default btn-xs ${vs.first?'btn-info':'' }" name="sizeButton">${s.sizeName}</button>						
							</c:forEach>
							</div>
						</p>
						<p>
							<label>颜色选择：</label>
							<div class="btn-group" role="group">
							<c:forEach items="${goodsColors.colors }" var="c" varStatus="vs">
								<c:if test="${vs.first }">
									<input type="hidden" name="color" id="color" value="${c.colorName}"/>
									
								</c:if>
								<button type="button" class="btn btn-default btn-xs ${vs.first?'btn-info':'' }" name="colorButton">${c.colorName}</button>						
							</c:forEach>
							</div>
						</p>
												
						<p>		
							<div class="form-group ">			 
								<label for="num">数量：</label>
								<div class="input-group input-group-sm col-xs-3">
								<input class="form-control" id="num" name="num" type="number" value="1" min="1"/>
								</div>
							</div>
							
						</p>
						<p>
							<button class="btn btn-primary btn-sm" type="submit">
								立即购买
							</button>
							<button class="btn btn-primary btn-sm" type="button" onclick="add()">
								加入购物车
							</button>
						</p>
						
					  </div>
					  
					  <!-- List group -->
					  <ul class="list-group">
					    <li class="list-group-item">产地：${goodsDetail.goodsOrigin}</li>
					    <li class="list-group-item">材质：${goodsDetail.goodsMaterial}</li>
					    <!--<li class="list-group-item">${goodsDetail.goodsDisc}</li>-->
					  </ul>
					</div>
					
					</c:if>		
					
				</div>
				</form>	
			</div>
		</div>
	</div>
</div>

<%@include file="../common/userFooter.jsp" %>
</body>
</html>