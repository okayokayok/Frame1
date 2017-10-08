package cn.edu.neu.action;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;
//import javax.websocket.Session;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import cn.edu.neu.core.Constants;
import cn.edu.neu.model.Address;
import cn.edu.neu.model.Order;
import cn.edu.neu.model.OrderDetail;
import cn.edu.neu.model.User;
import cn.edu.neu.service.AddressService;
import cn.edu.neu.service.OrderService;

@Controller
@RequestMapping("/order")
public class OrderAction {
	
	@Autowired
	AddressService addressService;
	@Autowired
	OrderService orderService;
	private String EXECUTE_RESULT;
	
	@RequestMapping("/buyGoods")
	String buyGoods(HttpSession session,@RequestParam(required=false) String[] goodsId, @RequestParam(required=false) String[] goodsName, @RequestParam(required=false) String[] goodsPrice,@RequestParam(required=false) String[] goodsDiscount,@RequestParam(required=false) String[] num, @RequestParam(required=false) String[] size,
			@RequestParam(required=false) String[] color,
			@RequestParam(required=false) String[] pic, @RequestParam(required=false) String[] goodsPostalfee, Map<String,Object> m){
		User user = (User) session.getAttribute(Constants.LOGIN_USER);
		m.put("goodsId", goodsId);
		m.put("goodsName", goodsName);
		m.put("goodsDiscount", goodsDiscount);
		m.put("size", size);
		m.put("color", color);
		m.put("num", num);
		m.put("pic",pic);
		
		session.setAttribute("goodsId", goodsId);
		session.setAttribute("goodsName", goodsName);
		session.setAttribute("goodsDiscount", goodsDiscount);
		session.setAttribute("size", size);
		session.setAttribute("color", color);
		session.setAttribute("num", num);
		session.setAttribute("pic",pic);
		List<Address> addrs=addressService.findAddressByUserId(user.getUserId());
		m.put("addrs", addrs);
		return "/order/buyGoods";
	}
	
	
	@RequestMapping("/addOrder")
	public String addOrder(String address,String orderPostalfee,HttpSession session,Map<String,String> m){
		User user = (User) session.getAttribute(Constants.LOGIN_USER);
		Order order=new Order();
		order.setUserId(user.getUserId());
		order.setOrderAddress(address);
		order.setOrderPostalfee(Float.parseFloat(orderPostalfee));
		System.out.println("session"+session.getAttribute("goodsId").toString());
		List<OrderDetail> orderDetails=new ArrayList<OrderDetail>();
		for(int j=0;j<((String[])session.getAttribute("goodsId")).length;j++){
			OrderDetail od=new OrderDetail();
			
			od.setGoodsId(Integer.parseInt(((String[])session.getAttribute("goodsId"))[j]));
			od.setOdetailName(((String[])session.getAttribute("goodsName"))[j]);
			od.setOdetailPrice(Float.parseFloat(((String[])session.getAttribute("goodsDiscount"))[j]));
			od.setOdetailSize(((String[])session.getAttribute("size"))[j]);
			od.setOdetailColor(((String[])session.getAttribute("color"))[j]);
			od.setOdetailNum(Integer.parseInt(((String[])session.getAttribute("num"))[j]));
			od.setOdetailPic(((String[])session.getAttribute("pic"))[j]);
			
			od.setOdetailPic(od.getOdetailPic().substring(7));
			orderDetails.add(od);
		}
		System.out.println(orderDetails);
		try{
			
			int orderId=orderService.addOrder(order,orderDetails);
			System.out.println("-------------"+order.getOrderId());
			m.put("orderId",orderId+"");
			return "/order/addOrder";
		}
		catch(Exception e){
			e.printStackTrace();
			System.out.println("提交订单失败");
			return EXECUTE_RESULT;
		}
	}
	
	@RequestMapping("/pay")
	public String pay(String orderId){
		try{
			
			return "/order/pay";
		}
		catch(Exception e){
			e.printStackTrace();
			return EXECUTE_RESULT;
		}
	}
	
	@RequestMapping("/payForOrder")
	public String payForOrder(String orderId,Model m){
		try{
			orderService.changeOrderStatus(orderId,Constants.ORDER_PAID);
			m.addAttribute("orderId",orderId);
			return "forward:/order/getMyOrders";
		}
		catch(Exception e){
			e.printStackTrace();
			return EXECUTE_RESULT;
		}
	}
	
	@RequestMapping("/getMyOrders")
	public String getMyOrders(@RequestParam(required=false) String status,Model m,HttpSession session){
		System.out.println("-----------"+status);
		User user = (User) session.getAttribute(Constants.LOGIN_USER);
		List<Order> orders=orderService.getMyOrders(user.getUserId(),status);
		m.addAttribute("orders", orders);
		return "/order/orderList";
	}
	
	@RequestMapping("getOrderDetailById")
	public String getOrderDetailById(Model model,int orderId) {
		float sum = 0;
		Order order = orderService.findOrderById(orderId);
		model.addAttribute("order",order);
		List<OrderDetail> orderDetails = orderService.findOrderDetailByid(orderId);
		model.addAttribute("oDetail",orderDetails);
		for (OrderDetail orderDetail : orderDetails) {
			sum+=orderDetail.getOdetailNum()*orderDetail.getOdetailPrice();
		}
		model.addAttribute("sum", sum);
		return "/order/orderDetail";
		
	}
	
	@ResponseBody
	@RequestMapping("/handleOrderStatus")
	public Map<String,String> handleOrderStatus(String orderId,int status){
		Map<String,String> m=new HashMap<String,String>();
		try{
			boolean flag=false;
			int curStatus=orderService.getOrderStatusById(orderId);
			switch(status){
			case 2://申请退款
				if(curStatus==Constants.ORDER_PAID)		flag=true;
				break;
			case 5://确认收货
				if(curStatus==Constants.ORDER_SENDING)	flag=true;
				break;
			case 6://申请退货
				if(curStatus==Constants.ORDER_SENDING)	flag=true;
				break;
			case 9://取消订单
				if(curStatus==Constants.ORDER_WAITING)	flag=true;
				break;
			default:
				flag=false;
			}		
			if(flag){
				orderService.changeOrderStatus(orderId,status);
				m.put("handle", "success");
			}else{
				m.put("handle", "failure");
			}
		}
		catch(Exception e){
			e.printStackTrace();		
			m.put("handle", "exception");
		}
		return m;
	}
	
	@RequestMapping("delOrder")
	public String delOrder(@RequestParam(required=false) String status,int orderId, HttpSession session,Model model) {
		
		boolean delDetail = orderService.delOrderDetail(orderId);
		
		if (delDetail) {
			boolean delOrder = orderService.delOrderByOrderId(orderId);
			if (delOrder) {
				User user = (User) session.getAttribute(Constants.LOGIN_USER);
				List<Order> orders=orderService.getMyOrders(user.getUserId(),status);
				model.addAttribute("orders", orders);
				
			}
		}
		return "/order/orderList";

		
	}
	
}
