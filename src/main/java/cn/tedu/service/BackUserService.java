package cn.tedu.service;

import java.util.List;

import cn.tedu.pojo.User;

public interface BackUserService {

	List<User> findAll();

	User findOne(String userId);

	void add(User user);

	void removes(String[] ids);

	void update(User user);

	void changeState(int i, String[] ids);

}
