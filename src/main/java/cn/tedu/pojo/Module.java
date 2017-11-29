package cn.tedu.pojo;

import java.util.Date;


public class Module {
	private String moduleId;
	private Module parentModel;
	private String name;
	private Integer ctype;
	private Integer state;
	private String remark;
	private Integer orderno;
	private String creatby;
	private String creatdept;
	private Date creattime;
	private String updateby;
	private Date updatetime;
	private boolean checked;
	public String getId() {
		return moduleId;
	}
	
	public boolean isChecked() {
		return checked;
	}
	public void setChecked(boolean checked) {
		this.checked = checked;
	}
	@Override
	public String toString() {
		return "Module [moduleId=" + moduleId + ", parentModel=" + parentModel + ", name=" + name + ", ctype=" + ctype
				+ ", state=" + state + ", remark=" + remark + ", orderno=" + orderno + ", creatby=" + creatby
				+ ", creatdept=" + creatdept + ", creattime=" + creattime + ", updateby=" + updateby + ", updatetime="
				+ updatetime + ", checked=" + checked + "]";
	}
	public String getModuleId() {
		return moduleId;
	}
	public void setModuleId(String moduleId) {
		this.moduleId = moduleId;
	}
	public String getpId() {
//		因为zTree框架 不支持pId的值为null 所以判断如果没有上级 则返回“”即可
		if (parentModel==null) {
			return "";
		}
		return parentModel.moduleId;
	}
	public Module getParentModel() {
		return parentModel;
	}
	public void setParentModel(Module parentModel) {
		this.parentModel = parentModel;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public Integer getCtype() {
		return ctype;
	}
	public void setCtype(Integer ctype) {
		this.ctype = ctype;
	}
	public Integer getState() {
		return state;
	}
	public void setState(Integer state) {
		this.state = state;
	}
	public String getRemark() {
		return remark;
	}
	public void setRemark(String remark) {
		this.remark = remark;
	}
	public Integer getOrderno() {
		return orderno;
	}
	public void setOrderno(Integer orderno) {
		this.orderno = orderno;
	}
	public String getCreatby() {
		return creatby;
	}
	public void setCreatby(String creatby) {
		this.creatby = creatby;
	}
	public String getCreatdept() {
		return creatdept;
	}
	public void setCreatdept(String creatdept) {
		this.creatdept = creatdept;
	}
	public Date getCreattime() {
		return creattime;
	}
	public void setCreattime(Date creattime) {
		this.creattime = creattime;
	}
	public String getUpdateby() {
		return updateby;
	}
	public void setUpdateby(String updateby) {
		this.updateby = updateby;
	}
	public Date getUpdatetime() {
		return updatetime;
	}
	public void setUpdatetime(Date updatetime) {
		this.updatetime = updatetime;
	}
	
	
}
