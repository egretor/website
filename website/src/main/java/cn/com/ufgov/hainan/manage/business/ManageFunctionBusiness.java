package cn.com.ufgov.hainan.manage.business;

import cn.com.ufgov.hainan.framework.business.ModuleBusiness;
import cn.com.ufgov.hainan.manage.module.ManageFunction;
import cn.com.ufgov.hainan.manage.service.ManageFunctionService;

public class ManageFunctionBusiness extends ModuleBusiness<ManageFunction> implements ManageFunctionService {

	@Override
	public boolean hasSame(ManageFunction value) {
		return false;
	}

	@Override
	public boolean hasReference(ManageFunction value) {
		return false;
	}

	@Override
	public boolean deleteReference(ManageFunction value) {
		return false;
	}

}
