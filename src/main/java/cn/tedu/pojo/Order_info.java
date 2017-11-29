package cn.tedu.pojo;

public class Order_info {
	private String orderInfoId;
	public String getOrderInfoId() {
		return orderInfoId;
	}
	public void setOrderInfoId(String orderInfoId) {
		this.orderInfoId = orderInfoId;
	}

	private Integer productBuyNum;
	private Integer petBuyNum;
	public Integer getPetBuyNum() {
		return petBuyNum;
	}
	public void setPetBuyNum(Integer petBuyNum) {
		this.petBuyNum = petBuyNum;
	}
	public Integer getProductBuyNum() {
		return productBuyNum;
	}
	public void setProductBuyNum(Integer productBuyNum) {
		this.productBuyNum = productBuyNum;
	}


}
