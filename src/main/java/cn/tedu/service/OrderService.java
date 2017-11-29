package cn.tedu.service;

import java.util.List;
import java.util.Map;

import cn.tedu.pojo.Order;
import cn.tedu.pojo.OrderInfo;
import cn.tedu.pojo.OrderInfoAll;

public interface OrderService {

	public void add(Order order, List<OrderInfo> oList) throws Exception;

	public List<OrderInfoAll> findOrderInfoByUid(String userid);

	public void deleteByoId(String id) throws Exception;

}
