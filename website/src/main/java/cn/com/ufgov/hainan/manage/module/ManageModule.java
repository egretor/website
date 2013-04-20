package cn.com.ufgov.hainan.manage.module;

// Generated 2013-4-20 9:49:36 by Hibernate Tools 3.4.0.CR1

import java.util.Calendar;
import java.util.HashSet;
import java.util.Set;

/**
 * ManageModule generated by hbm2java
 */
public class ManageModule implements java.io.Serializable {

	private static final long serialVersionUID = 1L;
	private String uuid;
	private String insertUserId;
	private Calendar insertTime;
	private String updateUserId;
	private Calendar updateTime;
	private String remark;
	private String name;
	private long serial;
	private Set<ManageGroupModule> manageGroupModules = new HashSet<ManageGroupModule>(0);
	private Set<ManageModuleFunction> manageModuleFunctions = new HashSet<ManageModuleFunction>(0);

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

	public long getSerial() {
		return this.serial;
	}

	public void setSerial(long serial) {
		this.serial = serial;
	}

	public Set<ManageGroupModule> getManageGroupModules() {
		return this.manageGroupModules;
	}

	public void setManageGroupModules(Set<ManageGroupModule> manageGroupModules) {
		this.manageGroupModules = manageGroupModules;
	}

	public Set<ManageModuleFunction> getManageModuleFunctions() {
		return this.manageModuleFunctions;
	}

	public void setManageModuleFunctions(Set<ManageModuleFunction> manageModuleFunctions) {
		this.manageModuleFunctions = manageModuleFunctions;
	}

}