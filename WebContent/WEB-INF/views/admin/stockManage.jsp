<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>库存管理</title>
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
		  

          <h2 class="sub-header">商品库存列表</h2>
        
          
          <div class="table-responsive">
            <table class="table table-striped">
              <thead>
                <tr>
                  <th>#</th>
                  <th>商品名称</th>
                  <th>商品图片</th>
                  <th>总库存</th>
                  <th>总销量</th>
                  <th>操作</th>
                </tr>
              </thead>
              <tbody>
              	<c:forEach items="${goods.list}" var="s" varStatus="vs">
                <tr>
                  <td>${vs.index+1 }</td>
                  <td>${s.goodsName }</td>
                  <td><img src="${pageContext.request.contextPath }${s.goodsPic}" width="50" height="50"></td>
                  <td>${s.goodsStock }</td>
                  <td>${s.goodsSales }</td>
                  <td>
                  	<a href="${pageContext.request.contextPath }/admin/goods/getStocks?goodsId=${s.goodsId}">管理商品库存</a>
                  	  
				  </td>
                </tr>
               
               </c:forEach>
              </tbody>
            </table>
    

		<!-- 分页信息 -->
		<%@include file="../common/pageList.jsp" %>
        </div>
        
        </div>
      </div>
    </div>

<%@include file="../common/adminFooter.jsp" %>
</body>
</html>