package cn.edu.neu.service;

import java.util.List;

import cn.edu.neu.core.common.Page;
import cn.edu.neu.model.Order;
import cn.edu.neu.model.OrderDetail;

public interface OrderService {
	int addOrder(Order order, List<OrderDetail> orderDetails);
	
	void changeOrderStatus(String orderId, int orderPaid);

	List<Order> getMyOrders(int loginUserId, String status);

	int getOrderStatusById(String orderId);

	Order findOrderById(int orderId);

	List<OrderDetail> findOrderDetailByid(int orderId);

	boolean delOrderDetail(int orderId);

	boolean delOrderByOrderId(int orderId);

	Page<Order> findAllOrders(String orderStatus, String orderCode, String userName, String startDate, String endDate);

	boolean sendGoods(Order order);
}
