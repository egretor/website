package cn.com.ufgov.hainan.manage.module;

// Generated 2013-4-20 9:49:36 by Hibernate Tools 3.4.0.CR1

import java.util.Calendar;

/**
 * ManageGroupModule generated by hbm2java
 */
public class ManageGroupModule implements java.io.Serializable {

	private static final long serialVersionUID = 1L;
	private String uuid;
	private ManageGroup manageGroup;
	private ManageModule manageModule;
	private String insertUserId;
	private Calendar insertTime;
	private String updateUserId;
	private Calendar updateTime;
	private String remark;

	public String getUuid() {
		return this.uuid;
	}

	public void setUuid(String uuid) {
		this.uuid = uuid;
	}

	public ManageGroup getManageGroup() {
		return this.manageGroup;
	}

	public void setManageGroup(ManageGroup manageGroup) {
		this.manageGroup = manageGroup;
	}

	public ManageModule getManageModule() {
		return this.manageModule;
	}

	public void setManageModule(ManageModule manageModule) {
		this.manageModule = manageModule;
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

}
