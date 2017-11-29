package cn.tedu.controller;

import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.util.ArrayList;
import java.util.List;

import javax.swing.JOptionPane;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import cn.tedu.pojo.Order;
import cn.tedu.pojo.OrderRet;
import cn.tedu.pojo.Pet;
import cn.tedu.pojo.Product;
import cn.tedu.service.BackOrderService;
import cn.tedu.utils.ExportExcel;
import cn.tedu.utils.Page;

@Controller
@RequestMapping("/front_desk/")
public class BackOrderController {
	@Autowired
	private BackOrderService backOrderService;
	@RequestMapping("backList.action")
	public String backOrderAction(String pageNow,Model model){
		Page page=null;
		int orderCount =(int)backOrderService.getOrderCount();
		 List<Order> orders=new ArrayList<Order>();
		 if (pageNow != null) {  
		        page = new Page(orderCount, Integer.parseInt(pageNow));  
		         orders = backOrderService.findAllOrderUser(page.getStartPos(),  page.getPageSize());
		    } else {  
		        page = new Page(orderCount, 1);  
		         orders = backOrderService.findAllOrderUser(page.getStartPos(),  page.getPageSize());
		    }  
		model.addAttribute("orderUsers", orders);
		model.addAttribute("page", page);
		return "front_desk/order/orderlist";
	}
	@RequestMapping("toviewOrderAndProPet")
	public String toviewOrderAndProPet(String orderId,Model model){
		if(orderId!=null&&!orderId.equals("")){
			Order order=backOrderService.findOrder(orderId);
			List<Pet> pets=backOrderService.findAllPet(orderId);
			List<Product> products=backOrderService.findAllProd(orderId);
			model.addAttribute("order", order);
			model.addAttribute("pets", pets);
			model.addAttribute("products", products);
		}
		return "front_desk/order/orderView";
	}
	
	@RequestMapping("toreport")
	public String reportAction(@RequestParam(value="orderId",required=false)String [] orderIds){
		ExportExcel<OrderRet> ex=new ExportExcel<OrderRet>();
		List<String> headers=new ArrayList<String>();
		headers.add("用户名");
		headers.add("真实姓名");
		headers.add("地址");
		headers.add("下单时间");
		headers.add("金额");
		headers.add("收货地址");
		List<Order> orders = backOrderService.findOrderById(orderIds);
		//创建打印目录的实体类
		List<OrderRet> dataset=new ArrayList<OrderRet>();
		for (Order ord : orders) {
			OrderRet orderRetp=new OrderRet();
			orderRetp.setUsername(ord.getUser().getUsername());
			orderRetp.setName(ord.getUser().getName());
			orderRetp.setAddress(ord.getUser().getAddress());
			orderRetp.setOrdertime(ord.getOrdertime());
			orderRetp.setMoney(ord.getOrderMoney());
			orderRetp.setOrderAddress(ord.getOrderAddress());
			dataset.add(orderRetp);
		}
		try {
			OutputStream out= new FileOutputStream("D://报表.xls");
			ex.exportExcel(headers, dataset, out);
	        out.close();  
	        JOptionPane.showMessageDialog(null, "导出成功!");  
            System.out.println("excel导出成功！");
		} catch (FileNotFoundException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}  
		return "redirect:/front_desk/backList.action";
	}
}
