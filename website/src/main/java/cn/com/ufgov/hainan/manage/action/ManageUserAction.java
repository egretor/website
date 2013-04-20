package cn.com.ufgov.hainan.manage.action;

import java.util.ArrayList;
import java.util.List;

import org.apache.struts2.json.annotations.JSON;

import com.opensymphony.xwork2.ActionSupport;
import cn.com.ufgov.hainan.framework.action.ModuleAction;
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
	}

	public String execute() throws Exception {
		String result = ActionSupport.SUCCESS;

		return result;
	}

	public String executeQueryDataGrid() throws Exception {
		String result = ModuleAction.JSON;

		String hql = "";
		List<Object> parameters = new ArrayList<Object>();

		StringBuffer stringBuffer = new StringBuffer();
		stringBuffer.append("from ManageUser as t where 1=1 ");
		if (this.manageUser != null) {
			if (this.manageUser.getName() != null) {
				if (!this.manageUser.getName().isEmpty()) {
					stringBuffer.append("and t.name = ?");
					parameters.add(this.manageUser.getName());
				}
			}
		}
		hql = stringBuffer.toString();

		this.manageUsers = this.manageUserService.select(this.paging, hql, parameters.toArray());

		this.dojoDataGrid.setIdentifier("uuid");
		this.dojoDataGrid.setItems(this.manageUsers);

		return result;
	}
}
