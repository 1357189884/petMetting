package cn.tedu.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import cn.tedu.mapper.PetShowMapper;
import cn.tedu.pojo.PetShow;


@Service
public class PetShowServiceImpl implements PetShowService {
	
	@Autowired
	private PetShowMapper petShowMapper;
	
	@Override
	public List<PetShow> findAll() {
		return petShowMapper.findAll();
	}

	@Override
	public PetShow findById(String id) {
		return petShowMapper.findById(id);
	}

	@Override
	public void insert(PetShow petShow) {
		petShowMapper.insert(petShow);
	}
	
}
