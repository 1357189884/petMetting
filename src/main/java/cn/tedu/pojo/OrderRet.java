package cn.tedu.pojo;

import java.util.Date;
//报表生产工具类所用bean
public class OrderRet {
	private String username;
	private String name;
	private String address;
	private Date ordertime;
	private double money;
	private String orderAddress;
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public Date getOrdertime() {
		return ordertime;
	}                                                                                                                                                                    
	public void setOrdertime(Date ordertime) {
		this.ordertime = ordertime;
	}
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public String getOrderAddress() {
		return orderAddress;
	}
	public void setOrderAddress(String orderAddress) {
		this.orderAddress = orderAddress;
	}
	public double getMoney() {
		return money;
	}
	public void setMoney(double money) {
		this.money = money;
	}
	
}
