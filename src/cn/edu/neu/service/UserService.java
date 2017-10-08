package cn.edu.neu.service;

import cn.edu.neu.core.common.Page;

import cn.edu.neu.model.User;


public interface UserService {
	
	User checkUser(User user);
	boolean regUser(User user);
	User checkUserName(String userName);
	User checkAdmin(User user);
	boolean updateUser(User user);
	User findUserById(int userId);
	boolean updatePass(String userPass, int userId);
	User selectUserPass(User user);
	User getUser(String userName);
}
