package cn.tedu.pojo;

import java.util.Date;
import java.util.List;

public class Order {
	private String orderId;
	private String orderInfoId;
	private Date ordertime;
	private double orderMoney;
	private Integer paystate;
	private String orderAddress;
	private String info;
	private String userId;
	private User user;
	private List<Pet> pets;
	private List<Product> products;
	public List<Pet> getPets() {
		return pets;
	}
	@Override
	public String toString() {
		return "Order [orderId=" + orderId + ", orderInfoId=" + orderInfoId + ", ordertime=" + ordertime
				+ ", orderMoney=" + orderMoney + ", paystate=" + paystate + ", orderAddress=" + orderAddress + ", info="
				+ info + ", user=" + user + ", pets=" + pets + ", products=" + products + "]";
	}
	public void setPets(List<Pet> pets) {
		this.pets = pets;
	}
	public List<Product> getProducts() {
		return products;
	}
	public void setProducts(List<Product> products) {
		this.products = products;
	}
	public int hashCode() {
		return orderId==null?0:orderId.hashCode();
	}
	@Override
	public boolean equals(Object obj) {
		if(this==obj){
			return true;
		}
		if(obj==null){
			return false;
		}
		//�ж�obj�Ƿ�ΪProduct
		if(!(obj instanceof Product)){
			//obj����Product��ĵĶ���
			return false;
		}
		//˵��obj��Product�ഴ���Ķ���
		Order other = (Order)obj;
		if(orderId!=null&&orderId.equals(other.getOrderId())){
			//˵����������id��ͬ
			return true;
		}
		return false;
	}
	
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	public User getUser() {
		return user;
	}
	public void setUser(User user) {
		this.user = user;
	}


	public String getOrderId() {

		return orderId;
	}
	public void setOrderId(String orderId) {
		this.orderId = orderId;
	}
	public String getOrderInfoId() {
		return orderInfoId;
	}
	public void setOrderInfoId(String orderInfoId) {
		this.orderInfoId = orderInfoId;
	}
	public Date getOrdertime() {
		return ordertime;
	}
	public void setOrdertime(Date ordertime) {
		this.ordertime = ordertime;
	}
	
	public double getOrderMoney() {
		return orderMoney;
	}
	public void setOrderMoney(double orderMoney) {
		this.orderMoney = orderMoney;
	}
	public Integer getPaystate() {
		return paystate;
	}
	public void setPaystate(Integer paystate) {
		this.paystate = paystate;
	}
	public String getOrderAddress() {
		return orderAddress;
	}
	public void setOrderAddress(String orderAddress) {
		this.orderAddress = orderAddress;
	}
	public String getInfo() {
		return info;
	}
	public void setInfo(String info) {
		this.info = info;
	}
	
}
