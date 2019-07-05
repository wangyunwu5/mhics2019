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
@Table(name="diaocha_pipe")
public class DiaoChaPipe {
	
	@Id
	@Column(name="dc_pipe_id")
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	private Long dcpipeId;
	
	@Column(name="pipe_no")
	private String pipeNo;
	
	@ManyToOne
	@JoinColumn(name="dc_node_id")
	private DiaoChaNode diaoChaNode;
	
	@Column(name="pipe_type")
	private String pipeType;
	
	@Column(name="pipe_shape")
	private String pipeShape;
	
	@Column(name="pipe_sizec")
	private double pipeSizec;
	
	@Column(name="pipe_sizek")
	private double pipeSizek;
	
	@Column(name="backdrop")
	private float backDrop;
	
	@Column(name="pipe_material")
	private String pipeMaterial;
	
	@Column(name="lining")
	private String lining;
	
	@Column(name="pipe_depth")
	private double pipeDepth;
	
	@Column(name="invert")
	private double invert;
	
	@Column(name="photo")
	private String photo;
	
	@Column(name="wallno")
	private String wallNo;
	
	@Column(name="location")
	private String location;
	
	@Column(name="insert_date")
	private Date insertDate;

	public Long getDcpipeId() {
		return dcpipeId;
	}

	public void setDcpipeId(Long dcpipeId) {
		this.dcpipeId = dcpipeId;
	}

	public String getPipeNo() {
		return pipeNo;
	}

	public void setPipeNo(String pipeNo) {
		this.pipeNo = pipeNo;
	}

	public DiaoChaNode getDiaoChaNode() {
		return diaoChaNode;
	}

	public void setDiaoChaNode(DiaoChaNode diaoChaNode) {
		this.diaoChaNode = diaoChaNode;
	}

	public String getPipeType() {
		return pipeType;
	}

	public void setPipeType(String pipeType) {
		this.pipeType = pipeType;
	}

	public String getPipeShape() {
		return pipeShape;
	}

	public void setPipeShape(String pipeShape) {
		this.pipeShape = pipeShape;
	}

	public double getPipeSizec() {
		return pipeSizec;
	}

	public void setPipeSizec(double pipeSizec) {
		this.pipeSizec = pipeSizec;
	}

	public double getPipeSizek() {
		return pipeSizek;
	}

	public void setPipeSizek(double pipeSizek) {
		this.pipeSizek = pipeSizek;
	}

	public float getBackDrop() {
		return backDrop;
	}

	public void setBackDrop(float backDrop) {
		this.backDrop = backDrop;
	}

	public String getPipeMaterial() {
		return pipeMaterial;
	}

	public void setPipeMaterial(String pipeMaterial) {
		this.pipeMaterial = pipeMaterial;
	}

	public String getLining() {
		return lining;
	}

	public void setLining(String lining) {
		this.lining = lining;
	}

	public double getPipeDepth() {
		return pipeDepth;
	}

	public void setPipeDepth(double pipeDepth) {
		this.pipeDepth = pipeDepth;
	}

	public double getInvert() {
		return invert;
	}

	public void setInvert(double invert) {
		this.invert = invert;
	}

	public String getPhoto() {
		return photo;
	}

	public void setPhoto(String photo) {
		this.photo = photo;
	}

	public String getWallNo() {
		return wallNo;
	}

	public void setWallNo(String wallNo) {
		this.wallNo = wallNo;
	}

	public String getLocation() {
		return location;
	}

	public void setLocation(String location) {
		this.location = location;
	}

	public Date getInsertDate() {
		return insertDate;
	}

	public void setInsertDate(Date insertDate) {
		this.insertDate = insertDate;
	}

	@Override
	public String toString() {
		return "DiaoChaPipe [dcpipeId=" + dcpipeId + ", pipeNo=" + pipeNo + ", diaoChaNode=" + diaoChaNode
				+ ", pipeType=" + pipeType + ", pipeShape=" + pipeShape + ", pipeSizec=" + pipeSizec + ", pipeSizek="
				+ pipeSizek + ", backDrop=" + backDrop + ", pipeMaterial=" + pipeMaterial + ", lining=" + lining
				+ ", pipeDepth=" + pipeDepth + ", invert=" + invert + ", photo=" + photo + ", wallNo=" + wallNo
				+ ", location=" + location + ", insertDate=" + insertDate + "]";
	}

	
}
