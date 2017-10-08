package cn.edu.neu.action;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import cn.edu.neu.core.Constants;
import cn.edu.neu.model.Order;
import cn.edu.neu.model.User;
import cn.edu.neu.service.OrderService;

@RequestMapping("/apporder")
@Controller
public class AppOrderAction extends BaseAction{

	@Autowired
	OrderService orderService;
	
	@ResponseBody
	@RequestMapping("/getMyOrders")
	public Map<String,List<Order>> getMyOrders(@RequestParam(required=false) String status){
		System.out.println("-----------"+status);
		List<Order> orders=orderService.getMyOrders(this.getLoginUserId(),status);
		Map<String,List<Order>> m=new HashMap<String,List<Order>>();
		m.put("ordersList", orders);
		System.out.println("orderlist:"+orders);
		return m;
	}

}
