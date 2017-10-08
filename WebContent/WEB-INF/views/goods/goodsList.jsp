<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>商品列表</title>
</head>
<body>
<%@include file="../common/userTopNav.jsp" %>

<div class="container-fluid">
	<div class="row">
		<div class="col-md-2">
			<%@include file="../common/userLeftNav.jsp" %>
		</div>
		<div class="col-md-10">
			<c:if test="${!empty goodsList.list }">
			<c:forEach items="${goodsList.list}" var="g">
				<div class="col-md-3">
					<div class="thumbnail">
						<a href="${pageContext.request.contextPath}/goods/getGoodsDetailById?goodsId=${g.goodsId}">
			    		<img src="${pageContext.request.contextPath}${g.goodsPic}" alt="${g.goodsName}"></a>
			    		<div class="caption" align="center"><p>${g.goodsName}</p>
			    		<p>原价：${g.goodsPrice}</p>
			    		<p>现售：${g.goodsDiscount}</p>
			    		<p>共售出：${g.goodsSales}件</p>
			    		<p><a href="${pageContext.request.contextPath}/goods/getGoodsDetailById?goodsId=${g.goodsId}" class="btn btn-primary" role="button">查看详情</a></p>
			    		</div>
			    		
			    		
					</div>
				</div>
			</c:forEach>
			
			<div class="col-md-12">
			<%@include file="../common/pageList.jsp" %>
			</div>
				
			</c:if>	
			
			<c:if test="${empty goodsList.list }">
				<div class="col-md-12">
						<div class="span12">
							<div class="alert alert-warning">
								 <button type="button" class="close" data-dismiss="alert">×</button>
								<h4>
									提示!
								</h4> <strong>商家正在补货中!</strong>
							</div>
						</div>
				</div>
			</c:if>	
		</div>	
	</div>
</div>


<%@include file="../common/userFooter.jsp" %>
</body>
</html>