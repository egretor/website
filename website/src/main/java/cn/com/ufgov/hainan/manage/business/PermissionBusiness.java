package cn.com.ufgov.hainan.manage.business;

import com.opensymphony.xwork2.ActionInvocation;

import cn.com.ufgov.hainan.framework.service.PermissionService;

public class PermissionBusiness implements PermissionService {

	@Override
	public boolean permissionValidation(ActionInvocation actionInvocation) {
		return true;
	}

}
