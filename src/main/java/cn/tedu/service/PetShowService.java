package cn.tedu.service;

import java.util.List;

import cn.tedu.pojo.PetShow;

public interface PetShowService {
	
	/**
	 * 从pet_show中查询所有
	 */
	public List<PetShow> findAll();
	/**
	 * 查找一条数据
	 * @param id
	 * @return
	 */
	public PetShow findById(String id);
	/**
	 * 插入
	 * @param petShow
	 */
	public void insert(PetShow petShow);
	
	
}
