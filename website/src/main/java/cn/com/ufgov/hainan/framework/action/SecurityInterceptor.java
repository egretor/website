package cn.com.ufgov.hainan.framework.action;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts2.StrutsStatics;

import cn.com.ufgov.hainan.framework.service.PermissionService;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionInvocation;
import com.opensymphony.xwork2.interceptor.Interceptor;

/**
 * 安全拦截器类
 */
public class SecurityInterceptor implements Interceptor {
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	PermissionService permissionService;

	public PermissionService getPermissionService() {
		return this.permissionService;
	}

	public void setPermissionService(PermissionService permissionService) {
		this.permissionService = permissionService;
	}

	@Override
	public void init() {

	}

	@Override
	public void destroy() {

	}

	@Override
	public String intercept(ActionInvocation actionInvocation) throws Exception {
		String result = ModuleAction.LOGOUT;

		ActionContext actionContext = actionInvocation.getInvocationContext();

		boolean permission = false;
		Object currentAction = actionInvocation.getAction();
		if (currentAction instanceof EveryoneAction) {
			permission = true;
		} else {
			Map<String, Object> session = actionContext.getSession();
			Object sessionUserId = session.get(InitializeListener.SESSION_USER_ID);
			if (sessionUserId != null) {
				result = ModuleAction.DENY;

				permission = this.permissionService.permissionValidation(actionInvocation);
			}
		}

		HttpServletRequest httpServletRequest = (HttpServletRequest) actionContext.get(StrutsStatics.HTTP_REQUEST);
		httpServletRequest.setAttribute(InitializeListener.REQUEST_PERMISSION, permission);

		if (permission) {
			result = actionInvocation.invoke();
		}

		return result;
	}

}
