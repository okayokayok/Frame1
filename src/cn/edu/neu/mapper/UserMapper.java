package cn.edu.neu.mapper;

import java.util.List;

import cn.edu.neu.core.common.Page;
import cn.edu.neu.model.User;

public interface UserMapper {

	void save(User user);
	boolean update(User user);
	boolean delete(int id);
	User findUserById(int userId);
	List<User> findAll(Page<User> p);
	User checkUser(User user);
	boolean regUser(User user);
	User checkUserName(String user);
	User checkAdmin(User user);
	boolean updatePass(String userPass, int userId);
	User selectUserPassByUser(User user);
	User findUser(String userName);
}
