package cn.com.ufgov.hainan.manage.business;

import java.util.List;

import cn.com.ufgov.hainan.framework.business.ModuleBusiness;
import cn.com.ufgov.hainan.framework.utility.Security;
import cn.com.ufgov.hainan.manage.module.ManageUser;
import cn.com.ufgov.hainan.manage.service.ManageUserService;

public class ManageUserBusiness extends ModuleBusiness<ManageUser> implements ManageUserService {

	@Override
	public boolean hasSame(ManageUser value) {
		return false;
	}

	@Override
	public boolean hasReference(ManageUser value) {
		return false;
	}

	@Override
	public boolean deleteReference(ManageUser value) {
		return false;
	}

	@Override
	public ManageUser authenticationValidation(String account, String password) {
		ManageUser result = null;

		password = Security.md5(password);

		String hql = "from ManageUser t where upper(t.account) = upper(?) and upper(t.password) = upper(?)";
		List<ManageUser> manageUsers = this.select(hql, account, password);
		if ((manageUsers != null) && (manageUsers.size() > 0)) {
			result = manageUsers.get(0);
		}

		return result;
	}

	@Override
	public boolean permissionValidation(String userId, String action, String execute) {
		System.out.println(action);
		return true;
	}

}
