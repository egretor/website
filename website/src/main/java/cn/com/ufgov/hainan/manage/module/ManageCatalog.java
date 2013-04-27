package cn.com.ufgov.hainan.manage.module;

// Generated 2013-4-26 9:38:33 by Hibernate Tools 3.4.0.CR1

import java.util.Calendar;
import java.util.HashSet;
import java.util.Set;

/**
 * ManageCatalog generated by hbm2java
 */
public class ManageCatalog implements java.io.Serializable {

	private static final long serialVersionUID = 1L;
	private String uuid;
	private String insertUserId;
	private Calendar insertTime;
	private String updateUserId;
	private Calendar updateTime;
	private String remark;
	private String name;
	private Long serial;
	private Set<ManageMenu> manageMenus = new HashSet<ManageMenu>(0);

	public String getUuid() {
		return this.uuid;
	}

	public void setUuid(String uuid) {
		this.uuid = uuid;
	}

	public String getInsertUserId() {
		return this.insertUserId;
	}

	public void setInsertUserId(String insertUserId) {
		this.insertUserId = insertUserId;
	}

	public Calendar getInsertTime() {
		return this.insertTime;
	}

	public void setInsertTime(Calendar insertTime) {
		this.insertTime = insertTime;
	}

	public String getUpdateUserId() {
		return this.updateUserId;
	}

	public void setUpdateUserId(String updateUserId) {
		this.updateUserId = updateUserId;
	}

	public Calendar getUpdateTime() {
		return this.updateTime;
	}

	public void setUpdateTime(Calendar updateTime) {
		this.updateTime = updateTime;
	}

	public String getRemark() {
		return this.remark;
	}

	public void setRemark(String remark) {
		this.remark = remark;
	}

	public String getName() {
		return this.name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public Long getSerial() {
		return this.serial;
	}

	public void setSerial(Long serial) {
		this.serial = serial;
	}

	public Set<ManageMenu> getManageMenus() {
		return this.manageMenus;
	}

	public void setManageMenus(Set<ManageMenu> manageMenus) {
		this.manageMenus = manageMenus;
	}

}
