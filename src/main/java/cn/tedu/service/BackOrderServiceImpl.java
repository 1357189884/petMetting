package cn.tedu.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import cn.tedu.mapper.BackOrderMapper;
import cn.tedu.pojo.Order;
import cn.tedu.pojo.Pet;
import cn.tedu.pojo.Product;
import cn.tedu.pojo.User;
@Service
public class BackOrderServiceImpl implements BackOrderService{
	@Autowired
	private BackOrderMapper backOrderMapper;
	@Override
	public List<Order> findAllOrderUser(Integer startPos,Integer pageSize) {
		
		return backOrderMapper.findAllOrderUser(startPos,pageSize);
	}
	@Override
	public List<Pet> findAllPet(String orderId) {
		// TODO Auto-generated method stub
		return backOrderMapper.findAllPet();
	}
	@Override
	public List<Product> findAllProd(String orderId) {
		// TODO Auto-generated method stub
		return backOrderMapper.findAllProd(orderId);
	}
	@Override
	public Order findOrder(String orderId) {
		// TODO Auto-generated method stub
		return backOrderMapper.findOrder(orderId);
	}
	@Override
	public List<Order> findOrderById(String[] orderIds) {
		
		return backOrderMapper.findOrderById(orderIds);
	}
	@Override
	public long getOrderCount() {
		
		return backOrderMapper.getOrderCount();
	}

}
