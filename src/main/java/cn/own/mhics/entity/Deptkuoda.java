package cn.own.mhics.entity;

public class Deptkuoda {
	
	private Integer deptId;
	
	private String deptName;
	
	private String deptTel;
	
	private String deptAddress;
	
	private String managerAccount;
	
	private Long managerId;

	public Deptkuoda(Integer deptId,
			String deptName,String deptTel,
			String deptAddress,String managerAccount,Long managerId) {
		this.deptId = deptId;
		this.deptName = deptName;
		this.deptTel = deptTel;
		this.deptAddress = deptAddress;
		this.managerId = managerId;
		this.managerAccount = managerAccount;
	}

	public Integer getDeptId() {
		return deptId;
	}


	public void setDeptId(Integer deptId) {
		this.deptId = deptId;
	}

	public String getDeptName() {
		return deptName;
	}

	public void setDeptName(String deptName) {
		this.deptName = deptName;
	}

	public String getDeptTel() {
		return deptTel;
	}

	public void setDeptTel(String deptTel) {
		this.deptTel = deptTel;
	}

	public String getDeptAddress() {
		return deptAddress;
	}

	public void setDeptAddress(String deptAddress) {
		this.deptAddress = deptAddress;
	}
	
	public String getManagerAccount() {
		return managerAccount;
	}

	public void setManagerAccount(String managerAccount) {
		this.managerAccount = managerAccount;
	}

	public Long getManagerId() {
		return managerId;
	}

	public void setManagerId(Long managerId) {
		this.managerId = managerId;
	}

	@Override
	public String toString() {
		return "Deptkuoda [deptId=" + deptId + ", deptName=" + deptName + ", deptTel=" + deptTel + ", deptAddress="
				+ deptAddress + ", managerAccount=" + managerAccount + ", managerId=" + managerId + "]";
	}

	
}
