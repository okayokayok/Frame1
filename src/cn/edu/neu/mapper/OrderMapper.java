package cn.edu.neu.mapper;

import java.util.List;

import cn.edu.neu.core.common.Page;
import cn.edu.neu.model.Order;
import cn.edu.neu.model.OrderDetail;

public interface OrderMapper {

	void saveOrder(Order order);

	void saveOrderDetail(OrderDetail od);

	void updateOrderStatus(String orderId, int status);

	List<Order> findMyOrders(int loginUserId, String status);

	int findOrderStatusById(int parseInt);

	Order findOrderById(int orderId);

	List<OrderDetail> findOrderDetailByid(int orderId);

	boolean delOrderDetailByorderId(int orderId);

	boolean delOrderByOrderId(int orderId);

	List<Order> findAllOrders(Page<Order> page);

	boolean sendGoods(Order order);

}
