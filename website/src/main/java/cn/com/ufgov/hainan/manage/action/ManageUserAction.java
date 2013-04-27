package cn.com.ufgov.hainan.manage.action;

import java.util.Calendar;
import java.util.List;
import org.apache.struts2.json.annotations.JSON;

import com.opensymphony.xwork2.ActionSupport;

import cn.com.ufgov.hainan.framework.action.InitializeListener;
import cn.com.ufgov.hainan.framework.action.ModuleAction;
import cn.com.ufgov.hainan.framework.business.ResultType;
import cn.com.ufgov.hainan.framework.utility.Security;
import cn.com.ufgov.hainan.manage.module.ManageUser;
import cn.com.ufgov.hainan.manage.service.ManageUserService;

public class ManageUserAction extends ModuleAction {
	private ManageUserService manageUserService;
	private List<ManageUser> manageUsers;
	private ManageUser manageUser;

	@JSON(serialize = false, deserialize = false)
	public ManageUserService getManageUserService() {
		return manageUserService;
	}

	public void setManageUserService(ManageUserService manageUserService) {
		this.manageUserService = manageUserService;
	}

	public List<ManageUser> getManageUsers() {
		return manageUsers;
	}

	public void setManageUsers(List<ManageUser> manageUsers) {
		this.manageUsers = manageUsers;
	}

	public ManageUser getManageUser() {
		return manageUser;
	}

	public void setManageUser(ManageUser manageUser) {
		this.manageUser = manageUser;
	}

	@Override
	public void prepare() throws Exception {
		if (this.strutsParameters.get("manageUser.prerogative") != null) {
			System.out.println("#####" + this.strutsParameters.get("manageUser.prerogative")[0]);
		}
		this.removeNullBooleanParameter("manageUser.prerogative");
	}

	public String execute() throws Exception {
		String result = ActionSupport.SUCCESS;

		return result;
	}

	public String executeQueryDataGrid() throws Exception {
		String result = ModuleAction.JSON;

		this.manageUsers = this.manageUserService.queryDataGrid(this.paging, this.manageUser);

		this.dojoDataGrid.setIdentifier("uuid");
		this.dojoDataGrid.setItems(this.manageUsers);

		return result;
	}
	

	public String executeInput() throws Exception {
		String result = ModuleAction.INPUT;
		return result;
	}

	public String executeSave() throws Exception {
		String result = ModuleAction.JSON;

		if (this.manageUser != null) {
			if (this.manageUser.getUuid() != null) {
				if (this.manageUser.getUuid().isEmpty()) {
					this.manageUser.setUuid(null);
				}
			}

			String md5Password = Security.md5(this.manageUser.getPassword());

			String userId = (String) this.strutsSession.get(InitializeListener.SESSION_USER_ID);
			Calendar now = Calendar.getInstance();
			if (this.manageUser.getUuid() == null) {
				this.manageUser.setInsertUserId(userId);
				this.manageUser.setInsertTime(now);

				this.manageUser.setPassword(md5Password);
			} else {
				ManageUser originalManageUser = this.manageUserService.select(this.manageUser.getUuid());
				if (originalManageUser != null) {
					this.manageUser.setInsertUserId(originalManageUser.getInsertUserId());
					this.manageUser.setInsertTime(originalManageUser.getUpdateTime());

					if (this.manageUser.getPassword() != null) {
						if (!this.manageUser.getPassword().equals(originalManageUser.getPassword())) {
							this.manageUser.setPassword(md5Password);
						}
					}
				}
			}
			this.manageUser.setUpdateUserId(userId);
			this.manageUser.setUpdateTime(now);

			if (this.manageUser.getPrerogative() == null) {
				this.manageUser.setPrerogative(false);
			}

			ResultType resultType = this.manageUserService.storage(this.manageUser);

			this.processMessage(resultType);
		}

		return result;
	}

	public String executeDelete() throws Exception {
		String result = ModuleAction.JSON;

		if (this.manageUser != null) {
			ResultType resultType = this.manageUserService.delete(this.manageUser.getUuid());

			this.processMessage(resultType);
		}

		return result;
	}
}
