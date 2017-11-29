package cn.tedu.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import cn.tedu.pojo.Pet;
import cn.tedu.pojo.ProductO;
import cn.tedu.service.CartService;

@Controller
public class CartController {
	@Autowired
	private CartService cartService;

	@RequestMapping("/add")
	public String toEdit(String id, HttpSession session, String buynum) {
		int buynu = Integer.parseInt(buynum);
		Pet petO = cartService.findById(id);
		ProductO productO = cartService.findpById(id);
		Object caroObject = session.getAttribute("petcart");
		Object caroObject1 = session.getAttribute("productcart");
		Map<Pet, Integer> cartMap = null;
		Map<ProductO, Integer> cartMap1 = null;
		
		if (petO != null) {
			// 4.2执行判断
			if (caroObject == null) {
				// “首次”购买商品
				cartMap = new HashMap<Pet, Integer>();

				session.setAttribute("petcart", cartMap);

			} else {
				cartMap = (Map<Pet, Integer>) caroObject;
			}
			// 5将prod和buynum保存到cart中
			if (cartMap.containsKey(petO)) {
				// 当前商品已经购买过
				cartMap.put(petO, cartMap.get(petO) + buynu);
			} else {
				cartMap.put(petO, buynu);
			}

		}
		if (productO != null) {
			// 4.2执行判断
			if (caroObject1 == null) {
				// “首次”购买商品
				cartMap1 = new HashMap<ProductO, Integer>();

				session.setAttribute("productcart", cartMap1);

			} else {
				cartMap1 = (Map<ProductO, Integer>) caroObject1;
			}
			// 5将prod和buynum保存到cart中
			if (cartMap1.containsKey(productO)) {
				// 当前商品已经购买过
				cartMap1.put(productO, cartMap1.get(productO) + buynu);
			} else {
				cartMap1.put(productO, buynu);
			}
		}
		return "cart/cart";
	}

	@RequestMapping("/delete")
	public String delete(String id, Model model, HttpSession session) {
		Object cartObject = session.getAttribute("petcart");
		if (cartObject == null) {// 为null->index.jsp
			return "redirect:index.jsp";
		} else {// 不为null
				// 4、执行删除商品的操作
			Map<Pet, Integer> cart = (Map<Pet, Integer>) cartObject;
			Pet prod = new Pet();
			prod.setPetId(id);
			cart.remove(prod);
			// 5跳转到cart.jsp
			return "cart/cart";
		}
	}

	@RequestMapping("/delete1")
	public String delete1(String id, Model model, HttpSession session) {
		Object cartObject = session.getAttribute("productcart");
		if (cartObject == null) {// 为null->index.jsp
			return "redirect:index.jsp";
		} else {// 不为null
				// 4、执行删除商品的操作
			Map<ProductO, Integer> cart = (Map<ProductO, Integer>) cartObject;
			ProductO prod = new ProductO();
			prod.setProductid(id);
			
			cart.remove(prod);
			// 5跳转到cart.jsp
			return "cart/cart";
		}
	}

	@RequestMapping("/edit")
	public String edit(String id, String newBuyNum, HttpSession session) {
		int buynum = Integer.parseInt(newBuyNum);
		Object cartObj = session.getAttribute("petcart");
		if (cartObj == null) {
			return "redirect:index.jsp";
		} else {// 4不为null
				// 4.1强制类型转
			Map<Pet, Integer> cart = (Map<Pet, Integer>) cartObj;
			// 4.2创建Product对象
			Pet prod = new Pet();
			prod.setPetId(id);
			// 5执行修改操作
			cart.put(prod, buynum);
			// 6、跳转到cart.jsp
			return "cart/cart";
		}
	}

	@RequestMapping("/edit1")
	public String edit1(String id, String newBuyNum, HttpSession session) {
		int buynum = Integer.parseInt(newBuyNum);
		Object cartObj = session.getAttribute("productcart");
		if (cartObj == null) {
			return "redirect:index.jsp";
		} else {// 4不为null
				// 4.1强制类型转
			Map<ProductO, Integer> cart = (Map<ProductO, Integer>) cartObj;
			// 4.2创建Product对象
			ProductO prod = new ProductO();
			prod.setProductid(id);
			// 5执行修改操作
			cart.put(prod, buynum);
			// 6、跳转到cart.jsp
			return "cart/cart";
		}
	}
	@RequestMapping("/img")
	public String toimg(String imgurl){
		
		return imgurl;
	}
	@RequestMapping("/orderadd")
	public String toOrderadd(){
		return "order/order_add";
	}
	
}
