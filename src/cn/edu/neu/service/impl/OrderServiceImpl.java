package cn.edu.neu.service.impl;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Random;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import cn.edu.neu.core.common.Page;
import cn.edu.neu.mapper.OrderMapper;
import cn.edu.neu.model.Goods;
import cn.edu.neu.model.Order;
import cn.edu.neu.model.OrderDetail;
import cn.edu.neu.service.OrderService;

@Service
public class OrderServiceImpl implements OrderService {

	@Autowired
	OrderMapper mapper;
	
	@Override
	public int addOrder(Order order, List<OrderDetail> orderDetails) {
		// TODO Auto-generated method stub
		Date d=new Date();
		SimpleDateFormat sf=new SimpleDateFormat("yyyyMMddHHmmssSSS");
		String str=sf.format(d);
		Random r=new Random();
		int i=r.nextInt(100);
		String s="";
		if(i<10)
			s="00"+i;
		else if(i>=10&&i<=99)
			s="0"+i;
		String orderCode=str+s;
		
	
		order.setOrderCode(orderCode);
		mapper.saveOrder(order);
		int orderId=order.getOrderId();
		System.out.println("---------"+order.getOrderId());
		
		for(int j=0;j<orderDetails.size();j++){
			OrderDetail od=orderDetails.get(j);
			od.setOrderId(orderId);
			mapper.saveOrderDetail(od);
		}
		
		return orderId;
	}
	
	@Override
	public void changeOrderStatus(String orderId, int status) {
		// TODO Auto-generated method stub
		Map<String,String> m=new HashMap<String,String>();
		m.put("orderId", orderId);
		mapper.updateOrderStatus(orderId,status);
		
	}

	@Override
	public List<Order> getMyOrders(int loginUserId, String status) {
		// TODO Auto-generated method stub
		List<Order> orderList=mapper.findMyOrders(loginUserId,status);
		return orderList;
	}

	@Override
	public int getOrderStatusById(String orderId) {
		// TODO Auto-generated method stub
		int status=mapper.findOrderStatusById(Integer.parseInt(orderId));
		return status;
	}

	@Override
	public Order findOrderById(int orderId) {
		// TODO Auto-generated method stub
		return mapper.findOrderById(orderId);
	}

	@Override
	public List<OrderDetail> findOrderDetailByid(int orderId) {
		// TODO Auto-generated method stub
		return mapper.findOrderDetailByid(orderId);
	}

	@Override
	public boolean delOrderDetail(int orderId) {
		// TODO Auto-generated method stub
		return mapper.delOrderDetailByorderId(orderId);
	}

	@Override
	public boolean delOrderByOrderId(int orderId) {
		// TODO Auto-generated method stub
		return mapper.delOrderByOrderId(orderId);
	}

	@Override
	public Page<Order> findAllOrders(String orderStatus, String orderCode, String userName, String startDate, String endDate) {
		// TODO Auto-generated method stub
		Page<Order> page=new Page<Order>(10);
		Map<String,Object> m=new HashMap<String,Object>();
		m.put("orderStatus", orderStatus);
		m.put("orderCode", orderCode);
		m.put("userName", userName);
		m.put("startDate", startDate);
		m.put("endDate", endDate);
		page.setParams(m);
		System.out.println(m.toString());
		List<Order> list=mapper.findAllOrders(page);
		page.setList(list);
		return page;
	}

	@Override
	public boolean sendGoods(Order order) {
		// TODO Auto-generated method stub
		return mapper.sendGoods(order);
	}

}
