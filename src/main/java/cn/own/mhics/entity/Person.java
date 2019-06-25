package cn.own.mhics.entity;

import java.sql.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

@Entity
@Table(name="person")
/**
 * 
 * @author Mr.wang
 *
 */
public class Person {
	@Id
	@Column(name="user_id")
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	private Long userId;
	
	@Column(name="user_account")
	private String userAccount;
	
	@Column(name="user_pass")
	private String userPass;
	
	@Column(name="user_name")
	private String userName;
	
	@Column(name="sex")
	private String sex;
	
	@Column(name="hire_date")
	private Date hireDate;
	
	@Column(name="email")
	private String email;
	
	@Column(name="user_tel")
	private String userTel;

	@Column(name="user_img")
	private String userImg;
	
	@Column(name="modify_time")
	private Date modifyTime;
	
	@Column(name="modify_user_id")
	private Long modifyUserId;
	
	@ManyToOne()
	@JoinColumn(name="position_id")
	private Position position;

	@ManyToOne()
	@JoinColumn(name="dept_id")
	private Dept dept;
	
	@Column(name="is_lock")
	private Integer isLock=0;
	
	public Long getUserId() {
		return userId;
	}

	public void setUserId(Long userId) {
		this.userId = userId;
	}

	public String getUserAccount() {
		return userAccount;
	}

	public void setUserAccount(String userAccount) {
		this.userAccount = userAccount;
	}

	public String getUserPass() {
		return userPass;
	}

	public void setUserPass(String userPass) {
		this.userPass = userPass;
	}

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	
	public String getSex() {
		return sex;
	}

	public void setSex(String sex) {
		this.sex = sex;
	}

	public Date getHireDate() {
		return hireDate;
	}

	public void setHireDate(Date hireDate) {
		this.hireDate = hireDate;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getUserTel() {
		return userTel;
	}

	public void setUserTel(String userTel) {
		this.userTel = userTel;
	}

	public String getUserImg() {
		return userImg;
	}

	public void setUserImg(String userImg) {
		this.userImg = userImg;
	}

	public Date getModifyTime() {
		return modifyTime;
	}

	public void setModifyTime(Date modifyTime) {
		this.modifyTime = modifyTime;
	}

	public Long getModifyUserId() {
		return modifyUserId;
	}

	public void setModifyUserId(Long modifyUserId) {
		this.modifyUserId = modifyUserId;
	}

	public Position getPosition() {
		return position;
	}

	public void setPosition(Position position) {
		this.position = position;
	}

	public Dept getDept() {
		return dept;
	}

	public void setDept(Dept dept) {
		this.dept = dept;
	}
	
	public Integer getIsLock() {
		return isLock;
	}

	public void setIsLock(Integer isLock) {
		this.isLock = isLock;
	}

	@Override
	public String toString() {
		return "Person [userId=" + userId + ", userAccount=" + userAccount + ", userPass=" + userPass + ", userName="
				+ userName + ", sex=" + sex + ", hireDate=" + hireDate + ", email=" + email + ", userTel=" + userTel
				+ ", userImg=" + userImg + ", modifyTime=" + modifyTime + ", modifyUserId=" + modifyUserId
				+ ", position=" + position + ", dept=" + dept + ", isLock=" + isLock + "]";
	}

}




