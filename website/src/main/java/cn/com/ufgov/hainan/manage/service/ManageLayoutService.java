package cn.com.ufgov.hainan.manage.service;

import java.util.List;

import cn.com.ufgov.hainan.manage.module.ManageCatalog;
import cn.com.ufgov.hainan.manage.module.ManageMenu;

public interface ManageLayoutService {
	List<ManageCatalog> queryManageCatalogs(String userId);

	List<ManageMenu> queryManageMenus(String userId, String catalogId);
}
