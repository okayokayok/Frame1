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
<title>修改尺寸</title>
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
		  

          <h2 class="sub-header">修改商品尺寸</h2>
          <div class="col-sm-4 col-sm-offset-3 col-md-5 col-md-offset-2">
         	<form class="form" role="form" id="sizeForm"  method="post" action="${pageContext.request.contextPath }/admin/updateSize" >
					
					<input type="hidden" id="sizeId" name="sizeId" value="${size.sizeId }"/>
					<div class="form-group">
						<label for="sizeName"> 商品尺寸名称 </label> 
						<input class="form-control" name="sizeName" id="sizeName" value="${size.sizeName }" type="text"  placeholder="商品尺寸名称" required/>
					</div>
					
					
		
				<button class="btn btn-primary" type="submit" >确定</button>
				<button class="btn btn-default" type="reset" >重置</button>
			
			</form>
		   </div>
        </div>
      </div>
    </div>
	

<%@include file="../common/adminFooter.jsp" %>
</body>
</html>