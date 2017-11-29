package cn.tedu.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;

import cn.tedu.pojo.Order;
import cn.tedu.pojo.OrderInfo;

public interface OrderMapper {
	public List<Order> findAll();
	
	@Select("INSERT INTO `order_info` (order_id,pet_id,product_id,pet_buyNum,product_buyNum) VALUES (#{orderid},#{petid},#{productid},#{petbuynum},#{productbuynum})")
	public void addOrderInfo(OrderInfo info);
	@Insert("insert into `order`(order_time,money,paystate,order_address,info,order_id,user_id) values(#{ordertime},#{money},#{paystate},#{orderaddress},#{info},#{orderid},#{userid})")
	public void addOrder(Order orderO);
	@Select("select * from `order` where user_id=#{userid}")
	public List<Order> findOrderIdsByUid(String userid);
	@Select("select * from order_info where order_id=#{orderid}")
	public List<OrderInfo> findOrderInfoByoid(String orderid);
	@Select("select * from `order` where order_id=#{id}")
	public Order findOrderIdByOid(String id);
	@Delete("delete from `order_info` where order_id=#{id}")
	public void deleteOinfoByOid(String id);
	@Delete("delete from `order` where order_id=#{id}")
	public void deleteOrderByOid(String id);
}
