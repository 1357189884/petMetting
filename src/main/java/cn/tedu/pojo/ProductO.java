package cn.tedu.pojo;

public class ProductO{
	private String productid;
	private String name;
	private Integer num;
	private String price;
	private String imgurl;
	private String description;
	public String getProductid() {
		return productid;
	}
	public void setProductid(String productid) {
		this.productid = productid;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public Integer getNum() {
		return num;
	}
	public void setNum(Integer num) {
		this.num = num;
	}
	public String getPrice() {
		return price;
	}
	public void setPrice(String price) {
		this.price = price;
	}
	public String getImgurl() {
		return imgurl;
	}
	public void setImgurl(String imgurl) {
		this.imgurl = imgurl;
	}
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	@Override
	public int hashCode() {
		
		return productid==null?0:productid.hashCode();
	}
	@Override
	public boolean equals(Object obj) {
		if(this==obj){
			return true;
		}
		if(obj==null){
			return false;
		}
		
		if(!(obj instanceof ProductO)){
			return false;
		}
		ProductO otherProduct=(ProductO)obj;
		if(productid!=null&&productid.equals(otherProduct.getProductid())){
			return true;
		}
		return false;
	}
}
