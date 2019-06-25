package cn.own.mhics.entity;

import java.util.Date;

public class ProjectUser {
	
	private Long projectId;
	private String projectNo;
	private String drainageAreaCode;
	private Long createManId;
	private String createManName;
	private Date createTime;
	private Long projectLeaderId;
	private String projectLeaderName;
	private Date startTime;
	private Date endTime;
	public Long getProjectId() {
		return projectId;
	}
	public void setProjectId(Long projectId) {
		this.projectId = projectId;
	}
	public String getProjectNo() {
		return projectNo;
	}
	public void setProjectNo(String projectNo) {
		this.projectNo = projectNo;
	}
	public String getDrainageAreaCode() {
		return drainageAreaCode;
	}
	public void setDrainageAreaCode(String drainageAreaCode) {
		this.drainageAreaCode = drainageAreaCode;
	}
	public Long getCreateManId() {
		return createManId;
	}
	public void setCreateManId(Long createManId) {
		this.createManId = createManId;
	}
	public String getCreateManName() {
		return createManName;
	}
	public void setCreateManName(String createManName) {
		this.createManName = createManName;
	}
	public Date getCreateTime() {
		return createTime;
	}
	public void setCreateTime(Date createTime) {
		this.createTime = createTime;
	}
	public Long getProjectLeaderId() {
		return projectLeaderId;
	}
	public void setProjectLeaderId(Long projectLeaderId) {
		this.projectLeaderId = projectLeaderId;
	}
	public String getProjectLeaderName() {
		return projectLeaderName;
	}
	public void setProjectLeaderName(String projectLeaderName) {
		this.projectLeaderName = projectLeaderName;
	}
	public Date getStartTime() {
		return startTime;
	}
	public void setStartTime(Date startTime) {
		this.startTime = startTime;
	}
	public Date getEndTime() {
		return endTime;
	}
	public void setEndTime(Date endTime) {
		this.endTime = endTime;
	}
	@Override
	public String toString() {
		return "ProjectUser [projectId=" + projectId + ", projectNo=" + projectNo + ", drainageAreaCode="
				+ drainageAreaCode + ", createManId=" + createManId + ", createManName=" + createManName
				+ ", createTime=" + createTime + ", projectLeaderId=" + projectLeaderId + ", projectLeaderName="
				+ projectLeaderName + ", startTime=" + startTime + ", endTime=" + endTime + "]";
	}

}
