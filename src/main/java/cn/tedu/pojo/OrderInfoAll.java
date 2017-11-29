package cn.tedu.pojo;

import java.util.Map;

public class OrderInfoAll {
	private Order order;
	
	private Map<Pet, Integer> petorderitem;
	private Map<ProductO, Integer> orderitem;
	public Order getOrder() {
		return order;
	}

	public void setOrder(Order orderO) {
		this.order = order;
	}

	public Map<ProductO, Integer> getOrderitem() {
		return orderitem;
	}

	public void setOrderitem(Map<ProductO, Integer> orderitem) {
		this.orderitem = orderitem;
	}

	public Map<Pet, Integer> getPetorderitem() {
		return petorderitem;
	}

	public void setPetorderitem(Map<Pet, Integer> petorderitem) {
		this.petorderitem = petorderitem;
	}
	
	
}
