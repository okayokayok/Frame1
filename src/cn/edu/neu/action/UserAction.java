package cn.edu.neu.action;

import java.io.IOException;
import java.io.PrintWriter;
import java.nio.channels.ScatteringByteChannel;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.reflection.wrapper.BaseWrapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import cn.edu.neu.core.Constants;
import cn.edu.neu.core.common.Page;
import cn.edu.neu.model.User;
import cn.edu.neu.service.UserService;

@Controller
@RequestMapping("/user")
public class UserAction extends BaseAction{

	@Autowired
	private UserService userService; 
	
	/**
	 * 用户登录
	 */
	@ResponseBody
	@RequestMapping("/login")
	public Map<String,String> login(User user,HttpSession session){
		System.out.println("userlogin:"+user);
		User dbUser=userService.checkUser(user);
		//System.out.println(user.getUserName()+","+user.getPassword()+"--------"+user1);
		Map<String,String> m=new HashMap<String,String>();
		if(dbUser!=null){		
			session.setAttribute(Constants.LOGIN_USER, dbUser);
			m.put("login", "yes");	
		}
		else{
			//this.addMessage(Constants.LOGIN_ERR);
			//this.addRedirURL("返回登录页面", INDEX_PAGE);
			m.put("login","no");	
		}
		return m; 
	}
	
	/**
	 * 用户登出
	 */
	@ResponseBody
	@RequestMapping("/logout")
	public Map<String,String> logout() throws Exception {
		getSession().invalidate();
		Map<String,String> m=new HashMap<String,String>();
		m.put("logout", "yes");
		return m;
	}
	
	/**
	 * 用户注册
	 */
	@ResponseBody
	@RequestMapping("/reg")
	public Map<String,String> reg(User user) throws Exception {	
		Map<String,String> map= new HashMap<>();
		boolean result=userService.regUser(user);
		if (result) {
			map.put("reg", "yes");
		}else {
			map.put("reg", "no");
		}
		return map;
	}
	
	/**
	 * 检查用户是否重复
	 */
	@ResponseBody
	@RequestMapping("/checkUserName")
	public Map<String,Boolean> checkUserName(String userName) throws Exception {
		Map<String,Boolean> map = new HashMap<>();
		System.out.println("username="+userName);
		User user=userService.checkUserName(userName);
		if (user == null) {
			map.put("available", true);
		}else{
			map.put("available", false);
		}
		
		return map;
	}
	
	/**
	 * 获取所有用户列表
	 * @param request
	 * @return
	 */
	@RequestMapping("/getAllUsers")
	public String getAllUsers(HttpServletRequest request){
		
		return "";
	}
	

	
	/**
	 * 管理员登录
	 */
	@ResponseBody
	@RequestMapping("/adminlogin")
	public Map<String,String> adminlogin(User user,HttpSession session){
		System.out.println("--------"+user);
		User dbUser=userService.checkAdmin(user);
		//System.out.println(user.getUserName()+","+user.getPassword()+"--------"+user1);
		Map<String,String> m=new HashMap<String,String>();
		if(dbUser!=null){		
			session.setAttribute(Constants.LOGIN_USER, dbUser);
			m.put("login", "yes");	
		}
		else{
			//this.addMessage(Constants.LOGIN_ERR);
			//this.addRedirURL("返回登录页面", INDEX_PAGE);
			m.put("login","no");	
		}
		return m; 
	}
	
	@RequestMapping("userInfo")
	public String userInfo(HttpSession session,Model model) {
		User user = (User) session.getAttribute(Constants.LOGIN_USER);
		User userInfo=userService.findUserById(user.getUserId());
		model.addAttribute("user", userInfo);
		return "/usercenter/userInfo";
		
	}
	
	@RequestMapping(value="updateUser",method=RequestMethod.POST)
	public String updateUser(User user,HttpSession session){
		
		boolean result = userService.updateUser(user);
		
		return "/usercenter/index";
		
	}
	
	@RequestMapping("checkPassword")
	@ResponseBody
	public Map<String, String> checkPass(HttpSession session,String userPass){
		System.out.println("1234567890-----"+userPass);
		Map<String, String> map = new HashMap<String,String>();
		User user = (User) session.getAttribute(Constants.LOGIN_USER);
		User userInfo=userService.findUserById(user.getUserId());
		if (userPass.equals(userInfo.getUserPass())) {
			map.put("result", "yes");
		}else {
			map.put("result", "no");
		}
		return map;
		
	}
	
	@RequestMapping("updatePassword")
	public String userPassword(HttpSession session,Model model,String userPass) {
		User user = (User) session.getAttribute(Constants.LOGIN_USER);
		System.out.println(userPass);
		boolean result = userService.updatePass(userPass,user.getUserId());
		
		return "/usercenter/index";
		
	}

}
