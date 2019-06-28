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
@Table(name="pipe")
public class Pipe {

	@Id
	@Column(name="pipe_id")
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	private Long pipeId;
	
	@Column(name="pipe_no")
	private String pipeNo;
	
	@ManyToOne
	@JoinColumn(name="node_id")
	private Node node;
	
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
	
	@Column(name="pipe_photo")
	private String pipePhoto;
	
	@Column(name="wallno")
	private String wallNo;
	
	@Column(name="pipe_location")
	private String pipeLocation;
	
	@Column(name="insert_date")
	private Date insertDate;

	public Long getPipeId() {
		return pipeId;
	}

	public void setPipeId(Long pipeId) {
		this.pipeId = pipeId;
	}

	public String getPipeNo() {
		return pipeNo;
	}

	public void setPipeNo(String pipeNo) {
		this.pipeNo = pipeNo;
	}

	public Node getNode() {
		return node;
	}

	public void setNode(Node node) {
		this.node = node;
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

	public String getPipePhoto() {
		return pipePhoto;
	}

	public void setPipePhoto(String pipePhoto) {
		this.pipePhoto = pipePhoto;
	}

	public String getWallNo() {
		return wallNo;
	}

	public void setWallNo(String wallNo) {
		this.wallNo = wallNo;
	}

	public String getPipeLocation() {
		return pipeLocation;
	}

	public void setPipeLocation(String pipeLocation) {
		this.pipeLocation = pipeLocation;
	}

	public Date getInsertDate() {
		return insertDate;
	}

	public void setInsertDate(Date insertDate) {
		this.insertDate = insertDate;
	}

	@Override
	public String toString() {
		return "Pipe [pipeId=" + pipeId + ", pipeNo=" + pipeNo + ", node=" + node + ", pipeType=" + pipeType
				+ ", pipeShape=" + pipeShape + ", pipeSizec=" + pipeSizec + ", pipeSizek=" + pipeSizek + ", backDrop="
				+ backDrop + ", pipeMaterial=" + pipeMaterial + ", lining=" + lining + ", pipeDepth=" + pipeDepth
				+ ", invert=" + invert + ", pipePhoto=" + pipePhoto + ", wallNo=" + wallNo + ", pipeLocation="
				+ pipeLocation + ", insertDate=" + insertDate + "]";
	}
}
