<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	
	<div class="container-fluid">
      <div class="row">
<%@include file="../common/setReferUrl.jsp" %>
<%@include file="../common/adminTopNav.jsp" %>
	 <div class="col-sm-3 col-md-2 sidebar">
          <%@include file="../common/adminLeftNav.jsp" %>
        </div>
        <script type="text/javascript">
	$(document).ready(function() {
		// make code pretty
		window.prettyPrint && prettyPrint();
		
		if ( window.location.hash ) {
			scrollTo(window.location.hash);
		}
		
		$('.nav').on('click', 'a', function(e) {
			scrollTo($(this).attr('href'));
		});		

		$('#undo_redo').multiselect({
			keepRenderingSort: true
		});

		$('#undo_redo').multiselect();
		$('#undo_redo2').multiselect();
	});
	
	function scrollTo( id ) {
		if ( $(id).length ) {
			$('html,body').animate({scrollTop: $(id).offset().top - 40},'slow');
		}
	}
	function check(){
		if($("select[name='sizeIds']").children().size()==0){
			showMsgModal("提示","请选择商品尺寸");
			return false;
		}
		else{
			$("select[name='sizeIds']").children().attr("selected","selected");
		}
	}
	function check2(){
		if($("select[name='colorIds']").children().size()==0){
			showMsgModal("提示","请选择商品颜色");
			return false;
		}
	}
</script>
        
           <div class="col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-2 main">
		  
		<ul class="nav nav-tabs">
		  <li role="presentation">
		  	<a href="${pageContext.request.contextPath }/admin/goods/handleGoodsSizes?goodsId=${goodsId}">管理商品尺寸</a>	  
		  </li>

		  <li role="presentation"  class="active">
		  	<a href="#">管理商品颜色</a>
		  </li>
		  
		</ul>




          
          <div class="col-sm-12  col-md-12 ">
            
			<form class="form" role="form"  method="post" onsubmit="return check2()" action="${pageContext.request.contextPath }/admin/goods/doHandleGoodsColors">
	            <input type="hidden" name="goodsId" value="${goodsId}"/>
	            <div class="form-group">
	            <div class="row">
				<div class="col-xs-5">
					<select name="from" id="undo_redo" class="form-control" size="15" multiple="multiple">
						<c:forEach var="color" items="${colors}">  
                                <option value="${color.colorId}">  
                                ${color.colorName}  
                                </option>  
                                </c:forEach>  
					</select>
				</div>
				
				<div class="col-xs-2">
					<button type="button" id="undo_redo_undo" class="btn btn-primary btn-block">undo</button>
					<button type="button" id="undo_redo_rightAll" class="btn btn-default btn-block"><i class="glyphicon glyphicon-forward"></i></button>
					<button type="button" id="undo_redo_rightSelected" class="btn btn-default btn-block"><i class="glyphicon glyphicon-chevron-right"></i></button>
					<button type="button" id="undo_redo_leftSelected" class="btn btn-default btn-block"><i class="glyphicon glyphicon-chevron-left"></i></button>
					<button type="button" id="undo_redo_leftAll" class="btn btn-default btn-block"><i class="glyphicon glyphicon-backward"></i></button>
					<button type="button" id="undo_redo_redo" class="btn btn-warning btn-block">redo</button>
				</div>

				
				<div class="col-xs-5">
					<select name="colorIds" id="undo_redo_to" class="form-control" size="15" multiple="multiple">
						<c:forEach var="goodColor" items="${goodColors}">  
                                <option value="${goodColor.colorId}">  
                                ${goodColor.colorName}  
                                </option>  
                                </c:forEach>  
					</select>
				</div>
				</div>
	            </div>	
				<div class="form-group">
				<button class="btn btn-primary" type="submit" >提交商品颜色更新</button>
				<button class="btn btn-primary" id="back" type="button" onclick="javascript:location.href='${pageContext.request.contextPath }/admin/goods/getGoodsSizesAndColors'">返回列表</button>
				</div>
			</form>
		   </div>
		   

        </div>
        
	</div>
</div>
<%@include file="../common/adminFooter.jsp" %>
</body>
</html>