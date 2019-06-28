package cn.own.mhics.entity;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

@Entity
@Table(name="node")
public class Node {

	@Id
	@Column(name="node_id")
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	private Long nodeId;
	
	@Column(name="work_no")
	private String workNo;
	
	@Column(name="drainage_area_code")
	private String drainageAreaCode;
	
	@ManyToOne
	@JoinColumn(name="project_id")
	private Project project;
	
	@Column(name="node_no")
	private String nodeNo;
	
	@Column(name="year_laid")
	private Date yearLaid;
	
	@Column(name="status")
	private String status;
	
	@Column(name="function")
	private String function;
	
	@Column(name="node_type")
	private String nodeType;
	
	@Column(name="cover_shape")
	private String coverShape;
	
	@Column(name="cover_type")
	private String coverType;
	
	@Column(name="cover_duty")
	private String coverDuty;
	
	@Column(name="cover_sizec")
	private Double coverSizec;
	
	@Column(name="cover_sizek")
	private Double coverSizek;
	
	@Column(name="cover_level")
	private Double coverLevel;
	
	@Column(name="hinged")
	private String hinged;
	
	@Column(name="locked")
	private String locked;
	
	@Column(name="shaft_side_entry")
	private String shaftSideEntry;
	
	@Column(name="shaft_regular_course")
	private String shaftRegularCourse;
	
	@Column(name="shaft_depth")
	private Double shaftDepth;
	
	@Column(name="shaft_sizec")
	private Double shaftSizec;

	@Column(name="shaft_sizek")
	private Double shaftSizek;
	
	@Column(name="chamber_soffit")
	private  String chamberSoffit;
	
	@Column(name="chamber_steps")
	private Integer chamberSteps;
	
	@Column(name="chamber_ladders")
	private Integer chamberLadders;
	
	@Column(name="chamber_lndgs")
	private Integer chamberLndgs;
	
	@Column(name="chamber_sizec")
	private Double chamberSizec;
	
	@Column(name="chamber_sizek")
	private Double chamberSizek;
	
	@Column(name="toxic")
	private String toxic;
	
	@Column(name="vermin")
	private String vermin;
	
	@Column(name="construct_code")
	private String constructCode;
	
	@Column(name="location")
	private String location;
	
	@Column(name="location_photo")
	private String locationPhoto;
	
	@Column(name="internal_photo")
	private String internalPhoto;
	
	@Column(name="location_sketch")
	private String locationSketch;
	
	@Column(name="plan_of_mh")
	private String planOfMh;
	
	@Column(name="depth_of_flow")
	private double depthOfFlow;
	
	@Column(name="depth_of_silt")
	private double depthOfSilt;
	
	@Column(name="height_surch")
	private double heightSurch;
	
	@Column(name="mh_depth")
	private double mhDepth;
	
	@Column(name="zbx")
	private String zbx;
	
	@Column(name="zby")
	private String zby;
	
	@Column(name="utr")
	private String utr;
	
	@Column(name="utl")
	private String utl;
	
	@Column(name="utga")
	private String utga;
	
	@Column(name="uts")
	private String uts;
	
	@Column(name="jetting")
	private String jetting;
	
	@Column(name="on_slope")
	private String onSlope;
	
	@Column(name="slope_no")
	private String slopeNo;
	
	@Column(name="cover_condition")
	private String coverCondition;
	
	@Column(name="cover_photo")
	private String coverPhoto;
	
	@Column(name="ladder_condition")
	private String ladderCondition;
	
	@Column(name="ladder_photo")
	private String ladderPhoto;
	
	@Column(name="shaft_condition")
	private String shaftCondition;
	
	@Column(name="shaft_photo")
	private String shaftPhoto;
	
	@Column(name="chamber_condition")
	private String chamberCondition;
	
	@Column(name="chamber_photo")
	private String chamberPhoto;
	
	@Column(name="benching_condition")
	private String benchingCondition;
	
	@Column(name="benching_photo")
	private String benchingPhoto;
	
	@Column(name="others_condition")
	private String othersCondition;
	
	@Column(name="others_photo")
	private String othersPhoto;
	
	@Column(name="cctv_cond")
	private String cctvCond;
	
	@Column(name="crity")
	private String crity;
	
	@Column(name="record_plan_difference")
	private String recordPlanDifference;
	
	@Column(name="idms_manhole_id")
	private String idmsManholeId;
	
	@Column(name="dsd_ref")
	private String dsdRef;
	
	@Column(name="remark")
	private String remark;
	
	@Column(name="insert_date")
	private Date insertDate;

	@ManyToOne
	@JoinColumn(name="insert_man_id")
	private Person insertMan;

	public Long getNodeId() {
		return nodeId;
	}

	public void setNodeId(Long nodeId) {
		this.nodeId = nodeId;
	}
   
	public String getWorkNo() {
		return workNo;
	}

	public void setWorkNo(String workNo) {
		this.workNo = workNo;
	}

	public String getDrainageAreaCode() {
		return drainageAreaCode;
	}

	public void setDrainageAreaCode(String drainageAreaCode) {
		this.drainageAreaCode = drainageAreaCode;
	}

	public Project getProject() {
		return project;
	}

	public void setProject(Project project) {
		this.project = project;
	}

	public String getNodeNo() {
		return nodeNo;
	}

	public void setNodeNo(String nodeNo) {
		this.nodeNo = nodeNo;
	}

	public Date getYearLaid() {
		return yearLaid;
	}

	public void setYearLaid(Date yearLaid) {
		this.yearLaid = yearLaid;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public String getFunction() {
		return function;
	}

	public void setFunction(String function) {
		this.function = function;
	}

	public String getNodeType() {
		return nodeType;
	}

	public void setNodeType(String nodeType) {
		this.nodeType = nodeType;
	}

	public String getCoverShape() {
		return coverShape;
	}

	public void setCoverShape(String coverShape) {
		this.coverShape = coverShape;
	}

	public String getCoverType() {
		return coverType;
	}

	public void setCoverType(String coverType) {
		this.coverType = coverType;
	}

	public String getCoverDuty() {
		return coverDuty;
	}

	public void setCoverDuty(String coverDuty) {
		this.coverDuty = coverDuty;
	}

	public Double getCoverSizec() {
		return coverSizec;
	}

	public void setCoverSizec(Double coverSizec) {
		this.coverSizec = coverSizec;
	}

	public Double getCoverSizek() {
		return coverSizek;
	}

	public void setCoverSizek(Double coverSizek) {
		this.coverSizek = coverSizek;
	}

	public Double getCoverLevel() {
		return coverLevel;
	}

	public void setCoverLevel(Double coverLevel) {
		this.coverLevel = coverLevel;
	}

	public String getHinged() {
		return hinged;
	}

	public void setHinged(String hinged) {
		this.hinged = hinged;
	}

	public String getLocked() {
		return locked;
	}

	public void setLocked(String locked) {
		this.locked = locked;
	}

	public String getShaftSideEntry() {
		return shaftSideEntry;
	}

	public void setShaftSideEntry(String shaftSideEntry) {
		this.shaftSideEntry = shaftSideEntry;
	}

	public String getShaftRegularCourse() {
		return shaftRegularCourse;
	}

	public void setShaftRegularCourse(String shaftRegularCourse) {
		this.shaftRegularCourse = shaftRegularCourse;
	}

	public Double getShaftDepth() {
		return shaftDepth;
	}

	public void setShaftDepth(Double shaftDepth) {
		this.shaftDepth = shaftDepth;
	}

	public Double getShaftSizec() {
		return shaftSizec;
	}

	public void setShaftSizec(Double shaftSizec) {
		this.shaftSizec = shaftSizec;
	}

	public Double getShaftSizek() {
		return shaftSizek;
	}

	public void setShaftSizek(Double shaftSizek) {
		this.shaftSizek = shaftSizek;
	}

	public String getChamberSoffit() {
		return chamberSoffit;
	}

	public void setChamberSoffit(String chamberSoffit) {
		this.chamberSoffit = chamberSoffit;
	}

	public Integer getChamberSteps() {
		return chamberSteps;
	}

	public void setChamberSteps(Integer chamberSteps) {
		this.chamberSteps = chamberSteps;
	}

	public Integer getChamberLadders() {
		return chamberLadders;
	}

	public void setChamberLadders(Integer chamberLadders) {
		this.chamberLadders = chamberLadders;
	}

	public Integer getChamberLndgs() {
		return chamberLndgs;
	}

	public void setChamberLndgs(Integer chamberLndgs) {
		this.chamberLndgs = chamberLndgs;
	}

	public Double getChamberSizec() {
		return chamberSizec;
	}

	public void setChamberSizec(Double chamberSizec) {
		this.chamberSizec = chamberSizec;
	}

	public Double getChamberSizek() {
		return chamberSizek;
	}

	public void setChamberSizek(Double chamberSizek) {
		this.chamberSizek = chamberSizek;
	}

	public String getToxic() {
		return toxic;
	}

	public void setToxic(String toxic) {
		this.toxic = toxic;
	}

	public String getVermin() {
		return vermin;
	}

	public void setVermin(String vermin) {
		this.vermin = vermin;
	}

	public String getConstructCode() {
		return constructCode;
	}

	public void setConstructCode(String constructCode) {
		this.constructCode = constructCode;
	}

	public String getLocation() {
		return location;
	}

	public void setLocation(String location) {
		this.location = location;
	}

	public String getLocationPhoto() {
		return locationPhoto;
	}

	public void setLocationPhoto(String locationPhoto) {
		this.locationPhoto = locationPhoto;
	}

	public String getInternalPhoto() {
		return internalPhoto;
	}

	public void setInternalPhoto(String internalPhoto) {
		this.internalPhoto = internalPhoto;
	}

	public String getLocationSketch() {
		return locationSketch;
	}

	public void setLocationSketch(String locationSketch) {
		this.locationSketch = locationSketch;
	}

	public String getPlanOfMh() {
		return planOfMh;
	}

	public void setPlanOfMh(String planOfMh) {
		this.planOfMh = planOfMh;
	}

	public double getDepthOfFlow() {
		return depthOfFlow;
	}

	public void setDepthOfFlow(double depthOfFlow) {
		this.depthOfFlow = depthOfFlow;
	}

	public double getDepthOfSilt() {
		return depthOfSilt;
	}

	public void setDepthOfSilt(double depthOfSilt) {
		this.depthOfSilt = depthOfSilt;
	}

	public double getHeightSurch() {
		return heightSurch;
	}

	public void setHeightSurch(double heightSurch) {
		this.heightSurch = heightSurch;
	}

	public double getMhDepth() {
		return mhDepth;
	}

	public void setMhDepth(double mhDepth) {
		this.mhDepth = mhDepth;
	}

	public String getZbx() {
		return zbx;
	}

	public void setZbx(String zbx) {
		this.zbx = zbx;
	}

	public String getZby() {
		return zby;
	}

	public void setZby(String zby) {
		this.zby = zby;
	}

	public String getUtr() {
		return utr;
	}

	public void setUtr(String utr) {
		this.utr = utr;
	}

	public String getUtl() {
		return utl;
	}

	public void setUtl(String utl) {
		this.utl = utl;
	}

	public String getUtga() {
		return utga;
	}

	public void setUtga(String utga) {
		this.utga = utga;
	}

	public String getUts() {
		return uts;
	}

	public void setUts(String uts) {
		this.uts = uts;
	}

	public String getJetting() {
		return jetting;
	}

	public void setJetting(String jetting) {
		this.jetting = jetting;
	}

	public String getOnSlope() {
		return onSlope;
	}

	public void setOnSlope(String onSlope) {
		this.onSlope = onSlope;
	}

	public String getSlopeNo() {
		return slopeNo;
	}

	public void setSlopeNo(String slopeNo) {
		this.slopeNo = slopeNo;
	}

	public String getCoverCondition() {
		return coverCondition;
	}

	public void setCoverCondition(String coverCondition) {
		this.coverCondition = coverCondition;
	}

	public String getCoverPhoto() {
		return coverPhoto;
	}

	public void setCoverPhoto(String coverPhoto) {
		this.coverPhoto = coverPhoto;
	}

	public String getLadderCondition() {
		return ladderCondition;
	}

	public void setLadderCondition(String ladderCondition) {
		this.ladderCondition = ladderCondition;
	}

	public String getLadderPhoto() {
		return ladderPhoto;
	}

	public void setLadderPhoto(String ladderPhoto) {
		this.ladderPhoto = ladderPhoto;
	}

	public String getShaftCondition() {
		return shaftCondition;
	}

	public void setShaftCondition(String shaftCondition) {
		this.shaftCondition = shaftCondition;
	}

	public String getShaftPhoto() {
		return shaftPhoto;
	}

	public void setShaftPhoto(String shaftPhoto) {
		this.shaftPhoto = shaftPhoto;
	}

	public String getChamberCondition() {
		return chamberCondition;
	}

	public void setChamberCondition(String chamberCondition) {
		this.chamberCondition = chamberCondition;
	}

	public String getChamberPhoto() {
		return chamberPhoto;
	}

	public void setChamberPhoto(String chamberPhoto) {
		this.chamberPhoto = chamberPhoto;
	}

	public String getBenchingCondition() {
		return benchingCondition;
	}

	public void setBenchingCondition(String benchingCondition) {
		this.benchingCondition = benchingCondition;
	}

	public String getBenchingPhoto() {
		return benchingPhoto;
	}

	public void setBenchingPhoto(String benchingPhoto) {
		this.benchingPhoto = benchingPhoto;
	}

	public String getOthersCondition() {
		return othersCondition;
	}

	public void setOthersCondition(String othersCondition) {
		this.othersCondition = othersCondition;
	}

	public String getOthersPhoto() {
		return othersPhoto;
	}

	public void setOthersPhoto(String othersPhoto) {
		this.othersPhoto = othersPhoto;
	}

	public String getCctvCond() {
		return cctvCond;
	}

	public void setCctvCond(String cctvCond) {
		this.cctvCond = cctvCond;
	}

	public String getCrity() {
		return crity;
	}

	public void setCrity(String crity) {
		this.crity = crity;
	}

	public String getRecordPlanDifference() {
		return recordPlanDifference;
	}

	public void setRecordPlanDifference(String recordPlanDifference) {
		this.recordPlanDifference = recordPlanDifference;
	}

	public String getIdmsManholeId() {
		return idmsManholeId;
	}

	public void setIdmsManholeId(String idmsManholeId) {
		this.idmsManholeId = idmsManholeId;
	}

	public String getDsdRef() {
		return dsdRef;
	}

	public void setDsdRef(String dsdRef) {
		this.dsdRef = dsdRef;
	}

	public String getRemark() {
		return remark;
	}

	public void setRemark(String remark) {
		this.remark = remark;
	}

	public Date getInsertDate() {
		return insertDate;
	}

	public void setInsertDate(Date insertDate) {
		this.insertDate = insertDate;
	}


	public Person getInsertMan() {
		return insertMan;
	}

	public void setInsertMan(Person insertMan) {
		this.insertMan = insertMan;
	}

	@Override
	public String toString() {
		return "Node [nodeId=" + nodeId + ", workNo=" + workNo + ", drainageAreaCode=" + drainageAreaCode + ", project="
				+ project + ", nodeNo=" + nodeNo + ", yearLaid=" + yearLaid + ", status=" + status + ", function="
				+ function + ", nodeType=" + nodeType + ", coverShape=" + coverShape + ", coverType=" + coverType
				+ ", coverDuty=" + coverDuty + ", coverSizec=" + coverSizec + ", coverSizek=" + coverSizek
				+ ", coverLevel=" + coverLevel + ", hinged=" + hinged + ", locked=" + locked + ", shaftSideEntry="
				+ shaftSideEntry + ", shaftRegularCourse=" + shaftRegularCourse + ", shaftDepth=" + shaftDepth
				+ ", shaftSizec=" + shaftSizec + ", shaftSizek=" + shaftSizek + ", chamberSoffit=" + chamberSoffit
				+ ", chamberSteps=" + chamberSteps + ", chamberLadders=" + chamberLadders + ", chamberLndgs="
				+ chamberLndgs + ", chamberSizec=" + chamberSizec + ", chamberSizek=" + chamberSizek + ", toxic="
				+ toxic + ", vermin=" + vermin + ", constructCode=" + constructCode + ", location=" + location
				+ ", locationPhoto=" + locationPhoto + ", internalPhoto=" + internalPhoto + ", locationSketch="
				+ locationSketch + ", planOfMh=" + planOfMh + ", depthOfFlow=" + depthOfFlow + ", depthOfSilt="
				+ depthOfSilt + ", heightSurch=" + heightSurch + ", mhDepth=" + mhDepth + ", zbx=" + zbx + ", zby="
				+ zby + ", utr=" + utr + ", utl=" + utl + ", utga=" + utga + ", uts=" + uts + ", jetting=" + jetting
				+ ", onSlope=" + onSlope + ", slopeNo=" + slopeNo + ", coverCondition=" + coverCondition
				+ ", coverPhoto=" + coverPhoto + ", ladderCondition=" + ladderCondition + ", ladderPhoto=" + ladderPhoto
				+ ", shaftCondition=" + shaftCondition + ", shaftPhoto=" + shaftPhoto + ", chamberCondition="
				+ chamberCondition + ", chamberPhoto=" + chamberPhoto + ", benchingCondition=" + benchingCondition
				+ ", benchingPhoto=" + benchingPhoto + ", othersCondition=" + othersCondition + ", othersPhoto="
				+ othersPhoto + ", cctvCond=" + cctvCond + ", crity=" + crity + ", recordPlanDifference="
				+ recordPlanDifference + ", idmsManholeId=" + idmsManholeId + ", dsdRef=" + dsdRef + ", remark="
				+ remark + ", insertDate=" + insertDate + ", insertMan=" + insertMan + "]";
	}

	
}
