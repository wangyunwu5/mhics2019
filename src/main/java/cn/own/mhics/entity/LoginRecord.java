package cn.own.mhics.entity;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name="user_login_record")
public class LoginRecord {
	
	@Id
	@Column(name="record_id")
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	private Long recordId;
	
	@Column(name="login_time")
	private Date loginTime;
	
	@Column(name="user_id")
	private Long userId;
	
	@Column(name="login_way")
	private String loginWay;
	
	@Column(name="session_id")
	private String sessionId;
	
	@Column(name="ip_address")
	private String ipAddredd;

	public Long getRecordId() {
		return recordId;
	}

	public void setRecordId(Long recordId) {
		this.recordId = recordId;
	}

	public Date getLoginTime() {
		return loginTime;
	}

	public void setLoginTime(Date loginTime) {
		this.loginTime = loginTime;
	}

	public Long getUserId() {
		return userId;
	}

	public void setUserId(Long userId) {
		this.userId = userId;
	}

	public String getLoginWay() {
		return loginWay;
	}

	public void setLoginWay(String loginWay) {
		this.loginWay = loginWay;
	}

	public String getSessionId() {
		return sessionId;
	}

	public void setSessionId(String sessionId) {
		this.sessionId = sessionId;
	}

	public String getIpAddredd() {
		return ipAddredd;
	}

	public void setIpAddredd(String ipAddredd) {
		this.ipAddredd = ipAddredd;
	}

	@Override
	public String toString() {
		return "LoginRecord [recordId=" + recordId + ", loginTime=" + loginTime + ", userId=" + userId + ", loginWay="
				+ loginWay + ", sessionId=" + sessionId + ", ipAddredd=" + ipAddredd + "]";
	}
	
	
}
