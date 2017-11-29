package cn.tedu.pojo;


import java.util.Date;

public class Pet {
	private String petId;
	private String petName;
	private Order_info order_info;
	public Order_info getOrder_info() {
		return order_info;
	}
	public void setOrder_info(Order_info order_info) {
		this.order_info = order_info;
	}

	private Integer age;//年龄
	private Integer price;//价格
	private Date birthday;//生日
	private String kind;//种类
	private String fancy;//喜好
	private Integer health;//是否健康
	private String remark;//描述
	private Integer num;//库存
	private Date createDate;//创建时间
	private String imgurl;
	
	public Integer getAge() {
		return age;
	}

	public void setAge(Integer age) {
		this.age = age;
	}

	public Integer getNum() {
		return num;
	}

	public void setNum(Integer num) {
		this.num = num;
	}

	public Date getCreateDate() {
		return createDate;
	}

	public void setCreateDate(Date createDate) {
		this.createDate = createDate;
	}

	public String getImgurl() {
		return imgurl;
	}
	public void setImgurl(String imgurl) {
		this.imgurl = imgurl;
	}

	public String getPetId() {
		return petId;
	}

	public void setPetId(String petId) {
		this.petId = petId;
	}

	public String getPetName() {
		return petName;
	}

	public void setPetName(String petName) {
		this.petName = petName;
	}

	public Integer getPrice() {
		return price;
	}

	public void setPrice(Integer price) {
		this.price = price;
	}

	public Date getBirthday() {
		return birthday;
	}

	public void setBirthday(Date birthday) {
		this.birthday = birthday;
	}

	public String getKind() {
		return kind;
	}

	public void setKind(String kind) {
		this.kind = kind;
	}

	public String getFancy() {
		return fancy;
	}

	public void setFancy(String fancy) {
		this.fancy = fancy;
	}

	public Integer getHealth() {
		return health;
	}

	public void setHealth(Integer health) {
		this.health = health;
	}

	public String getRemark() {
		return remark;
	}

	public void setRemark(String remark) {
		this.remark = remark;
	}
	/**
	 * 重写父类的equals方法，比较id，看是否是同一个物品
	 */
	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + ((petId == null) ? 0 : petId.hashCode());
		return result;
	}

	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		Pet other = (Pet) obj;
		if (petId == null) {
			if (other.petId != null)
				return false;
		} else if (!petId.equals(other.petId))
			return false;
		return true;
	}
	
	
	
}
