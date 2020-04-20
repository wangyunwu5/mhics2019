package cn.own.mhics.entity;

public class Item {
	
	private String photo1;
	private String photo2;
	private String remark1;
	private String remark2;
	public String getPhoto1() {
		return photo1;
	}
	public void setPhoto1(String photo1) {
		this.photo1 = photo1;
	}
	public String getPhoto2() {
		return photo2;
	}
	public void setPhoto2(String photo2) {
		this.photo2 = photo2;
	}
	public String getRemark1() {
		return remark1;
	}
	public void setRemark1(String remark1) {
		this.remark1 = remark1;
	}
	public String getRemark2() {
		return remark2;
	}
	public void setRemark2(String remark2) {
		this.remark2 = remark2;
	}
	@Override
	public String toString() {
		return "item [photo1=" + photo1 + ", photo2=" + photo2 + ", remark1=" + remark1 + ", remark2=" + remark2 + "]";
	}
	
	
}
