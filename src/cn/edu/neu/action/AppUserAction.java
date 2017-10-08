package cn.edu.neu.action;

import java.util.HashMap;
import java.util.Map;
import cn.edu.neu.*;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import cn.edu.neu.core.Constants;
import cn.edu.neu.core.util.Md5Util;
import cn.edu.neu.model.User;
import cn.edu.neu.service.UserService;

@Controller
@RequestMapping("/appuser")
public class AppUserAction extends BaseAction {
	
	@Autowired
	private UserService userService;
	
	@ResponseBody
	@RequestMapping("/login")
	public Map<String,String> login(User user,HttpSession session){
		User dbUser=userService.checkUser(user);//
		Map<String,String> m = new HashMap<String,String>();
		if(dbUser==null){//非法
			m.put("loginFlag","0");
			m.put("msg","用户名或密码错误");
		}else{//合法
			session.setAttribute(Constants.LOGIN_USER,dbUser);
			m.put("loginFlag", "1");
			m.put("msg", "");
		}
		return m;
		
	}
	@ResponseBody
	@RequestMapping("/logout")
	public Map<String,String> logout(HttpSession session){
		session.invalidate();
		Map<String,String> m = new HashMap<String,String>();
		m.put("logoutFlag", "1");
		return m;
		
	}
	
	@ResponseBody
	@RequestMapping("/reg")
	public Map<String,String> reg(User user) {
		Map<String,String> map= new HashMap<>();
		boolean result=userService.regUser(user);
		if (result) {
			map.put("regFlag", "1");
			map.put("msg", "");
		}else {
			map.put("regFlag","0");
			map.put("msg", "注册失败");
		}
		return map;
	}
	
//	@ResponseBody
//	@RequestMapping("/autologin")
//	public Map<String,String> autologin(User user,HttpSession session){
//		User dbUser=userService.selectUserPass(user);//
//		Map<String,String> m = new HashMap<String,String>();
//		if(MD5(userName+','+MD5(userPass))){
//			m.put("loginFlag", "1");
//			m.put("msg", "");
//		
//		}else{
//			session.setAttribute(Constants.LOGIN_USER,dbUser);
//			m.put("loginFlag","0");
//			m.put("msg","用户名或密码错误");
//		}
//		return m;
//		
//	}
	
	@ResponseBody
	@RequestMapping("/autoLogin")
	public Map<String,String> autoLogin(String userName,String authority,HttpSession session) throws Exception {
		System.out.println("autoLogin");
		User user=userService.getUser(userName);
		Map<String,String> m=new HashMap<String,String>();
		if(user!=null){
		String serverAuth=Md5Util.getMD5Str(userName+","+Md5Util.getMD5Str(user.getUserPass()));
		//Map<String,String> m=new HashMap<String,String>();
		if(authority.equals(serverAuth)){//自动登录成功
			session.setAttribute(Constants.LOGIN_USER, user);
			m.put("autoLoginFlag", "1");
			m.put("msg", "");
		}
		else{//自动登录失败
			m.put("autoLoginFlag","0");
			m.put("msg", "登录失败");
		}
		}else{
			m.put("autoLoginFlag","0");
			m.put("msg", "登录失败");
		}
		return m;
	}

	
		
} 
	
