package cn.tedu.service;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import cn.tedu.mapper.UserMapper;
import cn.tedu.pojo.User;
import cn.tedu.service.UserService;
@Service
public class UserServiceImpl implements UserService {

	@Autowired
	private UserMapper userMapper;
	@Override
	public User login(String username, String password) {
		return userMapper.login(username,password);
	}
	@Override
	public User find(String username) {
		return userMapper.find(username);
	}
	/**
	 * 保存user信息到数据库中
	 */
	@Override
	public void saveUser(User user) {
		userMapper.saveUser(user);
	}

}
