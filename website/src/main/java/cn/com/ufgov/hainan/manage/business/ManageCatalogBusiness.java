package cn.com.ufgov.hainan.manage.business;

import java.util.ArrayList;
import java.util.List;

import cn.com.ufgov.hainan.framework.business.ModuleBusiness;
import cn.com.ufgov.hainan.framework.business.Paging;
import cn.com.ufgov.hainan.manage.module.ManageCatalog;
import cn.com.ufgov.hainan.manage.service.ManageCatalogService;

public class ManageCatalogBusiness extends ModuleBusiness<ManageCatalog> implements ManageCatalogService {

	@Override
	public boolean hasSame(ManageCatalog value) {
		boolean result = false;

		String name = value.getName();
		String hql = "from ManageCatalog t where upper(t.name) = upper(?)";
		List<ManageCatalog> manageCatalogs = this.select(hql, name);
		if ((manageCatalogs != null) && (manageCatalogs.size() > 0)) {
			ManageCatalog originalManageCatalog = manageCatalogs.get(0);
			if (value.getUuid() == null) {
				result = true;
			} else {
				if (!value.getUuid().equals(originalManageCatalog.getUuid())) {
					result = true;
				}
			}
		}

		return result;
	}

	@Override
	public boolean hasReference(String uuid) {
		return false;
	}

	@Override
	public boolean deleteReference(String uuid) {
		return true;
	}

	public List<ManageCatalog> selectByUserId(String userId) {
		List<ManageCatalog> results = null;

		return results;
	}

	@Override
	public List<ManageCatalog> queryDataGrid(Paging paging, ManageCatalog manageCatalog) {
		List<ManageCatalog> results = null;

		String hql = "";
		List<Object> parameters = new ArrayList<Object>();

		StringBuffer stringBuffer = new StringBuffer();
		stringBuffer.append("from ManageCatalog as t where t.uuid is not null ");
		if (manageCatalog != null) {
			if (manageCatalog.getName() != null) {
				if (!manageCatalog.getName().isEmpty()) {
					stringBuffer.append("and t.name = ? ");
					parameters.add(manageCatalog.getName());
				}
			}
		}
		stringBuffer.append("order by t.updateTime desc");
		hql = stringBuffer.toString();

		results = this.select(paging, hql, parameters.toArray());

		return results;
	}
}
