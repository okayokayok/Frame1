<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
        <%@page import="cn.edu.neu.core.common.CommonBaseAction"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>订单信息</title>
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
        	 
            <form class="form-inline" role="form" id="searchForm"  method="post" 
          	action="${pageContext.request.contextPath}/admin/order/getAdminOrders">			
				<div class="form-group">
					<label for="orderStatus">  </label> 
					<select class="form-control input-sm" name="orderStatus" id="orderStatus">
					  <option value="-1">---所有状态---</option>
					  
					  	<option value="0" >等待付款</option>
					  
					  	<option value="1" >未发货</option>
					  
					  	<option value="2" >申请退款中</option>
					  
					  	<option value="3" >退款成功</option>
					  
					  	<option value="4" >已发货</option>
					  
					  	<option value="5" >交易成功</option>
					  
					  	<option value="6" >申请退货中</option>
					  
					  	<option value="7" >退货中</option>
					  
					  	<option value="8" >退货成功</option>
					  
					  	<option value="9" >交易关闭</option>
					  
					</select>
				</div>
				<div class="form-group">
					<label for="orderCode"> 订单号</label> 
					<input class="form-control input-sm" name="orderCode" id="orderCode" value="" type="number" placeholder="订单号" />
				</div>
				<div class="form-group">
					<label for="userName"> 用户名</label> 
					<input class="form-control input-sm" name="userName" id="userName" value="" type="text" placeholder="用户名" />
				</div>
				<div class="form-group">
					<label for="orderDate"> 下单日期 </label> 
					<input class="form-control input-sm" name="startDate" id="startDate" value="" type="date" placeholder="起始日期" />-
					<input class="form-control input-sm" name="endDate" id="endDate" value="" type="date" placeholder="终止日期" />
				</div>	
				<button class="btn btn-primary btn-sm" type="submit" >搜索</button>
			</form>
			</div>

		  </div>
		  
          
        
		  <h2 class="sub-header">订单信息列表</h2>
		  
          
          <div class="table-responsive ">
          	<form name="orderForm" method="post" action="${pageContext.request.contextPath}/admin/order/delOrderByIds" onsubmit="return check()">
          	
            <table class="table table-striped">
              <thead>
                <tr>
                 
                  <th>#</th>
                  <th>订单号</th>
                  <th>用户名</th>
                  <th>订单状态</th>
                  <th>运费</th>
                  <th>下单日期</th>
                  
                  <th>操作</th>
                </tr>
              </thead>
              <tbody>
              	<c:forEach items="${orders.list}" var="o" varStatus="vs">
                <tr>
                  
                  <td>${vs.index+1 }</td>
                  <td><a href="${pageContext.request.contextPath}/admin/order/getOrderDetailById?orderId=${o.orderId}">${o.orderCode }</a></td>
                  <td>${o.userName }</td>
                  <td class="orderStatus">
					<c:if test="${o.orderStatus==0}">
						等待付款
					</c:if>
					<c:if test="${o.orderStatus==1}">
						未发货
					</c:if>
					<c:if test="${o.orderStatus==2}">
						申请退款中
					</c:if>
					<c:if test="${o.orderStatus==3}">
						退款成功
					</c:if>
					<c:if test="${o.orderStatus==4}">
						已发货
					</c:if>
					<c:if test="${o.orderStatus==5}">
						交易成功
					</c:if>
					<c:if test="${o.orderStatus==6}">
						申请退货中
					</c:if>
					<c:if test="${o.orderStatus==7}">退货中</c:if>
					<c:if test="${o.orderStatus==8}">退货成功</c:if>
					<c:if test="${o.orderStatus==9}">
						交易关闭
					</c:if>
				  </td>
                  <td>${o.orderPostalfee }</td>
                  <td>${o.orderDate }</td>

                  <td>
                  	
                  	<c:if test="${o.orderStatus==0}">
						<a href="#" onclick="if(alert('联系买家成功')) javascript:location.href='#'">联系买家</a>
					</c:if>
					<c:if test="${o.orderStatus==1}">
						<a href="#" onclick="sendGoods(${o.orderId},4,event)">去发货</a>
					</c:if>
					<c:if test="${o.orderStatus==2}">
						<a href="#" onclick="handleOrder(${o.orderId},3,'确定要同意这个订单退款吗？',event);">同意退款</a>
					</c:if>
					<c:if test="${o.orderStatus==3}">
						<a href="#" onclick="if(confirm('确定要删除这个订单吗？')) javascript:location.href='${pageContext.request.contextPath}/admin/order/delOrder?orderId=${o.orderId}'">删除订单</a>
					</c:if>
					<c:if test="${o.orderStatus==4}">
						已发货
					</c:if>
					<c:if test="${o.orderStatus==5}">
						<a href="#" onclick="if(confirm('确定要删除这个订单吗？')) javascript:location.href='${pageContext.request.contextPath}/admin/order/delOrder?orderId=${o.orderId}'">删除订单</a>
					
					</c:if>
					<c:if test="${o.orderStatus==6}">
						<a href="#" onclick="handleOrder(${o.orderId},7,'确定要同意这个订单退货吗？',event);">同意退货</a>
					</c:if>
					<c:if test="${o.orderStatus==7}">
						<a href="#" onclick="handleOrder(${o.orderId},8,'确定收到这个订单退货吗？',event);">确认收到退货</a>
					</c:if>
					<c:if test="${o.orderStatus==8}">
						<a href="#" onclick="if(confirm('确定要删除这个订单吗？')) javascript:location.href='${pageContext.request.contextPath}/admin/order/delOrder?orderId=${o.orderId}'">删除订单</a>
					</c:if>
					<c:if test="${o.orderStatus==9}">
						<a href="#" onclick="if(confirm('确定要删除这个订单吗？')) javascript:location.href='${pageContext.request.contextPath}/admin/order/delOrder?orderId=${o.orderId}'">删除订单</a>
					</c:if>
                  	
				  </td>
                </tr>
               </c:forEach>
                
               
              </tbody>
            </table>
            </form>
          <!-- 分页信息 -->
       <%@include file="../common/pageList.jsp" %>
		
       </div>
        
       </div>
       
        
      </div>
    </div>
		

<%@include file="../common/adminFooter.jsp" %>
</body>
</html>