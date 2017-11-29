package cn.tedu.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import cn.tedu.pojo.Order;
import cn.tedu.pojo.Pet;
import cn.tedu.pojo.Product;

public interface BackOrderMapper {

	List<Order> findAllOrderUser(@Param("startPos")Integer startPos,@Param("pageSize") Integer pageSize);

	long getProductsCount(); 
	
	List<Pet> findAllPet();

	List<Product> findAllProd(String orderId);

	Order findOrder(String orderId);

	List<Order> findOrderById(@Param("orderIds")String[] orderIds);

	long getOrderCount();
	
}
