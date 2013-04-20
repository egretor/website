package cn.com.ufgov.hainan.manage.business;

import cn.com.ufgov.hainan.framework.business.ModuleBusiness;
import cn.com.ufgov.hainan.manage.module.ManageModule;
import cn.com.ufgov.hainan.manage.service.ManageModuleService;

public class ManageModuleBusiness extends ModuleBusiness<ManageModule> implements ManageModuleService {

	@Override
	public boolean hasSame(ManageModule value) {
		return false;
	}

	@Override
	public boolean hasReference(ManageModule value) {
		return false;
	}

	@Override
	public boolean deleteReference(ManageModule value) {
		return false;
	}

}
