package cn.com.ufgov.hainan.framework.service;

import com.opensymphony.xwork2.ActionInvocation;

/**
 * 许可接口
 */
public interface PermissionService {
	/**
	 * 许可验证
	 * 
	 * @param actionInvocation
	 *            活动调用
	 * @return 结果
	 */
	boolean permissionValidation(ActionInvocation actionInvocation);
}
