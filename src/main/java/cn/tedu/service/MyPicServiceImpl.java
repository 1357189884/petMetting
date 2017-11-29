package cn.tedu.service;

import java.util.Date;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import cn.tedu.mapper.MyPicMapper;
import cn.tedu.pojo.PetShow;

@Service
public class MyPicServiceImpl implements MyPicService{
	
	@Autowired
	private MyPicMapper myPicMapper;
	
	@Override
	public void insertImgUrl(PetShow petShow) throws Exception {
		//因为是第一次访问
		petShow.setId(UUID.randomUUID().toString());
		petShow.setTimes(0);
		petShow.setCreateTime(new Date());
		petShow.setUserId(UUID.randomUUID().toString());
		System.out.println(petShow);
		
		myPicMapper.insertImgUrl(petShow);
	}
	
	
}
