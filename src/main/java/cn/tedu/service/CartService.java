package cn.tedu.service;

import java.util.Map;

import cn.tedu.pojo.Pet;
import cn.tedu.pojo.ProductO;

public interface CartService {

	public Pet findById(String id);

	public void save(Map<Pet, Integer> cart);

	public ProductO findpById(String id);

}
