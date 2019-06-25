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
@Table(name="task_recive")
public class TaskRecive {
	
	@Id
	@Column(name="recive_id")
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	private Long reciveId;
	
	@ManyToOne
	@JoinColumn(name="task_id")
	private Task task;
	
	@ManyToOne
	@JoinColumn(name="recive_user_id")
	private Person person;
	
	@Column(name="recive_time")
	private Date reciveTime;
	
	@Column(name="work_no")
	private String workNo;
	
	@Column(name="with_risk_assessment")
	private String withRiskAssessment;

	@Column(name="with_permit_towork")
	private String withPermitTowork;
	
	@Column(name="with_traff_permit")
	private String withTraffPermit;
	
	@Column(name="survey_date")
	private Date surveyDate;

	public Long getReciveId() {
		return reciveId;
	}

	public void setReciveId(Long reciveId) {
		this.reciveId = reciveId;
	}

	public Task getTask() {
		return task;
	}

	public void setTask(Task task) {
		this.task = task;
	}

	public Person getPerson() {
		return person;
	}

	public void setPerson(Person person) {
		this.person = person;
	}

	public Date getReciveTime() {
		return reciveTime;
	}

	public void setReciveTime(Date reciveTime) {
		this.reciveTime = reciveTime;
	}

	public String getWorkNo() {
		return workNo;
	}

	public void setWorkNo(String workNo) {
		this.workNo = workNo;
	}

	public String getWithRiskAssessment() {
		return withRiskAssessment;
	}

	public void setWithRiskAssessment(String withRiskAssessment) {
		this.withRiskAssessment = withRiskAssessment;
	}

	public String getWithPermitTowork() {
		return withPermitTowork;
	}

	public void setWithPermitTowork(String withPermitTowork) {
		this.withPermitTowork = withPermitTowork;
	}

	public String getWithTraffPermit() {
		return withTraffPermit;
	}

	public void setWithTraffPermit(String withTraffPermit) {
		this.withTraffPermit = withTraffPermit;
	}

	public Date getSurveyDate() {
		return surveyDate;
	}

	public void setSurveyDate(Date surveyDate) {
		this.surveyDate = surveyDate;
	}

	@Override
	public String toString() {
		return "TaskRecive [reciveId=" + reciveId + ", task=" + task + ", person=" + person + ", reciveTime="
				+ reciveTime + ", workNo=" + workNo + ", withRiskAssessment=" + withRiskAssessment
				+ ", withPermitTowork=" + withPermitTowork + ", withTraffPermit=" + withTraffPermit + ", surveyDate="
				+ surveyDate + "]";
	}
	
}
