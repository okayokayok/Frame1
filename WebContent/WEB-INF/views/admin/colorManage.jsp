<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>颜色管理</title>
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
		  

          <h2 class="sub-header">商品颜色列表</h2>
          <a class="btn btn-primary" href="${pageContext.request.contextPath }/admin/addColor" >添加商品颜色</a>
          
          <div class="table-responsive">
            <table class="table table-striped">
              <thead>
                <tr>
                  <th>#</th>
                  <th>商品颜色名称</th>
                  <th>操作</th>
                </tr>
              </thead>
              <tbody>
              	<c:forEach items="${colors.list}" var="s" varStatus="vs">
                <tr>
                  <td>${vs.index+1 }</td>
                  <td>${s.colorName }</td>
                  <td>
                  	<a href="${pageContext.request.contextPath }/admin/colorDetail?colorId=${s.colorId}">修改</a> |
                  	<a href="${pageContext.request.contextPath }/admin/color/delColor?colorId=${s.colorId}" onclick="confirm('确定要删除这个颜色吗？')">删除</a>   
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