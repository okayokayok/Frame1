package cn.edu.neu.action;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import cn.edu.neu.core.Constants;
import cn.edu.neu.model.Address;
import cn.edu.neu.model.User;
import cn.edu.neu.service.AddressService;

@Controller
@RequestMapping("/address")
public class AddressAction {
	
	@Autowired
	AddressService addressService;
	
	@RequestMapping("getMyAddress")
	public String getMyAddress(HttpSession session,Model model) {
		User user = (User) session.getAttribute(Constants.LOGIN_USER);
		System.out.println(user.toString());
		List<Address> addresses = addressService.findAddressByUserId(user.getUserId());
		
		System.out.println(addresses.toString());
		model.addAttribute("addressList",addresses);
		return "/address/addressManagement";
		
	}
	@RequestMapping("getAddressById")
	@ResponseBody
	public Map<String, Object> getAddressById(int addrId) {
		Map<String, Object> map =new HashMap<String, Object>();
		System.out.println("id--------"+addrId);
		map.put("addr", addressService.findAddrById(addrId));
		return map;
		
	}
	@RequestMapping("delAddress")
	public String delAddress(int addrId,HttpSession session,Model model) {
		
		boolean success = addressService.delAddress(addrId);
		
		User user = (User) session.getAttribute(Constants.LOGIN_USER);
		System.out.println(user.toString());
		List<Address> addresses = addressService.findAddressByUserId(user.getUserId());
		
		System.out.println(addresses.toString());
		model.addAttribute("addressList",addresses);
		return "/address/addressManagement";
	}
	
	
	@RequestMapping("setDefaultAddress")
	@ResponseBody
	public Map<String, String> setDefaultAddress(HttpSession session, int addrId){
		Map<String, String> map = new HashMap<String, String>();
		User user = (User) session.getAttribute(Constants.LOGIN_USER);
		int result = addressService.setDefaultAddress(user.getUserId(),addrId);
		
		if (result!=0) {
			map.put("setDefault", "success");
			map.put("addrId",String.valueOf(result));
		}else {
			map.put("setDefault", "false");
		}
		
		return map;
	}
	
	@RequestMapping("handleAddress")
	public String handleAddress(HttpSession session,Model model,Address address) {
		User user = (User) session.getAttribute(Constants.LOGIN_USER);
		address.setUserId(user.getUserId());
		System.out.println(address.toString());
		addressService.addAddress(address);
		List<Address> addresses = addressService.findAddressByUserId(user.getUserId());
		
		System.out.println(addresses.toString());
		model.addAttribute("addressList",addresses);
		return "/address/addressManagement";
	}
}
