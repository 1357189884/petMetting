package cn.tedu.service;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import cn.tedu.mapper.CartMapper;
import cn.tedu.pojo.Pet;
import cn.tedu.pojo.ProductO;
@Service
public class CartServiceImpl implements CartService {
	@Autowired
	private CartMapper cartMapper;
	@Override
	public Pet findById(String id) {
		return cartMapper.findById(id);
		
	}
	@Override
	public void save(Map<Pet, Integer> cart) {
		cartMapper.save(cart);
		
	}
	@Override
	public ProductO findpById(String id) {
		return cartMapper.findpById(id);
	}

}
