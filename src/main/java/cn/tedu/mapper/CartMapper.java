package cn.tedu.mapper;

import java.util.Map;

import org.apache.ibatis.annotations.Param;

import cn.tedu.pojo.Pet;
import cn.tedu.pojo.ProductO;

public interface CartMapper {
	
	public Pet findById(String id);

	public void save(@Param("keys")Map<Pet, Integer> cart);

	public ProductO findpById(String id);
}
