<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>订单详情</title>
</head>
<body>
<%@include file="../common/setReferUrl.jsp" %>
<%@include file="../common/adminTopNav.jsp" %>

<%@include file="../common/adminOrder.jsp" %>

    <div class="container-fluid">
      <div class="row">
        <div class="col-sm-3 col-md-2 sidebar">
          <%@include file="../common/adminLeftNav.jsp" %>
        </div>
        
        
        
        
        
         <div class="col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-2 main">
         <div class="row">
        	<div class="col-md-12">
        	
        	
        	
        	
        	
		
				<<h3>订单信息</h3>
		<table class="table table-condensed table-hover">
			<tbody>
				<tr>
					<td>订单编号：${order.orderCode }</td>
					<td>创建时间：${order.orderDate }</td>
				</tr>
				<tr>
					<td>
						订单状态：<span  id="orderStatus">
					<c:if test="${order.orderStatus==0}">
						等待付款
					</c:if>
					<c:if test="${order.orderStatus==1}">
						未发货
					</c:if>
					<c:if test="${order.orderStatus==2}">
						已提交退款申请，请等待商家处理
					</c:if>
					<c:if test="${order.orderStatus==3}">
						退款成功
					</c:if>
					<c:if test="${order.orderStatus==4}">
						已发货
					</c:if>
					<c:if test="${order.orderStatus==5}">
						交易成功
					</c:if>
					<c:if test="${order.orderStatus==6}">
						已提交退货申请，请等待商家处理
					</c:if>
					<c:if test="${order.orderStatus==7}">退货中</c:if>
					<c:if test="${order.orderStatus==8}">退货成功</c:if>
					<c:if test="${order.orderStatus==9}">
						交易关闭
					</c:if>
					</span>
					</td>
					<td>送货地址：${order.orderAddress }</td>
				</tr>
				
				<tr>
					 <td>运单编号：${order.orderPostcode }</td>
					 <td>快递名称：${order.orderPostname }</td>			 
				</tr>
				
			</tbody>
			</table>
				
				
				
					<div class="panel panel-info">
					<div class="panel-heading">商品列表</div>
					<div class="panel-body">	
					<table class="table table-hover table-condensed">
				<thead>
					<tr>
						<th>#</th><th>商品图片</th><th>商品名称</th><th>商品单价</th><th>数量</th><th>小计</th>
					</tr>
				</thead>
				<tbody>
					
					
					
				<c:forEach items="${oDetail}" var="od" varStatus="vs">
					<tr >
						<td>
							${vs.index+1 }
						</td>
						<td>
							<img src="${pageContext.request.contextPath}${od.odetailPic}" width="30" height="30">
						</td>
						<td>
							${od.odetailName}&nbsp;&nbsp;
							${od.odetailSize }&nbsp;&nbsp;${od.odetailColor }
						</td>
						<td>
							单价<span class="glyphicon glyphicon-yen" aria-hidden="true"></span>${od.odetailPrice }
						</td>
						<td>
							${od.odetailNum }
						</td>
						<td>
							<span class="glyphicon glyphicon-yen" aria-hidden="true"></span>
							${od.odetailPrice*od.odetailNum }
						</td>
						
					</tr>
					</c:forEach>
				</tbody>
			</table>
					</div></div>
					<table class="table table-condensed">
				<tr><td class="text-right">运费：<span class="glyphicon glyphicon-yen" aria-hidden="true"></span>${order.orderPostalfee }</td></tr>
				<tr><td class="text-right">订单总金额（含运费）：<span class="glyphicon glyphicon-yen" aria-hidden="true"></span>${sum+order.orderPostalfee}</td></tr>
			</table>
					<div class="col-md-12 text-right">
			<span>
					<c:if test="${order.orderStatus==1}">
						<button class="btn btn-primary" type="button" onclick="sendGoods(${order.orderId},4,event)">去发货</button>
					</c:if>
					<c:if test="${order.orderStatus==2}">
						<button class="btn btn-primary" type="button" onclick="handleOrder(${order.orderId},3,'确定要同意这个订单退款吗？',event);">同意退款</button>
					</c:if>
					
					<c:if test="${o.orderStatus==6}">
						<button class="btn btn-primary" type="button" onclick="handleOrder(${order.orderId},7,'确定要同意这个订单退货吗？',event);">同意退货</button>
					</c:if>
					<c:if test="${o.orderStatus==7}">
						<button class="btn btn-primary" type="button" onclick="handleOrder(${order.orderId},8,'确定收到这个订单退货吗？',event);">确认收到退货</button>
					</c:if>
					
			</span>
			
			
			<button class="btn btn-primary" id="back" type="button" onclick="javascript:location.href='${pageContext.request.contextPath}/admin/order/getAdminOrders'">返回订单列表</button>
			</div>			 
				
			
        	
        	
        	
        	
        	
        	
            </div>
          
        </div>
        
        </div>
        </div>
        
       
        
     
    </div>

<%@include file="../common/adminFooter.jsp" %>
</body>
</html>