package cn.com.ufgov.hainan.manage.action;

import java.util.ArrayList;
import java.util.List;

import org.apache.struts2.json.annotations.JSON;

import cn.com.ufgov.hainan.framework.action.ModuleAction;
import cn.com.ufgov.hainan.manage.module.ManageCatalog;
import cn.com.ufgov.hainan.manage.service.ManageCatalogService;

public class ManageCatalogAction extends ModuleAction {

	private ManageCatalogService manageCatalogService;
	private List<ManageCatalog> manageCatalogs;
	private ManageCatalog manageCatalog;

	@JSON(serialize = false, deserialize = false)
	public ManageCatalogService getManageCatalogService() {
		return manageCatalogService;
	}

	public void setManageCatalogService(ManageCatalogService manageCatalogService) {
		this.manageCatalogService = manageCatalogService;
	}

	public List<ManageCatalog> getManageCatalogs() {
		return manageCatalogs;
	}

	public void setManageCatalogs(List<ManageCatalog> manageCatalogs) {
		this.manageCatalogs = manageCatalogs;
	}

	public ManageCatalog getManageCatalog() {
		return manageCatalog;
	}

	public void setManageCatalog(ManageCatalog manageCatalog) {
		this.manageCatalog = manageCatalog;
	}

	@Override
	public void prepare() throws Exception {
	}

	public String execute() throws Exception {
		String result = ModuleAction.SUCCESS;

		return result;
	}

	public String executeQueryDataGrid() throws Exception {
		String result = ModuleAction.JSON;

		String hql = "";
		List<Object> parameters = new ArrayList<Object>();

		StringBuffer stringBuffer = new StringBuffer();
		stringBuffer.append("from ManageCatalog as t where true ");
		if (this.manageCatalog != null) {
			if (this.manageCatalog.getName() != null) {
				if (!this.manageCatalog.getName().isEmpty()) {
					stringBuffer.append("and t.name = ?");
					parameters.add(this.manageCatalog.getName());
				}
			}
		}
		hql = stringBuffer.toString();

		this.manageCatalogs = this.manageCatalogService.select(this.paging, hql, parameters);

		this.dojoDataGrid.setIdentifier("uuid");
		this.dojoDataGrid.setItems(this.manageCatalogs);

		return result;
	}
}
