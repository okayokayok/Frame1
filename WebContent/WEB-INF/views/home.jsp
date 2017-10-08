<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>服装商城</title>
<!-- Custom styles for this template -->
<link href="${pageContext.request.contextPath}/css/carousel.css" rel="stylesheet">

</head>
<body>
<%@include file="./common/userTopNav.jsp" %>
<div class="col-md-12">
		<div id="carousel-example-generic" class="carousel slide"
			data-ride="carousel">
			<!-- Indicators -->
			<ol class="carousel-indicators">
				<li data-target="#carousel-example-generic" data-slide-to="0"
					class="active"></li>
				<li data-target="#carousel-example-generic" data-slide-to="1"></li>
				<li data-target="#carousel-example-generic" data-slide-to="2"></li>
			</ol>

			<!-- Wrapper for slides -->
			<div class="carousel-inner" role="listbox">
				<div class="item active">
					<img src="${pageContext.request.contextPath}/images/adver/1.jpg"
						alt="...">
					<div class="carousel-caption">...</div>
				</div>
				<div class="item">
					<img src="${pageContext.request.contextPath}/images/adver/2.jpg"
						alt="...">
					<div class="carousel-caption">...</div>
				</div>
				<div class="item">
					<img src="${pageContext.request.contextPath}/images/adver/3.jpg"
						alt="...">
					<div class="carousel-caption">...</div>
				</div>
			</div>
			

			<!-- Controls -->
			<a class="left carousel-control" href="#carousel-example-generic"
				role="button" data-slide="prev"> <span
				class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
				<span class="sr-only">Previous</span>
			</a> <a class="right carousel-control" href="#carousel-example-generic"
				role="button" data-slide="next"> <span
				class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
				<span class="sr-only">Next</span>
			</a>
		</div>

		<div class="panel panel-info">
			<div class="panel-heading">
				<h3 class="panel-title">
					商品分类<a class="btn"
						href="${pageContext.request.contextPath}/cate/getAllCatesList">查看更多
						»</a>
				</h3>
			</div>
			<div class="panel-body">
				<!-- 先判断返回是否不为空，不为空进行对数据的展示 -->
				<c:if test="${!empty cates }">
					<!-- 循环遍历  -->
					<!-- varStatus="vs" : 循环状态  -->
					<c:forEach items="${cates}" var="c" varStatus="vs">
						<!-- 只显示最多8条 -->
						<c:if test="${vs.count<=8}">

							<div class="col-xs-6 col-md-3">
								<div class="thumbnail">
								<!-- ${pageContext.request.contextPath} ：获取根目录 -->
									<a
										href="${pageContext.request.contextPath}/goods/getGoodsByCate?cateId=${c.cateId}">
										<img src="${pageContext.request.contextPath}${c.catePic}"
										alt="${c.cateName}">
									</a>
									<div class="caption" align="center">
										<p>${c.cateName}(${c.cateDc})</p>
									</div>
								</div>
							</div>
						</c:if>
					</c:forEach>
				</c:if>
				<!-- 数据为空 -->
				<c:if test="${empty cates}">
					<div class="alert alert-danger col-md-2" role="alert">对不起，暂无相关信息</div>
				</c:if>

			</div>
		</div>

	</div>
<div class="col-md-12">
			<div class="panel panel-success">
			  <div class="panel-heading">
			    <h3>新到商品<a class="btn" href="${pageContext.request.contextPath}/goods/getNewGoods">查看更多 »</a></h3>
			  </div>
			  <div class="panel-body">			    			   		    
				<div id="newGoodsCarousel" class="carousel slide goods" data-ride="carousel">								   
				  	<div class="carousel-inner" id="newGoods">
					  
					  	
					    								
								<div class="item goods active">
								<div class="row">									
								
				                			                	 
				                	<div class="col-md-3">
				                		<a href="${pageContext.request.contextPath}/goods/getGoodsDetailById?goodsId=22" class="thumbnail">
				                		<img src="${pageContext.request.contextPath}/images/goods/1_1.jpg" alt="Image" class="img-responsive"></a>
				                		<div class="container">
				                		<div class="carousel-caption">男装 军旅式短茄克22
				                		<br>现售<span class="badge"><span class="glyphicon glyphicon-yen" aria-hidden="true"></span>177.0</span></div>
				                		</div>
				                	</div>
				                									
								
				                			                	 
				                	<div class="col-md-3">
				                		<a href="${pageContext.request.contextPath}/goods/getGoodsDetailById?goodsId=34" class="thumbnail">
				                		<img src="${pageContext.request.contextPath}/images/goods/1_2.png" alt="Image" class="img-responsive"></a>
				                		<div class="container">
				                		<div class="carousel-caption">男装 军旅式短茄克34
				                		<br>现售<span class="badge"><span class="glyphicon glyphicon-yen" aria-hidden="true"></span>177.0</span></div>
				                		</div>
				                	</div>
				                									
								
				                			                	 
				                	<div class="col-md-3">
				                		<a href="${pageContext.request.contextPath}/goods/getGoodsDetailById?goodsId=33" class="thumbnail">
				                		<img src="${pageContext.request.contextPath}/images/goods/1_1.jpg" alt="Image" class="img-responsive"></a>
				                		<div class="container">
				                		<div class="carousel-caption">男装 军旅式短茄克33
				                		<br>现售<span class="badge"><span class="glyphicon glyphicon-yen" aria-hidden="true"></span>177.0</span></div>
				                		</div>
				                	</div>
				                									
								
				                			                	 
				                	<div class="col-md-3">
				                		<a href="${pageContext.request.contextPath}/goods/getGoodsDetailById?goodsId=32" class="thumbnail">
				                		<img src="${pageContext.request.contextPath}/images/goods/1_1.jpg" alt="Image" class="img-responsive"></a>
				                		<div class="container">
				                		<div class="carousel-caption">男装 军旅式短茄克32
				                		<br>现售<span class="badge"><span class="glyphicon glyphicon-yen" aria-hidden="true"></span>177.0</span></div>
				                		</div>
				                	</div>
				                									
								
				                </div></div>							
					    								
								<div class="item  goods">
								<div class="row">									
								
				                			                	 
				                	<div class="col-md-3">
				                		<a href="${pageContext.request.contextPath}/goods/getGoodsDetailById?goodsId=31" class="thumbnail">
				                		<img src="${pageContext.request.contextPath}/images/goods/1_2.png" alt="Image" class="img-responsive"></a>
				                		<div class="container">
				                		<div class="carousel-caption">男装 军旅式短茄克31
				                		<br>现售<span class="badge"><span class="glyphicon glyphicon-yen" aria-hidden="true"></span>177.0</span></div>
				                		</div>
				                	</div>
				                									
								
				                			                	 
				                	<div class="col-md-3">
				                		<a href="${pageContext.request.contextPath}/goods/getGoodsDetailById?goodsId=30" class="thumbnail">
				                		<img src="${pageContext.request.contextPath}/images/goods/1_3.png" alt="Image" class="img-responsive"></a>
				                		<div class="container">
				                		<div class="carousel-caption">男装 军旅式短茄克30
				                		<br>现售<span class="badge"><span class="glyphicon glyphicon-yen" aria-hidden="true"></span>177.0</span></div>
				                		</div>
				                	</div>
				                									
								
				                			                	 
				                	<div class="col-md-3">
				                		<a href="${pageContext.request.contextPath}/goods/getGoodsDetailById?goodsId=29" class="thumbnail">
				                		<img src="${pageContext.request.contextPath}/images/goods/1_3.png" alt="Image" class="img-responsive"></a>
				                		<div class="container">
				                		<div class="carousel-caption">男装 军旅式短茄克29
				                		<br>现售<span class="badge"><span class="glyphicon glyphicon-yen" aria-hidden="true"></span>177.0</span></div>
				                		</div>
				                	</div>
				                									
								
				                			                	 
				                	<div class="col-md-3">
				                		<a href="${pageContext.request.contextPath}/goods/getGoodsDetailById?goodsId=28" class="thumbnail">
				                		<img src="${pageContext.request.contextPath}/images/goods/1_3.png" alt="Image" class="img-responsive"></a>
				                		<div class="container">
				                		<div class="carousel-caption">男装 军旅式短茄克28
				                		<br>现售<span class="badge"><span class="glyphicon glyphicon-yen" aria-hidden="true"></span>177.0</span></div>
				                		</div>
				                	</div>
				                									
								
				                </div></div>							
					    								
								<div class="item  goods">
								<div class="row">									
								
				                			                	 
				                	<div class="col-md-3">
				                		<a href="${pageContext.request.contextPath}/goods/getGoodsDetailById?goodsId=27" class="thumbnail">
				                		<img src="${pageContext.request.contextPath}/images/goods/1_2.png" alt="Image" class="img-responsive"></a>
				                		<div class="container">
				                		<div class="carousel-caption">男装 军旅式短茄克27
				                		<br>现售<span class="badge"><span class="glyphicon glyphicon-yen" aria-hidden="true"></span>177.0</span></div>
				                		</div>
				                	</div>
				                									
								
				                			                	 
				                	<div class="col-md-3">
				                		<a href="${pageContext.request.contextPath}/goods/getGoodsDetailById?goodsId=26" class="thumbnail">
				                		<img src="${pageContext.request.contextPath}/images/goods/1_2.png" alt="Image" class="img-responsive"></a>
				                		<div class="container">
				                		<div class="carousel-caption">男装 军旅式短茄克26
				                		<br>现售<span class="badge"><span class="glyphicon glyphicon-yen" aria-hidden="true"></span>177.0</span></div>
				                		</div>
				                	</div>
				                									
								
				                			                	 
				                	<div class="col-md-3">
				                		<a href="${pageContext.request.contextPath}/goods/getGoodsDetailById?goodsId=25" class="thumbnail">
				                		<img src="${pageContext.request.contextPath}/images/goods/1_1.jpg" alt="Image" class="img-responsive"></a>
				                		<div class="container">
				                		<div class="carousel-caption">男装 军旅式短茄克25
				                		<br>现售<span class="badge"><span class="glyphicon glyphicon-yen" aria-hidden="true"></span>177.0</span></div>
				                		</div>
				                	</div>
				                									
								
				                			                	 
				                	<div class="col-md-3">
				                		<a href="${pageContext.request.contextPath}/goods/getGoodsDetailById?goodsId=24" class="thumbnail">
				                		<img src="${pageContext.request.contextPath}/images/goods/1_1.jpg" alt="Image" class="img-responsive"></a>
				                		<div class="container">
				                		<div class="carousel-caption">男装 军旅式短茄克24
				                		<br>现售<span class="badge"><span class="glyphicon glyphicon-yen" aria-hidden="true"></span>177.0</span></div>
				                		</div>
				                	</div>
				                									
								
				                </div></div>							
					    
					  
					  	
				   	</div>
					<a class="left carousel-control" href="#newGoodsCarousel" role="button" data-slide="prev">
					<span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span><span class="sr-only">Previous</span></a>
					<a class="right carousel-control" href="#newGoodsCarousel" role="button" data-slide="next">
					<span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span><span class="sr-only">Next</span></a>
				</div>   
			    
			    			    
			  </div>
			</div>
			
		</div>
<div class="col-md-12">
			<div class="panel panel-warning">
			  <div class="panel-heading">
			    <h3>销售排行榜<a class="btn" href="${pageContext.request.contextPath}/goods/getSalesGoods">查看更多 »</a></h3>
			  </div>
			  <div class="panel-body">
			    <div id="salesGoodsCarousel" class="carousel slide goods" data-ride="carousel">								   
				  	<div class="carousel-inner" id="salesGoods">
					  
					  	
					    								
								<div class="item goods next left">
								<div class="row">									
								
				                			                	 
				                	<div class="col-md-3">
				                		<a href="${pageContext.request.contextPath}/goods/getGoodsDetailById?goodsId=22" class="thumbnail">
				                		<img src="${pageContext.request.contextPath}/images/goods/1_1.jpg" alt="Image" class="img-responsive"></a>
				                		<div class="container">
				                		<div class="carousel-caption">男装 军旅式短茄克22
	                					<br>共售出<span class="badge">1件</span></div>
				                		</div>
				                	</div>
				                									
								
				                			                	 
				                	<div class="col-md-3">
				                		<a href="${pageContext.request.contextPath}/goods/getGoodsDetailById?goodsId=34" class="thumbnail">
				                		<img src="${pageContext.request.contextPath}/images/goods/1_2.png" alt="Image" class="img-responsive"></a>
				                		<div class="container">
				                		<div class="carousel-caption">男装 军旅式短茄克34
	                					<br>共售出<span class="badge">1件</span></div>
				                		</div>
				                	</div>
				                									
								
				                			                	 
				                	<div class="col-md-3">
				                		<a href="${pageContext.request.contextPath}/goods/getGoodsDetailById?goodsId=33" class="thumbnail">
				                		<img src="${pageContext.request.contextPath}/images/goods/1_1.jpg" alt="Image" class="img-responsive"></a>
				                		<div class="container">
				                		<div class="carousel-caption">男装 军旅式短茄克33
	                					<br>共售出<span class="badge">0件</span></div>
				                		</div>
				                	</div>
				                									
								
				                			                	 
				                	<div class="col-md-3">
				                		<a href="${pageContext.request.contextPath}/goods/getGoodsDetailById?goodsId=32" class="thumbnail">
				                		<img src="${pageContext.request.contextPath}/images/goods/1_1.jpg" alt="Image" class="img-responsive"></a>
				                		<div class="container">
				                		<div class="carousel-caption">男装 军旅式短茄克32
	                					<br>共售出<span class="badge">0件</span></div>
				                		</div>
				                	</div>
				                									
								
				                </div></div>							
					    								
								<div class="item  goods">
								<div class="row">									
								
				                			                	 
				                	<div class="col-md-3">
				                		<a href="${pageContext.request.contextPath}/goods/getGoodsDetailById?goodsId=31" class="thumbnail">
				                		<img src="${pageContext.request.contextPath}/images/goods/1_2.png" alt="Image" class="img-responsive"></a>
				                		<div class="container">
				                		<div class="carousel-caption">男装 军旅式短茄克31
	                					<br>共售出<span class="badge">0件</span></div>
				                		</div>
				                	</div>
				                									
								
				                			                	 
				                	<div class="col-md-3">
				                		<a href="${pageContext.request.contextPath}/goods/getGoodsDetailById?goodsId=30" class="thumbnail">
				                		<img src="${pageContext.request.contextPath}/images/goods/1_3.png" alt="Image" class="img-responsive"></a>
				                		<div class="container">
				                		<div class="carousel-caption">男装 军旅式短茄克30
	                					<br>共售出<span class="badge">0件</span></div>
				                		</div>
				                	</div>
				                									
								
				                			                	 
				                	<div class="col-md-3">
				                		<a href="${pageContext.request.contextPath}/goods/getGoodsDetailById?goodsId=29" class="thumbnail">
				                		<img src="${pageContext.request.contextPath}/images/goods/1_3.png" alt="Image" class="img-responsive"></a>
				                		<div class="container">
				                		<div class="carousel-caption">男装 军旅式短茄克29
	                					<br>共售出<span class="badge">0件</span></div>
				                		</div>
				                	</div>
				                									
								
				                			                	 
				                	<div class="col-md-3">
				                		<a href="${pageContext.request.contextPath}/goods/getGoodsDetailById?goodsId=28" class="thumbnail">
				                		<img src="${pageContext.request.contextPath}/images/goods/1_3.png" alt="Image" class="img-responsive"></a>
				                		<div class="container">
				                		<div class="carousel-caption">男装 军旅式短茄克28
	                					<br>共售出<span class="badge">0件</span></div>
				                		</div>
				                	</div>
				                									
								
				                </div></div>							
					    								
								<div class="item  goods active left">
								<div class="row">									
								
				                			                	 
				                	<div class="col-md-3">
				                		<a href="${pageContext.request.contextPath}/goods/getGoodsDetailById?goodsId=27" class="thumbnail">
				                		<img src="${pageContext.request.contextPath}/images/goods/1_2.png" alt="Image" class="img-responsive"></a>
				                		<div class="container">
				                		<div class="carousel-caption">男装 军旅式短茄克27
	                					<br>共售出<span class="badge">0件</span></div>
				                		</div>
				                	</div>
				                									
								
				                			                	 
				                	<div class="col-md-3">
				                		<a href="${pageContext.request.contextPath}/goods/getGoodsDetailById?goodsId=26" class="thumbnail">
				                		<img src="${pageContext.request.contextPath}/images/goods/1_2.png" alt="Image" class="img-responsive"></a>
				                		<div class="container">
				                		<div class="carousel-caption">男装 军旅式短茄克26
	                					<br>共售出<span class="badge">0件</span></div>
				                		</div>
				                	</div>
				                									
								
				                			                	 
				                	<div class="col-md-3">
				                		<a href="${pageContext.request.contextPath}/goods/getGoodsDetailById?goodsId=25" class="thumbnail">
				                		<img src="${pageContext.request.contextPath}/images/goods/1_1.jpg" alt="Image" class="img-responsive"></a>
				                		<div class="container">
				                		<div class="carousel-caption">男装 军旅式短茄克25
	                					<br>共售出<span class="badge">0件</span></div>
				                		</div>
				                	</div>
				                									
								
				                			                	 
				                	<div class="col-md-3">
				                		<a href="${pageContext.request.contextPath}/goods/getGoodsDetailById?goodsId=24" class="thumbnail">
				                		<img src="${pageContext.request.contextPath}/images/goods/1_1.jpg" alt="Image" class="img-responsive"></a>
				                		<div class="container">
				                		<div class="carousel-caption">男装 军旅式短茄克24
	                					<br>共售出<span class="badge">0件</span></div>
				                		</div>
				                	</div>
				                									
								
				                </div></div>							
					    
					  
					  	
				   	</div>
					<a class="left carousel-control" href="#salesGoodsCarousel" role="button" data-slide="prev">
					<span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span><span class="sr-only">Previous</span></a>
					<a class="right carousel-control" href="#salesGoodsCarousel" role="button" data-slide="next">
					<span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span><span class="sr-only">Next</span></a>
				</div>   
			  </div>
			</div>
			
		</div>
		<%@include file="./common/userFooter.jsp" %>
</body>
</html>