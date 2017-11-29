package cn.tedu.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import cn.tedu.mapper.OrderMapper;
import cn.tedu.mapper.PetMapper;
import cn.tedu.mapper.ProductMapper;
import cn.tedu.pojo.Order;
import cn.tedu.pojo.OrderInfo;
import cn.tedu.pojo.OrderInfoAll;
import cn.tedu.pojo.Pet;
import cn.tedu.pojo.ProductO;
@Service
public class OrderServiceImpl implements OrderService {
	
	@Autowired
	OrderMapper ordermapper;
	@Autowired
	PetMapper petmapper;
	@Autowired
	ProductMapper productmapper;
	@Override
	public void add(Order order, List<OrderInfo> oList) throws Exception {
		ordermapper.addOrder(order);
		for(OrderInfo info: oList){
			if(info.getPetid()!=null){
				Pet petO=petmapper.findById(info.getPetid());
				if(petO.getNum()<info.getPetbuynum()){
					/*throw new Exception("数量不足");*/
					throw new Exception("数量不足");
				}else{
					Integer num=petO.getNum()
							-info.getPetbuynum();
					petmapper.changeNum(petO.getPetId(),num);
				}
				ordermapper.addOrderInfo(info);
			}else{
				ProductO productO=productmapper.findById(info.getProductid());
				if(productO.getNum()<info.getProductbuynum()){
					throw new Exception("数量不足");
				}else{
					productmapper.changeNum(productO.getProductid(),productO.getNum()
							-info.getProductbuynum());
				}
				ordermapper.addOrderInfo(info);
			}
		}
	}
	@Override
	public List<OrderInfoAll> findOrderInfoByUid(String userid) {
		List<OrderInfoAll> resultList=new ArrayList<OrderInfoAll>();
		
		List<Order> list=ordermapper.findOrderIdsByUid(userid);
		
		for(Order orderO : list){
			List<OrderInfo> listo=ordermapper.findOrderInfoByoid(orderO.getOrderId());
			OrderInfoAll info=new OrderInfoAll();
			info.setOrder(orderO);
			Map<Pet, Integer> petorderitem=new HashMap<Pet,Integer>();
			Map<ProductO, Integer> orderitem=new HashMap<ProductO,Integer>();
			for(OrderInfo oinfo : listo){
				if(oinfo.getPetid()!=null){
					Pet petO=petmapper.findById(oinfo.getPetid());
					petorderitem.put(petO, oinfo.getPetbuynum());
				}else{
					ProductO productO=productmapper.findById(oinfo.getProductid());
					orderitem.put(productO, oinfo.getProductbuynum());
				}
			}
			info.setPetorderitem(petorderitem);
			info.setOrderitem(orderitem);
			resultList.add(info);
		}
		
		return resultList;
	}
	@Override
	public void deleteByoId(String id) throws Exception {
		
		Order orderO=ordermapper.findOrderIdByOid(id);
		if(orderO==null){
			throw new Exception("该订单不存在，不需要再次删除");
		}
		List<OrderInfo> info=ordermapper.findOrderInfoByoid(id);
		for(OrderInfo oinfo : info){
			if(oinfo.getPetid()!=null){
				Pet petO=petmapper.findById(oinfo.getPetid());
				petmapper.changeNum(oinfo.getPetid(),oinfo.getPetbuynum()+petO.getNum());
			}else{
				ProductO productO=productmapper.findById(oinfo.getProductid());
				productmapper.changeNum(oinfo.getProductid(), oinfo.getProductbuynum()+productO.getNum());
			}
		}
		ordermapper.deleteOinfoByOid(id);
		ordermapper.deleteOrderByOid(id);
	}
}
