package cn.own.mhics.entity;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

import org.hibernate.validator.constraints.NotEmpty;

@Entity
@Table(name="sys_menu")
/**
 * 
 * @author Mr.wang
 *
 */
public class SystemMenu {
	
	@Id
	@Column(name="menu_id")
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	private Long menuId;
	
	@Column(name="is_show")
	private Boolean isShow=false;//菜单是否显示
	
	@Column(name="name")
	@NotEmpty(message="菜单名字不能为空")
	private String name;
	
	@Column(name="parent_id")
	private Long parentId=0L;//父菜单id
	
	@Column(name="menu_icon")
	private String menuIcon;//菜单图标
	
	@Column(name="menu_url")
	private String menuUrl;//菜单链接地址
	
	@Column(name="sort_id")
	private Integer sortId=888;//菜单排序id
	
	public SystemMenu(){}
	
	public SystemMenu(Long menuId,Long parentId,String menuName,
			String menuIcon,String menuUrl,Boolean isShow,Integer sortId) {
		super();
		if(parentId != null) {
			this.parentId = parentId;
		}
		if(sortId != null){
			this.sortId =  sortId;
		}
		this.menuId = menuId;
		this.name = menuName;
		this.menuIcon = menuIcon;
		this.menuUrl = menuUrl;
		this.isShow = isShow;
	}

	public Long getMenuId() {
		return menuId;
	}

	public void setMenuId(Long menuId) {
		this.menuId = menuId;
	}

	public Boolean getIsShow() {
		return isShow;
	}

	public void setIsShow(Boolean isShow) {
		this.isShow = isShow;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public Long getParentId() {
		return parentId;
	}

	public void setParentId(Long parentId) {
		this.parentId = parentId;
	}

	public String getMenuIcon() {
		return menuIcon;
	}

	public void setMenuIcon(String menuIcon) {
		this.menuIcon = menuIcon;
	}

	public String getMenuUrl() {
		return menuUrl;
	}

	public void setMenuUrl(String menuUrl) {
		this.menuUrl = menuUrl;
	}

	public Integer getSortId() {
		return sortId;
	}

	public void setSortId(Integer sortId) {
		this.sortId = sortId;
	}

	@Override
	public String toString() {
		return "systemMenu [menuId=" + menuId + ", isShow=" + isShow + ", name=" + name + ", parentId=" + parentId
				+ ", menuIcon=" + menuIcon + ", menuUrl=" + menuUrl + ", sortId=" + sortId + "]";
	}
	
	
}
