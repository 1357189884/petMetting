package cn.tedu.controller;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;


@Controller
public class HomeController {
	
	@RequestMapping("/home")
	public String home(Model model) {
		return "home/index";
	}
	
	@RequestMapping("/prodList")
	public String prodList() {
		
		return "order/orderList";
	}
	
	@RequestMapping("/backIndex")
	public String backIndex() {
		
		return "index";
	}
	
}	
