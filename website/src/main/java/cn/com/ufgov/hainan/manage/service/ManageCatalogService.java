package cn.com.ufgov.hainan.manage.service;

import java.util.List;

import cn.com.ufgov.hainan.framework.service.ModuleService;
import cn.com.ufgov.hainan.manage.module.ManageCatalog;

public interface ManageCatalogService extends ModuleService<ManageCatalog> {
	List<ManageCatalog> selectByUserId(String userId);
}
