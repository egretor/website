package cn.com.ufgov.hainan.manage.business;

import java.util.List;

import cn.com.ufgov.hainan.framework.business.ModuleBusiness;
import cn.com.ufgov.hainan.manage.module.ManageCatalog;
import cn.com.ufgov.hainan.manage.service.ManageCatalogService;

public class ManageCatalogBusiness extends ModuleBusiness<ManageCatalog> implements ManageCatalogService {

	@Override
	public boolean hasSame(ManageCatalog value) {
		return false;
	}

	@Override
	public boolean hasReference(ManageCatalog value) {
		return false;
	}

	@Override
	public boolean deleteReference(ManageCatalog value) {
		return false;
	}

	public List<ManageCatalog> selectByUserId(String userId) {
		List<ManageCatalog> results = null;

		return results;
	}
}
