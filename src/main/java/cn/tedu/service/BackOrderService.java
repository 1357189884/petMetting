package cn.tedu.service;

import java.util.List;

import cn.tedu.pojo.Order;
import cn.tedu.pojo.Pet;
import cn.tedu.pojo.Product;

public interface BackOrderService {

	List<Order> findAllOrderUser(Integer startPos,Integer pageSize);

	List<Pet> findAllPet(String orderId);

	List<Product> findAllProd(String orderId);

	Order findOrder(String orderId);

	List<Order> findOrderById(String[] orderIds);
	
	long getOrderCount(); 
}
