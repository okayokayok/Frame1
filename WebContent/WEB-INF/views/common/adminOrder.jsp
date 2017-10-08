<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<script type="text/javascript">
function selOrdersBut(formName,cbName){
	if($("#selAllOrders").is(":checked"))
		selectAll(formName,cbName);
	else
		unSelectAll(formName,cbName);
}
function check(){
	if(!validateCheckbox("orderIds","请至少选中一个订单"))
		return false;
	else
		return confirm("确实要删除选中的所有订单吗？");
}
function handleOrder(orderId,status,msg,e){
	if(confirm(msg)){
		var os=$(e.target).parent().siblings(".orderStatus");	
		
		$.post(getContextPath()+"/admin/order/handleOrderStatus",{orderId:orderId,status:status},function(result){
			
				if(result.handle=="success"){
					
					var tdTag=$(e.target).parent();
					tdTag.html("");
					if(status==9){
						os.html("交易关闭");
					}
					else if(status==3){
						os.html("退款成功");
					}
					else if(status==7){
						os.html("退货中");
						tdTag.html("<a href=\"#\" onclick=\"handleOrder("+orderId+",8,'确定收到这个订单退货吗？',event);\">确认收到退货</a>");
					}
					else if(status==8){
						os.html("退货成功");
					}
					
					$("#msgTitle").html("操作成功");
					$("#msgBody").html("订单操作成功");
					$("#msgModal").modal();	
				}else if(result.handle=="failure"){
					$("#msgTitle").html("操作失败");
					$("#msgBody").html("抱歉，目前的订单状态无法进行此操作");
					$("#msgModal").modal();
				}
				
		});
	}
}
function sendGoods(orderId,status,e){
	$('#postInfoFormModal').modal();
	$("#ok").click(function(){
		var os=$(e.target).parent().siblings(".orderStatus");
		
		var orderPostname=$("#orderPostname").val();
		var orderPostcode=$("#orderPostcode").val();
		$.post(getContextPath()+"/admin/order/sendGoods",{orderId:orderId,orderStatus:status,orderPostname:orderPostname,orderPostcode:orderPostcode},function(result){
			if(checkLogin(result)){
				if(result.handle=="success"){
					if(status==4){
						os.html("已发货");
						$(e.target).parent().html("");
					}
					
					$("#msgTitle").html("操作成功");
					$("#msgBody").html("订单操作成功");
					$("#msgModal").modal();	
				}else if(result.handle=="failure"){
					$("#msgTitle").html("操作失败");
					$("#msgBody").html("抱歉，目前的订单状态无法进行此操作");
					$("#msgModal").modal();
				}
				else{
					$("#msgTitle").html("操作失败");
					$("#msgBody").html("操作订单失败");
					$("#msgModal").modal();
				}
			}
		});
	});

	
	
}
</script>
<div class="modal fade" id="postInfoFormModal" role="dialog" aria-hidden="true" aria-labelledby="myModalLabel">
	<div class="modal-dialog">
		<div class="modal-content">
			<form class="form-inline" role="form" id="postForm"  method="post" action="">
			<div class="modal-header">
				<button class="close" aria-hidden="true" type="button" data-dismiss="modal">×</button>
				<h4 class="modal-title" id="myModalLabel">添加发货信息</h4>
			</div>
			<div class="modal-body">
					<div class="form-group">
						<label for="orderPostname"> 快递公司名称 </label> 
						<input class="form-control" name="orderPostname" id="orderPostname" type="text"  placeholder="快递公司名称" required/>
					</div>
					<div class="form-group">
						<label for="orderPostcode"> 快递单号</label> 
						<input class="form-control" name="orderPostcode" id="orderPostcode" type="text" placeholder="快递单号" required/>
					</div>

			</div>
			<div class="modal-footer">
				<button class="btn btn-primary" type="button" data-dismiss="modal" id="ok" >确定</button>
				<button class="btn btn-default" type="button" data-dismiss="modal">关闭窗口</button>
			</div>
			</form>
		</div>

	</div>

</div>