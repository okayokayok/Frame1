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
<title>分类列表</title>
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
		  

          <h2 class="sub-header">商品分类列表</h2>
          
          <div class="table-responsive">
            <table class="table table-striped">
              <thead>
                <tr>
                  <th>#</th>
                  <th>商品分类名称</th>
                  <th>商品分类图片</th>
                  <th>操作</th>
                </tr>
              </thead>
              <tbody>
              	<c:forEach items="${cates.list}" var="g" varStatus="vs">
       
       			<tr>
                  <td>${vs.index+1}</td>
                  <td>${g.cateName}</td>
                  <td><img src="${pageContext.request.contextPath }/${g.catePic}" width="50" height="50"></td>
                  <td>
                  	<a href="${pageContext.request.contextPath}/admin/handleCate?cateId=${g.cateId}">修改</a> |
                  	<a href="${pageContext.request.contextPath}/admin/delCate?cateId=${g.cateId}" onclick="confirm('将删除此分类和此分类下所有商品，确定要删除这个分类吗？')">删除</a>   
				  </td>
                </tr>
       
       </c:forEach>
               
               
              </tbody>
            </table>
 			

          </div>
         
        </div>
 		
       		<%@include file="../common/pageList.jsp" %>
       
      </div>
    </div>

<%@include file="../common/adminFooter.jsp" %>
</body>
</html>