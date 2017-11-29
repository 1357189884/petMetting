package cn.tedu.controller;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import cn.tedu.pojo.Pet;
import cn.tedu.pojo.Order;
import cn.tedu.pojo.OrderInfo;
import cn.tedu.pojo.OrderInfoAll;
import cn.tedu.pojo.ProductO;
import cn.tedu.pojo.User;
import cn.tedu.service.OrderService;

@Controller
public class OrderController {

	@Autowired
	private OrderService orderservice;
	private Order order;

	@RequestMapping("/insert")
	public String insert(HttpSession session, Model model) throws Exception {
		 
		 Object userObject=session.getAttribute("_CURRENT_USER");
		 if (userObject==null) {
		 model.addAttribute("msg", "添加订单请先登录");
		 return "redirect:index.jsp";
		 }
		// 从session中获取cart 判断是否为null
		Object cartObject = session.getAttribute("petcart");

		Object productcartObject = session.getAttribute("productcart");

		order = new Order();
		order.setOrderId(UUID.randomUUID().toString());
		order.setOrdertime(new Date());
		order.setPaystate(0);
		order.setInfo("receiverinfo");
		order.setUserId("1");
		// ((User)userObject).getUserid()
		double money = 0;
		// 定义集合List<OrderItem>，保存订单项目对象的集合
		List<OrderInfo> oList = new ArrayList<OrderInfo>();
		Map<Pet, Integer> cartMap=null;
		if (cartObject != null) {

			 cartMap = (Map<Pet, Integer>) cartObject;
			for (Map.Entry<Pet, Integer> entry : cartMap.entrySet()) {
				OrderInfo item = new OrderInfo();
				item.setOrderid(order.getOrderId());
				item.setPetid(entry.getKey().getPetId());
				item.setPetbuynum(entry.getValue());
				// 计算money=money+小计(单价+数量)
				int money1 = entry.getKey().getPrice();
				money += money1 * entry.getValue();

				// 将item添加到list中
				oList.add(item);
			}
		}
		Map<ProductO, Integer> procartMap =null;
		if (productcartObject != null) {

			procartMap = (Map<ProductO, Integer>) productcartObject;
			for (Map.Entry<ProductO, Integer> entry : procartMap.entrySet()) {
				OrderInfo item = new OrderInfo();
				item.setOrderid(order.getOrderId());
				item.setProductid(entry.getKey().getProductid());
				item.setProductbuynum(entry.getValue());
				// 计算money=money+小计(单价+数量)
				int money1 = Integer.parseInt(entry.getKey().getPrice());
				money += money1 * entry.getValue();
				// 将item添加到list中
				oList.add(item);
			}
		}
		order.setOrderMoney(money);
		try{
			orderservice.add(order, oList);
		}catch(Exception e){
			model.addAttribute("msg", e.getMessage());
			return "redirect:index.jsp";
		}
		
		if (procartMap != null){
			procartMap.clear();
		}
		if(cartMap!=null){
			cartMap.clear();
		}
		
		
		return "redirect:toView.action";
	}

	@RequestMapping("/toView")
	public String toView(HttpSession session, Model model) {
		 Object userobj=session.getAttribute("_CURRENT_USER");
		 if(userobj==null){
		 //从未登陆
			 return "redirect:index.jsp";
		 }
		 //2获取登录的用户id
		 String userid=((User)userobj).getUserId();
	/*	String userid = "1";*/
		List<OrderInfoAll> list = orderservice.findOrderInfoByUid(userid);

		model.addAttribute("list", list);
		return "order/order_list";
	}

	@RequestMapping("/deleteding")
	public String delete(HttpSession session, String id,Model model) throws Exception {
		try{
			orderservice.deleteByoId(id);
		}catch(Exception e){
			model.addAttribute("msg", e.getMessage());
			return "redirect:toView.action";
		}
		return "redirect:toView.action";
	}
}
