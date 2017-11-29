package cn.tedu.service;

import java.util.List;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import cn.tedu.mapper.BackUserMapper;
import cn.tedu.pojo.User;

@Service
public class BackUserServiceImpl implements BackUserService{
	@Autowired
	private BackUserMapper mapper;
	
	@Override
	public List<User> findAll() {
		// TODO Auto-generated method stub
		return mapper.findAll();
	}


	@Override
	public void add(User user) {
		String userId = UUID.randomUUID().toString();
		user.setUserId(userId);
		mapper.add(user);
		
		
	}

	@Override
	public void removes(String[] ids) {
		mapper.remove(ids);
	}

	@Override
	public void update(User user) {
		mapper.updat(user);
		
		
	}

	@Override
	public void changeState(int i, String[] ids) {
		 mapper.changeState(i,ids);
	}


	@Override
	public User findOne(String userId) {
		// TODO Auto-generated method stub
		return mapper.findOne(userId);
	}

}
