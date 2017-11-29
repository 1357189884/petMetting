package cn.tedu.service;

import java.util.List;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import cn.tedu.mapper.BackProdMapper;
import cn.tedu.pojo.Product1;
@Service
public class BackProdServiceImpl implements BackProdService {
	@Autowired
	private BackProdMapper mapper;

	@Override
	public List<Product1> findAll() {
		// TODO Auto-generated method stub
		return mapper.findAll();
	}

	@Override
	public Product1 findOne(String productId) {
		// TODO Auto-generated method stub
		return mapper.findOne(productId);
	}

	@Override
	public void add(Product1 prod) {
		// TODO Auto-generated method stub
		String id=UUID.randomUUID().toString();
		prod.setProductId(id);
		mapper.add(prod);
	}

	@Override
	public void removes(String[] ids) {
		mapper.removes(ids);
		// TODO Auto-generated method stub
		
	}

	@Override
	public void update(Product1 prod) {
		mapper.updat(prod);
		
	}

	@Override
	public String findone(Product1 prod) {
		// TODO Auto-generated method stub
		return mapper.findone(prod);
	}

	


}
