package cn.com.ufgov.hainan.manage.business;

import cn.com.ufgov.hainan.framework.business.ModuleBusiness;
import cn.com.ufgov.hainan.manage.module.ManageLink;
import cn.com.ufgov.hainan.manage.service.ManageLinkService;

public class ManageLinkBusiness extends ModuleBusiness<ManageLink> implements ManageLinkService {

	@Override
	public boolean hasSame(ManageLink value) {
		return false;
	}

	@Override
	public boolean hasReference(ManageLink value) {
		return false;
	}

	@Override
	public boolean deleteReference(ManageLink value) {
		return false;
	}

}
