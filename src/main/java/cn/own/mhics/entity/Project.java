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
@Table(name="project")
public class Project {
	
	@Id
	@Column(name="project_id")
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	private Long projectId;
	
	@Column(name="project_no")
	private String projectNo;
	
	@Column(name="drainage_area_code")
	private String drainageAreaCode;
	
	@ManyToOne()
	@JoinColumn(name="create_man_id")
	private Person personOne;
	
	@Column(name="create_time")
	private Date createTime;
	
	@ManyToOne()
	@JoinColumn(name="project_leader_id")
	private Person personTwo;
	
	@Column(name="start_time")
	private Date startTime;
	
	@Column(name="end_time")
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


	public Date getCreateTime() {
		return createTime;
	}

	public void setCreateTime(Date createTime) {
		this.createTime = createTime;
	}
	
	
	public Person getPersonOne() {
		return personOne;
	}

	public void setPersonOne(Person personOne) {
		this.personOne = personOne;
	}

	public Person getPersonTwo() {
		return personTwo;
	}

	public void setPersonTwo(Person personTwo) {
		this.personTwo = personTwo;
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
		return "Project [projectId=" + projectId + ", projectNo=" + projectNo + ", drainageAreaCode=" + drainageAreaCode
				+ ", personOne=" + personOne + ", createTime=" + createTime + ", personTwo=" + personTwo
				+ ", startTime=" + startTime + ", endTime=" + endTime + "]";
	}
	
}
