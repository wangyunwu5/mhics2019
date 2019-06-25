package cn.own.mhics.entity;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name="standard")
public class Standard {

	@Id
	@Column(name="standard_id")
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	private Long standardId;
	
	@Column(name="description_en")
	private String descriptionEn;
	
	@Column(name="description_cn")
	private String descriptionCn;
	
	@Column(name="code_simple")
	private String codeSimple;
	
	@Column(name="code_full")
	private String codeFull;
	
	@Column(name="code_mean")
	private String codeMean;
	
	@Column(name="remark")
	private String remark;

	public Long getStandardId() {
		return standardId;
	}

	public void setStandardId(Long standardId) {
		this.standardId = standardId;
	}

	public String getDescriptionEn() {
		return descriptionEn;
	}

	public void setDescriptionEn(String descriptionEn) {
		this.descriptionEn = descriptionEn;
	}

	public String getDescriptionCn() {
		return descriptionCn;
	}

	public void setDescriptionCn(String descriptionCn) {
		this.descriptionCn = descriptionCn;
	}

	public String getCodeSimple() {
		return codeSimple;
	}

	public void setCodeSimple(String codeSimple) {
		this.codeSimple = codeSimple;
	}

	public String getCodeFull() {
		return codeFull;
	}

	public void setCodeFull(String codeFull) {
		this.codeFull = codeFull;
	}

	public String getCodeMean() {
		return codeMean;
	}

	public void setCodeMean(String codeMean) {
		this.codeMean = codeMean;
	}

	public String getRemark() {
		return remark;
	}

	public void setRemark(String remark) {
		this.remark = remark;
	}

	@Override
	public String toString() {
		return "Standard [standardId=" + standardId + ", descriptionEn=" + descriptionEn + ", descriptionCn="
				+ descriptionCn + ", codeSimple=" + codeSimple + ", codeFull=" + codeFull + ", codeMean=" + codeMean
				+ ", remark=" + remark + "]";
	}
	
}
