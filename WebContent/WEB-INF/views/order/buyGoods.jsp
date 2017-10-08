<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>购物车</title>
</head>
<body>
<%@include file="../common/userTopNav.jsp" %>

<div class="container-fluid">
	<div class="row">
	<form action="${pageContext.request.contextPath}/order/addOrder" method="post" onsubmit="return validateRadio('address','请选择收货地址');">
		<div class="col-md-10 col-md-offset-1" id="myAddress">
		<c:if test="${!empty addrs}">
		<h3>确认收货地址</h3>
		<table class="table table-condensed table-hover">
			<tbody>				
				<c:forEach items="${addrs}" var="a" varStatus="vs">
				<tr>
					<td>						
					<input type="radio" name="address" value="${a.addrProvince} ${a.addrCity} ${a.addrArea} ${a.addrContent} (${a.addrReceiver}收) ${a.addrTel}" ${a.addrIsdefault==1?'checked':'' }>						   						 					
					</td>
					<td>${a.addrProvince} ${a.addrCity} ${a.addrArea}</td><td>${a.addrContent}</td>
					<td>(${fn:escapeXml(a.addrReceiver)}收) ${a.addrTel} </td>
					<td>${a.addrIsdefault==1?'默认地址':'' }</td>
				</tr>
				</c:forEach>
			</tbody>
		</table>		
		</c:if>
		
		<c:if test="${empty addrs}">
			<h3>您目前没有收货地址，可以到个人中心<a href="${pageContext.request.contextPath}/address/getMyAddress">管理您的收货地址</a></h3>		
		</c:if>
		</div>
		<div class="col-md-10 col-md-offset-1">
			<h3>确认订单信息</h3>
			
			<table class="table table-hover table-condensed">
				<thead>
					<tr>
						<th>#</th><th>商品图片</th><th>商品名称</th><th>商品单价</th><th>数量</th><th>小计</th>
					</tr>
				</thead>
				<tbody>
					<c:set var="totalAmount" value="0"/>
					<c:set var="postalfee" value="${paramValues.goodsPostalfee[0]}"/>
					<c:forEach items="${paramValues.goodsId}" var="g" varStatus="vs">

					<tr ${vs.count%2==0?'class=\"info\"':''}>
						<td>
							${vs.count}
						</td>
						<td>
							<img src="${paramValues.pic[vs.index]}" width="30" height="30">
						</td>
						<td>
							${paramValues.goodsName[vs.index]}&nbsp;&nbsp;
							${paramValues.size[vs.index]}&nbsp;&nbsp;${paramValues.color[vs.index]}
						</td>
						<td>
							原价<span class="glyphicon glyphicon-yen" aria-hidden="true"></span>${paramValues.goodsPrice[vs.index]}&nbsp;&nbsp;
							现售<span class="glyphicon glyphicon-yen" aria-hidden="true"></span>${paramValues.goodsDiscount[vs.index]}
						</td>
						<td>
							${paramValues.num[vs.index]}
						</td>
						<td>
							<span class="glyphicon glyphicon-yen" aria-hidden="true"></span>
							${paramValues.num[vs.index]*paramValues.goodsDiscount[vs.index]}
						</td>
						<c:set var="totalAmount" value="${totalAmount+paramValues.num[vs.index]*paramValues.goodsDiscount[vs.index]}"/>
						<c:set var="postalfee" value="${postalfee>paramValues.goodsPostalfee[vs.index]?paramValues.goodsPostalfee[vs.index]:postalfee}"/>
					</tr>
					</c:forEach>
				</tbody>
			</table>
			<table class="table table-condensed">
				<tr><td class="text-right">运费：<span class="glyphicon glyphicon-yen" aria-hidden="true"></span>${postalfee}</td></tr>
				<tr><td class="text-right">合计（含运费）：<span class="glyphicon glyphicon-yen" aria-hidden="true"></span>${totalAmount+postalfee}</td></tr>
			</table>
			<div ></div>
			<div class="col-md-12 text-right"><button id="submitOrder" class="btn btn-primary" type="submit" ${empty addrs?"disabled='disabled'":"" }>提交订单</button></div>				 
		</div>
		<input type="hidden" name="orderPostalfee" value="${postalfee}"/>
	</form>
	</div>
</div>


<%@include file="../common/userFooter.jsp" %>
</body>
</html>