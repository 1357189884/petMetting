package cn.tedu.service;

import java.util.List;

import cn.tedu.pojo.Product1;


public interface BackProdService {

	List<Product1> findAll();

	Product1 findOne(String productId);

	void add(Product1 prod);

	void removes(String[] ids);

	void update(Product1 prod);

	String findone(Product1 prod);




}
