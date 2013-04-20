package cn.com.ufgov.hainan.manage.service;

import cn.com.ufgov.hainan.framework.service.ModuleService;
import cn.com.ufgov.hainan.manage.module.ManageUser;

public interface ManageUserService extends ModuleService<ManageUser> {
	ManageUser authenticationValidation(String account, String password);

	boolean permissionValidation(String userId, String action, String execute);
}
