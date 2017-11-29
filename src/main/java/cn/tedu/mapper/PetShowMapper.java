package cn.tedu.mapper;

import java.util.List;

import cn.tedu.pojo.PetShow;

public interface PetShowMapper {

	public List<PetShow> findAll();

	public PetShow findById(String id);

	public void insert(PetShow petShow);
	
}
