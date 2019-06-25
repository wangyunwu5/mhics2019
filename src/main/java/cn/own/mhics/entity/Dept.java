package cn.own.mhics.entity;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.OneToOne;
import javax.persistence.Table;

@Entity
@Table(name="dept")
/**
 * 
 * @author Mr.wang
 *
 */
public class Dept {

	@Id
	@Column(name="dept_id")
	@GeneratedValue(strategy=GenerationType.IDENTITY) //自增主键
	private Integer deptId;
	
	@Column(name="dept_name")
	private String name;
	
	@Column(name="dept_tel")
	private String deptTel;
	
	@Column(name="dept_addr")
	private String deptAddr;
	
	@Column(name="manager_id")
	private Long managerId;
	
	
	public Integer getDeptId() {
		return deptId;
	}

	public void setDeptId(Integer deptId) {
		this.deptId = deptId;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getDeptTel() {
		return deptTel;
	}

	public void setDeptTel(String deptTel) {
		this.deptTel = deptTel;
	}

	public String getDeptAddr() {
		return deptAddr;
	}

	public void setDeptAddr(String deptAddr) {
		this.deptAddr = deptAddr;
	}

	public Long getManagerId() {
		return managerId;
	}

	public void setManagerId(Long managerId) {
		this.managerId = managerId;
	}

	@Override
	public String toString() {
		return "Dept [deptId=" + deptId + ", name=" + name + ", deptTel=" + deptTel + ", deptAddr=" + deptAddr
				+ ", managerId=" + managerId + "]";
	}
}
