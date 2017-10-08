package cn.edu.neu.service.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import cn.edu.neu.core.common.Page;
import cn.edu.neu.mapper.UserMapper;
import cn.edu.neu.model.User;
import cn.edu.neu.service.UserService;



@Service
@Transactional  //此处不再进行创建SqlSession和提交事务，都已交由spring去管理了。
public class UserServiceImpl implements UserService {
	
	@Resource
	private UserMapper mapper;


	@Override
	public User checkUser(User user) {
		// TODO Auto-generated method stub
		return mapper.checkUser(user);
	}
	
	@Override
	public boolean regUser(User user) {
		// TODO Auto-generated method stub
		try{
			mapper.regUser(user);
			return true;
		}catch(Exception e){
			e.printStackTrace();
			return false;
		}
		
	}

	@Override
	public User checkUserName(String userName) {
		// TODO Auto-generated method stub
		return mapper.checkUserName(userName);
	}

	@Override
	public User checkAdmin(User user) {
		// TODO Auto-generated method stub
		return mapper.checkAdmin(user);
	}

	@Override
	public boolean updateUser(User user) {
		// TODO Auto-generated method stub
		
		return mapper.update(user);
	}

	@Override
	public User findUserById(int userId) {
		// TODO Auto-generated method stub
		return mapper.findUserById(userId);
	}

	@Override
	public boolean updatePass(String userPass, int userId) {
		// TODO Auto-generated method stub
		return mapper.updatePass(userPass,userId);
	}

	@Override
	public User selectUserPass(User user) {
		// TODO Auto-generated method stub
		return mapper.selectUserPassByUser(user);
	}

	@Override
	public User getUser(String userName) {
		// TODO Auto-generated method stub
		return mapper.findUser(userName);
	}







}
