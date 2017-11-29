package cn.tedu.service;

import cn.tedu.pojo.User;

public interface UserService {

	User login(String username, String password);


	User find(String username);
	/**
	 * 注册用户
	 * @param user 将数据封装到user对象中
	 */
	public void saveUser(User user);

}
